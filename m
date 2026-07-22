Received: from galaxy.gendns.com (galaxy.gendns.com [66.235.175.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D62248873;
	Wed, 22 Jul 2026 00:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.235.175.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784678623; cv=none; b=DS2+kQ6FkBTsXRQbTnVQlsIJTTQdUE0a1VjZf/6ka8Hk9D/EmZjcI/OVKOuzqJYFFl3CTusSUeaIBoxbA/44gGRsDQnMDY1YJ85ODsK2X77jWPRcEv9VPIQikZbMfFTa/olVVTTupMsNlZdDpVe+vpKLCs7/OHKsnBMled9y8ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784678623; c=relaxed/simple;
	bh=VDOm1rYaDbJq9M0w6Eu1/68BpeQE6+ZfQ55jv2QasNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxNLancWArFNYeEWhZFbhpI5xZ3BSdAWJRunYHb99GQVZhm58Bi/mkuJ7Xxi5ikg6bg09MrFiB0bY3t2jU2i0Er2XLBQQoFTcFRqRWPvMJndGznrL+n/jYimJXVJbc+9TzaUgcmLjD1AvJyBUdCLco/XWLYAzTVQX0/FSOfbOvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lechnology.com; spf=pass smtp.mailfrom=lechnology.com; dkim=pass (2048-bit key) header.d=lechnology.com header.i=@lechnology.com header.b=sAbsz9xK; arc=none smtp.client-ip=66.235.175.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lechnology.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lechnology.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lechnology.com header.i=@lechnology.com header.b="sAbsz9xK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=33SO61j3LJBNUyzApVPu/oxIH9F9hgFb/vqPHnvUkIk=; b=sAbsz9xKxq9pM/fwtmUeyi8fiu
	LsZmwaVNXPgnFGOkbwWyzH6syJi8qz9f0Mjx9wbeGx8nvEwLLj7ospIt4+DlyZjCURASk+bFrrQur
	Vdyay3sReb+/By8mZ9ujDRiTeTYCEFhk30wRlrzppp6b7qkywnjgbFbAVj6l9HFc3yP3pCWiht8pr
	5VVmCGT/BTaiObe3xCMx2Yqn1qnujynJNQnNgjrUk5kpolef3BbMraS2U8OLZZkEkYnLKbvIu7vZI
	ezLtkbcJQx0vxA6136hK+Q0C7PQ8VrXgL9NKCSoUKsZV+1z3HAn4rmc5Wwr1Sz+aF1K8LWdnedC7F
	wA1OsD0g==;
Received: from ip98-183-112-25.ok.ok.cox.net ([98.183.112.25]:60956 helo=[192.168.1.142])
	by galaxy.gendns.com with essmtpa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.4)
	(envelope-from <david@lechnology.com>)
	id 1wmKQn-00000000Vze-3sfa;
	Tue, 21 Jul 2026 20:03:24 -0400
Message-ID: <27a90703-13ee-4749-89cc-7595a99c8633@lechnology.com>
Date: Tue, 21 Jul 2026 19:03:23 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] clk: davinci: add COMPILE_TEST support
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20260719214214.726826-1-rosenp@gmail.com>
Content-Language: en-US
From: David Lechner <david@lechnology.com>
Autocrypt: addr=david@lechnology.com; keydata=
 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
In-Reply-To: <20260719214214.726826-1-rosenp@gmail.com>
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

