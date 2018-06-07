Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:32382 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750897AbeFGKWp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Jun 2018 06:22:45 -0400
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
From: Faiz Abbas <faiz_abbas@ti.com>
Message-ID: <a169ba7f-53f2-cf9a-a9ee-daffd6b53279@ti.com>
Date: Thu, 7 Jun 2018 15:54:01 +0530
MIME-Version: 1.0
In-Reply-To: <20180607073530.GH5738@atomide.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Thursday 07 June 2018 01:05 PM, Tony Lindgren wrote:
> * Faiz Abbas <faiz_abbas@ti.com> [180606 06:14]:
>> +static int sysc_reset(struct sysc *ddata)
>> +{
>> +	int offset = ddata->offsets[SYSC_SYSCONFIG];
>> +	int val = sysc_read(ddata, offset);
>> +
>> +	val |= (0x1 << ddata->cap->regbits->srst_shift);
>> +	sysc_write(ddata, offset, val);
>> +
>> +	/* Poll on reset status */
>> +	if (ddata->cfg.quirks & SYSC_QUIRK_RESET_STATUS) {
>> +		offset = ddata->offsets[SYSC_SYSSTATUS];
>> +
>> +		return readl_poll_timeout(ddata->module_va + offset, val,
>> +				(val & ddata->cfg.syss_mask) == 0x0,
>> +				100, MAX_MODULE_SOFTRESET_WAIT);
>> +	}
>> +
>> +	return 0;
>> +}
> 
> I wonder if we should also add SYSS_QUIRK_RESET_STATUS in
> addition to SYSC_QUIRK_RESET status to make it easy to
> read the right register?

I assumed SYSC_QUIRK is the prefix to indicate the ti-sysc driver not
the register. Are there layouts in which the reset status bit is in the
sysconfig register rather than the sysstatus register?

Thanks,
Faiz
