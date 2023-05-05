Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9033C7EE31
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231698AbjEELf4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbjEELfx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:35:53 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4846A5D3
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:35:52 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id D81543200923;
        Fri,  5 May 2023 07:26:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285960; x=1683372360; bh=EJxBXZ6qnhjj8sJ7fKmL+1oGhH+GkZRJbnw
        wVHzRo8s=; b=ue3ktep6FiSqS+zZTu9KV3uFxN+6COkAp+t5Yr7/HRc/a7a7HMs
        9gYU8matJAIdCGQWdnZZeI8vyoJIFT6UteniS+WFWfc1wRLAmC+cZd6+36PlWojs
        8s2iNxrRj3/vJummcAeetAxi3tGfk1Lq1N42144WXxjUblUi1g+V7x9nETbHKyMG
        10udN/i9on/bIqLXQfzv6nCNJa5MQbS94/vkBJVJeUAoSFR/YTOnyEKKJDxiEauy
        Kq8c+9TTNLXMCNIgdZcbauSOhUtRWdgHYZv5BqTXOUzj4P95BxbEkd42jQyWr3Fy
        5Z6NGDpmHinn9VL3MtL8ZAa1I0au3oBJVmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285960; x=1683372360; bh=EJxBXZ6qnhjj8sJ7fKmL+1oGhH+GkZRJbnw
        wVHzRo8s=; b=YZvLDwe1kjvTdetkAjvgF1vUJOvptQ1H23X1oC02PQjcMvsqXC2
        XkJOhUXglD63v7G0o7WyFb47Ig/mUdK6TlR43K4iGqo6KteS8jxFNn01Xj7C5ypV
        +x0IiRFObupxd7fr318oq93z/qW6AyBg0MD59+NWawo/aLt/ptEvFaYY7ydR3QSs
        Z5u2c0NC5kOg9WqxlCqFQqRVZtSKD1Xt6F92TYqUvuyBK2bKqTilgbUND8KxS5tJ
        itvilWUdRR8trghbSKQ/Jg3nuUQylf16wLv5VBTvhZd0MSrngl4lUyauRGcU9BYD
        9Mksrtea6pFxIBgjx5lCy8oHvLo3+B4zbeQ==
X-ME-Sender: <xms:yOdUZCM0sge5-jpo6iMav0q_9eUGUJhQJCeJz_9a7GTjAOiURVDQtg>
    <xme:yOdUZA_B8RNZapzb5Wk2agzXTMoAl1bJgGwWl0BhVCYk8ef7yqn9P6efYV3zVBimW
    UxyBTVSqcnUqP959Ds>
X-ME-Received: <xmr:yOdUZJQFl6Qy34JwaQGnzVza_rF0NYUV-YjpKVd9realjmvFEI80xYBYxOywnsPCqK3GsHLTBMyChLmUcbqQ0O8UF4S3Hwk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:yOdUZCvEo4T1Da-uXXpdI5EQGqYuxvdKem-AA58QyqNSajxPtjSAUw>
    <xmx:yOdUZKfs4PmxLxIs6muCudLNk04Jyryv2VS0mYMMEBnpx6cAbHufyw>
    <xmx:yOdUZG1pPfbNPBSzmFgVNRj4AEAB1s9QFL-4jal2p75MFuj82oulJQ>
    <xmx:yOdUZLpH6JINdWfFJ631ZPPwehIkYbkjDSaZUhP5yeAy_z-sTEiiSg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:25:59 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:07 +0200
Subject: [PATCH v4 05/68] clk: lan966x: Remove unused round_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-5-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=VjoPzGPlkvAYTTAB0KZcMAeTT6q4N2DMAu8sHFnEyEI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxdpBNxWzYu7lrpCK/3goj/SIf6nz1wqOtWpMS8hJOeh
 49t9HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhI9D9GhiNCtTWcQTlzzJ5ZcQdfU3
 nHtXGHiN7sZ5sC5rrF7syUMWVkePbrbevy6RdYdtaayi1JykqLP63OdtHw7Y8jh0vDWDO38AEA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The lan966x driver registers a gck clock with both a determine_rate and
a round_rate implementation. Both are equivalent, and are only called by
clk_core_determine_round_nolock() which favors determine_rate.

Thus, lan966x_gck_round_rate() is never called, so we can just remove
it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-lan966x.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/clk/clk-lan966x.c b/drivers/clk/clk-lan966x.c
index 460e7216bfa1..870fd7df50c1 100644
--- a/drivers/clk/clk-lan966x.c
+++ b/drivers/clk/clk-lan966x.c
@@ -103,22 +103,6 @@ static int lan966x_gck_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long lan966x_gck_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
-{
-	unsigned int div;
-
-	if (rate == 0 || *parent_rate == 0)
-		return -EINVAL;
-
-	if (rate >= *parent_rate)
-		return *parent_rate;
-
-	div = DIV_ROUND_CLOSEST(*parent_rate, rate);
-
-	return *parent_rate / div;
-}
-
 static unsigned long lan966x_gck_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
@@ -177,7 +161,6 @@ static const struct clk_ops lan966x_gck_ops = {
 	.enable         = lan966x_gck_enable,
 	.disable        = lan966x_gck_disable,
 	.set_rate       = lan966x_gck_set_rate,
-	.round_rate     = lan966x_gck_round_rate,
 	.recalc_rate    = lan966x_gck_recalc_rate,
 	.determine_rate = lan966x_gck_determine_rate,
 	.set_parent     = lan966x_gck_set_parent,

-- 
2.40.0

