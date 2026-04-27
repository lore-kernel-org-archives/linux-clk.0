Received: from galaxy.gendns.com (galaxy.gendns.com [66.235.175.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CFE3CEB9D;
	Mon, 27 Apr 2026 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.235.175.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301111; cv=none; b=oNogsO2PPSDJoJMCjDBV/fTxrzGp7TuTAnLbzEbK3WTKbBWCmvzrLt80Mx51HEcqe48rUheeexWUx3elRFbu5KrHaom3O7GTjiy+3hcxkTl7JXyYevCFg0kauAb43/sGxlCEnsujGQbRSq5f2+GTEUV3aOVF8cjj7oT/JlxGtes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301111; c=relaxed/simple;
	bh=M1lkakGtuezEnltF1lKyaylL89loHBUmB8AdpleR0hY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQ2Dq5jZL13PMXP2YjzQY5JRYurC8hKF6Zc26pKNY1Ovf89HBoQHBGdLI5ZQdPRl5+a7fZbZm0NDwNQWybPksjMJQBJzRl4CMvjv+ZufQePD2l7WM8z65WoGYIXBdpIklJDR6EyjFZKYRsfol3szYmyxvZDrbs7frMXBdnZqgLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lechnology.com; spf=pass smtp.mailfrom=lechnology.com; dkim=pass (2048-bit key) header.d=lechnology.com header.i=@lechnology.com header.b=Df7URaQi; arc=none smtp.client-ip=66.235.175.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lechnology.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lechnology.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lechnology.com header.i=@lechnology.com header.b="Df7URaQi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wYJujYU3XdRRwVSUe/afEV3wKw/4cFjt4OQFzsp8TZQ=; b=Df7URaQi6bDGWol6huJHu7TYFV
	wxAXiSnLIax5uDfW4nNhTyylgddHqD3/S6HirHpQhNWFXSYlgDsWeE36o1lNXNcXMUc0GtWzYc4oA
	qvvzFt0oCyI9TuUvHodbLk232pbf9ATKBAw9un4f9BB89blICoRH//T6jwQUK1Y6kXF8CGMl8E5NX
	gGs+GFcyTmmu1eTBg6hc40sbOfY0F+Dm8I8R8o7I9Npt7U44T0VsT5w71jvASHe7XHUrdi07TYCFJ
	hjDUi8QRqXU80VTAjcBG8fAjS0yQysKdmKxTi0gedReEbRZ9tpRq/czmNO3q/YxL7xoAIK74yt1Vu
	xjhyWkmA==;
Received: from ip98-183-112-25.ok.ok.cox.net ([98.183.112.25]:41110 helo=[192.168.1.142])
	by galaxy.gendns.com with essmtpa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <david@lechnology.com>)
	id 1wHMvt-0000000HGJa-2sSI;
	Mon, 27 Apr 2026 10:27:31 -0400
Message-ID: <6a6b9cdf-60c2-438f-a55e-bc3972b57882@lechnology.com>
Date: Mon, 27 Apr 2026 09:27:31 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: davinci: add Kconfig symbol
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20260427052354.959139-1-rosenp@gmail.com>
Content-Language: en-US
From: David Lechner <david@lechnology.com>
Autocrypt: addr=david@lechnology.com; keydata=
 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
In-Reply-To: <20260427052354.959139-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - galaxy.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: galaxy.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: galaxy.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On 4/27/26 12:23 AM, Rosen Penev wrote:
> Add COMPILE_TEST support as a result so that the buildbots can run
> through this driver. There's nothing architecture specific about it.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/Kconfig          | 7 +++++++
>  drivers/clk/Makefile         | 2 +-
>  drivers/clk/davinci/Makefile | 6 +++---
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 06a7ac971edf..42d84c0ed5fc 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -317,6 +317,13 @@ config COMMON_CLK_AXI_CLKGEN
>  	  Support for the Analog Devices axi-clkgen pcore clock generator for Xilinx
>  	  FPGAs. It is commonly used in Analog Devices' reference designs.
>  
> +config CLK_DA850
> +	bool "DaVinci DA850 CLK support"

Should this be `default y` so that it gets enabled? Or have
config ARCH_DAVINCI_DA850 select CLK_DA850?

Otherwise, we would need to modify the defconfigs as well to
enable it.

> +	depends on ARCH_DAVINCI_DA850 || COMPILE_TEST

We should also make this `depend on COMMON_CLK`. (see related comment
below.)

> +	help
> +	  This adds the clock driver support for DaVinci DA850 platform
> +	  using common clock framework.
> +
>  config CLK_QORIQ
>  	bool "Clock driver for Freescale QorIQ platforms"
>  	depends on OF
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 0fc8f20b0fb1..6e13c001a544 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -118,7 +118,7 @@ obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
>  obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
>  obj-y					+= bcm/
>  obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
> -obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
> +obj-$(CONFIG_CLK_DAVINCI)		+= davinci/

Did you mean CONFIG_CLK_DA850? I don't think CONFIG_CLK_DAVINCI exists.

>  obj-$(CONFIG_COMMON_CLK_ESWIN)		+= eswin/
>  obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
>  obj-y					+= imgtec/
> diff --git a/drivers/clk/davinci/Makefile b/drivers/clk/davinci/Makefile
> index f9d5c9a392e4..5ff30ceb2092 100644
> --- a/drivers/clk/davinci/Makefile
> +++ b/drivers/clk/davinci/Makefile
> @@ -1,11 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  ifeq ($(CONFIG_COMMON_CLK), y)

Then we can drop this if statement.

> -obj-$(CONFIG_ARCH_DAVINCI_DA8XX)	+= da8xx-cfgchip.o
> +obj-$(CONFIG_CLK_DA850)		+= da8xx-cfgchip.o
>  
>  obj-y += pll.o

Since there is only one platform left supported, it would probably
make more sense to make everything (including pll.o and psc.o)
`obj-$(CONFIG_CLK_DA850)` or perhaps even better, make everything
(including da8xx-cfgchip.o, pll-da850.o and psc-da850.o) `obj-y`
since the containing directory already has the conditional (and
include a comment to this effect).

> -obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= pll-da850.o
> +obj-$(CONFIG_CLK_DA850)		+= pll-da850.o
>  
>  obj-y += psc.o
> -obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= psc-da850.o
> +obj-$(CONFIG_CLK_DA850)		+= psc-da850.o
>  endif

