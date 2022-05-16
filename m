Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC11C43217
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240349AbiEPN2C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239177AbiEPN1L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:27:11 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD64289A2
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:27:06 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 940D032009B5;
        Mon, 16 May 2022 09:27:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 16 May 2022 09:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707624; x=1652794024; bh=Ed
        i9afV7xDVrYtJ2z1yf1EPj+UrrlUjmoXO0tDLI51Q=; b=A6BqjqMvGKoGDj0lFZ
        K4gwVx0b4H7OzZkiK9Hokhqr+iVp7C1aERZPyxxXoTf4ABQJ8iKT7jF/hdT2vKlk
        LqvSnjOeY+yb1zMLqnH9pNXhcEgXGnD3e84P3LydsohJIm6WBzWHO8uTwNandg6Z
        VEDbsgKzy6qT+onzJnVtHfVmVFoqAT+rAt6nq8KdqW7a2OB/koMDXm/gpSmu795V
        exVThj7v6IiMKdjef6X9LPP1skwjBMEOrd2zXIwtVMm1L+ABOFpTNYFKj8pVv95O
        0G/vXS+cHk7een3ZSp8myj4As3MtYDLcBvzlDy9EGYw3Wq4AGqpjzq4blmFBpz0l
        TXuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707624; x=1652794024; bh=Edi9afV7xDVrYtJ2z1yf1EPj+UrrlUjmoXO
        0tDLI51Q=; b=cokUs19nXF09wgCT9qfU4cKd4TKbHWqQgKfviGBRb6vUz88jExi
        CwsDJaayPsZ0dA8bTojV3GyEzs7Nm41RVO39v46TUVtbLIXsanefb/m1Ncy9OHjq
        xQhDmcKhw1hzxseTB0Jkw9ufyduNrA1aACSr0atKL5rPN28ZIWT5Wtd9/AuwPeOb
        YZ4Pq1m48/GWIK2Y5zHsbtdkqkG6tU8h9s02P5vD+Wri5fylvYOoj16yGOr1YCc5
        ejH9NermKKAOI3Fvm5jHUmG8T3TYOfvF44ROS0c8sd/UdCtMccwYppSav6s49HWp
        iZL/dI0LzRSkz4MUFNsgmA1hSTwIWJmwNUw==
X-ME-Sender: <xms:J1GCYvNc6DHcKVqKz1W9EcEJ7k4OcNXIp8QlLH-jPahbc82ldUCOUQ>
    <xme:J1GCYp8BbLVnEMVrbGpCywtOTmgdArnONe82P80QOwcOtWKDnYUS-ZNHFIMYbZ1Pz
    TSGIrEVCljp9vjwZZY>
X-ME-Received: <xmr:J1GCYuTiZaBw6QaIcp8-ZgJTYK46Sp26bVMZ-VP-VCTxxWEENC9f2IGQDaOMz1Myi-f6DhFvkhmVPWEXkxAZXvUsBsGLRuKDnIM9KPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:J1GCYjvfTfyFUZinDmxcCw_jEH3POsMB93Q7IxYpXedmCyRB11ey7w>
    <xmx:J1GCYnfSXpTVX5uWyT19l2vvPVVM2JlDSoQ_2OpCeXNCT7GcsaXjbg>
    <xmx:J1GCYv0iERaUBT2ebrqwmCo7QrHxx8-l4ayT830Vt63iFh7okJziAA>
    <xmx:KFGCYoXwCvgxOjPYt4RijdTHnBvSlcO3tqwW9X2vrMvIlcEaL2WlIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:27:03 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 26/28] clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d
Date:   Mon, 16 May 2022 15:25:25 +0200
Message-Id: <20220516132527.328190-27-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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

