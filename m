Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BBBC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbiDHJQQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233077AbiDHJOh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:37 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CFE5643E
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:11:15 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id E5E085C0150;
        Fri,  8 Apr 2022 05:11:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 08 Apr 2022 05:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=ES/ZKbdGKr1640YoaRSyRqBE+2yWwM
        EOhbfqnraKZtM=; b=naJ0yvYBzIQUraMNRTtbfBJQDOentyin2991JO826T/QLt
        dfRUr34E5DLFIsuzZzdzdz9dD7M+NnChQ6GbYDiIk7Zg05Xb1RhoyK73tIYecUIy
        50fzYiJI7VqcyQmp/lTK2nmggS2oCv1vaAgmPwaV24DTfGlL6IV8qXp7yChLe9wF
        Smrf69y3gqUQWEHkKLJ33Lm5Tki7e/iKWAVzdk9SkZn+4KfykkBFeZWAflKZEx2w
        ak+j4AQDXQr3XuZ3vdFAdbpjKzLR6vL8bDrcMVpB1WSiPZfd5ajGC+Dvo3tU6w8u
        9RE4T1+C97M8H31CHhsUWTlKtOfDC8eUCzWlrX5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ES/ZKb
        dGKr1640YoaRSyRqBE+2yWwMEOhbfqnraKZtM=; b=g3frAAMTGjquNyG9mIVMjG
        rAh6l/v8oALEIhMkaQl5labakLN7vAqLH/vTYVvOMmkH7iX0mYd9iYUsa3H6hA3Z
        U7G9PGaghwm99Fpc2vMbQQS6pe+L9dIlwv7jYDFScuD4Y+W1mAM2ekC6MvF6XjY4
        +ZluhdrZJq+WcflfuW5X+/C8YIeb7zEDwOgFQsl1LIxBzAsYE1BptnBiXewCgTQ1
        SMnJwAYy3sKw73NH6dG6E4o7EzbKJR/HSU8lz7iMZyls29JIenW0TQbWXUwtOXxA
        NA13/QDkaNwHHM6SeBx1zUbSXlwp9ULLGwYDxSQCIjvdAyEFS81rfvyhEVmVchIg
        ==
X-ME-Sender: <xms:MvxPYl9zRAB86-pJdG7CZQmDM2PgrAxBWAHfga30X2wfYkWa9PFGuw>
    <xme:MvxPYpuVVqJE-pQZ9o0RO7bWa01voxcCmXCGr_StPNQEB7ZvYcih1V2gqO3c662D-
    uUxWGTaWNBiGxClUG8>
X-ME-Received: <xmr:MvxPYjBNizV7uib7Qq0bZGURIQR9ohLU5mCBtpGNNlHmX5DSTzuSLCawqvbmIXFef0wG3h5POqZYDE6FFqVHK4Au_zaiE8WDGlogs50>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MvxPYpdpzACFOU8QvEpocbtgfUxcce1Rlp62dHef8G3JB1vueYaMjg>
    <xmx:MvxPYqNjXoNCwk8DQFBR5T06TAkkyBYaN8UeoLMHK2d60NamE7QKZw>
    <xmx:MvxPYrl633ElhqLURZuSRkiY0TnZI7yZzuWmPN7PT96-lukpqKeJmQ>
    <xmx:MvxPYhoeO2LuwXeH-2JoUKxQsiwZvV-YL7U2SfBGGInjbPCnq7W0Tw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:11:14 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 17/22] clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
Date:   Fri,  8 Apr 2022 11:10:32 +0200
Message-Id: <20220408091037.2041955-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ccb6e9686fb8..448ead0da1a5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -543,6 +543,9 @@ static bool mux_is_better_rate(unsigned long rate, unsigned long now,
 	return now <= rate && now > best;
 }
 
+static int clk_core_round_rate_nolock(struct clk_core *core,
+				      struct clk_rate_request *req);
+
 int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags)
@@ -556,8 +559,12 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
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
 
@@ -580,7 +587,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 
 		if (core->flags & CLK_SET_RATE_PARENT) {
 			parent_req = *req;
-			ret = __clk_determine_rate(parent->hw, &parent_req);
+			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				continue;
 		} else {
-- 
2.35.1

