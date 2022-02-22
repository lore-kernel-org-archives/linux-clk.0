Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF584C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 13:19:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbiBVNT2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 08:19:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232185AbiBVNT1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 08:19:27 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B27BBD2F5
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 05:19:02 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 82EDB5C02B7;
        Tue, 22 Feb 2022 08:19:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 22 Feb 2022 08:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=a7+EbMYpVDrUYksznz4mjPWNFnSbDW
        bxbyNQMMDcFi0=; b=vE8YSzFReBh9D7yAQadQht+JWyqw+M70Fr5UN+UvVooxgn
        mS2DHr6MoHlpfU2hh8ChFNRxdtP9J3P911g6TeTth4V+WF4wU2vKEaawKnxiPzz4
        sMFuO13ScifngVTfenBrGlvide/DeXCdJ+R3CBaqJyGHwMQvcCYPUUKOL7o/lHxh
        A6k5sRBxLFdgt9FPSU+pcUItOXYD7IsuVcwuVFQyXFr33lajSVaCSOV+OCy1KboH
        2pSA5c2lZO2Un/P75TFAPwjLeikXN6zJWmSGxxbsZR5qcoRjEHWHN2ak9Y4Z6oal
        qsPfgvIrNE+6OjYJCRtGvseUEl237WkJ8Eom07YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=a7+EbM
        YpVDrUYksznz4mjPWNFnSbDWbxbyNQMMDcFi0=; b=E7+pCcxkaYQfe/sBxfDsIV
        B8dtt1mKr27IrK1TP9S7kEsuSz2+en0s/zIcc4eQ0gzH1rbRpUWpqg8LQBkfdyT3
        9oc3m+vsWoJ4pwIwOi4bLx6j9Q7/O3kx0rjH1Z0YRUu2yvMxSrqTfaWFe9pfWW0b
        HTReKWNAuM24sAILGS6gkpWmIqeyamIxMiXEQhPj0yHhixYv7ojsXwsuAaNOETJ4
        nmOte7kFrZGkfcUecZgdDa9eFfPXJ4+ljvuUJ87PQGZ8ojko4q9d9DIypT20uHPl
        39vca2z6lglBuCIHhz9dhuQeLid0xqChK8dGTtNDTVmoVWXq+UJH4sRAF49OdtpQ
        ==
X-ME-Sender: <xms:xeIUYrUxq-O8D-se62WqFY5QH7db1y2fuXVNbDLBWk6yZnqeEM7UDQ>
    <xme:xeIUYjnkXs8JfuYplJtzbGjW9jr8MkbVlgETODFCRatTErH0-hXPuMMHJMOEoj1EM
    BllR0TNgsmmmBxkiQY>
X-ME-Received: <xmr:xeIUYna6XlbnHo8IG9I5BkqDEjQI5OyyNpEMEESSCK9k0gHSYfZ3Ds5OsETPzpwnYVvWliCSSXz1kjQxx3JqskPXb8gN8iKrDEFz3_E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xeIUYmXUhl9B1eF9LLcEQ1HAIOqKFHQtXIf-dFrglTDtj2_T4ceXRA>
    <xmx:xeIUYlnxmm5sGTNjPaHlS2K2cECOlwSY4ko6MrgLD9RTQncjRKNRBg>
    <xmx:xeIUYjdVwXnmjRhH9ENUkmcyYfW0fF7NuMdsuUfhzgAD-EHJa8_qKw>
    <xmx:xeIUYrXuHSF33sAlpLya7lZ69aWDbPJ914NCkbSDJ8UPxP0d7w28xg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 08:19:00 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 02/11] clk: Enforce that disjoints limits are invalid
Date:   Tue, 22 Feb 2022 14:18:44 +0100
Message-Id: <20220222131853.198625-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131853.198625-1-maxime@cerno.tech>
References: <20220222131853.198625-1-maxime@cerno.tech>
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
index 8de6a22498e7..276188a6bc2a 100644
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

