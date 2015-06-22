Return-Path: <m-karicheri2@ti.com>
Message-ID: <55886CDE.7090906@ti.com>
Date: Mon, 22 Jun 2015 16:15:26 -0400
From: Murali Karicheri <m-karicheri2@ti.com>
MIME-Version: 1.0
To: santosh shilimkar <santosh.shilimkar@oracle.com>,
        Michael Turquette
	<mturquette@linaro.org>, <robh+dt@kernel.org>,
        <pawel.moll@arm.com>, <mark.rutland@arm.com>,
        <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
        <ssantosh@kernel.org>, <sboyd@codeaurora.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux@arm.linux.org.uk>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] clk: keystone: add support for post divider register
 for main pll
References: <1432915453-409-1-git-send-email-m-karicheri2@ti.com> <20150618223728.9112.75331@quantum> <55834C64.6020703@oracle.com>
In-Reply-To: <55834C64.6020703@oracle.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 06/18/2015 06:55 PM, santosh shilimkar wrote:
> On 6/18/2015 3:37 PM, Michael Turquette wrote:
>> Quoting Murali Karicheri (2015-05-29 09:04:12)
>>> Main PLL controller has post divider bits in a separate register in
>>> pll controller. Use the value from this register instead of fixed
>>> divider when available.
>>>
>>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>>
>> Applied to clk-next.
>>
> Thanks Mike !!
>
>
Thanks Mike.

Regards,

-- 
Murali Karicheri
Linux Kernel, Keystone
