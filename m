Return-Path: <t-kristo@ti.com>
Subject: Re: [PATCH 3/3] ARM: dts: am43xx: add support for clkout1 clock
To: Tony Lindgren <tony@atomide.com>
References: <1458158097-21137-1-git-send-email-t-kristo@ti.com>
 <1458158097-21137-4-git-send-email-t-kristo@ti.com>
 <20160412210538.GB5995@atomide.com>
CC: <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
        <linux-arm-kernel@lists.infradead.org>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <570E4103.2060301@ti.com>
Date: Wed, 13 Apr 2016 15:52:19 +0300
MIME-Version: 1.0
In-Reply-To: <20160412210538.GB5995@atomide.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 04/13/2016 12:05 AM, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [160316 12:55]:
>> clkout1 clock node and its generation tree was missing. Add this based
>> on the data on TRM and PRCM functional spec.
>
> Can I pick this one separately?

Yes it has no dependencies towards the other patches.

-Tero

>
> Tony
>
