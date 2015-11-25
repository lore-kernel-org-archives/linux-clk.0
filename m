Return-Path: <atx@atx.name>
Mime-Version: 1.0
Date: Wed, 25 Nov 2015 11:02:34 +0000
Content-Type: text/plain; charset="utf-8"
Message-ID: <0edf1031924124377647dfb0f62ec6c8@rainloop.atalax.net>
From: "Josef Gajdusek" <atx@atx.name>
Subject: Re: [linux-sunxi] Re: [PATCH v2 3/5] thermal: Add a driver for  
 the Allwinner THS sensor
To: maxime.ripard@free-electrons.com
Cc: linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 gpatchesrdh@mveas.com, mturquette@linaro.org, hdegoede@redhat.com,
 sboyd@codeaurora.org, mturquette@baylibre.com, emilio@elopez.com.ar,
 linux@arm.linux.org.uk, edubezval@gmail.com, rui.zhang@intel.com,
 wens@csie.org, galak@codeaurora.org, ijc+devicetree@hellion.org.uk,
 mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org
In-Reply-To: <20151124084342.GJ32142@lukather>
References: <20151124084342.GJ32142@lukather>  
 <cover.1448263428.git.atx@atx.name>   
 <ea5d8edefd251f2b76660b43a4ea4dc89c3b2f38.1448263428.git.atx@atx.name>
List-ID: <linux-clk.vger.kernel.org>

November 24 2015 9:43 AM, "Maxime Ripard" <maxime.ripard@free-electrons.c=
om> wrote:=0A=0A> On Mon, Nov 23, 2015 at 09:02:50AM +0100, Josef Gajduse=
k wrote:=0A> =0A>> This patch adds support for the Sunxi thermal sensor o=
n the Allwinner H3.=0A> =0A> You can drop the sunxi here.=0A> =0A>> Shoul=
d be easily extendable for the A33/A83T/... as they have similar but=0A>>=
 not completely identical sensors.=0A>> =0A>> Signed-off-by: Josef Gajdus=
ek <atx@atx.name>=0A>> ---=0A>> drivers/thermal/Kconfig | 7 +=0A>> driver=
s/thermal/Makefile | 1 +=0A>> drivers/thermal/sun8i_ths.c | 365 +++++++++=
+++++++++++++++++++++++++++++++++++=0A>> 3 files changed, 373 insertions(=
+)=0A>> create mode 100644 drivers/thermal/sun8i_ths.c=0A>> =0A>> diff --=
git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig=0A>> index c463c8=
9..2b41147 100644=0A>> --- a/drivers/thermal/Kconfig=0A>> +++ b/drivers/t=
hermal/Kconfig=0A>> @@ -365,6 +365,13 @@ config INTEL_PCH_THERMAL=0A>> Th=
ermal reporting device will provide temperature reading,=0A>> programmabl=
e trip points and other information.=0A>> =0A>> +config SUN8I_THS=0A>> + =
tristate "sun8i THS driver"=0A>> + depends on MACH_SUN8I=0A>> + depends o=
n OF=0A>> + help=0A>> + Enable this to support thermal reporting on some =
newer Allwinner SoCs.=0A>> +=0A>> menu "Texas Instruments thermal drivers=
"=0A>> depends on ARCH_HAS_BANDGAP || COMPILE_TEST=0A>> source "drivers/t=
hermal/ti-soc-thermal/Kconfig"=0A>> diff --git a/drivers/thermal/Makefile=
 b/drivers/thermal/Makefile=0A>> index cfae6a6..227e1a1 100644=0A>> --- a=
/drivers/thermal/Makefile=0A>> +++ b/drivers/thermal/Makefile=0A>> @@ -48=
,3 +48,4 @@ obj-$(CONFIG_INTEL_PCH_THERMAL) +=3D intel_pch_thermal.o=0A>>=
 obj-$(CONFIG_ST_THERMAL) +=3D st/=0A>> obj-$(CONFIG_TEGRA_SOCTHERM) +=3D=
 tegra_soctherm.o=0A>> obj-$(CONFIG_HISI_THERMAL) +=3D hisi_thermal.o=0A>=
