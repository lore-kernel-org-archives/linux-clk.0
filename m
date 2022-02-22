Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53959C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 14:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbiBVOIC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 09:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbiBVOIB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 09:08:01 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277B0B0C5D
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 06:07:36 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 70E105C0195;
        Tue, 22 Feb 2022 09:07:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 22 Feb 2022 09:07:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm2; bh=eiVgKjta4qlhvg/sDOqM14ScX/HCjlCtgxWc9vKujzY=; b=hHKMk
        dM0mgHY9FQkc9/7scssaHVV5kaFZIFvYTe8qVuHdAVY9SpbzDrC60intoLn16too
        CV6jK2dC5GDlkd2Mefspc6vuqqANksyiQJgL74sAKoJ7XKgAsCmhcvzgLoJBRAO8
        pY+MLirQ9D5GQIaadcnYwGleo01HtZNiEIzdC/GUR4x7ZC6EXrIhotbjGDTdpNQV
        6wnyHf21pLZcfkY5RDLPh7d78/5+8kpZMwNSL1SiWNNdjA44nT53xv8FyJsVPWhX
        6lOAgqeQX/KH9TaZ7kWmnyqd9qpZx1P8xUxErbhXoj00zOUaxkS6jIKVSWRDBO3J
        VwyzgAWpaEEy+FNJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:message-id:mime-version:reply-to:sender
        :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; bh=eiVgKjta4qlhvg/sDOqM14ScX/HCj
        lCtgxWc9vKujzY=; b=m3hXTavxZx2fJkjdkAUcIbgmuv9wEgscaxyQ5zayI8M7g
        czgpaSQGZGKBpOMigY7UImSjDyfNcbQQipAng9OBnp4neRS5mLlxWYg1WEYh80uV
        bx0hCQIWvoJnH2Jqc5dGHU0uSxHCAXUGXIDw4BY9NWvj/rAKcD8Prr+/aETMbZB1
        pYTOhEvZsjIWdHPylYjcqfC+ZAYO2ZFliBlvT2IdH94Y2rJS14RMTexBKwR3PqlS
        LnY2q7e4L92d6l97ZHREDzWwCjIBlWJ3Jv8Xjo5/2isjgSU87pQDrHC4xv5aznXu
        5WvcUDO9s0rKnTqxcG2YCiPunDR+8jknzEJoeRffQ==
X-ME-Sender: <xms:Ju4UYt26AjyFk-O6D56EjhuzFPjzGBTNGDJovDSWQQTQIUawpFqi2g>
    <xme:Ju4UYkE6vjI45DnH5RUx9k1gQHJOpE2uQ4JUb62RlHrK_tbh-uc2LwnI9jnuHvoZR
    gcXS2N_C_KyKsD9UDc>
X-ME-Received: <xmr:Ju4UYt6LoYwYpCsbPIVEluMdxDiQnycikXyrDq1Zk3jn2uR-SP0aJ-gBhb73473ThnLy2ZqTmeuMhlTvFGMrcFJtImk2YqV5NoWjrs8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
    hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
    hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ju4UYq1t_b1xOGnZFKKPyVqDY7dYC33lz8HUsH-1wOdVsHcD4bMVMw>
    <xmx:Ju4UYgHlMPMDk7Z8mozxiNdH0GwibEGv1yGZ8NcflVCtaFJGLylXvg>
    <xmx:Ju4UYr8DY_VIR6YvCJJItpvoPnufFwjhvSbhNU9Aqm4JpOOriXazMw>
    <xmx:J-4UYuYnY9DWxA8TM64oKP6HEnidkVOqiT-fuMOjXeePh89l1cpUaA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 09:07:34 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Maxime Ripard <maxime@cerno.tech>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: bcm2835: Remove unused variable
Date:   Tue, 22 Feb 2022 15:07:32 +0100
Message-Id: <20220222140732.253819-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since commit 8ca011ef4af4 ("clk: bcm-2835: Remove rounding up the
dividers"), the rem variable is still set but no longer used. Remove it.

Fixes: 8ca011ef4af4 ("clk: bcm-2835: Remove rounding up the dividers")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-bcm2835.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 3667b4d731e7..3ad20e75fd23 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -939,10 +939,8 @@ static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
 	u32 unused_frac_mask =
 		GENMASK(CM_DIV_FRAC_BITS - data->frac_bits, 0) >> 1;
 	u64 temp = (u64)parent_rate << CM_DIV_FRAC_BITS;
-	u64 rem;
 	u32 div, mindiv, maxdiv;
 
-	rem = do_div(temp, rate);
 	div = temp;
 	div &= ~unused_frac_mask;
 
-- 
2.35.1

