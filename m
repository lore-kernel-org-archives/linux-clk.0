Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CA4C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 10:56:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239470AbiBWK4k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 05:56:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236233AbiBWK4j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 05:56:39 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB447D03D
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 02:56:12 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id C157F5C01E5;
        Wed, 23 Feb 2022 05:56:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 23 Feb 2022 05:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=IW+mV/sYomA7p2iMVLnrfnt2OPuKxa
        e7vUhcazyHY+o=; b=GXnbgt4ODeR89FwIuyZpdd3+E49oWVXRokGX+V8bhi9Eyi
        E4O28Z7rgF2JNpyi65QFaiXJr0Tjq46c13WD4zOW1oiyfCsRIa80PKEcFJQv6DPq
        g7D/D3YuPfHIeCE0G1Sv+BLlETjEC9JDaB0V3RSkSYDAmH2wtmg7IwqmtUI7GEqP
        depImrfjDilJPIFx/aYgL2jzHLweIql0JgD1JnsE6whpnzdDkLlxU+OxzSul9B3J
        XP7cyqa3AUSJo4nu04BiyoY7QMgO9p5fPA6KHBd/MBLOpY/dtFIPwI1vr9nvCuMo
        T3lt63Cwtrnf+5a94yAeSg+FkxR4U/hTlAxNHx2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IW+mV/
        sYomA7p2iMVLnrfnt2OPuKxae7vUhcazyHY+o=; b=oyidOVBxUnEWYZTz82HE8v
        b9JUILdh3NGtM/ANZ2+lVdAHTTADZN0fd8RMRlmy4aHSuHUxswmiRULxgpeqDppo
        qQmxxgKefPaPrQEboXAygyAWfDVVkHZFGi3dqhIBW0Kfym/FwEnL5+1cqYsZCCui
        Mt4ZyAKE0u3MPcgiqN+PamPnM4zxnDNq3N/C0tYCNPJPZ9DN34DJezDsP8XGIYh1
        5If7fYVsVf5ySZf34MLFzLgWRm8ASaFneiE5cNd2PlM86+9Gt2q7YD/Kc9i3E9u4
        1vl+OO06lJWgRfAJKA0u1dMWazPcH+rasSltfcK56Na+clmgrxYdFZYhtRa9NzVA
        ==
X-ME-Sender: <xms:yxIWYgdP71CTZPgKjRxb4s5_mpZ3sn2mv97M9quabB99FvAE_4KIFg>
    <xme:yxIWYiMMT6vnepMv8o_8Nq82F4t02iryrq12UsdZiZEYy_HRJ8A6UGuiSMr2oZcAb
    K1d1CBBOeKM4orJ91U>
X-ME-Received: <xmr:yxIWYhj1M3eTiPsodmAD_3elggWw6Rg1ZWsh0a3DKlm9NTsnptqwJNcvwSpg_C5kG8EK-5ThVARU4KoUcbHZE1spGho7WyqR0Gomj0k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yxIWYl9XVnazEc-UWrr8AQ_UkeI2Bbu0_dFlebAyXsZDgLmq8WviMQ>
    <xmx:yxIWYstRGh8oTxcm-eGBSWn7_bgjNY5UVbs2rlfydb4PBUjtyh7NIw>
    <xmx:yxIWYsHRu9VafjrIhKH8GXO1JAykPPJ3wRflcjVW8damoQJfhObgyA>
    <xmx:yxIWYh_lb6-9LiCjJN3o8pcGf2-L-uGsM2ItSzp-y8gjhTuGp1kdlg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 05:56:11 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 03/12] clk: Enforce that disjoints limits are invalid
Date:   Wed, 23 Feb 2022 11:55:51 +0100
Message-Id: <20220223105600.1132593-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223105600.1132593-1-maxime@cerno.tech>
References: <20220223105600.1132593-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If we were to have two users of the same clock, doing something like:

clk_set_rate_range(user1, 1000, 2000);
clk_set_rate_range(user2, 3000, 4000);

The second call would fail with -EINVAL, preventing from getting in a
situation where we end up with impossible limits.

However, this is never explicitly checked against and enforced, and
works by relying on an undocumented behaviour of clk_set_rate().

Indeed, on the first clk_set_rate_range will make sure the current clock
rate is within the new range, so it will be between 1000 and 2000Hz. On
the second clk_set_rate_range(), it will consider (rightfully), that our
current clock is outside of the 3000-4000Hz range, and will call
clk_core_set_rate_nolock() to set it to 3000Hz.

clk_core_set_rate_nolock() will then call clk_calc_new_rates() that will
eventually check that our rate 3000Hz rate is outside the min 3000Hz max
2000Hz range, will bail out, the error will propagate and we'll
eventually return -EINVAL.

This solely relies on the fact that clk_calc_new_rates(), and in
particular clk_core_determine_round_nolock(), won't modify the new rate
allowing the error to be reported. That assumption won't be true for all
drivers, and most importantly we'll break that assumption in a later
patch.

It can also be argued that we shouldn't even reach the point where we're
calling clk_core_set_rate_nolock().

Let's make an explicit check for disjoints range before we're doing
anything.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fff5edb89d6d..112911138a7b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -632,6 +632,24 @@ static void clk_core_get_boundaries(struct clk_core *core,
 		*max_rate = min(*max_rate, clk_user->max_rate);
 }
 
+static bool clk_core_check_boundaries(struct clk_core *core,
+				      unsigned long min_rate,
+				      unsigned long max_rate)
+{
+	struct clk *user;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (min_rate > core->max_rate || max_rate < core->min_rate)
+		return false;
+
+	hlist_for_each_entry(user, &core->clks, clks_node)
+		if (min_rate > user->max_rate || max_rate < user->min_rate)
+			return false;
+
+	return true;
+}
+
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate)
 {
@@ -2348,6 +2366,11 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 	clk->min_rate = min;
 	clk->max_rate = max;
 
+	if (!clk_core_check_boundaries(clk->core, min, max)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	rate = clk_core_get_rate_nolock(clk->core);
 	if (rate < min || rate > max) {
 		/*
@@ -2376,6 +2399,7 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 		}
 	}
 
+out:
 	if (clk->exclusive_count)
 		clk_core_rate_protect(clk->core);
 
-- 
2.35.1

