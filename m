Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC013921E7;
	Thu,  5 Feb 2026 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282395; cv=none; b=T84SoqBvVijxH68eBlAueVnU04gX2QxitXvO7FUNFGr4JAYo4URlnRRYL7FNEdHqmj+7R1KtT3b8q2tl2GQK91dcn+/MbapsxkKSW6xdjf55K39HlVkMXeyl06+bQ0S1/czOIERLz24e65KjQrNGDc/WEkD+BOW3OPEYvt5kbwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282395; c=relaxed/simple;
	bh=nARO71KfW1tLUTKJ33HCNGcuIo2Z5n2koXGgKT48yIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7nXBy++WVib2DCaGBB0N4YBx4ukkf9FdmhUBNFNBd2e5pzYI+pabFTs6NUYetLxcX47k5SCG+0A2Ld6uAacG+qx4po8fIJOWujwtUNXaiK90mPpS2gToLHJqBuYW+S9Xl2pcHHhuJNpITgkPJh0JUJV43s3p/+rg1hhcboZuh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vnvJi-0001MV-00; Thu, 05 Feb 2026 10:06:26 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 9F440C0113; Thu,  5 Feb 2026 10:05:07 +0100 (CET)
Date: Thu, 5 Feb 2026 10:05:07 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Brian Masney <bmasney@redhat.com>, linux-mips@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] clk: microchip: fix typo in reference to a config option
Message-ID: <aYRdQxCHhHxMhdPY@alpha.franken.de>
References: <20260203090101.348879-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203090101.348879-1-lukas.bulwahn@redhat.com>

On Tue, Feb 03, 2026 at 10:01:01AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 026d70dcfe5d ("clk: microchip: core: allow driver to be compiled
> with COMPILE_TEST") introduces a typo when referring to a config option in
> an ifdef directive.
> 
> Fix this typo.
> 
> Fixes: 026d70dcfe5d ("clk: microchip: core: allow driver to be compiled with COMPILE_TEST")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  drivers/clk/microchip/clk-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
> index 509cdc060c34..b764ca059e68 100644
> --- a/drivers/clk/microchip/clk-core.c
> +++ b/drivers/clk/microchip/clk-core.c
> @@ -74,7 +74,7 @@
>  /* SoC specific clock needed during SPLL clock rate switch */
>  static struct clk_hw *pic32_sclk_hw;
>  
> -#ifdef CONFIG_MATCH_PIC32
> +#ifdef CONFIG_MACH_PIC32
>  /* add instruction pipeline delay while CPU clock is in-transition. */
>  #define cpu_nop5()			\
>  do {					\
> -- 
> 2.52.0

applied to mips-next
Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
