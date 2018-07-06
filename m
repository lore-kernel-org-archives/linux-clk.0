Return-Path: <david@lechnology.com>
Subject: Re: [PATCH v3 01/13] clk: davinci: psc-da850: remove the
 'davinci_nand.0" lookup
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180628095748.4462-1-brgl@bgdev.pl>
 <20180628095748.4462-2-brgl@bgdev.pl>
From: David Lechner <david@lechnology.com>
Message-ID: <23f1a1fb-689a-3120-6ae4-d91c76698401@lechnology.com>
Date: Fri, 6 Jul 2018 12:40:26 -0500
MIME-Version: 1.0
In-Reply-To: <20180628095748.4462-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 06/28/2018 04:57 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Since commit a8e3923ab571 ("mtd: rawnand: davinci: don't acquire and
> enable clock") we no longer acquire the aemif clock from the davinci
> nand driver - we only do it from the ti-aemif driver. Remove the nand
> entry from the psc lookup table.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: David Lechner <david@lechnology.com>
> ---

Applied to clk-davinci-4.19.

Thanks.
