Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH 3/6] clk: Add driver for Maxim-8997 PMIC clocks
To: Pankaj Dubey <pankaj.dubey@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1478513376-14307-1-git-send-email-pankaj.dubey@samsung.com>
 <1478513376-14307-4-git-send-email-pankaj.dubey@samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com,
 myungjoo.ham@samsung.com, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Message-ID: <63750c2f-35cb-91ab-276b-c788f51081cb@osg.samsung.com>
Date: Mon, 7 Nov 2016 12:01:29 -0300
MIME-Version: 1.0
In-Reply-To: <1478513376-14307-4-git-send-email-pankaj.dubey@samsung.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hello Pankaj,

On 11/07/2016 07:09 AM, Pankaj Dubey wrote:
> The MAX8997 PMIC has 32.786kHz crystal oscillator which provides an
> accurate low frequency clock for MAX8997 internal circuit as well as
> external circuit. This patch adds support for these two clocks.
> 
> CC: Michael Turquette <mturquette@baylibre.com>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: devicetree@vger.kernel.org
> CC: linux-clk@vger.kernel.org
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---

What kernel version are you basing this on? The Maxim common clock code
is going away for v4.9 and instead the clk-max77686 driver supports both
77686 and 77802 clocks. See commit 8ad313fe4e00 ("clk: max77686: Combine
Maxim max77686 and max77802 driver").

Since the 8997 clock IP looks very similar to 77802 AFAICT, you should
also extend the clk-max77686 driver to have 8997 support.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
