Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03457C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:24:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbiGKPYo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbiGKPYn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:24:43 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE6024083
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:42 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 7F35B5C00F5;
        Mon, 11 Jul 2022 11:24:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 11 Jul 2022 11:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553081; x=1657639481; bh=vI
        43RoR7udwY1PD5iVQ3iPOlYyaMD8j612pWbjrGKyU=; b=hmI9hNciHB14Mov8PM
        otzpRICYrElqYYvQw4vO7GcjSOebJNyZCGcB8ox9y0qlmNSKDafk0nQ+kDME96bg
        I6gp43Jg9kEr8eqLrq5AnuQwo7zKJ5p5Nh//cB6bCXSThWijwx4xDFteWQNh8ezB
        L3r6xT9rJj6c9DJOG9gIOBb5hbUA6tTf7SWXt4AQWrBuW67+WY3BAssTHIJKx3lx
        9s5C/41W2i1M7qU+MsY5LL/NN21whNfp08NJ1VisU0VNbBvACXOtNurajW7Y0EYh
        JnePzM/CObzY3KeotXl+KBCAZsYJ4WrfMf2IKhBlgREqsD5qyDdo4lLLcSjo6b0h
        ajow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553081; x=1657639481; bh=vI43RoR7udwY1
        PD5iVQ3iPOlYyaMD8j612pWbjrGKyU=; b=BsFZ4q7BYp5Jzog9bTKWN5ZCrIBPn
        D6dJdbHS+A4RhB/1QQCF1XorLNRdOOwZVGksNiBdHI6T22d2+6oIhkX2U7MXl4mZ
        f6E2iGgRn9dPRzUsPLvCNoEq68Q1PAU3wg3PlHPPxNMGBiZWNS3ChkzfcDoVyJTm
        9WnVM0hRqJewjN0jXleqlvy89DhwmJWmmLx+PPhxRfXY74oP5oXhHbRI1tZDqtIr
        JjBNgc3VdLNE6klcqdu7DSM2lAbDXEowpVtLtQ9hg10vXHDHi7gz0skvaFdWbrDL
        0C5RqYw8LssG0ScjmTsDcyK1zUbfXAOgmoBnT/4U9vB8TKKvJfaARD3/g==
X-ME-Sender: <xms:uUDMYsOwuDmKndFyFYuyPAVNHU6FMJ_IiUbHugphE4850qpryeXIxw>
    <xme:uUDMYi-RLNij8lbLBO8hulkRDTlWV5Tf52_hT80oDOyEeRkanGRscxp9sGatOqpLT
    MPpPNuTcCBz2NL3dec>
X-ME-Received: <xmr:uUDMYjRjHqboeZLi60cSdOLfZ4COYtE82sOOUQEtnECnCNj3ltTBCMNlUwTbq475t-tGTp1hRRZ4OHWGe2jVhtpbsDy2Byw8wxjw-jE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uUDMYkth5NgFTex3Uaa1CKdSUQKqBgVvB_jrwL1DIkbVtNt_TirfGg>
    <xmx:uUDMYkeTDoBgTNARjbJPYh1uLZ9uYW2quJ3Enat-XKyEMSLtbEfveA>
    <xmx:uUDMYo0b4XbtPNotdf_UzfXRQ_JqqShn9yP9I5qLFYJRGWoliNPo-w>
    <xmx:uUDMYlWFbI27ILMvGUJllux3qQKYYQ9xF2M8R-xF6sjhyn_ADmXl8A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:40 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 07/28] clk: Mention that .recalc_rate can return 0 on error
Date:   Mon, 11 Jul 2022 17:24:03 +0200
Message-Id: <20220711152424.701311-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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

