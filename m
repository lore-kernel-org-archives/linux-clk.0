Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2822C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240911AbiELQEn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351299AbiELQEb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:31 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C9926607F
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:29 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 110B35C0197;
        Thu, 12 May 2022 12:04:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 12 May 2022 12:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371469; x=1652457869; bh=ja
        BTRgDVXHPrIehW7S2urwJixXuyalII1rgt7AU1Pu4=; b=HlsFnnEwjZh0HmdLqm
        xnBnBQoUoUnxjdYeG1db9PvoMj57wy9n3oWyO04ncXX4JElB/9I/3s1nJ7mcMYO+
        uabw+sxSxI2MHvMyxzCEka8ZwCdHRMQih6OJZa88zeJhDCpsEKwynxtAHHm0cWaj
        eSp9WdlYmWjeTJXvGhxcSwH9CxPz0QNx7CAS2AyRo8nxL7R0KSj7ROOVyPzefx/v
        Fd7U8rJhlIn/7S25GvcIhxrX74YB528AjiVJblbgUypFzD5qhhH08IBrz78m0BFb
        xkbTJA+nTz2UMBABZjMien7bseqm1w6XXzanFcelZLqQxR537uqcIgrhMHlze2kU
        5mcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371469; x=1652457869; bh=jaBTRgDVXHPrIehW7S2urwJixXuyalII1rg
        t7AU1Pu4=; b=i24jIkD5pSUTmcqwMdYYdYa5Tn9833hidmSaDJTd8prQJeTZZv1
        cfuxTv24YhRyjhMlyQh+ZYDTuNb+6bj/LX97MoJpvP5Gv9KTlDYEbkxqtaEAQ9m2
        vFF4Z+aMORVzKYxqb7zH1OtssN/92ssIPwGNqNxboFuvWCMdGm7YFmVBz3nfbz2t
        XUATg/7xOTvaDTGzgmJTCFdyjIBHEh+W2e7OoM1+GpmtByYF6rbnB4VTzq6noIdZ
        rxrUGa6pfi5kgHyA7AQXWleV4ldOr1AsjoG88rZXcMlDMHItkFSvzqRld/A428u+
        7X904aECWKZ/dmikToz86lwMQgYEdFOK0rA==
X-ME-Sender: <xms:DDB9YrA0C17EV5dSHsLrmshmbhg8IBD-wDPy0SwnBLr1aFye_7uONA>
    <xme:DDB9YhirUZZUN6subogV_tY9KRzfQXfofASh1AmJTcJYGFe2KKNabAXWBOXzIw2JJ
    1jZDUUs4vK-HdbMr3Q>
X-ME-Received: <xmr:DDB9YmnB_eEk20p7CujdXqLcDcr7tNH0jGBLaRg1ALLFHY3_jvORoc2TAQSPUD2A8IhCNlsVFY6NPM6gDrCJWwddLdqUaKICEgkOfgc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DDB9Ytwbf9SDZHym_kfxStEtaeE5dyu30GxVMIM6ttI-9UXm3hNTVw>
    <xmx:DDB9YgRJOmDqWGr2FkIChU23n8fsVRvI2GIRYrbzAdt_zg_7JbABJw>
    <xmx:DDB9YgZLAZ8nNmBs3dpYUCCFc9K3TkftEzHpqqvGW27DrNNpofgKqA>
    <xmx:DTB9YlIklQnJHnefcNhgCug5BwxJDjGCKs1mKzqtJ5lLVMDUtw4HBw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:28 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 05/28] clk: Mention that .recalc_rate can return 0 on error
Date:   Thu, 12 May 2022 18:03:49 +0200
Message-Id: <20220512160412.1317123-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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

