Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A311C7EE2C
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbjEEL2G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbjEEL2D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:03 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBE21A62F
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:47 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 635A83200A64;
        Fri,  5 May 2023 07:26:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 05 May 2023 07:26:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286009; x=1683372409; bh=gY+eYnSpCYDnB9K0EjC6BxIJJkmiMLRWR+b
        /ljnJ0JU=; b=bx11XYce1Q2Iue1qLdu2dd0fv6z0LKsnCvFOU35DYMuZkbxSFtw
        OhNLhKX1jCLqJfi0qg/jA0Q4OLcp1f1z/zMNCF3ah0rp3TC2DEbJAmUWQxtI7FBq
        oNQB3GPz6TApmfW9a5AYjuKFjrEFIHQrIUhWu7X1r82HDyoJtW5E4c7SunLB971r
        Lxj648l6Rb6i4YR6hYCRa6NUpj6RN1vTE3/K1iR+2IffP9awo5esJdlqSa3cpHi9
        i2AjTln7mXGwoWaav32ORgsNlVSi8G51+K2zhH5OrFe535IlWmaZQMll7tGhZgcI
        E3skBSfGUisuLhOV4h5uJyKG/k63ZfJTJMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286009; x=1683372409; bh=gY+eYnSpCYDnB9K0EjC6BxIJJkmiMLRWR+b
        /ljnJ0JU=; b=FFRfOzg+prmPA/DPRaSq9B1ErW6MQCILkEnZn3GW+yteMEIgGih
        jO59D/dk7kge5lePa+Pb4tPSKwLC3DtoQ8sf4+ZNsE4YgJ76EfWT6MPdZl2IyIdK
        opZB4vRkOT5LZAyHtg13SD3gN+zjSMdtGWrdOBTl4yueSdFYRrVT27YtQzzCmEOc
        PljvfHvvaGQLuPoqgJeV3nUtCHnLKnzfY/kHtUG3CYVXbuT451pATjIwxdVzoyJQ
        qAfbgDMO3ITvCNpGXQUcuK3+lfy10aeo3i2SAHKVifgJibM7+bIq+bDvNfXShSwc
        32fmMpSyVnyxQgRkA4mSpRXEFc/k9qOMtKw==
X-ME-Sender: <xms:-OdUZKk1EMVutEHmyOGMqb9k8wqu38j0gC2n6nuqdRzXXjaWvv61Cw>
    <xme:-OdUZB3L3sVokt1xqbAL4Gb3SlDtySEfxuMr37pBA33nAwgY3rzJNfyuxslvmDSLm
    Axbx86GYTFQwc6TP_8>
X-ME-Received: <xmr:-OdUZIrhdMb6SVAXM0lP1e0C1myKzvvUFhocK3aMbmtO1JE04NwFPYk92KK8HcT9zd-E6gSLSq4aCjfVFvDJsgyxmH48xE8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-OdUZOlvgV6qzAhOhLptX69wV0Cx3opkJdagtGLdJyaFZXT2AUDaRQ>
    <xmx:-OdUZI3At_x9mY_T7kyHtK_XIrk1VUvTYyZ1Vqbx5Hh8wqYhcIHufg>
    <xmx:-OdUZFtGHvo-rnTuWQL26Kz-yTRro4VrmRYkzsLGajekFOG3GHmWLA>
    <xmx:-edUZFz8aKE0pwj0gjH9LPCG9Mpd160G3cGUxVnSZ9j1iE5y3KSCNA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:48 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:24 +0200
Subject: [PATCH v4 22/68] clk: vc5: clkout: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-22-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2203; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=d4lIt12foa+ezGOQZ2uJASGRBKNzJfQihn8otsu7P3c=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxc73lyyd29u99aYS180H4feXqXIt9DRSqt46o/8uRp/
 V2006yhlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEivcx/FMzD5eSbX9b3yqr+8h9wj
 SzCt3Aa7wHchbfqa3ROBGivpThf7pI5qZi+QN6PZIvir+sUj7dX7jHZ4GNS4Kplaeixr5iDgA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Versaclock5 "clkout" clock implements a mux with a set_parent hook,
but doesn't provide a determine_rate implementation.

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

Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-versaclock5.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 97ffd4ef0e5f..3d6f4b01e6c0 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -726,6 +726,7 @@ static int vc5_clk_out_set_parent(struct clk_hw *hw, u8 index)
 static const struct clk_ops vc5_clk_out_ops = {
 	.prepare	= vc5_clk_out_prepare,
 	.unprepare	= vc5_clk_out_unprepare,
+	.determine_rate	= clk_hw_determine_rate_no_reparent,
 	.set_parent	= vc5_clk_out_set_parent,
 	.get_parent	= vc5_clk_out_get_parent,
 };

-- 
2.40.0

