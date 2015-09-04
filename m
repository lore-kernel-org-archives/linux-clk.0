Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:35410 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760139AbbIDQ44 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 4 Sep 2015 12:56:56 -0400
MIME-Version: 1.0
In-Reply-To: <1441349872-4560-4-git-send-email-bhupesh.sharma@freescale.com>
References: <1441349872-4560-1-git-send-email-bhupesh.sharma@freescale.com>
	<1441349872-4560-4-git-send-email-bhupesh.sharma@freescale.com>
Date: Fri, 4 Sep 2015 11:56:54 -0500
Message-ID: <CADRPPNR11BD4WfXTWoQ28rZCd_BJuhdWu49E6jjpO29CH2s5Ow@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] Documentation/dts: Add bindings for QIXIS FPGA
 controller found on FSL boards
From: Li Yang <leoli@freescale.com>
To: Bhupesh Sharma <bhupesh.sharma@freescale.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, marc.zyngier@arm.com,
	linux-clk@vger.kernel.org, Catalin.Marinas@arm.com,
	will.deacon@arm.com, olof@lixom.net, bhupesh.linux@gmail.com,
	Jaiprakash Singh <b44839@freescale.com>,
	devicetree@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 4, 2015 at 1:57 AM, Bhupesh Sharma
<bhupesh.sharma@freescale.com> wrote:
> This patch adds bindings for QIXIS FPGA controller found on FSL boards.

A general comment: when you are updating the device tree bindings.
You should cc the devicetree@vger.kernel.org mailing list.

>
> Some Freescale boards like LS2080AQDS/LS2080ARDB have an on-board FPGA/CPLD
> connected to the IFC controller. The bindings specified in this patch
> cater to those on-board FPGA/CPLD controllers.

We already have the binding defined in
Documentation/devicetree/bindings/powerpc/fsl/board.txt.  We probably
should just move it to a more generic location.

Regards,
Leo
