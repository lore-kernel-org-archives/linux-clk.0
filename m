Return-Path: <t-kristo@ti.com>
Message-ID: <556D8403.4070100@ti.com>
Date: Tue, 2 Jun 2015 13:22:59 +0300
From: Tero Kristo <t-kristo@ti.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <mturquette@linaro.org>, <tony@atomide.com>, <paul@pwsan.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCHv3 01/27] ARM: OMAP2+: clock: export driver API to setup/get
 clock features
References: <1432566032-10860-1-git-send-email-t-kristo@ti.com> <1432566032-10860-2-git-send-email-t-kristo@ti.com> <20150528220410.GG24204@codeaurora.org>
In-Reply-To: <20150528220410.GG24204@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 05/29/2015 01:04 AM, Stephen Boyd wrote:
> On 05/25, Tero Kristo wrote:
>> +
>> +/**
>> + * ti_clk_get_features - get clock driver features flags
>> + *
>> + * Get TI clock driver features description. Returns a pointer
>> + * to the current feature setup.
>> + */
>> +struct ti_clk_features *ti_clk_get_features(void)
>
> const?

Ok changed locally in the branch.

-Tero

>
>> +{
>> +	return &ti_clk_features;
>> +}
>>   #endif
>
