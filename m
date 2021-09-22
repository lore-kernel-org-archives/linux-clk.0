Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DAFC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 12:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 559016120D
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 12:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236001AbhIVM4A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Sep 2021 08:56:00 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:37493 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236045AbhIVMz7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Sep 2021 08:55:59 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id C8B0F2B015E6;
        Wed, 22 Sep 2021 08:54:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 22 Sep 2021 08:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=mct8oUUoPQCmb
        XzWWfTX5bHQO1PQnsAmowWUCVA6sbM=; b=kPF2S1eZC/yeq7ngJhq+C5+2SGDMc
        6g4R1BAPfpAat8lECFY5Qkoq65WHuTO4E9HX6wzqtzj7+ox3OBgqrBqJ/T3b8A5e
        YF/1b8e9aNnEFQ8TqltOXD3/V9EowkY0/51V3bT0fLv3S6kreDMiWHYPiP1nZw9L
        RLwvioBr+1SE8H3YchGUGW3p6JO1Cgm2Fog8Y3OIAiy6zb6zWHXEmp8L16CNAQBh
        vk/zMEcmZ9yO50LS4ngIOh1Zm0A9cliUHFPRn26rG0ndnhGpf3oTfHq7V7SR4i1M
        BfmrwlDPXF6Ue84DaTvUMHbS3+54opSA4lpCNoksBRbmnW+QBbCqCsU8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=mct8oUUoPQCmbXzWWfTX5bHQO1PQnsAmowWUCVA6sbM=; b=DN6t97Tw
        jSFK2L1Ng+NOpe/Ux3Nfrhg911RsZFPi5WMrMM948WsA/MdHOePn22GLZtktEoN5
        yp/6eDN3XI3krIVZFZKEHxnOw+PaE7b7+pe4oZ5QJ/kG+ki1w8sMytUUE1cQGxGf
        Wau11+mkxauchihXfXmrq9t+ARPJ8vr4ScdI5aJ0nMx9PMlDtPOaouycXxJpzPxH
        /8QtimTVWDikFMxhNvFE0iilOKSll7dm7BxzwGiE+32/e2xf5fc3Gf7lqvpCObj/
        8beVmUwFb0na+XbUrFkZnnSbQJmISEzrkjDynGnYwfUcZKifY+aLzZWYHtImHaui
        gM8setN182W/YQ==
X-ME-Sender: <xms:gydLYbJfKG5YIs4ub2ANPUB1ECWWplxkW-k_QemQvNifJ0R7XO7wgQ>
    <xme:gydLYfLGOAkK0-tead8GIIKt-u35oyzuYpEQhnyU96xTM5E3DjPwVSvLEZLVIEVXy
    eJMLOGOFDVranKCpyc>
X-ME-Received: <xmr:gydLYTt5YipiCNfAWqU1NQIcNraAqY8OWAMrS20rhFyGrG8ntiB-MkqxT-IEVMtLKWBZ4ouxI1lvjlVrwWXKAohEDCiM1vsqURGi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gydLYUYMILbU8rDdoUjdQ_3fh4YooZzU3ULe6uenHYbv1Kx-pedyig>
    <xmx:gydLYSbid5cavjWv3Eto5WQXwG8BkiNh8zJeZ11kg5Hb4X_WBkQyKQ>
    <xmx:gydLYYAKKCOafC_ZuImQPne6AQ3JbMP9fsO2d-nKm5h73-DOIz2Rfg>
    <xmx:hCdLYeSX0zvW2wCE17U9kzpeebV63gud8HJvhbtWjKpiinYibQ0Ut-pXwWI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 08:54:27 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Michael Stapelberg <michael@stapelberg.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 1/5] clk: bcm-2835: Pick the closest clock rate
Date:   Wed, 22 Sep 2021 14:54:15 +0200
Message-Id: <20210922125419.4125779-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922125419.4125779-1-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver currently tries to pick the closest rate that is lower than
the rate being requested.

This causes an issue with clk_set_min_rate() since it actively checks
for the rounded rate to be above the minimum that was just set.

Let's change the logic a bit to pick the closest rate to the requested
rate, no matter if it's actually higher or lower.

Fixes: 6d18b8adbe67 ("clk: bcm2835: Support for clock parent selection")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index a254512965eb..bf97b2b2a63f 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1216,7 +1216,7 @@ static int bcm2835_clock_determine_rate(struct clk_hw *hw,
 		rate = bcm2835_clock_choose_div_and_prate(hw, i, req->rate,
 							  &div, &prate,
 							  &avgrate);
-		if (rate > best_rate && rate <= req->rate) {
+		if (abs(req->rate - rate) < abs(req->rate - best_rate)) {
 			best_parent = parent;
 			best_prate = prate;
 			best_rate = rate;
-- 
2.31.1

