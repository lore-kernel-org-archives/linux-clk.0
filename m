Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D50D193060
	for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 19:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719430998; cv=none; b=Yl0G8eshW0bnXtZ0RkFwi6glDfQ8W7zwtHElZK/Q/ZvC0VpeMCFYdVdxCBYEgy3Lev6ZrDgyono93VEhQgSvfQNtAGtJM0T61uspg83wva32MXCpxxbBpaBrVJN7qg7+bQ/ftbmbkQldPbSDnB5dWc6qTiSt93VQtEGh5emGiHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719430998; c=relaxed/simple;
	bh=APPE5dKRkNonvKUqWSiryKOGNpOJlvFzK+dcKt1+dBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mbp9ZBwiqOVEUgjPRO6wK53+IjA7mBKhoDbts9k2+TG8w9y7FMbx5AZY3QDxEBEYiQgsuH5As9qZSF9oVUlMHg+gCSVUOrqjvWSgKvX2XXaoGrppll8JPfHNGtIpUgxAHs4DfR8j8aLVggPZi9FV8Htln9TOqB/Q5BPryqXXxtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tM7Ucryg; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tM7Ucryg"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52cd628f21cso6488549e87.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 12:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719430995; x=1720035795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZg0Dan8dZ1cJlzdkxx9g6a64AyosFvjL+3niLEIVTM=;
        b=tM7UcrygseR6YravsEJUDH6ROi9tj8d/3rgQKffuTpXjVYjiwDxNlGLGNWH4jkbxhT
         p9EfsQQ35gyfBPEGanIrQsfWa8dPpTdAzlRwz6T35Vr8LHutFNZb5Q6CiKcLO7lMeT2I
         G9SujYGsc84gRZkpdqDq0upsGcPgPAeWqOLf0h+PA87yM2tyYaqCKqm8RdcR6KXGgqSg
         /nhjPdjrhx0e/c+fdwaHZ7NgXzmHtOqCchsG1vfNTD6umpK+yOPWlZEyTHoKCVJTIRyS
         zNOBsv3iDJAFkqFxIB4GSof86/ueTxKYEXmNEc0h94TqkK1WK4HU6X8i7M+44pLzslW0
         l2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719430995; x=1720035795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZg0Dan8dZ1cJlzdkxx9g6a64AyosFvjL+3niLEIVTM=;
        b=SVR1SyszBzc9y/H58TjdjKsQsbF+7lwTlJK9Vy8kjOK4uYIRHoChPjos1Qwo4M7Tai
         /+4/NmRwoYCHLbAV/CjZMVzfLc9M8QY3n4lUTUdpy8o+D4adwSdtJSKKm7Fmieb+VB/D
         UouHc1c68PztdBhpe/FLInYwQXDA4IWMzGgQJGCf+dXyyQw/0tmPQvYwXi4CBuOMt3Kf
         NAw6TruBHqe0KVaGAK68mnKA20B6Zw2wbk5KN1+CdnUrYp4rj1OOotnGKJ5xqjDxF7Ov
         LLCKoRKp1dmbJWY9VP0/hB9UHm0sR1A9f0Xa8u+n2BjYflgStHz8MR6QmNUfHSG1Hkx6
         ugeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX41biRM+XzUkmhXf1XpDLF9VLAsQITV+0O4ufZQokGK9Ze0PvJgEUlmPidnv6rJcFKLwfJvQb6k3POxohQz3CC6xN1WQoA3MT4
X-Gm-Message-State: AOJu0YwXT+ZBuk7pChrdQ6v1fonAuAd2ymkhzk9eyW4+m7oc5wXoWS1T
	s7C72iCOdhvW3xX9MB1j1jYbdn5afp/mDWqgNsQcjRBkMXRXY8a8eh4jkjjdeqc=
X-Google-Smtp-Source: AGHT+IF5TBKDZODftqTmo/Y2LCMw2rq2sjADo9zE73i9eab9HhHgjvgOrzapHeP3tI3ZKFHbYrq1dw==
X-Received: by 2002:a05:6512:3f0b:b0:52d:215a:5071 with SMTP id 2adb3069b0e04-52d215a5162mr2982937e87.62.1719430993614;
        Wed, 26 Jun 2024 12:43:13 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:24d9:a20a:2de5:8eda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c837eb2bsm36728905e9.39.2024.06.26.12.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 12:43:12 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 3/3] clk: samsung: gs101: mark gout_hsi2_ufs_embd_i_clk_unipro as critical
Date: Wed, 26 Jun 2024 20:43:00 +0100
Message-ID: <20240626194300.302327-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
In-Reply-To: <20240626194300.302327-1-peter.griffin@linaro.org>
References: <20240626194300.302327-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The system hangs on poweroff when this UFS clock is turned off, meaning
the system never powers down. For the moment mark the clock as critical.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index ba9570f7a5fa..85098c61c15e 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -2846,7 +2846,7 @@ static const struct samsung_gate_clock hsi2_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_HSI2_UFS_EMBD_I_CLK_UNIPRO,
 	     "gout_hsi2_ufs_embd_i_clk_unipro", "mout_hsi2_ufs_embd_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO,
-	     21, 0, 0),
+	     21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_HSI2_UFS_EMBD_I_FMP_CLK,
 	     "gout_hsi2_ufs_embd_i_fmp_clk", "mout_hsi2_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI2_UID_UFS_EMBD_IPCLKPORT_I_FMP_CLK,
-- 
2.45.2.741.gdbec12cfda-goog

