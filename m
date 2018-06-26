Return-Path: <david@lechnology.com>
Subject: Re: [PATCH v2 05/13] clk: davinci: psc-da830: add a lookup entry for
 aemif clock
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180626092537.6737-1-brgl@bgdev.pl>
 <20180626092537.6737-6-brgl@bgdev.pl>
From: David Lechner <david@lechnology.com>
Message-ID: <302fdaed-1f18-992f-805e-aa320ac34305@lechnology.com>
Date: Tue, 26 Jun 2018 11:18:11 -0500
MIME-Version: 1.0
In-Reply-To: <20180626092537.6737-6-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 06/26/2018 04:25 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We want to use the ti-aemif platform driver for da830-evm. To make it
> work we need a lookup entry for the aemif clock.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Reviewed-by: David Lechner <david@lechnology.com>
