Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v6 27/41] ARM: da8xx: add new sata_refclk init using
 common clock framework
To: David Lechner <david@lechnology.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland
	<mark.rutland@arm.com>,
        Kevin Hilman <khilman@kernel.org>,
        Bartosz
 Golaszewski <bgolaszewski@baylibre.com>,
        Adam Ford <aford173@gmail.com>, <linux-kernel@vger.kernel.org>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-28-git-send-email-david@lechnology.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <8bb4fff4-df9b-f940-0dbe-888942f55abf@ti.com>
Date: Fri, 2 Feb 2018 20:29:24 +0530
MIME-Version: 1.0
In-Reply-To: <1516468460-4908-28-git-send-email-david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Saturday 20 January 2018 10:44 PM, David Lechner wrote:
> This adds the new SATA REFCLK clock init in mach-davinci/devices-da8xx.c
> using the new common clock framework drivers.
> 
> The #ifdefs are needed to prevent compile errors until the entire
> ARCH_DAVINCI is converted.
> 
> Also, the #includes are sorted since we are adding some here.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
