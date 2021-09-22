Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A91BC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 12:54:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04FBF61178
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 12:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236026AbhIVM4D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Sep 2021 08:56:03 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:33219 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236016AbhIVM4C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Sep 2021 08:56:02 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id 210B82B015E3;
        Wed, 22 Sep 2021 08:54:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 22 Sep 2021 08:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=+VQJ1qYl9kyaC
        FZ/5gVwTnLYe2FgtAOmnjOeyAZZK+U=; b=Vz4YqM9th7Z8btkrBP/p7azTBzutJ
        bH7yQ3YzfvBNRxLVCXOd9b3s2BkYCVpu29PdjIoU67yAZZ3cI6phfAoj+e0CU/Ry
        bMtX3SNSqHZOQPqYkOtsGXCUwk75+S28L9xajb0y7SNZ+yUiKG26cTgyWSw7P1fL
        Un5tASKgvUMDxqyx0AFGtK+DqIHD/BmqyRt24jYsRHZv41AXrMa39jR/LqACjWGG
        u7VVbXfidXMvHWhnvCQ6x39hMjmMiqNe8UP2K+mpjdYbikCL7M6SHXslscagSYmW
        /YB8p9GtD1A9K9zSv6GdGaSx+Qocq4fO3oTV8ANl9L6ZTO+l279FXOLSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=+VQJ1qYl9kyaCFZ/5gVwTnLYe2FgtAOmnjOeyAZZK+U=; b=pZjKibEi
        QOIqeSrzP8z6t+kE8XdxfwcfXw57igiwFN+rJL0tQdBAXMzodGKso4Yvd9UwKWDt
        nHECACDZctEY5y/Ks1Hy5tIrX4xZotYwSX0e7gQIVYXOLe5HfuvxAZ6xK7spwng8
        MoY8NN3KcQm5LBra3+xz2bj5cJYAqp6XJatmGqXiUuIHN1Elfhbl467paYLLh84B
        3J92k6DWuPWJpx/joXR1ZqlPCLzBx2AxRKQi1B0PcMboEB2kHCfClSjrZKBxgdHs
        bdxT08N3QBKf1YKNgI6afBcQp1PLjcV0UQdK0fe4bWohq68FkezzcCXm59rBCIbN
        kEIJwLykZ8XVuA==
X-ME-Sender: <xms:hydLYecHkgfOioo_8gFdXpMvMWfAGaLOmi5kLzOFoLa9-gz7dVNlbQ>
    <xme:hydLYYMDMU8vTQmDe73jCd9gkVZfX7IQNzV_fmdgA2MNy1m8tOl1s6UrkGLNAYj9x
    n0W7jiEv8She6jzLbg>
X-ME-Received: <xmr:hydLYfiIKo-TjozSy4Y6grx9fMKCsq5XsVxh3cc__WpK5R4y_-VXak0RPOhK9mLKo-vi2OOBETt-KdMkq08uPgPoKN2i9GnZsLn6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hydLYb-NrsVYVZA2ezEVm3eQKq0RH9CdpCNGZhUzEw0Hj6vx2LXiqw>
    <xmx:hydLYau4A4lkt803rvi9TN_wu70iE1xJfiToI51scIZoGHm-m98VxA>
    <xmx:hydLYSHfCbcq0jMD3UaqvTfuJkqkeWW311cROXn78H6wp1fj-WgPJw>
    <xmx:hydLYbGDvJEj1WcPZNu761UIaO-sbM32gVm_NvbS93xOTNlnMLEFZ2FSjnQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 08:54:31 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Michael Stapelberg <michael@stapelberg.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 2/5] clk: bcm-2835: Remove rounding up the dividers
Date:   Wed, 22 Sep 2021 14:54:16 +0200
Message-Id: <20210922125419.4125779-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922125419.4125779-1-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver, once it found a divider, tries to round it up by increasing
the least significant bit of the fractional part by one when the
round_up argument is set and there's a remainder.

However, since it increases the divider it will actually reduce the
clock rate below what we were asking for, leading to issues with
clk_set_min_rate() that will complain that our rounded clock rate is
below the minimum of the rate.

Since the dividers are fairly precise already, let's remove that part so
that we can have clk_set_min_rate() working.

This is effectively a revert of 9c95b32ca093 ("clk: bcm2835: add a round
up ability to the clock divisor").

Fixes: 9c95b32ca093 ("clk: bcm2835: add a round up ability to the clock divisor")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-bcm2835.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index bf97b2b2a63f..3667b4d731e7 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -932,8 +932,7 @@ static int bcm2835_clock_is_on(struct clk_hw *hw)
 
 static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
 				    unsigned long rate,
-				    unsigned long parent_rate,
-				    bool round_up)
+				    unsigned long parent_rate)
 {
 	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
 	const struct bcm2835_clock_data *data = clock->data;
@@ -945,10 +944,6 @@ static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
 
 	rem = do_div(temp, rate);
 	div = temp;
-
-	/* Round up and mask off the unused bits */
-	if (round_up && ((div & unused_frac_mask) != 0 || rem != 0))
-		div += unused_frac_mask + 1;
 	div &= ~unused_frac_mask;
 
 	/* different clamping limits apply for a mash clock */
@@ -1079,7 +1074,7 @@ static int bcm2835_clock_set_rate(struct clk_hw *hw,
 	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
 	struct bcm2835_cprman *cprman = clock->cprman;
 	const struct bcm2835_clock_data *data = clock->data;
-	u32 div = bcm2835_clock_choose_div(hw, rate, parent_rate, false);
+	u32 div = bcm2835_clock_choose_div(hw, rate, parent_rate);
 	u32 ctl;
 
 	spin_lock(&cprman->regs_lock);
@@ -1130,7 +1125,7 @@ static unsigned long bcm2835_clock_choose_div_and_prate(struct clk_hw *hw,
 
 	if (!(BIT(parent_idx) & data->set_rate_parent)) {
 		*prate = clk_hw_get_rate(parent);
-		*div = bcm2835_clock_choose_div(hw, rate, *prate, true);
+		*div = bcm2835_clock_choose_div(hw, rate, *prate);
 
 		*avgrate = bcm2835_clock_rate_from_divisor(clock, *prate, *div);
 
-- 
2.31.1

