Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B232192B69
	for <linux-clk@vger.kernel.org>; Sun, 22 Dec 2024 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887146; cv=none; b=u/bXPxrHPBBVeqsL4piCttfLpsVBgSynm+Pvu2cRCCXUpq6Vvj06nU8cpNFO8x1JHpqHCfPQqiB5E32wDZ5Ua0iyMF76P9bk0Fuys01hFsHl5ZmT+6LfR0A59fCpN7YyeMH3zW4eraXJ3Zxe9CO0bgtJA+MAHJ5W3HycTc4dXXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887146; c=relaxed/simple;
	bh=n6yoYjnKbi5rVHTB8jhSWowc2EOzEGWibaplsMGisVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNxORa642BdQQzAwJU0H649myhjFfds9zBNiH8HWj3nLEDLcAj67xY5MZC9UxcETo47DBHs0X/rZIyb5YqUFNwz30yFDj4EUg0me8Xuz89iJ1tIMO9IDqStL2kIVC2z4NFtg/fXXzOdHsavb95gsS38qEPEFfhe+t2Dm5f0Hv1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ifZe09F7; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ifZe09F7"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa67f31a858so615663566b.2
        for <linux-clk@vger.kernel.org>; Sun, 22 Dec 2024 09:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887143; x=1735491943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyU4lCuYuLHxLX+AwXcVxyfMEtnFlBSdsy5ZVGUKyRI=;
        b=ifZe09F7S7yRUW6m1NFkjAfzjZT08lnP6H8IpCefRSQ997f0Am9XaOOFrGH3CP1ZTp
         WMB8CGiy06Yzh9+kmaqSwUpRGIG3suLrAvtIwX5fc5MSWBgEHpg1MF9u/0tXgc7J44as
         sLwdkncu6v/ruePyqMjRxqE9cbVX8sUx/z0rM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887143; x=1735491943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyU4lCuYuLHxLX+AwXcVxyfMEtnFlBSdsy5ZVGUKyRI=;
        b=QclqebcNEHXZR04i3/BAGu7FCN63BbiJKfFHlx7ekQAXKZ4SpFKI6XOv24ILq70w11
         Pf+xbjSFVZWWPehwXtDtEvkI50JmNg6Bn61KgVWoayRW+9N0i5sEON8C5VxyA2nHqiEc
         UJwXi8xilP2tYuCdOMJfxYcuOwMS66pNmHabc48N2quueegD6p90rVHdRcc753L6osdR
         VeofU5M8o1UcV5TlQ+jK+asIx+juaODgmHremeusFjzTTWajAhKqbo3KZBCSmNzif69F
         2OZ9/nmcHQ33T+2goGydPJIYoxJ0SjWe6GCvpT7u+M5/Xvf3gordrG2tAv94dBVJUKgq
         Ra8g==
X-Forwarded-Encrypted: i=1; AJvYcCXxSI0SsFf9YJ4p/w8+a4fcfhh0Exugb/63yqnbNIkEaOh6OWGqafbSVKlxK6OsZJRLY5FrYEDaL6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMXmr69K3hbec3apCi2lrn3ENpAQ02s71/ITpYf8WiuOHCabrJ
	sf0XfyrcjKlTlTEVudk+yHzWi87IRyqdOVRc6T91Y91nxwlEp6dNOb9yWaoL+2E=
X-Gm-Gg: ASbGncv90QzhCw4aZqj2BOIeWG0jO1/nVWjjEMO5BnJOfvw30FmW+tCpSvjj68TJXa4
	ucT5kwag/usdVoK0gtuFIRms2DhjkmLdQk/V8RVHrbC4YZpnYS+ynIMmV0dakBvRGteZ2U13bjG
	q4e9qqloVxXvbZu4md/gdtre5K93vGvv96eAaw5OxBvt5RPoHrNGb4LxPY3Lb8HARCQOuaBe4at
	2yBId/o7oJWJA6vEnjhAlwKAZc67Z3zTCvUNC7/OQeEUH72RiHbaxtGke9G8XKREAbBSmpJ6yNt
	YzbMBAgu9d2L/jRuLdROeVgW6PgSgGRuA8TD+E148doNIg==
X-Google-Smtp-Source: AGHT+IGEXEEbDuDzwKi4k+vJkd3SyYQ1mRIpjQ1XjrU9M/ldV4p5zj2O9ZKURS7MYfi9C41Ss0G/Ng==
X-Received: by 2002:a17:907:3688:b0:aa6:aa89:6d5e with SMTP id a640c23a62f3a-aac2ad7f926mr1174889966b.18.1734887143441;
        Sun, 22 Dec 2024 09:05:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v6 03/18] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Sun, 22 Dec 2024 18:04:18 +0100
Message-ID: <20241222170534.3621453-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MP_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MP_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v6:
- Add 'Acked-by' tag of Krzysztof Kozlowski

Changes in v5:
- New

 include/dt-bindings/clock/imx8mp-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 7da4243984b2..3235d7de3b62 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MP_CLK_EXT4				7
 #define IMX8MP_AUDIO_PLL1_REF_SEL		8
 #define IMX8MP_AUDIO_PLL2_REF_SEL		9
-#define IMX8MP_VIDEO_PLL1_REF_SEL		10
+#define IMX8MP_VIDEO_PLL_REF_SEL		10
+#define IMX8MP_VIDEO_PLL1_REF_SEL		IMX8MP_VIDEO_PLL_REF_SEL
 #define IMX8MP_DRAM_PLL_REF_SEL			11
 #define IMX8MP_GPU_PLL_REF_SEL			12
 #define IMX8MP_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MP_SYS_PLL3_REF_SEL			17
 #define IMX8MP_AUDIO_PLL1			18
 #define IMX8MP_AUDIO_PLL2			19
-#define IMX8MP_VIDEO_PLL1			20
+#define IMX8MP_VIDEO_PLL			20
+#define IMX8MP_VIDEO_PLL1			IMX8MP_VIDEO_PLL
 #define IMX8MP_DRAM_PLL				21
 #define IMX8MP_GPU_PLL				22
 #define IMX8MP_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MP_SYS_PLL3				27
 #define IMX8MP_AUDIO_PLL1_BYPASS		28
 #define IMX8MP_AUDIO_PLL2_BYPASS		29
-#define IMX8MP_VIDEO_PLL1_BYPASS		30
+#define IMX8MP_VIDEO_PLL_BYPASS			30
+#define IMX8MP_VIDEO_PLL1_BYPASS		IMX8MP_VIDEO_PLL_BYPASS
 #define IMX8MP_DRAM_PLL_BYPASS			31
 #define IMX8MP_GPU_PLL_BYPASS			32
 #define IMX8MP_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MP_SYS_PLL3_BYPASS			37
 #define IMX8MP_AUDIO_PLL1_OUT			38
 #define IMX8MP_AUDIO_PLL2_OUT			39
-#define IMX8MP_VIDEO_PLL1_OUT			40
+#define IMX8MP_VIDEO_PLL_OUT			40
+#define IMX8MP_VIDEO_PLL1_OUT			IMX8MP_VIDEO_PLL_OUT
 #define IMX8MP_DRAM_PLL_OUT			41
 #define IMX8MP_GPU_PLL_OUT			42
 #define IMX8MP_VPU_PLL_OUT			43
-- 
2.43.0

