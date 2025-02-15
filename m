Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21041369B6
	for <linux-clk@vger.kernel.org>; Sat, 15 Feb 2025 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739626978; cv=none; b=oIc/zENFs9YSh0GYDhYhdr30dI5vo8DfXVfH719T1CWe3nuctWU/QXiHjUPuR/UISRkblOxOFQLeAeSfOYkpDVME86Wy5XCLUcjTWkCqVeGDhuMsIfWZh2ty3/uETo/mEhlhooFAJ+RRn9qY4IYOcyMlLym8dfT56dmwijJs1l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739626978; c=relaxed/simple;
	bh=8u9nr5FRgOHoWSar9IPoRBpRxyWBfCzeKcQuS3h5YJs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jnViLMFb0KDatj/xONmKSb2ss4MDau4WwN2DnMpQjJn7oLAJywsgmiZ1S+dW1EBYrOu4bOPN8OSg7t0e4/aTx5htqss2VIR69EDpJxPXpd63VBinR2bO7Wu0m2Z53jVC77asRj5M3D85bVqhqLsqxt/SWN8wZgwZVOe+qqaonmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yqEEbsgy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yqEEbsgy"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4395f645200so2407115e9.2
        for <linux-clk@vger.kernel.org>; Sat, 15 Feb 2025 05:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739626973; x=1740231773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9bUNgNxjXLAmLIe9VuTDeyH0e/ktEVFp6QB6bUy4rI=;
        b=yqEEbsgypFkVVrazq9FXVjbu26sme3nDfzG7mcuXa0NhZfMcUqYKDvPg/B/tX79y48
         m6wA6EOMQgm5c0LsMBj+nKtgV2M/WOwm8j7NB8ZkRIWYQYoMUVwp/K0uOE44PLqA+bvY
         nGkx1pYFFnljRwHNNFBVH4H0amMTIvClk69VWsFpT4V1K1neqjhK7CBwFOP0VCBO0U9N
         QZOU0h4t5JNnQHBeTPf+QrXOwFGWFVOoJEVj7imsbidfp7+gMCW1tYLTfnL9hX0/fs4+
         bDq86aB4boTwfPQfNLdTeMEtyQU9JeDvA5B0OxQCFfJ4hIWfHZlr6WTR1vBGhld1sxfa
         1Cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739626973; x=1740231773;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9bUNgNxjXLAmLIe9VuTDeyH0e/ktEVFp6QB6bUy4rI=;
        b=Wb6539lLh2IiRZKIE0TvTp4AySTVNDXEVF5EH0mrBAedo3j9necDWqiDUC588SACC2
         oei/g2PSmlEusSCTXWp2E05oZZTOi8HsqfaVm0wKW1M9RoQ+RuVF8tG1aRAYOaH7i35i
         DP2EutgYD5vFO6UJq4auSRGwPEBiURPopasibAjdjOTGAKBtv8ZFN6TYVUPsMFhkpiFh
         MnDLm1TX2c2jaJA0t6cuBIGz4jsMvuRkduszMGvoFprnHt+pEE7J4Axap3DC6HXFQ7h+
         AVu4psTHBCl2IUg1NEimTp+9fJBVvQvO1Bd6N9JfiytLI6iXQZ37vkZ6lYxabsK70qee
         IwYA==
X-Forwarded-Encrypted: i=1; AJvYcCV6m8JPQDPZgYPDvpuGCPce/7GIz2+6hKKgTI3mq0SzIpApJIFeJ9kXhZk45P7EYjHtFKi5BpB4JBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbpafErsiBTtzdeZvHa4CC9IxPb01KwTGQFrr6TvOslNAqQr2b
	DLcCg2wC1JE7pD6BQmzSyET3TFbT9lDZALIEyUgAsk6nCuHlKovc4pKemi5Qi5I=
X-Gm-Gg: ASbGncubChf8RVudFSvWXC7qkQ61sut2fBn9lh29Dn0aTbKu2ls2Rt1HMbIQOgddUtj
	qdTxMnt6R3eCbuxweuh0MYa7Ub92UBiikruY0GWW1j+J+nuknhkpGcS1sz6/2lBvT9vak5iCfuW
	Er8nOf9/ksLrPWqpju6XjOd/LiNld59Znxlsr+UjHRz4npT09RZcI7JsuP4VCy4FfMAxl0tJtXg
	lwK/EypjdZTXxxSfWHK8A3xScota54y6kA4hHGUZwtV8CDPg/1VwFGxeGDdRCsFdfTKI2Zf8+Ku
	KBXTa2dKEitOPDmdCnwZQ1fa9ookRYY=
X-Google-Smtp-Source: AGHT+IHMxDo2wTuV3RGHOn8oJ+HNcqupAs51y/sqm5Bh1EezBPlgRPt7QMuWXQaOwvAdxUJsc4b5fA==
X-Received: by 2002:a05:600c:4711:b0:439:614a:8bee with SMTP id 5b1f17b1804b1-4396e730a4emr14755285e9.5.1739626973256;
        Sat, 15 Feb 2025 05:42:53 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396181026fsm69929005e9.18.2025.02.15.05.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:42:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Stephen Kitt <steve@sk2.org>, 
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, 
 Will McVicker <willmcvicker@google.com>
Cc: kernel-team@android.com, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250212183253.509771-1-willmcvicker@google.com>
References: <20250212183253.509771-1-willmcvicker@google.com>
Subject: Re: [PATCH] clk: samsung: Fix UBSAN panic in samsung_clk_init()
Message-Id: <173962697098.235665.12602558292611832915.b4-ty@linaro.org>
Date: Sat, 15 Feb 2025 14:42:50 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 12 Feb 2025 10:32:52 -0800, Will McVicker wrote:
> With UBSAN_ARRAY_BOUNDS=y, I'm hitting the below panic due to
> dereferencing `ctx->clk_data.hws` before setting
> `ctx->clk_data.num = nr_clks`. Move that up to fix the crash.
> 
>   UBSAN: array index out of bounds: 00000000f2005512 [#1] PREEMPT SMP
>   <snip>
>   Call trace:
>    samsung_clk_init+0x110/0x124 (P)
>    samsung_clk_init+0x48/0x124 (L)
>    samsung_cmu_register_one+0x3c/0xa0
>    exynos_arm64_register_cmu+0x54/0x64
>    __gs101_cmu_top_of_clk_init_declare+0x28/0x60
>    ...
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: Fix UBSAN panic in samsung_clk_init()
      https://git.kernel.org/krzk/linux/c/d19d7345a7bcdb083b65568a11b11adffe0687af

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

