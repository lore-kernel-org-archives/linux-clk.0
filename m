Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0171F8F1C
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318672; cv=none; b=MmC3gzs0dsRg1TtVpAJStz7/iPIpi7z8kwcm17dEddMkrP6IY2DHwKAu+WEVOTOGjaioRYU+PuIaka4dXMEvcgEFLthoTsK1V0Hapx5QCSCR4TthByShm/VdNyIigjTmsBq5Cr6sPbSfTJL01b5T01hWcuF+hV3EFs0L++VnZfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318672; c=relaxed/simple;
	bh=eGGs5xBoZ9eIk/QkKyhkODa3AXPAFwKHvMXYA4up2l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bb3/KmM5/T0dCcUbZlyBboPof6bCtpGxVNoHWAUxMEaa+h/Vlo1+K7HFZuzQ79iaydXhE1SrqLsDRV7OlJA3+ZV2oj9U1+DJXb4/VDZCNl79J9RkQovfAHRUGcaAE5Y3RXA0eKny3hsufC+dd7sKQdxyW4yGP3AzlbtMxs2rST4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Oc3AoBpg; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Oc3AoBpg"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so306550466b.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 08:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318668; x=1735923468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2b1DvWsKR3kWK9JNfXRovoEHigCoxQCmQlYrGVfIyUo=;
        b=Oc3AoBpgeOMEPTyUxa0AFyb5UnHHFuorAJMiM1WzbwyQYadlUrpjp7frBM67J17Koy
         yEOLtPKQggh0m9UQ+agVUoabDAtAGWzNQG/B236WqcnxS+kEJCyVZk+3QkhlBpaa+AxJ
         IkVi7hhFPNzcdLV9CS2X8CiHUGHrkUiSTQEXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318668; x=1735923468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2b1DvWsKR3kWK9JNfXRovoEHigCoxQCmQlYrGVfIyUo=;
        b=S735hyw8F8ATiqfkUtkX1nnn7/Pg6PGJPh/pZLvHa4VsxzaU4mxa15Th0CE5pnOMvh
         GtcYt1HuiTROku+iGkGczLRqDB64xtHzGqkvh574TuQR4oQPTIHxQ6hQc/6ed1XeOSGK
         XLDThsi3J1t1n+Y4SseOmtM9+RC6kwvY/su1zIrMx8QHbTZbAJMEp8wqI2zI09rwp0UU
         qipKCLy7BWE7kNn+gBOsgu9cHFO+oggMmVIaYanzMl3C1hthMRos/8P1n32U1vug56Cu
         HJQKW5nmLgEqUCJF18ItR1MbnLhA5543TQ304Fzm/4cIQvJkSDwKMjIObnao6GmMDi27
         l/oA==
X-Forwarded-Encrypted: i=1; AJvYcCXfipP4mZ6pkLizzCOrl8ezJyFEREceJ48qEKeSZDQ94gJmVVXjkR1Gc+T8dNKnR6eIvpIINoeWPWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEMrNPL3tiXqOUeFssY6O5u70E/nxQAhzVTW/rXCvmyVHp+Hrh
	GdbPNLgHMHi7h6RpPd3Vwc20uObCxAsuEFyL5s0GfFXPHOViz+SYz1Fy8LMl2Eo=
X-Gm-Gg: ASbGncvfzQ+e98D0xfPmWK+4ppAMiwKoBoRWcYVzkGRQ/rigL3ICBWQgrbwbXnWNhDh
	AXC9dhwCRXQ2jmvSXTYpGJGg8MIjBeouJzkLwH/IeXYwc8M9LdOzQIhOtXMsymQWodj18CfmRRf
	RYQ5gJ1Wr5Ar4jBx5go3Q/hVfiAEQSOrNWhn2Pd/oqTi3uZglbFoFPj1wYlPsdrUG3FONHbJocc
	V3iIA9nyEMlblBLb2BYjrVqSEDGpxnwgMVh5N27mgRZ4VbO3KC07GxgtK251vDBuRwl8WETE3/R
	uJNaq080lPGprkDDaKjjEQ==
X-Google-Smtp-Source: AGHT+IFdtsrBznelwwJuBM0+oIFuAtsVZztgwfPwBkxRjqySUJIDbs8HNHC7GQMygSlEz9WnVs+UvA==
X-Received: by 2002:a17:907:704:b0:aac:23db:af61 with SMTP id a640c23a62f3a-aac2874937fmr2719500066b.3.1735318668380;
        Fri, 27 Dec 2024 08:57:48 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:48 -0800 (PST)
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
Subject: [PATCH v7 15/23] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Fri, 27 Dec 2024 17:56:18 +0100
Message-ID: <20241227165719.3902388-16-dario.binacchi@amarulasolutions.com>
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

Get the hw of a clock registered by the anatop module. This function is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

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

