Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175E5C7EE22
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbjEEL2R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbjEEL2H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:07 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C281A4A4
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:56 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 4710F3200907;
        Fri,  5 May 2023 07:27:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286042; x=1683372442; bh=S/HR25t5MMz/iMAs8j1aFma0SMCGKNR7/Wi
        h/qTo4iU=; b=IwOxUqPLa60ar1P6+aJ931QDqsVWsUHiwB1s0YvELFe8ZH1ijwO
        ThpDrMVDAP7UKNm6pMvOgWOKurJz1oBhQqAh4iYxEPd3iWsP7NjFtXKYm548B4Xv
        aJwq0L/o3fmx0OkVArKntS/2cZ6W1hBfRJibXUfk5GxCsz3kRkGhiU7O7nXzh8jz
        LagfOBkveVd7f3h6rZbvNN6f/cI5o0G+vAoNqCeq+jw3Uls+8xYPbU4p0KJ7B93t
        Z7pTTlXXOf35LvNYjaWBL0g4vyYdrttN50y8NFBRX9QnsAjJ+8EkhOiXRg2dg1ka
        fd4/85zz53bpKcxSFKIlSYkK/iPPqeBNbsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286042; x=1683372442; bh=S/HR25t5MMz/iMAs8j1aFma0SMCGKNR7/Wi
        h/qTo4iU=; b=IleKLDRtqvEID2O9c9UeRODSr62k0QTNO56AwrfiZFVc9I4lCNh
        q4tjXW/DUjA9wgVPEwrbdCnNMSb5ksoeIS6VywUbHe2tQz5yOfwd7yC7lMbY6o7V
        0nXdu9/krK+oUNLHl2MYZn7OAyshjfl1WYdrBw4/6bpeKWp6dlzR9WucvAy22uhm
        IA5QHuvTFPp5I/v7j2w4O4RzdbpGsSFKD6TcaBpT0HgFsBjzyeZeqe7eE0sPwlm/
        aFUOKWWfXnSy37/bel+5wq0n7ipKhQG5HMqyt6PWy0Zmk7Pz0rAE//sSbYi755Dd
        SbWTa/c5hPjwtZ2HnpoCNF0p5HwYRHf18LA==
X-ME-Sender: <xms:GuhUZMQtP3VkDlLPogDWIwW5-Uic7rYRCz1cVwXsX2XV6HQQVTInWQ>
    <xme:GuhUZJywqh8Sp5IhLEDOymHUyyPmVoCx9oOoK2xBcDml1403Se4y3-q0dRxdlM0Nl
    -TgYWn-xjG9X38PGfw>
X-ME-Received: <xmr:GuhUZJ2yieUonQa_8HJF5OmJnvBwwIxoIMm9KOlCBWYAm8gDYLXKognk3MTEoLzxFx_N6EpYTRyYXwZtgvv8ui2ePDcQnwc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GuhUZACHuYUdIbmaWFWR6OBJzX6NDJvQRtXzs5bcoSELmpxDs6o0Jg>
    <xmx:GuhUZFg_jE-F4gl3k04qMY7NLFScVW0VLSwZl0i9hKyRgn_sCuYw9w>
    <xmx:GuhUZMqkphU6mCvdsjGVWpqgXLHHuRPi4zjTEGWbcQnHuxO26dE5DQ>
    <xmx:GuhUZAWMoyung3qqIQZdIEf4hRZCozKK_Si8YjL0fRK40TAn5VaMWw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:22 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:35 +0200
Subject: [PATCH v4 33/68] clk: stm32: core: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-33-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2218; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=fWYhKhv/wFYwQwGVziH2GFGzuOmOsKzPh9vOFbAKgeU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5fY8m45Jmf+SZ/rxq/8MvYOr+Lu2ccfWq9fK6vwdOaL
 uys7OkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARbmWG/2VbpnbqBS1+nNteLCocwH
 HlvOl9dcmpJeF98/YUe3x8spHhf3n6ScEv+l/FCue6xW/4vnN61jGpzK3J65SWab170V0WxA0A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The STM32 mux clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/stm32/clk-stm32-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 45a279e73779..3247539683c9 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -275,6 +275,7 @@ static int clk_stm32_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 const struct clk_ops clk_stm32_mux_ops = {
+	.determine_rate	= __clk_mux_determine_rate,
 	.get_parent	= clk_stm32_mux_get_parent,
 	.set_parent	= clk_stm32_mux_set_parent,
 };

-- 
2.40.0

