Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B39C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:01:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbiGOQBA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbiGOQAv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:00:51 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DBB962A4C
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:00:50 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 2112B32000F9;
        Fri, 15 Jul 2022 12:00:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 15 Jul 2022 12:00:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900848; x=1657987248; bh=vI
        43RoR7udwY1PD5iVQ3iPOlYyaMD8j612pWbjrGKyU=; b=UEoGlTZYGzIDvhPDkQ
        9N+t8uRgpi493AAwuLA2IpLMFfJI+DylxS6Ii+QhM7RulmP8A7dUcbQzM1ZYERi0
        BBufeuFE4bZVCqYBMWvXnHUQSNzaGjvuXAN2WYSxRUP0JLZ8ZDszDDie0+rSEaem
        9nD00wLid+j5QT0jYp72SvLypHidZqCvRAPUBBGoxr0LeeLSlKqBwYVnFg8HYXYw
        9HlwjjPoHQGS7SHsEMVtX45DXbzClGH5TvXq2kGonkoXy/r2W3Ot8TQfO4xXLPbh
        nCrIDhiB7yiR/A/Y7mIlk4DH+2+FBPmnUYQuZF1uYa96Oi8DINELPzqZSgwjdqQU
        PDKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900848; x=1657987248; bh=vI43RoR7udwY1
        PD5iVQ3iPOlYyaMD8j612pWbjrGKyU=; b=eLShDrkUPyk7IBj1sje7Q0YJP5eGD
        SMDm0HIVXORy4XdWEfcgxfFD1jD+xzn93K48Rab+k0XCzl6MqwBvVnI7Hd/hhE8I
        VILt8tgXbp36ERIb9Y2Nsrzg6/vmufDD2vEfUdAIpvGOO8gvNEQpPi7oHMdmJS9n
        W2mvmzGZAHR+k9VSZaFshTg+GtxU6aC5Fy1ljAoauGM1HhdZRF2XhcpJ1WOu0hYO
        wuht+bUclJpWZWQ6TG/9POQS2Ut3uJ2+rtxj2OkhqYCM8sfgfAoIbJvWF1nNFkMx
        Vxeut2IXjx8hSgpTig1TjJkClM3CVcsVKDAFBuAryXsPbnpkWBgWwLfog==
X-ME-Sender: <xms:L4_RYvpmUHjzc_iVGd1LPv9_qXDJmTslDXqZcQmY4dj0y9b3UhendA>
    <xme:L4_RYpqQLnkzYW0SZwpPZrWk7dGNAOI3jB-BCbrHykglxCNg819wSwKGoLAgmUP2Q
    QbewPYFdcEsaHK8yBQ>
X-ME-Received: <xmr:L4_RYsNFFkApzKTpE0OAtAcvyaEof4N49i2BR7Wx7Qzk308Zj1UsIWsTtrdF3exeUjVJPz6usamRNMnpsexWR7NCE9_ugZyOnRjdq-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:L4_RYi5S0PqzSnsV-3wmlYjMhsvVMR-otGRKF1nI5yWRJgNp_qguwA>
    <xmx:L4_RYu4VNNfYdrx9w4_a9UCJnXzKkjQgwOQc7IUeIFrFK9EeeIcUZQ>
    <xmx:L4_RYqjGL4l2_vv_5Uv5Tj9sbZW3WMmFHpk5vo7IKnrTB8NVHUX5sQ>
    <xmx:MI_RYrz_o8wGp4CZMSSMOoEjwjIdXLXgwizzJdpTw-wB-qSJeCSa4g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:00:47 -0400 (EDT)
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
Subject: [PATCH v7 07/28] clk: Mention that .recalc_rate can return 0 on error
Date:   Fri, 15 Jul 2022 17:59:53 +0200
Message-Id: <20220715160014.2623107-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Multiple platforms (amlogic, imx8) return 0 when the clock rate cannot
be determined properly by the recalc_rate hook. Mention in the
documentation that the framework is ok with that.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/linux/clk-provider.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 72d937c03a3e..12e9cbf533b2 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -118,8 +118,9 @@ struct clk_duty {
  *
  * @recalc_rate	Recalculate the rate of this clock, by querying hardware. The
  *		parent rate is an input parameter.  It is up to the caller to
- *		ensure that the prepare_mutex is held across this call.
- *		Returns the calculated rate.  Optional, but recommended - if
+ *		ensure that the prepare_mutex is held across this call. If the
+ *		driver cannot figure out a rate for this clock, it must return
+ *		0. Returns the calculated rate. Optional, but recommended - if
  *		this op is not set then clock rate will be initialized to 0.
  *
  * @round_rate:	Given a target rate as input, returns the closest rate actually
-- 
2.36.1

