Return-Path: <SRS0=Uhbp=TO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E64DC04AB4
	for <linux-clk@archiver.kernel.org>; Tue, 14 May 2019 09:22:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E475F20843
	for <linux-clk@archiver.kernel.org>; Tue, 14 May 2019 09:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="cM6AYk95"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbfENJWc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 May 2019 05:22:32 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:12409 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfENJWc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 May 2019 05:22:32 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cda88ae0001>; Tue, 14 May 2019 02:21:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 14 May 2019 02:22:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 14 May 2019 02:22:29 -0700
Received: from [10.19.108.132] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 May
 2019 09:22:27 +0000
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
 <50d5719c-63fb-279b-cf8a-388010e7bdb3@gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <27db5517-e2fc-ff24-7a96-932202160478@nvidia.com>
Date:   Tue, 14 May 2019 17:22:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <50d5719c-63fb-279b-cf8a-388010e7bdb3@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557825710; bh=pBILzDqoND4hRcXAHGdRCas6NqBGMrFhgSUAE3rs7mg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=cM6AYk95y4Ben/jUtGt4Dy9jxtTIFavon8+RT9ADCALtiQC3EusOzmAdJuHgZJ9O0
         ScqpqgDaWqfgNrBpPiWZjxFwpXch/96kVIYqtH7u7+0NhPnUP6gpLV50/276CqqNxD
         skLGAuD/c9GbbwhvKAveHbSth9mPwekLXrTBbnswMZAGud2/U0oA+UH5e0jSDm+Obp
         GFvMejXm3CVgcghsXeHY7VtL4NWiUqeO1k7Pf3vEX5uKPxCHMDwEuVG9eI7G/PzYxn
         n8Lmpd/3Cr3T2uHjRkdS3ftDLAYoKk6MvLvKKUB6U0GjBOPOIAi93N+gV5aZXTkTaT
         wHrqTDegZxVbQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/14/19 12:54 AM, Dmitry Osipenko wrote:
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
>> v3:
>> - address almost all the comments from the previous version
>> - remove the DT parser of EMC table
>> - The EMC table is passing as a binary blob now.
>> ---
snip.
>> +#ifdef CONFIG_DEBUG_FS
>> +static int emc_stats_show(struct seq_file *s, void *data)
>> +{
>> +	int i;
>> +	struct tegra_emc *emc =3D (struct tegra_emc *)s->private;
>=20
> There is no need for casting of the void*.
>=20
>> +
>> +	if (!emc->emc_table_size || !seq)
>> +		return 0;
>> +
>> +	emc_last_stats_update(TEGRA_EMC_MAX_FREQS);
>> +
>> +	seq_printf(s, "%-10s %-10s\n", "rate kHz", "time");
>> +	for (i =3D 0; i < emc->emc_table_size; i++) {
>> +		if (emc_clk_sel[i].input =3D=3D NULL)
>> +			continue;
>> +
>> +		seq_printf(s, "%-10u %-10llu\n",
>> +			   emc->emc_table[i].rate,
>> +			   jiffies_64_to_clock_t(
>> +			   emc_stats.time_at_clock[i]));
>> +	}
>> +	seq_printf(s, "%-15s %llu\n", "transitions:",
>> +		   emc_stats.clkchange_count);
>> +	seq_printf(s, "%-15s %llu\n", "time-stamp:",
>> +		   jiffies_64_to_clock_t(emc_stats.last_update));
>=20
> Devfreq subsystem has the transition stats too and it is a bit more advan=
ced than what you have here.
>=20
>   cat /sys/class/devfreq/devfreq0/trans_stat
>        From  :   To
>              :  50000000 100000000 150000000 300000000 600000000   time(m=
s)
>   *  50000000:         0         4         4         0        46 11809621=
0
>     100000000:        21         0         0         0         5     1546=
0
>     150000000:        10         9         0         0     10560  2021394=
0
>     300000000:        13         6      5058         0     22375   684869=
0
>     600000000:        11         7      5517     27452         0  1195899=
0
>   Total transition : 71098
>=20
> Hence I'm questioning the necessity of the debug-info duplication.
>=20

Okay, will remove the statistic data in the next version. BTW, I think=20
we will use Interconnect framework for the EMC BW manager for the Tegra=20
chips >=3D T210.

Thanks,
Joseph
