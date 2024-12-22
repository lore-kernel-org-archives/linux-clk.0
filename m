Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE741A8F68
	for <linux-clk@vger.kernel.org>; Sun, 22 Dec 2024 17:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887158; cv=none; b=WmgIlVEZkwylJtAIvzTzdXAXZ5mqKOSXbAMoon5fX9lX1fLSO1H6084B3d1UnklfOiu1wGfUedDjQybq1edVRs5G25Vd2Nq01ZN35rzaKMg/Q82QtOP7E1lxR75UT0hAxSG5608skuuynVVvIvDkjnduu01EWyo9i8pBFNHe6kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887158; c=relaxed/simple;
	bh=EojtDfwQiE/l6/+nsYWjeFSB8lLsWtD4gRRg/kiP+q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VcPcQDO+qWr4kcppRyVRsAGB+tMiNMaseJovGNROUumlWA8me9b8kwxkGWPP5V6et7v3eRo13IC4wHh7kroh5P3icWrFvJcBXz0mkLWXOahXzLBJDwgrhnIMwCQI2Etsd6W5B+6Y+Iwvf47j1noLMtkySYuVp+Vf/PaI/7xl8lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=VKB5Zq6J; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="VKB5Zq6J"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so5658545a12.3
        for <linux-clk@vger.kernel.org>; Sun, 22 Dec 2024 09:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887155; x=1735491955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVXt77MmyayWVTjhC1zQYGhplrs4R1xCNUj96ytDRNM=;
        b=VKB5Zq6JmWTAO/q4RRncj+C+IUQf2a+MU3QoaJ3GmgyxQ0Y6Rs70ctoaYvt4xkXVuw
         tHNX61pO/NmkAuW/1pz7vYAsAZ3+PGQlbb1SrGfKkdXRg8nnh2XCO1Ak/tx+Sj73Gy25
         aImdyDidnYYT5C0Xq3V1kcVMNGTaMW8JaBnZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887155; x=1735491955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVXt77MmyayWVTjhC1zQYGhplrs4R1xCNUj96ytDRNM=;
        b=ZnGG8hoImVJeZmqIF0cYqHaB5ptXqI9P1JfSwPhtvFuawdGYDNxaCdm8etht4WB76P
         0iCNNmC1M1zKvAK+BV6eJRlYUX3mzXpoQ18mjPREYkvDo1ylaTidpA3w1/mawP/cLzl0
         ho/CtKhHSCZWnQFuYx6Wy/zViNc4sgAIrq2/c3HYkWCrWF3u39+nt1y/jHvftfOYaRPz
         mjihp7jvSC8dubdrlJrKB+nUrHhX25SdqynCpCiU++5PxgkZd6c1Iljsdjm2ifonLyxc
         b0TucRLVcJpYYSOMhDxCdSPG5cNOlx0BGsYj71OqZmFS1GCs6eGMEu7tXpe7kZzYCDUv
         2ysw==
X-Forwarded-Encrypted: i=1; AJvYcCVLEEG45H+u/s++Add5Jy929/EcoWasm3XC14Ldc57w4xbmSBTJhLcVebfMmSWFrwR3+PPDZTBNm4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUqh0oZXPLRPD65BOWsKSRKleR1/bobXgSNSxdXlmQ4ndPhjWY
	+KRZZjORu2J5iItd6GWRWR31pdy7Eg3DR2Lxf1O1lNSwFvTaOx6wDkGMoH7ItpI=
X-Gm-Gg: ASbGncv89WADhJn5Xdz3LXLO2wLr6oZ0CUbJSZAatBKQUgUHVX5GQIymz/Zipaax7jk
	/bfvfM9eglxQP53M/wKEOPoiuw4GUF9HIiMta6fjRvb/SD5Zc2Hn3uWs+dAk0IJrJu0pRAy697v
	2PHtM+Vx+/J9svNJIseZO9hu1o9Mz5BxoPm5ielYbeogc+c30wv6zgYnH6AqPm+1GkOsuSPFLu1
	ATQbn8kdWCXFMqhVy/16WF2ISrwFxXq8TzmJh6dpW6V0nlZtCeEB/BxUoR0OSycD9qOpekbv/gY
	eOmO2BiZcFiaKZKab9PlSIBrRPorQeEpeO3sIkc8S1FjLw==
X-Google-Smtp-Source: AGHT+IEtRv29UB2/vpHu5Pos5vtKqjoO8x1Oysl5897305hTSToDe3em3zRHQXaKniZ6rSfoLi31Mw==
X-Received: by 2002:a05:6402:51c8:b0:5d3:cd5b:64a9 with SMTP id 4fb4d7f45d1cf-5d81de39872mr7776824a12.34.1734887155565;
        Sun, 22 Dec 2024 09:05:55 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:55 -0800 (PST)
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
Subject: [PATCH v6 10/18] clk: imx: add hw API imx8m_anatop_get_clk_hw
Date: Sun, 22 Dec 2024 18:04:25 +0100
Message-ID: <20241222170534.3621453-11-dario.binacchi@amarulasolutions.com>
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

Get the hw of a clock registered by the anatop module. This function is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Consider CONFIG_CLK_IMX8M{M,N,P,Q}_MODULE to fix compilation errors

Changes in v4:
- New

 drivers/clk/imx/clk.c | 28 ++++++++++++++++++++++++++++
 drivers/clk/imx/clk.h |  7 +++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..9a21f233e105 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -128,6 +128,34 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
 }
 EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
 
+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MM_MODULE) || \
+	defined(CONFIG_CLK_IMX8MN) || defined(CONFIG_CLK_IMX8MN_MODULE) || \
+	defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MP_MODULE) || \
+	defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
+struct clk_hw *imx8m_anatop_get_clk_hw(int id)
+{
+#if defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
+	const char *compatible = "fsl,imx8mq-anatop";
+#else
+	const char *compatible = "fsl,imx8mm-anatop";
+#endif
+	struct device_node *np;
+	struct of_phandle_args args;
+	struct clk_hw *hw;
+
+	np = of_find_compatible_node(NULL, NULL, compatible);
+	args.np = np;
+	args.args_count = 1;
+	args.args[0] = id;
+	of_node_put(np);
+
+	hw = __clk_get_hw(of_clk_get_from_provider(&args));
+	pr_debug("%s: got clk: %s\n", __func__, clk_hw_get_name(hw));
+	return hw;
+}
+EXPORT_SYMBOL_GPL(imx8m_anatop_get_clk_hw);
+#endif
+
 /*
  * This fixups the register CCM_CSCMR1 write value.
  * The write/read/divider values of the aclk_podf field
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..52055fda3058 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,11 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MM_MODULE) || \
+	defined(CONFIG_CLK_IMX8MN) || defined(CONFIG_CLK_IMX8MN_MODULE) || \
+	defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MP_MODULE) || \
+	defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
+struct clk_hw *imx8m_anatop_get_clk_hw(int id);
+#endif
+
 #endif
-- 
2.43.0

