Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B2BC7EE2C
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbjEEL2T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbjEEL2J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:09 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA5F124AD
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:00 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id BA08B3200A87;
        Fri,  5 May 2023 07:27:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286061; x=1683372461; bh=ZIgJ5ijCTY/v1WziGp/hIgqkKCFCnTtWZxF
        yDL4rb90=; b=GtFaWjxlQk8x7qa9yFlpZ0Hy/I7qW4cPVQZTkwWEu4XNDXBFuf+
        I1UFy/W+zOLPyowDr8bog+3SA2HYATSOUpA/Uxml4ItPCxBm4Z43BjYjvwCwq0sJ
        fWvgsSi4DDpMk9V7v0eGn2zeDm9HOc/zz+4MAjFlMZ3+21XoZWAXhLdJKYtCgM4r
        1jMoVj771dInkceD3k8x4YMDdrvuG1qjyNPDInIQUqqoaojstF4u2sGw1js2WlFt
        lxmQGcvbgwiOrQ1SS1D/Y0gTjMMskVaoOtCM96gA/B860Ci7eR2PGiL3ITsq8G7O
        MuIDiv0vZut/Gen8TyRqMY4DZ/yBF0ofHcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286061; x=1683372461; bh=ZIgJ5ijCTY/v1WziGp/hIgqkKCFCnTtWZxF
        yDL4rb90=; b=Pk5WQuTCuy7NKd1s+Qq5Y99gn+uLSallJmXEAeCP+5O3Qco8/oO
        TXFMjRdAAzPjGAgb0gowlnlSXHnBWObOCIDmxYVdRPgQWjZ/M8T3qFDDssCw2dwW
        hhm/UEkyizYvvPC+/UaUs8jpHwMXW8oMowEJhMtEoc4ym+apRMUCZd14kH2oh8Fn
        j6SbQeE+9dVl5qZ5ebslQI3giIQiFLLiy0rCXb7VN7RRS5nXirCy5ZfhEg7ID2by
        scyU+R9GkMkmQUYPqnLfGAAYboYARiryBg75pL5nQI20GP9Rri16UnRd0SKEv9xZ
        fKoLkLFlIeKb2kPlRVIWiEGJieiqv0lLc7Q==
X-ME-Sender: <xms:LehUZAUsfIe-TmqIA6pedSJQZXkDG9SSX4tQhqhPPA-TFkCa7yxx9g>
    <xme:LehUZElY_XGH8uoxoTkQrQ_GNDBUpJoz3uXch1Pquf9TqfOXcUYBJZevImKrxLwv-
    6MijLrs4wlm_A4KYJs>
X-ME-Received: <xmr:LehUZEaF3M51bEpgnAj4P-tMZ8Ks2jyZ0CYtXzyDapsLg4mH7YsR1lFGGDsP2yyW1ZhjZ9rHMiFiyd32GTfuZ-3lKZyqzr0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LehUZPUODQljlSQntS2mVdNyaKpl6PJ8jB54GQi0ommhjf_Kdp0Emg>
    <xmx:LehUZKlAHxIgPPxv-rKpFrKDwfOTWWikG8wHz6ewblMnoeup_dm8cA>
    <xmx:LehUZEf6GHZ3riDA1A3X7_F4sxoKQgNzB6sChfbass81G27JBUtZ9Q>
    <xmx:LehUZBte1i7df4iT5qSmNleGcB-iFpwGA0mcvZZ1-oTXhfxbMN-P_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:40 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:41 +0200
Subject: [PATCH v4 39/68] clk: versatile: sp810: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-39-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pawel Moll <pawel.moll@arm.com>,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=f9fKx6fagdMn/NSMW7Lh8JOOu9FmeFzPoLjoO7VByG8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5e0rN72n/Nt3c/nCW4LC2auu5fTPiNmZ1v+pQ4rubLt
 MjdjO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRZG6Gf2ZvTRh0jGoUY95H7ApdLT
 jBPXtvxxdz359O21nuHflx3oWR4XLpxn0FnHfve+i2nO7eIanz30dHbvcRRpa5FuuWTlinww4A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Versatile sp810 "timerclken" clock implements a mux with a
set_parent hook, but doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

This mismatch is probably due to the fact that the driver introduction
predates the determine_rate introduction, and it was never revised since
then.

The default, implicit, behaviour that has been in use so far has thus
been to simply keep using the current parent in all cases. This is also
the behaviour of the new clk_hw_determine_rate_no_reparent() helper, so
we can simply use it to make our expectation explicit.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/versatile/clk-sp810.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
index caf0cd2fb5b6..45adac1b4630 100644
--- a/drivers/clk/versatile/clk-sp810.c
+++ b/drivers/clk/versatile/clk-sp810.c
@@ -63,6 +63,7 @@ static int clk_sp810_timerclken_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_sp810_timerclken_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = clk_sp810_timerclken_get_parent,
 	.set_parent = clk_sp810_timerclken_set_parent,
 };

-- 
2.40.0

