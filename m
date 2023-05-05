Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F1EC77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbjEEL2L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbjEEL2G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:06 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABD51A1E7
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:55 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 495A03200A7B;
        Fri,  5 May 2023 07:27:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286033; x=1683372433; bh=/i+cJO9hgrelELHuygbUc6YJlM/CLtsZbPc
        mqo3eh60=; b=RAJ70Y0pEuiL/DZeSzRiVN9Ypqhz9zy38b0SKOHh4di4PthjAnH
        W9dt6AMQHikGrbgdG5ni2qlokFODLDMqD+E43U8MBjdyafmPezfKDsA3eH+kz2rv
        8QA5EbFiXckNTNK+wF6Bp8O7iyMlMSKjbwis6LrjFzGP/gjF/sEcTVc0DN2IOEFO
        SpgivpaFURR8JL/uctqnc7dMgk94QHOVMQtQk0bgl7Y2y+/ThOV43iqVrweShT0S
        xRL08EqKF9uEz2d8KiAfXGxK2h0T4irzOw0SUo6wglAHYqw4fdH21da0uTZtHebp
        0DYIefTONRlm92OHMtAy9kXempuhdOz+zlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286033; x=1683372433; bh=/i+cJO9hgrelELHuygbUc6YJlM/CLtsZbPc
        mqo3eh60=; b=Q55CSGr7atl5SKN156azRzmfr5ntklFaPQtcLBFEa2NwPc6WbSy
        dRl1ta5Wsj0OmCfSegqKTROqrg4YoqZ3GXiQCl2TRMF3kQ7c0zYLT4LtH+aohiXY
        yrrGzh9fBzU09JdWHMyUZGVNNuClTZO/0tS5oE5RY1SSQeQPU3Axb293Fo/wt2/M
        J/DbpgFyuRpqy50sq/vdTWwkPz4rM2xRms0fIQfVxOl6c4cvwtH+WNZlhk6AtphC
        3IpdZ3j1ay8U7O1jmyF/3vfRt95Y/pZV1rMk0fDlhkuApiEr2MhWpJOSVJZOQof/
        p8PK0rLRcAOo3fm/LvwaWYL8jFNTcREeLgA==
X-ME-Sender: <xms:EehUZCmH5syAq_zYpigpW_q_33PlulsCRdqdGDv5u_1UL-hGeDXPfQ>
    <xme:EehUZJ1-WMvuQceMdIbA97qB9Re_111Ves-K7_WMbGeMcKJUPDTf_4KdUQpomYxxD
    B9kHz5rPch_IdKd1y8>
X-ME-Received: <xmr:EehUZApPi-w0OCNCLSh-qdFFo6qfNQCMPmaoXKg1LGYx4Z-5yx_8fD0GxlLa8fmPAOrOxu-NDePa84pcJgEeALIXIUSqqJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:EehUZGkPb670xTiC4HTNhnlYXPq3zd5NzB-9zGS164--8odrjXnGgQ>
    <xmx:EehUZA2qMYzWQhmz4z8Z11L5s4RpDbxs_08xL7bmypdXnPUqY6rJGw>
    <xmx:EehUZNuxz9oHrsj0OJMga1yshTgpOZv2obsDlQ0TffVKM3PBePgydg>
    <xmx:EehUZOALsU6e6FtLRgj02MG0My1zaUUSPiuxwTvZgjDRDttycbPhyg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:13 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:32 +0200
Subject: [PATCH v4 30/68] clk: pxa: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-30-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2027; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=m312RSij+VFSlVDTkCDRhnurxOM7jCleCPKsMBOYKro=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxf/5DOuKV3OfrSoj1fFyTmgKO13YmTBruhvjK6GH5ev
 n3e6o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOZyMzwv/Q7Q0V54VLnc4wRbja/jq
 0+U7j1rtHm68sa7ASfnW7T+cHI0DLz65ylyvubD3n1pOtNWW/7k3PmJcEjeZ5hxedSkvWiWAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PXA "CKEN" clock implements a mux with a set_parent hook, but
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
 drivers/clk/pxa/clk-pxa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
index 374098ebbf2b..ebee2afd05de 100644
--- a/drivers/clk/pxa/clk-pxa.c
+++ b/drivers/clk/pxa/clk-pxa.c
@@ -82,6 +82,7 @@ static u8 cken_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops cken_mux_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = cken_get_parent,
 	.set_parent = dummy_clk_set_parent,
 };

-- 
2.40.0

