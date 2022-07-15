Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F27C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:01:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiGOQBI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233022AbiGOQBD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:01:03 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7CB6F7E3
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:01:02 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 64A3232009BD;
        Fri, 15 Jul 2022 12:01:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 15 Jul 2022 12:01:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900859; x=1657987259; bh=1k
        5GlUwQehvuPxFsR0RfGQ6yq/X6lKE4rb73APuTasc=; b=KYsb4Sa4zTPRBB0M5w
        akKd2rzoBtI45g4XVDxF+UgCA+WrIL2DO1OZ55zcIzqZ82pWgl7i3seVfok5HJkj
        j2cN4l+gOAnHt7gz+PSnA6AR6mGDRJvXiwSOCWOupgdvTOyPwdiFmzUGFt+ISo/S
        Cq87Vs5whayaiV5jiWK0sYACaDLjcvDVsYc9r/IRYfu6HStfvNJaFR7RlWyhTa6u
        navuJhVkhCVjQtvUOHa5sInuDNUNHsf/Fod7wHuCrTYS+1g7wdroZq8KNsI33qas
        koII9Ed2gwx90oQ4pznwCQdXwOVgnazQyYXASUAFjdbDj0pNZV7yIbAwCiXBCnnc
        k2Pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900859; x=1657987259; bh=1k5GlUwQehvuP
        xFsR0RfGQ6yq/X6lKE4rb73APuTasc=; b=N1i1ftiVcQzoeUZ1qWpptpJFEU1m6
        eqK34Pe4VrOKLYNKgIdQJmRWbpnD+JauR2oNVHclpNvVPsyEARXcTE/OdoYOews4
        cZABNdd0AMoHOQpJ0Gx7Ov5kt7yS3LVv/DTHdX/T1iyYv0okXm4yuMYkwO2ZvZKB
        J0tzAPEg5BUSO5hCjBeb0fLE/jOEqS/g+mkwc3HaHHfvf4hTVzkQZaIJya0JR4th
        OZP5oex8hWbWsYhHdV4At2/zQMJq/14I3g6ESjjho3oEWUj8eJFZ8t9SClFForft
        lANzKgWDa5brOXRqNbmk8MfIJr9Mzeh/8ghqlBghv9P+haL72OmQIR2MA==
X-ME-Sender: <xms:O4_RYuEtoOmAohFqrVAVM4BbWxB_7D7swKVwv4LHTfprYntSgFvO5g>
    <xme:O4_RYvXKzRPVZJ1A2YCMcaiS233hbfFLxJOYqmeSkd4L3erCYDrSE0U6m4sBHHJR6
    _ibYkF_XwAyuJ77muo>
X-ME-Received: <xmr:O4_RYoLgM9pg7bJuqryM7N9x8U4rWQtuIVufr-rHWqdvc9pFuS58wOYoip0bPCyvOsHldHueyrXKVtNtmsNgpo59lAInD0nSAdUpFVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeehleetfeejteeivdetveegtdetgeffffdvkeeuheejuedvjeefvdekffel
    gfefieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:O4_RYoHPhnxQfkJA5SidtR-6DTivvmg5RB_zCGFtTJDMkt__67enzw>
    <xmx:O4_RYkUEBIm2yhDYyCXLrmnmNYvRSXwfgOEGhUdLsUw8d8lztTaZLw>
    <xmx:O4_RYrNrDjnt-Zj4V6GfM434QUISAD2WRijX_guSu-I_iEOXl_xqvg>
    <xmx:O4_RYtMxuDGb7CGK7GsAR4K6Ey-l__lkxLLJ0i16wQDWWWr8hEqH1Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:00:59 -0400 (EDT)
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
Subject: [PATCH v7 10/28] clk: tests: Add reference to the orphan mux bug report
Date:   Fri, 15 Jul 2022 17:59:56 +0200
Message-Id: <20220715160014.2623107-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
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
index 1a7cb482ec58..b8e32406a6e4 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -322,6 +322,9 @@ static void clk_orphan_transparent_single_parent_mux_test_exit(struct kunit *tes
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

