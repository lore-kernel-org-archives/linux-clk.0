Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF78C77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbjEEL2H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231686AbjEEL2D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:03 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E24FA251
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:48 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 200D43200A59;
        Fri,  5 May 2023 07:26:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286014; x=1683372414; bh=OAd15fQVmoG1w3pF5vOuEMqIGTZk2GS0W6c
        WqzeYFdg=; b=BIEVQDn1rtNWPpC2cqNklWE2yClMaYQVb9lQGGp/ZRGty+g9y6V
        tm2yxbQCJs6qBLTAKcscaahWka+4cb7XRY+xf4xQ/TECvKdJWNemDVKlnMMPweps
        7M9Os2lMKMbqwViqXVyh5qZtlimNB2MEhuT+iLfm3ryaYuuDGylJ+DBNsNgPWmcu
        YhzXi5hzq09V5t6cGVQtnc3I0ZqgetZ0lH/f62FdA5t7zyrnCCa3EpADeJY6KZ7n
        rhE1dfToR6+ZJp+uKqABGLud85tCOUY57uwC+NltXjc0TTCioK6MZon4JO5NEBjf
        UyLgcnqfoedgZ9yR+VyBVIhEGd1MlDUXlQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286014; x=1683372414; bh=OAd15fQVmoG1w3pF5vOuEMqIGTZk2GS0W6c
        WqzeYFdg=; b=ANeL0e61AYk4I1ZWXg0BmKRvx0NRJDOdPD0y9/end7bYQvhrzfr
        m2r2NZH3Fm2MpBGVcMJwrXuiFmvzmnITeRmssJsKT/6jOCGrPsGK4R6V2kxwzRLt
        6jktdMRhD7vciRLQRFKp1p4OmxYHUqCCcHfCzgHuJTDLt8BWU1wXFAbvnT/YqpQG
        47vlkqS6yiNYZjRpCE/CgkimHu3f7IMQZ+vrcm3+smISI+OAK91qxPBj2PLufGq0
        MVO1gIgqel7qe4kczS6Fzri7mYNxnIJ2PBlyBd7pOS39FgzU7oFkXBGzhHALS2y0
        uqKmoTNSUoZSEyXsvxpo9mCMd2rKmsuOVyA==
X-ME-Sender: <xms:_udUZKMuhfDxtwC-OQd99MD982vKkSxutxQ7_-SgUVIzsGbkrDQhAA>
    <xme:_udUZI9p1bA0oXC_qxR8sjv27U_THfr-RWy5n8O9iQT_xIHTus7q1xbfrBdpdqPHG
    U6w6lSnziIZu45a4fU>
X-ME-Received: <xmr:_udUZBTE6FAhCt6ElGT2MtCqbZ8JWNjMnfqrTiu25Ur7z7VJqWNGD-B8H4ZL6_Tw5_xiPQIrpJPxtdpMcWdxz_72656tacs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_udUZKvgmPLxSnXXfmEQF_8IEKT2GAIr7HvmfFFdOkhQxjj2lpmQkw>
    <xmx:_udUZCcP2UiGxDq9eqbh3Zs2XvjMMFQ4JFmPGno8j_NmWz3K3EWmIQ>
    <xmx:_udUZO0Z41LePsgRSlbbMsssbW1jfcUf_ISfJYQ1QGt1DroeZ9arUw>
    <xmx:_udUZB43QLhp77DyOvTtEir-h-LDPesSYZzvqKVQl4GgsugBujpWpQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:54 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:26 +0200
Subject: [PATCH v4 24/68] clk: davinci: da8xx-cfgchip: Add a determine_rate
 hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-24-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=q8O+ecKOecgcGF1E9rmnxw+WX8oWLqIpK5EnNjUsqBU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxcvqOF4Yu/uMmHxrXmSE7UrJ549z+VzItH4+JYnunf+
 f11k1FHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJ7NjD8E9l/wm3CQaOrPXHJ9xxjP
 f8Z7Ne+ciJnWI+cz81Oq6f1ziD4a/cFa2In5May+IPOF5WOOfdYmrz1tukmUV6l8XsyYkHP7MDAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Davinci DA8xxx cfgchip mux clock implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

However, the upstream device trees seem to use assigned-clock-parents on
that clock to force the parent at boot time, so it's likely that the
author intent was to force the parent through the device tree and
prevent any reparenting but through an explicit call to
clk_set_parent().

This case would be equivalent to setting the determine_rate
implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
determine_rate implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

Cc: David Lechner <david@lechnology.com>
Cc: Sekhar Nori <nsekhar@ti.com>
Acked-by: David Lechner <david@lechnology.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/davinci/da8xx-cfgchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
index 4103d605e804..11fcf6f63336 100644
--- a/drivers/clk/davinci/da8xx-cfgchip.c
+++ b/drivers/clk/davinci/da8xx-cfgchip.c
@@ -229,6 +229,7 @@ static u8 da8xx_cfgchip_mux_clk_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops da8xx_cfgchip_mux_clk_ops = {
+	.determine_rate	= clk_hw_determine_rate_no_reparent,
 	.set_parent	= da8xx_cfgchip_mux_clk_set_parent,
 	.get_parent	= da8xx_cfgchip_mux_clk_get_parent,
 };

-- 
2.40.0

