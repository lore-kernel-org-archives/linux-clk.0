Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2EAC77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbjEEL2Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbjEEL2L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:11 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8370C1A4AD
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:04 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 7301A3200A69;
        Fri,  5 May 2023 07:28:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286083; x=1683372483; bh=QY+V5lPmVDXybG9VgRtR0znuG7ZDuRaBTAF
        hAodAf4A=; b=iBYQUY6wO2qMIva7UzlQXla1idt+4UBi0e1Kkupg7eyOBnmC/MI
        ER5vkbc/T8hC+p/bPT7nHuf0ArsBp50/O7T7fxEQLQmlpLLrXJTXsBOgxIFecsJd
        gPaKKrltQFP6e7wYpC8NTlqM5QJ1/C7HOVOq/AkwhGwt7m1sz+c1hZM4gj/5Cfxn
        lrCw1CqOJwngE4QWLBBAo5fw8Aqd5uNHfpwcMunLcSL6eLeH03AEcoqy+wlrYUR/
        FfBDMQW75xsQPuYyTN+3hCG2D5tgpx2fZdhGaGi82agi9+ajgYoDVxljq0rXImpf
        MaBxl1q7docEx8h5Bh8g3pqO7noWAzvUNwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286083; x=1683372483; bh=QY+V5lPmVDXybG9VgRtR0znuG7ZDuRaBTAF
        hAodAf4A=; b=diLbfMZUlPQZjZIyBZ15+PO2k3s0U2DrirOlwTDSnHuBNuPIllQ
        aTau97/r4kLd66ZVZT8URE71iqlzHvBB45r90rkKz+lwmrMf0/uupa91qyfFJYyR
        vDmXTaHekVJts6Yzz10kuFeIIrrdOhm40qIvEdlt3dWJtbxq5DmDDJdL2SFB2YP4
        PHQpM9kasfW6jBIuIs+cIVue0Z9lkgAgW2GiVYx0wU8W+K1HX2q2WQbEDU2Y/o5X
        5x8YxE0iE9ObWxc8qLBWBB/ZUOqIEqpFqbi7D8H4gR/oDrTo5oxIgo1ODjBq9+pT
        asLD0XPgRvqPsuHxzvcwuHCz1wTvUyi+zzw==
X-ME-Sender: <xms:QuhUZHVgytubz2Ju8Cs5OQimolsQR1ucyAhBH8VkIKyEgiHvKNAC5A>
    <xme:QuhUZPlLphFY0b7lKCxbdXA_5pyqUKwtyXuAjJ7ZOXpZPVGy3hp8tWMD2uZe8bCW7
    _VhCrXU-C_I_fnn5yc>
X-ME-Received: <xmr:QuhUZDZn_NoaacvJlaQ1do2Q5PKuJc7pjF0nbWYtLAoHO2h_oFxMEkQmKDxNpcWjyX7UL7YiYjCFFqWubvzetsK2PvSn3BQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepleenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QuhUZCXi3UDqfJxrAudgwGA4iQ413bb_KDNGT7xa6DEevu9ioPifKQ>
    <xmx:QuhUZBlMBsQD1DnJr7Mj1oWeZb6k_kP1aqSbL2gyEBeACBYFwaYEvg>
    <xmx:QuhUZPd4_3Rgj5Y4SdUvrJFEwDphvdGAYv4E9GJIqaBgwEva1JrnPg>
    <xmx:Q-hUZHXGDod_Ykc57VhqAaCkZQqVv5S0cQuGeG4mBSKDde5CeajCmg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:02 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:48 +0200
Subject: [PATCH v4 46/68] ASoC: tlv320aic32x4: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-46-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2340; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=5GoNJ7VXnRe6Eemsco6VvAqm0b35vr7XzE99xXo+B4A=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5f8eCHs0iyzikf9fkG38Rp9NrsFLmJfXgk/mLuEd8KZ
 +j23O0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARwf+MDCunOjyqWlf5WeHzG/uwCQ
 3OK2dJyTd5tSmG3fsQynlPkY/hv1vYKiMLw6qtLKrcf74q+riKZ/47d/3plZfvf/uZuB48wA8A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The tlv320aic32x4 clkin clock implements a mux with a set_parent hook,
but doesn't provide a determine_rate implementation.

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

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 sound/soc/codecs/tlv320aic32x4-clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index 2f78e6820c75..80cbc6bc6847 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -292,6 +292,7 @@ static u8 clk_aic32x4_codec_clkin_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops aic32x4_codec_clkin_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.set_parent = clk_aic32x4_codec_clkin_set_parent,
 	.get_parent = clk_aic32x4_codec_clkin_get_parent,
 };

-- 
2.40.0

