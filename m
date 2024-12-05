Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E3B20E31E
	for <linux-clk@vger.kernel.org>; Thu,  5 Dec 2024 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397616; cv=none; b=N3qDVtwmpzg36mx9yWvyXSugg5T63IYwei6PywwdzDooS1EvpPattIslPordBvoUwnCtlVYz/31KNzjAdA9ECm0H7FdhkVOcnRZXk4bOExEXpXg1mrY3+MNYYleHrwGpUtiM1aDWPU+I6mfrimboXxX06VRU75sOmrcE2LsLtvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397616; c=relaxed/simple;
	bh=nZATu35jIwNzMOu/q32E4DVzYvYaOeYv03dex6aotrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lh2ZL5efTWPFGHZX7Jr7Wf67vkHUQoA/I90cAIa/HdJQv+f6YKiuDCUkP3fDVmC6RyUc5W/FrVugLdiMEQ7zy32ljfoa+sK5gdPoMH4Slp61ux/PkYMt0OSQy7Rv0k5g5MBnAF09s93dXgXDrdNP+ZoSuyWc5wcw/qtBtuSUWXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=QBGnCqqz; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="QBGnCqqz"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d340313a4fso101631a12.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Dec 2024 03:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397612; x=1734002412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=;
        b=QBGnCqqzeS0xJDWXwdLQPkPzS5gk78VJm+FMXvrinlr45DwF7NL84x11A4jTwu84aU
         fpHlye3rRedPIm/HUb27oUMNtqWcqxRy6002ISweg/zNVKZmeymqdynE94RRhpVnBspr
         InLPwn8cb+fh/xzQdIbIwPzJLZ9aKwdRCK1Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397612; x=1734002412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=;
        b=T9hn5QlOxCW3zaIVSxYn5Sx98QRurBIcLQv6N83NbXM5TmqBs0kE7hSg0x/BEeQ+62
         3DltiDCC1dnx1kJU2WmuI0ePhvDuGOzXHJzV7yNfLY45iJ4vzInou90HkNgNTz9BkI/r
         aVUT7arPq9HxrOpSiNtNs8+6uO97aw6MXDtICxawJF59BBKKZluxdbItAcFBDIXmUz0d
         upJ1eoXqStY1xO1Of08aJ2JyZgc1J5ndsQH9xEXPpT6rcDpTS2bcc+xnMiBEoOgULLt1
         DVXsoAdgTvgs2yl0XKcDTybrSI+bcZNX3E+zh1/E8BH9m6Jbb7rZ64uQtM5+vOfcnO5C
         s+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWSbV6ZN8nLPtEeYJ47hOOWFbl64qb7wPxk6QzE34lydyzKbaGuTBEMocPF/s1DoAAhsM6epRvWNDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCexc2nunYB6m7pCdBs2Fe4jn5tz7IZ97kkG0FFAvQG+nPRUVq
	A9jCVkOzlgF6hPrzUBCD/XMJPHbr+FmxtlspsGh47KP2h9TqTL2gBPUxeCRjhsI=
X-Gm-Gg: ASbGnct4DY+9vHD/q/7i/a4toCuIzypl98XeY39FFyiEDxXCrZKpSRIuVzde437UW+y
	zRm+k9kuM3LOpigzHorf6qdHLuHjQ6JxnkSFw36kX0xmXYquoAIV+GJVgJrorghzjrft5ziBpKM
	DrWTfZzKEUGEM7CB8WBciWAJuWohcCtzrOUCBxUOtqKwMwdIslrqTedKAL0xfj0mJwkcyjW4JZt
	4YyLyMbbKcao2lFpVI59HGESg3wREudoY89VzKjdpw/ZQHRyNOjmd6lzN93sXzwMWkZ6mWkjwD3
	C6eRQk6xf5I3kSMawoJBo3oP54b8RyIEE0wcwuNEM8jIfA==
X-Google-Smtp-Source: AGHT+IHkC2TdsvU53Arf9R3rEtIlqqSs2877Q+gumRy3NT+TL1A68HMegWO4XXkwBKx6SpYDp0zrGw==
X-Received: by 2002:a17:907:7841:b0:aa6:2987:9a4b with SMTP id a640c23a62f3a-aa629879b08mr105608066b.21.1733397612146;
        Thu, 05 Dec 2024 03:20:12 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:11 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 20/20] clk: imx8mn: support spread spectrum clock generation
Date: Thu,  5 Dec 2024 12:17:55 +0100
Message-ID: <20241205111939.1796244-21-dario.binacchi@amarulasolutions.com>
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

Add support for spread spectrum clock generation for the audio, video,
and DRAM PLLs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 drivers/clk/imx/clk-imx8mn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 588cebce6c9d..c61368e724f7 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -306,6 +306,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -338,9 +339,21 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MN_AUDIO_PLL1] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MN_AUDIO_PLL2] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MN_VIDEO_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MN_DRAM_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MN_GPU_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_GPU_PLL);
 	hws[IMX8MN_M7_ALT_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_M7_ALT_PLL);
 	hws[IMX8MN_ARM_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_ARM_PLL);
-- 
2.43.0

