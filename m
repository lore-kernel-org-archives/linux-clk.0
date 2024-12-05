Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F720765F
	for <linux-clk@vger.kernel.org>; Thu,  5 Dec 2024 11:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397603; cv=none; b=M8gpcsNj5L4ynZpDGfVm2d0jru1t2jNxB1ssfticUhBVhRzpHMMYrvqjHZYslrvFp4yC75hsoLgPueveQvPSm/bCnR7EgznTsqec9ZIVsXwXwd/TBYFOuMTVmimFcZRvd1M2cp5GHy/UhYQR+H+9IpwMfdeWhc6dobwU0Gzuhbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397603; c=relaxed/simple;
	bh=pfUlSptnbjn7DLvsRIow/u7XIOc91MQ2X6DWWwf8p8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlsy2rwk2m2TK9h7VsR8X3H+aGTZnQ8N3FPfyWIsWc2NydTtA41yefeq5alEAXrDMDGboZ1qLdE+ySBfJtlUXzVbsKlYCaa70ys7p9l5nvYwWToCTgYgc3kv8bmgug48ZMOZ5dMB4X4ndLYcu3+3RxqxP/sIVX16ooxrA1WtJLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ifYk2VII; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ifYk2VII"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d0e75dd846so1178152a12.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Dec 2024 03:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397600; x=1734002400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQV84YY3kxNcx24ekDyafnu8RIJlZ6f4/uTM5oPtiQA=;
        b=ifYk2VII/Q8/8lqyxqmN0okvjTLgOUDP/UAzFrLqOF33wp8J6dSrGQw/Pqs8rU/SBM
         1fvJMcCF5mU3uDVDwcGwMElnhUPpvzIZLhP4sxjj6mT3UNp6XVrBDocuFgm3+vTaP3hX
         fqmpbHPhQEFO5F3jpzBob9BruBscVJfzi8K3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397600; x=1734002400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQV84YY3kxNcx24ekDyafnu8RIJlZ6f4/uTM5oPtiQA=;
        b=C5SbBp2PlDMWxOqLNtIrLnCIwp/HBRcpN1mXAWgqXgBWUkbqyiupPNWwR9WCMPrz+w
         O2rigrPMN+g8LRohoL8OIWx1th56jqM+9UhfoKQyMxmTk/YGutOyp8KUcQZYNaFNdwiB
         KKPdph5fjBO/BKSZFHPr/01uPjMx3mYMv9wivvolrZA1VqPj63xp4WJlc/KmA7vIChG6
         Bmk7Wx/9JNI4Ne4M8bdJPOFr3mInkz7pIkz+qGjG0YmrR4Mgb6m8b7rmOPSXZmTW3bUU
         Wz2RuAs+CtN9DQlDZYmeDWBfYqG+iRNRIes4dRQKYDhhlXrOCOi6o+q5+GcYM6pIfam3
         n/jw==
X-Forwarded-Encrypted: i=1; AJvYcCXHkQ5NDhaxIhaKsg4FD7MOo1ewItE7Vaa9ohYgjV/HgAMQjS3gg0PSPhbCwLN3nf0pqnsAgeHqu0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiw7k5XVYPhPuEgCOKsLcrk+3MASH5m83CS6jHNzVZrTwvFW7O
	H+2qLQbl6FWN0haIfPCMIj+hWzg9lgdYWN/k63YS2U1G09pa5SftlSafCnYJ8L0=
X-Gm-Gg: ASbGncuIr7qXQY7fhGhdYqD9Kz7Ak/aSn+PF5di/lHcLBVqSJhYIx2BxyJ1JEm5Y33O
	Xoq7nOusdVo0d6GDBIwz67WV+Kbk/onIBIM8TOhkEmENI/RvkCyBpdf9gf3dY2B9bbIhXicSOqg
	JGwMJH4d5Vzd7GzruKOM9VHaGK9/uhelz/jMRetmWK9gj8bDwDFXvFoBOwlllF47UK85VDzjbnM
	T6YPCnXY4Zado5FvpaGHvxrP3kVBlzSgdoC843Jt7eIYncUsvTtmDB/Odgpvr5GgjoEkFGsxzb5
	DKmBV/keXLTfGPiOb9apXPZ6I20oCIMOFyU6WYp/VaToEg==
X-Google-Smtp-Source: AGHT+IHYmzsfUE5nnaORiIrX4Eb1tu8QF4QuJLvLBDRHYiwoP2v5WElgFEFGC9Kt0r3kBSas5vWKow==
X-Received: by 2002:a17:906:308c:b0:aa6:2cad:2d61 with SMTP id a640c23a62f3a-aa62cad2dc3mr99811966b.19.1733397600072;
        Thu, 05 Dec 2024 03:20:00 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:59 -0800 (PST)
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
Subject: [PATCH v5 12/20] dt-bindings: clock: imx8mp: add binding definitions for anatop
Date: Thu,  5 Dec 2024 12:17:47 +0100
Message-ID: <20241205111939.1796244-13-dario.binacchi@amarulasolutions.com>
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

 include/dt-bindings/clock/imx8mp-clock.h | 70 ++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 3235d7de3b62..c2acba5d4555 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -402,4 +402,74 @@
 
 #define IMX8MP_CLK_AUDIOMIX_END			59
 
