Return-Path: <Jian.Hu@amlogic.com>
Subject: Re: [PATCH 1/3] dt-bindings: clk: g12a: New binding for Meson-G12A
 SoC
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<narmstrong@baylibre.com>
CC: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <yixun.lan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
	Bo.yang <bo.yang@amlogic.com>, Xingyu.chen <xingyu.chen@amlogic.com>,
	"Qianggui,song" <qianggui.song@amlogic.com>, Sunny.luo
	<sunny.luo@amlogic.com>, <linux-clk@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <1531134767-29927-1-git-send-email-jian.hu@amlogic.com>
 <1531134767-29927-2-git-send-email-jian.hu@amlogic.com>
 <1531214976.2708.52.camel@baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
Message-ID: <f6f387ff-271b-9b4b-5b6e-072b4e56d840@amlogic.com>
Date: Wed, 11 Jul 2018 21:04:53 +0800
MIME-Version: 1.0
In-Reply-To: <1531214976.2708.52.camel@baylibre.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Return-Path: jian.hu@amlogic.com
List-ID: <linux-clk.vger.kernel.org>



On 2018/7/10 17:29, Jerome Brunet wrote:
> On Mon, 2018-07-09 at 19:12 +0800, Jian Hu wrote:
>> Add new binding for Meson-G12A SoC Everything-Else part
> 
> nitpick: I would prefer if the words 'clock' and 'controller' was somewhere in
> the description.
> 
> Maybe "add new clock controller compatible for the EE domain of the g12a SoC" ?

Patch 1 and 2 have squashed, the commit message focuse which one？
> 
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
>> index e950599..0833006 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
>> @@ -9,6 +9,7 @@ Required Properties:
>>   		"amlogic,gxbb-clkc" for GXBB SoC,
>>   		"amlogic,gxl-clkc" for GXL and GXM SoC,
>>   		"amlogic,axg-clkc" for AXG SoC.
>> +		"amlogic,g12a-clkc" for G12A SoC.
>>   
>>   - #clock-cells: should be 1.
>>   
> 
> .
> 