> +obj-$(CONFIG_SUN8I_THS) +=3D sun8i_ths.o=0A>> diff --git a/drivers/the=
rmal/sun8i_ths.c b/drivers/thermal/sun8i_ths.c=0A>> new file mode 100644=
=0A>> index 0000000..2c976ac=0A>> --- /dev/null=0A>> +++ b/drivers/therma=
l/sun8i_ths.c=0A>> @@ -0,0 +1,365 @@=0A>> +/*=0A>> + * Sunxi THS driver=
=0A> =0A> sun8i Thermal Sensor Driver=0A> =0A>> + * Copyright (C) 2015 Jo=
sef Gajdusek=0A>> + *=0A>> + * This software is licensed under the terms =
of the GNU General Public=0A>> + * License version 2, as published by the=
 Free Software Foundation, and=0A>> + * may be copied, distributed, and m=
odified under those terms.=0A>> + *=0A>> + * This program is distributed =
in the hope that it will be useful,=0A>> + * but WITHOUT ANY WARRANTY; wi=
thout even the implied warranty of=0A>> + * MERCHANTABILITY or FITNESS FO=
R A PARTICULAR PURPOSE. See the=0A>> + * GNU General Public License for m=
ore details.=0A>> + *=0A>> + */=0A>> +=0A>> +#include <linux/clk.h>=0A>> =
+#include <linux/delay.h>=0A> =0A> Are you using this header?=0A> =0A>> +=
#include <linux/interrupt.h>=0A>> +#include <linux/io.h>=0A>> +#include <=
linux/irq.h>=0A> =0A> You probably don't need this one too.=0A> =0A>> +#i=
nclude <linux/module.h>=0A>> +#include <linux/nvmem-consumer.h>=0A>> +#in=
clude <linux/of_device.h>=0A>> +#include <linux/platform_device.h>=0A>> +=
#include <linux/printk.h>=0A>> +#include <linux/reset.h>=0A>> +#include <=
linux/slab.h>=0A>> +#include <linux/thermal.h>=0A>> +=0A>> +#define THS_H=
3_CTRL0 0x00=0A>> +#define THS_H3_CTRL1 0x04=0A>> +#define THS_H3_CDAT 0x=
14=0A>> +#define THS_H3_CTRL2 0x40=0A>> +#define THS_H3_INT_CTRL 0x44=0A>=
> +#define THS_H3_STAT 0x48=0A>> +#define THS_H3_ALARM_CTRL 0x50=0A>> +#d=
efine THS_H3_SHUTDOWN_CTRL 0x60=0A>> +#define THS_H3_FILTER 0x70=0A>> +#d=
efine THS_H3_CDATA 0x74=0A>> +#define THS_H3_DATA 0x80=0A>> +=0A>> +#defi=
ne THS_H3_CTRL0_SENSOR_ACQ0_OFFS 0=0A>> +#define THS_H3_CTRL0_SENSOR_ACQ0=
(x) \=0A>> + ((x) << THS_H3_CTRL0_SENSOR_ACQ0_OFFS)=0A>> +#define THS_H3_=
CTRL1_ADC_CALI_EN_OFFS 17=0A>> +#define THS_H3_CTRL1_ADC_CALI_EN \=0A>> +=
 BIT(THS_H3_CTRL1_ADC_CALI_EN_OFFS)=0A>> +#define THS_H3_CTRL1_OP_BIAS_OF=
