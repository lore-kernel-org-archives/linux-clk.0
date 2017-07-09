Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
Subject: Re: [PATCH 2/2] dt: Add bindings for IDT VersaClock 5P49V5925
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
References: <1499392623-9011-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1499392677-9100-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <57a23b45-9514-00c0-aa92-00a54d68ad2e@gmail.com>
 <3e9d24f7-e9e1-7b30-ff66-6a942074350d@cogentembedded.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <cc792bd2-68e5-b057-c616-f4b01f60172c@gmail.com>
Date: Sun, 9 Jul 2017 19:42:12 +0200
MIME-Version: 1.0
In-Reply-To: <3e9d24f7-e9e1-7b30-ff66-6a942074350d@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 07/09/2017 07:38 PM, Vladimir Barinov wrote:
> On 09.07.2017 16:31, Marek Vasut wrote:
>> On 07/07/2017 03:57 AM, Vladimir Barinov wrote:
>>> From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
>>>
>>> IDT VersaClock 5 5P49V5925 has 4 clock outputs
>> In 1/2 you said it has 4 FODs and 5 outputs (and it does have 5 outputs,
>> 4 from FODs and 1 I2C_OUTB).
> That was a copy typo. Thank you for pointing to this.
> 
>>
>>> , 4 fractional dividers.
>>> Input clock source can be taken only from external reference clock.
>>>
>>> Signed-off-by: Vladimir Barinov
>>> <vladimir.barinov+renesas@cogentembedded.com>
>> You might want to rebase this on top of and retest against [1], there
>> are 8 patches in total fixing some stuff and adding VC6 support.
>>
>> [1] https://patchwork.kernel.org/patch/9831797/
> 
> I've  tested your patch series with ULCB board and HDMI display.
> I will rebase 5P49V5925 patches on top of them.

Thanks! That makes things easy :)

-- 
Best regards,
Marek Vasut
