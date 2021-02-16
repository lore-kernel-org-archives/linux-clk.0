Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4389BC433DB
	for <linux-clk@archiver.kernel.org>; Tue, 16 Feb 2021 20:55:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E707064EB3
	for <linux-clk@archiver.kernel.org>; Tue, 16 Feb 2021 20:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhBPUy5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Feb 2021 15:54:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:37500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229699AbhBPUy4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Feb 2021 15:54:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8209064E7D;
        Tue, 16 Feb 2021 20:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613508855;
        bh=Li8MKyTXIVRWSKg+RMW6Yzb5jQd5e78mMM6/hLJ4Ubk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Jvwl5KWrHMv0FQdeXBsvYi89OCrSswqG9DOiN+M/xbxHUuiawVwfKzFDdCHUHHEXB
         9TKkJz99FhV0jvNTKsVHzdaL1iGmd5C+JwbenCPDfdy+k6XBX5UA/Bi11rYzqzaau9
         RMIhcRU0sZLyzvqPoh0mzeQ1qgIOOE1Mtw2x4Wdu3TyR+wDYE51AuBpgrPBpk+BO8u
         sKH5rGmNIz0Ikx7j1UBIucdSaCU/wP0OuJzQgsgfcWGPs5TXz64u84CFtZZ6jexYdu
         DB+UM7GjD/hWHeXU3aeqoq6ljnxqdHb30A8kTrGYdZYvzlwF1YI+V7jMPdok0Smgql
         dp/ptNDjKt/8g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210215115710.3762276-1-daniel@0x0f.com>
References: <20210215115710.3762276-1-daniel@0x0f.com>
Subject: Re: [PATCH 1/2] clk: mstar: Allow MStar clk drivers to be compile tested
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>
To:     Daniel Palmer <daniel@0x0f.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Tue, 16 Feb 2021 12:54:14 -0800
Message-ID: <161350885409.1254594.4380070292122043991@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Palmer (2021-02-15 03:57:09)
> Allow COMPILE_TEST to also build the MStar clk drivers
> instead of only building them when ARCH_MSTARV7 is selected.
>=20
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/Makefile      | 2 +-
>  drivers/clk/mstar/Kconfig | 7 ++++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 7fed7e5944cd..e5e23a44fbe9 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -95,7 +95,7 @@ obj-$(CONFIG_MACH_PIC32)              +=3D microchip/
>  ifeq ($(CONFIG_COMMON_CLK), y)
>  obj-$(CONFIG_ARCH_MMP)                 +=3D mmp/
>  endif
> -obj-$(CONFIG_ARCH_MSTARV7)             +=3D mstar/
> +obj-y                                  +=3D mstar/
>  obj-y                                  +=3D mvebu/
>  obj-$(CONFIG_ARCH_MXS)                 +=3D mxs/
>  obj-$(CONFIG_COMMON_CLK_NXP)           +=3D nxp/
> diff --git a/drivers/clk/mstar/Kconfig b/drivers/clk/mstar/Kconfig
> index 23765edde3af..eab8f7dcaa90 100644
> --- a/drivers/clk/mstar/Kconfig
> +++ b/drivers/clk/mstar/Kconfig
> @@ -1,5 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config MSTAR_MSC313_MPLL
> -       bool
> +       bool "MStar MPLL driver"
> +       depends on ARCH_MSTARV7 || COMPILE_TEST
> +       default ARCH_MSTARV7
>         select REGMAP

I've also removed this select REGMAP. It isn't necessary as this selects
REGMAP_MMIO.

>         select REGMAP_MMIO
> +       help
> +         Support for the MPLL PLL and dividers block present on
> +         MStar/Sigmastar SoCs.
