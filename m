Return-Path: <SRS0=HA4W=OO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68EBC04EBF
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 09:30:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DB34206B7
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 09:30:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="BG6mdKLh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DB34206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbeLEJaf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Dec 2018 04:30:35 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:2115 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbeLEJae (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Dec 2018 04:30:34 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c079ab90000>; Wed, 05 Dec 2018 01:30:33 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 05 Dec 2018 01:30:32 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 05 Dec 2018 01:30:32 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 5 Dec
 2018 09:30:30 +0000
Subject: Re: [PATCH 08/19] clk: tegra: dfll: round down voltages based on
 alignment
To:     Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-9-josephl@nvidia.com>
 <20181204154618.GC26056@pdeschrijver-desktop.Nvidia.com>
 <1cbe2662-1b5e-8261-f0c1-04a760cb08c1@nvidia.com>
 <7f90eae3-42fe-e771-b2f0-421c617db11e@nvidia.com>
 <20181205091114.GF26056@pdeschrijver-desktop.Nvidia.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <19fcd20b-74b0-f784-350d-4c4d0646265c@nvidia.com>
Date:   Wed, 5 Dec 2018 17:30:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181205091114.GF26056@pdeschrijver-desktop.Nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544002234; bh=kokaDane0y4QplccuTpfIIlds6uE+D//VfcGEhujjF0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=BG6mdKLhI/SH0qCXQkCJO0PKJgkcTBiuucz1+52ynVHEHS2b3zmk4RD5MH6IxMAdx
         OjLWD1IojVL6rJMi0u6zpoYjqxYJjqQN2NpQsiMorx24f5NyxQTzR+nqMtQgTEw/RW
         UWCF39m2rQejuGo93AfaW1oS3yk8Ew/01XTAo2bHwnM5IpaHQS/OSLeuESJdABD1s+
         WSWCSYeVZIuuV0ij1dKsemRDDi+yHukTVxzAsW8qEHrX+zYdpaUcrRD/bZq0pHuTT7
         CqZpsmgGBE8/K88uUi19s00Uz0FDZUhnUBzAQFA0LH8GcXSNRNtu/DtwwwnSKXeqvX
         Kn+RXiUYzjHiw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 12/5/18 5:11 PM, Peter De Schrijver wrote:
> On Wed, Dec 05, 2018 at 02:51:07PM +0800, Joseph Lo wrote:
>> On 12/5/18 2:20 PM, Joseph Lo wrote:
>>> On 12/4/18 11:46 PM, Peter De Schrijver wrote:
>>>> On Tue, Dec 04, 2018 at 05:25:37PM +0800, Joseph Lo wrote:
>>>>> When generating the OPP table, the voltages are round down with the
>>>>> alignment from the regulator. The alignment should be applied for
>>>>> voltages look up as well.
>>>>>
>>>>> Based on the work of Penny Chiu <pchiu@nvidia.com>.
>>>>>
>>>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>>>> ---
>>>>>  =C2=A0 drivers/clk/tegra/clk-dfll.c | 26 +++++++++++++++-----------
>>>>>  =C2=A0 1 file changed, 15 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfl=
l.c
>>>>> index c294a2989f31..4a943c136d4d 100644
>>>>> --- a/drivers/clk/tegra/clk-dfll.c
>>>>> +++ b/drivers/clk/tegra/clk-dfll.c
>>>>> @@ -804,17 +804,17 @@ static void dfll_init_out_if(struct
>>>>> tegra_dfll *td)
>>>>>  =C2=A0 static int find_lut_index_for_rate(struct tegra_dfll *td,
>>>>> unsigned long rate)
>>>>>  =C2=A0 {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pm_opp *opp;
>>>>> -=C2=A0=C2=A0=C2=A0 int i, uv;
>>>>> +=C2=A0=C2=A0=C2=A0 int i, align_volt;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opp =3D dev_pm_opp_find_freq_ceil(td-=
>soc->dev, &rate);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(opp))
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ER=
R(opp);
>>>>> -=C2=A0=C2=A0=C2=A0 uv =3D dev_pm_opp_get_voltage(opp);
>>>>> +=C2=A0=C2=A0=C2=A0 align_volt =3D dev_pm_opp_get_voltage(opp) /
>>>>> td->soc->alignment.step_uv;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_pm_opp_put(opp);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D td->lut_bottom; i < td->lu=
t_size; i++) {
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (regulator_list_voltag=
e(td->vdd_reg, td->lut[i]) =3D=3D uv)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((td->lut_uv[i] / td->=
soc->alignment.step_uv) >=3D align_volt)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return i;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> @@ -1532,15 +1532,17 @@ static int dfll_init(struct tegra_dfll *td)
>>>>>  =C2=A0=C2=A0 */
>>>>
>>>> These 2 functions are only valid for I2C mode. We should probably add =
a
>>>> WARN_ON() in case they are called when PWM mode is used and return
>>>> -EINVAL.
>>>>
>>>
>>> Okay, will add that.
>>>
>> Peter,
>>
>> Sorry, just double check again. These 2 functions are used for generatin=
g
>> LUT table for DFLL-I2C mode. They are only used in "dfll_build_i2c_lut"
>> function. So I think it's fine. The WARN_ON for protection from PWM mode=
 is
>> not necessary.
>>
>=20
> They are indeed not used today, but to prevent them from being used in
> the future I was thinking it makes sense to add some form of protection
> here.

Okay, will add one more patch for that. Thanks.

>=20
> Peter.
>=20
>>
>>>
>>>>>  =C2=A0 static int find_vdd_map_entry_exact(struct tegra_dfll *td, in=
t uV)
>>>>>  =C2=A0 {
>>>>> -=C2=A0=C2=A0=C2=A0 int i, n_voltages, reg_uV;
>>>>> +=C2=A0=C2=A0=C2=A0 int i, n_voltages, reg_volt, align_volt;
>>>>> +=C2=A0=C2=A0=C2=A0 align_volt =3D uV / td->soc->alignment.step_uv;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n_voltages =3D regulator_count_voltag=
es(td->vdd_reg);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < n_voltages; i++) {
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg_uV =3D regulator_list=
_voltage(td->vdd_reg, i);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (reg_uV < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg_volt =3D regulator_li=
st_voltage(td->vdd_reg, i) /
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 td->soc->alignment.step_uv;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (reg_volt < 0)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 break;
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (uV =3D=3D reg_uV)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (align_volt =3D=3D reg=
_volt)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return i;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> @@ -1554,15 +1556,17 @@ static int
>>>>> find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
>>>>>  =C2=A0=C2=A0 * */
>>>>>  =C2=A0 static int find_vdd_map_entry_min(struct tegra_dfll *td, int =
uV)
>>>>>  =C2=A0 {
>>>>> -=C2=A0=C2=A0=C2=A0 int i, n_voltages, reg_uV;
>>>>> +=C2=A0=C2=A0=C2=A0 int i, n_voltages, reg_volt, align_volt;
>>>>> +=C2=A0=C2=A0=C2=A0 align_volt =3D uV / td->soc->alignment.step_uv;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n_voltages =3D regulator_count_voltag=
es(td->vdd_reg);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < n_voltages; i++) {
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg_uV =3D regulator_list=
_voltage(td->vdd_reg, i);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (reg_uV < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg_volt =3D regulator_li=
st_voltage(td->vdd_reg, i) /
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 td->soc->alignment.step_uv;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (reg_volt < 0)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 break;
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (uV <=3D reg_uV)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (align_volt <=3D reg_v=
olt)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return i;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> --=20
>>>>> 2.19.2
>>>>>
