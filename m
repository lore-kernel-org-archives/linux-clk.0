Return-Path: <xuejiancheng@hisilicon.com>
Subject: Re: [PATCH v9 2/6] clk: hisilicon: add CRG driver for hi3519 soc
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1456127280-23275-1-git-send-email-xuejiancheng@huawei.com>
 <1456127280-23275-3-git-send-email-xuejiancheng@huawei.com>
 <20160225234215.GK28849@codeaurora.org>
CC: <mturquette@baylibre.com>, <p.zabel@pengutronix.de>, <robh+dt@kernel.org>,
        <pawel.moll@arm.com>, <mark.rutland@arm.com>,
        <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
        <linux@arm.linux.org.uk>, <khilman@linaro.org>, <arnd@arndb.de>,
        <olof@lixom.net>, <xuwei5@hisilicon.com>, <haojian.zhuang@linaro.org>,
        <zhangfei.gao@linaro.org>, <bintian.wang@huawei.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <yanhaifeng@hisilicon.com>, <yanghongwei@hisilicon.com>,
        <suwenping@hisilicon.com>, <raojun@hisilicon.com>,
        <ml.yang@hisilicon.com>, <gaofei@hisilicon.com>,
        <zhangzhenxing@hisilicon.com>, <xuejiancheng@hisilicon.com>,
        <lidongpo@hisilicon.com>
From: xuejiancheng <xuejiancheng@huawei.com>
Message-ID: <56CFB5CF.2050800@huawei.com>
Date: Fri, 26 Feb 2016 10:17:51 +0800
MIME-Version: 1.0
In-Reply-To: <20160225234215.GK28849@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 2016/2/26 7:42, Stephen Boyd wrote:
>> diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
>> new file mode 100644
>> index 0000000..50e00e7
>> --- /dev/null
>> +++ b/drivers/clk/hisilicon/reset.c
>> +
>> +int hisi_reset_init(struct device_node *np)
>> +{
>> +	struct hisi_reset_controller *rstc;
>> +
>> +	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
>> +	if (!rstc)
>> +		return -ENOMEM;
>> +
>> +	rstc->membase = of_iomap(np, 0);
> 
> Any reason why we can't pass the platform device here and map the
> register space with platform device APIs?
> 
This function can be called by other clock drivers except clk-hi3519. Some
clock drivers may not be registered as platform drivers. Moreover this function
may be called early even before platform_bus_init.

Thank you!

Regards,
Jiancheng.
