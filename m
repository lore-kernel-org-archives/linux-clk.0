Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:58132 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753553AbdIDNgp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 4 Sep 2017 09:36:45 -0400
Cc: Sudeep Holla <sudeep.holla@arm.com>,
        ALKML <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Roy Franz <roy.franz@cavium.com>,
        Harb Abdulhamid <harba@codeaurora.org>,
        Nishanth Menon <nm@ti.com>, Arnd Bergmann <arnd@arndb.de>,
        Loc Ho <lho@apm.com>, Alexey Klimov <alexey.klimov@arm.com>,
        Ryan Harkin <Ryan.Harkin@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 15/18] clk: add support for clocks provided by SCMI
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1501857104-11279-1-git-send-email-sudeep.holla@arm.com>
 <1501857104-11279-16-git-send-email-sudeep.holla@arm.com>
 <20170901001901.GJ21656@codeaurora.org>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <51391c6f-2c20-119e-f8d4-cc4800c79124@arm.com>
Date: Mon, 4 Sep 2017 14:37:14 +0100
MIME-Version: 1.0
In-Reply-To: <20170901001901.GJ21656@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 01/09/17 01:19, Stephen Boyd wrote:
> On 08/04, Sudeep Holla wrote:
>> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
>> new file mode 100644
>> index 000000000000..37f98a6439a0
>> --- /dev/null
>> +++ b/drivers/clk/clk-scmi.c

[...]

>> +static int scmi_clocks_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np = dev->of_node;
>> +	const struct scmi_handle *handle = devm_scmi_handle_get(dev);
>> +
>> +	if (IS_ERR_OR_NULL(handle) || !handle->clk_ops)
>> +		return -EPROBE_DEFER;
>> +
>> +	return scmi_clk_add(dev, np, handle);
> 
> Why the function? We support more than just platform devices?
> Just fold scmi_clk_add() into this function instead please.
> 

All valid points. Fixed locally now, will post as part of next posting
of the series.

-- 
Regards,
Sudeep
