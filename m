Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922FFC4332F
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356233AbiELQFN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356241AbiELQFL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:05:11 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38AA62BF4
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:05:08 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 430005C01E5;
        Thu, 12 May 2022 12:05:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 12 May 2022 12:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371508; x=1652457908; bh=MX
        qC38DcKa37Vd75cbNyJjb6wJVeHddhwpvwyzO4EFo=; b=p7b68L7FSV5B3kkBEM
        57gE+7N19MWbQ514qOZ1SNObfE8uzuKGFDo4Di77kqgcXwChnOXxC3VL4BkAzF7J
        cD0FVyR3FslaPBQuMiQ2N/Mjpxz1Bey3AiaCX2KYiRshGhDQC2PRnKKd2yq8V6GP
        ZGze9r42vwC4UegFWGRoaYjzVuJEHc3luzF2KdEfvI3KVVIMBig6QN38bIhVrg7b
        DCxRkVd8icmb7WnJCUWOrun5JrTkYkQTb9JpPxT1tpkEEumnvxmCBeM4inr5e4UX
        I9rzwRA1uagLZXhojcSVAfoJ8iaiaRD/yKL1rrLQVgkCL22PqETcoiY12YTG2td3
        Evuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371508; x=1652457908; bh=MXqC38DcKa37Vd75cbNyJjb6wJVeHddhwpv
        wyzO4EFo=; b=qqAq1utUHBLEZrIf+NsLt7dEmxV+DM+B3hyvNG+CJAlSWaoJMhz
        ypQ3EDh4wfLXLLTdrd1fkKENn8hnehnFvNeMwHwZ1osKrjUDLfnSR7s8wOlaSHwZ
        tL9Pqw2VJXODjQyUCu2egkfZMwqEowjMPYpogk5cSZYEoS7GxDTh/9fhnSfvdBMG
        OydScXEkqkRelp4SFVrzqj+M8BrVuMx8Rd9oIxuBhM9TlIn8aZe9lmwty27vNqDM
        dC1NH+hKTxFMdsGCqaNo34cyED7sLDC1kAk7zEuwTyMFx74Ydq3n8ka/PmRXSowu
        mQLTnAE3kKrvlC0i2yHm21dlE9srFL+33zQ==
X-ME-Sender: <xms:NDB9YiTTnHWDegxCtM34Vvr9erOFOYTvXyY8R_Wd1MsI6UkL1tbXoQ>
    <xme:NDB9Ynxanh5DVw5whMxEVewjE2UFs3plbMkSrS68SUDCft12W0g2FVX3hh4wCeUH0
    TQs1-VzLM-3Gij4ZG8>
X-ME-Received: <xmr:NDB9Yv1GaDgiSzwvhbhnzEOtYzG1_p8EcwSNcTU4q1xbK9B514WkojcPrrXH3RlrdH93NQIWoZrae68UJIaXAf9eprAboleuBC9xpp4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NDB9YuDzTNC4026nOvlrmYneLL7JJrDjWvckGn7qjfC-QdlDc_PNvA>
    <xmx:NDB9YrjaoiIf2XfU3F-JUHZd-YyIZvgM8SWW_oVlqZCiP3lM2uyu9g>
    <xmx:NDB9YqoMX8IU_qRoruLSF56P0NZfpQndyfynlH_EBh5UM7Lw78NIUQ>
    <xmx:NDB9YgaL1bxrks7ry0UJu4mXou-IqY7gkAKr5dhh5br3qACf5dDkZA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:05:07 -0400 (EDT)
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
Subject: [PATCH v4 24/28] clk: Test the clock pointer in clk_hw_get_name()
Date:   Thu, 12 May 2022 18:04:08 +0200
Message-Id: <20220512160412.1317123-25-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unlike __clk_get_name(), clk_hw_get_name() doesn't test wether passed
clk_hw pointer is NULL or not and dereferences it directly. This can
then lead to NULL pointer dereference.

Let's make sure the pointer isn't NULL before dereferencing it.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d953ca61ea38..364e6baa3d1c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -262,7 +262,7 @@ EXPORT_SYMBOL_GPL(__clk_get_name);
 
 const char *clk_hw_get_name(const struct clk_hw *hw)
 {
-	return hw->core->name;
+	return !hw ? NULL : hw->core->name;
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_name);
 
-- 
2.36.1

