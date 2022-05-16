Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAD8C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:27:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235583AbiEPN1Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237596AbiEPN1H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:27:07 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF4D28728
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:26:58 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 0A38B32007F0;
        Mon, 16 May 2022 09:26:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 16 May 2022 09:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707616; x=1652794016; bh=MX
        qC38DcKa37Vd75cbNyJjb6wJVeHddhwpvwyzO4EFo=; b=k0xe0HpHZe1DbNcp64
        vvVgya0cMA7XdKkz5/XeI4tRMiQsH2q0yKaw7mGARk4oYbEwKlwWRHW5aTRvVNAK
        64HLt6gjFuzhvdxTRb03e/SMfgC+2uHR1FOduMufTcUnqT/dEPop8q8WflVEYk9d
        BPG7dWMmITl2a82IDex2xFSdNbH+uqQHMS14OKtUIjwIw/Ux2TsrC4dVkaAAN7L3
        +qLKNbpdeRAKlDaSiHh/k/bNnDi2TZ96y6Ya8NOSaq9zd9rTUsCUBNumGRRRjko1
        +yJJh05Y60rso1F4bMDKyNQjiybNigzcJoZpiUnxlJ4dXop1x92gvc7ZIS3RJjkW
        6SUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707616; x=1652794016; bh=MXqC38DcKa37Vd75cbNyJjb6wJVeHddhwpv
        wyzO4EFo=; b=G0NgbQjHBMEw3akILqqwTnZaKYlraKevMxd62MDFw1bjStJjStG
        adXw8Ug7kk0G0NPgILYyVYHRCaSeXj+1ATuP0LjEKCFP8YkaOgU1fDuWWXtqNTSy
        73QxCsTQ6wEEPKuOqcWPdVpWqdtkbSIMuCrFighEXrcC14vbuomaEQajBZivlSRl
        dicKSkXdBnGvhRjCSg9NNWbD4DYYVkNHPRrAfQj3pdqVAoe673XI3wo1T2qrioNK
        iJ/R977SP2sSCjsCx2ud2wrN/NPeikT7zyYGSqyVBVgwBsVhJOQCURe/kgiMCJ2e
        PDhYQtAUmCLAAq24fYNbWOu6LcOjKgVZAHg==
X-ME-Sender: <xms:IFGCYq--jCSDE_GehYiMTAZBe8SY7yQOk6smhptFyGbA37SbbgLZKQ>
    <xme:IFGCYquGiNY_H53kint09DTdmzJ2O-XvUdTPPUsKUeNepUSAYzm6zJYu6z5-HzKRh
    SnBn0_hMGVlKUjZMEc>
X-ME-Received: <xmr:IFGCYgBRI2hh1l3gseMP9dMUi4yboc_4_QUPetasnGs2ZLz9fKpiuI1JVf-IoON_J8WJC8NlJygIrOc_O6q3-3L4sT_N1AtH3QX6gLM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IFGCYifpsgKrs4Tn7I1H9lAkLrif9LrddsMvrxn896u2XqcZumTXbA>
    <xmx:IFGCYvMT3uEwu-pjLJs4QnOA0Qja4KBwysWP69_ZBbc-9Eq5IU2cIg>
    <xmx:IFGCYslsZVDTQNQy43GdCgCB85ujAUJnmfNj_ZC5_sz8GZx8r9t_fg>
    <xmx:IFGCYgGJDdC9pEnyFaMpdjmFqcbzH2gcZExrU8AAiCM5TlkpSsZrOA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:26:56 -0400 (EDT)
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
Subject: [PATCH v5 24/28] clk: Test the clock pointer in clk_hw_get_name()
Date:   Mon, 16 May 2022 15:25:23 +0200
Message-Id: <20220516132527.328190-25-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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

