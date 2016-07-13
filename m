Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 5/7] gxbb: clk: Move MESON_GATE macro to gxbb
From: =?utf-8?Q?Alexander_M=C3=BCller?= <serveralex@gmail.com>
In-Reply-To: <146776538903.35356.16063870470160610588@resonance>
Date: Wed, 13 Jul 2016 19:43:51 +0200
Cc: linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Message-Id: <1BDF9282-995B-4127-8436-E015516F5DE9@gmail.com>
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com> <1467741391-60534-6-git-send-email-serveralex@gmail.com> <146776538903.35356.16063870470160610588@resonance>
To: Michael Turquette <mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

I moved the macro because of the struct variable name which is =
gxbb_##_name here.

> On 06 Jul 2016, at 02:36, Michael Turquette <mturquette@baylibre.com> =
wrote:
>=20
> Hi Alexander,
>=20
> Quoting Alexander M=C3=BCller (2016-07-05 10:56:29)
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
>> -       .reg =3D (void __iomem *) _reg,                               =
    \
>> -       .bit_idx =3D (_bit),                                          =
    \
>> -       .lock =3D &clk_lock,                                          =
    \
>> -       .hw.init =3D &(struct clk_init_data) {                        =
    \
>> -               .name =3D #_name,                                 \
>> -               .ops =3D &clk_gate_ops,                               =
    \
>> -               .parent_names =3D (const char *[]){ "clk81" },        =
    \
>> -               .num_parents =3D 1,                                   =
    \
>> -               .flags =3D (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED), =
    \
>> -       },                                                            =
  \
>> -};
>=20
> Why can't this macro be shared between meson8b and gxbb? Looks =
identical
> to me, but maybe I missed something.
>=20
>> -
>> /* clk_ops */
>> extern const struct clk_ops meson_clk_pll_ro_ops;
>> extern const struct clk_ops meson_clk_pll_ops;
>> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
>> index 007b715..0ea71be 100644
>> --- a/drivers/clk/meson/gxbb.c
>> +++ b/drivers/clk/meson/gxbb.c
>> @@ -24,6 +24,20 @@
>> #include "clkc.h"
>> #include "gxbb.h"
>>=20
>> +#define GBXX_GATE(_name, _reg, _bit)                                 =
  \
>=20
> s/GBXX/GXBB/g
>=20
> Including all of the static data further below ;-)
>=20
> Regards,
> Mike
>=20
>> +struct clk_gate gxbb_##_name =3D {                                   =
            \
>> +       .reg =3D (void __iomem *) _reg,                               =
    \
>> +       .bit_idx =3D (_bit),                                          =
    \
>> +       .lock =3D &clk_lock,                                          =
    \
>> +       .hw.init =3D &(struct clk_init_data) {                        =
    \
>> +               .name =3D #_name,                                 \
>> +               .ops =3D &clk_gate_ops,                               =
    \
>> +               .parent_names =3D (const char *[]){ "clk81" },        =
    \
>> +               .num_parents =3D 1,                                   =
    \
>> +               .flags =3D (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED), =
    \
>> +       },                                                            =
  \
