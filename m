Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:33499 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933394AbbIDVGO (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 4 Sep 2015 17:06:14 -0400
Received: by lamp12 with SMTP id p12so20356679lam.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2015 14:06:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BY1PR0301MB1303A3BD91F3E65853CC3F2E82570@BY1PR0301MB1303.namprd03.prod.outlook.com>
References: <1441349872-4560-1-git-send-email-bhupesh.sharma@freescale.com>
	<1441349872-4560-7-git-send-email-bhupesh.sharma@freescale.com>
	<CADRPPNQsemXa2HgYZAcm+GurhimHbYVM5CL5ReDsyuzfAO=kSQ@mail.gmail.com>
	<BY1PR0301MB1303A3BD91F3E65853CC3F2E82570@BY1PR0301MB1303.namprd03.prod.outlook.com>
Date: Fri, 4 Sep 2015 16:06:13 -0500
Message-ID: <CADRPPNRhBObf4Am-MKFHFk6y+_PmtZGuGrfVaDPtra6h394Fog@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] clk: qoriq: Add ls2080a support.
From: Li Yang <leoli@freescale.com>
To: Sharma Bhupesh <bhupesh.sharma@freescale.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"Catalin.Marinas@arm.com" <Catalin.Marinas@arm.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"olof@lixom.net" <olof@lixom.net>,
	Scott Wood <scottwood@freescale.com>,
	Bhupesh SHARMA <bhupesh.linux@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 4, 2015 at 3:09 PM, Sharma Bhupesh
<bhupesh.sharma@freescale.com> wrote:
>> From: pku.leo@gmail.com [mailto:pku.leo@gmail.com]
>> Sent: Saturday, September 05, 2015 1:32 AM
>> On Fri, Sep 4, 2015 at 1:57 AM, Bhupesh Sharma
>> <bhupesh.sharma@freescale.com> wrote:
>> > From: Scott Wood <scottwood@freescale.com>
>> >
>> > LS2080A is the first implementation of the chassis 3 clockgen, which
>> > has a different register layout than previous chips.  It is also
>> > little endian, unlike previous chips.
>> >
>> > Signed-off-by: Scott Wood <scottwood@freescale.com>
>> > ---
>>
>> You should probably mention here that the patch is depending on another
>> pending patch to apply.  And this patch should be going through the same
>> sub-system tree as the dependency patch.  Otherwise, there is no way it
>> can be applied.
>>
>
> Cover-letter already captures this:
> http://www.spinics.net/lists/arm-kernel/msg442910.html
>
> See the section 'Rebasing details'. linux-clk is already copied.

But not all the patches are depending on the clk patches.  You should
probably break up the series to patches that can be applied cleanly
and patches that are depending on the clock patches and should go
through the clk tree.

Regards,
Leo
