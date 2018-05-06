Return-Path: <michael@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <CAOMZO5BO_FgPCkJJQf64jyYguqFGaDTDje3=_KTm4sXhwxb0WA@mail.gmail.com>
References: <1524258004-28717-1-git-send-email-michael@amarulasolutions.com> <CAOMZO5BO_FgPCkJJQf64jyYguqFGaDTDje3=_KTm4sXhwxb0WA@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sun, 6 May 2018 15:41:10 +0200
Message-ID: <CAOf5uwnGDzEsK4tG9KD=uJr_sP1J5v_uROdUhy6s3p58=xZ1Dg@mail.gmail.com>
Subject: Re: [PATCH V2] clk: imx: Add new clo01 and clo2 controlled by CCOSR
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
	Matteo Lisi <matteo.lisi@engicam.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Fabio

On Sun, May 6, 2018 at 3:39 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Fri, Apr 20, 2018 at 6:00 PM, Michael Trimarchi
> <michael@amarulasolutions.com> wrote:
>> osc->cko2_sel->cko2_podf->clk_cko2->clk_cko
>>
>> Example of usage to provide clock to the sgtl5000
>>
>> codec: sgtl5000@0a {
>>         compatible = "fsl,sgtl5000";
>>         reg = <0x0a>;
>>         clocks = <&clks IMX6UL_CLK_OSC>;
>>         #sound-dai-cells = <0>;
>>         clocks = <&clks IMX6UL_CLK_CKO>;
>>         assigned-clocks = <&clks IMX6UL_CLK_CKO2_SEL>,
>>                           <&clks IMX6UL_CLK_CKO2_PODF>,
>>                           <&clks IMX6UL_CLK_CKO2>,
>>                           <&clks IMX6UL_CLK_CKO>;
>>         assigned-clock-parents = <&clks IMX6UL_CLK_OSC>,
>>                                  <&clks IMX6UL_CLK_CKO2_SEL>,
>>                                  <&clks IMX6UL_CLK_CKO2_PODF>,
>>                                  <&clks IMX6UL_CLK_CKO2>;
>>         clock-names = "mclk";
>>         wlf,shared-lrclk;
>>
>> Signed-off-by: Matteo Lisi <matteo.lisi@engicam.com>
>> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>> Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
>
> Looks good. Only a minor comment.
>
>> diff --git a/include/dt-bindings/clock/imx6ul-clock.h b/include/dt-bindings/clock/imx6ul-clock.h
>> index ee9f1a5..9564597 100644
>> --- a/include/dt-bindings/clock/imx6ul-clock.h
>> +++ b/include/dt-bindings/clock/imx6ul-clock.h
>> @@ -235,20 +235,27 @@
>>  #define IMX6UL_CLK_CSI_PODF            222
>>  #define IMX6UL_CLK_PLL3_120M           223
>>  #define IMX6UL_CLK_KPP                 224
>> +#define IMX6UL_CLK_CKO1_SEL            225
>> +#define IMX6UL_CLK_CKO1_PODF           226
>> +#define IMX6UL_CLK_CKO1                        227
>> +#define IMX6UL_CLK_CKO2_SEL            228
>> +#define IMX6UL_CLK_CKO2_PODF           229
>> +#define IMX6UL_CLK_CKO2                        230
>> +#define IMX6UL_CLK_CKO                 231
>>
>>  /* For i.MX6ULL */
>> -#define IMX6ULL_CLK_ESAI_PRED          225
>> -#define IMX6ULL_CLK_ESAI_PODF          226
>> -#define IMX6ULL_CLK_ESAI_EXTAL         227
>> -#define IMX6ULL_CLK_ESAI_MEM           228
>> -#define IMX6ULL_CLK_ESAI_IPG           229
>> -#define IMX6ULL_CLK_DCP_CLK            230
>> -#define IMX6ULL_CLK_EPDC_PRE_SEL       231
>> -#define IMX6ULL_CLK_EPDC_SEL           232
>> -#define IMX6ULL_CLK_EPDC_PODF          233
>> -#define IMX6ULL_CLK_EPDC_ACLK          234
>> -#define IMX6ULL_CLK_EPDC_PIX           235
>> -#define IMX6ULL_CLK_ESAI_SEL           236
>> -#define IMX6UL_CLK_END                 237
>> +#define IMX6ULL_CLK_ESAI_PRED          232
>> +#define IMX6ULL_CLK_ESAI_PODF          233
>> +#define IMX6ULL_CLK_ESAI_EXTAL         234
>> +#define IMX6ULL_CLK_ESAI_MEM           235
>> +#define IMX6ULL_CLK_ESAI_IPG           236
>> +#define IMX6ULL_CLK_DCP_CLK            237
>> +#define IMX6ULL_CLK_EPDC_PRE_SEL       238
>> +#define IMX6ULL_CLK_EPDC_SEL           239
>> +#define IMX6ULL_CLK_EPDC_PODF          240
>> +#define IMX6ULL_CLK_EPDC_ACLK          241
>> +#define IMX6ULL_CLK_EPDC_PIX           242
>> +#define IMX6ULL_CLK_ESAI_SEL           243
>> +#define IMX6UL_CLK_END                 244
>
> It would be cleaner if you only add the new clocks to end of the list.

I have done the same but those clocks are valid for ULL and UL so seems that
last clocks in the list seems added for ULL only

Michael
