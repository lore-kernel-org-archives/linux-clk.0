Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DA2C43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbiGKPYw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbiGKPYt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:24:49 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E47828726
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:47 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id D88C55C01A0;
        Mon, 11 Jul 2022 11:24:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 11 Jul 2022 11:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553086; x=1657639486; bh=1k
        5GlUwQehvuPxFsR0RfGQ6yq/X6lKE4rb73APuTasc=; b=cQJCW6jN6EfCVF8Mbl
        YndjtDrwJRXghZRRLuIhkx+Rp+RO6CQ10qz04yhJTGEIe++geowMmOT45HEHJiTO
        pCLHMuvDxnnhh8FLRVhL8evytYwnDYHhEf0nuAdtZBAT5Fb0cfzuBo79Ywl1cHMN
        FcN/Iae6ozkqMICqekr0m0UexxpD/J66k9IrAgccrHLEtTsh1JuSXGFr6Z0JPvE+
        KLMMalHZVol6iXtPCzDx7bG3xDLWYfw9GzwO6etxJpezJ1260rB+TrYbybFX9VyM
        wvLUiW95mmJw/vkF5oL/UX1rfkEWf/gUDdoUWORdTDVIcGOqdqYF0J0NttT2fCNr
        lTkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553086; x=1657639486; bh=1k5GlUwQehvuP
        xFsR0RfGQ6yq/X6lKE4rb73APuTasc=; b=ymyITOE/NK2zVn5EMCcBGzts0kVS/
        KfwaLhvTnlXsSjYjjspPZkbjLuSmVG8STO+6rovDM96FL8q2sCxGhmRUynCgS//g
        oev6j3jeIDJgzpDFm30qjMN27C9UOYt/m7Nc3TYYJDSXuaWK1FmcTJivZL9TCgGo
        MboAt2V3K3xVZPkhW2Gh3yYXiWgkFOiQdO2j5HTMe2LBgSOqq3j2kGp1XJv87YFm
        vuYQOZaq6951lLYjtifTV+lcPCs3RIEMCE+TUvgn7L6r0DTNKuldFSnU+jqQy4nq
        vhVEMmK1Oy3pYXcyXr1kjYV4pkLwsZvxghPl4qTXHGrjEi4Q7AdkCJBBA==
X-ME-Sender: <xms:vkDMYnPas5F3Q-dvXbM5BJSXeJFvtScPNxazTb7HFI0JnXE2jjO-Sw>
    <xme:vkDMYh9x0QMehClZgcBQdCb29mZGTUf-f7UY9WEnDDuFZVn5x31faLKfm9VOxTEnb
    XqSuI74sc2DZjyMZ8Q>
X-ME-Received: <xmr:vkDMYmRcw-2rqHpEUeQyYTROJ19mfJKT4XQXyrBUdpvWl-JK94afOpambD7MpCbn2jx-H-prRgj4CmPcseVV3nNsHleEgEaHLaWKQBo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeehleetfeejteeivdetveegtdetgeffffdvkeeuheejuedvjeefvdekffel
    gfefieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:vkDMYruaQ-p8caWcmCXykIWxeDK7hCjVj-wHQwPqZn7eNDHijCNcFw>
    <xmx:vkDMYvendIbF5Pxb6ZaNRWCGDOC6sOUOiR9KiG9CrHtUotiRRdxRWw>
    <xmx:vkDMYn0KLpnpq_2RUWdOnRIsXCmop7II6Q7i9OVdm8fvflRBRjG0YA>
    <xmx:vkDMYgUmQVnaZglMzrpzt9EehlYlUM_dHQqDPm4eCd0uP1b3qYfgFg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:46 -0400 (EDT)
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
Subject: [PATCH v6 10/28] clk: tests: Add reference to the orphan mux bug report
Date:   Mon, 11 Jul 2022 17:24:06 +0200
Message-Id: <20220711152424.701311-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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

