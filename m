Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6A1C77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbjEEL1f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjEEL1e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:34 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63FB1AEDB
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:14 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 3F82932004ED;
        Fri,  5 May 2023 07:26:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285968; x=1683372368; bh=zDqPNVgxehdt+d+0Rr42EJ6LftKM559oonN
        ommq2qIk=; b=pri8FCY7oZTJqHbi2yKilVa/a87CJh0hm26FnYT/Y9UaMQ4QgnT
        eSAcyopl73fFZiMfMffKlhPNzTscgugu64vB++SmkKBXCiWDEb8oGiHJm+4Xny3t
        PrrC4PTYGnMNaUosaJG3e+wRgT/RF3ng8irnxPz14C+oun3hCwSVJ1UevIWM/thu
        URIBS5wsmPhYF7cFPXheRfOxOL6iAutSUnbnvxP85db3MFIX8Nua4O2Kw0Mu2Ktf
        L8Z6iBvm4Fj2PfaBu4EoJOHHZEoML2DbeHDN1whE+lsLOqjUzea1os9iTrnmy/Qh
        Vqv6zr/lv71m6/AmbsTjhlkEWE6LnEKkCxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285968; x=1683372368; bh=zDqPNVgxehdt+d+0Rr42EJ6LftKM559oonN
        ommq2qIk=; b=PdOMyPVVipeA0qRMHSr+TbHLmCh0kmuAQ0g3GNqaiVEVI412zLR
        ijs3R8kan4JhUAZAjb9d37P08J4H2G0C4rgXcNAPktAHSi/IngM2PgpBr/iHemHt
        2VnKKDVWvPUCcC0shAxUYzP8EWCgD3kn5HD25deHB8z8LCsR5WQzt53jAF8qr8Kn
        //u9pPj9WAUlQwGQBkPwjDt2k8P4Hmxn82STRLunFGU9SwTic27P/reGqpLsgwnN
        GO08RxFI/bkg45Z8fHIqJZZv7h5glXas6NhoPRgA/haCJualiLPF7oNbfVM/r21K
        cjcztixjxi90/NsKvnR7k9nGQq4DwxohOVA==
X-ME-Sender: <xms:0OdUZGhZgfhs8wgy26aViG44_1vO4z3v4_VIm9ow8ZcESoLaz_k6xA>
    <xme:0OdUZHCdPOnDjlRScfvOYeKZe3jVBJD9PoeAhf1ZN75sX_J5GXhMna-gRF-2f74RJ
    L-vd4KMG6C2igbzEes>
X-ME-Received: <xmr:0OdUZOEA4v5_KzyZEkYuDNRYrHJqupf3zBTCpcycRbjuuXVJCEXTnNPlcKCAMckIzYbTKoC5igxir2fQS9zFhDBrQZI8gE0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
    jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0OdUZPTxU8VcP9HlXL8H32VjfhwbKtSV_Goo_LLqg_koWMfc6_ujTg>
    <xmx:0OdUZDwBU1HiZIlKWtZQkqoGASPMLEPpyP3_9PMIPcVTkXjzKX7Oaw>
    <xmx:0OdUZN4Kqt-cdz_hVHVGJh_T_QSHpasF44ksD9SZHCDSTaEMc4LS9A>
    <xmx:0OdUZKnoF0rQRFgAFM9EJjs9LGgfbGUUA7MfbyZIFG59AbWipcQUSg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:08 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:10 +0200
Subject: [PATCH v4 08/68] clk: actions: composite: Add a determine_rate
 hook for pass clk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v4-8-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-actions@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2251; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=hcjjYUL7EJDA0vLr7YhiayUeo8EOv+6/jhAeGWoQsRM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxfJ7fG4/nRTTkirY7FNxPaXGbz2UwxM7y0/fMP3cfxn
 xpv2HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIxjOGf2r3D9zJV68U8JgfKTFZj7
 WAWf/yD0+XGNbiHaf/q8iIJzL8s5G7c+p1zlm/dvb2wgxj1ocukuKi7kaT9me5f/zTcvAEAwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Actions "Pass" clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

Similarly, it doesn't look like the device tree using that clock driver
uses any of the assigned-clock properties.

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

Cc: "Andreas Färber" <afaerber@suse.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-actions@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/actions/owl-composite.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
index 101706e0c66f..e7784f9e5bf6 100644
--- a/drivers/clk/actions/owl-composite.c
+++ b/drivers/clk/actions/owl-composite.c
@@ -189,6 +189,7 @@ const struct clk_ops owl_comp_fix_fact_ops = {
 
 const struct clk_ops owl_comp_pass_ops = {
 	/* mux_ops */
+	.determine_rate	= clk_hw_determine_rate_no_reparent,
 	.get_parent	= owl_comp_get_parent,
 	.set_parent	= owl_comp_set_parent,
 

-- 
2.40.0

