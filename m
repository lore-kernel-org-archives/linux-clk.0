Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B900C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:05:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356258AbiELQFS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356249AbiELQFM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:05:12 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A02925C28C
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:05:11 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 79EBE5C016D;
        Thu, 12 May 2022 12:05:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 12 May 2022 12:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371510; x=1652457910; bh=PI
        uzbyO7A+ufIai1lujejQXo1UeRPgHN207KWVIj91w=; b=UH4RKvkckXMzq2cFV1
        d5Kzruzet/bk5a1sxdQxpT6vN0S/sFrpUf/yn9Hlbfz/MwLjTStFiWDqdCyWdPwm
        Z0rwg156Dk4lTwiQw/Xn8JtyFYVOfCjeNIfED4X3mL5Sqv1dARgzVQzUwXGIYIxF
        j1YSGpkNJbBavIItTOYl+mHvyWKb1hsuphyCIxCkc3HwjGEKCUgGJDaxFtjy33Af
        3fbWJ824lY+1+lXXCQh5rp/eNCEwIlltL5HoX+tGvydsBSMKtroDHtODQcoJHH4U
        j1N9vtSjAoJTO60d8+iMl+SeY2LD/Q/zuwJitLlibwAfGI0ZKaFkoD1y1jryK6F9
        LWnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371510; x=1652457910; bh=PIuzbyO7A+ufIai1lujejQXo1UeRPgHN207
        KWVIj91w=; b=izG8c7OxwM07+5/WhmS4125r7Y6kzsbL3IR8JHHdU7SMPIJl4sb
        Bl3KM7qy864b3UcrNg9EzLuRaEAxakvg9OoWFaVqIjzuxBkOos03oP1hlWycXKLW
        ALma1VqiIAbslKldOKlEbb8dsc1XxWmZ6q/BsDlWOd2rU9M/d0c2CUPcJQzfo8Wi
        uYgwrlB7ysPiPkdGt5XtlomtVQuk2/DT67B+vjqKnL/HMQDyDB7qfnOfllr449E9
        myi8kYlDCVd/wanPpz4y8lIv3t/r/wcSTPh5Zsv1DL6m4dMUFt7/tkiWYCwCeBrB
        k+RfDpfPKxHd3/Ygz6shMsaXiO1fHnuzu1w==
X-ME-Sender: <xms:NTB9YpL9kr3z0inJpley99FqHLiSEHUt2_gTa-4BZle6YFOkULHcrA>
    <xme:NTB9YlI_9W3W5Fl-OP0YOs-CEkuqtKgK-XrXFY5nUKjjuNElVmVCNUhrupUkGf7Wi
    PqygzLS3ywoHn-ppiM>
X-ME-Received: <xmr:NTB9Yhv6R5tLfQ5C7c0vOqBOWxIMfx-wZvTozs8OC9DsEoPImVeC0leDKPA9MCMTtN6pJpoc1YZ4xEPCvPoQa21xlazffXpCFTb3an8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NjB9YqYrIQg8spMuj5ByjjZCqQ-cN9yZ4hpk0Nn6LaH2weJIlovuPQ>
    <xmx:NjB9YgZ-orCpfY2thpXh0Q0yRrj_x8xkHa43Xd80zUIdV74w0TWSeg>
    <xmx:NjB9YuCo1xQIdnTVBI64VKlxpQSWABKGw7MmybybGhTwURKmZst-sQ>
    <xmx:NjB9YtSdXAnZ5CE91Q1D2Hb0trL6MRNXINkizBoAMVGZplvFV2Uwzw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:05:09 -0400 (EDT)
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
Subject: [PATCH v4 25/28] clk: Introduce the clk_hw_get_rate_range function
Date:   Thu, 12 May 2022 18:04:09 +0200
Message-Id: <20220512160412.1317123-26-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some clock providers are hand-crafting their clk_rate_request, and need
to figure out the current boundaries of their clk_hw to fill it
properly.

Let's create such a function for clock providers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c            | 16 ++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 364e6baa3d1c..54fbc6894e3d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -683,6 +683,22 @@ static void clk_core_get_boundaries(struct clk_core *core,
 		*max_rate = min(*max_rate, clk_user->max_rate);
 }
 
+/*
+ * clk_hw_get_rate_range() - returns the clock rate range for a hw clk
+ * @hw: the hw clk we want to get the range from
+ * @min_rate: pointer to the variable that will hold the minimum
+ * @max_rate: pointer to the variable that will hold the maximum
+ *
+ * Fills the @min_rate and @max_rate variables with the minimum and
+ * maximum that clock can reach.
+ */
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate)
+{
+	clk_core_get_boundaries(hw->core, min_rate, max_rate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_rate_range);
+
 static bool clk_core_check_boundaries(struct clk_core *core,
 				      unsigned long min_rate,
 				      unsigned long max_rate)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 7f4f34ff2b83..c0bcf72d5ecd 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1235,6 +1235,8 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags);
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
 
-- 
2.36.1

