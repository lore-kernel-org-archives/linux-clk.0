Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B434E198E75;
	Wed, 18 Dec 2024 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734513146; cv=none; b=tCcpfxWecMQOSkpinlqX7UB1xAbkFgk9stc88jlOcpjojuJR9oz1RJhVc2sJ61YPKGJhobaw2ZxPVXAbuPFdokMMUkRFBe7jg14FxGrW4DcjJgm0/NGbdT275azkHCdLdMevolDTtlFWNDRJuwCIcY1KybZNEvlSlSxJCx2zDfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734513146; c=relaxed/simple;
	bh=kkV9s2YRibPuWsB1Wl2YLEAAa9DweLcmgt17nNJgzkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3tCm3KXZxehtOUt2gtVeQgBXW9OTsd35b9gohEv0cK4SxM2ROgt07zs3rYCGbo8uS9r91Qs/mAD374dDKV6aDhYvKQIALAMDAx9JIZxMMD83axgOV8/ca3ySx3xZzelVgJgW02VNVZ3EsAAbLcdSSM8YEoqon6isKpp5buCw2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIllkGCd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIllkGCd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43618283d48so44856225e9.1;
        Wed, 18 Dec 2024 01:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734513143; x=1735117943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGnb+hOCU3ryzw/ZW/4qyQ2l7CeyOqwGV+4NeC4zFJw=;
        b=BIllkGCd613a9B2gNMVV3pqQj+CsybMrtxu3h0MJB50rCwk3EjmfJLoCht7ipo1D2R
         pTgMT1B7vJ4uNn1ut5Hzqw232uJbWt79hOHBsX+owMHNDLqd0YzHithahlNpLmxUi9DR
         JddZLufTyzkZ3HE6AnBiyci5knqaR+HMf6U+xXFBKFg6RIMX5W131UL1G5qYTPJf3GKD
         aq1vcm5O+9mEWHZ6vEFx7Ii0AvdKG63YCOCpqcyqbjgaplYoKnWGF6FUjnhoLlVipRoK
         uW3ADWdyDGyd3h8LO2E94glM77NEq2cIgEWfEViVTGb9u0FIiRLVtIOlOqlcI0JNuO6V
         xL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734513143; x=1735117943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGnb+hOCU3ryzw/ZW/4qyQ2l7CeyOqwGV+4NeC4zFJw=;
        b=inw73azzzTXoVJZWsYXwZ7Q6fGKXE5XeI7w3lfP2YyXVuenpAFjdtb5fJ0ER40yuJf
         yZ62QgI3asKHmAqMFhYTAHi4pUqGzIdOh7Iz753dnbg9kQkHyNSbVfuGGlDf+tXqTMis
         xTARpT4snZIkHv6ORrWXVpACdnqSdo6YNV9/xcfo2/uAg47z9jFd6HHJ0MCee18lAQNH
         yqzzqcG0mjCH/1U6LtaHL6sBGcyJ2+yhqC0h/X6zCzYEmMRPmhAp4sU0B/zWUQV9MMY6
         nMfLpJYBOISU5PDw/gg6gWA3lmgduMLUyd+nDiCoPUfb8QK0D4y+geFbOwWccDQoPQ5j
         tyeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPBVojMxGgw2I3S6Se9Tcjb3q3Ffb5r0PXIZM8ZudV6JfCBlCAvejEuh5twfI6uBKrSYWZvKQfC5UW@vger.kernel.org, AJvYcCVqHQPZaG+Yx0dbVAsAxYVCbk6XQph8oI/Anoa2wPNNIamFLred9YlVd1ZdQh3SYYRRR6/AWjYD94uObrod@vger.kernel.org, AJvYcCX0p2n1b/DV/mhwpqmR/5jmZXeiF9t3+h1JpW/2xYlKQCCYEA4hNZMJgphu4XENuqE/DdHdGoIOyOBc@vger.kernel.org
X-Gm-Message-State: AOJu0YzWRoqa4isZoxTnYfEfYInQF2VYxWL3xsNC4/4CgKKW8PRkOhHq
	YV7BsPKkMbBtrJ20hVMkXm8ZtPa/KpWMZpeC1YdX0v+GREUYc1gtNjqe3Q==
X-Gm-Gg: ASbGncttrHpujsw1HpLiSxoHgiOO/PG6TfqIpRdSIs3fVPxD5FgqsEhxQ/n/1V3luZz
	3SMFMd0QlDPEBVnNRE6HDDY7DwEivfHV7ME/1R9MozPyoWxk8XluYLTRXdDXEgF1uZROTvhztUa
	FWK8ffEb3QXP7pNCNvA+brDrprABLsZ0v7mkdzuE5rWQ9j0P5ouqD/ybXLLf8H2UmMCdt48lQlA
	EHGExV85z6QWLME87aIoTyxTHOsCW/P+J/+DrYnzj5CwWtDGMuNvykQbEfqLQ+6233rFbSC1fU7
	rk9fHZLiGbvfYWGzHdWaUt4gRaDoKKVA/oDoNfNaC6U=
X-Google-Smtp-Source: AGHT+IHsSc9KkUB/XUx8f/kcWOcCXrw5mtfFEZm7IeHnq51b0jswuTU83+U8zLn5TpIrKKRkl48HUw==
X-Received: by 2002:a05:6000:1faa:b0:385:f17b:de54 with SMTP id ffacd0b85a97d-388e4d2f458mr1864712f8f.5.1734513142673;
        Wed, 18 Dec 2024 01:12:22 -0800 (PST)
Received: from localhost.localdomain (host-80-181-61-65.pool80181.interbusiness.it. [80.181.61.65])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c8012034sm13325339f8f.22.2024.12.18.01.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:12:22 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 3/3] clk: en7523: Add clock for eMMC for EN7581
Date: Wed, 18 Dec 2024 10:11:35 +0100
Message-ID: <20241218091153.30088-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218091153.30088-1-ansuelsmth@gmail.com>
References: <20241218091153.30088-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock for eMMC for EN7581. This is used to give info of the current
eMMC source clock and to switch it from 200MHz or 150MHz.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Rename emmc_base to emmc7581_base to make it more clear

 drivers/clk/clk-en7523.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index d77d3d459b40..5bfba57a00f5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -91,6 +91,7 @@ static const u32 emi7581_base[] = { 540000000, 480000000, 400000000, 300000000 }
 static const u32 bus7581_base[] = { 600000000, 540000000 };
 static const u32 npu7581_base[] = { 800000000, 750000000, 720000000, 600000000 };
 static const u32 crypto_base[] = { 540000000, 480000000 };
+static const u32 emmc7581_base[] = { 200000000, 150000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -281,6 +282,15 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.base_shift = 0,
 		.base_values = crypto_base,
 		.n_base_values = ARRAY_SIZE(crypto_base),
+	}, {
+		.id = EN7581_CLK_EMMC,
+		.name = "emmc",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 12,
+		.base_values = emmc7581_base,
+		.n_base_values = ARRAY_SIZE(emmc7581_base),
 	}
 };
 
-- 
2.45.2

