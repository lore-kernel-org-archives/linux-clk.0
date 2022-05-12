Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF04C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:05:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356264AbiELQFT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356246AbiELQFO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:05:14 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9DC62CC9
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:05:13 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 4E2E15C016D;
        Thu, 12 May 2022 12:05:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 12 May 2022 12:05:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371513; x=1652457913; bh=Ed
        i9afV7xDVrYtJ2z1yf1EPj+UrrlUjmoXO0tDLI51Q=; b=Ddvf+cBK9LMx6S1tLu
        2StGTwZNPMbtDSjZyy4qRpBe8bCBXz/4wocyOtnCbX00HhvDPM39G0lv0cGwQKUW
        Lv5LFm/Xql09oZrzlWf5IppEYr1ZR1i9zmn+XvfIXtPgAThbGHQwW3IGYlt4juTa
        x79fpvQMMFn/tYY62kqAh4FGw5cGz4Xd+l7oWM7FxuyhdIb6ZlSwYEaDsS0fCzKI
        RTI6un919Cgw0TW1+InISq1O11Vn84hPBfV/WTkZ1SWnrFqavFpVSxf2yD4rYzod
        hh6B03qofMGCA6VJMcthvpXA0PPazkAWvhvCBsWLLllRayUqwJKxe2McLL6ZDO18
        dBeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371513; x=1652457913; bh=Edi9afV7xDVrYtJ2z1yf1EPj+UrrlUjmoXO
        0tDLI51Q=; b=icnPXQtM7a1YJsU3ybcjRRaYj8zgaS0Ahh/FMXqHG/W30eayfFA
        OXxvIqbZgtuIzrMam4tA3q8eZehvio2p/pQT1wAW+qo12Tdb5wdaza0zXqwwJ1eN
        7GHjAJO2zOTv8E0s2qIP1ObJxxvtuvx30FwbiUS2sZqrozZZ6bXOuIuKDv/wSnOj
        r1VFRLLSlKZZY8IJzKDB9IT1adFKDDCHstymcMUHCwJenKGWKj+PcnB0ErtM2Z1P
        /XI0KKgLP6SprF0WV3ZI1LD1Ku/BTgvPotsWZcgOOTfI37LR912UVwZ/pGlTOUhc
        o04Qac2B5odWoscbPr4dQqZgD0SYeHzTL0w==
X-ME-Sender: <xms:ODB9YhMv3i1uo5wxZ3DCFyn05LAmFmyJj08T5AHnTw6yrg4uFlKhUA>
    <xme:ODB9Yj85X00bA_h7hZ9qa4xMu0MaPGE-DInFDdY2KU5bdEOULY89JopHwxa7egd2_
    f3x_T8VvEYlaQ9AKMg>
X-ME-Received: <xmr:ODB9YgRSbt6cZfCupJ2ekHkclPmvZ9XBDJ-c2lFsQTxuqypeuiuLaiPFNKst-mdcNVvkw6k0qUjnprvVmyuxST8ZG_P2xztzs2bEJwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ODB9YtvvOyvX2JXRxuhBWFzVXlY8ZvWgIXd3F16jmPLI2z9LdcupTA>
    <xmx:ODB9YpemK4bvedufljL2nd-rUHhIBjh7Nq36ous6vHCBbdmyo7x2nA>
    <xmx:ODB9Yp00XF46ecRjunx2TyVirJwZOHBoos1t434OE1dZqzyccEeTEQ>
    <xmx:OTB9YqUMNRWBRqmPVEDSyOKK3zs-eglqYig75cW5qUuYJUcjs1VKoQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:05:11 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 26/28] clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d
Date:   Thu, 12 May 2022 18:04:10 +0200
Message-Id: <20220512160412.1317123-27-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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
2.36.1

