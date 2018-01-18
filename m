Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v5 43/44] ARM: da8xx-dt: switch to device tree clocks
To: David Lechner <david@lechnology.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland
	<mark.rutland@arm.com>,
        Kevin Hilman <khilman@kernel.org>, Adam Ford
	<aford173@gmail.com>,
        <linux-kernel@vger.kernel.org>
References: <1515378307-23718-1-git-send-email-david@lechnology.com>
 <1515378307-23718-4-git-send-email-david@lechnology.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <8b30f1e6-74dc-3fd6-71a6-c9ceaf77a9d1@ti.com>
Date: Thu, 18 Jan 2018 20:57:37 +0530
MIME-Version: 1.0
In-Reply-To: <1515378307-23718-4-git-send-email-david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Monday 08 January 2018 07:55 AM, David Lechner wrote:
> This removes all of the clock init code from da8xx-dt.c. This includes
> all of the OF_DEV_AUXDATA that was just used for looking up clocks.
> 
> Note: You need to have clocks defined in your device tree or your system
> won't boot after this patch.

I am not sure we can do this then, as we cannot break DT compatibility.

Thanks,
Sekhar
