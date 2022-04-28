Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F81C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348985AbiD1Qry (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350323AbiD1Qrw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:52 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8AB7B2477
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:37 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 52DAE5C015B;
        Thu, 28 Apr 2022 12:44:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 28 Apr 2022 12:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164277; x=1651250677; bh=YF
        nvnTJokjh0AZW766jeyzPPfS8eHjQlo0wd8vAvevs=; b=mRzHpl1Z34BK9V/FVo
        Lr1xJUBUfdgG2h9LC3926g4ZF4Rsd8ijSzPTwNpYReP48cSJdNPJUDbfNYgXNcV9
        axrE4cS6PGA16/lDNg+R+eYxAoaAzJCJh5/BzSNSUN1bU9BkJjazceR1ggiRBIBF
        GmSaWx2c7UEbiafGM3OnkIOzIJ9f/TVvYnyxaORUDVR8Xi3X23ZVIJqlrqOBOFW5
        Xi+rJe9ZknCQlaVQkHLzcHPN/d9wDp6wSAKBO4kZjysDpTA0UwMePQLY2O8qO/Bh
        acVf6E/Ms9XQ+fkSihVQSVnIwB46zGhMQaGXK1P6ogDHUgdyA4IJxZ4KDrBOeXsO
        w/ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164277; x=1651250677; bh=YFnvnTJokjh0AZW766jeyzPPfS8eHjQlo0w
        d8vAvevs=; b=Xbv2cY7+oLbtBIF0KQN03PmGXb6EKAHux7VxtuWz53FEQQHOfky
        FXw6n1hg9GcTG+pBrqvlYXXRtCKrpRjPPXo//jkUc7kKPBjTV8lTQhKCcGgEhgM7
        5hpy+P0cuLot4mP3/PAowm12LRdS2tJMgIOQYiui61R3lof+srA6SFbDL61ugZEo
        mr8OkoGOAo9Rp6i8v7NGRkUTmg5K74/2DuFgT2+IR3A6fPJDFfJgeq6bS7+3E2yt
        n17Y6HiRDiaDpG9AmNUEhlO6zTCK2JnNei5bCx77HFDOKiWjhFFF0t7Zj2QYNhHB
        CTSpp2nO18g7A1S7mD8YXrpFQpDM+lEOXQA==
X-ME-Sender: <xms:dcRqYo5XYI8muXhUPM0LesXwt7ZDazgcslW6cSi51KvERgHD4zHR7Q>
    <xme:dcRqYp73jL2SwqEnU4WqUbG52O85tzMQq5D3QHldVFt82gcnRCN8rzBf3RfPTDdvu
    XVXkhFEyN_unKADOis>
X-ME-Received: <xmr:dcRqYne6hZw9_Z81u_WwanAUCxaWrCjOXlOHCudb6nt2JYJxa6GePtj58M8Hhe-lMJufeUCQcXqLO9U_5moGuGJfXxTUp0u2JWkqYYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dcRqYtK6Die1ezEgMPximYPFQ6m43VPIlks1S_amYv0edCY6kYO-oQ>
    <xmx:dcRqYsL7-W6R1dSxHjrbSwFQ-Y2R69fDuOP1Xh4Xb5yZpe1TdnKlBg>
    <xmx:dcRqYuwZX6zJjhfFpOUdgQf_UtII_yR6Fm6Y9D1LwRpT1DTb2ZJhAg>
    <xmx:dcRqYpACv4Wiy1cZsp6zOOVu_KHcX1GgY58x8IuJYxA75tgTdZPUXQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:36 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 26/28] clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d
Date:   Thu, 28 Apr 2022 18:43:36 +0200
Message-Id: <20220428164338.717443-27-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gfx3d clock is hand-crafting its own clk_rate_request in
clk_gfx3d_determine_rate to pass to the parent of that clock.

However, since the clk_rate_request is zero'd at creation, it will have
a max_rate of 0 which will break any code depending on the clock
boundaries.

That includes the recent commit 948fb0969eae ("clk: Always clamp the
rounded rate") which will clamp the rate given to clk_round_rate() to
the current clock boundaries.

For the gfx3d clock, it means that since both the min_rate and max_rate
fields are set at zero, clk_round_rate() now always return 0.

Let's initialize the min_rate and max_rate fields properly for that
clock.

Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/qcom/clk-rcg2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index e9c357309fd9..523f9830321e 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -868,6 +868,15 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 		req->best_parent_hw = p2;
 	}
 
+	clk_hw_get_rate_range(req->best_parent_hw,
+			      &parent_req.min_rate, &parent_req.max_rate);
+
+	if (req->min_rate > parent_req.min_rate)
+		parent_req.min_rate = req->min_rate;
+
+	if (req->max_rate < parent_req.max_rate)
+		parent_req.max_rate = req->max_rate;
+
 	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
 	if (ret)
 		return ret;
-- 
2.35.1

