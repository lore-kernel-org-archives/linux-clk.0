Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ACB1F8693
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318654; cv=none; b=Scqgeip8uIw680y0l8Bik205rp4PpNBG1LdZ2/mXGe7PdEfRKyv6eaMlQW4rJugWiMkzIIehTBKlpTTbcrLQeMDZEER5Tc+vB4KH7CFFxTN/XBhvbclTT7baAT9OwXYbn5PXLLpljhWHM75mqvfaypwzsTzgb2Ag0TXYEx6uA4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318654; c=relaxed/simple;
	bh=xUBRrkr1aLPPwLeMGNd5Xto6SUkG0PhtvIzCxxAX118=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3vmNOfnEaMhVqK4deeybcRhVuWE2A96i07XaWGISCFX3JbS0dSbHxkj57BTJFV8r/jCNKL9RnUacsC8ndJmNCvksAuDzn3axFscDz4JEcWj3CM5klxrwKMoBIxey97rfL6ZV8WSp0FZxFfrWI3ZKm0WjnfLULuHpUN3gPMP+OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=VpAXR/in; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="VpAXR/in"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa6a92f863cso1153593966b.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 08:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318649; x=1735923449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=VpAXR/inn36pyVqmBAL4FUoiYvv3d7BuV31I1NTSMCPtw05ELD9dlEL7JoRukU9nhp
         pTP7gT3Psc3e2djy5tnZAHWAsvQQKZ09YuSRsZraHksKWi8LXm4kobvngT/gJnftDBuQ
         QaiPd/i6cnfedlkOoKBNe1VR5tQLleLphaZrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318649; x=1735923449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=P8bWhvDbEWVAXmI5032jG5var4KeeX26Rteuj7THIqbv+yRdR+wSdhCNvB1USslvfg
         0ffQYtjeGzLSODtipGz9parQKBFAMnO4vpxdiwkbTfUCClgNU2NxnN1lqf8AndyXI1gw
         CNns/oJ5+tu0OWkWD7rPBbVqk7keA0pctwdivA4LfA9xe5xRJZSBIwNcoH0IpEDtu2cj
         QZ/Y3M3lg8Oe3xNet6xPMf96xlHaP5Zg8JDTmKNyyixPgLS+q9DoKw2rnaQDxz4v5zgn
         irT5JIBqpoQpYpHZOGAJ21J0GL6SjTLla6qBcAFbq9bk518GraLjGTxVOmBP0x6oAy4G
         XnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS6XD8U6a4rCxyKpLddGGArdD8EFP8GCfn+ZTXqQjpIRz//9SVy8dwGXWVQUeAM8DvJ54vJ9D1qAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV3+Z4xDEqzwrxDiyvYiA9MP7Oo336PZLK1lKhTfxJNETiwcdX
	83fz+QZRK7CYUDHDbCX1p/D1d/d8Y6o+MTWSCrDpcNNnDUt0fGHFxIHUsuaHJoM=
X-Gm-Gg: ASbGnctnxsR9MrQzZvEJKuUdYlRoQ0gi4OkmHwN/dxGkUi/E7wShIApAlMf8HZkcYbP
	9Pk6+HAwqbJZmn9x4pLc/NfWd6LXIBuP+poqPTrp0HjOLdqQuHqsuSRD5BJ1JqySPewjanh1IGn
	SfbwNTFzKkW4fMjEtOdmvj5BBAzDZgvHBQsBt3jH/hHHOhgZdKLXpTLGgguyUhXYYPIqCFf6IWJ
	HwWhaYBcoRa2h3aUau/tLg1bS18VqufzceN3Ot9KhkYP5SZcBesjJ9vMqg+06SNOKdYpBKHDA59
	FMAL0Tcp1Z6bnkbUqDGSCw==
X-Google-Smtp-Source: AGHT+IFx+qy8M9nbBtV4lkWk1CHCAzysU4JJGTIU9Blyy6kuVAhYju8xODoJ5uqYIFLq0x7fFfprVQ==
X-Received: by 2002:a17:906:7312:b0:aa6:9461:a186 with SMTP id a640c23a62f3a-aac33549f50mr2397618866b.46.1735318649395;
        Fri, 27 Dec 2024 08:57:29 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:29 -0800 (PST)
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
Subject: [PATCH v7 03/23] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Fri, 27 Dec 2024 17:56:06 +0100
Message-ID: <20241227165719.3902388-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
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

