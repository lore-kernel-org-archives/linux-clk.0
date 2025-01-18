Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4D91A3029
	for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204073; cv=none; b=jgJ7Oo0iZaW3RVQ3drS/r8UMz+H3bsiHMY/YG6QwX7KD1LPWAyAO5dFhxklEkaEl5Ktic8fXkUnwF/fJI4W1oExPG7ZRHUUS65BPwbrEG5+NeUi4RC+C8kydublntauoA+418wSnTCktzuUj5oYlnFzvQ+hvJlHvJLfbv8urH6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204073; c=relaxed/simple;
	bh=9GxDbQvN0FsobifitL/iQ8hAJbEhDXi2QaB7Iaq7RJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDdgzeoUlUQPPdC0iiqThhebeWfHBo2SZbMblkjPmoyNgy2X87Uf26YcX+GZhLWNO90gpWc7gcyuLd9uxR17n6dhsgfcCnwSTbwJbvllJQxvle2lAmLg2Ck/oNZfAqF2To9zkjf1wQALeLoPiWF1boY7P/zo/f018+wIMrl9ZG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=F7qHzor9; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="F7qHzor9"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso501391366b.3
        for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204070; x=1737808870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjKk3n/EWVmeikEmbqzIG+MPD0szAgZhKNxV6SUP6YY=;
        b=F7qHzor94/ehWtC5r6Qe8VSuCkDL/s0h3JTdv3noA95FUs0TGeO3RhpQC8+BI+x5lh
         DcdupWHSzHK01kfPNRz7vvhM3hArChZ3t3SovSRrcNhx49iA2kmTTzQGn7o7e1Qr+a4I
         F+akRZuQW7HcQwyyTD67naMS5Pey/kXOrExN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204070; x=1737808870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjKk3n/EWVmeikEmbqzIG+MPD0szAgZhKNxV6SUP6YY=;
        b=c+DYEl6k8NeZ68feKEJsfkTouT3e1uOYaxAI0QprplFziH1ehR4p5EsWLkfbKU5zw6
         GchaRPgbCIloYAKRc1FURzZtK4sRv/YyK2FraOy3eEmvZ4lKnxjA7tPcDY5YM+WBY11G
         n5FaXH1xilrSk/x7yk7g0VpFf3BEm28uNP8Ha3JobHHefyCRtQkTTni7vu5R+rhD6E9J
         oCQ8Lssm1q5pvzqeLVtbo0QeS5dltwhuAnaGpaBbNOXtTNwvEQPMOQh3MO8hQ29sGQVS
         DJpUp5AuBb2KIlCa9CE8VI4g6CR9Ow+Z4n3wRd5Ah5iDKZSPfG9NlDG/g8OHWKaDcYo7
         pkpg==
X-Forwarded-Encrypted: i=1; AJvYcCUymHGYddvVELrx45ybMs0qyWs1IWVXGR3Y6lUEmXkOoXhbkwuyZWwAGgqY70UrjGYpFbkri9mXYFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfgRSb2bsNgFBFK9PAH9unao7wK+c5OhH2/I5/m9CCRsBObFPE
	ViiMhhg8l14rJnDBm0bdm+rB7UROJPOG3Ex6l2CZhBuAHruQGGYhYvPSEZ3yJH0=
X-Gm-Gg: ASbGncu+/aJ3MGIfmWvLNr7YB6ZN2r59kHHoIjeV53dbyo6zcfS+q6lGWs/LIrkw5OO
	Tc0KFzK5kygSSzSfXYWuQZB7tHRL8+/pq5y385C6NVztD605YvPyYjMs/UZ5nujncPKPXmyRzD0
	k6fGTXoXOfwxyZ7YIcbR9A5wSkMA69kqYD0CHNWq3SONyXCN+Thei4RKjLMcum4g4UIFIboMdRd
	gcz4nd34h44IFB/3jgdsLzPUtF13BjM0qi4DiwfDLqxqhVY7ZAZrQPXs4naPPTARVfdQZMOF4b1
	RziCJwzojOAE+SqgE8TR0bIgdc6aD0n2kQpRo/55ndTI1wXHDqSeWYenOMiNa4hd1qLHC0YEISA
	ipaSkXNmItqIpMQtpzZnFR4cfj6SNYNwHha8A
X-Google-Smtp-Source: AGHT+IG+E9QI4nYzoY+YN1QOMcP80jWKF/DOpc0bYiVCZW9BPZzE9/t7StCYdIbpqJGBKvVbQm3HcQ==
X-Received: by 2002:a17:906:c108:b0:aa6:79fa:b47d with SMTP id a640c23a62f3a-ab38b0b8138mr568616566b.1.1737204069853;
        Sat, 18 Jan 2025 04:41:09 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:09 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v9 10/23] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Sat, 18 Jan 2025 13:39:53 +0100
Message-ID: <20250118124044.157308-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
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
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan

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

