Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B223219C56D
	for <linux-clk@vger.kernel.org>; Sun, 29 Dec 2024 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483852; cv=none; b=rLALJlWqwGPpMe5TdO+xzNmnIRvvqtgo30jdEcCQHpzZj1XKUwANCY36Zsrcq74+rnJ1abi3zjB1HKBPPLvaXjxPuDwlJm5jBk2Zi7ZrrjlXFD44Lk14MotnPK8aFOxF5WcFgkoIonBnTcvgCWxjfJ568yOkbW9LAHzWl3CoBC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483852; c=relaxed/simple;
	bh=Se6p22DjeNW4mXfQtWBQzbMObZJXYELZ77nkap0xwso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YqzoQdFVdnfP1WTTbcF14m3XznPGv2Dpr8zxifQNkrPnmOGr2FXYUz8b9aJ1N6LA/fvoFayiBrJCl9jOxRAUWMoVmZamqeHe3N5mGqFcV7q8juUZe6noAqwKlZnqUKYpdGfqKKFYQlmfaouRsk7bEO8aOteqxaRSTTXKM6BpQOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bjOlw0sa; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bjOlw0sa"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa67f31a858so1520366766b.2
        for <linux-clk@vger.kernel.org>; Sun, 29 Dec 2024 06:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483848; x=1736088648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHfQ/VeJmhz8wn8A9KlfaIopMLyJVISWJA2tyBqE4w0=;
        b=bjOlw0sahd3D0HVFASmErNOlLL3JTdTFsdMpLbNP6cBXVOI6GNGRwID9w7xMMGh1Ge
         W/j9gWaLB4mQs7FsPYAaROpjPaCP+u2Yk108VZNgQCm5hG3KcVGMQICLNNTtSPe0p/Ib
         hvDgOe3T6zWwQTKaYMxfYC7B22RBEe9IZtTj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483848; x=1736088648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHfQ/VeJmhz8wn8A9KlfaIopMLyJVISWJA2tyBqE4w0=;
        b=SkZ6QDQ05Ii95jp2BA+1k5xnR48NE9sb0cMywBwmnPcMM9zqESycjfLpK4uLjl5xi7
         SUh7jhOftVdKcAWC95gWFXsVmmxyjU1M9RQuSE+BfqIwKRKcVWu1HsAh6APo8/bI0tFZ
         lD3b/kJ/MjURS2pNZST6pJ1P61M4T+enQDkCuNDduJrsXbO7piSsvhQJiQjG9KjVkOF2
         N02Te0WoT7u2z8XSfynjwLmYFDMDarPlm8tSRxR+74ixUIbkL9rTrVA4JFkgBu6Hci5s
         RcOAthZoGdFhR56+SKN7KsGdH9yVKSZ2p5HzyZ3SMUTR/ALJt5n+1KIAb7huivA5XQ5h
         FhJg==
X-Forwarded-Encrypted: i=1; AJvYcCVGJ1avRTs4fE3RJY2q8u2btOKznC2+Y3jv2gcmvupFKVifv5cUg+6Tw2aLucdxwCw61iaIPiOu2AY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqO0cGwUoAXKpdctWyh71VUMF3/orhpL64VPxPzo3tATiRrUSd
	+H++lt2yNEhTBb/s93LZrrt8xVtB0h1JZzEOPWaqmcHqISoEYxnvGOvil5b69c4=
X-Gm-Gg: ASbGnctfElYLOgze60cRLlAs9qoWshRpxwHuv8V+XLkBm9yt8JbbZ0xODwVMHFx501Y
	P3P9oSEJM5yllm10EIi9dO19f0PzjxHokkpFqTF3VI/7wV60/8VUma782I8WSjWY7c04wqhFZff
	Ym470BlCUUDA9FniINiaiLyF7C85lvlHdmyLBn4I6ptXQyKYKyoDmaLfJKsGBxNCjj5oGHMyXum
	ltskquhUZbcYjpCoMV9uycmLWSuRIGvhn2lPXkvqbRpOD9IHD3xQUuR1zQF7tw8JYWEt7xesVTF
	rfTu8RiTja/oCL3mVPpgwg==
X-Google-Smtp-Source: AGHT+IGnU9rddkEjFb71xBUpHoE7jAWdM0Mj4zsaR45d/rt3vvu1CgxNBArT5n379CI0wDcjZNjmxg==
X-Received: by 2002:a17:907:96a0:b0:aa6:7feb:193f with SMTP id a640c23a62f3a-aac2ad81a25mr3181092166b.20.1735483848082;
        Sun, 29 Dec 2024 06:50:48 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:47 -0800 (PST)
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
Subject: [PATCH v8 10/18] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Sun, 29 Dec 2024 15:49:34 +0100
Message-ID: <20241229145027.3984542-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get the hw of a clock registered by the anatop module. This function is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v7)

Changes in v7:
- Add device_node type parameter to imx8m_anatop_get_clk_hw()
- Rename imx8m_anatop_get_clk_hw() to imx_anatop_get_clk_hw()
- Drop the gaurding macros so the code can be used also by i.MX9

Changes in v5:
- Consider CONFIG_CLK_IMX8M{M,N,P,Q}_MODULE to fix compilation errors

Changes in v4:
- New

 drivers/clk/imx/clk.c | 15 +++++++++++++++
 drivers/clk/imx/clk.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..a906d3cd960b 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -128,6 +128,21 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
 }
 EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
 
+struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id)
+{
+	struct of_phandle_args args;
+	struct clk_hw *hw;
+
+	args.np = np;
+	args.args_count = 1;
+	args.args[0] = id;
+
+	hw = __clk_get_hw(of_clk_get_from_provider(&args));
+	pr_debug("%s: got clk: %s\n", __func__, clk_hw_get_name(hw));
+	return hw;
+}
+EXPORT_SYMBOL_GPL(imx_anatop_get_clk_hw);
+
 /*
  * This fixups the register CCM_CSCMR1 write value.
  * The write/read/divider values of the aclk_podf field
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..50e407cf48d9 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,6 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id);
+
 #endif
-- 
2.43.0

