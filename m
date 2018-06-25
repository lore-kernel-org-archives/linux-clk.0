Return-Path: <david@lechnology.com>
Subject: Re: [PATCH 9/9] ARM: davinci: kill davinci_aemif_setup()
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180625152920.11549-1-brgl@bgdev.pl>
 <20180625152920.11549-10-brgl@bgdev.pl>
From: David Lechner <david@lechnology.com>
Message-ID: <e6dc21f3-aa09-54e0-3090-b4913075b09e@lechnology.com>
Date: Mon, 25 Jun 2018 11:23:25 -0500
MIME-Version: 1.0
In-Reply-To: <20180625152920.11549-10-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 06/25/2018 10:29 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> All users now register platform devices using the ti-aemif driver.
> Remove the handcrafted aemif API.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

I found the subject line to be a bit misleading since this patch
removes an entire file, not just the one function mentioned.
