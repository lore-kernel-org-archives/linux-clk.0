Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C6D1DAC93
	for <linux-clk@vger.kernel.org>; Sun,  1 Dec 2024 17:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075254; cv=none; b=YghTyoMEA8tosREIXanw+CU1/mjmhTcTfI45U/Q32qjwuDTbRnCWuRdvfZ2aDkSD69lL/Bjaj00s4XFFcxfKLKyel2Ppg4KXACbLVLe9bDrAyYkEoBbgQ2GAzfP1+0DtUvllb8q5lmV0hL/FlOjGzAEsb/eNsXPsUnBGahP8X0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075254; c=relaxed/simple;
	bh=Nwn3EKKlmGoN86TIQsDCmmh1hRjCTmWLWbVqZEcZ4hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+pgQyp9vIl8ldXIuGb9meK3lwmuGAjavmEvfYfy8fYtVAqz0RQNBZybqI6rcPesrjulmEUUECC0/3F8co0yvMBsA+pc1INQtJphggCyB/phi/upUMS8tSDbHvJAm/FXgPyjOFX6i6TjscRSa621cFN6Clm0jW46EX8oy21tDxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MxNw785V; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MxNw785V"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9e44654ae3so453319566b.1
        for <linux-clk@vger.kernel.org>; Sun, 01 Dec 2024 09:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075251; x=1733680051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vpGtyZ0NLJqQmHQubdh3p8VNW8Gv2lh2Riw5LPZEts=;
        b=MxNw785VNqSy0qe6fFTaBpCQzlra3GjmtJuJe5mLY1Be8IAGVaeWDpuVYVtGsMwgHj
         AE4hUjRPRc/XGUJQNiYpYh1upCirOeQMIcEp/1qsdyqP+l/AkOfFewPPGjSDDR20LRw5
         LJKE1jQulOOG/Qpx0whRkmzDLt5BQfAZ5ZqHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075251; x=1733680051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vpGtyZ0NLJqQmHQubdh3p8VNW8Gv2lh2Riw5LPZEts=;
        b=ORNRKVnADKhBt7AYrwOJuA11Vogs9sMfw0AP3vCTzr/FJXp/UDzarW8UtBujPgLsO3
         4GdfjH8PuWuaK60qJBEol4uNGnfCTiROoC9Rlwy0vj8BLI9m+bIYgoLUPjc60EhcfFiZ
         5JOCPaXCCshQVoMAFOqaGlayFH5zPB0a1t+WFcdBL3EM814LBMLD/tlFQRylsE3rJc1h
         9qamulUNwp00uUtG4vMbjNnTGwK7KT0Roc3dQ/wqsTYrs25VUc1spMW7loCIjbrt+kzN
         z430dGdK3QJH17APHzeb/NYTLs8wZW2qbmbNFeO+nBcDe6bofDMTLcDj6UJQU6TXJdRP
         +jYg==
X-Forwarded-Encrypted: i=1; AJvYcCWyetUV8MNVwz+PkHKtAvswAL6/VbPDEot4cD+eZtBG5n0rd73usaz/wd2OTbkAhomZfjSy1Epri6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrNVrDCjwH20rgEZhQOzPJwo37p3gBW3KLB27lKL45dGZJLSRY
	nby/FtuDYG/zu9/EV5WuQ1c4jeSWAwGb+AKo58PFrQ6hDY2BkYfATTkvV6YyD/c=
X-Gm-Gg: ASbGncunWGcxg3CX6ymrF8gvfOq+A7vkweO7b4dyqbn3XTzkwAv+HK3omn3Gt9lW6kW
	jfePRYPXB7I63nP+BROpCEllG6JG7injqgruginhrqje7jOmLvSJzVuSiSo1N7he45o2UJUjE4Y
	e+naOWZb0kyN9DGUxesgkE1APystbq26CqbIDN2zEgS8Nw9ZNJ62NBIo3j2WiBreYB9f0iXVNHj
	GXR7EF7XGepQcovZI5hs5NCHXeXCOePZKBlDkIlWCh4kFwQo9L1+KFdNkv64fHo/+njm7u6rx1O
	7dBmphIFLxJi0+ToGYA8aUJkFv1mfnpNoq9prL9fwGcXVVBKXYGjLjDpt4m4nx5MQDY4T9ZeErZ
	H2gNmg06KQ9J0hpw3
X-Google-Smtp-Source: AGHT+IH6kOma2DObSZmZth2XtVd8Da7MknZR6nKDqDOJ+2Riopq+leVAbUkamxADzB83IjOAlOgwqg==
X-Received: by 2002:a17:906:23ea:b0:a9a:10c9:f4b8 with SMTP id a640c23a62f3a-aa58109dc28mr1664550866b.61.1733075251568;
        Sun, 01 Dec 2024 09:47:31 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:31 -0800 (PST)
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
Subject: [PATCH v4 08/18] dt-bindings: clock: imx8mm: add binding definitions for anatop
Date: Sun,  1 Dec 2024 18:46:08 +0100
Message-ID: <20241201174639.742000-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
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

 - Added in v4

---

(no changes since v1)

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

