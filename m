Return-Path: <bintian.wang@huawei.com>
Message-ID: <5567C9D7.5000004@huawei.com>
Date: Fri, 29 May 2015 10:07:19 +0800
From: Bintian <bintian.wang@huawei.com>
MIME-Version: 1.0
To: Kevin Hilman <khilman@kernel.org>
CC: <mturquette@linaro.org>, <sboyd@codeaurora.org>, <zhangfei.gao@linaro.org>,
        <xuwei5@hisilicon.com>, <xuejiancheng@huawei.com>,
        <tomeu.vizoso@collabora.com>, <sledge.yanwei@huawei.com>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <arnd@arndb.de>, <will.deacon@arm.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <catalin.marinas@arm.com>,
        <haojian.zhuang@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <olof@lixom.net>, <yanhaifeng@gmail.com>, <linux@arm.linux.org.uk>,
        <guodong.xu@linaro.org>, <jorge.ramirez-ortiz@linaro.org>,
        <tyler.baker@linaro.org>, <xuyiping@hisilicon.com>,
        <wangbinghui@hisilicon.com>, <zhenwei.wang@hisilicon.com>,
        <victor.lixin@hisilicon.com>, <puck.chen@hisilicon.com>,
        <dan.zhao@hisilicon.com>, <huxinwei@huawei.com>,
        <z.liuxinliang@huawei.com>, <heyunlei@huawei.com>,
        <kong.kongxinwei@hisilicon.com>, <wangbintian@gmail.com>,
        <w.f@huawei.com>, <liguozhu@hisilicon.com>
Subject: Re: [PATCH v8 4/7] clk: hisilicon: Remove __init for marking function
 prototypes
References: <1432440671-25235-1-git-send-email-bintian.wang@huawei.com> <7hr3q0k5nq.fsf@deeprootsystems.com>
In-Reply-To: <7hr3q0k5nq.fsf@deeprootsystems.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello Kevin,

On 2015/5/29 0:50, Kevin Hilman wrote:
> Bintian Wang <bintian.wang@huawei.com> writes:
>
>> __init markings on function prototypes are useless, so remove
>> them.
>>
>> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
>> Signed-off-by: Bintian Wang <bintian.wang@huawei.com>
>
> Can you repost the whole series please?
>
> The number of patches has increased and it's not terribly obvious how to
> combine your v7 or v8 patches with the v8 patches for proper testing.
I have sent the whole series, please help check.

Thanks,

Bintian
>
> Thanks,
>
> Kevin
>
> .
>
