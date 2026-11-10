Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794291199;
	b=xIYsci7XN6liDl2rQ9E2saA5hajhSIklgFPdz1AdqU5moMzQNjQ94BC6mHDi+PZ00/4e
	 50mPILIRUJXmX3Zs+avuSAjyWcn9sD1UqbsKHLgDvAjU5j1yCGsqN2csC7PKrammuSioL
	 /J07GmS+LwCpWyup7AnLrl0YCBB5xCleLwvIAO6WJCWfSKkPMbmIFwwrRLggF5Ej5HPF+
	 PKGW9ukCquKwu6h1HSiPAt6j0wteOKpPHiaNiy+pWmPBSRCL+jKRNrl9idKdcpZerO1VG
	 +7IyytESdyjMqCFvlxKfBixXMVbOq1UqmrAa75DxyYU3G8YCq7LzzD+Wc3Y+V+vQiJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291199;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-AtpMessageProperties:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=u1n6lYX3pQDP5MxB70dQVyG32+LGru8XZ/dvjbLg0Ug=;
	b=SkC0WbWs/YTIY0uFh6F5rfwiXwM0ZBsQhE2YQArI1dtQwInXyG+ytO6aYmfuPFYQalUi
	 32sNYJ+Kglh/EuiAEGOA+rTxJCNY8a5pQC9NXXXR7XApovWlcO4a9fjfnUqxBFD1sZSD8
	 4xLeEkOoc82t/V9wzCOXMsVLjE4CYXFkZOrbUDpHHZrIPHxeOVzb25UmxQB6M/MOnCp8f
	 hShh+0nwHHZspSrY2nPhw2gceYS8YumzvEuXbEFpLVEFytRrjPK3LcHk7nhfXIZ0HNK4r
	 ypVYfH0DQjruQt9fkX+T/+FVRixMw7tEcZaQuoRhbLGD12Yeb5jErF0pMG2O1XQ7jMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=YRKifbYO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.68
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011068.outbound.protection.outlook.com [52.101.62.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FDA606A31C;
	Tue, 10 Nov 2026 06:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47FDA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=YRKifbYO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyVwLCrXeZsUPdMGvyQieZ4dZGXNhjI8B1aJ2fjUJKtBteXDCWFnmPZKgsRd6RatoadssjKNTQEIHhuqTNcTvq/xcDNlPGOYb0jLMTyJJsWlda//3tSnKm13ObMHUT20AF523H1Qg1SUpAo7pjeCM26/SHsEsejVOFvUc7BY7NgwcX+xZReNZ7ZutfkqPsW1DzxqWhwFcGjMYPPwrJQdd559Vnf0Olb97EYEfJmhv2vooujSZIe/IDeUxnZTvHA090MB84rJOlvmCEA/Y+X2kirw/nDmclY/fYU3v2u2d+oWwpaxWmzpzt7kp60qZX3e6my9AEDOML25ps3AJaypUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1n6lYX3pQDP5MxB70dQVyG32+LGru8XZ/dvjbLg0Ug=;
 b=TfR2lQOo7v0BrZKfxPTUI3VfXE8lABA007IenEQnZx4FIyK2sJXIoSmdTDSeISQ1jtEYJGDIa3qDTvzWC9FrscicC1SsPmOBHLWDLWeU+4pYNoiLHWnPKu5B1kOw3MBsDrpcgvtDpXXwxDYyzWM4sz4y1cH4mIl0RzCNjn+4ifLM+D189aVAzeoXarrNtBjGX61iU5mvwtUzkvgZWc6p1/DKkJl7WKA9TgqK3KzbcPFrXlKlh5/Fh9kZ62A5e7aQ/lwKITBjlMQFYdlIhHRjl6dXfuqkI5th4fOeJEPwIaKfa5cTL3lxBbQIKO8MM0UEfJIc80v4B2IqOYK7lGfGkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1n6lYX3pQDP5MxB70dQVyG32+LGru8XZ/dvjbLg0Ug=;
 b=YRKifbYOdM8yxc6mzvEZ8v2tACeIAfxisHU+Q2R9RPsLlZwckCLsOueVYeZXK6hB9lZGcF6S85PZiSTzHeN1QSNOCptqQw2EtFkyv8rA7THr3EhfZFJbOkvbLldOhtoGLsM2W+Zm3D0NMl5ypLNGFQ6MN+z6YsLqceS7ITNG2x8kigi6YS82mG7IOiVRcnpYdB9dftxu32cwFdjH8vlyCj/0zyqFsJduUCDZgymGYBxayzPdEL7jMkWkj4GtuqEO8H8n+ZA5X48Eg1DPLIRnlwCTSrZ+ysKte/YjtsGawLJxKmz09McFx6mNjbX3UoWf101L81EqAVP3m7o+frJjQw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by PH8PR03MB989187.namprd03.prod.outlook.com (2603:10b6:510:3b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 06:13:14 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 06:13:14 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v4 0/3] clk: socfpga: register the SP timer clocks early
Date: Tue, 10 Nov 2026 14:12:37 +0800
Message-ID: <cover.1794287244.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::9) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|PH8PR03MB989187:EE_
X-MS-Office365-Filtering-Correlation-Id: 440b15b1-0778-4acd-2897-08df3ef1b461
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|55112099003|10067099003|11063799006|261102123227099003|261026121527099003|261028144727099003|261022105027099003|261009223027099003|261022075727099003|261021121427099003|261021123027099003|56012099006|261026140227099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	wdwT800hkXqxOVOquq6ghiBb4hmMISE4tBCAXh+aTQyXLLf8Iq4hXtGoizKkyWvgmb8oURlFTFiAEEvdBJxb8L439GQ366/sC3JN131MjWJ2veYSJmSpZaM5knxRy7djXt1Px6lRNpJfksFNiagEYRNsAQE9vdmJoOccL84og0b5x6StVTvw02++k23Pv5Bpd5V+oRbqBARPSLkve37vUtM3u23BZul/pF0F5EPXhZj0W1Utbwl0o2iBxEoMwlvIi7R0TocYLv3YVNlR+qrEJAK1LCst4RbuKJc8OCCISiiZK1owkuQEj59occ9kU71WKKPWgPhfbRGuvAXF9UPg2un8VLGd1JbL9fOCfXA1oXjiaV9HTmgnB+VLY4TOuaCdMVNDdzIUJxUbj9bQGZCe/sHFmwmV2zW/Ta+7tli7iEqI1Zfk0hJF6Gin6nW1uJIJpvkYojwA74Jn5081I6Zaq1SAZC7eZqgWlnhkHIkbL9+VgP5JKDG8jBt87XvZyaW/3ez/Yl+vvwXl208GwBTIE/wEhed3u4VC81pgfK0IP/5bYMuR74Y0dWtc9MGspxhIT2fmNeR3CFTxo/mzxuh/67W4FeHGpVcBA8iJzYbB8o0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(55112099003)(10067099003)(11063799006)(261102123227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261009223027099003)(261022075727099003)(261021121427099003)(261021123027099003)(56012099006)(261026140227099003)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T9O3mNCOF4VVmRYLGdpxVgDTN/4KexqWwQofq9PTVVb7YiB0j7GLJjZYfCP1?=
 =?us-ascii?Q?mOhCw/rYlaPKPJOh7QX+snn599+3jSb+Hvp8c+aID2cse483bOdTJvUatz/e?=
 =?us-ascii?Q?/TaOGK1K25CiSKL8uRQ41M5bluJtfhBmfhq9Fv5VCfxR/u+rPMQf2XP6QPCb?=
 =?us-ascii?Q?EO9QS+dv+vXnAenT4oF5yCb84HghIvGQg/XKh7u9qNEEj9tlZfxrIO1tAc4i?=
 =?us-ascii?Q?tUZNBJkOfEmD3dvgyr2uyqXJnGBLpzlUPUfFI4SRhdrecuKWcaiulabQFVS7?=
 =?us-ascii?Q?0o4GEo1HugeZPcz82DJixgQnNJ44JFyH+mIkWWR9mOpzafxbgQVwK6brxoLd?=
 =?us-ascii?Q?8a383M71VA4p5uNaDzBamcBNHew/2FrCXFJxPi7FOshdCC0UCmNyyLpCi0el?=
 =?us-ascii?Q?VU6GDfmWwV76eQVWAitKQL1Ovs7Aweq+Y99bwuIqFohjjOfs4impLJjxZf+J?=
 =?us-ascii?Q?1t4sDuf8RMDcHGKq594GEg0sUqCYpUXoSN3oAruj7BFWhLcjgxAvQnXn5Fss?=
 =?us-ascii?Q?lQirtJNWSBDp2zK0hOSkCJSdGPJaHAvSrIWErsn8Kmx8Lq/lNMr/mVR90cCV?=
 =?us-ascii?Q?VxfXCNXSGSGO+vLY1i2QO1gPgZ+5sbOLkTVyw5TJ98qdhu2t1/Uqp0tG/w3O?=
 =?us-ascii?Q?9hku3NmTkDkY5C6/sAEnzZdji3JhgwOjca+16C6Piu+2fa6Ulr3HeSHbM1Et?=
 =?us-ascii?Q?dcBKfkYXfUsQSaVA8YStdynBIg3bL5aBW9foYnBTxo5jKcutIF8K0+gwKnge?=
 =?us-ascii?Q?E3nOLfu7E+sTz0sSTzoZUAxLOeD3UWS1bypavbAS+AT8/G+ut70bSfFBOzar?=
 =?us-ascii?Q?OTZy0fjlFbOK6TaQHfZRKOBPCifYrPppdvZMSesdaWO/UR4TZwTPOnv07bRo?=
 =?us-ascii?Q?SJBJp/m/FBIQce3gLlFAFXxKO/v3a7JYltAoTv2Vo7m5FoqUFEXrcLSdZMw+?=
 =?us-ascii?Q?iEUq9fC2zeG7SpxTHSG5Klbr3zRgHIHycZCA8DfHcVfiGjfDosy0shcmjcGo?=
 =?us-ascii?Q?hYAK5UM0UTlOHhQxbaLWBaSBEcy6bYp9G8rnHNH69HKzc7N4DS9MbyB2+OpI?=
 =?us-ascii?Q?PjeKnzWWu5y55sVyI2bIHE+vNpB2kaQOF6K0+uu/liJpMXRct3yHgIFKBUOj?=
 =?us-ascii?Q?lkFlJ7ZAIbyOer+kc7kTclur3+IoMJ+NVdDRg1Qwt1shnSmSQ0kSQ40dxlQy?=
 =?us-ascii?Q?otEpMHOiK/nsoEkHRXijqI6FNXjATgV6+NkgDmAeR2BcK8CgWyXY1vfjOYEj?=
 =?us-ascii?Q?w+4/R466mz0uq/iA/SlgzYpIUKu39WXvbVlsl75uwGjUZkMEEQmybZzWfMqI?=
 =?us-ascii?Q?jSJ34GiVAXY0NBK1xl+109btxr86Mj9mG0iiCyfuqRBO9pTYJauQmHTHSPsf?=
 =?us-ascii?Q?V5uoQaPHtxWv53bAlLn/VVE1ZSE0D+6WOjE/cTq3rwY3K439rI8NHmxvNR6J?=
 =?us-ascii?Q?ld+mNb0BMFaF5uQJS6A9+hxOMcWHKnfzTQ61MVPDlmXiv90nqx1IYdXassoh?=
 =?us-ascii?Q?q17ghrI69CW8JoKbCji3cppITcVs0i1EZyz8N51l53aq9s4xpvtsd3ViOJR1?=
 =?us-ascii?Q?I6rx+SIaf5MCExEuwp2sPvpXFplrxwNwGqAdtTfF0EMQTYJmHdKzQ7dEBRIj?=
 =?us-ascii?Q?iRi4XntrssnVKQePTbY5GBE4dJ5uBXxvSOaUvjHyYHg5UQeNzSmgJ6s8jt9s?=
 =?us-ascii?Q?DvUrGPx+i7Sfbf0ifZB+O1ZAcKc95NOyuUJlp274iw8/dMnAB0oLnt+ZGBFO?=
 =?us-ascii?Q?1qN0zb36Db2qEbbgY2GRSSW5CCVURz0=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440b15b1-0778-4acd-2897-08df3ef1b461
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 06:13:14.7023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikTrwBnpfl1hO+iQSxQPev7x6Fxq4gmlH8pzKnwEUvfu5CB+P7svnW+8fRmUCPukEB0NNIsBsbnc6qagyJv4HYa7w1MwLfSdOaIK8Y57Vj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989187

