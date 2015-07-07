Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <559B9225.6090607@huawei.com>
Date: Tue, 7 Jul 2015 16:47:33 +0800
From: Bintian <bintian.wang@huawei.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
	Russell King <linux@arm.linux.org.uk>
CC: Mike Turquette <mturquette@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] amba: Support clk parents and rates assigned in DT
References: <1432846332-17692-1-git-send-email-sboyd@codeaurora.org> <559B15DE.7040200@codeaurora.org>
In-Reply-To: <559B15DE.7040200@codeaurora.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Russell,

Could you spend several minutes to review Stephen's patch?

Thanks,

Bintian

On 2015/7/7 7:57, Stephen Boyd wrote:
> On 05/28/2015 01:52 PM, Stephen Boyd wrote:
>> Add the call to of_clk_set_defaults() into the amba probe path so
>> that devices on the amba bus can use the assigned rates and
>> parents feature of the common clock framework.
>>
>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>> ---
>
> Shall I put this into the patch tracker? Turns out it wasn't needed for
> the hisi stuff immediately.
>

