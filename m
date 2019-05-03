Return-Path: <SRS0=gieW=TD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C304EC43219
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 21:22:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92D5A20645
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 21:22:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ywbl7kJH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfECVWX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 May 2019 17:22:23 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:32802 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbfECVWX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 May 2019 17:22:23 -0400
Received: by mail-pf1-f194.google.com with SMTP id z28so3501116pfk.0
        for <linux-clk@vger.kernel.org>; Fri, 03 May 2019 14:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AZfe6Xnlp8VFcttQXUP5Y4s8do4K2Dab61b+eO+6utA=;
        b=Ywbl7kJHsqNmfa+P0RIOnALkQVqOBZ3rOjAKRARApKe6qorHXO9plEnJ/E6KwmYq9p
         zZLP1ryFyIwSpDYvxAgWBdgSVsDbm8/Y40/VsTq7CjRlcbtLl6TmN18VUjgl0m4+nbGn
         Y+IoChQEJB/RlVWi/5OUaY6N6KwVRUrqKLgH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AZfe6Xnlp8VFcttQXUP5Y4s8do4K2Dab61b+eO+6utA=;
        b=VTvgcqGmEdd2CbeWhYxk+TONNQDmVUGjSpGZmhNMi22EvDUxTfcADfuRaSf7MUvl/+
         UVWoVADd3ksu9039G9Fe32oWQGBwf4ViGnVE5J6vFeK5j866ICI1PQUj5KkcjnS4sjPJ
         Na89rrmsU0N2VCRd7vv1RAdJ7QQ3XEGnBOywTjKQTl9gHKJ7SaYbZT9rMjT0eyfDcJzg
         gbvO66qClT5p7wI1POZZ7jBUFH3t3y6W1MYTwKhX/4/l/kQqvCtFTn+MCy+uOsfwGT89
         vWLTL2HI6ivmCrfMcG43S5pS31AxAY+m+8+kHWCp9cGWZAV8yzFrE7O8QNOqqMDWyThy
         qwIg==
X-Gm-Message-State: APjAAAVDm2g3FdFW3PNiyuhRfbs6BpXVdrgbFZaqpVg9gvogSrNSBECr
        qOXnG0MwtnEU2SxlFXhQ+DIWpA==
X-Google-Smtp-Source: APXvYqxHbkpyVU3AFiwBC4zYibpjEWUdOnTxjcv/gquMISFOa13IJ3gYibHW3sbdWh1EyzOUBzcDlA==
X-Received: by 2002:a62:3501:: with SMTP id c1mr14483708pfa.184.1556918542223;
        Fri, 03 May 2019 14:22:22 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id b77sm9206722pfj.99.2019.05.03.14.22.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 14:22:21 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Heiko Stuebner <heiko@sntech.de>,
        Shawn Lin <shawn.lin@rock-chips.com>
Cc:     hal@halemmerich.com, linux-rockchip@lists.infradead.org,
        mka@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: rockchip: Don't yell about bad mmc phases when getting
Date:   Fri,  3 May 2019 14:22:08 -0700
Message-Id: <20190503212208.223232-1-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

At boot time, my rk3288-veyron devices yell with 8 lines that look
like this:
  [    0.000000] rockchip_mmc_get_phase: invalid clk rate

This is because the clock framework at clk_register() time tries to
get the phase but we don't have a parent yet.

While the errors appear to be harmless they are still ugly and, in
general, we don't want yells like this in the log unless they are
important.

There's no real reason to be yelling here.  We can still return
-EINVAL to indicate that the phase makes no sense without a parent.
If someone really tries to do tuning and the clock is reported as 0
then we'll see the yells in rockchip_mmc_set_phase().

Fixes: 4bf59902b500 ("clk: rockchip: Prevent calculating mmc phase if clock rate is zero")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/clk/rockchip/clk-mmc-phase.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/clk-mmc-phase.c
index 026a26bb702d..dbec84238ecd 100644
--- a/drivers/clk/rockchip/clk-mmc-phase.c
+++ b/drivers/clk/rockchip/clk-mmc-phase.c
@@ -61,10 +61,8 @@ static int rockchip_mmc_get_phase(struct clk_hw *hw)
 	u32 delay_num = 0;
 
 	/* See the comment for rockchip_mmc_set_phase below */
-	if (!rate) {
-		pr_err("%s: invalid clk rate\n", __func__);
+	if (!rate)
 		return -EINVAL;
-	}
 
 	raw_value = readl(mmc_clock->reg) >> (mmc_clock->shift);
 
-- 
2.21.0.1020.gf2820cf01a-goog

