Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9793120B7FD
	for <linux-clk@vger.kernel.org>; Thu,  6 Mar 2025 11:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260640; cv=none; b=Vu2DWNzI163zmujaPBfu+cw3roRw+oILzVKedgmC2O++6AMTNx1h42+b78t8fvhZ+S23X282YAUq7IGgGacLoNcZVIWyYFYD2akmk8pabG6li3+vJ/j9AQF24Fzcn4uAjGks2qpB+MGFZSf3uujjzsJCr+OkmdrBk5SAo2mJlE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260640; c=relaxed/simple;
	bh=xUBRrkr1aLPPwLeMGNd5Xto6SUkG0PhtvIzCxxAX118=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rhb9UuHMszYETq5OBuD6630lyPoiVWI7Bld3+dsgh2/araOm+SB6BOH9b+893e4LB2tR++xXbT1Em9tceARZKD3hVXGEUU6yAOuYRsH7JykVboIdFMCOJNoyYfcOC1w7/zwMuJGtmSVSJH97VmM4DVzbaFeAigZm42LLeOPGqfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=DCBBFAcb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DCBBFAcb"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43bc63876f1so4666415e9.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Mar 2025 03:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260637; x=1741865437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=DCBBFAcbox3jKss6W/cABwjtS00TIs6MpXGm7Sm51Mic8Er8xxGVORva3/Xk/zVdr6
         1UU+Zw8gnOhvB16nVcue2EwQMD/fimYNJ1Lw6w6x1yvSX9phctkOSM3+oZDH6RJmcFTH
         tVeryW6XKepqyn3ExyiKzCz7I3mmJWOLSOb2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260637; x=1741865437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=WXoPXZrtxs7DescYcBaGaT9FGcI9br7qqRvE/cmuZen/8ieA5Q9ZOBx8SuojPcKyGE
         ENnPwG3wfoBOhb6q47esrAJWnqh8lQHSnQ8NR5xfU/y6kMfbjvP4hN9HVM8M/jWLSnXo
         xbdZNxrhvQWZUTUDamxg+K7DXcoEkYn+h4Hmr8OZb+GEJkEDF4BOvcGAMSfemDEheJNp
         1CYb6/G5GKKTWAqPc4YnA0XZnktaGIHoIa+t7IDo1iEYSDqPf7JSBhYey0K/xTXAsLYl
         daoONsevmb4eLz2FxLSBsrfTbgownPAtaQ6ppnP+ic7li/uAwOseWLjl9+6/NSYntaVk
         Zdng==
X-Forwarded-Encrypted: i=1; AJvYcCWUrlZBZrwJOFOGU0Qx10gDJA8Zp1MveIo4zfUuYopjFAak36xJXvzWQQKeIiRVFlUOShKzLaf/RPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOwaSKPxdJHpPsj7D5DHGn7fH3KAso1Sbe9fHjFd2LMKLALV3l
	GgdtQUjAiQ4f95SR79ZhsQMP9p5zR+HnvSTRULWa/PPKF7HtKHCqhI1DXhtMzr4=
X-Gm-Gg: ASbGncubIWpvbdRECigkB1XJ9uY5srcvuAe3C4XxzlTUPru+hYTlJhjo9neJ+6VDhvx
	9MoOTzssBzalf82ee7Pm+lolOsGlqj3b9AfC+8T5Eh7DMvcmXAgaTNol4SZXUOnrIQy9NJQ7LSg
	G2y2R3vI3IhkzydnIF2yC2icITyS7PQbkMd4ENJMFu6k5w9/495psQQ/UKENR4PhpJN5ZaH40vZ
	979yA39gXvdFFHSw9KKPsDeIbyei5axbrk21VZECsrmyVVYcU37kUx6ChpEwe7KmF0QT7I/Z9HZ
	R9TYJ3wqAreUUYhpxQ3afIK8QYbmzXFOHEurGmQrA+yL7eXMYREBUUomenWfW5OnB4wIW2bT4kj
	vp6LTBg==
X-Google-Smtp-Source: AGHT+IGnwsNJxAKDrbK2kKQUMvhybDoBV/jgl1/I/PSi+Fn1DxAEWp8gH/c4FLNEhP/j536e3/gNkw==
X-Received: by 2002:a05:6000:2cd:b0:391:13d6:c9f0 with SMTP id ffacd0b85a97d-3911f7bd651mr6196780f8f.47.1741260636943;
        Thu, 06 Mar 2025 03:30:36 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 03/18] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Thu,  6 Mar 2025 12:27:52 +0100
Message-ID: <20250306112959.242131-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v6)

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

