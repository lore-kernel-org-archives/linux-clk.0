Return-Path: <SRS0=g5s0=TP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB97C04E53
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 08:42:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 61D532082E
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 08:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="FIuXRldT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfEOImT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 May 2019 04:42:19 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7534 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfEOImS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 May 2019 04:42:18 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdbd0c00000>; Wed, 15 May 2019 01:41:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 15 May 2019 01:42:16 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 15 May 2019 01:42:16 -0700
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 May
 2019 08:42:14 +0000
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
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <648df201-eb63-6d26-3f90-02eba7624921@nvidia.com>
Date:   Wed, 15 May 2019 16:42:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <74fad66b-a6e9-ffc9-c1c9-e88b841e9209@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557909696; bh=C7xXcozLI+jx0KXwiuZAkErgLLPLVV+AR0ujYOyyXbk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=FIuXRldTF38OabLIO5+oGDEtJRdXzfSj+3ZspsMc0mvDAWhSUNGSsQp7uIz2NrMw4
         5nL2LvEdE5K6Uv/fV5w9oOCNRAJYFYnMVc9eBC0ugbXlAMk/Usl7NztCN64YYv8NVa
         Y9+eLoHaiK4eUlqHMkZk/lCgEuM2RpeSRcL+93ql+gtZ67wfn+XemzaV5SI/Pe1JDH
         DwAIWBddYAID5jkD7lB6FC1dK+ikb4sqpzS6EtGUiQ6+ldGnl8lmmMCMO+NnYSEPo7
         Ymwr91ofwCDF4vKjINTXUFXjV7JJU/Tu3Yo8Ki/tr56x0ydP6idWni4hDZPdSgwOl+
         plTaFBVtVqDRQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/15/19 1:04 AM, Dmitry Osipenko wrote:
> 10.05.2019 11:47, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This is the initial patch for Tegra210 EMC clock driver, which doesn't
>> include the support code and detail sequence for clock scaling yet.
>>
>> The driver is designed to support LPDDR4 SDRAM. Because of the LPDDR4
>> devices need to do initial time training before it can be used, the
>> firmware will help to do that at early boot stage. Then, the trained
>> table for the rates we support will pass to the kernel via DT. So the
>> driver can get the trained table for clock scaling support.
>>
>> For the higher rate support (above 800MHz), the periodic training is
>> needed for the timing compensation. So basically, two methodologies for
>> clock scaling are supported, one is following the clock changing
>> sequence to update the EMC table to EMC registers and another is if the
>> rate needs periodic training, then we will start a timer to do that
>> periodically until it scales to the lower rate.
>>
>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>=20
> [snip]
>=20
>> +static int tegra210_emc_probe(struct platform_device *pdev)
>> +{
>> +	int i;
>> +	unsigned long table_rate;
>> +	unsigned long current_rate;
>> +	struct device_node *np;
>> +	struct platform_device *mc;
>> +	struct tegra_emc *emc;
>> +	struct clk_init_data init;
>> +	struct clk *clk;
>> +	struct resource *r, res;
>> +	void *table_addr;
>> +
>> +	emc =3D devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
>> +	if (!emc)
>> +		return -ENOMEM;
>> +
>> +	np =3D of_parse_phandle(pdev->dev.of_node, "nvidia,memory-controller",=
 0);
>> +	if (!np) {
>> +		dev_err(&pdev->dev, "could not get memory controller\n");
>> +		return -ENOENT;
>> +	}
>> +
>> +	mc =3D of_find_device_by_node(np);
>> +	of_node_put(np);
>> +	if (!mc)
>> +		return -ENOENT;
>> +
>> +	emc->mc =3D platform_get_drvdata(mc);
>> +	if (!emc->mc)
>> +		return -EPROBE_DEFER;
>> +
>> +	emc->ram_code =3D tegra_read_ram_code();
>=20
> emc->ram_code isn't used anywhere in the code.
>=20
> I haven't checked other fields. Please remove everything that is unused.

Good catch, I missed this when clean up the code for V3.

>=20
>> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	emc->emc_base[REG_EMC] =3D devm_ioremap_resource(&pdev->dev, r);
>> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
>> +	emc->emc_base[REG_EMC0] =3D devm_ioremap_resource(&pdev->dev, r);
>> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 2);
>> +	emc->emc_base[REG_EMC1] =3D devm_ioremap_resource(&pdev->dev, r);
>=20
> Use devm_platform_ioremap_resource().
>=20
>> +	for (i =3D 0; i < TEGRA_EMC_SRC_COUNT; i++) {
>> +		emc_src[i] =3D devm_clk_get(&pdev->dev,
>> +						emc_src_names[i]);
>> +		if (IS_ERR(emc_src[i])) {
>> +			dev_err(&pdev->dev, "Can not find EMC source clock\n");
>> +			return -ENODATA;
>> +		}
>> +	}
>> +
>> +	np =3D of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
>> +	if (!np) {
>> +		dev_err(&pdev->dev, "could not find EMC table\n");
>> +		goto emc_clk_register;
>> +	}
>> +
>> +	if (!of_device_is_compatible(np, "nvidia,tegra210-emc-table") ||
>> +	    !of_device_is_available(np)) {
>> +		dev_err(&pdev->dev, "EMC table is invalid\n");
>> +		goto emc_clk_register;
>> +	}
>> +
>> +	of_address_to_resource(np, 0, &res);
>> +	table_addr =3D memremap(res.start, resource_size(&res), MEMREMAP_WB);
>> +	of_node_put(np);
>> +	if (!table_addr) {
>> +		dev_err(&pdev->dev, "could not map EMC table\n");
>> +		goto emc_clk_register;
>> +	}
>> +	emc->emc_table =3D (struct emc_table *)table_addr;
>> +
>> +	for (i =3D 0; i < TEGRA_EMC_MAX_FREQS; i++)
>> +		if (emc->emc_table[i].rev !=3D 0)
>> +			emc->emc_table_size++;
>> +		else
>> +			break;
>> +
>> +	/* Init EMC rate statistic data */
>> +	emc_stats.clkchange_count =3D 0;
>> +	spin_lock_init(&emc_stats.spinlock);
>> +	emc_stats.last_update =3D get_jiffies_64();
>> +	emc_stats.last_sel =3D TEGRA_EMC_MAX_FREQS;
>> +
>> +	/* Check the supported sequence */
>> +	while (seq->table_rev) {
>> +		if (seq->table_rev =3D=3D emc->emc_table[0].rev)
>> +			break;
>> +		seq++;
>> +	}
>> +	if (!seq->set_clock) {
>> +		seq =3D NULL;
>> +		dev_err(&pdev->dev, "Invalid EMC sequence for table Rev. %d\n",
>> +			emc->emc_table[0].rev);
>> +		goto emc_clk_register;
>=20
> Why do you want to register EMC clock if something fails? KMSG will be
> flooded with errors coming from clk_set_rate.
>=20

See patch 7 in the series, the legacy EMC clock will be removed later,=20
so we need to register the EMC clock whether the table is ready or not.=20
In that case, I mean if the table is not available, it will still=20
register EMC clock at the rate that boot loader configured before kernel=20
booting. So the MC clock can still work as expected, which is under EMC=20
clock.

And I did test that, couldn't observe any KMSG in that case.

Thanks,
Joseph
