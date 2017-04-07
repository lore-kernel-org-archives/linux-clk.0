Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
Subject: Re: [PATCH v4 2/3] clk: vc5: Add bindings for IDT VersaClock
 5P49V5935
To: Alexey Firago <alexey_firago@mentor.com>, mturquette@baylibre.com,
 sboyd@codeaurora.org, robh+dt@kernel.org, geert@linux-m68k.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
 <1491556344-9465-3-git-send-email-alexey_firago@mentor.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a155e2a1-fe6c-6b22-7732-8bf65b7f4a6f@gmail.com>
Date: Fri, 7 Apr 2017 21:56:29 +0200
MIME-Version: 1.0
In-Reply-To: <1491556344-9465-3-git-send-email-alexey_firago@mentor.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 04/07/2017 11:12 AM, Alexey Firago wrote:
> IDT VersaClock 5 5P49V5935 has 4 clock outputs, 4 fractional dividers.
> Input clock source can be taken from either integrated crystal or from
> external reference clock.
> 
> Signed-off-by: Alexey Firago <alexey_firago@mentor.com>

I think you want a R-B from Rob on this.

> ---
>  .../devicetree/bindings/clock/idt,versaclock5.txt        | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> index 87e9c47..53d7e50 100644
> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> @@ -6,18 +6,21 @@ from 3 to 12 output clocks.
>  ==I2C device node==
>  
>  Required properties:
> -- compatible:	shall be one of "idt,5p49v5923" , "idt,5p49v5933".
> +- compatible:	shall be one of "idt,5p49v5923" , "idt,5p49v5933" ,
> +		"idt,5p49v5935".
>  - reg:		i2c device address, shall be 0x68 or 0x6a.
>  - #clock-cells:	from common clock binding; shall be set to 1.
>  - clocks:	from common clock binding; list of parent clock handles,
>  		- 5p49v5923: (required) either or both of XTAL or CLKIN
>  					reference clock.
> -		- 5p49v5933: (optional) property not present (internal
> +		- 5p49v5933 and
> +		- 5p49v5935: (optional) property not present (internal
>  					Xtal used) or CLKIN reference
>  					clock.
>  - clock-names:	from common clock binding; clock input names, can be
>  		- 5p49v5923: (required) either or both of "xin", "clkin".
> -		- 5p49v5933: (optional) property not present or "clkin".
> +		- 5p49v5933 and
> +		- 5p49v5935: (optional) property not present or "clkin".
>  
>  ==Mapping between clock specifier and physical pins==
>  
> @@ -34,6 +37,13 @@ clock specifier, the following mapping applies:
>  	1 -- OUT1
>  	2 -- OUT4
>  
> +5P49V5935:
> +	0 -- OUT0_SEL_I2CB
> +	1 -- OUT1
> +	2 -- OUT2
> +	3 -- OUT3
> +	4 -- OUT4
> +
>  ==Example==
>  
>  /* 25MHz reference crystal */
> 


-- 
Best regards,
Marek Vasut
