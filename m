Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
Subject: Re: [PATCH v4 3/3] clk: vc5: Add support for IDT VersaClock 5P49V5935
To: Alexey Firago <alexey_firago@mentor.com>, mturquette@baylibre.com,
 sboyd@codeaurora.org, robh+dt@kernel.org, geert@linux-m68k.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
 <1491556344-9465-4-git-send-email-alexey_firago@mentor.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <cb635515-7770-73cb-f9d3-f81b2d647614@gmail.com>
Date: Fri, 7 Apr 2017 21:56:09 +0200
MIME-Version: 1.0
In-Reply-To: <1491556344-9465-4-git-send-email-alexey_firago@mentor.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 04/07/2017 11:12 AM, Alexey Firago wrote:
> Update IDT VersaClock 5 driver to support 5P49V5935. This chip has
> two clock inputs (internal XTAL or external CLKIN), four fractional
> dividers (FODs) and five clock outputs (four universal clock outputs
> and one reference clock output at OUT0_SELB_I2C).
> 
> Current driver supports up to 2 FODs and up to 3 clock outputs. This
> patch sets max number of supported FODs to 4 and max number of supported
> clock outputs to 5.
> 
> Signed-off-by: Alexey Firago <alexey_firago@mentor.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
