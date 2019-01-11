Return-Path: <SRS0=xK8l=PT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B699C43387
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 08:14:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F96A2084C
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 08:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="QovjwM4Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730108AbfAKIOi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jan 2019 03:14:38 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9356 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbfAKIOh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Jan 2019 03:14:37 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c3850510000>; Fri, 11 Jan 2019 00:14:09 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 11 Jan 2019 00:14:35 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 11 Jan 2019 00:14:35 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 11 Jan
 2019 08:14:33 +0000
Subject: Re: [PATCH V4 01/20] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190104030702.8684-1-josephl@nvidia.com>
 <20190104030702.8684-2-josephl@nvidia.com>
 <142f619f-9939-0d87-9fe7-2e72efa027a0@nvidia.com>
Message-ID: <74087bd9-1cc4-9897-9ded-81eaa9ca434b@nvidia.com>
Date:   Fri, 11 Jan 2019 16:14:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <142f619f-9939-0d87-9fe7-2e72efa027a0@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1547194449; bh=4R0QJ6PW6nMd9ERm2Bhc4cHql+uaH5yq/rJ6HYDjGhA=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=QovjwM4Yb/YhuX6etuQ4FV5AY68zdYuPi9IQQWLzaqjKn73jZXnNAwM89sx6uDE6V
         6A9A+x2ZIvA4YNnl1y+HUIWmjCDDKm7Rv2OrbWtVGiqx2vz6AV/aRJfzURw40n0/Mn
         Myn0lpHAHP78sjAq6c1B7usd/6GMO0FN+ZSg0UApZTrQQiYImvEXZtbuVaDt50mJeH
         J5yOB8BMKZn6FyUFmjDnixaJEGx0kQXV0RmjxXLrPZ55Ik7qG2YbO7JfkULVqnbYOs
         38wtIuzizwlIuympEDlsx+ZY65Rl797B3KONTe4E4UOSFx/CnMtqGhTpRWipjWfm4u
         GUremcEgMixxQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/8/19 8:35 AM, Joseph Lo wrote:
> On 1/4/19 11:06 AM, Joseph Lo wrote:
>> From: Peter De Schrijver <pdeschrijver@nvidia.com>
>>
>> Add new properties to configure the DFLL PWM regulator support.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> Acked-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> *V4:
>> =C2=A0 - s/nvidia,pwm-period/nvidia,pwm-period-nanoseconds/
>> *V3:
>> =C2=A0 - no change
>> *V2:
>> =C2=A0 - update the binding strings and descriptions for
>> =C2=A0 nvidia,pwm-tristate-microvolts
>> =C2=A0 nvidia,pwm-min-microvolts
>> =C2=A0 nvidia,pwm-voltage-step-microvolts
>> ---
>=20
> Hi Rob,
>=20
> Could you help me to review this patch again?

Gentle ping.

Thanks,
Joseph

>=20
> Thanks,
> Joseph
>=20
>> =C2=A0 .../bindings/clock/nvidia,tegra124-dfll.txt=C2=A0=C2=A0 | 79 ++++=
++++++++++++++-
>> =C2=A0 1 file changed, 77 insertions(+), 2 deletions(-)
>>
>> diff --git=20
>> a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt=20
>> b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>> index dff236f524a7..5558bb5fcf2c 100644
>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>> @@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running=20
>> voltage controlled
>> =C2=A0 oscillator connected to the CPU voltage rail (VDD_CPU), and a clo=
sed=20
>> loop
>> =C2=A0 control module that will automatically adjust the VDD_CPU voltage=
 by
