Return-Path: <radoslaw.pietrzyk@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2d6d5c10-346e-0541-1bc0-b75ef5b40d3f@linaro.org>
References: <1475791294-5804-1-git-send-email-user@localhost> <2d6d5c10-346e-0541-1bc0-b75ef5b40d3f@linaro.org>
From: =?UTF-8?Q?Rados=C5=82aw_Pietrzyk?= <radoslaw.pietrzyk@gmail.com>
Date: Mon, 10 Oct 2016 11:56:20 +0200
Message-ID: <CAFvLkMQjDZysgoT3FfkVP8UQVkqghW9=CZU-OEmGUAdMR7CO2A@mail.gmail.com>
Subject: Re: [PATCH] Reorganize STM32 clocks in order to prepare them for
 PLLI2S and PLLSAI
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary=94eb2c1a18009f6ee8053e7fc5d2
List-ID: <linux-clk.vger.kernel.org>

--94eb2c1a18009f6ee8053e7fc5d2
Content-Type: text/plain; charset=UTF-8

Hi,
all plls have the same clock parent which is after a main divider.
Currently the divider and multiplier are connected together within vco
clock and therefore there is no chance to reuse the divider and clearly
state where the conncetion "really" is. We can arrange all of them
separately but than the divider will be hidden for all of them separately.

2016-10-10 11:37 GMT+02:00 Daniel Thompson <daniel.thompson@linaro.org>:

> On 06/10/16 23:01, radek wrote:
>
>> From: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
>>
>> Signed-off-by: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
>> ---
>>  drivers/clk/clk-stm32f4.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
>> index 02d6810..1fd3eac 100644
>> --- a/drivers/clk/clk-stm32f4.c
>> +++ b/drivers/clk/clk-stm32f4.c
>> @@ -245,9 +245,10 @@ static void stm32f4_rcc_register_pll(const char
>> *hse_clk, const char *hsi_clk)
>>         const char   *pllsrc = pllcfgr & BIT(22) ? hse_clk : hsi_clk;
>>         unsigned long pllq   = (pllcfgr >> 24) & 0xf;
>>
>> -       clk_register_fixed_factor(NULL, "vco", pllsrc, 0, plln, pllm);
>> -       clk_register_fixed_factor(NULL, "pll", "vco", 0, 1, pllp);
>> -       clk_register_fixed_factor(NULL, "pll48", "vco", 0, 1, pllq);
>> +       clk_register_fixed_factor(NULL, "vco-div", pllsrc, 0, 1, pllm);
>> +       clk_register_fixed_factor(NULL, "vco-mul", "vco-div", 0, plln,
>> 1);
>> +       clk_register_fixed_factor(NULL, "pll", "vco-mul", 0, 1, pllp);
>> +       clk_register_fixed_factor(NULL, "pll48", "vco-mul", 0, 1, pllq);
>>
>
> I'm struggling to marry this up to the clock tree diagram for the
> F4-series (and there's no patch description to help me).
>
> I can see the value of naming the "/M" pre-division separately (and agree
> that its hard to find it a good name for this clock in the datasheet).
> However I am struggling to work out why we'd want to rename the vco output.
>
> For me the names for the multiplies clock within each pll emerges fairly
> cleanly from the datasheet (PLL -> vco, PLLI2S -> vcoi2s, PLLSAI ->
> vcosai). What does the '-mul' add?
>
>
> Daniel.
>

--94eb2c1a18009f6ee8053e7fc5d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>all plls have the same clock parent which is after=
 a main divider. Currently the divider and multiplier are connected togethe=
r within vco clock and therefore there is no chance to reuse the divider an=
d clearly state where the conncetion &quot;really&quot; is. We can arrange =
all of them separately but than the divider will be hidden for all of them =
separately.</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">2016-10-10 11:37 GMT+02:00 Daniel Thompson <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:daniel.thompson@linaro.org" target=3D"_blank">daniel.thompson=
@linaro.org</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On 06/10/16 23:01, radek wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Radoslaw Pietrzyk &lt;<a href=3D"mailto:radoslaw.pietrzyk@gmail.com" =
target=3D"_blank">radoslaw.pietrzyk@gmail.com</a>&gt;<br>
<br>
Signed-off-by: Radoslaw Pietrzyk &lt;<a href=3D"mailto:radoslaw.pietrzyk@gm=
ail.com" target=3D"_blank">radoslaw.pietrzyk@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/clk/clk-stm32f4.c | 7 ++++---<br>
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c<br>
index 02d6810..1fd3eac 100644<br>
--- a/drivers/clk/clk-stm32f4.c<br>
+++ b/drivers/clk/clk-stm32f4.c<br>
@@ -245,9 +245,10 @@ static void stm32f4_rcc_register_pll(const char *hse_c=
lk, const char *hsi_clk)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char=C2=A0 =C2=A0*pllsrc =3D pllcfgr &amp=
; BIT(22) ? hse_clk : hsi_clk;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long pllq=C2=A0 =C2=A0=3D (pllcfgr &gt=
;&gt; 24) &amp; 0xf;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_fixed_factor(NUL<wbr>L, &quot;vco&=
quot;, pllsrc, 0, plln, pllm);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_fixed_factor(NUL<wbr>L, &quot;pll&=
quot;, &quot;vco&quot;, 0, 1, pllp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_fixed_factor(NUL<wbr>L, &quot;pll4=
8&quot;, &quot;vco&quot;, 0, 1, pllq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_fixed_factor(NUL<wbr>L, &quot;vco-=
div&quot;, pllsrc, 0, 1, pllm);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_fixed_factor(NUL<wbr>L, &quot;vco-=
mul&quot;, &quot;vco-div&quot;, 0, plln, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_fixed_factor(NUL<wbr>L, &quot;pll&=
quot;, &quot;vco-mul&quot;, 0, 1, pllp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_fixed_factor(NUL<wbr>L, &quot;pll4=
8&quot;, &quot;vco-mul&quot;, 0, 1, pllq);<br>
</blockquote>
<br></span>
I&#39;m struggling to marry this up to the clock tree diagram for the F4-se=
ries (and there&#39;s no patch description to help me).<br>
<br>
I can see the value of naming the &quot;/M&quot; pre-division separately (a=
nd agree that its hard to find it a good name for this clock in the datashe=
et). However I am struggling to work out why we&#39;d want to rename the vc=
o output.<br>
<br>
For me the names for the multiplies clock within each pll emerges fairly cl=
eanly from the datasheet (PLL -&gt; vco, PLLI2S -&gt; vcoi2s, PLLSAI -&gt; =
vcosai). What does the &#39;-mul&#39; add?<span class=3D"HOEnZb"><font colo=
r=3D"#888888"><br>
<br>
<br>
Daniel.<br>
</font></span></blockquote></div><br></div>

--94eb2c1a18009f6ee8053e7fc5d2--
