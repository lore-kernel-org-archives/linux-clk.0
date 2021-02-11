Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2E2C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:58:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F9FF64E44
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:58:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhBKT6Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 14:58:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:39280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231727AbhBKT5k (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 14:57:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2688E64E5F;
        Thu, 11 Feb 2021 19:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073419;
        bh=NYyqM+APAuRJfRRlkyIxgJlHUt2fMaHxusXG+d+xXn0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=doEZvJX0SliViRD0VWtz8IRsGjKRDC5owplAazugK7Ri1uusadscl35cQ/rQqtFh6
         ScnzPoB2iABIy0z7UCTlrtnI9MHm0zQp7wFe3keaifyJMhCGnL2i5qdc5+QP9BnDNe
         u4Wqfvw8xr+T4agPz66NrPcDmzEkgWg7+ms/WuSBamJNGvswCZ7XbawLD9DGSi8zxI
         6TcWXX+MjYBb0Fsw99ubNrdIpvm0j0HhixG7Bv46u1rCdkYav+1SAHd4d97KJLyyOM
         /ZS/AS/qfsf3rfuGjC/VQE1sUBDkqZHw/kzGynP1Y6TJKHQu/Smf11v0AE/2kxpg7Y
         tywAc8ikzZz4g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-16-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210126124540.3320214-16-lee.jones@linaro.org>
Subject: Re: [PATCH 15/21] clk: clk-npcm7xx: Remove unused static const tables 'npcm7xx_gates' and 'npcm7xx_divs_fx'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nuvoton Technologies <tali.perry@nuvoton.com>,
        openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:56:57 -0800
Message-ID: <161307341789.1254594.6715719974957898063@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lee Jones (2021-01-26 04:45:34)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/clk-npcm7xx.c:438:43: warning: =E2=80=98npcm7xx_gates=E2=80=
=99 defined but not used [-Wunused-const-variable=3D]
>  drivers/clk/clk-npcm7xx.c:365:48: warning: =E2=80=98npcm7xx_divs_fx=E2=
=80=99 defined but not used [-Wunused-const-variable=3D]
>=20
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Patrick Venture <venture@google.com>
> Cc: Nancy Yuen <yuenn@google.com>
> Cc: Benjamin Fair <benjaminfair@google.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Nuvoton Technologies <tali.perry@nuvoton.com>
> Cc: openbmc@lists.ozlabs.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
