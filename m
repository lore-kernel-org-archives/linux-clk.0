Return-Path: <SRS0=duwI=TQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B050CC04AB4
	for <linux-clk@archiver.kernel.org>; Thu, 16 May 2019 07:52:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80F562087B
	for <linux-clk@archiver.kernel.org>; Thu, 16 May 2019 07:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="QRZhD9Ta"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfEPHwP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 May 2019 03:52:15 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7671 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfEPHwO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 May 2019 03:52:14 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdd16840000>; Thu, 16 May 2019 00:51:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 16 May 2019 00:52:13 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 16 May 2019 00:52:13 -0700
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 07:52:10 +0000
Subject: Re: [PATCH V3 4/8] memory: tegra: Add Tegra210 EMC clock driver
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-5-josephl@nvidia.com>
 <74fad66b-a6e9-ffc9-c1c9-e88b841e9209@gmail.com>
 <648df201-eb63-6d26-3f90-02eba7624921@nvidia.com>
 <bb2ef045-7d77-02d0-79fb-06f68732c5a5@gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <3afd909c-5be9-370d-e21a-ec57be3b841b@nvidia.com>
Date:   Thu, 16 May 2019 15:52:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bb2ef045-7d77-02d0-79fb-06f68732c5a5@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557993092; bh=4tYXVDno4KsskhiP9PdJy8YJDFFqRr5SFW0KndO/iBM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=QRZhD9TaVAD5dOHju+CIHeSqirBQ/Ulz15Kk2FmIblanfUyxPeO4afRI+aW6v0jEC
         4mxyRVNhhrUOeeW2FTTBVHxKDgWR1UjBsWpWjweH+mpnTomFW1GT6eUxsHonzQOXPL
         EJfoDq+3orBP52QP16A795sbIOXBv1uiXV1xuOOLmrEX9mHLtNe2CB0b70vh6oAJ0P
         ZPHe5B+st3dHfzcihktR40rHrR19xKpi53zkIZEhxI9g4nc4UAgitud94aI3vgkT9t
         UKvCgne+FM3dGLU4H4wdr/wG03I+3ZphrW2ugU6f8T6IMeJPWKV2anjGhs4qhWm/l1
         F2wt+FurGu0QA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/15/19 11:25 PM, Dmitry Osipenko wrote:
> 15.05.2019 11:42, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 5/15/19 1:04 AM, Dmitry Osipenko wrote:
>>> 10.05.2019 11:47, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> This is the initial patch for Tegra210 EMC clock driver, which doesn't
>>>> include the support code and detail sequence for clock scaling yet.
>>>>
>>>> The driver is designed to support LPDDR4 SDRAM. Because of the LPDDR4
>>>> devices need to do initial time training before it can be used, the
>>>> firmware will help to do that at early boot stage. Then, the trained
>>>> table for the rates we support will pass to the kernel via DT. So the
>>>> driver can get the trained table for clock scaling support.
>>>>
>>>> For the higher rate support (above 800MHz), the periodic training is
>>>> needed for the timing compensation. So basically, two methodologies fo=
r
>>>> clock scaling are supported, one is following the clock changing
>>>> sequence to update the EMC table to EMC registers and another is if th=
e
>>>> rate needs periodic training, then we will start a timer to do that
>>>> periodically until it scales to the lower rate.
>>>>
>>>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>>>
>>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>>> ---
snip.
>>>> +=C2=A0=C2=A0=C2=A0 if (!seq->set_clock) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 seq =3D NULL;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&pdev->dev, "Inval=
id EMC sequence for table Rev. %d\n",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 em=
c->emc_table[0].rev);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto emc_clk_register;
>>>
>>> Why do you want to register EMC clock if something fails? KMSG will be
>>> flooded with errors coming from clk_set_rate.
>>>
>>
>> See patch 7 in the series, the legacy EMC clock will be removed later,
>> so we need to register the EMC clock whether the table is ready or not> =
In that case, I mean if the table is not available, it will still
>> register EMC clock at the rate that boot loader configured before kernel
>> booting. So the MC clock can still work as expected, which is under EMC
>> clock.
>>
>> And I did test that, couldn't observe any KMSG in that case.
>=20
> Looks like it kinda should work in the end.
>=20
> Although it's not good that now MC driver relies on the EMC driver
> presence. Maybe it's not the best variant with moving the clock stuff
> into the EMC driver?
>=20
> What about the backwards compatibility for DT that doesn't have the EMC
> node?
>=20
> What if EMC driver is disabled in the kernel's config?

The three questions above are actually one problem here. It's not about=20
MC clock, because it's still available after these changes. And MC=20
driver can still get it in the probe function even the EMC driver isn't=20
there.

The problem is that without EMC driver after these changes. The PLLM=20
will have no client under it, which will cause the PLLM to be disabled=20
in the late init call of "clk_disable_unused". So the system will be stuck.

>=20
> And lastly.. what stops the MC driver to probe before the EMC? Looks
> like MC driver is already in trouble because it's on arch level and the
> EMC is on subsys, hence MC will get the orphaned clock and won't
> initialize hardware properly on probe.

After this moving, the EMC driver will be always enabled by default. And=20
the DT change is necessary as well. The blob of EMC table is not=20
necessary, because it needs a firmware update. We will update the=20
firmware accordingly after the review settled and release it later.

In case of no EMC table blob, the driver can still be registered, but no=20
scaling function provided.

>=20
> BTW, how are you testing the EMC driver? Is there T210 devfreq patches
> in works? Or what's the user of the EMC on T210?
>=20

1. Currently, via debugfs.
2. No, we prefer to use Interconnect framework for that. The evaluation=20
is ongoing.
3. With Interconnect, the devices or peripherals can register on it to=20
request the BW. So we can fine-tune the BW requirements with the latency=20
allowance registers altogether to get better efficiency.

Thanks,
Joseph
