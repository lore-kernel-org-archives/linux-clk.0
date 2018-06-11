Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:38236 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753974AbeFKGqK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jun 2018 02:46:10 -0400
Subject: Re: [PATCH v3 4/6] bus: ti-sysc: Add support for software reset
To: Tony Lindgren <tony@atomide.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <mark.rutland@arm.com>,
        <paul@pwsan.com>, <t-kristo@ti.com>, <robh+dt@kernel.org>,
        <bcousson@baylibre.com>
References: <20180606060826.14671-1-faiz_abbas@ti.com>
 <20180606060826.14671-5-faiz_abbas@ti.com>
 <20180607073530.GH5738@atomide.com>
 <a169ba7f-53f2-cf9a-a9ee-daffd6b53279@ti.com>
 <20180608062158.GI5738@atomide.com>
 <acdfef83-8778-e8f4-e423-ed04a9a8a649@ti.com>
 <20180611060957.GN5738@atomide.com>
 <f460481f-85a9-2a41-a894-6f25122dee8a@ti.com>
 <20180611062904.GO5738@atomide.com>
From: Faiz Abbas <faiz_abbas@ti.com>
Message-ID: <89d55b0b-fe9e-793b-2694-25755ac2bc15@ti.com>
Date: Mon, 11 Jun 2018 12:17:10 +0530
MIME-Version: 1.0
In-Reply-To: <20180611062904.GO5738@atomide.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Monday 11 June 2018 11:59 AM, Tony Lindgren wrote:
> * Faiz Abbas <faiz_abbas@ti.com> [180611 06:28]:
>> Great. I thought I completely misunderstood you. But I don't see what
>> adding another function will accomplish. A QUIRK flag used in the same
>> function would work well enough>
> Fine with me as long as the function stays simple for both
> syss and sysc reset.
>


In general a reset status bit being in sysstatus is the norm and it
being in sysconfig should be the "quirk" for which a flag needs to be
added. What do you think?

As an aside, naming bitshifts by the name of the platform they were
originally added in seems weird. There should be some generic mask
saying "soft reset is the 0th bit". Currently I am using
SYSC_OMAP4_SOFTRESET for a dra76x module. I guess it depends on how many
different sysconfig types we have.

Thanks,
Faiz


