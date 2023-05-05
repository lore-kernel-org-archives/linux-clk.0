Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18061C7EE23
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbjEEL2J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbjEEL2F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:05 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7FAA1A4AF
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:48 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id EE5C53200A44;
        Fri,  5 May 2023 07:27:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 05 May 2023 07:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286020; x=1683372420; bh=Qyq+AHQ9GHxhGyLxWc/N8kBcBOrBM32CeXG
        8zDV0M1M=; b=JHiOc+MLo+ysRvzfqhjEdNtwkTSikprpQNAzPhEALKA/RdlmS4c
        889j5n0N6EVuul36lbQ9uGj6mgBznOY+eei6LHXaf+2pGuZhNeW+cQMBTuX9yt9w
        VBAaxgkODqXNPDtqM+9IlexIWv63jisq0FskLaO8+fWYNW+3236bnM8OfCMu3lPv
        MH8jPvJJzW2NF4J+1S23p1kMELYpQK2pm0HQwWf0sxOufTVS8P36HfyKc+GcbHqU
        oLy+i2q+it8n3c5VQ/ZkVs2g/aWP8Qneg0LugfznpGkH52TKuSO+bfJglGj5hFjl
        QQLVKbS/td5eJzJRvqHTrvMPHovV9zA1m5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286020; x=1683372420; bh=Qyq+AHQ9GHxhGyLxWc/N8kBcBOrBM32CeXG
        8zDV0M1M=; b=ZjZc2ZrGxzto6uTPvfKgKVAZsrtKwjH3S6+AF3RJ1mPxF59yFMx
        tcZltmibg0WlwA8qhW/g/D3CFTJHegktrgeQR1s0Jd8+9yiUIqRgIQKEzBSD6ato
        ll+i9NQdJKKgtWB2Gua15Ul6UjO4/X069T9qBpe8Y6n3PJG4emDvEtbwlKEe9a2+
        ThowDglUC4g2y1eJSUZ6y48GtVV/Ch6mghDfIE6Mu8OZbWISYa5DavbAwGpcnwRw
        Scb3B8QX1BKgPnOLf1dEIjb027DLDyaiFleABc9ep1ZWO85acyzXnh8xBQam/+F0
        03wncn8X0elmexvpghNzsNcgTCLJyi/O4RQ==
X-ME-Sender: <xms:BOhUZKhhJGHFPXi59VVSQrdZ5GhBTEex6WAnu14PwzRqRYtI1gIyUg>
    <xme:BOhUZLCgEAvQZY7qjJoKqWtT0vDqoJgsMb-OrpePeORtXhDLQnStixEu4HUqxkMrp
    sNRdk6ohNi0cQk2RjE>
X-ME-Received: <xmr:BOhUZCHjEmDak0fW9F8T0kUR11QVUILnofiPc7GRvA-efoSHYKAnq3v4PZHEv9j60YmJoinqEHQEEmTZc7bUx5s94LvVb7U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BOhUZDTHaSX2-C0ecMrWGcXbZ98wkjNxfCMU7n5j07WLBQLJyA9PBg>
    <xmx:BOhUZHxNNu8jPbnUqFJwSplsUwa_VzMYCUpJY_rc8vO9IqSqE5aelw>
    <xmx:BOhUZB4C8xo6GJnZLrIZsXQgUurrBAefKgTn8OBr7vlXPrZ70jyMyA>
    <xmx:BOhUZMo2-1Uee8ojdRxrCMGTwGQLpBg7x6VDcnou1AE0xzicI-320g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:59 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:28 +0200
Subject: [PATCH v4 26/68] clk: imx: busy: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-26-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Peng Fan <peng.fan@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2391; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=XoSYRvlmzcByeBERHtmIUCUrRDIlqhQZ050GFdHYKNg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxd/minzp/bDbWevnBi3sGS+bafMo/7M+bPj33H9Ov/p
 ypOTO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjAR04+MDJNnTDbgnskZso7JY/5eFf
 4f+2dfnhqUG63Jnr8nd2KRxhaGv7JRbWbL3m5hWK6w/fGUTV07Vu3Ws9JLv/dhz5XUrOqGGDYA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The iMX busy clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

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

Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/imx/clk-busy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-busy.c b/drivers/clk/imx/clk-busy.c
index 6f17311647f3..f163df952ccc 100644
--- a/drivers/clk/imx/clk-busy.c
+++ b/drivers/clk/imx/clk-busy.c
@@ -148,6 +148,7 @@ static int clk_busy_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_busy_mux_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = clk_busy_mux_get_parent,
 	.set_parent = clk_busy_mux_set_parent,
 };

-- 
2.40.0

