Return-Path: <tomeu.vizoso@gmail.com>
MIME-Version: 1.0
Sender: tomeu.vizoso@gmail.com
In-Reply-To: <56A1ED53.60309@huawei.com>
References: <1452219400-32478-1-git-send-email-xuejiancheng@huawei.com>
 <1452219400-32478-2-git-send-email-xuejiancheng@huawei.com>
 <20160112221211.GB22188@codeaurora.org> <5695BE65.3070409@huawei.com>
 <20160113185707.1168.85601@quark.deferred.io> <56979F9F.5080201@huawei.com>
 <5698A650.5010600@huawei.com> <CAL_JsqJPcPgS=cKNqv9j5Ch3ZHbUmci1LRedBWV1gV=5kCz68Q@mail.gmail.com>
 <CAAObsKBbUaGi-ZWg+Y-OCq=xVOgBJroMTVsqP2JpVHPQWcM4=w@mail.gmail.com> <56A1ED53.60309@huawei.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Fri, 22 Jan 2016 10:55:45 +0100
Message-ID: <CAAObsKAdd_M_Kjmc=c=MbVB29hDFpxCaE6cjrsyWGOLXz7++1g@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] clk: hisilicon: add CRG driver for hi3519 soc
To: xuejiancheng <xuejiancheng@huawei.com>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Wei Xu <xuwei5@hisilicon.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>, Zhangfei Gao <zhangfei.gao@linaro.org>,
	Bintian Wang <bintian.wang@huawei.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, yanhaifeng@hisilicon.com,
	yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com,
	gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com,
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 22 January 2016 at 09:50, xuejiancheng <xuejiancheng@huawei.com> wrote:
> On 2016/1/20 14:38, Tomeu Vizoso wrote:
>> On 19 January 2016 at 19:20, Rob Herring <robh+dt@kernel.org> wrote:
>>> On Fri, Jan 15, 2016 at 1:57 AM, xuejiancheng <xuejiancheng@huawei.com>=
 wrote:
>>>>
>>>> On 2016/1/14 21:16, xuejiancheng wrote:
>>>>> Hi Mike,
>>>>>
>>>>> On 2016/1/14 2:57, Michael Turquette wrote:
>>>>>> Quoting xuejiancheng (2016-01-12 19:03:01)
>>>>>>> Hi Stephen,
>>>>>>>    Thank you very much for your reply.
>>>>>>>
>>>>>>> On 2016/1/13 6:12, Stephen Boyd wrote:
>>>>>>>> On 01/08, Jiancheng Xue wrote:
>>>>>>>>> diff --git a/drivers/clk/hisilicon/Kconfig b/drivers/clk/hisilico=
n/Kconfig
>>>>>>>>> index e434854..b6baebf 100644
>>>>>>>>> --- a/drivers/clk/hisilicon/Kconfig
>>>>>>>>> +++ b/drivers/clk/hisilicon/Kconfig
>>>>>>>>> @@ -1,3 +1,10 @@
>>>>>>>>> +config COMMON_CLK_HI3519
>>>>>>>>> +    tristate "Clock Driver for Hi3519"
>>>>>>>>
>>>>>>>> It looks like this has to be bool. Otherwise it needs to be a
>>>>>>>> platform driver and the hisilicon APIs need to be exported and
>>>>>>>> lose their __init markings.
>>>>>>>>
>>>>>>> Yes,it's a problem. I will fix it in next version. Thank you.
>>>>>>
>>>>>> The best solution would be to make this clock driver a real platform
>>>>>> driver.
>>>>>>
>>>>> Now the work clock of the clocksource timer-sp804 is provided by this=
 driver. So
>>>>> it need to be registered early by CLK_OF_DECLARE. If the timer clock =
is treated
>>>>> as a fixed-clock provider, this driver can be implemented as a platfo=
rm driver.
>>>>> Then the crg device must be registered before other clock consumer de=
vices.Accordingly
>>>>> the crg device node must be written above all other clock consumer de=
vices node in dts files.
>>>>> I think it is also a dependence.
>>>>>
>>>>> Can you help me understand why it is better to make this driver a pla=
tform driver?
>>>>> Thank you very much!
>>>>>
>>>> arch_initcall(customize_machine)
>>>> -->of_platform_populate
>>>>    -->of_platform_bus_create
>>>>      -->of_amba_device_create
>>>>         -->amba_device_add
>>>>            -->amba_get_enable_pclk
>>>> The call sequence above shows that the clock of the amba device must b=
e registered before
>>>> amba_device_add. The clock of "arm,pl011" uart is registered in the pr=
obe function of the
>>>> platform driver "hi3519-crg". So the platform device "hi3519-crg" must=
 be created before
>>>> the amba device "arm,pl011" uart.
>>>
>>> It is a problem, but Tomeu had a fix to support deferred probes here.
>>> That was part of the on-demand probing series, but maybe it needs to
>>> be applied separately if we are moving clock drivers to platform
>>> drivers.
>>
>> Hi,
>>
>> Marek Szyprowski has kindly taken those two patches as part of a series =
of him:
>>
>> http://lkml.kernel.org/g/1450868368-5650-1-git-send-email-m.szyprowski@s=
amsung.com
>>
>> I think it would be great if you could test them and report.
>>
> Hi Tomeu,
>
> I have applied the patch "https://lkml.org/lkml/2015/12/23/105" and teste=
d on my hi3519-demb board.
> It works even if the apb_pclk is registered later than the amba-pl011 dev=
ice being registered.
>
> But I think it is a problem if amba_read_periphid() returns -ENOMEM or -E=
NODEV when apb_pclk is available.
> In this condition=EF=BC=8Camba_match() returns a non zero value which mea=
ns the driver and device matches
> and the amba_probe() will be called, but amba_device->periphid remains as=
 0. Then amba_lookup() called in
> amba_probe() will return a null id pointer.The null pointer will be passe=
d to amba_driver->probe() and
> this may cause a segment fault.

But, have you applied the other patches in the series? There's one
that should handle the other error codes.

In any case, any feedback you have on that series should be given in
the other thread.

Regards,

Tomeu

> Regards,
>
> Jiancheng
>
>> Thanks,
>>
>> Tomeu
>>
>> .
>>
>
