Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE33AC77B75
	for <linux-clk@archiver.kernel.org>; Wed, 19 Apr 2023 14:23:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbjDSOXu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Apr 2023 10:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233005AbjDSOX2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Apr 2023 10:23:28 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DF6C16E
        for <linux-clk@vger.kernel.org>; Wed, 19 Apr 2023 07:23:06 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id v3so4173002wml.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Apr 2023 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681914185; x=1684506185;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/XcbEMF2wS+NEiOe1W+U7oicROXrfzxaAv5byhv5AaM=;
        b=PcOAtQKUXeuQXgP4RP0Npp16jyTJYWyIpDecFJs2Rc50CfnD4cKH19lAt/x1AYm/SM
         a/p3UimpCwrzD+dmnP+tK+9sadz+jSAB9jM+OSFW2TJgXIgRa7ROTNpB4Pal2ArWD00l
         eefvEWQzWNQTqawLq7ujoDx9egy+HiBtI8vlppMGYWc4w+ryB2IEM13fDyzfeaDzdbpI
         PauWnpRu5RZ1ivOIt7tnxNkmRHJhTd3uXu3LUeinzP1UW77W8J/WoW0MwZfTr6g8pfuu
         uw8A6adglv6YPx2jO30lnuvuRr5oJeP54dltCO5wSVzRVFF/iWpr1++Fup6UNOrDGB3w
         8zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914185; x=1684506185;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/XcbEMF2wS+NEiOe1W+U7oicROXrfzxaAv5byhv5AaM=;
        b=P2S20nukF+JS/dOWRjfIoA+6MJpMHfVP8I5uzHGhjD/wAIPFPIUJHTkLNW3cciDpHD
         WieDEOOMUaA/PHhDP9YTxGbc8nfNjaZm5OmH4RT7MsmhBzufvRLVMrcwQho8le0KYPIL
         m+xlMPLOT+CCgk48nDfY5tpLb9TvQnRzEGLXOEJGlnvDVxUNnJK0a0HLKSKADS/dDf1u
         3ppc9q6gpzKH6i9q+DW/cvD0kLpR2h9J8qFIJxzxzrJhE6CpUZRmyfyHTqB9hRgRSxvI
         YQ50QWIHUhCdIrlJBZ6LBKZRCIYu7aiqHoQRc2DyQTO2F7rc0geG03s5HqI+DDypakcw
         J7AA==
X-Gm-Message-State: AAQBX9eGGNPNdIFftdF68X4N5xC3w3fKv9OlonbhNlD3ekQjAV6AJ4wX
        VYZIIOUvSoq3/mIw07bSLsaKnA==
X-Google-Smtp-Source: AKy350b1WMulog8jUcFSnfvv3joSXcZ4nJGc5I/rUk7fB5Yu5Dj/J1lBRuTlRNJ+wGAKXKJuYJ4fig==
X-Received: by 2002:a1c:7c03:0:b0:3f1:7a50:dd66 with SMTP id x3-20020a1c7c03000000b003f17a50dd66mr4782095wmc.27.1681914185353;
        Wed, 19 Apr 2023 07:23:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d10-20020a1c730a000000b003ee63fe5203sm2303590wmb.36.2023.04.19.07.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:23:04 -0700 (PDT)
Date:   Wed, 19 Apr 2023 17:23:01 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: imx: scu: use _safe list iterator to avoid a use after
 free
Message-ID: <0793fbd1-d2b5-4ec2-9403-3c39343a3e2d@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This loop is freeing "clk" so it needs to use list_for_each_entry_safe().
Otherwise it dereferences a freed variable to get the next item on the
loop.

Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/imx/clk-scu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 1e6870f3671f..db307890e4c1 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -707,11 +707,11 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 
 void imx_clk_scu_unregister(void)
 {
-	struct imx_scu_clk_node *clk;
+	struct imx_scu_clk_node *clk, *n;
 	int i;
 
 	for (i = 0; i < IMX_SC_R_LAST; i++) {
-		list_for_each_entry(clk, &imx_scu_clks[i], node) {
+		list_for_each_entry_safe(clk, n, &imx_scu_clks[i], node) {
 			clk_hw_unregister(clk->hw);
 			kfree(clk);
 		}
-- 
2.39.2

