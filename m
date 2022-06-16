Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FD7C43334
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 02:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347007AbiFPChv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 22:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233633AbiFPChu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 22:37:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A547024F32
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 19:37:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4029E60EBC
        for <linux-clk@vger.kernel.org>; Thu, 16 Jun 2022 02:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A86C3411A;
        Thu, 16 Jun 2022 02:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655347068;
        bh=5v4m6W3GRsK28B/HjD5PkoAYkuQiMh5fLFhuesLG1bI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Cbj9+IZYjJTG2r2Of1bY1CmFVAhgDQOQRlhdIpTjM89D0Ke4CPcbbLCrkBCq8cZ8f
         t6yPMq1J1jSw+TeVmtcuVFSOt+Mb7S3MM4x88d17djU5hAYx6K9mSBOWASt4Gu36n5
         j5Xj6N74VLKopZyHrYjTJHAi8pCUSJtU/erZVuGb3p1NNIYlBlGgLyVpULLcV/jbtB
         rBNLPhvPeOxOD5/zgvCHte1b/vGYfWilnybKtwqbh3mcPy4UPLSZLsN2hbg811tp4U
         dmuzQQnAzODTWBRhPAoX5Je8u5bZ34wVu9lMsqaUo3lDU37sRpTSZEW11u1ZC0dOrX
         NI088NcfLysIw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220520075737.758761-5-u.kleine-koenig@pengutronix.de>
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de> <20220520075737.758761-5-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v9 4/4] clk: meson: axg-audio: Don't duplicate devm_clk_get_enabled()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
To:     Russell King <linux@armlinux.org.uk>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Wed, 15 Jun 2022 19:37:46 -0700
User-Agent: alot/0.10
Message-Id: <20220616023748.91A86C3411A@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2022-05-20 00:57:37)
> The clk API just got a function with a slightly different name and
> the same functionality. Remove the duplication.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
