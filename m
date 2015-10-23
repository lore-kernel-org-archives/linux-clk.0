Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:56163 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750765AbbJWUjn (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 23 Oct 2015 16:39:43 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Bhupesh Sharma <bhupesh.sharma@freescale.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	marc.zyngier@arm.com, linux-clk@vger.kernel.org, olof@lixom.net,
	bhupesh.linux@gmail.com, will.deacon@arm.com,
	Catalin.Marinas@arm.com, LeoLi@freescale.com,
	scottwood@freescale.com, stuart.yoder@freescale.com
Subject: Re: [PATCH v4 00/12] ARM64: Update support for FSL's LS2085A SoC
Date: Fri, 23 Oct 2015 22:39:15 +0200
Message-ID: <8597566.OLE6hhA6ha@wuerfel>
In-Reply-To: <1445628721-10483-1-git-send-email-bhupesh.sharma@freescale.com>
References: <1445628721-10483-1-git-send-email-bhupesh.sharma@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Saturday 24 October 2015 01:01:49 Bhupesh Sharma wrote:
> This is the v4 of the patchset which updates the support for FSL's LS2085A SoC
> which is now being renamed to LS2080A (and is based on ARMv8 architecture).
> 
> Here is a description of what this patchset tries to achieve:
> (v3 can be viewed here: http://www.spinics.net/lists/arm-kernel/msg452747.html)
> 

Applied all patches except for 5/12, as explained. Thanks,

	Arnd
