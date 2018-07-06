Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53804 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751517AbeGFKDH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Jul 2018 06:03:07 -0400
Subject: Re: [PATCH v4 4/6] bus: ti-sysc: Add support for software reset
To: Tony Lindgren <tony@atomide.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <bcousson@baylibre.com>, <paul@pwsan.com>, <t-kristo@ti.com>,
        <mark.rutland@arm.com>
References: <20180705142319.19583-1-faiz_abbas@ti.com>
 <20180705142319.19583-5-faiz_abbas@ti.com>
 <20180705154758.GA112168@atomide.com>
From: Faiz Abbas <faiz_abbas@ti.com>
Message-ID: <cf8652a1-019c-d423-9b44-0d62006734f8@ti.com>
Date: Fri, 6 Jul 2018 15:34:31 +0530
MIME-Version: 1.0
In-Reply-To: <20180705154758.GA112168@atomide.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Thursday 05 July 2018 09:17 PM, Tony Lindgren wrote:
> * Faiz Abbas <faiz_abbas@ti.com> [180705 14:24]:
>> +static int sysc_reset(struct sysc *ddata)
>> +{
>> +	int offset = ddata->offsets[SYSC_SYSCONFIG];
>> +	int val = sysc_read(ddata, offset);
> 
> Can you please just warn and return early for now if no
> syss_mask is specified? Otherwise we'll have mysterious
> errors if somebody leaves out "ti,hwmods" for module types
> we do not yet support reset for.

RESET write to sysconfig can still happen even if there's no syss_mask
right? Not all modules need to poll on reset status.

Thanks,
Faiz