FS 20=0A>> +#define THS_H3_CTRL1_OP_BIAS(x) \=0A>> + ((x) << THS_H3_CTRL1=
_OP_BIAS_OFFS)=0A>> +#define THS_H3_CTRL2_SENSE_EN_OFFS 0=0A>> +#define T=
HS_H3_CTRL2_SENSE_EN \=0A>> + BIT(THS_H3_CTRL2_SENSE_EN_OFFS)=0A>> +#defi=
ne THS_H3_CTRL2_SENSOR_ACQ1_OFFS 16=0A>> +#define THS_H3_CTRL2_SENSOR_ACQ=
1(x) \=0A>> + ((x) << THS_H3_CTRL2_SENSOR_ACQ1_OFFS)=0A>> +=0A>> +#define=
 THS_H3_INT_CTRL_ALARM_INT_EN_OFFS 0=0A>> +#define THS_H3_INT_CTRL_ALARM_=
INT_EN \=0A>> + BIT(THS_H3_INT_CTRL_ALARM_INT_EN_OFFS)=0A>> +#define THS_=
H3_INT_CTRL_SHUT_INT_EN_OFFS 4=0A>> +#define THS_H3_INT_CTRL_SHUT_INT_EN =
\=0A>> + BIT(THS_H3_INT_CTRL_SHUT_INT_EN_OFFS)=0A>> +#define THS_H3_INT_C=
TRL_DATA_IRQ_EN_OFFS 8=0A>> +#define THS_H3_INT_CTRL_DATA_IRQ_EN \=0A>> +=
 BIT(THS_H3_INT_CTRL_DATA_IRQ_EN_OFFS)=0A>> +#define THS_H3_INT_CTRL_THER=
MAL_PER_OFFS 12=0A>> +#define THS_H3_INT_CTRL_THERMAL_PER(x) \=0A>> + ((x=
) << THS_H3_INT_CTRL_THERMAL_PER_OFFS)=0A>> +=0A>> +#define THS_H3_STAT_A=
LARM_INT_STS_OFFS 0=0A>> +#define THS_H3_STAT_ALARM_INT_STS \=0A>> + BIT(=
THS_H3_STAT_ALARM_INT_STS_OFFS)=0A>> +#define THS_H3_STAT_SHUT_INT_STS_OF=
FS 4=0A>> +#define THS_H3_STAT_SHUT_INT_STS \=0A>> + BIT(THS_H3_STAT_SHUT=
_INT_STS_OFFS)=0A>> +#define THS_H3_STAT_DATA_IRQ_STS_OFFS 8=0A>> +#defin=
e THS_H3_STAT_DATA_IRQ_STS \=0A>> + BIT(THS_H3_STAT_DATA_IRQ_STS_OFFS)=0A=
>> +#define THS_H3_STAT_ALARM_OFF_STS_OFFS 12=0A>> +#define THS_H3_STAT_A=
LARM_OFF_STS \=0A>> + BIT(THS_H3_STAT_ALARM_OFF_STS_OFFS)=0A>> +=0A>> +#d=
efine THS_H3_ALARM_CTRL_ALARM0_T_HYST_OFFS 0=0A>> +#define THS_H3_ALARM_C=
TRL_ALARM0_T_HYST(x) \=0A>> + ((x) << THS_H3_ALARM_CTRL_ALARM0_T_HYST_OFF=
S)=0A>> +#define THS_H3_ALARM_CTRL_ALARM0_T_HOT_OFFS 16=0A>> +#define THS=
_H3_ALARM_CTRL_ALARM0_T_HOT(x) \=0A>> + ((x) << THS_H3_ALARM_CTRL_ALARM0_=
T_HOT_OFFS)=0A>> +=0A>> +#define THS_H3_SHUTDOWN_CTRL_SHUT0_T_HOT_OFFS 16=
=0A>> +#define THS_H3_SHUTDOWN_CTRL_SHUT0_T_HOT(x) \=0A>> + ((x) << THS_H=
3_SHUTDOWN_CTRL_SHUT0_T_HOT_OFFS)=0A>> +=0A>> +#define THS_H3_FILTER_TYPE=
_OFFS 0=0A>> +#define THS_H3_FILTER_TYPE(x) \=0A>> + ((x) << THS_H3_FILTE=
R_TYPE_OFFS)=0A>> +#define THS_H3_FILTER_EN_OFFS 2=0A>> +#define THS_H3_F=
ILTER_EN \=0A>> + BIT(THS_H3_FILTER_EN_OFFS)=0A> =0A> Are you using these=
 offsets anywhere?=0A>> +=0A>> +#define THS_H3_CTRL0_SENSOR_ACQ0_VALUE 0x=