>> =C2=A0 communicating with an off-chip PMIC either via an I2C bus or via =
PWM=20
>> signals.
>> -Currently only the I2C mode is supported by these bindings.
>> =C2=A0 Required properties:
>> =C2=A0 - compatible : should be "nvidia,tegra124-dfll"
>> @@ -45,10 +44,31 @@ Required properties for the control loop parameters:
>> =C2=A0 Optional properties for the control loop parameters:
>> =C2=A0 - nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SC=
ALE=20
>> in the TRM.
>> +Optional properties for mode selection:
>> +- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
>> +
>> =C2=A0 Required properties for I2C mode:
>> =C2=A0 - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode=
.
>> -Example:
>> +Required properties for PWM mode:
>> +- nvidia,pwm-period-nanoseconds: period of PWM square wave in=20
>> nanoseconds.
>> +- nvidia,pwm-tristate-microvolts: Regulator voltage in micro volts=20
>> when PWM
>> +=C2=A0 control is disabled and the PWM output is tristated. Note that t=
his=20
>> voltage is
>> +=C2=A0 configured in hardware, typically via a resistor divider.
>> +- nvidia,pwm-min-microvolts: Regulator voltage in micro volts when=20
>> PWM control
>> +=C2=A0 is enabled and PWM output is low. Hence, this is the minimum out=
put=20
>> voltage
>> +=C2=A0 that the regulator supports when PWM control is enabled.
>> +- nvidia,pwm-voltage-step-microvolts: Voltage increase in micro volts
>> +=C2=A0 corresponding to a 1/33th increase in duty cycle. Eg the voltage=
=20
>> for 2/33th
>> +=C2=A0 duty cycle would be: nvidia,pwm-min-microvolts +
>> +=C2=A0 nvidia,pwm-voltage-step-microvolts * 2.
>> +- pinctrl-0: I/O pad configuration when PWM control is enabled.
>> +- pinctrl-1: I/O pad configuration when PWM control is disabled.
>> +- pinctrl-names: must include the following entries:
>> +=C2=A0 - dvfs_pwm_enable: I/O pad configuration when PWM control is ena=
bled.
>> +=C2=A0 - dvfs_pwm_disable: I/O pad configuration when PWM control is=20
>> disabled.
>> +
>> +Example for I2C:
>> =C2=A0 clock@70110000 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "n=
vidia,tegra124-dfll";
>> @@ -76,3 +96,58 @@ clock@70110000 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvidia,i2c-fs-rat=
e =3D <400000>;
>> =C2=A0 };
>> +
>> +Example for PWM:
>> +
>> +clock@70110000 {
>> +=C2=A0=C2=A0=C2=A0 compatible =3D "nvidia,tegra124-dfll";
>> +=C2=A0=C2=A0=C2=A0 reg =3D <0 0x70110000 0 0x100>, /* DFLL control */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0 0x70110000 0 =
0x100>, /* I2C output control */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0 0x70110100 0 =
0x100>, /* Integrated I2C controller */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0 0x70110200 0 =
0x100>; /* Look-up table RAM */
>> +=C2=A0=C2=A0=C2=A0 interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
>> +=C2=A0=C2=A0=C2=A0 clocks =3D <&tegra_car TEGRA210_CLK_DFLL_SOC>,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <&tegra_car TEGRA210_CLK_DFLL_REF>,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&tegra_car TEGRA124_C=
LK_I2C5>;;
>> +=C2=A0=C2=A0=C2=A0 clock-names =3D "soc", "ref", "i2c";
>> +=C2=A0=C2=A0=C2=A0 resets =3D <&tegra_car TEGRA124_RST_DFLL_DVCO>;
>> +=C2=A0=C2=A0=C2=A0 reset-names =3D "dvco";
>> +=C2=A0=C2=A0=C2=A0 #clock-cells =3D <0>;
>> +=C2=A0=C2=A0=C2=A0 clock-output-names =3D "dfllCPU_out";
>> +
>> +=C2=A0=C2=A0=C2=A0 nvidia,sample-rate =3D <25000>;
>> +=C2=A0=C2=A0=C2=A0 nvidia,droop-ctrl =3D <0x00000f00>;
>> +=C2=A0=C2=A0=C2=A0 nvidia,force-mode =3D <1>;
>> +=C2=A0=C2=A0=C2=A0 nvidia,cf =3D <6>;
>> +=C2=A0=C2=A0=C2=A0 nvidia,ci =3D <0>;
>> +=C2=A0=C2=A0=C2=A0 nvidia,cg =3D <2>;
>> +
>> +=C2=A0=C2=A0=C2=A0 nvidia,pwm-min-microvolts =3D <708000>; /* 708mV */
>> +=C2=A0=C2=A0=C2=A0 nvidia,pwm-period-nanoseconds =3D <2500>; /* 2.5us *=
/
>> +=C2=A0=C2=A0=C2=A0 nvidia,pwm-to-pmic;
>> +=C2=A0=C2=A0=C2=A0 nvidia,pwm-tristate-microvolts =3D <1000000>;
>> +=C2=A0=C2=A0=C2=A0 nvidia,pwm-voltage-step-microvolts =3D <19200>; /* 1=
9.2mV */
>> +
>> +=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "dvfs_pwm_enable", "dvfs_pwm_disab=
le";
>> +=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&dvfs_pwm_active_state>;
>> +=C2=A0=C2=A0=C2=A0 pinctrl-1 =3D <&dvfs_pwm_inactive_state>;
>> +};
>> +
>> +/* pinmux nodes added for completeness. Binding doc can be found in:
>> + * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
>> + */
>> +
>> +pinmux: pinmux@700008d4 {
>> +=C2=A0=C2=A0=C2=A0 dvfs_pwm_active_state: dvfs_pwm_active {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dvfs_pwm_pbb1 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvid=
ia,pins =3D "dvfs_pwm_pbb1";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvid=
ia,tristate =3D <TEGRA_PIN_DISABLE>;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0 dvfs_pwm_inactive_state: dvfs_pwm_inactive {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dvfs_pwm_pbb1 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvid=
ia,pins =3D "dvfs_pwm_pbb1";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvid=
ia,tristate =3D <TEGRA_PIN_ENABLE>;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0 };
>> +};
>>
