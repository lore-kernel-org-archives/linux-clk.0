Return-Path: <SRS0=qU15=SE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F78C4360F
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 14:53:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A52142133D
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 14:53:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="kIkl/ZWh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729634AbfDBOxy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Apr 2019 10:53:54 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:14412 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730966AbfDBOxy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Apr 2019 10:53:54 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ca377740002>; Tue, 02 Apr 2019 07:53:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 02 Apr 2019 07:53:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 02 Apr 2019 07:53:50 -0700
Received: from [10.19.108.132] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Apr
 2019 14:53:47 +0000
Subject: Re: [PATCH 4/8] memory: tegra: add EMC scaling support code for
 Tegra210
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-5-josephl@nvidia.com>
 <589e57b8-e77f-39b9-2043-e36d9325d49f@gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <3058a302-2517-9756-184b-6253e9e61184@nvidia.com>
Date:   Tue, 2 Apr 2019 22:53:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <589e57b8-e77f-39b9-2043-e36d9325d49f@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1554216820; bh=sfZRN4ULA1IO+rnH3R4lDEMMG6EpUx1jJHbpZMdcrkQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=kIkl/ZWhshbRKEcxyNc2w4ZveTAGW0xWfQeEQ0g73oTq0m71yrxxedzJteM9TSX/H
         8sD1sGtzrI0KdMB4hPMaK/PPXW7JR5+M1rf2RvsUEWtrqLeKQlf45SDDrM+tE/b+ik
         4071N9FoYqP5gxtmx1pSx46WHYkgsosVTFxkf8wcCDfOPbQ3hCgcX2m2Iszbf8Vw7R
         V6TI10XeUWcYkYz4VzCZktCTUurZszJ//NZ/8AUJzwDOuZkn35jFIhEJnzXMwVN0dU
         ITlquY/vqzxAzt7DJUfst6nRyeStmMAIDW6F4byLZ65dd6jrC/Jl1KAokBgKszV2FG
         AUaXcZ5nUprDg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/2/19 7:39 PM, Dmitry Osipenko wrote:
