Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Anders Roxell <anders.roxell@linaro.org>, gregory.clement@bootlin.com,
 mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180726222721.5787-1-anders.roxell@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anders Roxell <anders.roxell@linaro.org>
References: <20180726222721.5787-1-anders.roxell@linaro.org>
Message-ID: <153271055369.48062.7965396244056342743@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: mvebu: armada-37xx-periph: Remove unused var num_parents
Date: Fri, 27 Jul 2018 09:55:53 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Anders Roxell (2018-07-26 15:27:21)
> When building armada-37xx-periph, num_parents isn't used in function
> clk_pm_cpu_get_parent:
> drivers/clk/mvebu/armada-37xx-periph.c: In function =E2=80=98clk_pm_cpu_g=
et_parent=E2=80=99:
> drivers/clk/mvebu/armada-37xx-periph.c:419:6: warning: unused variable =
=E2=80=98num_parents=E2=80=99 [-Wunused-variable]
>   int num_parents =3D clk_hw_get_num_parents(hw);
>       ^~~~~~~~~~~
> Remove the declaration of num_parents to dispose the warning.
> =

> Fixes: 616bf80d381d ("clk: mvebu: armada-37xx-periph: Fix wrong return va=
lue in get_parent")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---

Applied to clk-next
