Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C19C0018C
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 00:06:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9968323A23
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 00:06:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgLTAGI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Dec 2020 19:06:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:38272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726421AbgLTAGI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 19 Dec 2020 19:06:08 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608422727;
        bh=Q0PWZfGefOqpqkrphXHR9omvqfw1WAD/gcxwNcYBgAo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oCkdCv6Ppi0zfWKfoHhPWjl1Qu6dGhH86e+od1YnwpcjUsZc6QjroDMDRUenxmo0z
         CzBD64OaEa4RYwINZCu0IcEI4f5Z+o5KsF4rRowGFaKgAjFREznFP+btdP9A9HvwFt
         KFu6IujUI/mlqKtQTvVdR9gQqJDUB6dHgotVN4/paoOgIzC6Q1lPPbS9+hZF6Sp6wU
         /SfMv54j9zxXJ355ucruLp+SlDXlaOaRQ5AEWcJuD81XuPgUHF69YmSJRhPR2vflVf
         QTFixf8TykLJ/m4er+1pVDqD+riZA9lQ2Hf6e5b7TJWKDSTdHIvWSRVf878M02pzpa
         mC6GHhuq38yLQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201212135733.38050-1-paul@crapouillou.net>
References: <20201212135733.38050-1-paul@crapouillou.net>
Subject: Re: [PATCH] clk: ingenic: Fix divider calculation with div tables
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        stable@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Date:   Sat, 19 Dec 2020 16:05:26 -0800
Message-ID: <160842272655.1580929.15045962405461927127@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Paul Cercueil (2020-12-12 05:57:33)
> The previous code assumed that a higher hardware value always resulted
> in a bigger divider, which is correct for the regular clocks, but is
> an invalid assumption when a divider table is provided for the clock.
>=20
> Perfect example of this is the PLL0_HALF clock, which applies a /2
> divider with the hardware value 0, and a /1 divider otherwise.
>=20
> Fixes: a9fa2893fcc6 ("clk: ingenic: Add support for divider tables")
> Cc: <stable@vger.kernel.org> # 5.2
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
