Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABB6207664
	for <linux-clk@vger.kernel.org>; Thu,  5 Dec 2024 11:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397601; cv=none; b=EwvHVPyQpDJL28VhWOv7uqlbUas7pt1fPkqr/eVQgyi7polRKUxOvyHnDfU6OnwPUzU3XDlVziRi4klDKF/daNBcwa6Tc6pYCu5pcAZNrzWYKAT38NxZVKwW0FjDcDdzZBebwfCM/Bzaa4mv/oxTAmaJLONhFAu7wYoqNFSjDeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397601; c=relaxed/simple;
	bh=3DxpGRCKL4R9VjSmR2NVJLH57WvAYh3dFS8JjLLqaGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IEpKIY5MMc1TrnBo3DmVO1VLPLpEwmtNOFH2xym56AreWl/A73Ejv9yQ9QMq3a0RsSI8dQ0T17F+B56U/4ELgYPoPNabSLjnMD+wD4XkYFc+DKBicTNgL/Y5kOesCHmAo98nmIgglzwX6uQQy1qei7W6fLPtJm1RxPT7M+KnOPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=AHwc0Hus; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AHwc0Hus"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa549f2f9d2so122663366b.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Dec 2024 03:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397597; x=1734002397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ixt9c4K83xzkiOz3qhQdg47ej3Uw5HCoJxrsxE8RGiA=;
        b=AHwc0HusZmiW8w6SGrwcwtXtrZi+tyCjs99HXXFI1pT+hq+DDBVYqg6LK6oHnqLPCz
         GMdxbauJU0CwDE0Dw6OyqOJ42khjznvx1V68mLgQP35M9wimGw2ZoeUhGwEmjerQPzRY
         revvTBUOs4ahNsRRtLNElD/n77XtSjfCEd5yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397597; x=1734002397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ixt9c4K83xzkiOz3qhQdg47ej3Uw5HCoJxrsxE8RGiA=;
        b=gdHDMp43u9B6IYbkK3dEj5YA0/yK9odC5JUackMUN8yX/e/KBNpsDkEM/gZUtq5mHU
         /ob0URrcWwHNWcPtcHUYuoPHn6dNCoi+XsyEBCb1+7cSaKCxyl9yZdhXsmu4EPOhPfVy
         KVLR6vnfC/BGtZS60rwoIpWjyJVYQVD5/iffr+RxWLC9JuJ2mtjqSv1pn7P6QZQfLi72
         99gAIZ7gLLMH91h0DcgQu+y1QzRbNFjBoWDLvsQS8f65jC0V8/GTUVROMDvtPnVQhtCu
         A1qmh4dXbuGQ9EEd5OMgv9m1ccGpGHWEyfRuGXXGU+BzsGmlBoeDE6NSgQFRhQBiqP14
         9jXw==
X-Forwarded-Encrypted: i=1; AJvYcCUfQoWCJB4mHVb5BwYCNZV5ArslZzfx2hyyUh9AZ934VL6MYOVI53UNsZxma+JW2TZCyqGkq6vAi1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPM3IHMWvONxcVrHOdiqcpNDvXxejuWqNRIQim0IFoyZGek46O
	+q2YrE3xRU4oFzemGwMebjtketRAwxEhY/wFUV1tnnVowQHr5NEgcxD9oFwnjwE=
X-Gm-Gg: ASbGncuz5CS8X091jkSMjVkxEht7pad7hCQrO3/m89+XF3jadAwO277gwDf+IpKu15G
	LOJS2DDrgnZYU8n0ZHa5pOgf4P0iOzXyeFjjPlCLfvPIOFMfwtJBbvwTRMqN3KcVsZD5aaJFw08
	ViGAd83dphTzT9m09rmtxaUEx3HTCAsYydAl5RcOeERjJBGOFdA6WII8u/r11P/cOlV5PsFPcjy
	EY4e1Fy9mYNLedbKsSuL/m/u53XsNwTmORGSXrB1OA/kMIyjF1FdnlwYM9pC3YiDZIZD7Bl8eLF
	eV0Jewq/1vGPtOiqZnIAAaf1Lu3mnRlgRcrqpVJdQPoLbw==
X-Google-Smtp-Source: AGHT+IFUxRjQiwJBKQ510OqJX8yYu/0B+UpRJw9P4DoKOWklChPPw3p6pUsTHU0wT1h5Pt6jtQCb4g==
X-Received: by 2002:a17:906:3103:b0:aa6:18b6:310e with SMTP id a640c23a62f3a-aa618b63362mr373184366b.38.1733397597383;
        Thu, 05 Dec 2024 03:19:57 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
Subject: [PATCH v5 10/20] dt-bindings: clock: imx8mm: add binding definitions for anatop
Date: Thu,  5 Dec 2024 12:17:45 +0100
Message-ID: <20241205111939.1796244-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 include/dt-bindings/clock/imx8mm-clock.h | 66 ++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index 102d8a6cdb55..1962b0a1e732 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -287,4 +287,70 @@
 
 #define IMX8MM_CLK_END				258
 
