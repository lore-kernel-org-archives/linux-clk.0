Return-Path: <v1ron@mail.ru>
Date: Tue, 31 May 2016 09:23:29 +0300
From: Roman Volkov <v1ron@mail.ru>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Roman Volkov <rvolkov@v1ros.org>, Tony Prisk <linux@prisktech.co.nz>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 0/2] Rework clk/vt8500 wm8650_find_pll_bits()
Message-ID: <20160531092329.53bcacdd@v1ron-s7>
In-Reply-To: <1464120473-1808-1-git-send-email-v1ron@mail.ru>
References: <1464120473-1808-1-git-send-email-v1ron@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

=D0=92 Tue, 24 May 2016 23:07:51 +0300
Roman Volkov <v1ron@mail.ru> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> From: Roman Volkov <rvolkov@v1ros.org>
>=20
> Hi Arnd and others,
>=20
> This patch finally removes the warnings from GCC about possibly
> uninitialized variables 'best_div2', 'best_div1', and 'best_mul'.
> Also one of the functions is reworked, so that the algorithm is much
> easier. This is to continue the work started in [1].
>=20
> This code is tested on WM8650. Also the testing app was used in
> user-mode to check possible values and performance [2].
>=20
> [1] https://lkml.org/lkml/2016/2/1/149
> [2] https://github.com/v1ron/vt8500-clkrange
>=20
> Thanks,
> Roman Volkov (2):
>   clk/vt8500: Rework wm8650_find_pll_bits()
>   clk/vt8500: Fix compilation warnings
>=20
>  drivers/clk/clk-vt8500.c | 81
> +++++++++++++++++++++++------------------------- 1 file changed, 39
> insertions(+), 42 deletions(-)
>=20

Hi Stephen,

Do we need this change during this merge window?

Thanks,
Roman
