Return-Path: <linux-kernel-owner@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Carlo Caione <carlo@caione.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180515164229.4606-1-jbrunet@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180515164229.4606-1-jbrunet@baylibre.com>
Message-ID: <152640711006.34267.13271626390751114709@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: meson: use SPDX license identifiers consistently
Date: Tue, 15 May 2018 10:58:30 -0700
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2018-05-15 09:42:29)
> diff --git a/drivers/clk/meson/clk-audio-divider.c b/drivers/clk/meson/cl=
k-audio-divider.c
> index f7ab5b1db342..ac0743cd0f2f 100644
> --- a/drivers/clk/meson/clk-audio-divider.c
> +++ b/drivers/clk/meson/clk-audio-divider.c
> @@ -1,18 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0+

This is GPL2 or later.

>  /*
>   * Copyright (c) 2017 AmLogic, Inc.
>   * Author: Jerome Brunet <jbrunet@baylibre.com>
> - *
> - * This program is free software; you can redistribute it and/or modify =
it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> - * more details.
> - *
> - * You should have received a copy of the GNU General Public License alo=
ng with
> - * this program.  If not, see <http://www.gnu.org/licenses/>.

But this looks like GPL2 only because there isn't an "or later" part of
the text. Is it intentional to relicense to GPL2+ instead of GPL2 only?
If so, please add that into the commit text.
