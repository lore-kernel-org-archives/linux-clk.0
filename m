Return-Path: <khilman@deeprootsystems.com>
Return-Path: <khilman@deeprootsystems.com>
From: Kevin Hilman <khilman@kernel.org>
To: Bintian Wang <bintian.wang@huawei.com>
Cc: <mturquette@linaro.org>,  <sboyd@codeaurora.org>,  <zhangfei.gao@linaro.org>,  <xuwei5@hisilicon.com>,  <xuejiancheng@huawei.com>,  <tomeu.vizoso@collabora.com>,  <sledge.yanwei@huawei.com>,  <linux-clk@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,  <arnd@arndb.de>,  <will.deacon@arm.com>,  <robh+dt@kernel.org>,  <mark.rutland@arm.com>,  <catalin.marinas@arm.com>,  <haojian.zhuang@linaro.org>,  <linux-arm-kernel@lists.infradead.org>,  <olof@lixom.net>,  <yanhaifeng@gmail.com>,  <linux@arm.linux.org.uk>,  <guodong.xu@linaro.org>,  <jorge.ramirez-ortiz@linaro.org>,  <tyler.baker@linaro.org>,  <xuyiping@hisilicon.com>,  <wangbinghui@hisilicon.com>,  <zhenwei.wang@hisilicon.com>,  <victor.lixin@hisilicon.com>,  <puck.chen@hisilicon.com>,  <dan.zhao@hisilicon.com>,  <huxinwei@huawei.com>,  <z.liuxinliang@huawei.com>,  <heyunlei@huawei.com>,  <kong.kongxinwei@hisilicon.com>,  <wangbintian@gmail.com>,  <w.f@huawei.com>,  <liguozhu@hisilicon.com>
Subject: Re: [PATCH v8 4/7] clk: hisilicon: Remove __init for marking function prototypes
References: <1432440671-25235-1-git-send-email-bintian.wang@huawei.com>
Date: Thu, 28 May 2015 09:50:33 -0700
In-Reply-To: <1432440671-25235-1-git-send-email-bintian.wang@huawei.com>
	(Bintian Wang's message of "Sun, 24 May 2015 12:11:09 +0800")
Message-ID: <7hr3q0k5nq.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Bintian Wang <bintian.wang@huawei.com> writes:

> __init markings on function prototypes are useless, so remove
> them.
>
> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Bintian Wang <bintian.wang@huawei.com>

Can you repost the whole series please?  

The number of patches has increased and it's not terribly obvious how to
combine your v7 or v8 patches with the v8 patches for proper testing.

Thanks,

Kevin
