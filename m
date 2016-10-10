Return-Path: <radoslaw.pietrzyk@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4302f362-2ec4-73f8-d20b-b120d32b96a2@st.com>
References: <1475791294-5804-1-git-send-email-user@localhost>
 <2d6d5c10-346e-0541-1bc0-b75ef5b40d3f@linaro.org> <CAFvLkMQjDZysgoT3FfkVP8UQVkqghW9=CZU-OEmGUAdMR7CO2A@mail.gmail.com>
 <b6fd21b7-75a6-c38d-a9f1-fbf07132a1d3@linaro.org> <1880a125-b5ec-b64a-5c9b-90d4e9c0af86@st.com>
 <4302f362-2ec4-73f8-d20b-b120d32b96a2@st.com>
From: =?UTF-8?Q?Rados=C5=82aw_Pietrzyk?= <radoslaw.pietrzyk@gmail.com>
Date: Mon, 10 Oct 2016 14:14:13 +0200
Message-ID: <CAFvLkMRWDwfKzYqxvTZN9PvwHAwwBf9UDFUHFMpne6yE6heTKw@mail.gmail.com>
Subject: Re: [PATCH] Reorganize STM32 clocks in order to prepare them for
 PLLI2S and PLLSAI
To: Gabriel Fernandez <gabriel.fernandez@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Daniel Thompson <daniel.thompson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary=001a113fc3d6c13a7e053e81b27c
List-ID: <linux-clk.vger.kernel.org>

--001a113fc3d6c13a7e053e81b27c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Yes of course, I am happy to see this.

2016-10-10 14:10 GMT+02:00 Gabriel Fernandez <gabriel.fernandez@st.com>:

> Hi Rados=C5=82aw,
>
> Yes i m nearly ready to push a patch-set to manage LCD-TFT clock.
>
> In my patch-set i introduced PLLI2S and PLLSAI in generic way, and offer
> the possibility to change the vco frequency (in order to cover all
> frequencies for any LCD).
>
> And then, the vco is no longer a fixed factor.
>
> This patch is just a fix or do you planned to upstream PLLI2S and PLLSAI =
?
>
> If you are ok I can send my patch-set ?
>
> Best Regards
>
> Gabriel
>
>
> On 10/10/2016 01:32 PM, Alexandre Torgue wrote:
>
>> Hi Radoslaw,
>>
>> I add Gabriel in the discussion. Gabriel is updating PLL management for
>> STM32F429.
>>
>> Regards
>> Alex
>>
>> On 10/10/2016 12:31 PM, Daniel Thompson wrote:
>>
>>> On 10/10/16 10:56, Rados=C5=82aw Pietrzyk wrote:
>>>
>>>> Hi,
>>>> all plls have the same clock parent which is after a main divider.
>>>> Currently the divider and multiplier are connected together within vco
>>>> clock and therefore there is no chance to reuse the divider and clearl=
y
>>>> state where the conncetion "really" is. We can arrange all of them
>>>> separately but than the divider will be hidden for all of them
>>>> separately.
>>>>
>>>
>>> Quoting my last mail "I can see the value of naming the "/M"
>>> pre-division separately". In other words I agree with the idea of the
>>> patch.
>>>
>>> To more explicitly state my review comments...
>>>
>>> From: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
>>>>
>>>
>>> Please add a explanation of the problem and solution in the patch
>>> description.
>>>
>>>
>>> Signed-off-by: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
>>>> ---
>>>>  drivers/clk/clk-stm32f4.c | 7 ++++---
>>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
>>>> index 02d6810..1fd3eac 100644
>>>> --- a/drivers/clk/clk-stm32f4.c
>>>> +++ b/drivers/clk/clk-stm32f4.c
>>>> @@ -245,9 +245,10 @@ static void stm32f4_rcc_register_pll(const char
>>>>
>>> *hse_clk, const char *hsi_clk)
>>>
>>>>      const char   *pllsrc =3D pllcfgr & BIT(22) ? hse_clk : hsi_clk;
>>>>      unsigned long pllq   =3D (pllcfgr >> 24) & 0xf;
>>>>
>>>> -    clk_register_fixed_factor(NULL, "vco", pllsrc, 0, plln, pllm);
>>>> -    clk_register_fixed_factor(NULL, "pll", "vco", 0, 1, pllp);
>>>> -    clk_register_fixed_factor(NULL, "pll48", "vco", 0, 1, pllq);
>>>> +    clk_register_fixed_factor(NULL, "vco-div", pllsrc, 0, 1, pllm);
>>>>
>>>
>>> This strikes me as a bad name for a clock that is shared by all three
>>> PLLs (the vco being an internal component of the PLL) however since the
>>> clock is not named in the datasheet we are forced to invent a name [I
>>> suspect that's why I gave up trying to name it when I wrote the driver
>>> originally ;-) ].
>>>
>>> Perhaps "pllin-prediv"?
>>>
>>>
>>> +    clk_register_fixed_factor(NULL, "vco-mul", "vco-div", 0, plln, 1);
>>>>
>>>
>>> Why rename this clock? Multiplying is a what the vco (and its control
>>> circuits) is *for*. Tagging it "-mul" is meaningless.
>>>
>>>
>>> Daniel.
>>>
>>
>

