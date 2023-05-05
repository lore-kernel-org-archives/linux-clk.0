Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0777C7EE2C
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbjEEL1u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbjEEL1s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:48 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0741AEE1
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:31 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 5346E3200A5D;
        Fri,  5 May 2023 07:26:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285980; x=1683372380; bh=hHUjGYW9+1gTGBkIiyEjEB8BwK1/hAa4C82
        O+2v6mcg=; b=Z+3fCcqX9ygwcck1U4SjIceijX403DaO/8QRsxb0xxx+W1JeJF6
        HO7zPSmLCaobRUAd1CUw/J3U76h3yVY1AE5rR+X7dPL7DffUtGlX2nC92VKLe+yV
        7QqBmyivDK97JBGORaP7xENxDwJE1hqWSDhCwGDyOgf/TcKfNsM2cKJ7zlDm6zgd
        8gw0VMgGPg2/D03sJW9/vgGGL4DRumwui6kgR7rJwakgSb2AveFm+hZOhUtw5Lyo
        c0wbXp0Tcg4HUo1jmt+YnuOg0sQ0S2aszCdcMADYkKkEL3gXFQadcEX7tjtLPI7I
        S58vc998u3bOYajMbghBfPZbYUcmNXsos7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285980; x=1683372380; bh=hHUjGYW9+1gTGBkIiyEjEB8BwK1/hAa4C82
        O+2v6mcg=; b=g4L9mHpNKeyy3ZBsM8ip37+W9IvevlBEtz/eLxm4+BardMGnDMZ
        35sZdkT0eWgEATvwLQvb2XJU2z4zpfRmfZdSpRk+mpIotlJkDIpM4YImOESME4oL
        JY7JNmjxGh60TJnYEBe3FdESQIe+w3TV1o8x9Z65miAek7KjRDVK9bruLrHeWqnN
        /5SDEVStF0z1xk25805xXlw6vjGeCNpAPgun5osX4L8RRUiBv7HZuaVK4Emr+bFP
        O2YD0Qp2MCNcb5Ab8ELvgepnpWtA+F7UlTyYXyG5bepog2r+Cw7h/BT1qm1gAbrE
        Zd3MRo0WZg6u0c4a+N5FV7QrKSEF9JWiVCg==
X-ME-Sender: <xms:3OdUZH-BonxUPF00TPDrEt895D1ZVM2J-qbQek7-4CkNKfXmoJZnlQ>
    <xme:3OdUZDtZk9zFxiNrP0CsDk6m0nhJ0xS5BMEObHP93uR0kKMfgN1HFwalyd1kTLfcs
    Di7gruMACkUZ0MRVPc>
X-ME-Received: <xmr:3OdUZFBYrLCDYp4O7TDvpgPR5RwVOYjcpWvYPDyOTriTnaMuWGaW8rL0Zmhnfgz646hwzNHeAByMBSXHA6SJNPLcnB_VnfM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3OdUZDfmXB-yF23cldFMKr_t_gXSd8_WV3YTRM4VVN43Mk0KwAjbCA>
    <xmx:3OdUZMMzW_r1-e2KZoXdH0Dw8zVaMdqdZDchfNXuOLOYBbQWIXxD8w>
    <xmx:3OdUZFnYANyeEkTwnBV0q9fRRm1t72Q7nwqvPTnJWwhODrjUg_YYCw>
    <xmx:3OdUZBqQAFRFAmaZfKhmzQV84mt1zPh_XIDO08M9BR7HSnrdwzAmdg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:20 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:14 +0200
Subject: [PATCH v4 12/68] clk: cdce706: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-12-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Max Filippov <jcmvbkbc@gmail.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2100; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=MiHs8cCznddkbJuUwcByfTYYV8u/um7DYugP8Tqbc8g=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxevZdx+5vuB+YLzLnZcn+K8Xi/Jjjvgk3RP0ZMpvQ+W
 +v7Y2FHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJuPxlZHgVU/T7qeuPdbGO7N7n/9
 +v273FYZkztwDX716Xmrxj3X2MDF0X+gQP9/+aqmcf5TPZNmnntf7oLfe+HdxrrvzLSy4glx8A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The cdce706 "clkin" clock implements a mux with a set_parent hook, but
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

Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-cdce706.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index d8bee8180a6b..139aa0954cc1 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -155,6 +155,7 @@ static u8 cdce706_clkin_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops cdce706_clkin_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.set_parent = cdce706_clkin_set_parent,
 	.get_parent = cdce706_clkin_get_parent,
 };

-- 
2.40.0

