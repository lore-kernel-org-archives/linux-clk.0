Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DA0C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353573AbiELQEp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356193AbiELQEg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:36 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3906062233
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:36 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 9DEC75C024E;
        Thu, 12 May 2022 12:04:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 12 May 2022 12:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371475; x=1652457875; bh=oE
        f8FfAdZoUiidhzeTrstrBgTDnXc/Y0GGXvEBeWstI=; b=aM7MHPoCWN/gGtypyM
        qAtGG+v+r6IE3QAocLJZlGcwyZwirWKZKaQYdksZkKML0zbvdF4lrvNKA2FnclCa
        fOmEapMRtu58MUpW/MRV/81MSIzN9DpsN7LSZPTzZnvEEfq7ISBpvY+BUTMkVvsy
        pmStCnEERhE0C7wSDyn3wENTDdaO0hPq1s1BbU0vXg08bS1/JE7corMOOv48o3vu
        RQAwB7aX2SFjlDmrvr90vdty2kNalwC/LcfkmgV3YoEC+1hOK5t6cGXvw5JEbdDB
        PC++E14EgzQVCjlSMMgJWQa/DGZsmqzhqJdMIhyE0dkF3KL0kWSKpa8KvvZ/5EMt
        iWYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371475; x=1652457875; bh=oEf8FfAdZoUiidhzeTrstrBgTDnXc/Y0GGX
        vEBeWstI=; b=J4K2MNwzcrBAz68v32OOMvaSZQ4wQLfLTsbAKP70IIfEgCkgz1F
        JP2Y5B70/duBhSgOiosUr/8n5oV8rWTQrukhi1o+mokBeW/6x55P3gTVVHpgiQCk
        4OLol4yHtguDvKp1XdmMG5TS4EEgqA+mtdYLSx26u5rSQwXqPOphtpwvxNjGxUYr
        136iOo+zkVxb1Xn7CSS+dBCntcrHw2W989vwE4ZZk2hNIa+Bmm++KDdcwuluXHWh
        XkJFv6JqC7wb2xYA3TnIhksdAoQoA5r6Z5tS+POL6F/vy/UNEjtTdE26nTts1ZfY
        u81vKrbxXI1wFQOIywZNRyixflNLiCT3nwQ==
X-ME-Sender: <xms:EzB9YsJSH_sBkARY0xF1VEaKBoLdJm-YVHUIlns3hRnWv1jC4d1G2w>
    <xme:EzB9YsKkft9XByicxcYct5tCd8_eFZ1eUcCuopieEWTqBb_EKRcnkw2cSMXhsW007
    4hFDUcDYKo7KRDP-Dw>
X-ME-Received: <xmr:EzB9YsvKKgfko6sZa-o1Sy7uY5VoSKUGByXwulzvaGSyW6UdkfUkg6EXzLQLHPDRh-Xm6dYl5YIxB4CLs6t_blF1RpAuOuRyuHz1REw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepheelteefjeetiedvteevgedtteegffffvdekueehjeeuvdejfedvkefflefg
    feeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EzB9YpYmcsG6SL1iul_gg0ia9Elf9E06vudtfIwwlJWZFU3EL8f2zw>
    <xmx:EzB9Yjb20M56SkfjybzaW8ABN_3AbID3KC96SPzcQ6fQaMq8fCjguw>
    <xmx:EzB9YlD12xrWRJ7f4ehzYTd6Zk7O1GWmFQmh0qCV36bnY5Xe-eCnww>
    <xmx:EzB9YgSC2YUx12hnVyemRK06f2_JA6SAZd1UjmfwbGxTYvIpSL_TPQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:34 -0400 (EDT)
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
Subject: [PATCH v4 08/28] clk: tests: Add reference to the orphan mux bug report
Date:   Thu, 12 May 2022 18:03:52 +0200
Message-Id: <20220512160412.1317123-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some more context might be useful for unit-tests covering a previously
reported bug, so let's add a link to the discussion for that bug.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 64ae7e210e78..be23c19813d0 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -314,6 +314,9 @@ static void clk_orphan_transparent_single_parent_mux_test_exit(struct kunit *tes
 /*
  * Test that a mux-only clock, with an initial rate within a range,
  * will still have the same rate after the range has been enforced.
+ *
+ * See:
+ * https://lore.kernel.org/linux-clk/7720158d-10a7-a17b-73a4-a8615c9c6d5c@collabora.com/
  */
 static void clk_test_orphan_transparent_parent_mux_set_range(struct kunit *test)
 {
-- 
2.36.1

