Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:50664 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750820AbbJOORB (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 15 Oct 2015 10:17:01 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Bhupesh Sharma <bhupesh.sharma@freescale.com>,
	mark.rutland@arm.com, marc.zyngier@arm.com,
	linux-clk@vger.kernel.org, olof@lixom.net, LeoLi@freescale.com,
	Catalin.Marinas@arm.com, will.deacon@arm.com,
	stuart.yoder@freescale.com,
	Minghuan Lian <Minghuan.Lian@freescale.com>,
	scottwood@freescale.com, bhupesh.linux@gmail.com
Subject: Re: [PATCH v3 05/12] doc/bindings: Update Layerscape PCIe devicetree binding to be more flexible
Date: Thu, 15 Oct 2015 16:16:57 +0200
Message-ID: <5383901.aC2HYopUNW@wuerfel>
In-Reply-To: <1444891672-32117-6-git-send-email-bhupesh.sharma@freescale.com>
References: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com> <1444891672-32117-6-git-send-email-bhupesh.sharma@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thursday 15 October 2015 12:17:45 Bhupesh Sharma wrote:
> 
> +Note that since this controller derives its clocks from the Reset
> +Configuration Word (RCW) which is used to describe the PLL settings at
> +the time of chip-reset, the 'clocks' and 'clock-names' properties from
> +'designware-pcie.txt' are optional for this controller.

If this is an option for the dw-pcie block, should this description be
added to the generic binding instead?

> +Also as per the available Reference Manuals, there is no specific 'version'
> +register available in the Freescale PCIe controller register set,
> +which can allow determining the underlying Designware PCIe controller version
> +information.
> +
>  Required properties:
> -- compatible: should contain the platform identifier such as "fsl,ls1021a-pcie"
> +- compatible: should contain the platform identifier such as "fsl,<soc-name>-pcie",
> +  "snps,dw-pcie".

You should document all the strings that will be needed here, otherwise a
driver write does not know what to look for.

If two chips have a 100% identical PCIe implementation, just use the string
of the older chip for both.

	Arnd
