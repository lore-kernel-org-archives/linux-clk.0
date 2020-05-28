Return-Path: <SRS0=GgXf=7K=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC02C433DF
	for <linux-clk@archiver.kernel.org>; Thu, 28 May 2020 11:57:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 384872177B
	for <linux-clk@archiver.kernel.org>; Thu, 28 May 2020 11:57:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389122AbgE1L5x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 May 2020 07:57:53 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:52231 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388916AbgE1L5w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 May 2020 07:57:52 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M5fUy-1jfwv943bu-007FGQ for <linux-clk@vger.kernel.org>; Thu, 28 May 2020
 13:57:50 +0200
Received: by mail-qk1-f179.google.com with SMTP id n141so2782650qke.2
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2020 04:57:49 -0700 (PDT)
X-Gm-Message-State: AOAM5338cGfTiZ2RblxGzSPahd5SiXjBbr+UUG+Pl8EUN+UrKuXtPwKb
        nOHHOZGa2ebTBDl211skPvoMGXJ7DHOH/Kw4Dek=
X-Google-Smtp-Source: ABdhPJz02BIHcejgMZy60Qf70ZgFyMNKd+rhOvbUF4qbhRCLsGQ7Yvaxbck9sSYKzX9BuNp74DvRvQw4vU3WenCxBwM=
X-Received: by 2002:ae9:de85:: with SMTP id s127mr1139395qkf.352.1590667068879;
 Thu, 28 May 2020 04:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200527181307.2482167-1-robh@kernel.org>
In-Reply-To: <20200527181307.2482167-1-robh@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 28 May 2020 13:57:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a27RkBkt5mnBeVJ-67MnJi29Dc+jYL2Q8JskaZ1W_XrKg@mail.gmail.com>
Message-ID: <CAK8P3a27RkBkt5mnBeVJ-67MnJi29Dc+jYL2Q8JskaZ1W_XrKg@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: Fix kconfig dependency on COMMON_CLK_VERSATILE
To:     Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Fu/jYkjyINPqzZh3cKk4O/irJc24hcaSKvoub3iTYyBmMTWSQuy
 tTDOlxAYsdtZ1laTJhzA8bz6P8C406ELNsowPAt4+BXWzI9RFFdZT2tanbNG9UTBTtfE9Ei
 hFao3EevTR8NBYPHLIrkpI1H9h1/Wm7cfuP1/jyzyGU/6j6QJuTSOzrIgdb5cdOCjg+xHub
 7COqOuy/5sx6Wbg7Ivt/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9jyzrw5P9Yo=:4xBKs9/Nw9uwejT2JwNnRm
 7+4C0Ej+amdGuOCdpn3ncthnFGDAEC3upejH6uXllSgh9NTpWRf5T7XWGDyPYTIyuYJLcPAn4
 4ujUvReXmq9YAH5gT/xJb2WaqP+ssDFfH9Xt5k9f+PhciUhXLvbH5ns+urwrnip+MiZLB0v0E
 1POfZrZbULjlJUPZMbroUalELZWPqKZ8SSKBqlCZcUEE592y2cuyZxZU+K74Mo+DWaU1qIXkQ
 B3UdWvD6gVHG2PpmgtDJP+9tzjLXsBVusabxikJZs4tLbKpVAfJk8wtoCYASLXEzqL0vaNmgM
 1Xw1JTjsSYSVBAwZiPSYg+lSEy1UwcUr/YU5DGCv5EVYptvIA9uNlRst2TVUwj5wjOaabl/KN
 XUp4peLBOnLpGRsaJ0teDMqQNcwgrbwauMtFixJv6tKq4Y2Idj4P8C2SBVeh2fo7ZSNxp3p52
 D/05/dZTbXXx829AOa1rNOSbKtoDJjSw0cMuTr3A2IjfiuiwIxlk0D+fxSlD3JICminlSWhNi
 1WPck9WhTwcFdsIqG/+TxTQXIlcxIl2xo3+SITZuwimSrZZHdCn2dXt3ovErhK1D3ajHyd7p2
 2ZeVFvBDcizrcmj7qMG/3qn7DYP/QoGbM5EwkJ6nauJr9qnQAIgjmS4a7qcFALeJFsA9aRO4g
 GfYvZoDtH91YLMQ2WO5i2vPktfqYYaHH12ySSVg5E0+ohjHiPIsQd64xintgeJPlvu8YYz//y
 ijgabhPWoOkeupx86W7PDO67HriSLveWfVnkz2ED75VW9EE/kcxDwBNaqiISzbaH2BFBtZ/Ic
 2/Inq/5co1gJncoMpdJWc0ZKrFnawITT/NuHB8U4x0MKm4ZBNI=
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 27, 2020 at 8:13 PM Rob Herring <robh@kernel.org> wrote:
> diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
> index a0ed412e8396..8c1b0e8e8d32 100644
> --- a/drivers/clk/versatile/Kconfig
> +++ b/drivers/clk/versatile/Kconfig
> @@ -1,11 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
> -menuconfig COMMON_CLK_VERSATILE
> -       bool "Clock driver for ARM Reference designs" if COMPILE_TEST
> -       default y if ARCH_INTEGRATOR || ARCH_REALVIEW || \
> -               ARCH_VERSATILE || ARCH_VEXPRESS
> -
> -if COMMON_CLK_VERSATILE
> +menu "Clock driver for ARM Reference designs"
> +       depends on ARCH_INTEGRATOR || ARCH_REALVIEW || \
> +               ARCH_VERSATILE || ARCH_VEXPRESS || COMPILE_TEST
>

I've applied this version now but added ARCH_ZYNQ as an additional
dependency to work around one of the warnings we got earlier.

       Arnd
