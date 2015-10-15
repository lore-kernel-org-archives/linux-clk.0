Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:62571 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750820AbbJOOUH (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 15 Oct 2015 10:20:07 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Bhupesh Sharma <bhupesh.sharma@freescale.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	marc.zyngier@arm.com, linux-clk@vger.kernel.org, olof@lixom.net,
	bhupesh.linux@gmail.com, will.deacon@arm.com,
	Catalin.Marinas@arm.com, LeoLi@freescale.com,
	scottwood@freescale.com, stuart.yoder@freescale.com
Subject: Re: [PATCH v3 12/12] dts/Makefile: Add build support for LS2080a QDS & RDB board DTS
Date: Thu, 15 Oct 2015 16:19:38 +0200
Message-ID: <6113441.JKoMX6G60g@wuerfel>
In-Reply-To: <1444891672-32117-13-git-send-email-bhupesh.sharma@freescale.com>
References: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com> <1444891672-32117-13-git-send-email-bhupesh.sharma@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thursday 15 October 2015 12:17:52 Bhupesh Sharma wrote:
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 932001a..57b41c7 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -1,4 +1,4 @@
> -dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-qds.dtb fsl-ls2080a-rdb.dtb fsl-ls2080a-simu.dtb
>   
> 

Please use one line per dtb file here, for consistency with the other platforms

	Arnd
