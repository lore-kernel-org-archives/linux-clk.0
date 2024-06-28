Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E0212F588
	for <linux-clk@vger.kernel.org>; Fri, 28 Jun 2024 22:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719614118; cv=none; b=QwUNzQ9XXDKjwCV2XFQfnREPMtAlmvfW1lsreAND1Ma+f3E5qKmwrRsqWYBQhcEmUWIMWYMWn/cmTv6bNRTqzBkaFG6zr9iPevvWSELYAcUNlOUwnLEAHC7D2d/lKbvfdUdUQRHlaklIbnuMEOEdHZnIN2NDwSLpkSxyFwikYuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719614118; c=relaxed/simple;
	bh=TP4zX82sz2PZVjrl2jE5lJBopK2VfJohRegfp+vWgXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TqhKr9eoM/4gcyXjavdTBEeiJNEoF9Q6a47wz0HD7nqL3SzoeqXhi58fyBeCCR7jYGxWx4pBXRq/u03iivCXeKUBGZKFjGNKc2lbtyNg5F8wACQhEfieZypXslhwlyUZUj/noykVdpl9J19nwM09WpAOsm2t8bA+e16Oad5FffE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wKsBpnhb; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wKsBpnhb"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-36532d177a0so689221f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 28 Jun 2024 15:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719614114; x=1720218914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWg6K4lF7Ia2UQmGAEMoRHt0caBd3GiOuDYrWDdJIgc=;
        b=wKsBpnhbQvyO9dAHCC7p1t4ACzVlQCMOnVu5/VRVomy2/p0xRt4qexaejwh29KghC1
         3ffBT5CpUyZArSEOtzpHY2hTEHkKUNJUlWoZT3xE4Jqoq/iKkVtFmAZbxBImPrXeXh5N
         R2zWXYwMvFuGSZ7lSjmWmoF4jvMj24M9a8CRSPoZReoU+RzhSbN0uKje/sbgb8uq7/8D
         JJLTt9extG3WwbyMMNxRrT+iD3GjjXZy3iICrb1/tpHtm5cZ93YsDxtQLjCfAVOu5KFz
         3UCwuMOu2QGU56Q6Zefh8hgZqSIhhOGTNSPYVxJX1Y9EJo1aBLQmprVRawJQ0FpDexSU
         cDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719614114; x=1720218914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWg6K4lF7Ia2UQmGAEMoRHt0caBd3GiOuDYrWDdJIgc=;
        b=c0NpTSuuajWX3sjna4tXPPvvsHKJJFbolhCQUxh2kuNk62kXaTU9NRgevZY96WRJyT
         WViMlHnHMkuE5z7Za2NbdCrbRM9+oANeOWQ11nGxCeExonEQcnPEl+YltsT3odw6YVPC
         P9/BeIfsXNKZdYnt6UAjurn9YdYdhUzmfw0jFyGnDf04WBHw1m847i+9xIlI+WpPYvM5
         UVKxxcguogEMCdmmnzr4NtmYV5ZmaWG0OpYnmm/cOUaMzH4FwvZlNMqeBfZxtUCn2vl0
         MzDP9GkFPznYKq84Nf/nP7C0h9F/VdNd33apfA9PTgXoOo3CBmbCqgWs8Rx713JXoVTm
         V4RQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6oyeuCLMbMjcXgMiXUsMCjeSAdo3tH3Si5nXJb1PhrwPrdk3pJfp9QN6ddf5WtVTGaiq4YTpoXuidUg9375AN/Pty0/EfYim4
X-Gm-Message-State: AOJu0Yy4IfR6+xQkw9DQaNAzaFI7igkiYM+ZG4d/TybtPbrNWfCVuffB
	s68h9DJ93nMkcwsmn203vnCkoxL8GnL1luvNnEdMjfgwKqxpDQecovXMVG7VhqM=
X-Google-Smtp-Source: AGHT+IGQaEcZtkAMiKM9GSQOooFZeBRh3tTeuC+Xc/kCGO4xJ60dXrICAPaXg5XqxZbcHv05RyTqvw==
X-Received: by 2002:a5d:4e8c:0:b0:360:8dba:af69 with SMTP id ffacd0b85a97d-366e4f0ce68mr11178993f8f.61.1719614113724;
        Fri, 28 Jun 2024 15:35:13 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510::3aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a043a16sm3496711f8f.0.2024.06.28.15.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 15:35:13 -0700 (PDT)
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
Subject: [PATCH v2 2/3] soc: samsung: exynos-pmu: add support for PMU_ALIVE non atomic registers
Date: Fri, 28 Jun 2024 23:35:05 +0100
Message-ID: <20240628223506.1237523-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628223506.1237523-1-peter.griffin@linaro.org>
References: <20240628223506.1237523-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not all registers in PMU_ALIVE block support atomic set/clear operations.
GS101_SYSIP_DAT0 and GS101_SYSTEM_CONFIGURATION registers are two regs
where attempting atomic access fails.

As documentation on exactly which registers support atomic operations is
not forthcoming. We default to atomic access, unless the register is
explicitly added to the tensor_is_atomic() function. Update the comment
to reflect this as well.

Reviewed-by: Will McVicker <willmcvicker@google.com>
Tested-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2
 - Move PMUALIVE_MASK check into tensor_is_atomic() (William)
---
 drivers/soc/samsung/exynos-pmu.c            | 22 ++++++++++++++++++---
 include/linux/soc/samsung/exynos-regs-pmu.h |  4 ++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 624324f4001c..d8c53cec7f37 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -129,14 +129,30 @@ static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 val,
 	return ret;
 }
 
-static int tensor_sec_update_bits(void *ctx, unsigned int reg,
-				  unsigned int mask, unsigned int val)
+static bool tensor_is_atomic(unsigned int reg)
 {
 	/*
 	 * Use atomic operations for PMU_ALIVE registers (offset 0~0x3FFF)
-	 * as the target registers can be accessed by multiple masters.
+	 * as the target registers can be accessed by multiple masters. SFRs
+	 * that don't support atomic are added to the switch statement below.
 	 */
 	if (reg > PMUALIVE_MASK)
+		return false;
+
+	switch (reg) {
+	case GS101_SYSIP_DAT0:
+	case GS101_SYSTEM_CONFIGURATION:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static int tensor_sec_update_bits(void *ctx, unsigned int reg,
+				  unsigned int mask, unsigned int val)
+{
+
+	if (!tensor_is_atomic(reg))
 		return tensor_sec_reg_rmw(ctx, reg, mask, val);
 
 	return tensor_set_bits_atomic(ctx, reg, val, mask);
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index aa840ed043e1..f411c176536d 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -657,4 +657,8 @@
 #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
 #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
 
+/* For Tensor GS101 */
+#define GS101_SYSIP_DAT0					(0x810)
+#define GS101_SYSTEM_CONFIGURATION				(0x3A00)
+
 #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */
-- 
2.45.2.803.g4e1b14247a-goog