The DW APB timers on Stratix10, Agilex (including eASIC N5X) and Agilex5
are probed through TIMER_OF_DECLARE() from time_init(), but their clock,
l4_sp_clk, comes from a clock manager that is a platform driver
registered at core_initcall(). The timer's clk_get() returns
-EPROBE_DEFER, which timer_probe() does not report, and the timer is
never registered because TIMER_OF_DECLARE() callbacks are not retried.

Rather than moving the whole clock manager to CLK_OF_DECLARE() as v1 did,
this version keeps the platform driver and, following
clk-mt8173-infracfg.c, uses CLK_OF_DECLARE_DRIVER() to register only
l4_sp_clk and the clocks its rate depends on from of_clk_init():

  Agilex/N5X: boot_clk, main_pll, periph_pll, main_pll_c1, peri_pll_c1,
              noc_free_clk, l4_sp_clk
  Agilex5:    boot_clk, main_pll, periph_pll, main_pll_c3, peri_pll_c1,
              noc_free_clk, l4_sp_clk
  Stratix10:  boot_clk, main_pll, periph_pll, main_noc_base_clk,
              peri_noc_base_clk, noc_free_clk, l4_sp_clk

All other clock IDs return -EPROBE_DEFER until the platform driver probes,
registers the remaining clocks into the same provider and turns any
unused IDs into -ENOENT. If the early registration fails, probe falls
back to registering everything as before.

