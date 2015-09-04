Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:35204 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932856AbbIDVbX (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 4 Sep 2015 17:31:23 -0400
Received: by lagj9 with SMTP id j9so21656556lag.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2015 14:31:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1441350322-4671-2-git-send-email-bhupesh.sharma@freescale.com>
References: <1441350322-4671-1-git-send-email-bhupesh.sharma@freescale.com>
	<1441350322-4671-2-git-send-email-bhupesh.sharma@freescale.com>
Date: Fri, 4 Sep 2015 16:31:22 -0500
Message-ID: <CADRPPNRzW7A-D+0Bg7ELT229zQ5VKrj1PAdv8Qq9qARGP_cwnA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] dts/ls2085a: Update Simulator DTS to add support
 of various peripherals
From: Li Yang <leoli@freescale.com>
To: Bhupesh Sharma <bhupesh.sharma@freescale.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, marc.zyngier@arm.com,
	linux-clk@vger.kernel.org, Catalin.Marinas@arm.com,
	Bhupesh SHARMA <bhupesh.linux@gmail.com>, will.deacon@arm.com,
	olof@lixom.net
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 4, 2015 at 2:05 AM, Bhupesh Sharma
<bhupesh.sharma@freescale.com> wrote:
> This patch updates the LS2085a simulator DTS to add support of various

LS2080...

> peripherals which are supported on the simulator platform and explicitly
> disables those which are yet not supported on the platform.

I don't know if there will be any people outside Freescale would get
this simulator.  If not, we should just remove this file.

>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@freescale.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dts |   54 ++++++++++++++++++--
>  1 file changed, 49 insertions(+), 5 deletions(-)
