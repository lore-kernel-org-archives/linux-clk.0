Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1459EC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244928AbiEKOnR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244919AbiEKOnQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:43:16 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5B370932
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:43:15 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id DA7A3320076F;
        Wed, 11 May 2022 10:43:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 11 May 2022 10:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280193; x=1652366593; bh=ja
        BTRgDVXHPrIehW7S2urwJixXuyalII1rgt7AU1Pu4=; b=l6kAeiQlcUtx+u8ppN
        I2oFs30NMMo5dXSDvzvbfhRw/wtKj67sNZZ/7SdyPReXFE1mSS+CuDGyvgiWx+aK
        wOt2PsW5D8fmwz46ZAOlYMnPUIYXbco8TUl/SFCT9L/02xTUFB4mYZJGJOhTYsYp
        R55Zxsl/wOpCZkSeeNVqVZ6w2b2wRB2xbpbamldvXM0IibMzaOm9MT8Phw5pLFLM
        qOJEATHrU0uPwF4k1xK8UR0nVJ3vT90gmP7OeudXSe+fZb0DQOTmtuaPlVM5KcyZ
        Z1dbS8/fYgaDiOy1vauhH9cHkPrl81J0p5f0OEq/jsbxoIWoGeA10/O76OoPUvqk
        gb9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280193; x=1652366593; bh=jaBTRgDVXHPrIehW7S2urwJixXuyalII1rg
        t7AU1Pu4=; b=cVqaRxaYIlX0j5gBE4tZkArbvNlSLx38VA7xsWi+6dU87p8tigI
        wsiUJ4Di7Cu4llyHq1PnXsl59110mcs8EeT+2HAHYGOm41+t7HKyXCe9MT5K89UO
        T1ovVE+GXsSjFuImiOohTms5uCdznoCeVWblmzrcNm4zY3y7kdvhBjVlNCqzrnOK
        hoB7QpmRwM41Nk2cswZGSGpLVi3PhwE2d5fO7HzqFQzXxX+lJBBsrYcWsMtm41/V
        yDNXwufccxMDRl9ikFuOHRxUao8H4iR4hkY2Udql4ELBpGAo77qoFVPAuk/u72rZ
        SemMr8XR5ae24rlfZLV+2VlfpFYDhTFmnCg==
X-ME-Sender: <xms:gct7YpKxVkuPIkR0rfMFw1AVF6INaxQQEh1rhuwouM24ofFOfCsX_w>
    <xme:gct7YlLjAI4RJPJX8mTip7n6XPrL_8JOf9q91TQUG_3aDWCV3D3jUWRWkeDYhTh5-
    wYWt9J_FBGnKAn3UBQ>
X-ME-Received: <xmr:gct7YhvOlOX9WF_S_Be0HbJZpwLtTZSCIrqCgwfVSHGGrG8EcY6moou3gElwE3RJfEh2mEm8mIS8W9G9H9-atRaBABqElszBgFVU1U0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gct7YqZvTyFtX3mfSATCHCXTim23NQchlxTWyT_Ata1GtTUDGa2wtA>
    <xmx:gct7YgZybaoHxLX8Qd4pvuBsSzuV0IhH2X7VYHxpWXfl4M-fvxBAWA>
    <xmx:gct7YuCMebewE9yK76o7oxayEQLDLw3_YTLu5tOS3J4-E3Axy8E08w>
    <xmx:gct7YtSRzJuWQX8Iv4kyW14TssMhkRbKNA8rZsExQdvPFEkmV2NUFg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:43:12 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 05/28] clk: Mention that .recalc_rate can return 0 on error
Date:   Wed, 11 May 2022 16:42:26 +0200
Message-Id: <20220511144249.354775-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
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
2.36.1

