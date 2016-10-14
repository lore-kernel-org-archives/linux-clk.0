Return-Path: <matthias.bgg@gmail.com>
Return-Path: <matthias.bgg@gmail.com>
Subject: Re: [PATCH] clk: mediatek: Add hardware dependency
To: Jean Delvare <jdelvare@suse.de>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20161014144413.1f0225b5@endymion>
Cc: Shunli Wang <shunli.wang@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, Erin Lo <erin.lo@mediatek.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d698e9d7-cb57-ae75-e26a-c0dc1c5fce1b@gmail.com>
Date: Fri, 14 Oct 2016 19:43:29 +0200
MIME-Version: 1.0
In-Reply-To: <20161014144413.1f0225b5@endymion>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 10/14/2016 02:44 PM, Jean Delvare wrote:
> Only propose the mediatek clock drivers on this platform, unless
> build-testing.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Shunli Wang <shunli.wang@mediatek.com>
> Cc: James Liao <jamesjj.liao@mediatek.com>
> Cc: Erin Lo <erin.lo@mediatek.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> ---
>  drivers/clk/mediatek/Kconfig |    2 ++
>  1 file changed, 2 insertions(+)
>
> --- linux-4.9-rc0.orig/drivers/clk/mediatek/Kconfig	2016-10-13 11:39:40.416106971 +0200
> +++ linux-4.9-rc0/drivers/clk/mediatek/Kconfig	2016-10-14 14:37:48.319588483 +0200
> @@ -8,6 +8,7 @@ config COMMON_CLK_MEDIATEK
>
>  config COMMON_CLK_MT8135
>  	bool "Clock driver for Mediatek MT8135"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	select COMMON_CLK_MEDIATEK
>  	default ARCH_MEDIATEK
>  	---help---
> @@ -15,6 +16,7 @@ config COMMON_CLK_MT8135
>
>  config COMMON_CLK_MT8173
>  	bool "Clock driver for Mediatek MT8173"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	select COMMON_CLK_MEDIATEK
>  	default ARCH_MEDIATEK
>  	---help---
>
>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
