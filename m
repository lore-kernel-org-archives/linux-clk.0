Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73367C43217
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356210AbiELQFF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356233AbiELQFE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:05:04 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9712062233
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:05:01 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id D44095C018B;
        Thu, 12 May 2022 12:05:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 12 May 2022 12:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371500; x=1652457900; bh=ol
        /21gC41IBHmFEPHuBusKIt/4fGmF0WWmjLNmMAuWY=; b=jTiuRIfi0VHiGPgCnW
        Pp44EbSUk4KwOwJynmpoCfcRVrQV8kYlgFHImd91n+DlJ1BkRnSWnLV20iTE16Px
        ut5QEyyPyxX5RFpp0igjO2t1OHMb/YnllqKKn2hVKxG6vUp/n/UaPgSThfndYMKK
        rNpO/6FwvXw9muOJl/ojzbWZUSn2xdfdx2Ti3CSvI/m3kUEYwCjlFk2z+J7uP9Io
        34zsWsa65rBGpL9gnr58jcnnMHscQC0MHvh83HWfH+tPdsxywgYXB8aPPorr9xw8
        bshx/ruluqX8Yu8Qp2FuWaOq2fbPE3jRDi4QMf+KZss5CJn6a9ndPet6xI70ZQm+
        AzCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371500; x=1652457900; bh=ol/21gC41IBHmFEPHuBusKIt/4fGmF0WWmj
        LNmMAuWY=; b=HpyerjSbc+UDoveqmjT7jyDGnctHXEMQ4vUNBWzHxI8EdBhac15
        hAFMa7eHwQo7Y/848EAJ+XyanG5Jrqyy5BKw9zS1fj+3NmFn+xynkfgIRukP2GLt
        xCgk2RQ5j2v9w+gtdbWpzOHpBf/ruzNdS9tbgstZpK07neQx1xJUmhOb5+i+pvQv
        RaBV1+A3aqEm6yHXaeLg4ckhrI2uiHJXYKdSClQcUN6+fDNQgX/0zy8AA+dtagJE
        IOV6QvsoLWMsJonmIQp+430un5MuU8whFQC+fYLSkFzFCMW4MBV7d+fxxQKpd062
        zVqa9htwGy004xOhuy1nEa8Em9yQyJ3NaiQ==
X-ME-Sender: <xms:LDB9Ygx3I3HIpQ4l7I5IvviiP8q09nvEiHj4qsgQPwvdAANwuHJoOA>
    <xme:LDB9YkSUFHg63VZor_Ur0uPCO8N_z-kWugzukuH38i3iR2ZA80ubBql0zVvot7K4n
    VUbXCBeHLRFXbDpTms>
X-ME-Received: <xmr:LDB9YiWRCDwj41IRI3g2PlFWDK1AAH_qF64sZJfSgsb1Hr-ux4Rlyfqiqp9G6l5M3FyBYTZT_NciKjEJFn323FNFc4SgfD-5562vfO4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LDB9Yuh2DGux4vqYkBl5R7wWYK0WWdXpcW3xvvJEsGD7YmQ4V8_V4A>
    <xmx:LDB9YiDVRtHHsRWzkxqU0T9mCCOzsxZeWVKySK-Mrhuhroi8A1WcaA>
    <xmx:LDB9YvIaCnkwr1Tzoc083Req66ChAUFPFPIozsYHP4avTX4XvRpBow>
    <xmx:LDB9Ym7vjNP2KxXSE3wkETwC1e3FPKVj6rTcKKV3rkcY_VH9UgggEw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:05:00 -0400 (EDT)
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
Subject: [PATCH v4 20/28] clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
Date:   Thu, 12 May 2022 18:04:04 +0200
Message-Id: <20220512160412.1317123-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_mux_determine_rate_flags() will call into __clk_determine_rate()
with a clk_hw pointer, while it has access to the clk_core pointer
already.

This leads to back and forth between clk_hw and clk_core, while
__clk_determine_rate will only call clk_core_round_rate_nolock() with
the clk_core pointer it retrieved from the clk_hw.

Let's simplify things a bit by calling into clk_core_round_rate_nolock
directly.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 3a94d3e76f59..1a217c21be48 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -536,6 +536,9 @@ static bool mux_is_better_rate(unsigned long rate, unsigned long now,
 	return now <= rate && now > best;
 }
 
+static int clk_core_round_rate_nolock(struct clk_core *core,
+				      struct clk_rate_request *req);
+
 int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags)
@@ -549,8 +552,12 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
 		parent = core->parent;
 		if (core->flags & CLK_SET_RATE_PARENT) {
-			ret = __clk_determine_rate(parent ? parent->hw : NULL,
-						   &parent_req);
+			if (!parent) {
+				req->rate = 0;
+				return 0;
+			}
+
+			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				return ret;
 
@@ -573,7 +580,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 
 		if (core->flags & CLK_SET_RATE_PARENT) {
 			parent_req = *req;
-			ret = __clk_determine_rate(parent->hw, &parent_req);
+			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				continue;
 		} else {
-- 
2.36.1

