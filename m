Return-Path: <ray.jui@broadcom.com>
Return-Path: <ray.jui@broadcom.com>
Subject: Re: drivers/clk/bcm/clk-iproc-pll.c:280]: (style) Redundant condition
To: David Binderman <dcb314@hotmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@codeaurora.org" <sboyd@codeaurora.org>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "jonmason@broadcom.com" <jonmason@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <HE1PR0801MB186548205AD0A49B09F6A3149C330@HE1PR0801MB1865.eurprd08.prod.outlook.com>
From: Ray Jui <ray.jui@broadcom.com>
Message-ID: <a7ed0f26-fbe6-c5d3-62d3-e940a7fec5ac@broadcom.com>
Date: Wed, 5 Apr 2017 11:27:36 -0700
MIME-Version: 1.0
In-Reply-To: <HE1PR0801MB186548205AD0A49B09F6A3149C330@HE1PR0801MB1865.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi David,

Thanks for reporting. I'll send out a patch to address this.

Ray

On 3/27/2017 3:47 AM, David Binderman wrote:
> Hello there,
> 
> 
> linux-4.11-rc4/drivers/clk/bcm/clk-iproc-pll.c:280]: (style) Redundant condition: If 'rate >= 2200000000', the comparison 'rate' is always true.
> 
> Source code is
> 
>     } else if (rate >= VCO_HIGH && rate && rate < VCO_HIGH_HIGH) {
> 
> Suggest new code
> 
>     } else if (rate >= VCO_HIGH  && rate < VCO_HIGH_HIGH) {
> 
> Regards
> 
> David Binderman
> 
