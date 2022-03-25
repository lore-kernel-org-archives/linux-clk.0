Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54938C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 25 Mar 2022 10:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352924AbiCYLAH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Mar 2022 07:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244096AbiCYLAG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Mar 2022 07:00:06 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068854AE34
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 03:58:29 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 5E56B5C0069;
        Fri, 25 Mar 2022 06:58:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 25 Mar 2022 06:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=dg8syyqhxJbaBkZFBbyZepMurtjTn3
        l4/9qNBy6pFCk=; b=KMa5olhW6abLg8l16+Hw/SAoBU8dNwzjdq8judoxWFWTE3
        PG/hpTvZNV2W3zsD47Q2WfNmNOfILfm8/AtuxeYxQgVaKxE6ujO1yEZ/nQK4AmTn
        pF4GeUijCrkKN7XOoY7kXcRqZwV8el8jMcht/zZP8zaZhkBtDFryTJ3C9zeFhZux
        0IOYgwf/KoKyd73dv2ACide7MhDrjnVFp1cNVlTmBAMUzax75N1+blBtnGaxGAmd
        MNbL7++DFrFfm/Z2P7Qq4VAsVXPHRJv+OtKsWEqJxZHIVjdQkKxjHm8v4HWBLudZ
        fox0esgQHBGR0M77Yv/d8/jACBCflvOqxXn+3UVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dg8syy
        qhxJbaBkZFBbyZepMurtjTn3l4/9qNBy6pFCk=; b=GRlfKiXy8wLa/DlPaGtJ1K
        0Phl9DGgmvz2/Ik1mIHMvb7kGMAS/RjA0mBsnNXEJo56QM/45vbS0LN8HxKvLfM1
        Hz5J2VmYWS5aSR9L2LFVwIqT5oGaPe7rZWQfi8QCZd7B8kzNuMJsAJb4eYB3cye7
        4vYklPHfiaNpEGttlut3Ss8RzFGBOwQSXnnl5rh30u89THRPIUXxjP36H10STCsY
        3oygi8PvDPst4vu4D9DCLHB9Kqt7K8/Akyy7Gx9z6seIN84kbGX4psqCWzmh//xA
        s45hRa29xgNesF/zP3AiaPmxiPZdoYjIj6g0NzeCm+IrdbmPgMLbN9eofiOwajaA
        ==
X-ME-Sender: <xms:VKA9Yl5SsMdoLmzFL9gGp6xUJpoEudBJE9cFCB9UTdO3UkrnGY2TUA>
    <xme:VKA9Yi6isSp_dqASNzeZ4tUOjVvbVRbyKgFv6V9r8WPo6OJLgRLKWQMdKYFnTrgQO
    ychFndacuz8G_nAcVI>
X-ME-Received: <xmr:VKA9Yse5HyNaYnQ-9HOWEl8RBiCSR3SxnfixK3Y0bXiBQGRtRed0dsZxvxYJXRSP_nupubDqausiZ2Af41mNCZgiNXFsoKPCHGcFJXk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VKA9YuJPwo_YQBGW0uX9z0xrI9uuwRNxhXV-9DbBqwWtn-9Ooop0Hw>
    <xmx:VKA9YpLTHKZ997fxrDhcHTlJQ_i2jN33f3TLpw6NsSCeoyNhC9VDrQ>
    <xmx:VKA9Ynzd2ceClg52Kp-7jq6ipqE-VC12kLBLrBtSbDW8l3IejlaNYA>
    <xmx:VKA9Yp32OQBCRnsWyvPWqJChP9T6bI5fqVd3J8qR8uDtaJULrEkKQA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 06:58:27 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/3] clk: Initialize orphan req_rate
Date:   Fri, 25 Mar 2022 11:58:20 +0100
Message-Id: <20220325105822.1723827-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325105822.1723827-1-maxime@cerno.tech>
References: <20220325105822.1723827-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When registering a clock that doesn't have a recalc_rate implementation,
and doesn't have its parent registered yet, we initialize the clk_core
rate and req_rate fields to 0.

The rate field is later updated when the parent is registered in
clk_core_reparent_orphans_nolock() using __clk_recalc_rates(), but the
req_rate field is never updated.

This leads to an issue in clk_set_rate_range() and clk_put(), since
those functions will call clk_set_rate with the content of req_rate to
provide drivers with the opportunity to change the rate based on the new
boundaries. In this case, we would call clk_set_rate() with a rate of 0,
effectively enforcing the minimum allowed for this clock whenever we
would call one of those two functions, even though the actual rate might
be within range.

Let's fix this by setting req_rate in clk_core_reparent_orphans_nolock()
with the rate field content just updated by the call to
__clk_recalc_rates().

Fixes: 1c8e600440c7 ("clk: Add rate constraints to clocks")
Reported-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com> # T30 Nexus7
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9bc8bf434b94..915a2fa363b1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3479,6 +3479,19 @@ static void clk_core_reparent_orphans_nolock(void)
 			__clk_set_parent_after(orphan, parent, NULL);
 			__clk_recalc_accuracies(orphan);
 			__clk_recalc_rates(orphan, 0);
+
+			/*
+			 * If the clock doesn't have .recalc_rate (so
+			 * wouldn't affect the parent rate) and is
+			 * orphan when it's registered, the
+			 * __clk_init_parent will set the initial
+			 * req_rate to 0.
+			 *
+			 * req_rate is then used by clk_set_rate_range
+			 * and clk_put to trigger a clk_set_rate call
+			 * whenever the boundaries are modified.
+			 */
+			orphan->req_rate = orphan->rate;
 		}
 	}
 }
-- 
2.35.1