+#define IMX8MP_ANATOP_CLK_DUMMY			0
+#define IMX8MP_ANATOP_CLK_24M			1
+#define IMX8MP_ANATOP_CLK_32K			2
+#define IMX8MP_ANATOP_AUDIO_PLL1_REF_SEL	3
+#define IMX8MP_ANATOP_AUDIO_PLL2_REF_SEL	4
+#define IMX8MP_ANATOP_VIDEO_PLL_REF_SEL		5
+#define IMX8MP_ANATOP_DRAM_PLL_REF_SEL		6
+#define IMX8MP_ANATOP_GPU_PLL_REF_SEL		7
+#define IMX8MP_ANATOP_VPU_PLL_REF_SEL		8
+#define IMX8MP_ANATOP_ARM_PLL_REF_SEL		9
+#define IMX8MP_ANATOP_SYS_PLL1_REF_SEL		10
+#define IMX8MP_ANATOP_SYS_PLL2_REF_SEL		11
+#define IMX8MP_ANATOP_SYS_PLL3_REF_SEL		12
+#define IMX8MP_ANATOP_AUDIO_PLL1		13
+#define IMX8MP_ANATOP_AUDIO_PLL2		14
+#define IMX8MP_ANATOP_VIDEO_PLL			15
+#define IMX8MP_ANATOP_DRAM_PLL			16
+#define IMX8MP_ANATOP_GPU_PLL			17
+#define IMX8MP_ANATOP_VPU_PLL			18
+#define IMX8MP_ANATOP_ARM_PLL			19
+#define IMX8MP_ANATOP_SYS_PLL1			20
+#define IMX8MP_ANATOP_SYS_PLL2			21
+#define IMX8MP_ANATOP_SYS_PLL3			22
+#define IMX8MP_ANATOP_AUDIO_PLL1_BYPASS		23
+#define IMX8MP_ANATOP_AUDIO_PLL2_BYPASS		24
+#define IMX8MP_ANATOP_VIDEO_PLL_BYPASS		25
+#define IMX8MP_ANATOP_DRAM_PLL_BYPASS		26
+#define IMX8MP_ANATOP_GPU_PLL_BYPASS		27
+#define IMX8MP_ANATOP_VPU_PLL_BYPASS		28
+#define IMX8MP_ANATOP_ARM_PLL_BYPASS		29
+#define IMX8MP_ANATOP_SYS_PLL1_BYPASS		30
+#define IMX8MP_ANATOP_SYS_PLL2_BYPASS		31
+#define IMX8MP_ANATOP_SYS_PLL3_BYPASS		32
+#define IMX8MP_ANATOP_AUDIO_PLL1_OUT		33
+#define IMX8MP_ANATOP_AUDIO_PLL2_OUT		34
+#define IMX8MP_ANATOP_VIDEO_PLL_OUT		35
+#define IMX8MP_ANATOP_DRAM_PLL_OUT		36
+#define IMX8MP_ANATOP_GPU_PLL_OUT		37
+#define IMX8MP_ANATOP_VPU_PLL_OUT		38
+#define IMX8MP_ANATOP_ARM_PLL_OUT		39
+#define IMX8MP_ANATOP_SYS_PLL3_OUT		40
+#define IMX8MP_ANATOP_SYS_PLL1_OUT		41
+#define IMX8MP_ANATOP_SYS_PLL1_40M		42
+#define IMX8MP_ANATOP_SYS_PLL1_80M		43
+#define IMX8MP_ANATOP_SYS_PLL1_100M		44
+#define IMX8MP_ANATOP_SYS_PLL1_133M		45
+#define IMX8MP_ANATOP_SYS_PLL1_160M		46
+#define IMX8MP_ANATOP_SYS_PLL1_200M		47
+#define IMX8MP_ANATOP_SYS_PLL1_266M		48
+#define IMX8MP_ANATOP_SYS_PLL1_400M		49
+#define IMX8MP_ANATOP_SYS_PLL1_800M		50
+#define IMX8MP_ANATOP_SYS_PLL2_OUT		51
+#define IMX8MP_ANATOP_SYS_PLL2_50M		52
+#define IMX8MP_ANATOP_SYS_PLL2_100M		53
+#define IMX8MP_ANATOP_SYS_PLL2_125M		54
+#define IMX8MP_ANATOP_SYS_PLL2_166M		55
+#define IMX8MP_ANATOP_SYS_PLL2_200M		56
+#define IMX8MP_ANATOP_SYS_PLL2_250M		57
+#define IMX8MP_ANATOP_SYS_PLL2_333M		58
+#define IMX8MP_ANATOP_SYS_PLL2_500M		59
+#define IMX8MP_ANATOP_SYS_PLL2_1000M		60
+#define IMX8MP_ANATOP_CLK_CLKOUT1_SEL		61
+#define IMX8MP_ANATOP_CLK_CLKOUT1_DIV		62
+#define IMX8MP_ANATOP_CLK_CLKOUT1		63
+#define IMX8MP_ANATOP_CLK_CLKOUT2_SEL		64
+#define IMX8MP_ANATOP_CLK_CLKOUT2_DIV		65
+#define IMX8MP_ANATOP_CLK_CLKOUT2		66
+
+#define IMX8MP_ANATOP_CLK_END			67
+
 #endif
-- 
2.43.0

