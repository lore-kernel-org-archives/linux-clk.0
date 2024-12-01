Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531931DD0F8
	for <linux-clk@vger.kernel.org>; Sun,  1 Dec 2024 17:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075258; cv=none; b=nd1OqUQv2jMj9RVa/8GeIU6M8S9u2uc+5LFaR3K28XPnVnq1HDR4sHYTuF8CHiRBZy3/kR1x2BYgHuvTPJ5Avr48SfD6+G65DuLYtzVuoNaG4BT+NGNTjVPaObhM/aMrqSBuM68kEuB66zwhf5ittw7SfdNXPuyNDnjKEAcTEXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075258; c=relaxed/simple;
	bh=FgS3VPSUb3LX7ZxAviEc5zpx+vimv7Cxc32ZpCChiWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uu6+JtI7AydUUYoh+Hbe3HQYnVcv8dpsdp/WcPs7XQcQyd3UvroiaqnLoimgshwlA3oNekeON6L+BFt1z7hGg9WOgQaOhK7CBOcidYBuxnp8LADxIi/Vt32vLVPMHdVpuZNV4nxYOO15l7NwkEMf/7A2WNk0XAN5mRaPDThqj7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=gJYrbosl; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gJYrbosl"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa520699becso581433666b.1
        for <linux-clk@vger.kernel.org>; Sun, 01 Dec 2024 09:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075255; x=1733680055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9ECY73UG8ehnqT2joX/xp2njmIlfmPxWimrFTqyoco=;
        b=gJYrboslG1VqpZUncM458LGw1SIbQn5hUP1Dw/ovO+0WSFANfviYJTOFrBy9OmZyw5
         BI68V7JE+M8igpI+T40+6g/VlsKYNHWLRjYrX4o82pSAGLqkE7Xr9IdvUCyATQwft3QX
         CYxGJbqlg2q7k2xPf7GvCfIqrJipxfjAHyO5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075255; x=1733680055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9ECY73UG8ehnqT2joX/xp2njmIlfmPxWimrFTqyoco=;
        b=oPAhxCbychgkNvGnrnrWwJ/UFZVLsg4jiuEqLy3rA2K62Bfj4J3o0z58MLSjSSl7jo
         Q/lnZdLfIyMn7kSnAAIRV8WO6MZI7o70cqUNf+xxyoCzGC0hzc1AVesXwd7Ad00haWhp
         2xh6B6Zaa8ZFSyfC8d0vcSMmYdvL9sRUpWvb1ui8KzyJItwHEtp/N5g/ilY6RK9ACMhn
         PTHmK1eNaV6x2RGYzNkn8DaYYbt85+r5TAqCA4HU9/4aWqin0dPspZHiIquHY2OUsd3r
         G3AWVcnQ82pP5u5Ymkfh8zrZmTbyEgHkhuVr2hMxknR2iNLXR/7f2+SidFY063o35+ZP
         Nf1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtENJq7lbGOTFNnEJVyytROoMkjVqD4O8IC0fakQQjfrVFTP/rQWABiyuHVUzSbhs75EVFg0M0JfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqZmoHCDUqPCx19JosN0w9zYVPzoOlfK9CA2xEfTTqZg1bVjkA
	dCGG88xyTqK4ordhSIKT0+3Yu84ehVVKm/qptJvRNHhjQ018/xGUCE/INQv1R4w=
X-Gm-Gg: ASbGncvDaNYOkVFxR8TY/JFCgPaqlUK2PWeGS/Zc2i7zpb3pLPB0YMW8DVoD5nLIrtQ
	SL/w2kbQYFqmdDid7VYNVSZemlEgx8c9Z/TyDT+A0/Ij0LZMf6/nRx/zYlOz9k7gi07pZ2CUd5X
	JJ5r1XXz2Zt2x2EKkKisndxBYMXlozJmq7zgiFHvLfRMs1f0va1tdMPHHswcDd0VF+kTf8d2EGr
	ER18KS4g/yx1/yl0JOeEKPZEZAwaP2FybHiwL9O2qWWhxUsohsSllFh9EFKt7+ASYhfuktpcyyg
	/MIsOvM3egphu3MF/BxOrYOyYhEQgxBQStXbyN39SQ8dsh1MOAGcoWu8780t6au0kbitKWqwLR7
	FrD2DczvOSNUOwCc/
X-Google-Smtp-Source: AGHT+IGWip9V7SPf/QghX0+OWBObLNjALVbM+OpWM2YdiKPU4MTIDv5I0WeF92pbW/fXTxQeu5Tp/A==
X-Received: by 2002:a17:906:3d22:b0:aa5:11be:5703 with SMTP id a640c23a62f3a-aa580f3a76dmr1448724266b.35.1733075254737;
        Sun, 01 Dec 2024 09:47:34 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:34 -0800 (PST)
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
Subject: [PATCH v4 10/18] dt-bindings: clock: imx8mp: add binding definitions for anatop
Date: Sun,  1 Dec 2024 18:46:10 +0100
Message-ID: <20241201174639.742000-11-dario.binacchi@amarulasolutions.com>
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

 include/dt-bindings/clock/imx8mp-clock.h | 70 ++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 0601df6c8d38..39e4ad470927 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -401,4 +401,74 @@
 
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

