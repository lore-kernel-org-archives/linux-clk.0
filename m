Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56622 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751812AbdIOCtM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Sep 2017 22:49:12 -0400
MIME-version: 1.0
Content-type: text/plain; charset="UTF-8"
Message-id: <59BB3FA7.3070000@samsung.com>
Date: Fri, 15 Sep 2017 11:49:11 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] clk: samsung: Properly propagate flags in __PLL macro
In-reply-to: <1505399897-4840-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170914143824eucas1p1e811c6c4c32a2253aebad9a27d4182d5@eucas1p1.samsung.com>
        <1505399897-4840-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2017년 09월 14일 23:38, Marek Szyprowski wrote:
> All users of __PLL macro already provide flags parameter, so don't
> overwrite it unconditionally with CLK_GET_RATE_NOCACHE.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
> index b8ca0dd3a38b..d5f0d3f818b6 100644
> --- a/drivers/clk/samsung/clk.h
> +++ b/drivers/clk/samsung/clk.h
> @@ -305,7 +305,7 @@ struct samsung_pll_clock {
>  		.dev_name	= _dname,				\
>  		.name		= _name,				\
>  		.parent_name	= _pname,				\
> -		.flags		= CLK_GET_RATE_NOCACHE,			\
> +		.flags		= _flags,				\
>  		.con_offset	= _con,					\
>  		.lock_offset	= _lock,				\
>  		.rate_table	= _rtable,				\
> 

Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
