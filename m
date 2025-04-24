Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344961E3762
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 06:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475724; cv=none; b=HpGZ5eSeA/p9twKfIcxjvOBdY0NFf2wN2LO0PTSbkJGR1E1O2VUcrHhQENaQ1TcjJtBPRxi/1jyl51e4D69DopHfQ3e13nBuaWcYI4Yf9shqZmbHqRdxDEBTHrtljziHDCtaakIVRiY5efdJmYkckvBD++ev6wcVIKkg9LRIFUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475724; c=relaxed/simple;
	bh=+1wDCnUf6V6waC2u4F0CjceMoJUJQ3m5duPgNX1wMjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+cxW33LnXIRWbX3onmmXwfv4ch2C6U2C4FOFiXN+NYyHZ0I/8y7ODcixI663TERyF6UdFVp+bLZlSKjkb6HDLY6/H8TN9JJsr9Ks99apfxnCreAyetPXUcmTuc6IT4BbGvwISf0AeGwWVE9CHln7G8v2zWCovvfbWNhsrxfezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kc1Ik57t; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kc1Ik57t"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf680d351so10608525e9.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 23:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475720; x=1746080520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=kc1Ik57tXUuabpv2UqrZwYPKt7saiONA03ufohvvZop7y9CVcANJv6xw/7HW8l+bJJ
         9tFaJtxRIWg57fOGFoZM/7SNXgS/MRs+dyYjzTDMSs/WvFeL6rJuyCgtuxfdOwoXidpQ
         ZCYHxE3JZWQSW40vUGTdGbzsVYgtVF4ysh51A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475720; x=1746080520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=YKbW+9KdPm6Cpjo7b2t/SuoelMq2hL75zfs/Cjm9O3YaE4bYLP9hTInqWcYX6vvPp4
         mBfxiZ6ijhCYDN556cSAabgueXm9VLsQcFYCf3c/dV1GdIFh7uHvOrl/BBCCVujf99mh
         c7ks2CbqKZ3FLXgFqW9kaB1vEOWvNyV1+qAaoAySYlbrznSGlb4FFS3WHGqNt0NMy1Nz
         ZKi94I5QLa9XhuISVT2jh+RBRWS2f8t/a1y11UwPm9j06tAb7QOe4f3hvrTZeKhhKgkt
         +cq2rybnKlPBXOJDpG9TUSl1hfx76vyy2ZfijODPQ1C1FY36MKut29kpncEof1dBL9O2
         FbsA==
X-Forwarded-Encrypted: i=1; AJvYcCWsST58D3yPesTo50yzDt6yeICIa/aBk3xm3D4jzvygeTgy0/lkJkpcS0BeQYY7tXKMhkKjFkw+C3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YysfDdVlY2zLHFdFHl9fQdmVCfQcMyX5m5I4DHjSCyJpAEAT8Et
	RdIVR0GtTSO43Q2IcjCPyfsUhOWc3tEzfRUzH9nbwgZVs+r7YBvM0NGZUIGMFQI=
X-Gm-Gg: ASbGncsi7AYS+jST4AZvgjFi3nI4RlCtKJfaL9gPY2ykmsnuYAsGqRQIHUIgEpRjuiH
	tk38XAlO5FgZu2U0VmEdBQwy6MDzJZHB3KWpjqlHenzLQ5hpaYFJcADnWC+VSUZ2SFciTfi0/tw
	1943seMbuRWhCwHpsjTpxMscu5/MclWM73qrLRuU0djzNd5Lh5DXWsFmed6puxBEihAGwHbvRLU
	uLAIUZxNO8AauQvSqFUMolykUJfT078Dn6BaWQIUnlbmFOjGCrJrNKojKaJkv8JcIVZQk62GCC3
	xiqTC6yGZsu6uor6Dq68Y/yNpIqISBUWzSzrymdDS2Zx+4KIT9TD9rIBG+CzQ6BV+O7uBfc7z/e
	FCZzy
X-Google-Smtp-Source: AGHT+IHymxJmFKpLmwrZam+TMOOI/0cy/ciCsXy9MSaKz4V/Z0qmORSIolFTEtnoiInGOXnttK5eTQ==
X-Received: by 2002:a05:600c:c092:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-4409c399b9amr7368115e9.0.1745475720552;
        Wed, 23 Apr 2025 23:22:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Thu, 24 Apr 2025 08:21:31 +0200
Message-ID: <20250424062154.2999219-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MM_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MM_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v6)

Changes in v6:
- Add 'Acked-by' tag of Krzysztof Kozlowski

Changes in v5:
- New

 include/dt-bindings/clock/imx8mm-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index 1f768b2eeb1a..102d8a6cdb55 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MM_CLK_EXT4				7
 #define IMX8MM_AUDIO_PLL1_REF_SEL		8
 #define IMX8MM_AUDIO_PLL2_REF_SEL		9
-#define IMX8MM_VIDEO_PLL1_REF_SEL		10
+#define IMX8MM_VIDEO_PLL_REF_SEL		10
+#define IMX8MM_VIDEO_PLL1_REF_SEL		IMX8MM_VIDEO_PLL_REF_SEL
 #define IMX8MM_DRAM_PLL_REF_SEL			11
 #define IMX8MM_GPU_PLL_REF_SEL			12
 #define IMX8MM_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MM_SYS_PLL3_REF_SEL			17
 #define IMX8MM_AUDIO_PLL1			18
 #define IMX8MM_AUDIO_PLL2			19
-#define IMX8MM_VIDEO_PLL1			20
+#define IMX8MM_VIDEO_PLL			20
+#define IMX8MM_VIDEO_PLL1			IMX8MM_VIDEO_PLL
 #define IMX8MM_DRAM_PLL				21
 #define IMX8MM_GPU_PLL				22
 #define IMX8MM_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MM_SYS_PLL3				27
 #define IMX8MM_AUDIO_PLL1_BYPASS		28
 #define IMX8MM_AUDIO_PLL2_BYPASS		29
-#define IMX8MM_VIDEO_PLL1_BYPASS		30
+#define IMX8MM_VIDEO_PLL_BYPASS			30
+#define IMX8MM_VIDEO_PLL1_BYPASS		IMX8MM_VIDEO_PLL_BYPASS
 #define IMX8MM_DRAM_PLL_BYPASS			31
 #define IMX8MM_GPU_PLL_BYPASS			32
 #define IMX8MM_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MM_SYS_PLL3_BYPASS			37
 #define IMX8MM_AUDIO_PLL1_OUT			38
 #define IMX8MM_AUDIO_PLL2_OUT			39
-#define IMX8MM_VIDEO_PLL1_OUT			40
+#define IMX8MM_VIDEO_PLL_OUT			40
+#define IMX8MM_VIDEO_PLL1_OUT			IMX8MM_VIDEO_PLL_OUT
 #define IMX8MM_DRAM_PLL_OUT			41
 #define IMX8MM_GPU_PLL_OUT			42
 #define IMX8MM_VPU_PLL_OUT			43
-- 
2.43.0

