Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DB4C77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbjEEL1z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjEEL1y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:54 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F891AEE6
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:37 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id C50403200319;
        Fri,  5 May 2023 07:26:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285986; x=1683372386; bh=wAErQ6YoGoJKVMbc1JF6iosTGKFxws9CGqr
        RFvCkQLg=; b=rlbF5x44TvniVqkBLrU0LQ/XRjqnrDzKyU3fTbreU5mubBh/7T1
        jNwP5uc8KQufDPMWL9Ow8TypEd5rS+4ZiPJomqdDqJhM4RjNqZIXgYKoWIyj6/VL
        sxJ7NgcUShaiN5UNvZxfeNzqa2BpxxuP1zxCTSuYhaMMOHYdDarUZc0YnIjyxpNf
        Ogt3JQi3Nxzm3gEn+Gs2FasfxwkyUSLduHCdl2bamCLrbmIFbR0vMijcxDYTNfQ/
        /0Pp531ZwNLF7fjmHatV4UDsMsw9tHNli9erB/4J9lLFdKzt18qTfrzzayWwkIdC
        nN3jg77KOtEvbGVtoK64zFEWq2NSf+KwdrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285986; x=1683372386; bh=wAErQ6YoGoJKVMbc1JF6iosTGKFxws9CGqr
        RFvCkQLg=; b=dVM04M2qXS7SXRA25u30EoEDCXQss9jTWlpJsCpnyyyjoWlRnLY
        9mIw7DUzSo68UTUemrYtVaCrbnvWjXRv08Tk+EjyIQRj2H3ClaFtnpoR/LhmMMbg
        4SmVI7BFBmlAr6tiIKEesZJ9KZAy3/jYtvWyoHKDPY8zTgxn5P/IAlbos01AdQQV
        X3i63sCN7H8+sDMql4gBCnqWh/Pbamc7wluzeH77kulRzAhZPD0ob97U05yeQ/Nn
        rNJ0bAFYn0aXJCYRVKJnkpeiNyaLrkAQT8ai9zNbQvoz3EIuClsRp3/fbthuLJ0C
        OrAHJMxhq+ef3UWBPMeJSaaSm6TQteOm5TQ==
X-ME-Sender: <xms:4udUZKN99DbjZet98ec2vJ6q0GcP7troZYiSHkViCAm025ug0_H1tg>
    <xme:4udUZI8MNIOIgIZH7ZGXJ85vsqESRj2Zsk2HkRhZkU5pHzltKFTVYY_EA-V5eM0pA
    0Bofgt47RAo53ijPY4>
X-ME-Received: <xmr:4udUZBQrpi3yXzwHacf16WPElEiWqHcN_7PiJ3kWyCutpTs_7i44TbhUtJsZ8kK5iFkMkQLXdncuVokUe5ZeeTOX1BjEyzU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4udUZKu7xw0rBWLaz7Hjepw8RZSVxCfRpSfKCb1X6o7SxspKoejf0g>
    <xmx:4udUZCdOjtiXUx0acIk1uEney1eposRGqUuWiCledkl2pAob0l36-g>
    <xmx:4udUZO3sqG0uxfQsm3lnUae0SbFpKd5eVpD10oteOYi_rmHO2K9tgg>
    <xmx:4udUZDpZUI4WR7fS9InPYM9RPNdeqO_2VX9psT_5jbqprGsSwSlShQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:25 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:16 +0200
Subject: [PATCH v4 14/68] clk: k210: aclk: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-14-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=dKweGBHOPEOF5rM+h1gKLm+p5kHMExLvuvPtl9B+jSI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxf7LDeNW2B0WfHKvmMBpZO/nmA4o3L2163r0cY5FQ0C
 nJMvd5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi3c8ZGfbLOCk9E1qkZ2c0/cP/zd
 /5ls15czLpulPU/iRd1RlRBoYMf+VKdvCr39XYyPS7J9T7x/9TLvs+9a508/l0RFKmeOc5PT4A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The K210 ACLK clock implements a mux with a set_parent hook, but
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-k210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
index 21d942065a3e..b5b8fb29a347 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -636,6 +636,7 @@ static unsigned long k210_aclk_get_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops k210_aclk_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.set_parent	= k210_aclk_set_parent,
 	.get_parent	= k210_aclk_get_parent,
 	.recalc_rate	= k210_aclk_get_rate,

-- 
2.40.0

