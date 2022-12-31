Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BCCC4708E
	for <linux-clk@archiver.kernel.org>; Sat, 31 Dec 2022 10:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbiLaKr4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 31 Dec 2022 05:47:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiLaKrz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 31 Dec 2022 05:47:55 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C435FD8
        for <linux-clk@vger.kernel.org>; Sat, 31 Dec 2022 02:47:54 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id r26so28355012edc.5
        for <linux-clk@vger.kernel.org>; Sat, 31 Dec 2022 02:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LiLmCOA0Z19dwC3ajYydNnRTh+WZFHl0GJOC3Tfb7Q=;
        b=dpGsl32H+NNVcVtEIx85ju9cr7IPOJOUIB3kqId8lldf1S2UdBpejzWuX5tcYFMVkC
         SphizhvcFMKwotnjfF3ENAJyHrLnQOw1+cZsYrMbqnDe+d8tEmLIyZILWJetG6yFygEE
         pMEWbfKZYxwJNhExR13BT9opcQBihG3SXXY2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LiLmCOA0Z19dwC3ajYydNnRTh+WZFHl0GJOC3Tfb7Q=;
        b=vE50aT6uNqc9rvp4jyhelCC8QFZwNSjT6QiLqwvcWXtPVqRT2fwyN/+L3UDUGmrG37
         TMZdeuGwjgIdA+4f01Ownxqgx63UMkmMfZ1meKf2rVRIAWetw61wqOZtLVUxA3zIELFc
         hpl0Uxt3Jyu6vVaxtHvzBCnnxcGCRDp+P7h1kq0aSwa1IuTBm79VJdFaPnNROjbDJaTH
         NDBZsJfmA6L8HU3cI919UVK5O48qbhrmM3kVNUSEWQ+h3k2KctZCMEny4zU3RX+s5Cxv
         9kkkIj6SJeP1nkuZWlEUDXXMlptUx/lHxS1eB3wUqyfti2eZTSl7wZGLhGq1a9ngmMhf
         N0Rw==
X-Gm-Message-State: AFqh2kp79gPS5GZIj/1JSBHARIOEul6Fayw04YKVD3Rb42t63W4CI1/T
        LYkQEp2ID2oOl8P/fjR/k8LR3g==
X-Google-Smtp-Source: AMrXdXuh52WUWq6kR8l8ZywR9zEG9r0GqDzyIKcqeFwzq4G9eJcKVr/9ag8SH66WV0CFa3iTrqZ9Kg==
X-Received: by 2002:a05:6402:f05:b0:45c:834b:f28c with SMTP id i5-20020a0564020f0500b0045c834bf28cmr31100958eda.9.1672483672554;
        Sat, 31 Dec 2022 02:47:52 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-80-180-23-57.retail.telecomitalia.it. [80.180.23.57])
        by smtp.gmail.com with ESMTPSA id z4-20020a17090655c400b0083ffb81f01esm10765438ejp.136.2022.12.31.02.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 02:47:52 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     tommaso.merciai@amarulasolutions.com,
        linux-amarula@amarulasolutions.com,
        Chen-Yu Tsai <wenst@chromium.org>, jagan@amarulasolutions.com,
        angelo@amarulasolutions.com, anthony@amarulasolutions.com,
        michael@amarulasolutions.com,
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
Subject: [RFC PATCH 02/11] clk: imx: add clk_hw based API imx_get_clk_hw_from_dt()
Date:   Sat, 31 Dec 2022 11:47:27 +0100
Message-Id: <20221231104736.12635-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221231104736.12635-1-dario.binacchi@amarulasolutions.com>
References: <20221231104736.12635-1-dario.binacchi@amarulasolutions.com>
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

