Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:51255 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751855AbbJOOSn (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 15 Oct 2015 10:18:43 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Bhupesh Sharma <bhupesh.sharma@freescale.com>,
	mark.rutland@arm.com, marc.zyngier@arm.com,
	linux-clk@vger.kernel.org, olof@lixom.net, LeoLi@freescale.com,
	Catalin.Marinas@arm.com, will.deacon@arm.com,
	stuart.yoder@freescale.com, scottwood@freescale.com,
	bhupesh.linux@gmail.com
Subject: Re: [PATCH v3 09/12] dts/ls2080a: Update Simulator DTS to add support of various peripherals
Date: Thu, 15 Oct 2015 16:18:39 +0200
Message-ID: <6141791.soHsjI1RN1@wuerfel>
In-Reply-To: <1444891672-32117-10-git-send-email-bhupesh.sharma@freescale.com>
References: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com> <1444891672-32117-10-git-send-email-bhupesh.sharma@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thursday 15 October 2015 12:17:49 Bhupesh Sharma wrote:
> +
> +&esdhc {
> +       status = "disabled";
> +};
> +
> +&ifc {
> +       status = "okay";
> +};
> +
> +&i2c0 {
> +       status = "disabled";
> +};
> +
> +&i2c1 {
> +       status = "disabled";
> +};
> +
> +&i2c2 {
> +       status = "disabled";
> +};

The more common way to do this is to turn off all optional HW blocks in the
.dtsi file and then overide the ones that are connected on a particular board
by overriding the status to "ok" there.

	Arnd
