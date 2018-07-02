Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v3 00/13] ARM: davinci: remove duplicate aemif support
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        David Lechner <david@lechnology.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180628095748.4462-1-brgl@bgdev.pl>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <52a274f1-283a-a14a-54f3-4b95b6605c4f@ti.com>
Date: Mon, 2 Jul 2018 17:58:21 +0530
MIME-Version: 1.0
In-Reply-To: <20180628095748.4462-1-brgl@bgdev.pl>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

Hi David, Stephen,

On Thursday 28 June 2018 03:27 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This series moves all aemif/nand users to using the ti-aemif platform
> driver located in drivers/memory instead of the older API located in
> mach-davinci.
> 
> First five patches add necessary changes to the clock driver. Next
> seven convert the board files to using the ti-aemif driver. Last patch
> removes now dead code.

How do you want to handle this series? I can apply the series and
provide you an immutable branch on v4.18-rc1 with the clock patches
applied if that can work.

Thanks,
Sekhar