Boot-tested on Agilex7 (FM61), Stratix10 L-tile and Agilex5 (065B Premium
devkit), comparing each board with and without this series:

  - with the series, timer1 is registered as a clocksource within 0.5 ms
    of boot and timer0 as the broadcast clockevent device; without it,
    neither is registered and bc_hrtimer is used for broadcast instead
  - the clock manager still binds as a platform device, no devices are
    left deferred, and clocks registered at probe (EMAC, SD/MMC, USB,
    DMA, watchdog) have their expected rates and consumers

eASIC N5X is compile-tested only.

Changes in v4:
- Add Fixes tags and Cc: stable on each patch (Dinh)

Changes in v3:
- Drop redundant #include <linux/io.h>; of_address.h already provides
  iounmap() (Dinh)
- Always publish clk_data before adding the provider; use of_iomap() for
  both early and probe-fallback setup so a failed provider add cannot
  double-register early clocks or leave clocks pointing at a
  devm-unmapped base

Changes in v2:
- Keep the clock managers as platform drivers instead of converting
  them to CLK_OF_DECLARE() (Brian)
- Register only l4_sp_clk and its parents early, using
  CLK_OF_DECLARE_DRIVER() as in clk-mt8173-infracfg.c, instead of the
  whole controller (Jerome)
- Return the result of of_clk_add_hw_provider() from probe
- Update subjects and commit messages to match the new approach

v3: https://lore.kernel.org/all/cover.1791871090.git.adrian.ho.yin.ng@altera.com/
v2: https://lore.kernel.org/all/cover.1790935401.git.adrian.ho.yin.ng@altera.com/
v1: https://lore.kernel.org/all/cover.1789096458.git.adrian.ho.yin.ng@altera.com/


Adrian Ng Ho Yin (3):
  clk: socfpga: agilex: register the SP timer clocks early
  clk: socfpga: agilex5: register the SP timer clocks early
  clk: socfpga: stratix10: register the SP timer clocks early

 drivers/clk/socfpga/clk-agilex.c  | 242 +++++++++++++++++++++++-------
 drivers/clk/socfpga/clk-agilex5.c | 155 +++++++++++++++----
 drivers/clk/socfpga/clk-s10.c     | 146 +++++++++++++++---
 3 files changed, 434 insertions(+), 109 deletions(-)


base-commit: 1e7f56205813a2c48cdb3e9a4b0a24f49fd9a548
-- 
2.49.GIT

