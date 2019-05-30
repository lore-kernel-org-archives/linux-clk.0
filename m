Return-Path: <SRS0=/AGb=T6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B96C28CC0
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 02:45:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9880B24446
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 02:45:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="VYy3Fv7X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfE3CpJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 May 2019 22:45:09 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9825 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfE3CpI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 22:45:08 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cef43b10000>; Wed, 29 May 2019 19:45:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 May 2019 19:45:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 May 2019 19:45:06 -0700
Received: from [10.19.108.132] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 May
 2019 02:45:03 +0000
Subject: Re: [PATCH V4 4/8] memory: tegra: Add Tegra210 EMC clock driver
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-5-josephl@nvidia.com>
 <403181d4-100b-679e-b1d8-c052c6d1f3ac@gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <2f9722b4-df92-546b-9659-3b02768bbe41@nvidia.com>
Date:   Thu, 30 May 2019 10:45:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <403181d4-100b-679e-b1d8-c052c6d1f3ac@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559184305; bh=X81QZH04L/9VwJkBELPZ7Robj6X5rUPnGeUKzjJL0b4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=VYy3Fv7XH8DpzAaD+mTxdoLpSnr31ONSTg+14nw5CQ7BCnTPgzW2oDFImT4sg06dW
         VetDx8WwpXfvU2YK8rQLsJHW8lTUClcJaPl3Bkdk8h/PvNLDfV/ixNGReewyFP+s5A
         M/uDa+kcVbU9xFhRsF5mVydroui/0B9Py/J+cz5PNwOKgDeq7C0xPPfjtHYVx1TNDP
         y+CQzEMgA0EXJRmC6peOYFe518Ys0x5Icxc34dhRRjKgrGIy/lroNcDHjx1PXdQ9BP
         amz8V9A/Zpwii/HaIzBXvwXdOKijcM/IvP3sJtUP1cffiUqzFr/IByt2z/ftwbxrc7
         yaOPamiQ2CT2g==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/29/19 9:26 PM, Dmitry Osipenko wrote:
> 29.05.2019 11:21, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This is the initial patch for Tegra210 EMC clock driver, which doesn't
>> include the support code and detail sequence for clock scaling yet.
>>
>> The driver is designed to support LPDDR4 SDRAM. Because of the LPDDR4
>> devices need to do initial time training before it can be used, the
>> firmware will help to do that at early boot stage. Then, the trained
>> table of the rates we support will pass to the kernel via DT. So the
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
>> v4:
>> - remove the statistic data in debugfs
>> - add tegra210_clk_register_emc API to make it compatible with the case
>>    if the kernel still uses the older DTB which doesn't have EMC node.
>>    And the MC and EMC clock can still be registered successfully.
>> v3:
>> - address almost all the comments from the previous version
>> - remove the DT parser of EMC table
>> - The EMC table is passing as a binary blob now.
>> ---
>>   drivers/memory/tegra/Kconfig        |  10 +
>>   drivers/memory/tegra/Makefile       |   1 +
>>   drivers/memory/tegra/tegra210-emc.c | 671 ++++++++++++++++++++++++++++
>>   drivers/memory/tegra/tegra210-emc.h | 156 +++++++
>>   include/soc/tegra/emc.h             |   2 +
>>   5 files changed, 840 insertions(+)
>>   create mode 100644 drivers/memory/tegra/tegra210-emc.c
>>   create mode 100644 drivers/memory/tegra/tegra210-emc.h
>>
>> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
>> index 4680124ddcab..9d051bcdbee3 100644
>> --- a/drivers/memory/tegra/Kconfig
>> +++ b/drivers/memory/tegra/Kconfig
>> @@ -26,3 +26,13 @@ config TEGRA124_EMC
>>   	  Tegra124 chips. The EMC controls the external DRAM on the board.
>>   	  This driver is required to change memory timings / clock rate for
>>   	  external memory.
>> +
>> +config TEGRA210_EMC
>> +	bool "NVIDIA Tegra210 External Memory Controller driver"
>> +	default y
>=20
> This is not enough since you're leaving possibility to disable
> compilation of the driver, but the compilation will fail because of the
> unresolved symbol (tegra210_clk_register_emc).
>=20
>> +	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
>> +	help
>> +	  This driver is for the External Memory Controller (EMC) found on
>> +	  Tegra210 chips. The EMC controls the external DRAM on the board.
>> +	  This driver is required to change memory timings / clock rate for
>> +	  external memory.
>=20
> Either TEGRA210_EMC Kconfig option shall be always force-selected for
> T210 or you should move all the clk-related code into drivers/clk/tegra/.
>=20
> Could you please give a rationale for having EMC clock code within the
> EMC driver?

I didn't have a specific reason for that initially, just wanted the=20
clock code and EMC driver together for easier maintenance.

But considering the fix in v4, that makes it backward compatible with=20
the case if the kernel uses the older DT without EMC node, I think it's=20
better to move the clock code into the clk folder now.

