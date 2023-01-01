Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5FBC53210
	for <linux-clk@archiver.kernel.org>; Sun,  1 Jan 2023 17:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbjAAR5z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 1 Jan 2023 12:57:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjAAR5x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 1 Jan 2023 12:57:53 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5272705
        for <linux-clk@vger.kernel.org>; Sun,  1 Jan 2023 09:57:51 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id u9so62360295ejo.0
        for <linux-clk@vger.kernel.org>; Sun, 01 Jan 2023 09:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYenpSMBggNdY4dx5nVECKefdf2t/s6x5XpiG20A4ps=;
        b=X8CpvA46t2Qvqw7HL1QfBLBCNiBiZxDPmsHSv5qc5s48zDrioonv13L4/XbypOWl3i
         2ufzJE5cydbnR0u3pOCYq7IV52oOMKhAmmhNf1NqubD1xApVQk8ccod0Lgn++gT5GkVw
         mVqGLAT9PrhhMdxNp2UqwA3LMQkKlV6XoO5ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYenpSMBggNdY4dx5nVECKefdf2t/s6x5XpiG20A4ps=;
        b=iUnY2uIcdcYBcdWp8boBAsAxCLKDcSma5rv/8uFPjCi5tS/Xh6C7QDl1XlPj7W9eMS
         4xmcSXyju/Qdr/Cvu/i1bsA0Y9pRF6Ca2cYp9ADwALQWrwItto+HBDc2/gRZSW3vNIzQ
         4xmF7J/Ji8WJBzA+2WNT3bSSyGStMPPGK1JBMnYR/9I5g9bklwf23s8JibLFrX02aIUm
         MpUX2NH8dxLBV0/CGHCHVPtwp9NsT/nw6XS4rR6EsHtC2HzWl1SOC2t1NwZxU/c1boy3
         W+LhFBnboakT+SE5nFE1gik8VheLFFp69q+T7YmtnozJCMf/SXgVwPFRpXpyGv77ucVa
         LWxA==
X-Gm-Message-State: AFqh2krelnNuZh83RjcXbeQK4yM79x9Y8xI1l0tsORKXBLiBKcDIYSA4
        BI3uMDUbbM/mIEbxe8jA14Tgig==
X-Google-Smtp-Source: AMrXdXvn3vJvIv1wQy6RrMTKMnJ3SzyCAOx4ewyjlEjon+tOtvlCuJvAkPtjFoBXEHXlP0Tmsg7FPw==
X-Received: by 2002:a17:906:55cb:b0:844:44e0:1c5b with SMTP id z11-20020a17090655cb00b0084444e01c5bmr28639393ejp.12.1672595870140;
        Sun, 01 Jan 2023 09:57:50 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-80-180-23-57.retail.telecomitalia.it. [80.180.23.57])
        by smtp.gmail.com with ESMTPSA id q2-20020a1709063d4200b0082ddfb47d06sm12273018ejf.148.2023.01.01.09.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:57:49 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     angelo@amarulasolutions.com, michael@amarulasolutions.com,
        tommaso.merciai@amarulasolutions.com,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-amarula@amarulasolutions.com, anthony@amarulasolutions.com,
        jagan@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [RFC PATCH v2 02/11] clk: imx: add clk_hw based API imx_get_clk_hw_from_dt()
Date:   Sun,  1 Jan 2023 18:57:31 +0100
Message-Id: <20230101175740.1010258-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230101175740.1010258-1-dario.binacchi@amarulasolutions.com>
References: <20230101175740.1010258-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Clock providers are recommended to use the struct clk_hw based API, so
add an IMX provider helper to get clk_hw from device tree node name.

This is a preparation patch for the upcoming support to setup clocks
directly from the device tree.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/imx/clk.c | 21 +++++++++++++++++++++
 drivers/clk/imx/clk.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index b636cc099d96..6ae122ccd83e 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -68,6 +68,27 @@ void imx_check_clk_hws(struct clk_hw *clks[], unsigned int count)
 }
 EXPORT_SYMBOL_GPL(imx_check_clk_hws);
 
+struct clk_hw *imx_get_clk_hw_from_dt(struct device_node *np,
+				      const char *name)
+{
+	struct of_phandle_args clkspec;
+	struct clk *clk;
+
+	clkspec.np = of_find_node_by_name(np, name);
+	if (clkspec.np) {
+		clk = of_clk_get_from_provider(&clkspec);
+		if (!IS_ERR(clk)) {
+			pr_debug("%s: got %s clock\n", __func__, name);
+			of_node_put(clkspec.np);
+			return __clk_get_hw(clk);
+		}
+	}
+
+	pr_err("%s: failed to %s clock\n", __func__, name);
+	return ERR_PTR(-ENODEV);
+}
+EXPORT_SYMBOL_GPL(imx_get_clk_hw_from_dt);
+
 static struct clk *imx_obtain_fixed_clock_from_dt(const char *name)
 {
 	struct of_phandle_args phandle;
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 86538c990a0d..a0e6b8357eb7 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -294,6 +294,9 @@ struct clk_hw *clk_hw_register_gate2(struct device *dev, const char *name,
 		u8 clk_gate_flags, spinlock_t *lock,
 		unsigned int *share_count);
 
+struct clk_hw *imx_get_clk_hw_from_dt(struct device_node *np,
+				      const char *name);
+
 struct clk * imx_obtain_fixed_clock(
 			const char *name, unsigned long rate);
 
-- 
2.32.0

