Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C233C55ABD
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 20:32:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA07B223EA
	for <linux-clk@archiver.kernel.org>; Sat, 14 Nov 2020 20:32:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8qAnAzQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgKNUcg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Nov 2020 15:32:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:33228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgKNUcg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 14 Nov 2020 15:32:36 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9EDCA223EA;
        Sat, 14 Nov 2020 20:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605385955;
        bh=uRosUtJJuCEP6nMWxQx1tCUp6FLcFxFLp8EIa+4Qbh0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k8qAnAzQ+2KiJp1+K0XMKsxv/0UQkcr9U9AJHotV5KORzpmTubxAgNxziGTGWZJM7
         hDwU8UXBraY3OQAte4CpCEgwlnvK6djMMTyo9082NkS/nMvidmX8Xk5VCQ6I0HZgez
         ooKmyeRTWpmoW01fmAroEegkJeqXpobuSZlDUlr8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201106094820.30167-1-lukas.bulwahn@gmail.com>
References: <20201106094820.30167-1-lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] clk: remove unneeded dead-store initialization
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Tom Rix <trix@redhat.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Sat, 14 Nov 2020 12:32:34 -0800
Message-ID: <160538595432.60232.9813667976586248163@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lukas Bulwahn (2020-11-06 01:48:20)
> make clang-analyzer on x86_64 defconfig caught my attention with:
>=20
>   drivers/clk/clk.c:423:19:
>   warning: Value stored to 'parent' during its initialization is never re=
ad
>   [clang-analyzer-deadcode.DeadStores]
>           struct clk_core *parent =3D ERR_PTR(-ENOENT);
>                            ^
>=20
> Commit fc0c209c147f ("clk: Allow parents to be specified without string
> names") introduced clk_core_fill_parent_index() with this unneeded
> dead-store initialization.
>=20
> So, simply remove this unneeded dead-store initialization to make
> clang-analyzer happy.
>=20
> As compilers will detect this unneeded assignment and optimize this anywa=
y,
> the resulting object code is identical before and after this change.
>=20
> No functional change. No change to object code.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Applied to clk-next
