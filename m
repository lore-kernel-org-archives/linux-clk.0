Return-Path: <scott.wood@nxp.com>
From: Scott Wood <scott.wood@nxp.com>
To: "Y.T. Tang" <yuantian.tang@nxp.com>, Scott Wood <oss@buserror.net>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>
CC: "sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: qoriq: added ls1012a clock configuration
Date: Wed, 23 Nov 2016 07:21:18 +0000
Message-ID: <DB5PR0401MB1928F7FFBDB7D6E4C4B45D9491B70@DB5PR0401MB1928.eurprd04.prod.outlook.com>
References: <1479275900-42365-1-git-send-email-yuantian.tang@nxp.com>
 <1479279262.21746.40.camel@buserror.net>
 <DB6PR0402MB28371BAAD862417B8AC8AED4F0B40@DB6PR0402MB2837.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On 11/22/2016 02:20 AM, Y.T. Tang wrote:=0A=
> Hi Scott,=0A=
> =0A=
>> -----Original Message-----=0A=
>> From: Scott Wood [mailto:oss@buserror.net]=0A=
>> Sent: Wednesday, November 16, 2016 2:54 PM=0A=
>> To: Y.T. Tang <yuantian.tang@nxp.com>; mturquette@baylibre.com=0A=
>> Cc: sboyd@codeaurora.org; linux-kernel@vger.kernel.org; Scott Wood=0A=
>> <scott.wood@nxp.com>; linux-clk@vger.kernel.org; linux-arm-=0A=
>> kernel@lists.infradead.org=0A=
>> Subject: Re: [PATCH] clk: qoriq: added ls1012a clock configuration=0A=
>>=0A=
>> On Wed, 2016-11-16 at 13:58 +0800, yuantian.tang@nxp.com wrote:=0A=
>>> From: Tang Yuantian <Yuantian.Tang@nxp.com>=0A=
>>>=0A=
>>> Added ls1012a clock configuation information.=0A=
>>=0A=
>> Do we really need the same line in the changelog twice?=0A=
>>=0A=
>>>=0A=
>>> Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>=0A=
>>> ---=0A=
>>>  drivers/clk/clk-qoriq.c | 19 +++++++++++++++++++=0A=
>>>  1 file changed, 19 insertions(+)=0A=
>>>=0A=
>>> diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c index=0A=
>>> 1bece0f..563d874 100644=0A=
>>> --- a/drivers/clk/clk-qoriq.c=0A=
>>> +++ b/drivers/clk/clk-qoriq.c=0A=
>>> @@ -202,6 +202,14 @@ static const struct clockgen_muxinfo ls1021a_cmux=
=0A=
>> =3D {=0A=
>>>  	}=0A=
>>>  };=0A=
>>>=0A=
>>> +static const struct clockgen_muxinfo ls1012a_cmux =3D {=0A=
>>> +	{=0A=
>>> +		[0] =3D { CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },=0A=
>>> +		{},=0A=
>>> +		[2] =3D { CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },=0A=
>>> +	}=0A=
>>> +};=0A=
>>> +=0A=
>>=0A=
>> Based on the "ls1021a_cmux" in the context it looks like this patch is=
=0A=
>> intended to apply on top=0A=
>> of https://patchwork.kernel.org/patch/8923541/ but I don't see any menti=
on=0A=
>> of that.=0A=
>>=0A=
> I saw this patch had been merged already.=0A=
> =0A=
> Regards,=0A=
> Yuantian=0A=
=0A=
I don't see it in linux-next.=0A=
=0A=
-Scott=0A=
=0A=
