Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A2626657C
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 06:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388183; cv=none; b=DmMR2d0tlxWv2Q8RA/glgjSlajWDvKNSm23DSc1HmTFijsz499ntsJcAtvd9DdTArmB5e4xH3qdQwPbvB0KbtIetoDCEdIYBgwVSrXAMOy/MaCq3oS6AufCCUWR8bJH7E1EKCsDHLNmfsdIYDn+WfDOx5gRBJT0I0tduO6bYM6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388183; c=relaxed/simple;
	bh=xUBRrkr1aLPPwLeMGNd5Xto6SUkG0PhtvIzCxxAX118=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bw2ljwjWa1bjswSaZuD0o1QpmzrwNlgKBkxYGliInr+MO88cN4r78vjW77vKJdEwan2UcRDktK8vc5N9paSlEDOdPJKAokXMlq2g+azWHCr1UARNfzMzIUPZPzFYp+EVFHrwlmN4bXIy4LX5jXVN0m8EBoykBViLNmqxK2YOaok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=AIrWiW+L; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AIrWiW+L"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso11194748a12.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Apr 2025 23:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388180; x=1745992980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=AIrWiW+Ln7HlOyCWTrPwaVpoQQTWTXksMQks5mENQBG1qm4nVIl4rymbpDmb0kdt7r
         QBe7gp+lBz4e1JJMmGKQdE3cbx+f5uCHJt2yrodw2kVvGTlKECxgfoTNkHY/5k4R6bf1
         qHspPd3wmTXKccOPmoRFHgDVVLJ+lwVsniT0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388180; x=1745992980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=g7FQw031QJSgX9FI4Mxn8qj63KvgzbBMtQqE1Yzce5vSL1lR1xn/TBdV7qLUE6o4Pz
         7xveqcFX59Wx6IedxCKim30MIMfvuJykQh6nrpR5pq6Eum2mHOTPXDX9PR1OYdO/B+fZ
         4ao/KVJg+/h/9+ChfpRwEZYaFm/uMyXiEws43MOZio78Dw4g0qLyGQB1Uo3WQyuEutOM
         1H+/BkC5NoXlnxrksFTnrQaZMXz0qYlDvzqVFWXUim8GsoMe2/RiI3t199+kuAH0t6dk
         z16YDKnKiGr6P4wDlvQ+qKWeQFiVLOzR+pXMI43oxEoSFPuyRGKLln7zr2PSxjZHqCKB
         Wd9g==
X-Forwarded-Encrypted: i=1; AJvYcCXr2lPFog2H3yaE3/KQzT0YrYyTh7yZur1v9ECBCz8iHxueeA3VIoB+FoEmWrjr7MhimaOV6MpZLYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVUUm3e8kznc0qapkwb8sp+5ljucYfB+CTY0kOLBA8vEpoPuNQ
	UiSDoaiKL0YcWEtJ76GaBuX18zXBZUmgJ+6IZYny1k3pG6ml7y4IKKs7JaO0Pqk=
X-Gm-Gg: ASbGncuFqV/rDZS4wlCy9Aarbgx+ZmZjTzET9UmI/jlP7TUG8adc6+UAoTK4oqo4fdy
	ZXA/Oi514GtaGESCwbn8mwDs01ZIuM0hp9p8p+2wID6KTYKDK6AROuZaYiGR3/KJ5+hO3vRbR9P
	h2lvn6S5CVHH3H6cRYQ0n/H0OyePmxUIDKoDbgeLq87PREQUitnFTto0o6Y2363dZ6mgqMS4QJv
	d/DBkzVteOHH3WVRfnmNhC3nE49dgrKTGxYBIkuD1npgiBEHiin4NGA/163s9xerLgeVi05EIYK
	hGf1JZL3t4FYBHu2Sb8CxvgvwFejp1SnnhqTkJPzeFlIrllPhZ52EOLuszuGokKwcyBWO2OSrKj
	0O7VS
X-Google-Smtp-Source: AGHT+IG7e3Q3dj5KdFkcFK0kkZNsQ7n4rcyUNpetxzkW6OWRUCissFclqwW1aRy2urkwgRK2/F5w3w==
X-Received: by 2002:a17:907:c807:b0:acb:bbc4:3344 with SMTP id a640c23a62f3a-acbbbc43a1amr550390966b.22.1745388180459;
        Tue, 22 Apr 2025 23:03:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:00 -0700 (PDT)
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
Subject: [PATCH v11 03/18] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Wed, 23 Apr 2025 08:02:20 +0200
Message-ID: <20250423060241.95521-4-dario.binacchi@amarulasolutions.com>
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