On 7/19/26 4:42 PM, Rosen Penev wrote:
> Add driver-scoped Kconfig symbols for the DaVinci clock drivers so they can
> be built through COMPILE_TEST without selecting the ARM DaVinci platform
> symbols.
> 
> Keep the existing ARM platform behavior by defaulting the new symbols from
> the corresponding ARCH_DAVINCI symbols, and use the new symbols for the
> davinci clock Makefile entries.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: use COMMON_CLK prefix.
>  drivers/clk/Kconfig          |  1 +
>  drivers/clk/Makefile         |  2 +-
>  drivers/clk/davinci/Kconfig  | 29 +++++++++++++++++++++++++++++
>  drivers/clk/davinci/Makefile |  8 +++-----
>  4 files changed, 34 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/clk/davinci/Kconfig
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 40e2451ee1d8..16191b297150 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -516,6 +516,7 @@ source "drivers/clk/actions/Kconfig"
>  source "drivers/clk/analogbits/Kconfig"
>  source "drivers/clk/aspeed/Kconfig"
>  source "drivers/clk/bcm/Kconfig"
> +source "drivers/clk/davinci/Kconfig"
>  source "drivers/clk/eswin/Kconfig"
>  source "drivers/clk/hisilicon/Kconfig"
>  source "drivers/clk/imgtec/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 087893f77bec..d90b15bb8e74 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -119,7 +119,7 @@ obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
>  obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
>  obj-y					+= bcm/
>  obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
> -obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
> +obj-$(CONFIG_COMMON_CLK_DAVINCI)	+= davinci/
>  obj-$(CONFIG_COMMON_CLK_ESWIN)		+= eswin/
>  obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
>  obj-y					+= imgtec/
> diff --git a/drivers/clk/davinci/Kconfig b/drivers/clk/davinci/Kconfig
> new file mode 100644
> index 000000000000..5bbe2b98db5d
> --- /dev/null
> +++ b/drivers/clk/davinci/Kconfig
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config COMMON_CLK_DAVINCI
> +	bool "Clock drivers for TI DaVinci SoCs"
> +	depends on ARCH_DAVINCI || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	select REGMAP_MMIO
> +	select RESET_CONTROLLER
> +	default ARCH_DAVINCI
> +	help
> +	  Support for the clock controllers found on TI DaVinci SoCs.
> +
> +if COMMON_CLK_DAVINCI
> +
> +config COMMON_CLK_DAVINCI_DA8XX_CFGCHIP
> +	bool "TI DA8xx CFGCHIP clock driver"
> +	default ARCH_DAVINCI_DA8XX
> +	help
> +	  Support for the CFGCHIP clock gates found on TI DA8xx/OMAP-L13x
> +	  SoCs.
> +
> +config COMMON_CLK_DAVINCI_DA850
> +	bool "TI DA850/OMAP-L138/AM18x clock support"
> +	select COMMON_CLK_DAVINCI_DA8XX_CFGCHIP
> +	default ARCH_DAVINCI_DA850
> +	help
> +	  Support for the PLL and PSC clocks found on TI DA850/OMAP-L138/AM18x
> +	  SoCs.
> +
> +endif
> diff --git a/drivers/clk/davinci/Makefile b/drivers/clk/davinci/Makefile
> index f9d5c9a392e4..4899cdf04bd6 100644
> --- a/drivers/clk/davinci/Makefile
> +++ b/drivers/clk/davinci/Makefile
> @@ -1,11 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -ifeq ($(CONFIG_COMMON_CLK), y)
> -obj-$(CONFIG_ARCH_DAVINCI_DA8XX)	+= da8xx-cfgchip.o
> +obj-$(CONFIG_COMMON_CLK_DAVINCI_DA8XX_CFGCHIP)	+= da8xx-cfgchip.o
>  
>  obj-y += pll.o
> -obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= pll-da850.o
> +obj-$(CONFIG_COMMON_CLK_DAVINCI_DA850)		+= pll-da850.o
>  
>  obj-y += psc.o
> -obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= psc-da850.o
> -endif
> +obj-$(CONFIG_COMMON_CLK_DAVINCI_DA850)		+= psc-da850.o

Since ARCH_DAVINCI_DA850 is the only one left for ARCH_DAVINCI, I
don't think we really need the granularity of more Kconfig symbols.
Just adding COMMON_CLK_DAVINCI (or only COMMON_CLK_DAVINCI_DA850)
should be enough.

