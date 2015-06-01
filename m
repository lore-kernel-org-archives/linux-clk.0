Return-Path: <daniel.thompson@linaro.org>
Return-Path: <daniel.thompson@linaro.org>
Message-ID: <556C0DF3.7050603@linaro.org>
Date: Mon, 01 Jun 2015 08:46:59 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
MIME-Version: 1.0
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mike Turquette <mturquette@linaro.org>,
 Stephen Boyd <sboyd@codeaurora.org>
CC: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 Russell King <linux@arm.linux.org.uk>, Kamil Lulko <rev13@wp.pl>,
 Andreas Farber <afaerber@suse.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH v2 2/4] dt-bindings: Document the STM32F4 clock bindings
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org> <1432972448-10332-1-git-send-email-daniel.thompson@linaro.org> <1432972448-10332-3-git-send-email-daniel.thompson@linaro.org> <55698104.2070205@gmail.com>
In-Reply-To: <55698104.2070205@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 30/05/15 10:21, Maxime Coquelin wrote:
> HI Daniel,
>
> On 05/30/2015 09:54 AM, Daniel Thompson wrote:
>> This adds documentation of device tree bindings for the clock related
>> portions of the STM32 RCC block.
>>
>> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
>> ---
>>   .../devicetree/bindings/clock/st,stm32-rcc.txt     | 65
>> ++++++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>> <snip>
>> +Example:
>> +
>> +    /* Gated clock, AHB1 bit 0 (GPIOA) */
>> +    ... {
>> +        clocks = <&rcc 0 0>
>> +    };
>> +
>> +    /* Gated clock, AHB2 bit 4 (GPIOA) */
> s/GPIOA/CRYP/

Oops! Will fix.


>> +    ... {
>> +        clocks = <&rcc 0 36>
>> +    };
>> +
>> +Specifying other clocks
>> +=======================
>> +
>> +The primary index must be set to 1.
>> +
>> +The secondary index is bound with the following magic numbers:
>> +
>> +    0    SYSTICK
>> +    1    FCLK
> How do you plan to handle the SAI & I2S clocks?
> By adding index 3?

Pretty much. Tentatively I'm thinking of:

	2	I2S clocks
	3	SAI1_A clock
	4	SAI1_B clock
	5	LCD-TFT clock

Note: Sort order is based on the vertical ordering in the clock tree 
diagram in the data sheet.

Only reason not to include these in the bindings immediately is that I 
wanted to check how/if these clocks are gated. The clock tree diagram 
shows them having individual clock gates so before proposing them using 
magic numbers I wanted to double check if these values can be identified 
at gates clocks.


Daniel.
