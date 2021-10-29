Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EFDC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 06:42:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58D3661151
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 06:42:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhJ2GpI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Oct 2021 02:45:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:56206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230252AbhJ2GpI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 Oct 2021 02:45:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AFAE600EF;
        Fri, 29 Oct 2021 06:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635489760;
        bh=zBNxfMJIs1Z6C1TH8uhcx7fmyaXW2dEQiMCpmexM9Bw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PCAPt1d60ZqvAafTQCZKvM+OzBV4/P2YA/BowtZOXGszQZ6bO/dsPINbTOV69F5Eu
         qLGGZLP9/IycFBT/hkoRWFctrd0UdoFvw7LWX1TpEGARqt1y8v/yDdsGfjNweQM77k
         wrcNTWDwXYbjRoMBneMEDrHgU8xu5jSr71f7Voc8xVb6f+QT92KvNNmqGob1JU4/dq
         PrkvCkKETZyLvk3VFNhQv25epmaPSr1CrZha3jNkWzNyPrQONaSeTOruNfAGE7Oo2d
         VYWMZ3z4Y+D2who3p06znBbP84FkMdO5IyfMOtssk9MZHepbI/xbEV1P4bKa8zSZAY
         INYoda+XEa+Ew==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211027132616.1039814-2-heiko@sntech.de>
References: <20211027132616.1039814-1-heiko@sntech.de> <20211027132616.1039814-2-heiko@sntech.de>
Subject: Re: [PATCH 1/2] Revert "clk: rockchip: use module_platform_driver_probe"
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel@esmil.dk, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, heiko@sntech.de
To:     Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org
Date:   Thu, 28 Oct 2021 23:42:39 -0700
Message-ID: <163548975917.15791.3256808775240329493@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2021-10-27 06:26:15)
> This reverts commit 1da80da028fe5accb866c0d6899a292ed86bef45.
>=20
> Reading recent discussions [0] [1], I realized this change introduces
> a number of problems:
>=20
> - only converting to module_platform_driver creates the issue
>   with the existing __init and __initdata attributes.
>=20
>   When the driver would've been built as a module, all the missing
>   clock-definitions (all are initdata) should've turned up as error
>   in testing suggesting that the change wasn't at all
>=20
> - a clock driver is a very core component of soc bringup and making
>   this able to be built as a module solely for enabling the soc vendor
>   to add out of tree changes for Android implementations is not in our
>   interest and also everything except a ramdisk won't probe without a
>   clock controller.
>=20
>   This is especially true when the changes aren't really tested and
>   are merely added to move the mainline driver "out of the way".
>=20
> [0] https://lwn.net/Articles/872209/
> [1] https://lore.kernel.org/all/163529604399.15791.378104318036812951@swb=
oyd.mtv.corp.google.com/
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
