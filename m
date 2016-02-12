Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Kevin Smith <kevin.smith@elecsyscorp.com>
Cc: "linux-clk\@vger.kernel.org" <linux-clk@vger.kernel.org>,  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>,  Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 1/2] clk: mvebu: Remove corediv clock from Armada XP
References: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
	<1455209620-6125-1-git-send-email-kevin.smith@elecsyscorp.com>
Date: Fri, 12 Feb 2016 17:28:22 +0100
In-Reply-To: <1455209620-6125-1-git-send-email-kevin.smith@elecsyscorp.com>
	(Kevin Smith's message of "Thu, 11 Feb 2016 16:53:52 +0000")
Message-ID: <87vb5tx595.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Kevin,
=20
 On jeu., f=C3=A9vr. 11 2016, Kevin Smith <kevin.smith@elecsyscorp.com> wro=
te:

> There is no corediv clock on Armada XP, so this is unnecessary.
>
> Signed-off-by: Kevin Smith <kevin.smith@elecsyscorp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Thanks,

Gregory
> ---
>  drivers/clk/mvebu/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/clk/mvebu/Kconfig b/drivers/clk/mvebu/Kconfig
> index 2769625..e1bc567 100644
> --- a/drivers/clk/mvebu/Kconfig
> +++ b/drivers/clk/mvebu/Kconfig
> @@ -29,7 +29,6 @@ config ARMADA_XP_CLK
>  	bool
>  	select MVEBU_CLK_COMMON
>  	select MVEBU_CLK_CPU
> -	select MVEBU_CLK_COREDIV
>=20=20
>  config DOVE_CLK
>  	bool
> --=20
> 2.4.6

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
