Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC77FC67839
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 10:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A706C208E7
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 10:00:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="MQPiB4Ac"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A706C208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbeLNKAT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 05:00:19 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:6708 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbeLNKAT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Dec 2018 05:00:19 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c137f2b0000>; Fri, 14 Dec 2018 02:00:11 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 14 Dec 2018 02:00:16 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 14 Dec 2018 02:00:16 -0800
Received: from [10.26.11.153] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 14 Dec
 2018 10:00:14 +0000
Subject: Re: [PATCH V2 08/21] clk: tegra: dfll: round down voltages based on
 alignment
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-9-josephl@nvidia.com>
 <c1ce50e0-fccf-aa37-361c-4dd9367b092d@nvidia.com>
 <b9f473fc-d1e8-6d80-be20-d9884960dc16@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c2aac384-e892-9c17-a58a-0e0f52ee0901@nvidia.com>
Date:   Fri, 14 Dec 2018 10:00:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <b9f473fc-d1e8-6d80-be20-d9884960dc16@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544781611; bh=wpYoAmY+SqAKLOvmf9mEQ56GYzo6rZBE3LACJDn04RA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=MQPiB4AcTv7dQnPkeevTKdwRBUiB1egr4KuposqHkJUj5cl+Jrvelvc411wFd7myI
         A4Bh95KqXH7PQcIHyHy7x1AFULtTj8t3mWCZLh1FZgNb/umYKE5yYr+Ovwcx84gP9l
         6jPNXVnPuOIOwvc5NEEzT/vxtcHqqGXaOGW9eDF+HsRBPtUkaBTRGwEbGgXVPuwD6P
         BxY0vSeScq882LlmWONHSaplhYi5Swcie3CELEQtZOx2fAEsQ5j6sUdAnZFn9hkFfc
         puLZ9Bv+0Nym27CVcRYWpysL2k293hd31/NVxCOSfbNkkiSzCQgTy1F3KhnxqqA2Gz
         NnStcSYmdsvtQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 14/12/2018 07:18, Joseph Lo wrote:
> On 12/13/18 7:46 PM, Jon Hunter wrote:
>>
>> On 13/12/2018 09:34, Joseph Lo wrote:
>>> When generating the OPP table, the voltages are round down with the
>>> alignment from the regulator. The alignment should be applied for
>>> voltages look up as well.
>>>
>>> Based on the work of Penny Chiu <pchiu@nvidia.com>.
>>>
>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>> ---
>>> *V2:
>>> =C2=A0 - s/align_volt/align_step/
>>> =C2=A0 - s/reg_volt/reg_volt_id/
>>> ---
>>> =C2=A0 drivers/clk/tegra/clk-dfll.c | 26 +++++++++++++++-----------
>>> =C2=A0 1 file changed, 15 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.=
c
>>> index 72e02898006c..b3668073d9b4 100644
>>> --- a/drivers/clk/tegra/clk-dfll.c
>>> +++ b/drivers/clk/tegra/clk-dfll.c
>>> @@ -804,17 +804,17 @@ static void dfll_init_out_if(struct tegra_dfll
>>> *td)
>>> =C2=A0 static int find_lut_index_for_rate(struct tegra_dfll *td, unsign=
ed
>>> long rate)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pm_opp *opp;
>>> -=C2=A0=C2=A0=C2=A0 int i, uv;
>>> +=C2=A0=C2=A0=C2=A0 int i, align_step;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opp =3D dev_pm_opp_find_freq_ceil=
(td->soc->dev, &rate);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(opp))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(o=
pp);
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 uv =3D dev_pm_opp_get_voltage(opp);
>>> +=C2=A0=C2=A0=C2=A0 align_step =3D dev_pm_opp_get_voltage(opp) /
>>> td->soc->alignment.step_uv;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_pm_opp_put(opp);
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D td->lut_bottom; i < td=
->lut_size; i++) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (td->lut_uv[i] >=3D uv)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((td->lut_uv[i] / td->so=
c->alignment.step_uv) >=3D align_step)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return i;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 @@ -1532,15 +1532,17 @@ static int dfll_init(struct tegra_dfll *=
td)
>>> =C2=A0=C2=A0 */
>>> =C2=A0 static int find_vdd_map_entry_exact(struct tegra_dfll *td, int u=
V)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 int i, n_voltages, reg_uV;
>>> +=C2=A0=C2=A0=C2=A0 int i, n_voltages, reg_volt_id, align_step;
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 align_step =3D uV / td->soc->alignment.step_=
uv;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n_voltages =3D regulator_count_voltages(=
td->vdd_reg);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < n_voltages; i++) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg_uV =3D regulator_list_v=
oltage(td->vdd_reg, i);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (reg_uV < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg_volt_id =3D regulator_l=
ist_voltage(td->vdd_reg, i) /
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 td->soc->alignment.step_uv;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (reg_volt_id < 0)
>>
>> I don't think that this will work. If the step is say 10000 and we
>> return an error code greater than -10000, we will end up with 0.
>=20
> Ah,I think you mean when the error code smaller than step_uv. Yes, it
> will be 0 in that case. I think I will just remove the 'if' clause, then
> it will not match anything and leave the for loop. And return error if
> it couldn't find anything. Same as below.

Looks like if you remove the if clause then if will try to look up
another voltage. Seems to me that we should just break out the loop on
the first failure as it does today.

Cheers
Jon
--=20
nvpublic
