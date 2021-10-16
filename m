Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4699FC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 16 Oct 2021 10:50:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C98B611C1
	for <linux-clk@archiver.kernel.org>; Sat, 16 Oct 2021 10:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233698AbhJPKwz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 16 Oct 2021 06:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240224AbhJPKwy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 16 Oct 2021 06:52:54 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33EFBC061764
        for <linux-clk@vger.kernel.org>; Sat, 16 Oct 2021 03:50:46 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id o20so30992607wro.3
        for <linux-clk@vger.kernel.org>; Sat, 16 Oct 2021 03:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q3fjNw/uIiZ1iZQha9AAPt0gCcnrfa8BFTEL0pZp6Uw=;
        b=ftVTzlYcSB2v30CC73pTNYHGaapy/0gsXJcLZTI2R/EoFIUUMdv4kgeglT2JMmdGEK
         6Ysw/+yGYZIrqdFMb22TCFgelODQqcgTia4TTLzBUvQMStIV9SvgnPGgR/UJgM83Wz5X
         27g5eObaXtRdl514+w1aFIhLvcrIsyOjI0s/2RiwDmVtOPIAhHtbHFfrnpv0u9Qf37CA
         q3nEDZZ5L8+xcLH1cbXjvliO0MkIYtDTd5wBkV+s14+fzgqc34TzpvZRacY8WSMbYuvR
         shDGFLuo/duFQ4PD+jaSi6K7P+ah1zTy4eQKmH36bZ+w8Ds6UsK676nkJCbZszbhdDmU
         lh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q3fjNw/uIiZ1iZQha9AAPt0gCcnrfa8BFTEL0pZp6Uw=;
        b=tLkfAjCCI/c9oOn/mmMw4drL24DayXivexQ/Zy9zn1l4/Jlia9J1idIUndv4m7xm7E
         R4sEOJoJdL8PBlG84YnBE6k8/6qKpw1+/EPDUzbCbmLWAch0GJ2Li2AWQnzhaVVVRH1M
         aDgOqvm8cTn8Xh/FV34b+iyvHqZKlEIbYcdBY/Q//dslmxwyNs6Co6desIBozGBR/GDp
         0Rjdp0ZRd+XletqZYypELsXW/TSDrBP6T3p8RHH9wAhL3ZXSRXn3R0BFeUO6ypBbk7h+
         XYBOKUKd+m6eEsoYdWFF89MHqZT2rJ3LVedcfdve+Z/Gzq2n2L+WHRsKiAtecxc+YGSf
         ge8Q==
X-Gm-Message-State: AOAM530JT0W9cENxsgOcN6R/1VIw34B3CI+BEgoeruZo4D1Lx9GzyHEI
        ixJ++CspgNe1SmFXLGH3nsAWKjkxg0g=
X-Google-Smtp-Source: ABdhPJzUeugtSeRGKHJ5hiaXwxj9oetEbIxIDYUw9yOFwlrFQv3DDW6DYZqA7xuBWITvLdzaiPF23g==
X-Received: by 2002:a05:6000:1864:: with SMTP id d4mr21248782wri.345.1634381444388;
        Sat, 16 Oct 2021 03:50:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c22-7b82-9800-f22f-74ff-fe21-0725.c22.pool.telefonica.de. [2a01:c22:7b82:9800:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id d8sm7415796wrv.80.2021.10.16.03.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 03:50:43 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-clk@vger.kernel.org, sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, knaerzche@gmail.com,
        mturquette@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH clk-fixes v1 1/2] clk: composite: Also consider .determine_rate for rate + mux composites
Date:   Sat, 16 Oct 2021 12:50:21 +0200
Message-Id: <20211016105022.303413-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211016105022.303413-1-martin.blumenstingl@googlemail.com>
References: <20211016105022.303413-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 69a00fb3d69706 ("clk: divider: Implement and wire up
.determine_rate by default") switches clk_divider_ops to implement
.determine_rate by default. This breaks composite clocks with multiple
parents because clk-composite.c does not use the special handling for
mux + divider combinations anymore (that was restricted to rate clocks
which only implement .round_rate, but not .determine_rate).

Alex reports:
  This breaks lot of clocks for Rockchip which intensively uses
  composites,  i.e. those clocks will always stay at the initial parent,
  which in some cases  is the XTAL clock and I strongly guess it is the
  same for other platforms,  which use composite clocks having more than
  one parent (e.g. mediatek, ti ...)

  Example (RK3399)
  clk_sdio is set (initialized) with XTAL (24 MHz) as parent in u-boot.
  It will always stay at this parent, even if the mmc driver sets a rate
  of  200 MHz (fails, as the nature of things), which should switch it
  to   any of its possible parent PLLs defined in
  mux_pll_src_cpll_gpll_npll_ppll_upll_24m_p (see clk-rk3399.c)  - which
  never happens.

Restore the original behavior by changing the priority of the conditions
inside clk-composite.c. Now the special rate + mux case (with rate_ops
having a .round_rate - which is still the case for the default
clk_divider_ops) is preferred over rate_ops which have .determine_rate
defined (and not further considering the mux).

Fixes: 69a00fb3d69706 ("clk: divider: Implement and wire up .determine_rate by default")
Reported-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/clk-composite.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index c7b97fb0051b..ba8d4d8cf8dd 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -58,11 +58,8 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 	long rate;
 	int i;
 
-	if (rate_hw && rate_ops && rate_ops->determine_rate) {
-		__clk_hw_set_clk(rate_hw, hw);
-		return rate_ops->determine_rate(rate_hw, req);
-	} else if (rate_hw && rate_ops && rate_ops->round_rate &&
-		   mux_hw && mux_ops && mux_ops->set_parent) {
+	if (rate_hw && rate_ops && rate_ops->round_rate &&
+	    mux_hw && mux_ops && mux_ops->set_parent) {
 		req->best_parent_hw = NULL;
 
 		if (clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT) {
@@ -107,6 +104,9 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 
 		req->rate = best_rate;
 		return 0;
+	} else if (rate_hw && rate_ops && rate_ops->determine_rate) {
+		__clk_hw_set_clk(rate_hw, hw);
+		return rate_ops->determine_rate(rate_hw, req);
 	} else if (mux_hw && mux_ops && mux_ops->determine_rate) {
 		__clk_hw_set_clk(mux_hw, hw);
 		return mux_ops->determine_rate(mux_hw, req);
-- 
2.33.1