ff=0A>> +#define THS_H3_INT_CTRL_THERMAL_PER_VALUE 0x79=0A>> +#define THS=
_H3_FILTER_TYPE_VALUE 0x2=0A>> +#define THS_H3_CTRL2_SENSOR_ACQ1_VALUE 0x=
3f=0A>> +=0A>> +struct sun8i_ths_data {=0A>> + struct sun8i_ths_type *typ=
e;=0A>> + struct reset_control *reset;=0A>> + struct clk *clk;=0A>> + str=
uct clk *busclk;=0A>> + void __iomem *regs;=0A>> + struct nvmem_cell *cal=
cell;=0A>> + struct platform_device *pdev;=0A>> + struct thermal_zone_dev=
ice *tzd;=0A>> +};=0A>> +=0A>> +struct sun8i_ths_type {=0A>> + int (*init=
)(struct platform_device *, struct sun8i_ths_data *);=0A>> + int (*get_te=
mp)(struct sun8i_ths_data *, int *out);=0A>> + void (*irq)(struct sun8i_t=
hs_data *);=0A>> + void (*deinit)(struct sun8i_ths_data *);=0A>> +};=0A> =
=0A> AFAIK, you never got back on why it was actually needed, instead of=
=0A> directly calling these functions.=0A=0AIt is preparation for support=
ing the other SoCs with THS as they have=0Aslightly different register la=
youts and thus cannot be controlled by the=0Asame code.=0A=0A>> +/* Formu=
la and parameters from the Allwinner 3.4 kernel */=0A>> +static int sun8i=
_ths_reg_to_temperature(s32 reg, int divisor, int constant)=0A>> +{=0A>> =
+ return constant - (reg * 1000000) / divisor;=0A>> +}=0A>> +=0A>> +stati=
c int sun8i_ths_get_temp(void *_data, int *out)=0A>> +{=0A>> + struct sun=
8i_ths_data *data =3D _data;=0A>> +=0A>> + return data->type->get_temp(da=
ta, out);=0A>> +}=0A>> +=0A>> +static irqreturn_t sun8i_ths_irq_thread(in=
t irq, void *_data)=0A>> +{=0A>> + struct sun8i_ths_data *data =3D _data;=
=0A>> +=0A>> + data->type->irq(data);=0A>> + thermal_zone_device_update(d=
ata->tzd);=0A>> +=0A>> + return IRQ_HANDLED;=0A>> +}=0A>> +=0A>> +static =
int sun8i_ths_h3_init(struct platform_device *pdev,=0A>> + struct sun8i_t=
hs_data *data)=0A>> +{=0A>> + int ret;=0A>> + size_t callen;=0A>> + s32 *=
caldata;=0A>> +=0A>> + data->busclk =3D devm_clk_get(&pdev->dev, "ahb");=
=0A>> + if (IS_ERR(data->busclk)) {=0A>> + ret =3D PTR_ERR(data->busclk);=
=0A>> + dev_err(&pdev->dev, "failed to get ahb clk: %d\n", ret);=0A>> + r=
eturn ret;=0A>> + }=0A>> +=0A>> + data->clk =3D devm_clk_get(&pdev->dev, =
"ths");=0A>> + if (IS_ERR(data->clk)) {=0A>> + ret =3D PTR_ERR(data->clk)=
;=0A>> + dev_err(&pdev->dev, "failed to get ths clk: %d\n", ret);=0A>> + =
return ret;=0A>> + }=0A>> +=0A>> + data->reset =3D devm_reset_control_get=
(&pdev->dev, "ahb");=0A>> + if (IS_ERR(data->reset)) {=0A>> + ret =3D PTR=
_ERR(data->reset);=0A>> + dev_err(&pdev->dev, "failed to get reset: %d\n"=
, ret);=0A>> + return ret;=0A>> + }=0A>> +=0A>> + if (data->calcell) {=0A=
>> + caldata =3D nvmem_cell_read(data->calcell, &callen);=0A>> + if (IS_E=
RR(caldata))=0A>> + return PTR_ERR(caldata);=0A>> + writel(be32_to_cpu(*c=
aldata), data->regs + THS_H3_CDATA);=0A>> + kfree(caldata);=0A>> + }=0A>>=
 +=0A>> + ret =3D clk_prepare_enable(data->busclk);=0A>> + if (ret) {=0A>=
> + dev_err(&pdev->dev, "failed to enable bus clk: %d\n", ret);=0A>> + re=
turn ret;=0A>> + }=0A>> +=0A>> + ret =3D clk_prepare_enable(data->clk);=
=0A>> + if (ret) {=0A>> + dev_err(&pdev->dev, "failed to enable ths clk: =
%d\n", ret);=0A>> + goto err_disable_bus;=0A>> + }=0A>> +=0A>> + ret =3D =
reset_control_deassert(data->reset);=0A>> + if (ret) {=0A>> + dev_err(&pd=
ev->dev, "reset deassert failed: %d\n", ret);=0A>> + goto err_disable_ths=
;=0A>> + }=0A>> +=0A>> + /* The final sample period is calculated as foll=
ows:=0A>> + * (THERMAL_PER + 1) * 4096 / f_clk * 2^(FILTER_TYPE + 1)=0A>>=
 + *=0A>> + * This results to about 1Hz with these settings.=0A>> + */=0A=
>> + ret =3D clk_set_rate(data->clk, 4000000);=0A> =0A> I don't follow yo=
u here. You have a complicated math function, that=0A> has many input var=
iables, and then, you just set the clock rate to a=0A> constant?=0A=0AHow=
 should this be handled then? I guess the sampling rate could=0Abe set in=
 the device tree and then the values calculated, but none=0Aof the other =
thermal drivers seem to have configurable sample rate.=0A=0A>> + if (ret)=
=0A>> + goto err_disable_ths;=0A> =0A> A new line here please=0A> =0A>> +=
 writel(THS_H3_CTRL0_SENSOR_ACQ0(THS_H3_CTRL0_SENSOR_ACQ0_VALUE),=0A>> + =
data->regs + THS_H3_CTRL0);=0A>> + writel(THS_H3_INT_CTRL_THERMAL_PER(THS=
_H3_INT_CTRL_THERMAL_PER_VALUE) |=0A>> + THS_H3_INT_CTRL_DATA_IRQ_EN,=0A>=
> + data->regs + THS_H3_INT_CTRL);=0A>> + writel(THS_H3_FILTER_EN | THS_H=
3_FILTER_TYPE(THS_H3_FILTER_TYPE_VALUE),=0A>> + data->regs + THS_H3_FILTE=
R);=0A>> + writel(THS_H3_CTRL2_SENSOR_ACQ1(THS_H3_CTRL2_SENSOR_ACQ1_VALUE=
) |=0A>> + THS_H3_CTRL2_SENSE_EN,=0A>> + data->regs + THS_H3_CTRL2);=0A> =
=0A> And here too.=0A> =0A>> + return 0;=0A>> +=0A>> +err_disable_ths:=0A=
>> + clk_disable_unprepare(data->clk);=0A>> +err_disable_bus:=0A>> + clk_=
disable_unprepare(data->busclk);=0A>> +=0A>> + return ret;=0A>> +}=0A>> +=
=0A>> +static int sun8i_ths_h3_get_temp(struct sun8i_ths_data *data, int =
*out)=0A>> +{=0A>> + int val =3D readl(data->regs + THS_H3_DATA);=0A>> + =
*out =3D sun8i_ths_reg_to_temperature(val, 8253, 217000);=0A>> + return 0=
;=0A> =0A> Can't you just return the value directly?=0A=0AI did that in t=
he v1, clabbe.montjoie suggested to use temp variable to=0Aavoid column w=
rap.=0A=0A>> +}=0A>> +=0A>> +static void sun8i_ths_h3_irq(struct sun8i_th=
s_data *data)=0A>> +{=0A>> + writel(THS_H3_STAT_DATA_IRQ_STS |=0A>> + THS=
_H3_STAT_ALARM_INT_STS |=0A>> + THS_H3_STAT_ALARM_OFF_STS |=0A>> + THS_H3=
_STAT_SHUT_INT_STS,=0A>> + data->regs + THS_H3_STAT);=0A> =0A> So you're =
always clearing all the interrupts? Shouldn't you just clear=0A> only the=
 interrupt you received?=0A> =0A>> +}=0A>> +=0A>> +static void sun8i_ths_=
h3_deinit(struct sun8i_ths_data *data)=0A>> +{=0A>> + reset_control_asser=
t(data->reset);=0A>> + clk_disable_unprepare(data->clk);=0A>> + clk_disab=
le_unprepare(data->busclk);=0A>> +}=0A>> +=0A>> +static const struct ther=
mal_zone_of_device_ops sun8i_ths_thermal_ops =3D {=0A>> + .get_temp =3D s=
un8i_ths_get_temp,=0A>> +};=0A>> +=0A>> +static const struct sun8i_ths_ty=
pe sun8i_ths_device_h3 =3D {=0A>> + .init =3D sun8i_ths_h3_init,=0A>> + .=
get_temp =3D sun8i_ths_h3_get_temp,=0A>> + .irq =3D sun8i_ths_h3_irq,=0A>=
> + .deinit =3D sun8i_ths_h3_deinit,=0A>> +};=0A>> +=0A>> +static const s=
truct of_device_id sun8i_ths_id_table[] =3D {=0A>> + {=0A>> + .compatible=
 =3D "allwinner,sun8i-h3-ths",=0A>> + .data =3D &sun8i_ths_device_h3,=0A>=
> + },=0A>> + {=0A>> + /* sentinel */=0A>> + },=0A>> +};=0A>> +MODULE_DEV=
ICE_TABLE(of, sun8i_ths_id_table);=0A>> +=0A>> +static int sun8i_ths_prob=
e(struct platform_device *pdev)=0A>> +{=0A>> + struct device_node *np =3D=
 pdev->dev.of_node;=0A>> + const struct of_device_id *match;=0A>> + struc=
t sun8i_ths_data *data;=0A>> + struct resource *res;=0A>> + int ret;=0A>>=
 + int irq;=0A>> +=0A>> + match =3D of_match_node(sun8i_ths_id_table, np)=
;=0A> =0A> If you *really* need to (but I still don't really see why), yo=
u can=0A> use of_device_get_match_data here.=0A> =0A>> +=0A>> + data =3D =
devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);=0A>> + if (!data)=0A=
>> + return -ENOMEM;=0A>> +=0A>> + data->type =3D (struct sun8i_ths_type =
*)match->data;=0A>> + data->pdev =3D pdev;=0A>> +=0A>> + data->calcell =
=3D devm_nvmem_cell_get(&pdev->dev, "calibration");=0A>> + if (IS_ERR(dat=
a->calcell)) {=0A>> + if (PTR_ERR(data->calcell) =3D=3D -EPROBE_DEFER)=0A=
>> + return PTR_ERR(data->calcell);=0A> =0A> New line=0A> =0A>> + data->c=
alcell =3D NULL; /* No calibration register */=0A> =0A> s/register/data/ =
?=0A> =0A>> + }=0A>> +=0A>> + res =3D platform_get_resource(pdev, IORESOU=
RCE_MEM, 0);=0A>> + data->regs =3D devm_ioremap_resource(&pdev->dev, res)=
;=0A>> + if (IS_ERR(data->regs)) {=0A>> + ret =3D PTR_ERR(data->regs);=0A=
>> + dev_err(&pdev->dev,=0A>> + "failed to ioremap THS registers: %d\n", =
ret);=0A>> + return ret;=0A>> + }=0A>> +=0A>> + irq =3D platform_get_irq(=
pdev, 0);=0A>> + if (irq < 0) {=0A>> + dev_err(&pdev->dev, "failed to get=
 IRQ: %d\n", irq);=0A>> + return irq;=0A>> + }=0A>> +=0A>> + ret =3D devm=
_request_threaded_irq(&pdev->dev, irq, NULL,=0A>> + sun8i_ths_irq_thread,=
 IRQF_ONESHOT,=0A>> + dev_name(&pdev->dev), data);=0A> =0A> Why a threade=
d irq?=0A=0AI thought threaded IRQs are preferred? Other thermal drivers=
=0Ause them too. I am also not really sure thermal_zone_device_update()=
=0Acan even be called in interrupt context.=0A=0A>> + if (ret)=0A>> + ret=
urn ret;=0A>> +=0A>> + ret =3D data->type->init(pdev, data);=0A>> + if (r=
et)=0A>> + return ret;=0A>> +=0A>> + data->tzd =3D thermal_zone_of_sensor=
_register(&pdev->dev, 0, data,=0A>> + &sun8i_ths_thermal_ops);=0A>> + if =
(IS_ERR(data->tzd)) {=0A>> + ret =3D PTR_ERR(data->tzd);=0A>> + dev_err(&=
pdev->dev, "failed to register thermal zone: %d\n",=0A>> + ret);=0A>> + g=
oto err_deinit;=0A>> + }=0A>> +=0A>> + platform_set_drvdata(pdev, data);=
=0A>> + return 0;=0A>> +=0A>> +err_deinit:=0A>> + data->type->deinit(data=
);=0A>> + return ret;=0A>> +}=0A>> +=0A>> +static int sun8i_ths_remove(st=
ruct platform_device *pdev)=0A>> +{=0A>> + struct sun8i_ths_data *data =
=3D platform_get_drvdata(pdev);=0A>> +=0A>> + thermal_zone_of_sensor_unre=
gister(&pdev->dev, data->tzd);=0A>> + data->type->deinit(data);=0A>> + re=
turn 0;=0A>> +}=0A>> +=0A>> +static struct platform_driver sun8i_ths_driv=
er =3D {=0A>> + .probe =3D sun8i_ths_probe,=0A>> + .remove =3D sun8i_ths_=
remove,=0A>> + .driver =3D {=0A>> + .name =3D "sun8i_ths",=0A>> + .of_mat=
ch_table =3D sun8i_ths_id_table,=0A>> + },=0A>> +};=0A>> +=0A>> +module_p=
latform_driver(sun8i_ths_driver);=0A>> +=0A>> +MODULE_AUTHOR("Josef Gajdu=
sek <atx@atx.name>");=0A>> +MODULE_DESCRIPTION("Sunxi THS driver");=0A> =
=0A> Please change the description here too to match the header.=0A> =0A>=
 Thanks!=0A> Maxime=0A> =0A> --=0A> Maxime Ripard, Free Electrons=0A> Emb=
edded Linux, Kernel and Android engineering=0A> http://free-electrons.com=
=0A> =0A> --=0A> You received this message because you are subscribed to =
the Google Groups "linux-sunxi" group.=0A> To unsubscribe from this group=
 and stop receiving emails from it, send an email to=0A> linux-sunxi+unsu=
bscribe@googlegroups.com.=0A> For more options, visit https://groups.goog=
le.com/d/optout.=0A=0A=0AJosef Gajdusek <atx@atx.name>
