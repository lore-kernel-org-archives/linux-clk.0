Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D98A1E9B26
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 06:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388181; cv=none; b=gpEpbi7Khbr0itckUUOfafwKKFfuNgaAkhXT7uVvT0zvuwGHm4jvVfVOdla5vG25F5kdF7LTxyPnzt1k2S7e8rn446pkD80Os2+kh8Fyh85Ghw+KEcfVpXS6jVym9Xv8/+16fdafqqwi1bAKFgwNszrnFAIKB1Y562+3YZk1jvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388181; c=relaxed/simple;
	bh=+1wDCnUf6V6waC2u4F0CjceMoJUJQ3m5duPgNX1wMjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ieNaNmRIIbOk+dgmTYiyOxkYiEXnKmb7AFWHh8kT2CgYhXr4OZjW49VgeYJ/nhrlzemfPl35HF3fhk/YH5fpFdyHCsLdTSizjrUv/hQpy9ILAUPxGLwUi9HURzxIqwV5ap5kz3cYfGf10Dm2Ll7Q0Gm0q6/y+jBiIXCZ9iwUgX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GBWtZFq8; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GBWtZFq8"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso8192737a12.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Apr 2025 23:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388177; x=1745992977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=GBWtZFq8Vj30qot4AKkrRRoS/jx9ek5VzvnvHF1KRuxPjkNyqoQx4Ntdgp4YQ3ZZ3a
         PLBFscxJLEk5cBE7ZK7RN4VBo2Nqcgkd4qWh3+K3oCOWNzagq0EA6+d2mL5r+bb2Uht7
         41gcSZaaLW9r4y6J/GA8+abeXuU3Q1HjTesq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388177; x=1745992977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=FQNsoOYnx6X7uXkyB1tFxcczkLEIqNVHJgOR5DM6SnfRMZPgbvILjK6yQZTm2Acdp6
         ZxD3Xl6hsO8mJVoD4tB3omQKhGiy7OWhkLJmW3S3Bor5DHwyxPOllcetTIQenQGy7soW
         Hy7DkQURLXg1W5sw+FqCVSzAbh+lmayaiVqEEKaBXWZ85zm/xeXlZp5geVcEMDDZ0STu
         LMo4UixpX9Tk/eyXnQoEkbeVzvUeviILgMgIhwuLcvv92xh1tHecUtrIDX+52JO8liG1
         k4BVWFp7l1qREE4gJnLTlWgKj/S291x1Fqe5w6OZBTmMwGrICkXGUV8skjttHC4jeu7X
         aipQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+iBMPZNI/flrZ3mdRgfHGYEOIgH9HUEekTo2uEEtwPdUNd2SSca4GMo+AVMNI816AHkSTb0f9NS8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9MFuKOlExL2JlRPOB5EoEq0KcEMwu66H05z320K39JfClXm3Q
	7W5KzXwAk80B1dMQs9l22V3RSSDwI5BDPY2IXYz53nCmsETJtWzezuEyA5r9FrY=
X-Gm-Gg: ASbGncvccj8UIb1oyEsD5anj0JuBh0a0S+pZPUspU7uAAjN6T7XV0rDhOdhmQS7n12k
	wm/km92JoYqJcOnsog1QGofbf/hAIU/asUvvtyMRO51saY8ghjPJBTLRUc6C0bu0dVNQ1YE7aqe
	p8H4YHo/nKzGbwhckxl0n11KvnloY69BaclpM5E3pDgKArNgCbDjZ4Phytie/B6hYudqkOM094T
	Xx8DSi40webZJoQ/LdoAhVm6EknCE672QfOZitUnUDrhlIvhdi02wJyg9fZdZc6XuTl6DxAqw/m
	XlDdqUg2VVQrQ18uxMMD+0/kf2m2UygRUfnZjYNsYKixA+oVPCSFXvSreM8w2Wligp9Zdrj28/8
	xZ0IhKBgz4akG6g4=
X-Google-Smtp-Source: AGHT+IHHI/Ae0cN5rkqgDoL4MALbmLyqGqjR8G5Zysx6M9ySgMiQIXVA9Mcxb72+usZBPZS4gYqX6g==
X-Received: by 2002:a17:906:ef05:b0:aca:db46:8170 with SMTP id a640c23a62f3a-acb74e79d11mr1536173466b.60.1745388177443;
        Tue, 22 Apr 2025 23:02:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:02:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
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
Subject: [PATCH v11 01/18] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Wed, 23 Apr 2025 08:02:18 +0200
Message-ID: <20250423060241.95521-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
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

