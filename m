Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B781CC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:26:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243471AbiEPN0Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243851AbiEPN0E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:26:04 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB523C37
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:26:02 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id BE2F33200985;
        Mon, 16 May 2022 09:26:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 16 May 2022 09:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707560; x=1652793960; bh=oE
        f8FfAdZoUiidhzeTrstrBgTDnXc/Y0GGXvEBeWstI=; b=UuzQdQI6WKbxx+NMW6
        mOchlQfHf8iS828nIPQGPH0ja0JgcAcqgQGteIQNLDMNFDVZmR5kaQch4hxOlSUx
        XXYOuiXkGu6Yh1SQgXWg5n9Hw4yu1I4AiVGLc6Ej2R1dmsUktkg+w0r5ZzMizmU1
        1U0D9pSKeDhEXU/kYLH7X2xyf6RzJUBT6Z+1JBVtZqr+Hz+J+ky/8ZMNjQ9V1o70
        stPddNeXXt0lGSTcJLffVaxeh1FIVeaLAmjn3JTZwkhxYleN2tFBtWE1Bde/Z08x
        HWX5YtIehm+2upW4fK70VJTNOpS8LTOqLtCa0OpBXX8E6+Wfs+Drk7vor0eT7nBn
        3WZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707560; x=1652793960; bh=oEf8FfAdZoUiidhzeTrstrBgTDnXc/Y0GGX
        vEBeWstI=; b=vhbxDLIUrVdN9onYBuTbT69d/jTCpnAgIylH6kPb9c98R7YycYo
        Ds+0WaJPccX+RGfs786q622kNTXTkF7DpcnW1tuVhZyyJ20uStPvs8SY7hIFmLOC
        Odsb0cSCM4EKhdy9k8miW3hoF6WfzZk6rPgNOrghzEsL+PzCRugoxgaz0BoXponz
        7S+EtWMcxQjV+Tc0ajx9z7/aqeKgm4yomoO2ktDmmO9Y+j1JFh0FrZiz9W6Y7AaI
        Eri9HJPYkge7QonbWnfb0TENSn/XU6S5Zy+1B1u7vCS9pY6FSILj59Zc/mcV/PbO
        VtIgWj9U//z3e1myf3FC9U4XAXyr6vEbM5Q==
X-ME-Sender: <xms:6FCCYnG591kQlZasQwtIReoCbQEu6swfgjPSVwKiFXgzV5c1A7FzhQ>
    <xme:6FCCYkWXNxkcQx2rItW9G5B2xBAgEOtkOmRbXpprhKUN-rqcQj2lAa5Yqc7gaNons
    Rc7zgOsYNUSaEKLxZI>
X-ME-Received: <xmr:6FCCYpK-j-9qJQTSJI_uU_w3CcO22oJ2G8KtjyYGodxlvgllxVaX1MARVJS7FtXUMB-gJ8_d-D-o5whyn49hq2sbQJegezClI7TXfJU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepheelteefjeetiedvteevgedtteegffffvdekueehjeeuvdejfedvkefflefg
    feeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6FCCYlG85rQ4oQtRAPrt6IK7-ySyARUytyjavDaOLXS5eOGQrG2gcA>
    <xmx:6FCCYtW4XmgtNAkBxNMD3bky7lzpicI_CR-1jMjwV46IIIVSWt9EIw>
    <xmx:6FCCYgOtpiVmY-650CS5bzyjA9JF9sjU3VJOggID80RonkaRn6coLA>
    <xmx:6FCCYmMqaW7N4xCw_Y6NaGrRLfYxflSgqgrRrEscxf2coRU0yVPouQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:25:59 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 08/28] clk: tests: Add reference to the orphan mux bug report
Date:   Mon, 16 May 2022 15:25:07 +0200
Message-Id: <20220516132527.328190-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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

