Return-Path: <santosh.shilimkar@oracle.com>
Message-ID: <55BBF17A.2030102@oracle.com>
Date: Fri, 31 Jul 2015 15:06:50 -0700
From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
MIME-Version: 1.0
To: Olof Johansson <olof@lixom.net>
CC: mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
        ssantosh@kernel.org, mturquette@linaro.org, sboyd@codeaurora.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, arm@kernel.org,
        Murali Karicheri <m-karicheri2@ti.com>, robh+dt@kernel.org,
        pawel.moll@arm.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: dts: keystone: fix dt bindings to use post div
 register for mainpll
References: <1432915453-409-1-git-send-email-m-karicheri2@ti.com> <1432915453-409-2-git-send-email-m-karicheri2@ti.com> <55BB947B.7090608@oracle.com> <20150731203035.GA23144@localhost>
In-Reply-To: <20150731203035.GA23144@localhost>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 7/31/15 1:30 PM, Olof Johansson wrote:
> On Fri, Jul 31, 2015 at 08:30:03AM -0700, santosh shilimkar wrote:
>> Olof,
>>
>> As discussed patch 1/2 is already made it via clock tree. Please
>> pick the subject fix for your upcoming fixes pull request.
>>
>> On 5/29/2015 9:04 AM, Murali Karicheri wrote:
>>> All of the keystone devices have a separate register to hold post
>>> divider value for main pll clock. Currently the fixed-postdiv
>>> value used for k2hk/l/e SoCs works by sheer luck as u-boot happens to
>>> use a value of 2 for this. Now that we have fixed this in the pll
>>> clock driver change the dt bindings for the same.
>>>
>>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>>> ---
>> Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
>>
>>
>
> Thanks, applied.
>
Thanks Olof !!

Regards,
Santosh