>=20
> [snip]
>=20
>> +static int tegra210_emc_probe(struct platform_device *pdev)
>> +{
>> +	int i;
>> +	unsigned long table_rate;
>> +	unsigned long current_rate;
>> +	struct clk *emc_clk;
>> +	struct device_node *np;
>> +	struct platform_device *mc;
>> +	struct resource res;
>> +	struct tegra_emc *emc;
>> +	void *table_addr;
>> +
>> +	emc_clk =3D devm_clk_get(&pdev->dev, "emc");
>> +	if (IS_ERR(emc_clk))
>> +		return PTR_ERR(emc_clk);
>=20
> Please add newline in a such places in the code to make it more readable.
>=20
>> +	emc =3D clk_hw_to_emc(__clk_get_hw(emc_clk));
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
>> +	emc->emc_base[REG_EMC] =3D devm_platform_ioremap_resource(pdev, 0);
>> +	emc->emc_base[REG_EMC0] =3D devm_platform_ioremap_resource(pdev, 1);
>> +	emc->emc_base[REG_EMC1] =3D devm_platform_ioremap_resource(pdev, 2);
>> +
>> +	for (i =3D 0; i < TEGRA_EMC_SRC_COUNT; i++) {
>> +		if (!IS_ERR(emc_src[i]))
>> +			clk_put(emc_src[i]);
>> +
>> +		emc_src[i] =3D devm_clk_get(&pdev->dev, emc_src_names[i]);
>> +		if (IS_ERR(emc_src[i])) {
>> +			dev_err(&pdev->dev, "Can not find EMC source clock\n");
>> +			return -ENODATA;
>> +		}
>> +	}
>> +
>> +	np =3D of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
>> +	if (!np) {
>> +		dev_err(&pdev->dev, "could not find EMC table\n");
>> +		return -ENODATA;
>> +	}
>> +
>> +	if (!of_device_is_compatible(np, "nvidia,tegra210-emc-table") ||
>> +	    !of_device_is_available(np)) {
>> +		dev_err(&pdev->dev, "EMC table is invalid\n");
>> +		return -ENODATA;
>> +	}
>> +
>> +	of_address_to_resource(np, 0, &res);
>> +	table_addr =3D memremap(res.start, resource_size(&res), MEMREMAP_WB);
>> +	of_node_put(np);
>> +	if (!table_addr) {
>> +		dev_err(&pdev->dev, "could not map EMC table\n");
>> +		return -ENOMEM;
>> +	}
>> +	emc->emc_table =3D (struct emc_table *)table_addr;
>=20
> There is no need to cast a void. Please make sure that you don't have
> any non-upstream patches applied that are changing compiler flags, also
> make sure that you're using proper compiler (GCC) if you're getting a
> warning here.
>=20
>> +
>> +	for (i =3D 0; i < TEGRA_EMC_MAX_FREQS; i++)
>> +		if (emc->emc_table[i].rev !=3D 0)
>> +			emc->emc_table_size++;
>> +		else
>> +			break;
>> +
>> +	/* check the supported sequence */
>> +	while (seq->table_rev) {
>> +		if (seq->table_rev =3D=3D emc->emc_table[0].rev)
>> +			break;
>> +		seq++;
>> +	}
>> +	if (!seq->set_clock) {
>> +		seq =3D NULL;
>> +		dev_err(&pdev->dev, "Invalid EMC sequence for table Rev. %d\n",
>> +			emc->emc_table[0].rev);
>> +		return -ENODATA;
>> +	}
>> +
>> +	emc_clk_sel =3D devm_kcalloc(&pdev->dev,
>> +				   emc->emc_table_size,
>> +				   sizeof(struct emc_sel),
>> +				   GFP_KERNEL);
>> +
>> +	/* calculate the rate from source clock */
>> +	current_rate =3D emc_get_src_clk_rate() / 1000;
>> +
>> +	/* validate the table */
>> +	for (i =3D 0; i < emc->emc_table_size; i++) {
>> +		table_rate =3D emc->emc_table[i].rate;
>> +		if (!table_rate)
>> +			continue;
>> +
>> +		if (i && ((table_rate <=3D emc->emc_table[i-1].rate) ||
>> +		   (emc->emc_table[i].min_volt <
>> +		    emc->emc_table[i-1].min_volt)))
>> +			continue;
>> +
>> +		if (emc->emc_table[i].rev !=3D emc->emc_table[0].rev)
>> +			continue;
>> +
>> +		if (find_matching_input(&emc->emc_table[i], &emc_clk_sel[i]))
>> +			continue;
>> +
>> +		if (table_rate =3D=3D current_rate)
>> +			emc->current_timing =3D &emc->emc_table[i];
>> +	}
>=20
> I'm suggesting to factor out all the validations into a separate
> function for clarity.
>=20

Okay, will fix.

Thanks,
Joseph
