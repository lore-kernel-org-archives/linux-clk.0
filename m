Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1540FC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 17 Dec 2021 15:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238502AbhLQPzu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Dec 2021 10:55:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235133AbhLQPzu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Dec 2021 10:55:50 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730D6C06173F
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 07:55:48 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id z7so9413016edc.11
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 07:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7755/oSm9xb3xyECSk0fLF9ekbC+MSg548pl7mm+dvs=;
        b=PM52FyxxKrfr/YfvOpCGnn5QuSEdpLGLGAhIIZ+rf917QjULuP+7ypuzS7SziIy+LU
         7DfuYuYmD3hwKC61MUpVCDa4Pr0ugi7yfEiGfWfok0H6kQLHM4XPOkGbjl9vL4zuFVri
         0OK2jLHMthBDAFekKONF33uJjMzXKgpWdKbng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7755/oSm9xb3xyECSk0fLF9ekbC+MSg548pl7mm+dvs=;
        b=7027Kyndf3QSSPXlrGYmanBSYcsipP0CSRX4LjffbPalU6l9+AydvfXT2WzrVXZWfB
         0Ghoq1Ri/fm3QggLpwr/zARIF6a7sDaVseMhgAQ8Nu+I+cNluYVPMT7tXAVisuZnRmHR
         Nxskg1/uTFdWjjHFT5Rj3oEokWV3TyiiS4LyH3eQmcQggj4F5hn7pb5IAWhNEGoBhq8x
         7Kd7GY8vNjnL7weS9uYUrprBREe6J7wNTuz7iLtx2+mB2RcviCf4EmIa3dCQyP+1JIkV
         vV4XW5tQd4p9R86oYhjLKrctiXmDlveA7qbS2EbnWobA8Zn9KLW01yB8sspxHHdCVBhe
         W8lA==
X-Gm-Message-State: AOAM533bluGHLr2DE+JKjdyF6TKxaoKnJjTOji5muIFs8u6DdQO0o/Ii
        nnD1gS38+RUB5DEEMjYkQU5/TQ==
X-Google-Smtp-Source: ABdhPJyMTZOZAd1aoaZIc13FzAy0XfeTkk3umcmhxcsYykPFbkE0P11xR7Nw0c+6k+Tpb29X2PNzlg==
X-Received: by 2002:a05:6402:42cf:: with SMTP id i15mr3431756edc.82.1639756547043;
        Fri, 17 Dec 2021 07:55:47 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-79-56-50-241.retail.telecomitalia.it. [79.56.50.241])
        by smtp.gmail.com with ESMTPSA id i6sm772158edx.46.2021.12.17.07.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:55:46 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Michael Trimarchi <michael@amarulasolutions.com>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [RFC PATCH 1/4] clk: mxs: imx28: Reparent gpmi clk to ref_gpmi
Date:   Fri, 17 Dec 2021 16:55:09 +0100
Message-Id: <20211217155512.1877408-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217155512.1877408-1-dario.binacchi@amarulasolutions.com>
References: <20211217155512.1877408-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Michael Trimarchi <michael@amarulasolutions.com>

ref_gpmi is connected that is sourced from pll0. This allow
to get nand clk frequency to handle edo mode 5,4,3

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/clk/mxs/clk-imx28.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/mxs/clk-imx28.c b/drivers/clk/mxs/clk-imx28.c
index 62146ea4d5b8..9e0b9f8e5885 100644
--- a/drivers/clk/mxs/clk-imx28.c
+++ b/drivers/clk/mxs/clk-imx28.c
@@ -243,6 +243,9 @@ static void __init mx28_clocks_init(struct device_node *np)
 
 	clk_register_clkdev(clks[enet_out], NULL, "enet_out");
 
+	/* GPMI set parent to ref_gpmi instead of osc */
+	clk_set_parent(clks[gpmi_sel], clks[ref_gpmi]);
+
 	for (i = 0; i < ARRAY_SIZE(clks_init_on); i++)
 		clk_prepare_enable(clks[clks_init_on[i]]);
 }
-- 
2.32.0

