+++
date = '2025-04-10T13:32:28+08:00'
draft = false
title = '(RAG技術指南-1)技術指南：從基礎到應用'
summary = "> 這是一系列將從基礎知識到核心技術，全面介紹檢索增強生成（RAG）的部落格文章，旨在幫助對大型語言模型應用有興趣的讀者建立系統性理解。"
featuredImagePreview = "https://imgur.com/RafkQ8I.png"
featuredImage = "https://imgur.com/RafkQ8I.png"
tags = ["LLM", "RAG技術指南"]
categories = ["LLM", "RAG技術指南"]
math = true
+++

# RAG 技術指南：從基礎到應用

## 前言

身為一位對 AI 應用有熱情的技術愛好者，我想與大家分享一些關於大型語言模型 (LLM) 應用中最常見的技術——檢索增強生成 (RAG)。雖然 AI 領域不斷湧現新趨勢（如推理能力、Agent、Test Time Computing 等），但 RAG 技術因其實用性和相對容易實現的特點，依然是許多 AI 應用的核心。

這篇部落格將作為我的 RAG 系列文章的引導，希望能幫助對 LLM 應用有興趣的讀者建立起系統性的理解。

## 學習路線圖

我計劃按照以下路線圖逐步發布相關文章，帶領大家從基礎知識到核心技術，全面掌握 RAG：

```
RAG Roadmap

├── 階段 1：基礎知識
│   ├── * RAG 概念與原理
│   │   ├── 什麼是 RAG？
│   │   ├── RAG 的優勢與應用場景：減少幻覺、提高準確性、知識更新
│   │   └── RAG 的基本流程
│   ├── * 自然語言處理 (NLP) 基礎
│   │   ├── 詞嵌入 (Word Embeddings)
│   │   ├── Transformer 模型
│   │   └── 大型語言模型 (LLM)
│   └── * 向量數據庫基礎
│       ├── 向量表示：將文本轉換為向量
│       ├── 向量索引：常見的索引類型 (HNSW, ...)
│       └── 向量相似度計算：Cosine Similarity, Euclidean Distance
│
└── 階段 2：核心技術
    ├── * 兩大檢索
    │   ├── Dense Retriever
    │   └── Sparse Retriever(TF-IDF, BM25)
    ├── * 文檔加載與預處理
    │   ├── 加載不同來源的文檔：PDF, TXT, CSV, Web Pages, Databases
    │   └── 文檔清洗：去除噪聲、HTML 標籤等
    ├── * 文檔分割 (Chunking)
    │   └── 固定大小分割：Embedding size
    ├── * 向量化 (Embedding)
    │   ├── 使用預訓練模型
    │   └── FineTune Embedding 模型
    ├── * 向量數據庫
    │   ├── FAISS
    │   └── Milvus DB, PGVector, ...
    ├── * RAG 優化
    │   ├── Re-ranking
    │   ├── Query Expansion
    │   └── Fine-tuning LLM
    └── * 生成策略
        ├── Prompt Engineering
        └── 生成參數調整：Temperature, Top-p, ...
```

## 關於這個系列

每個標記星號（*）的主題都將會有一篇獨立的深入解析文章。我計劃每週更新一到兩篇，帶領大家循序漸進地掌握 RAG 技術。

如果您對某個特定主題特別感興趣，或者有任何問題與建議，歡迎在文章下方留言，或通過我的聯絡方式與我交流。我也很樂意根據讀者的反饋調整後續文章的內容和順序。

讓我們一起探索 RAG 的奧妙，為 AI 應用開發注入新的可能性！
