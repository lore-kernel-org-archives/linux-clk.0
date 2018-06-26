Return-Path: <david@lechnology.com>
Subject: Re: [PATCH v2 01/13] clk: davinci: psc-da850: remove the
 'davinci_nand.0" lookup
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180626092537.6737-1-brgl@bgdev.pl>
 <20180626092537.6737-2-brgl@bgdev.pl>
From: David Lechner <david@lechnology.com>
Message-ID: <543c4ebf-4212-1933-9672-f8e29ba4d303@lechnology.com>
Date: Tue, 26 Jun 2018 11:15:55 -0500
MIME-Version: 1.0
In-Reply-To: <20180626092537.6737-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 06/26/2018 04:25 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Since commit a8e3923ab571 ("mtd: rawnand: davinci: don't acquire and
> enable clock") we no longer acquire the aemif clock from the davinci
> nand driver - we only do it from the ti-aemif driver. Remove the nand
> entry from the psc lookup table.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Reviewed-by: David Lechner <david@lechnology.com>
