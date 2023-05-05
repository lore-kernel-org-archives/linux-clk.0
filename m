Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1350C77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbjEEL2U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbjEEL2J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:09 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C12D1A4A0
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:00 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id B90A83200A80;
        Fri,  5 May 2023 07:27:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286058; x=1683372458; bh=D8rLr9OMXPZcCTtVhZhxl/mxOaqHxQqts0r
        YZ7FfWpo=; b=Vid7TGwpVXkLt2mESgclZOESsWOXEbEk4dsNiJmZW4KqvMhT915
        j7JHxRMr2/wbYS1eJFbAAZPWnpNkLlPZnYx2s5isoWALYI+7x7xyc2JqxTk2pnvS
        5TfC/VUM0gCl6oVf5lsJS17L3ZEVFZlUDgBPQqGRje+zTmz9olteyjv+nwm74v31
        SkFqqVvHTjV2G0tDEQOtLNoCdF2+bajcxaqp+VEYw7LlLR81bWUs4OP89s4OHjOq
        9KmEA5Kxd04U9xLjZJyOyj66PBCw488WtIWOMa88N9Gof49TRqUnl5oxyRY3EFfu
        Id9Olh173dRyiLmyr6dfGkKT/cjUfxZpO6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286058; x=1683372458; bh=D8rLr9OMXPZcCTtVhZhxl/mxOaqHxQqts0r
        YZ7FfWpo=; b=H92S22diAKEuDqPCEcfIUBHXMAaFQiVKXHKDmFUS2l4NhnKJlnN
        /zRj/SfFql3BaR28K2/wlo427BXWUzP9fftSvqK/5OMozatsnIVqX9WVsW6PxflO
        kcViETolKmIxVSsG6atNG4ZeUa3aeI2jOXs1vWOa7giHoFpjEexZZnADTM2JCzox
        mHYVLX6uVxDkLrZh1+G/vZROk/sA/lQ0K9xjUHpBJwv2FZ2eehNVlTRHw06dG12x
        ZX8tBKMhiNKWontRIcVAdCwEPGH1ha66FxVIu7P+0P90rXGwUVVp/Q3Q/gnuCY3e
        O5rCf06qjVQP4tg3WYVtTqzqaCIMpmVZTvQ==
X-ME-Sender: <xms:KuhUZI13TJ44_G2Lj1g_1IOhNEeJ8ZU7IAwxFMKyDDZlVvIKBWdZHA>
    <xme:KuhUZDGx6d3zh9MCsLg4cuJk7cJJUQbu1e09MFYHUUk1KMr2Ln1ERhWEqoZ0CWcKh
    2Q8OVn8LDilKyV--MQ>
X-ME-Received: <xmr:KuhUZA7QPkAi08G9FhXBT8fc9b3MMI0c2HaBldkWBL4-2ImfZ3aLxVfUNS13GljlZfD5Y2WkPdqpX17TkQ8G5cQkml5GLO0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KuhUZB2Wdv_jkcHkzqtWyy8WWfqhPoLjQuHomsI3SXvzy6iy_oxtyQ>
    <xmx:KuhUZLG8WxU5TDAO3Vnl9eAKLRLxJ-YwTuHPHhQhU60ub0wBl7mPmQ>
    <xmx:KuhUZK_5qHVGyu-OsiAb2WINUfJ2doDr8Cna_IkCEBDy-5n6lH9-tg>
    <xmx:KuhUZMO8mWeMfVTs5rDGpBtvgWG5FxWyL2EERd_2X85-xiSCRHRyVA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:37 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:40 +0200
Subject: [PATCH v4 38/68] clk: ux500: sysctrl: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-38-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=PZ0luiC05wRTIkvYXLkev/HtMLESoOlpFBb4AQ2bSHc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5c8s2Sakqrz0DbW6FGiz8dfW+szPfUFJ3HVvP/9Svbg
 vKd/OkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARgRxGhkX6EyunzvsenF71fPOSP7
 1ykp3Jq677cYrvPHDAe+q9V7MZGXadMV+3aorTBu1TZ+O0NopoJ14Oec/F43q/iuedzi+BMB4A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

Similarly, it doesn't look like the device tree using that clock driver
uses any of the assigned-clock properties on that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the determine_rate
implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
determine_rate implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/ux500/clk-sysctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysctrl.c
index 702f2f8b43fa..ba3258c88d28 100644
--- a/drivers/clk/ux500/clk-sysctrl.c
+++ b/drivers/clk/ux500/clk-sysctrl.c
@@ -110,6 +110,7 @@ static const struct clk_ops clk_sysctrl_gate_fixed_rate_ops = {
 };
 
 static const struct clk_ops clk_sysctrl_set_parent_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.set_parent = clk_sysctrl_set_parent,
 	.get_parent = clk_sysctrl_get_parent,
 };

-- 
2.40.0

