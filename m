Return-Path: <kevin.wangtao@hisilicon.com>
Subject: =?UTF-8?Q?Re:_[PATCH_-next]_clk:_hisilicon:_hi3660=ef=bc=9aFix_pote?=
 =?UTF-8?Q?ntial_NULL_dereference_in_hi3660=5fstub=5fclk=5fprobe=28=29?=
To: Masahiro Yamada <yamada.masahiro@socionext.com>
CC: Leo Yan <leo.yan@linaro.org>, Wei Yongjun <weiyongjun1@huawei.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Kaihua Zhong <zhongkaihua@huawei.com>, Ruyi Wang
	<wangruyi@huawei.com>, Kai Zhao <zhaokai1@hisilicon.com>, linux-clk
	<linux-clk@vger.kernel.org>
References: <1515047794-170174-1-git-send-email-weiyongjun1@huawei.com>
 <CAK7LNAQXTg=A6udMPs4dptbaLz1U5+D4JBJaW0W8d_EgH_R1_A@mail.gmail.com>
 <20180105084004.GC26855@leoy-linaro>
 <7454cc50-7b92-2531-4261-45bd1703f1fb@hisilicon.com>
 <CAK7LNAQcieqS0vrGKrtr3paQADpG0GEM_k9zPdLiKF8ykv5PaA@mail.gmail.com>
From: "Wangtao (Kevin, Kirin)" <kevin.wangtao@hisilicon.com>
Message-ID: <38bd2302-a8cd-5567-8660-054e38c4463b@hisilicon.com>
Date: Fri, 5 Jan 2018 18:47:27 +0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQcieqS0vrGKrtr3paQADpG0GEM_k9zPdLiKF8ykv5PaA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>



在 2018/1/5 17:50, Masahiro Yamada 写道:
> 2018-01-05 18:47 GMT+09:00 Wangtao (Kevin, Kirin) <kevin.wangtao@hisilicon.com>:
>>
>>
>> 在 2018/1/5 16:40, Leo Yan 写道:
>>>
>>> On Fri, Jan 05, 2018 at 12:59:38PM +0900, Masahiro Yamada wrote:
>>>>
>>>> 2018-01-04 15:36 GMT+09:00 Wei Yongjun <weiyongjun1@huawei.com>:
>>>>>
>>>>> platform_get_resource() may return NULL, add proper check to
>>>>> avoid potential NULL dereferencing.
>>>>>
>>>>> This is detected by Coccinelle semantic patch.
>>>>>
>>>>> @@
>>>>> expression pdev, res, n, t, e, e1, e2;
>>>>> @@
>>>>>
>>>>> res = platform_get_resource(pdev, t, n);
>>>>> + if (!res)
>>>>> +   return -EINVAL;
>>>>> ... when != res == NULL
>>>>> e = devm_ioremap(e1, res->start, e2);
>>>>>
>>>>> Fixes: 4f16f7ff3bc0 ("clk: hisilicon: Add support for Hi3660 stub
>>>>> clocks")
>>>>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>>>>> ---
>>>>>    drivers/clk/hisilicon/clk-hi3660-stub.c | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c
>>>>> b/drivers/clk/hisilicon/clk-hi3660-stub.c
>>>>> index 9b6c72b..e8b2c43 100644
>>>>> --- a/drivers/clk/hisilicon/clk-hi3660-stub.c
>>>>> +++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
>>>>> @@ -149,6 +149,8 @@ static int hi3660_stub_clk_probe(struct
>>>>> platform_device *pdev)
>>>>>                   return PTR_ERR(stub_clk_chan.mbox);
>>>>>
>>>>>           res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>>> +       if (!res)
>>>>> +               return -EINVAL;
>>>>>           freq_reg = devm_ioremap(dev, res->start, resource_size(res));
>>>>>           if (!freq_reg)
>>>>>                   return -ENOMEM;
>>>>
>>>>
>>>>
>>>> Probably, it is better to use devm_ioremap_resource().
>>>> This checks NULL input.
>>>
>>>
>>> Thanks for suggestion, Masahiro. This is good suggestion.
>>>
>>> Yongjun, could you spin new patch by using devm_ioremap_resource()
>>> to replace devm_ioremap()?
>>
>> clk-stub's memory region has intersection with mailbox, so we can not use
>> devm_ioremap_resource here, it will cause problem when mailbox driver be
>> accepted by mainline.
> 
> Hmm, that sounds odd.
> 
> syscon in this case?
actually it belongs to mailbox, but we use part of it as shared memory
> 
> 
> 
> 
