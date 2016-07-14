Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v2 6/7] gxbb: clk: Move MESON_GATE macro to gxbb
From: =?utf-8?Q?Alexander_M=C3=BCller?= <serveralex@gmail.com>
In-Reply-To: <146844555421.73491.17534974282265619018@resonance>
Date: Thu, 14 Jul 2016 19:09:33 +0200
Cc: linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Message-Id: <0F4FC964-B9DE-4880-AF38-469A52FE24D2@gmail.com>
References: <1468432181-9550-1-git-send-email-serveralex@gmail.com> <1468432181-9550-7-git-send-email-serveralex@gmail.com> <146844555421.73491.17534974282265619018@resonance>
To: Michael Turquette <mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,=20

What about the clk name set by the macro MESON_GATE (#_name)? That would =
change too and I guess that's not desired here.

Regards,=20
Alex

> On 13 Jul 2016, at 23:32, Michael Turquette <mturquette@baylibre.com> =
wrote:
>=20
> Hi Alexander,
>=20
> Quoting Alexander M=C3=BCller (2016-07-13 10:49:40)
>> Signed-off-by: Alexander M=C3=BCller <serveralex@gmail.com>
>> ---
>> drivers/clk/meson/clkc.h |  14 ----
>> drivers/clk/meson/gxbb.c | 176 =
+++++++++++++++++++++++++----------------------
>> 2 files changed, 95 insertions(+), 95 deletions(-)
>>=20
>> diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
>> index 53326c3..061a01e 100644
>> --- a/drivers/clk/meson/clkc.h
>> +++ b/drivers/clk/meson/clkc.h
>> @@ -97,20 +97,6 @@ struct meson_clk_mpll {
>>        spinlock_t *lock;
>> };
>>=20
>> -#define MESON_GATE(_name, _reg, _bit)                                =
  \
>> -struct clk_gate gxbb_##_name =3D {                                   =
            \
>=20
> Please leave this macro in clkc.h, but change the above line to:
>=20
> 	#define MESON_GATE(_name, _reg, _bit)	\
> 	struct clk_gate _name =3D {		\
>=20
> Note that gxbb_##_name is replaced with _name. I should have done it
> like this from the beginning but it's a bit of a brain fart.
>=20
>> /* Everything Else (EE) domain gates */
>> -static MESON_GATE(ddr, HHI_GCLK_MPEG0, 0);
>=20
> Then reflow the above gxbb gate clock like so:
>=20
> 	static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
>=20
> Then you can re-use the same macro in your meson8b driver by prefixing
> all of your gate clocks with "meson8b_".
>=20
> Regards,
> Mike