--001a113fc3d6c13a7e053e81b27c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes of course, I am happy to see this.<div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">2016-10-10 14:10 GMT+02:00 Gabriel Fe=
rnandez <span dir=3D"ltr">&lt;<a href=3D"mailto:gabriel.fernandez@st.com" t=
arget=3D"_blank">gabriel.fernandez@st.com</a>&gt;</span>:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Hi Rados=C5=82aw,<br>
<br>
Yes i m nearly ready to push a patch-set to manage LCD-TFT clock.<br>
<br>
In my patch-set i introduced PLLI2S and PLLSAI in generic way, and offer th=
e possibility to change the vco frequency (in order to cover all frequencie=
s for any LCD).<br>
<br>
And then, the vco is no longer a fixed factor.<br>
<br>
This patch is just a fix or do you planned to upstream PLLI2S and PLLSAI ?<=
br>
<br>
If you are ok I can send my patch-set ?<br>
<br>
Best Regards<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
Gabriel</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 10/10/2016 01:32 PM, Alexandre Torgue wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Radoslaw,<br>
<br>
I add Gabriel in the discussion. Gabriel is updating PLL management for STM=
32F429.<br>
<br>
Regards<br>
Alex<br>
<br>
On 10/10/2016 12:31 PM, Daniel Thompson wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 10/10/16 10:56, Rados=C5=82aw Pietrzyk wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi,<br>
all plls have the same clock parent which is after a main divider.<br>
Currently the divider and multiplier are connected together within vco<br>
clock and therefore there is no chance to reuse the divider and clearly<br>
state where the conncetion &quot;really&quot; is. We can arrange all of the=
m<br>
separately but than the divider will be hidden for all of them<br>
separately.<br>
</blockquote>
<br>
Quoting my last mail &quot;I can see the value of naming the &quot;/M&quot;=
<br>
pre-division separately&quot;. In other words I agree with the idea of the<=
br>
patch.<br>
<br>
To more explicitly state my review comments...<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Radoslaw Pietrzyk &lt;<a href=3D"mailto:radoslaw.pietrzyk@gmail.com" =
target=3D"_blank">radoslaw.pietrzyk@gmail.com</a>&gt;<br>
</blockquote>
<br>
Please add a explanation of the problem and solution in the patch<br>
description.<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
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
@@ -245,9 +245,10 @@ static void stm32f4_rcc_register_pll(const char<br>
</blockquote>
*hse_clk, const char *hsi_clk)<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0const char=C2=A0 =C2=A0*pllsrc =3D pllcfgr &amp; BIT(22=
) ? hse_clk : hsi_clk;<br>
=C2=A0 =C2=A0 =C2=A0unsigned long pllq=C2=A0 =C2=A0=3D (pllcfgr &gt;&gt; 24=
) &amp; 0xf;<br>
<br>
-=C2=A0 =C2=A0 clk_register_fixed_factor(NULL<wbr>, &quot;vco&quot;, pllsrc=
, 0, plln, pllm);<br>
-=C2=A0 =C2=A0 clk_register_fixed_factor(NULL<wbr>, &quot;pll&quot;, &quot;=
vco&quot;, 0, 1, pllp);<br>
-=C2=A0 =C2=A0 clk_register_fixed_factor(NULL<wbr>, &quot;pll48&quot;, &quo=
t;vco&quot;, 0, 1, pllq);<br>
+=C2=A0 =C2=A0 clk_register_fixed_factor(NULL<wbr>, &quot;vco-div&quot;, pl=
lsrc, 0, 1, pllm);<br>
</blockquote>
<br>
This strikes me as a bad name for a clock that is shared by all three<br>
PLLs (the vco being an internal component of the PLL) however since the<br>
clock is not named in the datasheet we are forced to invent a name [I<br>
suspect that&#39;s why I gave up trying to name it when I wrote the driver<=
br>
originally ;-) ].<br>
<br>
Perhaps &quot;pllin-prediv&quot;?<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 clk_register_fixed_factor(NULL<wbr>, &quot;vco-mul&quot;, &q=
uot;vco-div&quot;, 0, plln, 1);<br>
</blockquote>
<br>
Why rename this clock? Multiplying is a what the vco (and its control<br>
circuits) is *for*. Tagging it &quot;-mul&quot; is meaningless.<br>
<br>
<br>
Daniel.<br>
</blockquote></blockquote>
<br>
</div></div></blockquote></div><br></div></div>

--001a113fc3d6c13a7e053e81b27c--