> 25.03.2019 10:45, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch adds the required APIs and variables for the EMC scaling
>> sequence code on Tegra210.
>>
>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   drivers/memory/tegra/tegra210-emc-reg.h | 265 +++++++
>>   drivers/memory/tegra/tegra210-emc.c     | 923 ++++++++++++++++++++++++
>>   2 files changed, 1188 insertions(+)
>>
>> diff --git a/drivers/memory/tegra/tegra210-emc-reg.h b/drivers/memory/te=
gra/tegra210-emc-reg.h
>> index 84fcc85f3b6d..31a69e718dbc 100644
>> --- a/drivers/memory/tegra/tegra210-emc-reg.h
>> +++ b/drivers/memory/tegra/tegra210-emc-reg.h
>> @@ -12,6 +12,13 @@
>>  =20
>>   #include "mc.h"
>>  =20
>> +#define DVFS_FGCG_HIGH_SPEED_THRESHOLD				1000
>> +#define IOBRICK_DCC_THRESHOLD					2400
>> +#define DVFS_FGCG_MID_SPEED_THRESHOLD				600
>> +
>> +#define EMC_STATUS_UPDATE_TIMEOUT				1000
>> +
>> +#define MC_EMEM_ADR_CFG						0x54
>>   #define MC_EMEM_ARB_CFG						0x90
>>   #define MC_EMEM_ARB_OUTSTANDING_REQ				0x94
>>   #define MC_EMEM_ARB_TIMING_RCD					0x98
>> @@ -75,12 +82,33 @@
>>   #define EMC_CLK_EMC_2X_CLK_SRC_SHIFT				29
>>   #define EMC_CLK_EMC_2X_CLK_SRC_MASK				\
>>   	(0x7 << EMC_CLK_EMC_2X_CLK_SRC_SHIFT)
>> +#define EMC_CLK_SOURCE_PLLM_LJ					0x4
>> +#define EMC_CLK_SOURCE_PLLMB_LJ					0x5
>>   #define	EMC_CLK_MC_EMC_SAME_FREQ				BIT(16)
>>   #define EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT			0
>>   #define EMC_CLK_EMC_2X_CLK_DIVISOR_MASK				\
>>   	(0xff << EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT)
>>  =20
>> +#define CLK_RST_CONTROLLER_CLK_SOURCE_EMC_DLL			0x664
>> +#define DLL_CLK_EMC_DLL_CLK_SRC_SHIFT				29
>> +#define DLL_CLK_EMC_DLL_CLK_SRC_MASK				\
>> +	(0x7 << DLL_CLK_EMC_DLL_CLK_SRC_SHIFT)
>> +#define DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT			10
>> +#define DLL_CLK_EMC_DLL_DDLL_CLK_SEL_MASK			\
>> +	(0x3 << DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT)
>> +#define PLLM_VCOA						0
>> +#define PLLM_VCOB						1
>> +#define EMC_DLL_SWITCH_OUT					2
>> +#define DLL_CLK_EMC_DLL_CLK_DIVISOR_SHIFT			0
>> +#define DLL_CLK_EMC_DLL_CLK_DIVISOR_MASK			\
>> +	(0xff << DLL_CLK_EMC_DLL_CLK_DIVISOR_SHIFT)
>> +
>> +#define EMC_INTSTATUS						0x0
>> +#define EMC_INTSTATUS_CLKCHANGE_COMPLETE			BIT(4)
>> +#define EMC_DBG							0x8
>> +#define EMC_DBG_WRITE_MUX_ACTIVE				BIT(1)
>>   #define EMC_CFG							0xc
>> +#define EMC_TIMING_CONTROL					0x28
>>   #define EMC_RC							0x2c
>>   #define EMC_RFC							0x30
>>   #define EMC_RAS							0x34
>> @@ -125,16 +153,40 @@
>>   #define EMC_FBIO_CFG5_DRAM_TYPE_SHIFT				0
>>   #define EMC_FBIO_CFG5_DRAM_TYPE_MASK				\
>>   	(0x3 <<	EMC_FBIO_CFG5_DRAM_TYPE_SHIFT)
>> +#define EMC_FBIO_CFG5_CMD_TX_DIS				BIT(8)
>> +
>>   #define EMC_PDEX2CKE						0x118
>>   #define EMC_CKE2PDEN						0x11c
>> +#define EMC_MPC							0x128
>>   #define EMC_R2R							0x144
>>   #define EMC_EINPUT						0x14c
>>   #define EMC_EINPUT_DURATION					0x150
>>   #define EMC_PUTERM_EXTRA					0x154
>>   #define EMC_TCKESR						0x158
>>   #define EMC_TPD							0x15c
>> +#define EMC_EMC_STATUS						0x2b4
>> +#define EMC_EMC_STATUS_TIMING_UPDATE_STALLED			BIT(23)
>>   #define EMC_CFG_DIG_DLL						0x2bc
>> +#define EMC_CFG_DIG_DLL_CFG_DLL_EN				BIT(0)
>> +#define EMC_CFG_DIG_DLL_CFG_DLL_STALL_ALL_UNTIL_LOCK		BIT(1)
>> +#define EMC_CFG_DIG_DLL_CFG_DLL_STALL_ALL_TRAFFIC		BIT(3)
>> +#define EMC_CFG_DIG_DLL_CFG_DLL_STALL_RW_UNTIL_LOCK		BIT(4)
>> +#define EMC_CFG_DIG_DLL_CFG_DLL_MODE_SHIFT			6
>> +#define EMC_CFG_DIG_DLL_CFG_DLL_MODE_MASK			\
>> +	(0x3 << EMC_CFG_DIG_DLL_CFG_DLL_MODE_SHIFT)
>> +#define EMC_CFG_DIG_DLL_CFG_DLL_LOCK_LIMIT_SHIFT		8
>> +#define EMC_CFG_DIG_DLL_CFG_DLL_LOCK_LIMIT_MASK			\
>> +	(0x7 << EMC_CFG_DIG_DLL_CFG_DLL_LOCK_LIMIT_SHIFT)
>> +
>>   #define EMC_CFG_DIG_DLL_PERIOD					0x2c0
>> +#define EMC_DIG_DLL_STATUS					0x2c4
>> +#define EMC_DIG_DLL_STATUS_DLL_LOCK				BIT(15)
>> +#define EMC_DIG_DLL_STATUS_DLL_PRIV_UPDATED			BIT(17)
>> +#define EMC_DIG_DLL_STATUS_DLL_OUT_SHIFT			0
>> +#define EMC_DIG_DLL_STATUS_DLL_OUT_MASK				\
>> +	(0x7ff << EMC_DIG_DLL_STATUS_DLL_OUT_SHIFT)
>> +
>> +#define EMC_CFG_DIG_DLL_1					0x2c8
>>   #define EMC_RDV_MASK						0x2cc
>>   #define EMC_WDV_MASK						0x2d0
>>   #define EMC_RDV_EARLY_MASK					0x2d4
>> @@ -153,6 +205,8 @@
>>   #define EMC_PRE_REFRESH_REQ_CNT					0x3dc
>>   #define EMC_DYN_SELF_REF_CONTROL				0x3e0
>>   #define EMC_TXSRDLL						0x3e4
>> +#define EMC_CCFIFO_ADDR						0x3e8
>> +#define EMC_CCFIFO_DATA						0x3ec
>>   #define EMC_TR_QPOP						0x3f4
>>   #define EMC_TR_RDV_MASK						0x3f8
>>   #define EMC_TR_QSAFE						0x3fc
>> @@ -185,8 +239,60 @@
>>   #define EMC_PUTERM_WIDTH					0x56c
>>   #define EMC_REFCTRL2						0x580
>>   #define EMC_FBIO_CFG7						0x584
>> +#define EMC_FBIO_CFG7_CH0_ENABLE				BIT(1)
>> +#define EMC_FBIO_CFG7_CH1_ENABLE				BIT(2)
>>   #define EMC_DATA_BRLSHFT_0					0x588
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE7_DATA_BRLSHFT_SHIFT	21
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE7_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE7_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE6_DATA_BRLSHFT_SHIFT	18
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE6_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE6_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE5_DATA_BRLSHFT_SHIFT	15
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE5_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE5_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE4_DATA_BRLSHFT_SHIFT	12
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE4_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE4_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE3_DATA_BRLSHFT_SHIFT	9
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE3_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE3_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE2_DATA_BRLSHFT_SHIFT	6
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE2_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE2_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE1_DATA_BRLSHFT_SHIFT	3
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE1_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE1_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE0_DATA_BRLSHFT_SHIFT	0
>> +#define EMC_DATA_BRLSHFT_0_RANK0_BYTE0_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_0_RANK0_BYTE0_DATA_BRLSHFT_SHIFT)
>> +
>>   #define EMC_DATA_BRLSHFT_1					0x58c
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE7_DATA_BRLSHFT_SHIFT	21
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE7_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE7_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE6_DATA_BRLSHFT_SHIFT	18
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE6_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE6_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE5_DATA_BRLSHFT_SHIFT	15
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE5_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE5_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE4_DATA_BRLSHFT_SHIFT	12
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE4_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE4_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE3_DATA_BRLSHFT_SHIFT	9
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE3_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE3_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE2_DATA_BRLSHFT_SHIFT	6
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE2_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE2_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE1_DATA_BRLSHFT_SHIFT	3
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE1_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE1_DATA_BRLSHFT_SHIFT)
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE0_DATA_BRLSHFT_SHIFT	0
>> +#define EMC_DATA_BRLSHFT_1_RANK1_BYTE0_DATA_BRLSHFT_MASK	\
>> +	(0x7 << EMC_DATA_BRLSHFT_1_RANK1_BYTE0_DATA_BRLSHFT_SHIFT)
>> +
>>   #define EMC_RFCPB						0x590
>>   #define EMC_DQS_BRLSHFT_0					0x594
>>   #define EMC_DQS_BRLSHFT_1					0x598
>> @@ -201,6 +307,10 @@
>>   #define EMC_QUSE_BRLSHFT_3					0x5c4
>>   #define EMC_DLL_CFG_0						0x5e4
>>   #define EMC_DLL_CFG_1						0x5e8
>> +#define EMC_DLL_CFG_1_DDLLCAL_CTRL_START_TRIM_SHIFT		10
>> +#define EMC_DLL_CFG_1_DDLLCAL_CTRL_START_TRIM_MASK		\
>> +	(0x7ff << EMC_DLL_CFG_1_DDLLCAL_CTRL_START_TRIM_SHIFT)
>> +
>>   #define EMC_CONFIG_SAMPLE_DELAY					0x5f0
>>   #define EMC_PMACRO_QUSE_DDLL_RANK0_0				0x600
>>   #define EMC_PMACRO_QUSE_DDLL_RANK0_1				0x604
>> @@ -215,15 +325,103 @@
>>   #define EMC_PMACRO_QUSE_DDLL_RANK1_4				0x630
>>   #define EMC_PMACRO_QUSE_DDLL_RANK1_5				0x634
>>   #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0			0x640
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0_OB_DDLL_LONG_DQ_RANK0_BYTE1_=
SHIFT \
>> +	16
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0_OB_DDLL_LONG_DQ_RANK0_BYTE1_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0_OB_DDLL_LONG_DQ_RANK0_BYTE1_SHIFT)
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0_OB_DDLL_LONG_DQ_RANK0_BYTE0_=
SHIFT \
>> +	0
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0_OB_DDLL_LONG_DQ_RANK0_BYTE0_=
MASK \
>> +	(0x3ff <<							    \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0_OB_DDLL_LONG_DQ_RANK0_BYTE0_SHIFT)
>> +
>>   #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1			0x644
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1_OB_DDLL_LONG_DQ_RANK0_BYTE3_=
SHIFT \
>> +	16
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1_OB_DDLL_LONG_DQ_RANK0_BYTE3_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1_OB_DDLL_LONG_DQ_RANK0_BYTE3_SHIFT)
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1_OB_DDLL_LONG_DQ_RANK0_BYTE2_=
SHIFT \
>> +	0
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1_OB_DDLL_LONG_DQ_RANK0_BYTE2_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1_OB_DDLL_LONG_DQ_RANK0_BYTE2_SHIFT)
>> +
>>   #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2			0x648
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2_OB_DDLL_LONG_DQ_RANK0_BYTE5_=
SHIFT  \
>> +	16
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2_OB_DDLL_LONG_DQ_RANK0_BYTE5_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2_OB_DDLL_LONG_DQ_RANK0_BYTE5_SHIFT)
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2_OB_DDLL_LONG_DQ_RANK0_BYTE4_=
SHIFT \
>> +	0
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2_OB_DDLL_LONG_DQ_RANK0_BYTE4_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2_OB_DDLL_LONG_DQ_RANK0_BYTE4_SHIFT)
>> +
>>   #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3			0x64c
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3_OB_DDLL_LONG_DQ_RANK0_BYTE7_=
SHIFT \
>> +	16
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3_OB_DDLL_LONG_DQ_RANK0_BYTE7_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3_OB_DDLL_LONG_DQ_RANK0_BYTE7_SHIFT)
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3_OB_DDLL_LONG_DQ_RANK0_BYTE6_=
SHIFT \
>> +	0
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3_OB_DDLL_LONG_DQ_RANK0_BYTE6_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3_OB_DDLL_LONG_DQ_RANK0_BYTE6_SHIFT)
>> +
>>   #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_4			0x650
>>   #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_5			0x654
>>   #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0			0x660
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0_OB_DDLL_LONG_DQ_RANK1_BYTE1_=
SHIFT \
>> +	16
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0_OB_DDLL_LONG_DQ_RANK1_BYTE1_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0_OB_DDLL_LONG_DQ_RANK1_BYTE1_SHIFT)
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0_OB_DDLL_LONG_DQ_RANK1_BYTE0_=
SHIFT \
>> +	0
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0_OB_DDLL_LONG_DQ_RANK1_BYTE0_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0_OB_DDLL_LONG_DQ_RANK1_BYTE0_SHIFT)
>> +
>>   #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1			0x664
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1_OB_DDLL_LONG_DQ_RANK1_BYTE3_=
SHIFT \
>> +	16
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1_OB_DDLL_LONG_DQ_RANK1_BYTE3_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1_OB_DDLL_LONG_DQ_RANK1_BYTE3_SHIFT)
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1_OB_DDLL_LONG_DQ_RANK1_BYTE2_=
SHIFT \
>> +	0
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1_OB_DDLL_LONG_DQ_RANK1_BYTE2_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1_OB_DDLL_LONG_DQ_RANK1_BYTE2_SHIFT)
>> +
>>   #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2			0x668
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2_OB_DDLL_LONG_DQ_RANK1_BYTE5_=
SHIFT \
>> +	16
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2_OB_DDLL_LONG_DQ_RANK1_BYTE5_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2_OB_DDLL_LONG_DQ_RANK1_BYTE5_SHIFT)
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2_OB_DDLL_LONG_DQ_RANK1_BYTE4_=
SHIFT \
>> +	0
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2_OB_DDLL_LONG_DQ_RANK1_BYTE4_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2_OB_DDLL_LONG_DQ_RANK1_BYTE4_SHIFT)
>> +
>>   #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3			0x66c
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3_OB_DDLL_LONG_DQ_RANK1_BYTE7_=
SHIFT \
>> +	16
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3_OB_DDLL_LONG_DQ_RANK1_BYTE7_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3_OB_DDLL_LONG_DQ_RANK1_BYTE7_SHIFT)
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3_OB_DDLL_LONG_DQ_RANK1_BYTE6_=
SHIFT \
>> +	0
>> +#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3_OB_DDLL_LONG_DQ_RANK1_BYTE6_=
MASK  \
>> +	(0x3ff <<							     \
>> +	EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3_OB_DDLL_LONG_DQ_RANK1_BYTE6_SHIFT)
>> +
>>   #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_4			0x670
>>   #define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_5			0x674
>>   #define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_0			0x680
>> @@ -432,7 +630,18 @@
>>   #define EMC_PMACRO_CMD_RX_TERM_MODE				0xc58
>>   #define EMC_PMACRO_DATA_RX_TERM_MODE				0xc5c
>>   #define EMC_PMACRO_CMD_PAD_TX_CTRL				0xc60
>> +#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_E_DCC		BIT(1)
>> +#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSP_TX_E_DCC		BIT(9)
>> +#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQSN_TX_E_DCC		BIT(16)
>> +#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_CMD_TX_E_DCC		BIT(24)
>> +#define EMC_PMACRO_CMD_PAD_TX_CTRL_CMD_DQ_TX_DRVFORCEON		BIT(26)
>> +
>>   #define EMC_PMACRO_DATA_PAD_TX_CTRL				0xc64
>> +#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQ_TX_E_DCC		BIT(1)
>> +#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSP_TX_E_DCC		BIT(9)
>> +#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_DQSN_TX_E_DCC		BIT(16)
>> +#define EMC_PMACRO_DATA_PAD_TX_CTRL_DATA_CMD_TX_E_DCC		BIT(24)
>> +
>>   #define EMC_PMACRO_COMMON_PAD_TX_CTRL				0xc68
>>   #define EMC_PMACRO_AUTOCAL_CFG_COMMON				0xc78
>>   #define EMC_PMACRO_VTTGEN_CTRL_2				0xcf0
>> @@ -954,6 +1163,16 @@ enum {
>>   	DRAM_TYPE_DDR2 =3D 3,
>>   };
>>  =20
>> +enum {
>> +	SINGLE_CHANNEL =3D 0,
>> +	DUAL_CHANNEL
>> +};
>> +
>> +enum {
>> +	DLL_OFF,
>> +	DLL_ON
>> +};
>> +
>>   struct emc_table {
>>   	u32 rev;
>>   	char dvfs_ver[60];
>> @@ -1075,9 +1294,55 @@ struct supported_sequence {
>>   	char  *seq_rev;
>>   };
>>  =20
>> +extern u32 burst_mc_regs_off[];
>> +extern u32 burst_regs_off[];
>> +extern u32 burst_regs_per_ch_off[];
>> +extern u32 burst_regs_per_ch_type[];
>> +extern unsigned long dram_over_temp_state;
>> +extern u32 la_scale_regs_off[];
>> +extern u32 trim_regs_off[];
>> +extern u32 trim_regs_per_ch_off[];
>> +extern u32 trim_regs_per_ch_type[];
>> +extern u32 vref_regs_per_ch_off[];
>> +extern u32 vref_regs_per_ch_type[];
>> +
>> +void ccfifo_writel(struct tegra_emc *emc, u32 val, unsigned long addr,
>> +		   u32 delay);
>> +u32 div_o3(u32 a, u32 b);
>> +void emc_writel(struct tegra_emc *emc, u32 val, unsigned long offset);
>> +u32  emc_readl(struct tegra_emc *emc, unsigned long offset);
>> +void emc_writel_per_ch(struct tegra_emc *emc, u32 val, int type,
>> +		       unsigned long offset);
>> +u32  emc1_readl(struct tegra_emc *emc, unsigned long offset);
>> +
>> +void do_clock_change(struct tegra_emc *emc, u32 clksrc);
>> +void emc_set_shadow_bypass(struct tegra_emc *emc, int set);
>> +void emc_timing_update(struct tegra_emc *emc, int dual_chan);
>> +u32 get_dll_state(struct emc_table *next_timing);
>> +struct emc_table *get_timing_from_freq(struct tegra_emc *emc,
>> +				       unsigned long rate);
>> +void set_over_temp_timing(struct tegra_emc *emc, struct emc_table *timi=
ng,
>> +			  unsigned long state);
>>   int tegra_emc_dt_parse_pdata(struct platform_device *pdev,
>>   			     struct emc_table **tables,
>>   			     struct emc_table **derated_tables,
>>   			     int *num_entries);
>> +u32 tegra210_actual_osc_clocks(u32 in);
>> +u32 tegra210_apply_periodic_compensation_trimmer(struct emc_table *next=
_timing,
>> +						 u32 offset);
>> +void tegra210_dll_disable(struct tegra_emc *emc, int channel_mode);
>> +void tegra210_dll_enable(struct tegra_emc *emc, int channel_mode);
>> +u32 tegra210_dll_prelock(struct tegra_emc *emc, int dvfs_with_training,
>> +			 u32 clksrc);
>> +u32 tegra210_dvfs_power_ramp_down(struct tegra_emc *emc, u32 clk,
>> +				  int flip_backward);
>> +u32 tegra210_dvfs_power_ramp_up(struct tegra_emc *emc, u32 clk,
>> +				int flip_backward);
>> +void tegra210_update_emc_alt_timing(struct tegra_emc *emc,
>> +				    struct emc_table *current_timing);
>> +void tegra210_reset_dram_clktree_values(struct emc_table *table);
>> +void tegra210_start_periodic_compensation(struct tegra_emc *emc);
>> +int wait_for_update(struct tegra_emc *emc, u32 status_reg, u32 bit_mask=
,
>> +		    bool updated_state, int chan);
>>  =20
>>   #endif
>> diff --git a/drivers/memory/tegra/tegra210-emc.c b/drivers/memory/tegra/=
tegra210-emc.c
>> index 0c20bcd0e6de..26d0de0ab319 100644
>> --- a/drivers/memory/tegra/tegra210-emc.c
>> +++ b/drivers/memory/tegra/tegra210-emc.c
>> @@ -20,6 +20,37 @@
>>   #define TEGRA_EMC_TABLE_MAX_SIZE		16
>>   #define TEGRA210_EMC_SUSPEND_RATE		204000000
>>  =20
>> +#define EMC0_EMC_DATA_BRLSHFT_0_INDEX	2
>> +#define EMC1_EMC_DATA_BRLSHFT_0_INDEX	3
>> +#define EMC0_EMC_DATA_BRLSHFT_1_INDEX	4
>> +#define EMC1_EMC_DATA_BRLSHFT_1_INDEX	5
>> +
>> +#define TRIM_REG(chan, rank, reg, byte)					\
>> +	(((EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
>> +	   _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _MASK &	\
>> +	   next_timing->trim_regs[EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ##	\
>> +				 rank ## _ ## reg ## _INDEX]) >>	\
>> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
>> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _SHIFT)	\
>> +	 +								\
>> +	 (((EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
>> +	    byte ## _DATA_BRLSHFT_MASK &				\
>> +	    next_timing->trim_perch_regs[EMC ## chan ##			\
>> +			      _EMC_DATA_BRLSHFT_ ## rank ## _INDEX]) >>	\
>> +	   EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
>> +	   byte ## _DATA_BRLSHFT_SHIFT) * 64))
>> +
>> +#define CALC_TEMP(rank, reg, byte1, byte2, n)				\
>> +	(((new[n] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##	\
>> +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _SHIFT) &=
 \
>> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
>> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _MASK)	\
>> +	 |								\
>> +	 ((new[n + 1] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##\
>> +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _SHIFT) &=
 \
>> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
>> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _MASK))	\
>> +
>>   enum TEGRA_EMC_SOURCE {
>>   	TEGRA_EMC_SRC_PLLM,
>>   	TEGRA_EMC_SRC_PLLC,
>> @@ -32,6 +63,14 @@ enum TEGRA_EMC_SOURCE {
>>   	TEGRA_EMC_SRC_COUNT,
>>   };
>>  =20
>> +enum {
>> +	TEGRA_DRAM_OVER_TEMP_NONE =3D 0,
>> +	TEGRA_DRAM_OVER_TEMP_REFRESH_X2,
>> +	TEGRA_DRAM_OVER_TEMP_REFRESH_X4,
>> +	TEGRA_DRAM_OVER_TEMP_THROTTLE, /* 4x Refresh + derating. */
>> +	TEGRA_DRAM_OVER_TEMP_MAX,
>> +};
>> +
>>   struct emc_sel {
>>   	struct clk *input;
>>   	u32 value;
>> @@ -76,6 +115,7 @@ static struct tegra_emc *tegra_emc;
>>   static DEFINE_SPINLOCK(emc_access_lock);
>>   static ktime_t clkchange_time;
>>   static int clkchange_delay =3D 100;
>> +unsigned long dram_over_temp_state =3D TEGRA_DRAM_OVER_TEMP_NONE;
>>  =20
>>   static void emc_train(struct timer_list *tmr);
>>   DEFINE_TIMER(emc_training_timer, emc_train);
>> @@ -102,11 +142,33 @@ static bool emc_suspend;
>>   static unsigned long emc_resume_rate;
>>   #endif
>>  =20
>> +inline void emc_writel(struct tegra_emc *emc, u32 val, unsigned long of=
fset)
>> +{
>> +	writel(val, emc->emc_base + offset);
>> +}
>> +
>>   inline u32 emc_readl(struct tegra_emc *emc, unsigned long offset)
>>   {
>>   	return readl(emc->emc_base + offset);
>>   }
>>  =20
>> +inline u32 emc1_readl(struct tegra_emc *emc, unsigned long offset)
>> +{
>> +	return readl(emc->emc1_base + offset);
>> +}
>=20
> Do you really need to insert a memory barrier on each readl/writel? Why n=
ot to use the relaxed versions?
>=20

Yes, should be fine to use the relaxed version. Will try that.

Thanks,
Joseph
