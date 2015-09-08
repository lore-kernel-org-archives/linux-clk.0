Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lb0-f193.google.com ([209.85.217.193]:35490 "EHLO
	mail-lb0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752730AbbIHUYz (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 8 Sep 2015 16:24:55 -0400
Received: by lbcao8 with SMTP id ao8so7319522lbc.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2015 13:24:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1441349872-4560-2-git-send-email-bhupesh.sharma@freescale.com>
References: <1441349872-4560-1-git-send-email-bhupesh.sharma@freescale.com>
	<1441349872-4560-2-git-send-email-bhupesh.sharma@freescale.com>
Date: Tue, 8 Sep 2015 15:24:53 -0500
Message-ID: <CALRxmdA=TF=N=6qELR78yhvt_uwEKyHih_08toD9oqCWYtsi0g@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] arm64: Use generic Layerscape SoC family naming
 & rename LS2085A to LS2080A
From: Stuart Yoder <b08248@gmail.com>
To: Bhupesh Sharma <bhupesh.sharma@freescale.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Marc Zyngier <marc.zyngier@arm.com>, linux-clk@vger.kernel.org,
	Catalin marinas <Catalin.Marinas@arm.com>,
	bhupesh.linux@gmail.com, Will Deacon <will.deacon@arm.com>,
	olof@lixom.net
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 4, 2015 at 1:57 AM, Bhupesh Sharma
<bhupesh.sharma@freescale.com> wrote:
> Freescale will be a churning out a host of ARMv8 based SoCs which
> will be based on a similar overall SoC architecture. So, this patch
> converts the existing infrastructure in the arm64/dts, arm64/Kconfig
> and arm64/configs to use the generic convention ARCH_LAYERSCAPE
> in place of the more specific FSL_LS2085A, to save code duplication
> later-on.
>
> Also Freescale is renaming LS2085A to LS2080A.
>
> This patch addresses the above two points.

Suggest splitting this into 2 patches because these 2 changes are really
orthogonal-- one patch for the ARCH config name change, one for the rename
ls2085a to ls2080a rename.

Not sure why you're describing it as "churning out a host of ARMv8 based SoCs".
Just get to the point--  Layerscape is an SoC family so we're changing from the
SoC specific ARCH kconfig option to a more general SoC family option.

Thanks,
Stuart
