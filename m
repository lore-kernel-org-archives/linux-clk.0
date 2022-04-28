Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD78C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:43:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350245AbiD1QrJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349980AbiD1QrJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:09 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B785FB246E
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:43:54 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 1C6895C0061;
        Thu, 28 Apr 2022 12:43:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 28 Apr 2022 12:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164234; x=1651250634; bh=oW
        dw9FV3ZDmxY6uFfM5ykwLixI8LV1l5Q95QNsZFFdg=; b=ca+djEkwZTVbuT+hch
        nBLqWl1pFyVNjjWXr7L4Wan7/zQEUCj/AjsCKW+CEtQvA/HmXJch86fz2a1oH3IS
        JW9Kii3l9JhlO2kWMI8yAuP/1JWk2aCL63XtzAOUdZ/n69+ymFnXW3CvLuc4TLUq
        Ad5fRYF/0+WuarHOcxJgYESfEWubIU6nRpxTI1ISszZzuLlRXfRKs9UjjKCwXwbl
        pnuVl3bs84ADERRwJ/f4eXSF5gAXFP8GLp5NDT20LkRG7u8J0fQpqazxXtQ6N3he
        cE2JEfZPMy4UCAIyny9uXz3ULf/VcdaGAUGQUaNL+qcr3nrG9ZXFROfis8v2/E25
        6Uug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164234; x=1651250634; bh=oWdw9FV3ZDmxY6uFfM5ykwLixI8LV1l5Q95
        QNsZFFdg=; b=HCMWwFF/zJMr08WBq042Phzm4CHm0O8tIRExoqkWbIby+9WWEwz
        o038BIJ+cQSeRokgLv98mbrml+5SHyb2cSpteU3/KYD1V/Oq2c7yjjXJIWxoRfn6
        5w2MijTujm5xQEF9p944tMMrjJ5dslmrvYhwT2yyO/asknNLnzYNaHwXx7dIpz5f
        Zgt+URngwxLwv051r3oWNIslyqP2n9Vs0mpUMZ8CHcXtVddFxi4i1lb0ubcWJA3D
        iVrBGphmQE34Qdig4SqbvU4thdcSYey7XQff6H19vdJRELPOHlc4ynSEqK59+LeW
        lJvfO96EwwlktbUL1RjUEk4apk9i4SzHqsw==
X-ME-Sender: <xms:ScRqYviTgLcRdLgWos0GEur7F3oi9dLwjnXKa3fDBpaZJ234AeSr4A>
    <xme:ScRqYsDsRWdcg9F2BMQG2CcTwDoCgM602LOINGBMDdBCITLkR48bapxEQXTFK2Rsg
    dRmpXPlKmcmE0af_R8>
X-ME-Received: <xmr:ScRqYvGl2oM5ISzeMg-VslndMHSfS1b137XkEQjFx7kvKcm3Lkwp_sLq3rnsD4a6uYQMYYnZ_4whw3SY7oC4u81Wa982YAXx-3QMOUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ScRqYsSZPtKwlaT-U-AUMLzqFggTCECtBItYxs1XwzEQ9rIyXjTbyQ>
    <xmx:ScRqYsxUwbdaTmCJabSFnRZ7FAl5gLOa_2ste-FqHs4Xq-qVlln-6w>
    <xmx:ScRqYi7_doTlmPVXSnvCDJ1egUn4S54IP1LNRlwvPoPp4ycggjH_sw>
    <xmx:SsRqYhqylqccWexPoCC6sj96fQN8hYePcOIUFSl0lVl9BrnppdPbvQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:43:53 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 05/28] clk: Mention that .recalc_rate can return 0 on error
Date:   Thu, 28 Apr 2022 18:43:15 +0200
Message-Id: <20220428164338.717443-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
index c10dc4c659e2..58e5baa49db0 100644
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
2.35.1

