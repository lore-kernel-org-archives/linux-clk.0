Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 "Tomeu Vizoso" <tomeu.vizoso@collabora.com>,
 "Dong Aisheng" <aisheng.dong@freescale.com>
References: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
Message-ID: <20150513031232.20636.94314@quantum>
Subject: Re: [PATCH 0/6] clk.c cleanups
Date: Tue, 12 May 2015 20:12:32 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Stephen Boyd (2015-04-30 17:14:15)
> Here are some cleanups spurned by some patches from Dong Aisheng.
> No functionality is changed, just reordering of code, etc.

Looks good to me.

Regards,
Mike

> =

> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Dong Aisheng <aisheng.dong@freescale.com>
> =

> Dong Aisheng (1):
>   clk: Squash __clk_{enable,disable}() into callers
> =

> Stephen Boyd (5):
>   clk: s/clk/core/ for struct clk_core
>   clk: Drop unnecessary OOM prints
>   clk: Remove impossible if condition in clk_core_get_phase()
>   clk: Remove forward declared function prototypes
>   clk: Update some comments to reflect reality
> =

>  drivers/clk/clk.c | 1572 +++++++++++++++++++++++++----------------------=
------
>  1 file changed, 755 insertions(+), 817 deletions(-)
> =

> -- =

> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>=20
