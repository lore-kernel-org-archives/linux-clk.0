Return-Path: <xuejiancheng@hisilicon.com>
Subject: Re: [RESEND PATCH v8 1/6] clk: hisilicon: add CRG driver for hi3519
 soc
To: Michael Turquette <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
        <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <pawel.moll@arm.com>,
        <mark.rutland@arm.com>, <ijc+devicetree@hellion.org.uk>,
        <galak@codeaurora.org>, <linux@arm.linux.org.uk>, <khilman@linaro.org>,
        <arnd@arndb.de>, <olof@lixom.net>, <xuwei5@hisilicon.com>,
        <haojian.zhuang@linaro.org>, <zhangfei.gao@linaro.org>,
        <bintian.wang@huawei.com>
References: <1454639472-17373-1-git-send-email-xuejiancheng@huawei.com>
 <1454639472-17373-2-git-send-email-xuejiancheng@huawei.com>
 <20160217004648.2278.64006@quark.deferred.io>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <yanhaifeng@hisilicon.com>, <yanghongwei@hisilicon.com>,
        <suwenping@hisilicon.com>, <raojun@hisilicon.com>,
        <ml.yang@hisilicon.com>, <gaofei@hisilicon.com>,
        <zhangzhenxing@hisilicon.com>, <xuejiancheng@hisilicon.com>,
        <lidongpo@hisilicon.com>
From: xuejiancheng <xuejiancheng@huawei.com>
Message-ID: <56C3E423.5080801@huawei.com>
Date: Wed, 17 Feb 2016 11:08:19 +0800
MIME-Version: 1.0
In-Reply-To: <20160217004648.2278.64006@quark.deferred.io>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,
   Thank you very much for your comments.

On 2016/2/17 8:46, Michael Turquette wrote:
> Hello Jiancheng Xue,
> 
> Quoting Jiancheng Xue (2016-02-04 18:31:07)
>> diff --git a/drivers/clk/hisilicon/Makefile b/drivers/clk/hisilicon/Makefile
>> index 74dba31..3f57b09 100644
>> --- a/drivers/clk/hisilicon/Makefile
>> +++ b/drivers/clk/hisilicon/Makefile
>> @@ -4,8 +4,10 @@
>>  
>>  obj-y  += clk.o clkgate-separated.o clkdivider-hi6220.o
>>  
>> +obj-$(CONFIG_RESET_CONTROLLER) += reset.o
> 
> Do you really want to build reset.o for all hisi SoCs?
> 

This reset controller driver will be just used in some of hisilicon SOCs.
I'll add a specific config item for it like CONFIG_RESET_HISI. The config
item will be selected by default in SOCs needing this driver.

I'll also fix other issues in next version. Thank you!

Regards,
Jiancheng.
