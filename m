Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21454C7EE22
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjEEL1g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjEEL1f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:35 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA531A4BD
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:15 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 5D98E3200A52;
        Fri,  5 May 2023 07:26:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285971; x=1683372371; bh=m1472fUUYrOyi0qUKoAVXtkZC+K8EvbFPKp
        eLfxLubU=; b=fpwsbb5lKPLNI7c/qNIPRgSDx0XoUyspS0B5SnZ/0vhrAoEfGM6
        aQ1TDIe+eMlLH0+EJmmMnxDy9rd+EGRA6PbqoiQ5sX/NaS3vyx9epQ5S3JmzDZ8s
        tBEGPIOZA+4mle3kSIT/JTWCKr/+UO+yKerQ3NPiiEO5Noy3LY8GuXGjKisgtjcH
        hpis+Yyg6KJFZFbbmFeHRJFStx9tov0jEnbuhbt20uJNz4OXPV07omL1X8sIyMst
        XFN87RutrZRqFB2VpDuig+erbbwrWa5OoQgPjWwMTkD8OXKSqBZgiAFxeKAU/Q7B
        h1Tl2gSq6p4Dy/xD0IzeH8gQ95vTVnLwAsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285971; x=1683372371; bh=m1472fUUYrOyi0qUKoAVXtkZC+K8EvbFPKp
        eLfxLubU=; b=YRWl3QNiuTiEZ48r8tvAIs4j05BqYHsuVj+RbxhQ790wIJaFS0r
        CtD+vUtZUlaTIftC8NAPUCDC1eKGsSqtX5ChYhTZROA81O4T868O3UJZc+VbYIpx
        5LjWDk3lBvkmgHi1QT5jO0pIO7bJPgtoHGInMRdMKunua4dHZj6lpfjW1nKCcuWF
        4/f0tckUAbxB6LMY96A1RS4Kv2FzgNkC9vYj5txJI4Pd0XDHL60fecIBRPbhL7V6
        ouwIfoj8KFHJG9Ru8ufKLxjIE+5Hdo0eUysr9Uq+k55T7927+AJGlbrsyFJqov6d
        tGhixYfOy7oLE5NPQNQhm95/XQIwk5NSK2w==
X-ME-Sender: <xms:0-dUZAIp5X_rSVRQHPiih9aWgjPwXMXg9W6OMcPQtoQXn3QEFjECAg>
    <xme:0-dUZAJeOCm_tso1lNZCH_rtBCQc582mIZR32u-lql7ELWK08GEReiTCGX7GK49G6
    -ahvgWqqW1Vm5NoSJg>
X-ME-Received: <xmr:0-dUZAsrro7sC5Bt_eiSKMtR7GNH2hwTdoO46FicHh33mmdnNcQ_UvHNfcTf6AwOmA_HyO8vmWzah-vVkNagxFpPwBHLTBs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0-dUZNah27fG_wQpPMJGoV6kLCAav6lu-bC0Ixr9Gg7fNlHyuesM-A>
    <xmx:0-dUZHbwdZ3hTFqQ_Mznj0rpSMuBBEGRzUlbNcgd5yXCV5p7zNw3Rg>
    <xmx:0-dUZJAC8IKDfOe7ZZ7qjkTnUp-02KcFe3pBuRyrwyZaTD6T-2EsCQ>
    <xmx:0-dUZMPS1kMIRSv35c1LrE-gTju6-1TCjDr3jJ5Mh1kMCwaN3DAVaA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:11 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:11 +0200
Subject: [PATCH v4 09/68] clk: at91: main: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-9-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2380; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=H9KRPCBcjEpoRfMcvh/lzMCqJMQ8acMLWyrCaLBibMo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxfVnr+w79OKe/psdqxlidpxlXEX/ab4R368c/aJ18MP
 S9XXdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAixxgZ/oe08q/2sRJ/zNO++GXkBb
 4FoXtumXwVt7h5Xfn9Gtu2Q7YM/51jra9wLnFfvn56ud4yk8byX5vrZS8FaZpOkCi+OeONNQ8A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SAM9x5 main clock implements a mux with a set_parent hook, but
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

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/at91/clk-main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
index 8601b27c1ae0..4966e0f9e92c 100644
--- a/drivers/clk/at91/clk-main.c
+++ b/drivers/clk/at91/clk-main.c
@@ -533,6 +533,7 @@ static const struct clk_ops sam9x5_main_ops = {
 	.prepare = clk_sam9x5_main_prepare,
 	.is_prepared = clk_sam9x5_main_is_prepared,
 	.recalc_rate = clk_sam9x5_main_recalc_rate,
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.set_parent = clk_sam9x5_main_set_parent,
 	.get_parent = clk_sam9x5_main_get_parent,
 	.save_context = clk_sam9x5_main_save_context,

-- 
2.40.0

