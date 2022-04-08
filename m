Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDFAC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233373AbiDHJQZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbiDHJOh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:37 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD9B1066DF
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:11:13 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 1EA8D5C019A;
        Fri,  8 Apr 2022 05:11:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 08 Apr 2022 05:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=RO+gLi6KsZi6XqDYWIy8VSnwdebw9j
        58sWpJ2mqMejE=; b=vZe1WuNJJ1tYxMt+x0yolJfRzFW7LBCBcntKFr3Oj3xNvI
        rnP16w2yDJIYv/p4WKij8TfAsxin5VUrIicNzyFwQLvIJ37NPm+Q3cnBv1P+0gO2
        OzxycybjIZy6mi562Pjxa/b0xo03WdRxCGtIxO+eK32b7EOLmHIci1f2iE5GkIn3
        2cjUWKhosragfLAMmexpYBBvc5itc1JLIAKp5FRyUMv4DieQ0PBe8QD1IUKlq+Ry
        iEp+XzipN8n9OffOlWrAjyEUVGDaVsy1aUiqvNOSFm3z5+zPIRkBSRzZLOwc52un
        WktohIlEUMhzqa8uAIcXOIChhGrRTCTLq/0zHw/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RO+gLi
        6KsZi6XqDYWIy8VSnwdebw9j58sWpJ2mqMejE=; b=gUFO4sDughKzAVUaCd+a2T
        5XZwIGIg6zv/urifeawb3eaPIlU56ZI/uBkINUyziZU6FoiRelHI4z+k+ynJhlZF
        LN1OZ7VYS63vtEwatuFmE2WkOjEXgfNHwi6gtXoZXzwXJvHlMtW83wAtUiPIR55i
        NP1Ep+X+B+L6NXhwmj8mVaZZtMSJEbX0APTKspt8shBbGmLRC8VJ2wa/GSnvqOja
        r7vFy65OyE54ad3p6A7yrlZ5xAJIr7lXkX3BuILCWLRJV6Hda82oHhaROWmcN5RN
        xkw1jRO63kEszaFDdfHFldyPdhgzBtyHqWX+1odPZEhk24C3Zu3dAbTuMM2d66XQ
        ==
X-ME-Sender: <xms:MPxPYronMz-anV_HdMohoApq2_mbToPFnT3j9EHQNK11ddR-b2UBzw>
    <xme:MPxPYloi5xEzI9eFevUbx7iDJ8H9hsGeCzLawrznc8NYbjjiMIewx7amj2r7StfH7
    3DGqzec-4kHmlVLla8>
X-ME-Received: <xmr:MPxPYoPUnvZQKAaJ4acvUTSAGuh5rZkQCDSOVB4pJXb021saG3NkvEOpZdMGCFs0SE4IrUMJgcuz_oaozNR77uaxaj3ERpM9ry0WV8M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MfxPYu6ZNXxtNlpZL456XQpQY5fgm6E6ScJecVqU7OrHncJMCpAKug>
    <xmx:MfxPYq4iypIXIzoFbHtaxzx3g_6ZWbnD1nlSmQs8utxzNMLZiEtm1Q>
    <xmx:MfxPYmi0h3jdoxMjdVkdWuHQ8TJ3GNNuhXxVGVpD8buQAk-OmKHI7Q>
    <xmx:MfxPYjESvRFZYRxdAesOzWwF4OoKt_H0bKVaJlukTobyN8h0y6qlig>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:11:12 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 16/22] clk: Remove redundant clk_core_init_rate_req() call
Date:   Fri,  8 Apr 2022 11:10:31 +0200
Message-Id: <20220408091037.2041955-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since all the users of clk_core_round_rate_nolock() will now properly
initialize, there's no need for it to initialize the request itself.

This is even dangerous, as if the clock cannot change its rate by itself
and has CLK_SET_RATE_PARENT, clk_core_round_rate_nolock() will call
itself with the parent clock but the client clk_rate_request structure.

We will then reinitialize the child request with the parent context
(parent, boundaries, etc.), which is an issue if the parent ever changes
its own parent or parent rate.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 3a59152b06b8..ccb6e9686fb8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1431,8 +1431,6 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 		return 0;
 	}
 
-	clk_core_init_rate_req(core, req, req->rate);
-
 	if (clk_core_can_round(core))
 		return clk_core_determine_round_nolock(core, req);
 	else if (core->flags & CLK_SET_RATE_PARENT)
-- 
2.35.1

