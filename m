Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:27190 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752447AbbK3IDO (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 30 Nov 2015 03:03:14 -0500
Subject: Re: [PATCH v3] clk: s3c2410: removed unneeded variable in
 s3c24xx_clkout_set_parent
To: "Mutharaju, Prasanna (P.)" <mkarthi3@visteon.com>,
	Kukjin Kim <kgene@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
References: <20151130075219.GA27737@jci-VirtualBox>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <565C02BB.5090506@samsung.com>
Date: Mon, 30 Nov 2015 17:03:07 +0900
MIME-version: 1.0
In-reply-to: <20151130075219.GA27737@jci-VirtualBox>
Content-type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 30.11.2015 16:52, Mutharaju, Prasanna (P.) wrote:
> From: Prasanna Karthik <mkarthi3@visteon.com>
> 
> Remove unneeded variable used to store return value.
> ---
> v3: Modified subject and changelog comments
> ---
> 
> Signed-off-by: Prasanna Karthik <mkarthi3@visteon.com>

... and now download the patch and try to apply it with "git am". What
is missing? :)

Best regards,
Krzysztof

> ---
>  drivers/clk/samsung/clk-s3c2410-dclk.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-s3c2410-dclk.c b/drivers/clk/samsung/clk-s3c2410-dclk.c
> index e9eb935..ec6fb14 100644
> --- a/drivers/clk/samsung/clk-s3c2410-dclk.c
> +++ b/drivers/clk/samsung/clk-s3c2410-dclk.c
> @@ -77,12 +77,11 @@ static u8 s3c24xx_clkout_get_parent(struct clk_hw *hw)
>  static int s3c24xx_clkout_set_parent(struct clk_hw *hw, u8 index)
>  {
>  	struct s3c24xx_clkout *clkout = to_s3c24xx_clkout(hw);
> -	int ret = 0;
>  
>  	s3c2410_modify_misccr((clkout->mask << clkout->shift),
>  			      (index << clkout->shift));
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static const struct clk_ops s3c24xx_clkout_ops = {
> 

