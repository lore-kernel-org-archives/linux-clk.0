Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:53720 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757015AbcLCBYu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2016 20:24:50 -0500
MIME-Version: 1.0
In-Reply-To: <1480725436-9628-1-git-send-email-vlee@freedesktop.org>
References: <1480725436-9628-1-git-send-email-vlee@freedesktop.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 3 Dec 2016 10:24:43 +0900
Message-ID: <CAK7LNATeswNhoFsA90k=qF4Jock0ytNT-pPT6j+0b9MJFJwu9Q@mail.gmail.com>
Subject: Re: [PATCH] clk: uniphier: Fix build with gcc-4.4.
To: Vinson Lee <vlee@freedesktop.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Vinson,

2016-12-03 9:37 GMT+09:00 Vinson Lee <vlee@freedesktop.org>:
> gcc-4.4 has issues with anonymous unions in initializers.
>
>   CC      drivers/clk/uniphier/clk-uniphier-sys.o
> drivers/clk/uniphier/clk-uniphier-sys.c:45: error: unknown field =E2=80=
=98factor=E2=80=99 specified in initializer
>
> Fixes: 1574d5722636 ("clk: uniphier: remove unneeded member name for unio=
n")
> Signed-off-by: Vinson Lee <vlee@freedesktop.org>


This driver has COMPILE_TEST option, but kbuild test robot
did not mention about this.



This is a bad way of fixing, I think.
(what if a new member is inserted before the union in the future?)

Rather, please revert the bad commit.


>                 .name =3D "sd" #ch "-sel",                               =
 \
>                 .type =3D UNIPHIER_CLK_TYPE_MUX,                         =
 \
>                 .idx =3D -1,                                             =
 \
> -               .mux =3D {                                               =
 \
> +               { .mux =3D {                                             =
 \
>                         .parent_names =3D {                              =
 \
>                                 "sd-44m",                               \
>                                 "sd-33m",                               \
> @@ -63,7 +63,7 @@
>                                 0x00001200,                             \
>                                 0x00001300,                             \
>                         },                                              \
> -               },                                                      \
> +               } },                                                    \
>         },                                                              \


No, please do not do this.






--=20
Best Regards
Masahiro Yamada