>> +};
>> +
>> static DEFINE_SPINLOCK(clk_lock);
>>=20
>> static const struct pll_rate_table sys_pll_rate_table[] =3D {
>> @@ -563,90 +577,90 @@ static struct clk_gate gxbb_clk81 =3D {
>> };
>>=20
>> /* Everything Else (EE) domain gates */
>> -static MESON_GATE(ddr, HHI_GCLK_MPEG0, 0);
>> -static MESON_GATE(dos, HHI_GCLK_MPEG0, 1);
>> -static MESON_GATE(isa, HHI_GCLK_MPEG0, 5);
>> -static MESON_GATE(pl301, HHI_GCLK_MPEG0, 6);
>> -static MESON_GATE(periphs, HHI_GCLK_MPEG0, 7);
>> -static MESON_GATE(spicc, HHI_GCLK_MPEG0, 8);
>> -static MESON_GATE(i2c, HHI_GCLK_MPEG0, 9);
>> -static MESON_GATE(sar_adc, HHI_GCLK_MPEG0, 10);
>> -static MESON_GATE(smart_card, HHI_GCLK_MPEG0, 11);
>> -static MESON_GATE(rng0, HHI_GCLK_MPEG0, 12);
>> -static MESON_GATE(uart0, HHI_GCLK_MPEG0, 13);
>> -static MESON_GATE(sdhc, HHI_GCLK_MPEG0, 14);
>> -static MESON_GATE(stream, HHI_GCLK_MPEG0, 15);
>> -static MESON_GATE(async_fifo, HHI_GCLK_MPEG0, 16);
>> -static MESON_GATE(sdio, HHI_GCLK_MPEG0, 17);
>> -static MESON_GATE(abuf, HHI_GCLK_MPEG0, 18);
>> -static MESON_GATE(hiu_iface, HHI_GCLK_MPEG0, 19);
>> -static MESON_GATE(assist_misc, HHI_GCLK_MPEG0, 23);
>> -static MESON_GATE(spi, HHI_GCLK_MPEG0, 30);
>> -
>> -static MESON_GATE(i2s_spdif, HHI_GCLK_MPEG1, 2);
>> -static MESON_GATE(eth, HHI_GCLK_MPEG1, 3);
>> -static MESON_GATE(demux, HHI_GCLK_MPEG1, 4);
>> -static MESON_GATE(aiu_glue, HHI_GCLK_MPEG1, 6);
>> -static MESON_GATE(iec958, HHI_GCLK_MPEG1, 7);
>> -static MESON_GATE(i2s_out, HHI_GCLK_MPEG1, 8);
>> -static MESON_GATE(amclk, HHI_GCLK_MPEG1, 9);
>> -static MESON_GATE(aififo2, HHI_GCLK_MPEG1, 10);
>> -static MESON_GATE(mixer, HHI_GCLK_MPEG1, 11);
>> -static MESON_GATE(mixer_iface, HHI_GCLK_MPEG1, 12);
>> -static MESON_GATE(adc, HHI_GCLK_MPEG1, 13);
>> -static MESON_GATE(blkmv, HHI_GCLK_MPEG1, 14);
>> -static MESON_GATE(aiu, HHI_GCLK_MPEG1, 15);
>> -static MESON_GATE(uart1, HHI_GCLK_MPEG1, 16);
>> -static MESON_GATE(g2d, HHI_GCLK_MPEG1, 20);
>> -static MESON_GATE(usb0, HHI_GCLK_MPEG1, 21);
>> -static MESON_GATE(usb1, HHI_GCLK_MPEG1, 22);
>> -static MESON_GATE(reset, HHI_GCLK_MPEG1, 23);
>> -static MESON_GATE(nand, HHI_GCLK_MPEG1, 24);
>> -static MESON_GATE(dos_parser, HHI_GCLK_MPEG1, 25);
>> -static MESON_GATE(usb, HHI_GCLK_MPEG1, 26);
>> -static MESON_GATE(vdin1, HHI_GCLK_MPEG1, 28);
>> -static MESON_GATE(ahb_arb0, HHI_GCLK_MPEG1, 29);
>> -static MESON_GATE(efuse, HHI_GCLK_MPEG1, 30);
>> -static MESON_GATE(boot_rom, HHI_GCLK_MPEG1, 31);
>> -
>> -static MESON_GATE(ahb_data_bus, HHI_GCLK_MPEG2, 1);
>> -static MESON_GATE(ahb_ctrl_bus, HHI_GCLK_MPEG2, 2);
>> -static MESON_GATE(hdmi_intr_sync, HHI_GCLK_MPEG2, 3);
>> -static MESON_GATE(hdmi_pclk, HHI_GCLK_MPEG2, 4);
>> -static MESON_GATE(usb1_ddr_bridge, HHI_GCLK_MPEG2, 8);
>> -static MESON_GATE(usb0_ddr_bridge, HHI_GCLK_MPEG2, 9);
>> -static MESON_GATE(mmc_pclk, HHI_GCLK_MPEG2, 11);
>> -static MESON_GATE(dvin, HHI_GCLK_MPEG2, 12);
>> -static MESON_GATE(uart2, HHI_GCLK_MPEG2, 15);
>> -static MESON_GATE(sana, HHI_GCLK_MPEG2, 22);
>> -static MESON_GATE(vpu_intr, HHI_GCLK_MPEG2, 25);
>> -static MESON_GATE(sec_ahb_ahb3_bridge, HHI_GCLK_MPEG2, 26);
>> -static MESON_GATE(clk81_a53, HHI_GCLK_MPEG2, 29);
>> -
>> -static MESON_GATE(vclk2_venci0, HHI_GCLK_OTHER, 1);
>> -static MESON_GATE(vclk2_venci1, HHI_GCLK_OTHER, 2);
>> -static MESON_GATE(vclk2_vencp0, HHI_GCLK_OTHER, 3);
>> -static MESON_GATE(vclk2_vencp1, HHI_GCLK_OTHER, 4);
>> -static MESON_GATE(gclk_venci_int0, HHI_GCLK_OTHER, 8);
>> -static MESON_GATE(gclk_vencp_int, HHI_GCLK_OTHER, 9);
>> -static MESON_GATE(dac_clk, HHI_GCLK_OTHER, 10);
>> -static MESON_GATE(aoclk_gate, HHI_GCLK_OTHER, 14);
>> -static MESON_GATE(iec958_gate, HHI_GCLK_OTHER, 16);
>> -static MESON_GATE(enc480p, HHI_GCLK_OTHER, 20);
>> -static MESON_GATE(rng1, HHI_GCLK_OTHER, 21);
>> -static MESON_GATE(gclk_venci_int1, HHI_GCLK_OTHER, 22);
>> -static MESON_GATE(vclk2_venclmcc, HHI_GCLK_OTHER, 24);
>> -static MESON_GATE(vclk2_vencl, HHI_GCLK_OTHER, 25);
>> -static MESON_GATE(vclk_other, HHI_GCLK_OTHER, 26);
>> -static MESON_GATE(edp, HHI_GCLK_OTHER, 31);
>> +static GBXX_GATE(ddr, HHI_GCLK_MPEG0, 0);
>> +static GBXX_GATE(dos, HHI_GCLK_MPEG0, 1);
>> +static GBXX_GATE(isa, HHI_GCLK_MPEG0, 5);
>> +static GBXX_GATE(pl301, HHI_GCLK_MPEG0, 6);
>> +static GBXX_GATE(periphs, HHI_GCLK_MPEG0, 7);
>> +static GBXX_GATE(spicc, HHI_GCLK_MPEG0, 8);
>> +static GBXX_GATE(i2c, HHI_GCLK_MPEG0, 9);
>> +static GBXX_GATE(sar_adc, HHI_GCLK_MPEG0, 10);
>> +static GBXX_GATE(smart_card, HHI_GCLK_MPEG0, 11);
>> +static GBXX_GATE(rng0, HHI_GCLK_MPEG0, 12);
>> +static GBXX_GATE(uart0, HHI_GCLK_MPEG0, 13);
>> +static GBXX_GATE(sdhc, HHI_GCLK_MPEG0, 14);
>> +static GBXX_GATE(stream, HHI_GCLK_MPEG0, 15);
>> +static GBXX_GATE(async_fifo, HHI_GCLK_MPEG0, 16);
>> +static GBXX_GATE(sdio, HHI_GCLK_MPEG0, 17);
>> +static GBXX_GATE(abuf, HHI_GCLK_MPEG0, 18);
>> +static GBXX_GATE(hiu_iface, HHI_GCLK_MPEG0, 19);
>> +static GBXX_GATE(assist_misc, HHI_GCLK_MPEG0, 23);
>> +static GBXX_GATE(spi, HHI_GCLK_MPEG0, 30);
>> +
>> +static GBXX_GATE(i2s_spdif, HHI_GCLK_MPEG1, 2);
>> +static GBXX_GATE(eth, HHI_GCLK_MPEG1, 3);
>> +static GBXX_GATE(demux, HHI_GCLK_MPEG1, 4);
>> +static GBXX_GATE(aiu_glue, HHI_GCLK_MPEG1, 6);
>> +static GBXX_GATE(iec958, HHI_GCLK_MPEG1, 7);
>> +static GBXX_GATE(i2s_out, HHI_GCLK_MPEG1, 8);
>> +static GBXX_GATE(amclk, HHI_GCLK_MPEG1, 9);
>> +static GBXX_GATE(aififo2, HHI_GCLK_MPEG1, 10);
>> +static GBXX_GATE(mixer, HHI_GCLK_MPEG1, 11);
>> +static GBXX_GATE(mixer_iface, HHI_GCLK_MPEG1, 12);
>> +static GBXX_GATE(adc, HHI_GCLK_MPEG1, 13);
>> +static GBXX_GATE(blkmv, HHI_GCLK_MPEG1, 14);
>> +static GBXX_GATE(aiu, HHI_GCLK_MPEG1, 15);
>> +static GBXX_GATE(uart1, HHI_GCLK_MPEG1, 16);
>> +static GBXX_GATE(g2d, HHI_GCLK_MPEG1, 20);
>> +static GBXX_GATE(usb0, HHI_GCLK_MPEG1, 21);
>> +static GBXX_GATE(usb1, HHI_GCLK_MPEG1, 22);
>> +static GBXX_GATE(reset, HHI_GCLK_MPEG1, 23);
>> +static GBXX_GATE(nand, HHI_GCLK_MPEG1, 24);
>> +static GBXX_GATE(dos_parser, HHI_GCLK_MPEG1, 25);
>> +static GBXX_GATE(usb, HHI_GCLK_MPEG1, 26);
>> +static GBXX_GATE(vdin1, HHI_GCLK_MPEG1, 28);
>> +static GBXX_GATE(ahb_arb0, HHI_GCLK_MPEG1, 29);
>> +static GBXX_GATE(efuse, HHI_GCLK_MPEG1, 30);
>> +static GBXX_GATE(boot_rom, HHI_GCLK_MPEG1, 31);
>> +
>> +static GBXX_GATE(ahb_data_bus, HHI_GCLK_MPEG2, 1);
>> +static GBXX_GATE(ahb_ctrl_bus, HHI_GCLK_MPEG2, 2);
>> +static GBXX_GATE(hdmi_intr_sync, HHI_GCLK_MPEG2, 3);
>> +static GBXX_GATE(hdmi_pclk, HHI_GCLK_MPEG2, 4);
>> +static GBXX_GATE(usb1_ddr_bridge, HHI_GCLK_MPEG2, 8);
>> +static GBXX_GATE(usb0_ddr_bridge, HHI_GCLK_MPEG2, 9);
>> +static GBXX_GATE(mmc_pclk, HHI_GCLK_MPEG2, 11);
>> +static GBXX_GATE(dvin, HHI_GCLK_MPEG2, 12);
>> +static GBXX_GATE(uart2, HHI_GCLK_MPEG2, 15);
>> +static GBXX_GATE(sana, HHI_GCLK_MPEG2, 22);
>> +static GBXX_GATE(vpu_intr, HHI_GCLK_MPEG2, 25);
>> +static GBXX_GATE(sec_ahb_ahb3_bridge, HHI_GCLK_MPEG2, 26);
>> +static GBXX_GATE(clk81_a53, HHI_GCLK_MPEG2, 29);
>> +
>> +static GBXX_GATE(vclk2_venci0, HHI_GCLK_OTHER, 1);
>> +static GBXX_GATE(vclk2_venci1, HHI_GCLK_OTHER, 2);
>> +static GBXX_GATE(vclk2_vencp0, HHI_GCLK_OTHER, 3);
>> +static GBXX_GATE(vclk2_vencp1, HHI_GCLK_OTHER, 4);
>> +static GBXX_GATE(gclk_venci_int0, HHI_GCLK_OTHER, 8);
>> +static GBXX_GATE(gclk_vencp_int, HHI_GCLK_OTHER, 9);
>> +static GBXX_GATE(dac_clk, HHI_GCLK_OTHER, 10);
>> +static GBXX_GATE(aoclk_gate, HHI_GCLK_OTHER, 14);
>> +static GBXX_GATE(iec958_gate, HHI_GCLK_OTHER, 16);
>> +static GBXX_GATE(enc480p, HHI_GCLK_OTHER, 20);
>> +static GBXX_GATE(rng1, HHI_GCLK_OTHER, 21);
>> +static GBXX_GATE(gclk_venci_int1, HHI_GCLK_OTHER, 22);
>> +static GBXX_GATE(vclk2_venclmcc, HHI_GCLK_OTHER, 24);
>> +static GBXX_GATE(vclk2_vencl, HHI_GCLK_OTHER, 25);
>> +static GBXX_GATE(vclk_other, HHI_GCLK_OTHER, 26);
>> +static GBXX_GATE(edp, HHI_GCLK_OTHER, 31);
>>=20
>> /* Always On (AO) domain gates */
>>=20
>> -static MESON_GATE(ao_media_cpu, HHI_GCLK_AO, 0);
>> -static MESON_GATE(ao_ahb_sram, HHI_GCLK_AO, 1);
>> -static MESON_GATE(ao_ahb_bus, HHI_GCLK_AO, 2);
>> -static MESON_GATE(ao_iface, HHI_GCLK_AO, 3);
>> -static MESON_GATE(ao_i2c, HHI_GCLK_AO, 4);
>> +static GBXX_GATE(ao_media_cpu, HHI_GCLK_AO, 0);
>> +static GBXX_GATE(ao_ahb_sram, HHI_GCLK_AO, 1);
>> +static GBXX_GATE(ao_ahb_bus, HHI_GCLK_AO, 2);
>> +static GBXX_GATE(ao_iface, HHI_GCLK_AO, 3);
>> +static GBXX_GATE(ao_i2c, HHI_GCLK_AO, 4);
>>=20
>> /* Array of all clocks provided by this provider */
>>=20
>> --=20
>> 2.5.0
