+++
date = '2025-04-10T16:02:50+08:00'
draft = false
title = '(RAG技術指南-3)自然語言處理的關鍵技術：從詞嵌入到 Transformer'
summary = "> 文章深入介紹自然語言處理核心技術，從基本詞嵌入到革命性的Transformer模型，展示如何讓電腦理解人類語言的語義關係。"
featuredImagePreview = "https://imgur.com/RafkQ8I.png"
featuredImage = "https://imgur.com/RafkQ8I.png"
tags = ["LLM", "RAG技術指南"]
categories = ["LLM", "RAG技術指南"]
math = true
+++

# 自然語言處理的關鍵技術：從詞嵌入到 Transformer

## 詞嵌入：讓電腦理解人類語言的第一步

電腦只懂得處理二進制訊號（0和1），本質上無法直接理解人類的語言與文字。那麼，我們如何讓機器理解文字的含義呢？答案是透過**數值表示法**。

![文字轉換為數字示意圖](https://imgur.com/WzBYrof.png)

如上圖所示，我們通過編碼器（Encoder）將文字轉換成一系列數字，這些數字就是電腦能夠處理的信息。

### 數字背後的意義

這些數字究竟代表什麼？它們最重要的功能是**計算相似度**，讓電腦能夠通過數學函式理解文字中隱含的意義。

![相似度示意圖](https://imgur.com/QqMGdV7.png)

以上圖為例，從人類角度來看，「我愛喝拿鐵」和「美式咖啡超讚」這兩句話雖然不完全相同，但確實存在一定的相似度：
- 「我愛喝」隱含著讚美的意思
- 「拿鐵」和「美式咖啡」都是相近的飲品類別

理想情況下，當我們將這兩句話通過編碼器轉換成數字向量（稱為「詞嵌入」或「Embedding」）後，這兩組數字應該彼此接近。

### 相似度的計算方法

那麼，如何計算這種相似度呢？

首先，我們可以使用直線距離公式：

$$ 距離 = sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2} $$

距離越小，表示兩個詞嵌入越相似，意味著語義越接近。但這種方法存在一個問題：距離是無界的，難以判斷「300」這樣的距離值究竟意味著相近還是相遠。

因此，我們採用一種範圍在 `-1~1` 之間的度量方式：**餘弦相似度**（Cosine Similarity）：

$$ Cosine \ Similarity = \frac{x_1 \cdot x_2 + y_1 \cdot y_2}{\sqrt{x_1^2 + y_1^2} \cdot \sqrt{x_2^2 + y_2^2}} $$

這個公式的結果範圍是：
- 1：兩個向量完全相同（方向一致）
- 0：兩個向量正交（不相關）
- -1：兩個向量方向相反

![詞向量示意圖](https://imgur.com/9c3ISa6.png)

從上圖可以看出，「balls」和「kick」這兩個詞的餘弦夾角很小，表示它們在語義空間中非常接近。同理，我們期望「我愛喝拿鐵」和「美式咖啡超讚」的詞嵌入也應該被映射到相近的位置。

### 高維詞向量的世界

實際應用中，兩個維度遠遠不足以表達語言的複雜性。現代詞嵌入模型（如BERT）通常使用數百維的向量（如512維）來表示文字。

![高維詞向量示意圖](https://imgur.com/QXiEnth.png)

詞嵌入模型的訓練目標，就是學習如何將輸入的文字準確映射到這個高維空間的適當位置，使得語義相似的詞或句子在空間中彼此接近。

## Transformer 模型：突破詞嵌入的限制

### 為什麼需要 Transformer？

傳統詞嵌入方法存在一個關鍵問題：無法處理一詞多義的情況。考慮以下兩個例子：
- 「我愛吃蘋果」
- 「iPhone16好好用，我好愛蘋果」

在傳統詞嵌入模型中，這兩個句子中的「蘋果」會被賦予相同的向量表示，因為模型無法識別上下文。結果，無論「蘋果」指的是水果還是科技公司，它們都被映射到同一個位置。

![一詞多義問題示意圖](https://imgur.com/0g046Ot.png)

如上圖所示，「蘋果手機」中的「蘋果」本應與「手機」更接近，但在傳統模型中卻與食物的「蘋果」更相似。

解決方案？—— **Attention is all you need!**

### Attention 機制的魔力

Transformer 模型的核心是注意力（Attention）機制，它能夠根據上下文動態調整詞的表示。

![Attention機制示意圖](https://imgur.com/egEQSgs.png)

通過 Attention 機制，「蘋果手機」中的「蘋果」現在與「手機」更接近，而與食物的「蘋果」更遠。這正是我們期望的結果！

在實際應用中，每種語言都有許多複雜的語義現象，這就是為什麼我們選擇基於 Attention 機制的 Transformer 架構作為編碼器的基礎。在後續討論中，我們將把這類編碼器統稱為「密集檢索器」（Dense Retriever）。

## 實際應用：簡單的相似度計算示例

以下是一個簡單的程式碼示例，展示如何計算句子之間的相似度：

```python
# 計算相似度.py
sentenceA = "我愛蘋果手機"
sentenceB = "我愛吃蘋果"
sentenceC = "我覺得 iphone 很好用"

embeddingA = Encoder.encode(sentenceA)
embeddingB = Encoder.encode(sentenceB)
embeddingC = Encoder.encode(sentenceC)

# 使用餘弦相似度計算
ab_similarity = cosine_similarity(embeddingA, embeddingB)
ac_similarity = cosine_similarity(embeddingA, embeddingC)

if ab_similarity > ac_similarity:
    print(f"{sentenceA} 跟 {sentenceB} 比較像")
else:
    print(f"{sentenceA} 跟 {sentenceC} 比較像")
```
根據所選的編碼器不同（如 Word2Vec 或 BERT），結果也會有所不同。使用考慮上下文的 Transformer 模型（如 BERT）時，我們可以期待得到更符合人類直覺的相似度計算結果。
