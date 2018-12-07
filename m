Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9365C07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:39:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A848208E7
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 14:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ih+1d/sF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A848208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbeLGOjj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 09:39:39 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13514 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbeLGOji (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Dec 2018 09:39:38 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0a861b0000>; Fri, 07 Dec 2018 06:39:23 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Dec 2018 06:39:35 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Dec 2018 06:39:35 -0800
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 7 Dec
 2018 14:39:33 +0000
Subject: Re: [PATCH 09/19] clk: tegra: dfll: add CVB tables for Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-10-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <61658127-d299-013a-d745-47a648f7a4cf@nvidia.com>
Date:   Fri, 7 Dec 2018 14:39:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204092548.3038-10-josephl@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544193563; bh=EE+hWFTWLxYvQxohWi4vtMSArFh9FpioM4XANW2FJ8E=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ih+1d/sFqwSarzFb3v+WJ+aBKfyS+BzVNpNFPzwVD+xg+JtvIcb7hf+zM0itxgiDq
         cqAyKjOoNoIpxtpZNjpViwWkNbo+w8zd0qwy+xFc6i+xxRnRj0TGwVCcp5vheOCFn+
         7Y2xNrQvsIh7S2+R0/2uXr50SShPA0b4wwfpdyh1NAAmCDvC+VWdm6r/1q5iVOo0KV
         4FOi8MvzPVdIjjc3jzxoyH2Za4sthZisqr+0s11XmXij7kHNWwyjcoWzxdvJPt+OAM
         3pVniOBFOhQX1YiOWpCWxHITIzxU0KjZD5I4AHOZk1iUlUhFc/0yZHWqup4Tm3qOg7
         z2/opYvyB1Z+Q==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 04/12/2018 09:25, Joseph Lo wrote:
> Add CVB tables with different chip characterization, so that we can
> generate the customize OPP table that suitable for different chips with
> different SKUs.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 426 +++++++++++++++++++++
>  drivers/clk/tegra/cvb.h                    |   1 +
>  2 files changed, 427 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> index 071a5c674832..bc1358d8084b 100644
> --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> @@ -88,6 +88,421 @@ static const struct cvb_table tegra124_cpu_cvb_tables[] = {
>  	},
>  };
>  
> +static const unsigned long tegra210_cpu_max_freq_table[] = {
> +	[0] = 1912500000UL,
> +	[1] = 1912500000UL,
> +	[2] = 2218500000UL,
> +	[3] = 1785000000UL,
> +	[4] = 1632000000UL,
> +	[5] = 1912500000UL,
> +	[6] = 2014500000UL,
> +	[7] = 1734000000UL,
> +	[8] = 1683000000UL,
> +	[9] = 1555500000UL,
> +	[10] = 1504500000UL,
> +};
> +
> +#define CPU_CVB_TABLE \
> +	.speedo_scale = 100,	\
> +	.voltage_scale = 1000,	\
> +	.entries = {		\
> +		{  204000000UL,	{ 1007452, -23865, 370 } }, \
> +		{  306000000UL,	{ 1052709, -24875, 370 } }, \
> +		{  408000000UL,	{ 1099069, -25895, 370 } }, \
> +		{  510000000UL,	{ 1146534, -26905, 370 } }, \
> +		{  612000000UL,	{ 1195102, -27915, 370 } }, \
> +		{  714000000UL,	{ 1244773, -28925, 370 } }, \
> +		{  816000000UL,	{ 1295549, -29935, 370 } }, \
> +		{  918000000UL,	{ 1347428, -30955, 370 } }, \
> +		{ 1020000000UL,	{ 1400411, -31965, 370 } }, \
> +		{ 1122000000UL,	{ 1454497, -32975, 370 } }, \
> +		{ 1224000000UL,	{ 1509687, -33985, 370 } }, \
> +		{ 1326000000UL,	{ 1565981, -35005, 370 } }, \
> +		{ 1428000000UL,	{ 1623379, -36015, 370 } }, \
> +		{ 1530000000UL,	{ 1681880, -37025, 370 } }, \
> +		{ 1632000000UL,	{ 1741485, -38035, 370 } }, \
> +		{ 1734000000UL,	{ 1802194, -39055, 370 } }, \
> +		{ 1836000000UL,	{ 1864006, -40065, 370 } }, \
> +		{ 1912500000UL,	{ 1910780, -40815, 370 } }, \
> +		{ 2014500000UL,	{ 1227000,      0,   0 } }, \
> +		{ 2218500000UL,	{ 1227000,      0,   0 } }, \
> +		{          0UL,	{       0,      0,   0 } }, \
> +	}
> +
> +#define CPU_CVB_TABLE_XA \
> +	.speedo_scale = 100,	\
> +	.voltage_scale = 1000,	\
> +	.entries = {		\
> +		{  204000000UL,	{ 1250024, -39785, 565 } }, \
> +		{  306000000UL,	{ 1297556, -41145, 565 } }, \
> +		{  408000000UL,	{ 1346718, -42505, 565 } }, \
> +		{  510000000UL,	{ 1397511, -43855, 565 } }, \
> +		{  612000000UL,	{ 1449933, -45215, 565 } }, \
> +		{  714000000UL,	{ 1503986, -46575, 565 } }, \
> +		{  816000000UL,	{ 1559669, -47935, 565 } }, \
> +		{  918000000UL,	{ 1616982, -49295, 565 } }, \
> +		{ 1020000000UL,	{ 1675926, -50645, 565 } }, \
> +		{ 1122000000UL,	{ 1736500, -52005, 565 } }, \
> +		{ 1224000000UL,	{ 1798704, -53365, 565 } }, \
> +		{ 1326000000UL,	{ 1862538, -54725, 565 } }, \
> +		{ 1428000000UL,	{ 1928003, -56085, 565 } }, \
> +		{ 1530000000UL,	{ 1995097, -57435, 565 } }, \
> +		{ 1606500000UL,	{ 2046149, -58445, 565 } }, \
> +		{ 1632000000UL,	{ 2063822, -58795, 565 } }, \
> +		{          0UL,	{       0,      0,   0 } }, \
> +	}
> +
> +#define CPU_CVB_TABLE_EUCM1 \
> +	.speedo_scale = 100,	\
> +	.voltage_scale = 1000,	\
> +	.entries = {		\
> +		{  204000000UL,	{  734429, 0, 0 } }, \
> +		{  306000000UL,	{  768191, 0, 0 } }, \
> +		{  408000000UL,	{  801953, 0, 0 } }, \
> +		{  510000000UL,	{  835715, 0, 0 } }, \
> +		{  612000000UL,	{  869477, 0, 0 } }, \
> +		{  714000000UL,	{  903239, 0, 0 } }, \
> +		{  816000000UL,	{  937001, 0, 0 } }, \
> +		{  918000000UL,	{  970763, 0, 0 } }, \
> +		{ 1020000000UL,	{ 1004525, 0, 0 } }, \
> +		{ 1122000000UL,	{ 1038287, 0, 0 } }, \
> +		{ 1224000000UL,	{ 1072049, 0, 0 } }, \
> +		{ 1326000000UL,	{ 1105811, 0, 0 } }, \
> +		{ 1428000000UL,	{ 1130000, 0, 0 } }, \
> +		{ 1555500000UL,	{ 1130000, 0, 0 } }, \
> +		{ 1632000000UL,	{ 1170000, 0, 0 } }, \
> +		{ 1734000000UL,	{ 1227500, 0, 0 } }, \
> +		{          0UL,	{       0, 0, 0 } }, \
> +	}
> +
> +#define CPU_CVB_TABLE_EUCM2 \
> +	.speedo_scale = 100,	\
> +	.voltage_scale = 1000,	\
> +	.entries = {		\
> +		{  204000000UL,	{  742283, 0, 0 } }, \
> +		{  306000000UL,	{  776249, 0, 0 } }, \
> +		{  408000000UL,	{  810215, 0, 0 } }, \
> +		{  510000000UL,	{  844181, 0, 0 } }, \
> +		{  612000000UL,	{  878147, 0, 0 } }, \
> +		{  714000000UL,	{  912113, 0, 0 } }, \
> +		{  816000000UL,	{  946079, 0, 0 } }, \
> +		{  918000000UL,	{  980045, 0, 0 } }, \
> +		{ 1020000000UL,	{ 1014011, 0, 0 } }, \
> +		{ 1122000000UL,	{ 1047977, 0, 0 } }, \
> +		{ 1224000000UL,	{ 1081943, 0, 0 } }, \
> +		{ 1326000000UL,	{ 1090000, 0, 0 } }, \
> +		{ 1479000000UL,	{ 1090000, 0, 0 } }, \
> +		{ 1555500000UL,	{ 1162000, 0, 0 } }, \
> +		{ 1683000000UL,	{ 1195000, 0, 0 } }, \
> +		{          0UL,	{       0, 0, 0 } }, \
> +	}
> +
> +#define CPU_CVB_TABLE_EUCM2_JOINT_RAIL \
> +	.speedo_scale = 100,	\
> +	.voltage_scale = 1000,	\
> +	.entries = {		\
> +		{  204000000UL,	{  742283, 0, 0 } }, \
> +		{  306000000UL,	{  776249, 0, 0 } }, \
> +		{  408000000UL,	{  810215, 0, 0 } }, \
> +		{  510000000UL,	{  844181, 0, 0 } }, \
> +		{  612000000UL,	{  878147, 0, 0 } }, \
> +		{  714000000UL,	{  912113, 0, 0 } }, \
> +		{  816000000UL,	{  946079, 0, 0 } }, \
> +		{  918000000UL,	{  980045, 0, 0 } }, \
> +		{ 1020000000UL,	{ 1014011, 0, 0 } }, \
> +		{ 1122000000UL,	{ 1047977, 0, 0 } }, \
> +		{ 1224000000UL,	{ 1081943, 0, 0 } }, \
> +		{ 1326000000UL,	{ 1090000, 0, 0 } }, \
> +		{ 1479000000UL,	{ 1090000, 0, 0 } }, \
> +		{ 1504500000UL,	{ 1120000, 0, 0 } }, \
> +		{          0UL,	{       0, 0, 0 } }, \
> +	}
> +
> +#define CPU_CVB_TABLE_ODN \
> +	.speedo_scale = 100,	\
> +	.voltage_scale = 1000,	\
> +	.entries = {		\
> +		{  204000000UL,	{  721094, 0, 0 } }, \
> +		{  306000000UL,	{  754040, 0, 0 } }, \
> +		{  408000000UL,	{  786986, 0, 0 } }, \
> +		{  510000000UL,	{  819932, 0, 0 } }, \
> +		{  612000000UL,	{  852878, 0, 0 } }, \
> +		{  714000000UL,	{  885824, 0, 0 } }, \
> +		{  816000000UL,	{  918770, 0, 0 } }, \
> +		{  918000000UL,	{  915716, 0, 0 } }, \
> +		{ 1020000000UL,	{  984662, 0, 0 } }, \
> +		{ 1122000000UL,	{ 1017608, 0, 0 } }, \
> +		{ 1224000000UL,	{ 1050554, 0, 0 } }, \
> +		{ 1326000000UL,	{ 1083500, 0, 0 } }, \
> +		{ 1428000000UL,	{ 1116446, 0, 0 } }, \
> +		{ 1581000000UL,	{ 1130000, 0, 0 } }, \
> +		{ 1683000000UL,	{ 1168000, 0, 0 } }, \
> +		{ 1785000000UL,	{ 1227500, 0, 0 } }, \
> +		{          0UL,	{       0, 0, 0 } }, \
> +	}
> +
> +struct cvb_table tegra210_cpu_cvb_tables[] = {
> +	{
> +		.speedo_id = 10,
> +		.process_id = 0,
> +		.min_millivolts = 840,
> +		.max_millivolts = 1120,
> +		CPU_CVB_TABLE_EUCM2_JOINT_RAIL,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +			.tune_high_min_millivolts = 864,
> +		}
> +	},
> +	{
> +		.speedo_id = 10,
> +		.process_id = 1,
> +		.min_millivolts = 840,
> +		.max_millivolts = 1120,
> +		CPU_CVB_TABLE_EUCM2_JOINT_RAIL,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +			.tune_high_min_millivolts = 864,
> +		}
> +	},
> +	{
> +		.speedo_id = 9,
> +		.process_id = 0,
> +		.min_millivolts = 900,
> +		.max_millivolts = 1162,
> +		CPU_CVB_TABLE_EUCM2,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +		}
> +	},
> +	{
> +		.speedo_id = 9,
> +		.process_id = 1,
> +		.min_millivolts = 900,
> +		.max_millivolts = 1162,
> +		CPU_CVB_TABLE_EUCM2,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +		}
> +	},
> +	{
> +		.speedo_id = 8,
> +		.process_id = 0,
> +		.min_millivolts = 900,
> +		.max_millivolts = 1195,
> +		CPU_CVB_TABLE_EUCM2,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +		}
> +	},
> +	{
> +		.speedo_id = 8,
> +		.process_id = 1,
> +		.min_millivolts = 900,
> +		.max_millivolts = 1195,
> +		CPU_CVB_TABLE_EUCM2,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +		}
> +	},
> +	{
> +		.speedo_id = 7,
> +		.process_id = 0,
> +		.min_millivolts = 841,
> +		.max_millivolts = 1227,
> +		CPU_CVB_TABLE_EUCM1,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +			.tune_high_min_millivolts = 864,
> +		}
> +	},
> +	{
> +		.speedo_id = 7,
> +		.process_id = 1,
> +		.min_millivolts = 841,
> +		.max_millivolts = 1227,
> +		CPU_CVB_TABLE_EUCM1,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +			.tune_high_min_millivolts = 864,
> +		}
> +	},
> +	{
> +		.speedo_id = 6,
> +		.process_id = 0,
> +		.min_millivolts = 870,
> +		.max_millivolts = 1150,
> +		CPU_CVB_TABLE,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +		}
> +	},
> +	{
> +		.speedo_id = 6,
> +		.process_id = 1,
> +		.min_millivolts = 870,
> +		.max_millivolts = 1150,
> +		CPU_CVB_TABLE,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune1 = 0x25501d0,
> +		}
> +	},
> +	{
> +		.speedo_id = 5,
> +		.process_id = 0,
> +		.min_millivolts = 818,
> +		.max_millivolts = 1227,
> +		CPU_CVB_TABLE,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +			.tune_high_min_millivolts = 864,
> +		}
> +	},
> +	{
> +		.speedo_id = 5,
> +		.process_id = 1,
> +		.min_millivolts = 818,
> +		.max_millivolts = 1227,
> +		CPU_CVB_TABLE,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x25501d0,
> +			.tune_high_min_millivolts = 864,
> +		}
> +	},
> +	{
> +		.speedo_id = 4,
> +		.process_id = -1,
> +		.min_millivolts = 918,
> +		.max_millivolts = 1113,
> +		CPU_CVB_TABLE_XA,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune1 = 0x17711BD,
> +		}
> +	},
> +	{
> +		.speedo_id = 3,
> +		.process_id = 0,
> +		.min_millivolts = 825,
> +		.max_millivolts = 1227,
> +		CPU_CVB_TABLE_ODN,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +			.tune_high_min_millivolts = 864,
> +		}
> +	},
> +	{
> +		.speedo_id = 3,
> +		.process_id = 1,
> +		.min_millivolts = 825,
> +		.max_millivolts = 1227,
> +		CPU_CVB_TABLE_ODN,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x25501d0,
> +			.tune_high_min_millivolts = 864,
> +		}
> +	},
> +	{
> +		.speedo_id = 2,
> +		.process_id = 0,
> +		.min_millivolts = 870,
> +		.max_millivolts = 1227,
> +		CPU_CVB_TABLE,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +		}
> +	},
> +	{
> +		.speedo_id = 2,
> +		.process_id = 1,
> +		.min_millivolts = 870,
> +		.max_millivolts = 1227,
> +		CPU_CVB_TABLE,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune1 = 0x25501d0,
> +		}
> +	},
> +	{
> +		.speedo_id = 1,
> +		.process_id = 0,
> +		.min_millivolts = 837,
> +		.max_millivolts = 1227,
> +		CPU_CVB_TABLE,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +			.tune_high_min_millivolts = 864,
> +		}
> +	},
> +	{
> +		.speedo_id = 1,
> +		.process_id = 1,
> +		.min_millivolts = 837,
> +		.max_millivolts = 1227,
> +		CPU_CVB_TABLE,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x25501d0,
> +			.tune_high_min_millivolts = 864,
> +		}
> +	},
> +	{
> +		.speedo_id = 0,
> +		.process_id = 0,
> +		.min_millivolts = 850,
> +		.max_millivolts = 1170,
> +		CPU_CVB_TABLE,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x20091d9,
> +			.tune_high_min_millivolts = 864,
> +		}
> +	},
> +	{
> +		.speedo_id = 0,
> +		.process_id = 1,
> +		.min_millivolts = 850,
> +		.max_millivolts = 1170,
> +		CPU_CVB_TABLE,
> +		.cpu_dfll_data = {
> +			.tune0_low = 0xffead0ff,
> +			.tune0_high = 0xffead0ff,
> +			.tune1 = 0x25501d0,
> +			.tune_high_min_millivolts = 864,
> +		}
> +	},
> +};
> +
>  static const struct dfll_fcpu_data tegra124_dfll_fcpu_data = {
>  	.cpu_max_freq_table = tegra124_cpu_max_freq_table,
>  	.cpu_max_freq_table_size = ARRAY_SIZE(tegra124_cpu_max_freq_table),
> @@ -95,11 +510,22 @@ static const struct dfll_fcpu_data tegra124_dfll_fcpu_data = {
>  	.cpu_cvb_tables_size = ARRAY_SIZE(tegra124_cpu_cvb_tables)
>  };
>  
> +static const struct dfll_fcpu_data tegra210_dfll_fcpu_data = {
> +	.cpu_max_freq_table = tegra210_cpu_max_freq_table,
> +	.cpu_max_freq_table_size = ARRAY_SIZE(tegra210_cpu_max_freq_table),
> +	.cpu_cvb_tables = tegra210_cpu_cvb_tables,
> +	.cpu_cvb_tables_size = ARRAY_SIZE(tegra210_cpu_cvb_tables),
> +};
> +
>  static const struct of_device_id tegra124_dfll_fcpu_of_match[] = {
>  	{
>  		.compatible = "nvidia,tegra124-dfll",
>  		.data = &tegra124_dfll_fcpu_data,
>  	},
> +	{
> +		.compatible = "nvidia,tegra210-dfll",
> +		.data = &tegra210_dfll_fcpu_data
> +	},
>  	{ },
>  };
>  
> diff --git a/drivers/clk/tegra/cvb.h b/drivers/clk/tegra/cvb.h
> index bcf15a089b93..91a1941c21ef 100644
> --- a/drivers/clk/tegra/cvb.h
> +++ b/drivers/clk/tegra/cvb.h
> @@ -41,6 +41,7 @@ struct cvb_cpu_dfll_data {
>  	u32 tune0_low;
>  	u32 tune0_high;
>  	u32 tune1;
> +	unsigned int tune_high_min_millivolts;

Where is this actually used?

Cheers
Jon

-- 
nvpublic
