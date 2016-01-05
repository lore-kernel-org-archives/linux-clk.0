Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga03-in.huawei.com ([119.145.14.66]:19273 "EHLO
	szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752055AbcAEMXw (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 5 Jan 2016 07:23:52 -0500
Subject: Re: [PATCH v4 5/6] mfd: dt-bindings: add device tree bindings for
 Hi3519 sysctrl
To: Philipp Zabel <p.zabel@pengutronix.de>
References: <1451439832-13927-1-git-send-email-xuejiancheng@huawei.com>
 <1451439832-13927-6-git-send-email-xuejiancheng@huawei.com>
 <1451988742.3391.22.camel@pengutronix.de>
CC: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<robh+dt@kernel.org>, <pawel.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
	<linux@arm.linux.org.uk>, <khilman@linaro.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <xuwei5@hisilicon.com>,
	<haojian.zhuang@linaro.org>, <zhangfei.gao@linaro.org>,
	<bintian.wang@huawei.com>, <suwenping@hisilicon.com>,
	<devicetree@vger.kernel.org>, <yanhaifeng@hisilicon.com>,
	<linux-kernel@vger.kernel.org>, <gaofei@hisilicon.com>,
	<ml.yang@hisilicon.com>, <yanghongwei@hisilicon.com>,
	<zhangzhenxing@hisilicon.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
From: xuejiancheng <xuejiancheng@huawei.com>
Message-ID: <568BB4B6.20507@huawei.com>
Date: Tue, 5 Jan 2016 20:19:02 +0800
MIME-Version: 1.0
In-Reply-To: <1451988742.3391.22.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


On 2016/1/5 18:12, Philipp Zabel wrote:
> Am Mittwoch, den 30.12.2015, 09:43 +0800 schrieb Jiancheng Xue:
>> Add device tree bindings for Hi3519 system controller.
>>
>> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
>> ---
>>  Documentation/devicetree/bindings/mfd/hi3519.txt | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/hi3519.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/hi3519.txt b/Documentation/devicetree/bindings/mfd/hi3519.txt
>> new file mode 100644
>> index 0000000..2536edc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/hi3519.txt
>> @@ -0,0 +1,14 @@
>> +* Hisilicon Hi3519 System Controller Block
>> +
>> +This bindings use the following binding:
>> +Dcumentation/devicetree/bindings/clock/clock-bindings.txt
> 
> Typo: "Documentation"
> - but I don't see the clock bindings being used here at all.
> Maybe just drop this sentence?
> 

Sorry about this mistake. Thank you very much.

>> +
>> +Required properties:
>> +- compatible: "hisilicon,hi3519-sysctrl".
>> +- reg: the register region of this block
>> +
>> +Examples:
>> +sysctrl: system-controller@12010000 {
>> +	compatible = "hisilicon,hi3519-sysctrl", "syscon";
>> +	reg = <0x12010000 0x1000>;
>> +};
> 
> regards
> Philipp
> 
> 
> .
> 

