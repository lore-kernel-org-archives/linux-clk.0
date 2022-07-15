Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60958CCA486
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234025AbiGOQCs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiGOQCI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:02:08 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E388D74DF3
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:02:06 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 686A132009D7;
        Fri, 15 Jul 2022 12:02:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 15 Jul 2022 12:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900924; x=1657987324; bh=H8
        Liasj8Sw+ANlUc4G+27zeudmk1MScZR+BNYN34Hps=; b=q3xLHA0jIXAZL+Kys/
        r43gVi/5ISG0AMoKgGffrEgD1EbRTGZ+FjilEoesuPeYKFlf24LMCQArSNFKXTBE
        DqIF8b5mSXKptDGbh45xUiQRDkHFp4WeI413fsTRPIG8W3OMMIS9jwt6RKDzu2za
        ey8eHs87Q9p0vjagtkGA44UflhXU9dFqkErWqyfw2OmTTd6O3Wtxeb5CMlcEeEDM
        cZBYFv+ofdLyM504W6FCJzCzborMe4TRYjxuQ5fqUtg6cSymmhzMED8l+LlC29Nf
        9/udDBEK8UTV2uFJEXi1oNfDteWF9pX9O9ADUF32dXh0kSW/MHxV9la8Bpgaz+za
        4Q3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900924; x=1657987324; bh=H8Liasj8Sw+AN
        lUc4G+27zeudmk1MScZR+BNYN34Hps=; b=gNLI/V2uJec6RaXyGG1+aIarOiEVK
        NgyZOlH3IkpTwvb6nKV5rCaHgpG9lvWAG53LkyvPuipL5JlmBJdA4c5dEHs2Ru6t
        i8p4Ze/+NTBVOe8WdztEqCNaObR63TgxKrmHe4/njCqf2yjwhXwBn7W0bRLzFBhN
        aS3pJiQliHS88UOAmw9u5Heg5h/4xoKoN+YTRfb3xFTjEeCr0gJrB1c/Vn3UmRF3
        0nK5iyXKB2mGiNznQdtDijJUmsMj6dyD/uS84hwMpftNuOji+eiLN3NSFUnAc26B
        +RHP4pt7+SlC17tmsdhHaa0JVgBRhNcpGsULrs/ELXo67VNPZzC5vbR3A==
X-ME-Sender: <xms:e4_RYusK8svC5NLuV_G2joIRku0_LhnsBxmK6bNflTI4tF8Ppk-QZQ>
    <xme:e4_RYjfkd27PuV5SsuBDGl3YmsrMEcZrF6ihBKTOnPnYOipuGcJnFmh9kVHx9DCMD
    fdxXnFXIlcQcT3tCZ8>
X-ME-Received: <xmr:e4_RYpztKcyqTTVqtxie5ILCumRzA5ABvAjup6puzdr8HCNXxki8ReFL8F5FllL5TMdbZzTY0koN3Si_ccieIOVpcSwONhYo5g5leCc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fI_RYpO_BzIyAXFqHmHxyEQRCY9ZBxtjJxw6-H44dxIo_7RtbroBdQ>
    <xmx:fI_RYu9nMpUcQBvF4SZIZBqTILW9pXS74WoBmOghu5XW7447clG9gQ>
    <xmx:fI_RYhWXEWNM0gewvSgAvoF4NlIAciwCZnwUdKMU1Bui6-mCksisWA>
    <xmx:fI_RYv3TTo_fNhKYJDpmF7_5eJ4B3jbB7pA8WEE_LjAKTdxPDCq_tg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:02:03 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 23/28] clk: Constify clk_has_parent()
Date:   Fri, 15 Jul 2022 18:00:09 +0200
Message-Id: <20220715160014.2623107-24-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_has_parent() doesn't modify the clocks being passed, so let's make
it const.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c   | 2 +-
 include/linux/clk.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7fc6347e66c6..6c0fdf04a229 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2588,7 +2588,7 @@ void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent)
  *
  * Returns true if @parent is a possible parent for @clk, false otherwise.
  */
-bool clk_has_parent(struct clk *clk, struct clk *parent)
+bool clk_has_parent(const struct clk *clk, const struct clk *parent)
 {
 	/* NULL clocks should be nops, so return success if either is NULL. */
 	if (!clk || !parent)
diff --git a/include/linux/clk.h b/include/linux/clk.h
index c13061cabdfc..1ef013324237 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -799,7 +799,7 @@ int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
  *
  * Returns true if @parent is a possible parent for @clk, false otherwise.
  */
-bool clk_has_parent(struct clk *clk, struct clk *parent);
+bool clk_has_parent(const struct clk *clk, const struct clk *parent);
 
 /**
  * clk_set_rate_range - set a rate range for a clock source
-- 
2.36.1

