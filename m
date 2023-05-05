Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A341AC77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbjEEL2W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbjEEL2K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:10 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5F21A498
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:03 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 0A3273200392;
        Fri,  5 May 2023 07:27:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286070; x=1683372470; bh=ZqWWCTaATy5XSTUciw+UNbPyEawQ8MyH3x0
        a3qEf85A=; b=XS/EktwME1WJlmDo6QXSNLCLczhmy5Z5BoauRehJcHiuXWua0tD
        DFyG/Oaf0xhKo/M+M6CTldSSPlwPSoiYvMMsYqRB3Vwh32OxVkK3NfGq5VZ9n4cu
        bGtyw2Eg0eG+bpleO0BN0++fEkR8Atb6tQGZlPy3leJsZRxHqQ0vv5BaVHhINUEt
        CmXlfPrlu7LYYXTOx3KBxD0qYUFHYYkZO0F8NkZsFK4EBtWYorvU7hoSkbXwgDLB
        6skr/q/9Ch03pe6NpmxLANXX1flsh3ZHlU0UiVN7iUPivyFLOZVM6DeUsAdH041P
        4lDVst3BSrczawFdj6Xiwb37BryCDc3qMTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286070; x=1683372470; bh=ZqWWCTaATy5XSTUciw+UNbPyEawQ8MyH3x0
        a3qEf85A=; b=U3ztZOhHqjd+jCZyT2BJiLTwjC+6IjCkRcW2YMgod81VyGpZfOF
        G+aICDv98ichyteg01Vn8GAaktO2jdIXoRM6Y1IfrmBRyB1GoIv8lC70DR2aL9da
        UoXORNwdg+ZMRwbN9US55ywQVijF0wd/DQ2PfZBMSOkioq3kvGcEupXd7MdEM2UP
        UYQS2ue81z/k7UVObmVeNu9FCDHzckuvJMe1eDjHK5Ko9lnsvBNZIrEnjtl/0x32
        6h/C8fxtFZrHc756bgmWIBGnHfwMRwuonUNxEgMPE8RXLQ9/+bAF0UA5KPTyTeX7
        63pDjOWM1ya3tLh+W1aUVzXkUMrtWc3ARnw==
X-ME-Sender: <xms:NuhUZGfK41-EQ_OJp_C4KYaPLtWxprlHvVyI1F-2fJVM2iRThddEJg>
    <xme:NuhUZAPUv6xdul4dkdG8HF-IJOQENSiaoZTXCv6ZoZWf7PfTEd6epSBjkkFHTgpQV
    xhWa6w9WEQjPoGz_Rw>
X-ME-Received: <xmr:NuhUZHhPTOpZ4wJX_L-XSVkGshhOeArKrRPt8W6VYIHerm0YSVF6Nc2Bfg-TgXmA43LNXyai8DEvZrFaNSvXy1w0IZ5tQ2s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NuhUZD8SZ-ljs24Eja-Bd9UWgs3n_X3ckGQPa7Nb7NngqtwYGfql8w>
    <xmx:NuhUZCsjn6sm0sNb1l0mbMcW5eFEgG207UZyduHuhwiqOgZFWaXHJA>
    <xmx:NuhUZKE35UJxbNnbZl7ZM94i0-lJSFkfzjVwqL8iMkvYJ6Ye23hpGw>
    <xmx:NuhUZEUf7SqPA2PKQ8AVT7zyGl-qBf9GzR_5bw01DpmCEsm41GTRag>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:50 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:44 +0200
Subject: [PATCH v4 42/68] phy: cadence: torrent: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-42-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2322; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Bsnnmu3ko3iq66fTYmm7x2q0vUeCBXrRslNG9Kl5kIw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5cI2LmsPO4x72iqk/vVloVLd181NWN/pxdrxnw1eX0a
 O/+UjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwk/S7D/0Sp+6opPqnHbGaE3G3muH
 HWvuTEUS3LHW6cn3Vqag+/4GX4KyOzflH6t86v22eULb2dprPKWedOFFOoUqp1e/6GR+3xrAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Cadence Torrent refclk clock implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

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

Cc: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: linux-phy@lists.infradead.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 3831f596d50c..62e59d1bb9c3 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -1861,6 +1861,7 @@ static const struct clk_ops cdns_torrent_refclk_driver_ops = {
 	.enable = cdns_torrent_refclk_driver_enable,
 	.disable = cdns_torrent_refclk_driver_disable,
 	.is_enabled = cdns_torrent_refclk_driver_is_enabled,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = cdns_torrent_refclk_driver_set_parent,
 	.get_parent = cdns_torrent_refclk_driver_get_parent,
 };

-- 
2.40.0

