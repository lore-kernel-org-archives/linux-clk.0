Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57F5C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 31 Mar 2022 11:12:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbiCaLNr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Mar 2022 07:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbiCaLNq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Mar 2022 07:13:46 -0400
X-Greylist: delayed 305 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 31 Mar 2022 04:11:59 PDT
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40F265780
        for <linux-clk@vger.kernel.org>; Thu, 31 Mar 2022 04:11:59 -0700 (PDT)
Received: from mail-lf1-f54.google.com ([209.85.167.54]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M8ysi-1ndkWg0Zle-0065B1; Thu, 31 Mar 2022 13:06:52 +0200
Received: by mail-lf1-f54.google.com with SMTP id 5so40832298lfp.1;
        Thu, 31 Mar 2022 04:06:51 -0700 (PDT)
X-Gm-Message-State: AOAM533bTn7O7a11LnD4LBzLwpr8imLMTdfFqwRtGO9j/dD6jGxgn29N
        Bk7dTw89SdYYprRoFXYSxHk4FidIZHqvl2i5TfY=
X-Google-Smtp-Source: ABdhPJwGAKwpvIMNsQM9nFO11Su4f6CfBdGu0DMcmygJKo9OCuKECCNyCiW9rLz7dH/8XUmg1E8wSHe238gGnDMMuwI=
X-Received: by 2002:a5d:6505:0:b0:205:9a98:e184 with SMTP id
 x5-20020a5d6505000000b002059a98e184mr3173055wru.317.1648717802947; Thu, 31
 Mar 2022 02:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648714851.git.qinjian@cqplus1.com> <84a0839e7724fa39dd07fef491cf6bb357db2e7d.1648714851.git.qinjian@cqplus1.com>
In-Reply-To: <84a0839e7724fa39dd07fef491cf6bb357db2e7d.1648714851.git.qinjian@cqplus1.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 31 Mar 2022 11:09:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2SQCj8pqyJvS+TpgqQu51+YyB4SOi2cd_WU9ObgAjZOw@mail.gmail.com>
Message-ID: <CAK8P3a2SQCj8pqyJvS+TpgqQu51+YyB4SOi2cd_WU9ObgAjZOw@mail.gmail.com>
Subject: Re: [PATCH v12 9/9] ARM: sp7021_defconfig: Add Sunplus SP7021 defconfig
To:     Qin Jian <qinjian@cqplus1.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:z/4tzUqmZYGQZ24spxksEyOysVr2PtahhN9T25NYZZ8BcxpPVMr
 7f0+JFCQTAp6cESgArBXyjsnxp2HR+EBu8UPfgzj4IXgFZlfvqB7RfFHhSU91nDYWmAMn0s
 UgOI3VfA50GGzeQd4uK/Ykpco/lJvUf8beq/MtMtFGXrfaPljzWiiqrOGNQZ8/gMr4pDlw2
 S5kaIkofDm98f5Tq87h4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2V9sh8I9v68=:OhM9rT6LD4p2wjVI2HscDE
 WhhJ/hXYeJ9HehVn3vn8Jh8w+8AoT3i0Inv+7+zJYNwD2T4EqCXiAcgypwbn4YDQLB3MINxfu
 lrMmn2UHVynYLQf95LH5uhGJXtPc0nFu4uNF+r0q0fUONKcpZO9wPvBz0FozGm7jjuGKTlUBK
 Osu+xS4a+e5OHYEKlszyh4h2v4Eq3aEunBPEXHHKBVFU1PYJQt5vriZSowLtVI2YbBejar72O
 cZ6bZi1sLJpcD3NyKAtrcYTmlnCQWCIgBQnbUf1rc7rqk7P9yDWm2CEumal12SIW03sQWO905
 knBWRAVbgUOJcGZnNlYYe4SLIAzRJvXN7Y6DFNTUWG3Piro4+1kiqO9exzmvlOpwSyA0IkVvF
 /vpVWkic+gCXGWYVYP7ClhD97OTP5LocoQgp7u5LhZc+wfEyqALC6DmzlmuJ7RJx+7ShULqPH
 ODWO9reOPFVxLY8VSkF5RE/BbIsiT1a7KZawBxaLr5BN7BG4KhCYVO9WGc+vC78DPqp+1JDFX
 hASTaadEnmDhSYb1++6qhGh4HHsc9ydDRnLyKHopKBBvr6E6vIsr9A/euoL54FniUzbdIMNOH
 7cN2n4SnmOrJgy80I5RWNEUOH9QirONBuaHBAJVzy+qtggBXCVLyUIRKC90kdvErHb3k8asv5
 bauIcsayWVObE9jar1zffWHQOkSHT6xV6Y0g2cpmCw26CAPM4hV1haGmXfxxCY2pJF6HPgIQG
 XS6KGvLnd/3kcy5gVKm3tj1FuBZXLL0gNRdscISAz3UPIdtUPsZ2OX0tJkciQh8BFpEUrvRMV
 Cc8xoVdOVDHCWbg/fM/C0L+rl7T9pxMZSQefZx22h+GDJlcCYg=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Mar 31, 2022 at 10:29 AM Qin Jian <qinjian@cqplus1.com> wrote:
> Add generic Sunplus SP7021 based board defconfig

Here, you should explain why you need a custom defconfig for this SoC, as
most platforms are fine just using the generic one. Are you too memory
constrained,
or are there other problems?

> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 8863fa969..a3bd9dbd8 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -86,6 +86,7 @@ CONFIG_MACH_SPEAR1310=y
>  CONFIG_MACH_SPEAR1340=y
>  CONFIG_ARCH_STI=y
>  CONFIG_ARCH_STM32=y
> +CONFIG_ARCH_SUNPLUS=y
>  CONFIG_ARCH_SUNXI=y
>  CONFIG_ARCH_TEGRA=y
>  CONFIG_ARCH_UNIPHIER=y

Don't you need any drivers here?

> diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
> new file mode 100644
> index 000000000..cda16d33a
> --- /dev/null
> +++ b/arch/arm/configs/sp7021_defconfig
...
> +CONFIG_HAVE_ARM_ARCH_TIMER=y

I checked this one again, as most others don't enable it in the defconfig.

I don't remember if I recommended removing the 'select' from Kconfig
in a previous round, but as that is where other platforms have it, I'd add
it there as well.

> +CONFIG_STAGING=y

Do you actually enable any staging drivers here? If not, I'd drop that bit.

          Arnd
