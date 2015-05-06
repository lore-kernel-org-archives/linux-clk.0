Return-Path: <k.kozlowski@samsung.com>
Message-id: <5549CC5C.8090107@samsung.com>
Date: Wed, 06 May 2015 17:10:04 +0900
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
MIME-version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: bindings: Fix assigned-clock-rates property name
References: <1430893716-1825-1-git-send-email-k.kozlowski@samsung.com>
 <20150506074518.GA11126@codeaurora.org>
In-reply-to: <20150506074518.GA11126@codeaurora.org>
Content-type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 06.05.2015 16:45, Stephen Boyd wrote:
> On 05/06, Krzysztof Kozlowski wrote:
>> In documentation the "assigned-clock-parents" name was used when
>> describing the "assigned-clock-rates" property.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> ---
>
> Looks right. The whole sentence could use some work though.
>
>>   Documentation/devicetree/bindings/clock/clock-bindings.txt | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> index 06fc6d541c89..bf5b0414dc17 100644
>> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> @@ -138,7 +138,7 @@ Some platforms may require initial configuration of default parent clocks
>>   and clock frequencies. Such a configuration can be specified in a device tree
>>   node through assigned-clocks, assigned-clock-parents and assigned-clock-rates
>>   properties. The assigned-clock-parents property should contain a list of parent
>> -clocks in form of phandle and clock specifier pairs, the assigned-clock-parents
>> +clocks in form of phandle and clock specifier pairs, the assigned-clock-rates
>>   property the list of assigned clock frequency values - corresponding to clocks
>
> This half-sentence:
>
> 	The assigned-clock-ratse property the list of assigned
> 	clock frequency values
>
> doesn't read correctly. Maybe the whole thing should be rewritten
> as:
>
> 	The assigned-clock-parents property should contain a list
> 	of parent clocks in the form of a phandle and clock
> 	specifier pair and the assigned-clock-rates property
> 	should contain a list of frequencies in Hz. Both these
> 	properties should correspond to the clocks listed in the
> 	assigned-clocks property.

Looks much better. So actually this should be yours patch now, you can 
add my Reported-by :).

Best regards,
Krzysztof
