Return-Path: <scott.wood@nxp.com>
From: Scott Wood <scott.wood@nxp.com>
To: "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "Y.T. Tang"
	<yuantian.tang@nxp.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] clk: qoriq: added ls1012a clock configuration
Date: Thu, 8 Dec 2016 23:19:12 +0000
Message-ID: <DB5PR0401MB1928E67508686321F92863AB91840@DB5PR0401MB1928.eurprd04.prod.outlook.com>
References: <1479955015-37514-1-git-send-email-yuantian.tang@nxp.com>
 <DB5PR0401MB1928925ACE6E6E066961C64A91B60@DB5PR0401MB1928.eurprd04.prod.outlook.com>
 <DB6PR0402MB2837A0811DDF5A5DC9E82EF7F0890@DB6PR0402MB2837.eurprd04.prod.outlook.com>
 <20161208231010.GV5423@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On 12/08/2016 05:10 PM, sboyd@codeaurora.org wrote:=0A=
> On 11/25, Y.T. Tang wrote:=0A=
>> Hi Scott,=0A=
>>=0A=
>>> -----Original Message-----=0A=
>>> From: Scott Wood=0A=
>>> Sent: Thursday, November 24, 2016 4:21 PM=0A=
>>> To: Y.T. Tang <yuantian.tang@nxp.com>; mturquette@baylibre.com=0A=
>>> Cc: sboyd@codeaurora.org; linux-clk@vger.kernel.org; linux-=0A=
>>> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org=0A=
>>> Subject: Re: [PATCH v3] clk: qoriq: added ls1012a clock configuration=
=0A=
>>>=0A=
>>> On 11/23/2016 08:50 PM, yuantian.tang@nxp.com wrote:=0A=
>>>> From: Tang Yuantian <Yuantian.Tang@nxp.com>=0A=
>>>>=0A=
>>>> Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>=0A=
>>>> ---=0A=
>>>> v3:=0A=
>>>>   - rebased to latest kernel and re-sorted the code=0A=
>>> [snip]=0A=
>>>> @@ -1316,6 +1334,7 @@ CLK_OF_DECLARE(qoriq_clockgen_2,=0A=
>>>> "fsl,qoriq-clockgen-2.0", clockgen_init);=0A=
>>>> CLK_OF_DECLARE(qoriq_clockgen_ls1021a, "fsl,ls1021a-clockgen",=0A=
>>>> clockgen_init);  CLK_OF_DECLARE(qoriq_clockgen_ls1043a,=0A=
>>>> "fsl,ls1043a-clockgen", clockgen_init);=0A=
>>>> CLK_OF_DECLARE(qoriq_clockgen_ls1046a, "fsl,ls1046a-clockgen",=0A=
>>>> clockgen_init);=0A=
>>>> +CLK_OF_DECLARE(qoriq_clockgen_ls1012a, "fsl,ls1012a-clockgen",=0A=
>>>> +clockgen_init);=0A=
>>>>  CLK_OF_DECLARE(qoriq_clockgen_ls2080a, "fsl,ls2080a-clockgen",=0A=
>>>> clockgen_init);=0A=
>>>=0A=
>>> You need a better sorting algorithm. :-P=0A=
>>>=0A=
>> I don't think so. This time, each code snip goes right after ls1046a.=0A=
>> The sorting 'algorithm' is best ever. :)=0A=
>>=0A=
> =0A=
> I will sort it and apply it? Ack Scott?=0A=
> =0A=
=0A=
Acked-by: Scott Wood <oss@buserror.net>=0A=
=0A=
-Scott=0A=
=0A=