+#define IMX8MM_ANATOP_CLK_DUMMY			0
+#define IMX8MM_ANATOP_CLK_32K			1
+#define IMX8MM_ANATOP_CLK_24M			2
+#define IMX8MM_ANATOP_AUDIO_PLL1_REF_SEL	3
+#define IMX8MM_ANATOP_AUDIO_PLL2_REF_SEL	4
+#define IMX8MM_ANATOP_VIDEO_PLL_REF_SEL		5
+#define IMX8MM_ANATOP_DRAM_PLL_REF_SEL		6
+#define IMX8MM_ANATOP_GPU_PLL_REF_SEL		7
+#define IMX8MM_ANATOP_VPU_PLL_REF_SEL		8
+#define IMX8MM_ANATOP_ARM_PLL_REF_SEL		9
+#define IMX8MM_ANATOP_SYS_PLL3_REF_SEL		10
+#define IMX8MM_ANATOP_AUDIO_PLL1		11
+#define IMX8MM_ANATOP_AUDIO_PLL2		12
+#define IMX8MM_ANATOP_VIDEO_PLL			13
+#define IMX8MM_ANATOP_DRAM_PLL			14
+#define IMX8MM_ANATOP_GPU_PLL			15
+#define IMX8MM_ANATOP_VPU_PLL			16
+#define IMX8MM_ANATOP_ARM_PLL			17
+#define IMX8MM_ANATOP_SYS_PLL1			18
+#define IMX8MM_ANATOP_SYS_PLL2			19
+#define IMX8MM_ANATOP_SYS_PLL3			20
+#define IMX8MM_ANATOP_AUDIO_PLL1_BYPASS		21
+#define IMX8MM_ANATOP_AUDIO_PLL2_BYPASS		22
+#define IMX8MM_ANATOP_VIDEO_PLL_BYPASS		23
+#define IMX8MM_ANATOP_DRAM_PLL_BYPASS		24
+#define IMX8MM_ANATOP_GPU_PLL_BYPASS		25
+#define IMX8MM_ANATOP_VPU_PLL_BYPASS		26
+#define IMX8MM_ANATOP_ARM_PLL_BYPASS		27
+#define IMX8MM_ANATOP_SYS_PLL3_BYPASS		28
+#define IMX8MM_ANATOP_AUDIO_PLL1_OUT		29
+#define IMX8MM_ANATOP_AUDIO_PLL2_OUT		30
+#define IMX8MM_ANATOP_VIDEO_PLL_OUT		31
+#define IMX8MM_ANATOP_DRAM_PLL_OUT		32
+#define IMX8MM_ANATOP_GPU_PLL_OUT		33
+#define IMX8MM_ANATOP_VPU_PLL_OUT		34
+#define IMX8MM_ANATOP_ARM_PLL_OUT		35
+#define IMX8MM_ANATOP_SYS_PLL3_OUT		36
+#define IMX8MM_ANATOP_SYS_PLL1_OUT		37
+#define IMX8MM_ANATOP_SYS_PLL1_40M		38
+#define IMX8MM_ANATOP_SYS_PLL1_80M		39
+#define IMX8MM_ANATOP_SYS_PLL1_100M		40
+#define IMX8MM_ANATOP_SYS_PLL1_133M		41
+#define IMX8MM_ANATOP_SYS_PLL1_160M		42
+#define IMX8MM_ANATOP_SYS_PLL1_200M		43
+#define IMX8MM_ANATOP_SYS_PLL1_266M		44
+#define IMX8MM_ANATOP_SYS_PLL1_400M		45
+#define IMX8MM_ANATOP_SYS_PLL1_800M		46
+#define IMX8MM_ANATOP_SYS_PLL2_OUT		47
+#define IMX8MM_ANATOP_SYS_PLL2_50M		48
+#define IMX8MM_ANATOP_SYS_PLL2_100M		49
+#define IMX8MM_ANATOP_SYS_PLL2_125M		50
+#define IMX8MM_ANATOP_SYS_PLL2_166M		51
+#define IMX8MM_ANATOP_SYS_PLL2_200M		52
+#define IMX8MM_ANATOP_SYS_PLL2_250M		53
+#define IMX8MM_ANATOP_SYS_PLL2_333M		54
+#define IMX8MM_ANATOP_SYS_PLL2_500M		55
+#define IMX8MM_ANATOP_SYS_PLL2_1000M		56
+#define IMX8MM_ANATOP_CLK_CLKOUT1_SEL		57
+#define IMX8MM_ANATOP_CLK_CLKOUT1_DIV		58
+#define IMX8MM_ANATOP_CLK_CLKOUT1		59
+#define IMX8MM_ANATOP_CLK_CLKOUT2_SEL		60
+#define IMX8MM_ANATOP_CLK_CLKOUT2_DIV		61
+#define IMX8MM_ANATOP_CLK_CLKOUT2		62
+
+#define IMX8MM_ANATOP_CLK_END			63
+
 #endif
-- 
2.43.0

