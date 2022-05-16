Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381B7C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235654AbiEPN1N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243394AbiEPN0r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:26:47 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8DA27FE5
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:26:44 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 15BFF3200997;
        Mon, 16 May 2022 09:26:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 16 May 2022 09:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707602; x=1652794002; bh=ol
        /21gC41IBHmFEPHuBusKIt/4fGmF0WWmjLNmMAuWY=; b=Grz5kS/4P4lDj344/z
        qWTRW/AMW4ln981n05L92xye5zrIu4KYxY6Maz6zJWUm+kqztOV7YmarAB8lbNyP
        UCUFLArjz6wLOkvVhNJ+5GujqYzmF9RStpYVTuBZSuO5j9Q4VzJTwNqfZvtLlsV3
        H5/Ebpq0H91jurwFWcWfJxqRgaTDgZ3EYFcH4YuosDVtz8xbkQewkep/yBgT4Yf4
        jA6giznQvRb4OoC70sceyIYZf9Yz1tJu+HmPjfIPkIhEleq6LTetlCUfTuNgLKMm
        ksj2U7sPCQ6C7M8LU3sVtxDGxhnQsOmA2pHBGHQ1otxC84MLbeFSXJp9wxApIUKf
        meZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707602; x=1652794002; bh=ol/21gC41IBHmFEPHuBusKIt/4fGmF0WWmj
        LNmMAuWY=; b=Nl9yiVCkr7rjHK0BoOxOqSaHlPjoFdY95yqsAuWQ5nLK+GSshxB
        5F43M2MBdKEUxYjXrvz7FBAEgX77v/x5bXPZsq8R28kdHo8PMIZIfX2K1qh+T1ZJ
        31pc/6fRf6fU2cvs6RT3wJoDBuyyPUYqG/GeLm9JdpWTAvzidbwirJkDb0iWRLBF
        +ZFEzU8XoYsUMQO1lFziQFhIEBf7sq62gQQvu5pIzzYuEbSu0Any0V9TP66lqfsv
        fzPJbrMLKhzLzYM9LFPv0zChfYJy7RTSzP/mFH4/6IpRTf6iyx4ys3o8KhZkgnaY
        7KS070fSfXkpXvrwPbM9iWnvTuLN/TLPA1Q==
X-ME-Sender: <xms:ElGCYhV8o1j1XByTOI6cCj7YHOZ-hUMZ79CkusqyLEKAbO_QuGoG1Q>
    <xme:ElGCYhnPaIB3eK-CXsZR52dvLPM4R8ncwtUqzl7ttyqctIhj2D3mFkTTNnZskMg7z
    _Ti5EOdg-FYNZ3-s1E>
X-ME-Received: <xmr:ElGCYtb7HGeD0GQhI-gPKzf3qmernX5B5oBLbtzamvbV9VGzaseWLT9y2GIPSF62k6pUlBHckHhUpPFydtitK4EjRownVEpFqWYwUIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ElGCYkXqxPOMwoFYaLOaQp_bqFS24PZyQ9nvyx_tEqHXbc1XKeGEgQ>
    <xmx:ElGCYrmBMb_ckhdWeAQbp-1NmRcFo_VVoFrMuBeI2K-1p9p94IkwVQ>
    <xmx:ElGCYhcOE2jjH_ZstaD0Pkb8U83WUDBGx30fJrBLUFM9othRKcFNNg>
    <xmx:ElGCYkf0z6Y1zU2SZDGM-4mKTC4o3-nhkFKA7krPsr1ErIaqpI6Yrg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:26:42 -0400 (EDT)
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
Subject: [PATCH v5 20/28] clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
Date:   Mon, 16 May 2022 15:25:19 +0200
Message-Id: <20220516132527.328190-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_mux_determine_rate_flags() will call into __clk_determine_rate()
with a clk_hw pointer, while it has access to the clk_core pointer
already.

This leads to back and forth between clk_hw and clk_core, while
__clk_determine_rate will only call clk_core_round_rate_nolock() with
the clk_core pointer it retrieved from the clk_hw.

Let's simplify things a bit by calling into clk_core_round_rate_nolock
directly.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 3a94d3e76f59..1a217c21be48 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -536,6 +536,9 @@ static bool mux_is_better_rate(unsigned long rate, unsigned long now,
 	return now <= rate && now > best;
 }
 
+static int clk_core_round_rate_nolock(struct clk_core *core,
+				      struct clk_rate_request *req);
+
 int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags)
@@ -549,8 +552,12 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
 		parent = core->parent;
 		if (core->flags & CLK_SET_RATE_PARENT) {
-			ret = __clk_determine_rate(parent ? parent->hw : NULL,
-						   &parent_req);
+			if (!parent) {
+				req->rate = 0;
+				return 0;
+			}
+
+			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				return ret;
 
@@ -573,7 +580,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 
 		if (core->flags & CLK_SET_RATE_PARENT) {
 			parent_req = *req;
-			ret = __clk_determine_rate(parent->hw, &parent_req);
+			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				continue;
 		} else {
-- 
2.36.1

