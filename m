Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022129.outbound.protection.outlook.com [40.107.75.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998A3386555;
	Thu, 27 Aug 2026 03:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787799882; cv=fail; b=MfERqZyw1lmwNIApBaMoMpTIzg6OtsacsqknvpLAwkwQ1v38GeFVNINL6BYuLGq/LPvRyOYVD9ZkNSLRGw1E4QGkTQhcY9pnHn5p4jg9Yxae5/p2YbDLxsrLB0DnQAA38iS9MCjK4XqlePB7tzEx7yGH+lpHgz5dBn0jDpplWLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787799882; c=relaxed/simple;
	bh=kUGtVJCweHqitI1eWX6aMKKjgoDsbBtzAVe69MWb72U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OZhxZkLsguEw0CqnoHTNqTKGsHrmJfyUlSV0Hf7AtSURW87SrCWt+VxTGGen7dhzJQD9aONVH6OC0vpeGDBF1DBX2X6HUqtIe6uR1vcAjqIST/0x+AL+9QiJqDUccT5ygpxXkcaMr5QhEDALvJBdq5K1rcX3dFt0G2biwfFf/+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=hbfXUNAK; arc=fail smtp.client-ip=40.107.75.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="hbfXUNAK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMZ8Kd5LTw+/iqJUEsZbWpJ2wOvlh5phepO3RSWcavqUk57FAyXKz6YRJjLdn+aOr7gEzwrroiyVkuxvMD3/tEl9MI4SFgXH6dtIe4QbMox1WzKq4e9RUlaCqSP64MwekgG8TzX3yMyLI04EWLwHzQ3cOfohg8aIdt3EVCbr4tcVNNGoYcRz9Jvs3K7l95ytXiWE+bYAw4VE553LtSD6X5bZmntwEsLk7SFFgtG2yeLXO8kn+v30qpAmqJJXSQQmwefpwpvQaeCmqoQwVsvY7epzNFjTCmLKLpFyyuz1OEXvnzWrPj26El5s4/G5tiL+C1rcc/uzta7Z6ZdgfJSKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=il4qxi/bh36OksjCuHW6aR6h/EQtYLSq9rXAuHx0hjA=;
 b=L1HKpLYhfDK9o7YAos8syYt59UwDbYag7C4cZP1XclFI6RG5IcyqXfSlUEAtqvxZ8yXcXc3gYFt3EYoLMw1NvhclJ8KPS/L7A7ioCK756SHfGi5ltEU13fBtBcQBhAopeYzm8m8vkBdnW8LeGKuofF8m/IFgR7EsOADMd3SV4QNxhzp047oPIlMPL2TRDcHEN346b1rsBFQzrSF1r6CVAmXRAJni4ErnxnFd046K2dP4pncVywiNwWFu7ZatIH/+nBLisu0mPa+ohlXZ1j/VfV6k1Cx1hS4qfZAzhJQPUEqskdL/HKecweXhm+I2bI66q+lJac/Jr9+kfD54epfAAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=il4qxi/bh36OksjCuHW6aR6h/EQtYLSq9rXAuHx0hjA=;
 b=hbfXUNAKaKUIeoabmg3YKtyjJED39Bz4sH3S6/Gd/GruHlAy8dyV9JGs2x3jVsj/Pbm5oG1d3vPJzlsNsShWfC8CJ0dypxHlbKT4uau2OfLDCFcfqQbMssinWmuJjt85zNJVD0+4IFWPQVQu94RdCiPfcTsMkGdgI/yBI18/DYCQD67mjKTf3ayD6GQDsZYYJrsrKuUlBJ95revZT0Nem/WgwjZMEx7CTsQq+qjfO6OL6OcRMvkgHBMTTCkFMqX7LJ531JTMDTKR/SLj9JPvBRefEJrIzBX/I6nrK6ScBJ4Vs2V4sG8tZMix0Wd6GLbYGyRnUushzSanPpXy9FPcWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB9610.apcprd03.prod.outlook.com (2603:1096:101:302::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Thu, 27 Aug
 2026 03:04:37 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 03:04:37 +0000
Message-ID: <b16d8f3a-0f12-4e0e-950a-854d28481519@amlogic.com>
Date: Thu, 27 Aug 2026 11:04:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
To: Lucas Tanure <tanure@linux.com>, Brian Masney <bmasney@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
 <aoxjX3HabY0brgXk@redhat.com>
 <57d796bd-7a3c-46b9-bd65-d6860adbd355@linux.com>
 <72db2062-e0ac-4c33-b1d1-d1fa5ae4bec8@linux.com>
 <ao8fqstEs01hd3--@redhat.com>
 <5ac071a6-8013-4143-9f59-7d0c6cad5c00@linux.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <5ac071a6-8013-4143-9f59-7d0c6cad5c00@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB9610:EE_
X-MS-Office365-Filtering-Correlation-Id: b790a0d7-622d-47db-0c40-08df03e7edc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|3023799007|56012099006|10067099003|11063799006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jxN7jEZ5phL33GSsuAiS6c/6mOVZCG/gdO3Q1OfxzjVfzLrE1Zo7smJVWyKV0KHuRZiPoDEi8Hd+W9CBFy0aPsWzOHlQSx2XqiGynxl7t0OMVdaIOX8hnh9OTr/roTnTKI4DzJmOUMENc4cj1O3ktxgJH+WtFie+eEbk2fhukhepxKLzjADJg+3aZVKLMj8WjVGiiQZ2oUPAjUdW1T6uAHlBhB3tYQPZts8X/xu+r5JOz/pr6v/60hkiZKTUnH23qEllpupI58awD5dkCUVQtC38iq4Xx8UM1ebjTyQy2DsJzpDbIrJQZSL7E0KVdkPXOx3pVry8fovdba0N4i5TYuptVEF/bjd72XpqSCNo2K4F7uZqVybwJzFF3roEcoHJdzYlE4baaxZuZmdQ1EEQB1QLUyHg10WlmmJEJ50bQwSLpthDEhtCeSwM17t3ZjhTrBdZRAluFX0RF4XAlsDhTU2uV33nWrligxfuYEmTlK+rZ7p1A5rJpAKb54HcKSoICeyxvCK5xaZFCF6Jg/HSeIP16YiGNu4BDgQzEfqC9FQ5+vt0+VDKMJ9En0Rd1XGPjDKIaRAUt4vVNeMgq+OGR8Qbkl3ntNPy9teoebDz/xTaxS3x/HhkdSy+YempKjpQZ//pOA9dlqIYpPgkrEDnmJCBIAym5s8y3O8i0fnWCHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDVub0pvSnhnYVBtVzFXTUx2ZTZ5aHE3WHFYWjZWMU1FM29ZLy9GbGtuSGM4?=
 =?utf-8?B?cmQ1ZE9VYm8zbHdoWUVJTU8vaGZtZ0JjWFZ1bWJUYTJmNmNJVy9MdmxCWHB4?=
 =?utf-8?B?OXV0UHJGcHduVnhhaVc5QlZZMnBZNHVwM1NFM1pmSUpxMjc2dzhLRlJHYm92?=
 =?utf-8?B?anp4NzBsNkNDRHZpM1VoVW5RTjhNV2JJQnJsaGVEWDByWTlyZkFBT1VQK252?=
 =?utf-8?B?M0lKaDVYWVBnQTZuYzVJcVJ6TTNtOFMzQURvejkwbVRhdWhkb1pDZ1BudnNC?=
 =?utf-8?B?NUlLUVFFS2dlZGVPbzd6S0lQNVJSTEtTbnJyRmhjSEFhdlNnZ1o2VlpIUTNS?=
 =?utf-8?B?SnlyKzBiUnlhODJaZXBMTkVjM2VjT1B5Nmsxb3JEZW5ndUQvWTVqSVZTdVdJ?=
 =?utf-8?B?dG1GZFRCOXlYakVrdW1oZFlQS2tJSUZEVkxKTUVtcjBXT3BvSHV1Q0Eybk12?=
 =?utf-8?B?Q0JVNU5PV09PWTNTUjA5ZkF0NVJVQUVseFZaM09TK1VNcGtNMEdZNUg2MnJn?=
 =?utf-8?B?V1d0UXlWZGFHNi9lWG5MdVFiS2ZieXprSjZSOUViYjRLZ1FTQythZ1R4N3VV?=
 =?utf-8?B?cGpZTkZnc2NxMzBoVEh3aWRDTXNMRUcrYXlSNnpaaVFZMVRUVStEMVlxZzZv?=
 =?utf-8?B?cFNKWldRdmFLaTBTSVZodys1VTExWkNIejRrajlmNjRHQUorSU1ITzBRSFht?=
 =?utf-8?B?NXYyOWU3YnhIWk5FZnc4TWRmOHJmMUF3TmdjM1RHQXQ4QmY4WU8wYkVQdm55?=
 =?utf-8?B?V1E5UmE2Rm9IdFNyeVVmUHBGNmVrSkJGN2VCclkxd0xjckpEU2JIMHJlbGpZ?=
 =?utf-8?B?T0l2c3FCWFR3NGJWK3dmY1ZrVUZaSXlVZGozWGd5VkxlSUtqRFlXNjE0YmY2?=
 =?utf-8?B?cnhuSDZYakVqOU5EdW1HMVA3TjIzdnZJb1N1RXhZaWJGK1U2T1lrRjBRTVpm?=
 =?utf-8?B?VElXS01PYlgwYzJCeDk2ZG8zUm8ydVVhblE0Y1VxMkQrU0ptSlhPWW44NzRU?=
 =?utf-8?B?bW1mTkRBbktBMXpIR0hFdy9wNXlvd1hlVmkyTWw0N0dNc0dBdFBBRFhCR01w?=
 =?utf-8?B?THlXTmNrQ3BuektKeS9FeVJmVmJ4QjFhNW40NGhYQ0tpUGw2aVE3QU85YXQ2?=
 =?utf-8?B?WFc4MnZwL2lndFhNSmZOME82T0o0WWdPSDh6VURPcUxEd2tCM09NZ3RQa05w?=
 =?utf-8?B?elJMdTNldlBzay8zaE5OVGVnVW42UktFTWdCWGI3cmxPSHQxWGF4dTlBRHFr?=
 =?utf-8?B?OGhhOVoxR3E2N3FFTGpmelJPb2hIdlRTNkN3amt4V21CNGpEOS8vZFFWSzhL?=
 =?utf-8?B?OTF2emhlN01ORnQydkkraTNKdExCRW9HYmtTa1NETzlmeFEvajcrTFpabnR2?=
 =?utf-8?B?YWlQR1doWWtoYU1IUXF5Qzg5SDZwLzlKdlhWMmY3b3dpc3dZTXE1bVR6OHdh?=
 =?utf-8?B?QlgycmROWDhLOC9PZ1BPeFlrVGpSTHBVaWZPTTJCNGh5RTlacnlTRGZXajJP?=
 =?utf-8?B?L3ZaN0gvZ0Yva3JSQjNmaHhNL2hCdUZaNmdJR2h1amlQL0ptWVgyMFFxMmtX?=
 =?utf-8?B?UVUrUU1PV2NVRkx3UnEzZ3ZrTjJKM2tSU1dDU3FJeW5vQ0UzV2tUZk16OVU4?=
 =?utf-8?B?dUh1M0hiVkw4N3hmcFlQTDdFTXVxTm84eWpMdDVoYTB0czZheEh4ZHNwazR1?=
 =?utf-8?B?bnF2cndqelo5bU91RXVFRWRNeXU1SEd1UXp3eW8zdWdXZ1M1UEhrVzFEanY1?=
 =?utf-8?B?Lzg2R210QmRPT0llZ2l5dGV6ZUlaTDhwNm1jUmQvaXpOYWI0ZkRFUklZU0Nw?=
 =?utf-8?B?V0E5NVN2QUEyY1JrNktDblNXcWYweFZqMHhROExGaVlpd1Y0ZVJWZXBhZlRS?=
 =?utf-8?B?T3kzenNpUythd2VUcnhhSXQyVGlPTWdjYmtZQ0JVY0JHSm1laGFxVUZWT2pz?=
 =?utf-8?B?bXNWZWRodmhqYm9pak5OOC9MMmp1OUhJeTNEOXo1ZGQ0Y3o4Q2k4Z1VTYzFM?=
 =?utf-8?B?MmVGOTR0MnFPOUtISk5WWENjbmMyeHY1R1Jocjh0V0h2VWtwZzM4UDlmVFVR?=
 =?utf-8?B?cHZhWEtWdnlyOHJraENndXBIOVpqVHRBaXduSmtOU3ZJamdyanBxZittUjFm?=
 =?utf-8?B?TldWYUZBZ0FQSW9oY3BQWmx6RUtaU0NyZUlsd0hBbXMwaG1SVEdUczVnT3JR?=
 =?utf-8?B?TWxDaDFrbEJTeFg4QkhkRkd3ZDdrbnhleEVEYnpjai9lWmJhbGV2NWF3Q0Z5?=
 =?utf-8?B?eThrc2JPTXdPNGdXa3pOV3VYTWI0Zkp2Y2wvN3ZjNWR2MmtYbWEvUHZpOTZ0?=
 =?utf-8?B?UlgrcC9CalNiRS9jOTdLaVlVMEZaTXlSa25uMG1uaENDTmdva3I4dz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b790a0d7-622d-47db-0c40-08df03e7edc6
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 03:04:37.3836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0UupeUnxEAee5btT7IPga4D5zhHtvpr/TFpqgxkEAn1jJNkvjebZdGQkOvr6SBSbHUlzxo+iNGnI0aKcYgH9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9610

Hi Lucas,

I checked the board schematic and suspect that the stability issue is 
very likely caused by voltage drops resulting from disabling the PWM clocks.

On 8/27/2026 4:04 AM, Lucas Tanure wrote:
> [ EXTERNAL EMAIL ]
> 
> On 26/08/2026 18:17, Brian Masney wrote:
>> Hi Lucas,
>>
>> On Wed, Aug 26, 2026 at 05:42:01PM +0100, Lucas Tanure wrote:
>>> With Brian's patches, VIM4 does not turn off 4 clocks:
>>>
>>> t7_sys_sd_emmc_b
>>> t7_sys_sd_emmc_c
>>> sd_emmc_b
>>> sd_emmc_c
>>>
>>> This is expected since I'm trying to run from an SD card. However, 
>>> even with
>>> these four clocks kept enabled, the board still hangs.
>>>
>>> Complete list with all clocks being disabled after Brians patches:
>>> [    1.002247] clk: Disabled unused clock: t7_sys_pwm_ao_gh
>>> [    1.002898] clk: Disabled unused clock: t7_sys_pwm_ao_ef
>>> [    1.003560] clk: Disabled unused clock: t7_sys_pwm_ao_cd
>>> [    1.004220] clk: Disabled unused clock: t7_sys_pwm_ao_ab
>>> [    1.004972] clk: Disabled unused clock: t7_sys_pwm_ef
>>> [    1.005509] clk: Disabled unused clock: t7_sys_pwm_cd
>>> [    1.006211] clk: Disabled unused clock: t7_sys_pwm_ab
>>> [    1.006766] clk: Disabled unused clock: t7_sys_ts_hevc
>>> [    1.007434] clk: Disabled unused clock: t7_sys_ts_vpu
>>> [    1.008033] clk: Disabled unused clock: t7_sys_ts_nna
>>> [    1.008741] clk: Disabled unused clock: t7_sys_ts_gpu
>>> [    1.009294] clk: Disabled unused clock: t7_sys_sar_adc
>>> [    1.009929] clk: Disabled unused clock: t7_sys_vpu_intr
>>> [    1.010609] clk: Disabled unused clock: t7_sys_dspb
>>> [    1.011186] clk: Disabled unused clock: t7_sys_dspa
>>> [    1.011792] clk: Disabled unused clock: t7_sys_a73pclk_apb
>>> [    1.012554] clk: Disabled unused clock: t7_sys_pclk_sys_apb
>>> [    1.013213] clk: Disabled unused clock: t7_sys_rsa
>>> [    1.013811] clk: Disabled unused clock: t7_sys_mipi_isp_pclk
>>> [    1.014529] clk: Disabled unused clock: t7_sys_mmc_apb
>>> [    1.015107] clk: Disabled unused clock: t7_sys_hdmirx_pclk
>>> [    1.015819] clk: Disabled unused clock: t7_sys_i2c_s_a
>>> [    1.016429] clk: Disabled unused clock: t7_sys_hdmitx_apb
>>> [    1.017109] clk: Disabled unused clock: t7_sys_i2c_m_f
>>> [    1.017740] clk: Disabled unused clock: t7_sys_i2c_m_e
>>> [    1.018379] clk: Disabled unused clock: t7_sys_i2c_m_d
>>> [    1.019018] clk: Disabled unused clock: t7_sys_i2c_m_c
>>> [    1.019657] clk: Disabled unused clock: t7_sys_i2c_m_b
>>> [    1.020296] clk: Disabled unused clock: t7_sys_i2c_m_a
>>> [    1.020940] clk: Disabled unused clock: t7_sys_i2c_ao_b
>>> [    1.021585] clk: Disabled unused clock: t7_sys_i2c_ao_a
>>> [    1.022236] clk: Disabled unused clock: t7_sys_pcie_phy
>>> [    1.022885] clk: Disabled unused clock: t7_sys_usb
>>> [    1.023482] clk: Disabled unused clock: t7_sys_pcie
>>> [    1.024088] clk: Disabled unused clock: t7_sys_spicc1
>>> [    1.024723] clk: Disabled unused clock: t7_sys_spicc0
>>> [    1.025345] clk: Disabled unused clock: t7_sys_g2d
>>> [    1.025940] clk: Disabled unused clock: t7_sys_spicc5
>>> [    1.026569] clk: Disabled unused clock: t7_sys_ts_a53
>>> [    1.027197] clk: Disabled unused clock: t7_sys_ts_a73
>>> [    1.027825] clk: Disabled unused clock: t7_sys_spicc4
>>> [    1.028454] clk: Disabled unused clock: t7_sys_spicc3
>>> [    1.029085] clk: Disabled unused clock: t7_sys_spicc2
>>> [    1.029710] clk: Disabled unused clock: t7_sys_aififo
>>> [    1.030339] clk: Disabled unused clock: t7_sys_uart_f
>>> [    1.030967] clk: Disabled unused clock: t7_sys_uart_e
>>> [    1.031595] clk: Disabled unused clock: t7_sys_uart_d
>>> [    1.032224] clk: Disabled unused clock: t7_sys_uart_c
>>> [    1.032857] clk: Disabled unused clock: t7_sys_uart_b
>>> [    1.033482] clk: Disabled unused clock: t7_sys_eth
>>> [    1.034077] clk: Disabled unused clock: t7_sys_audio
>>> [    1.034694] clk: Disabled unused clock: t7_sys_ir_ctrl
>>> [    1.035333] clk: Disabled unused clock: t7_sys_msr_clk
>>> [    1.035972] clk: Disabled unused clock: t7_sys_spifc
>>> [    1.036596] clk: Disabled unused clock: t7_sys_acodec
>>> [    1.037218] clk: Disabled unused clock: t7_sys_smartcard
>>> [    1.037880] clk: Disabled unused clock: t7_sys_am2axi2
>>> [    1.038518] clk: Disabled unused clock: t7_sys_am2axi1
>>> [    1.039157] clk: Disabled unused clock: t7_sys_am2axi0
>>> [    1.039796] clk: Disabled unused clock: t7_sys_ampipe_eth
>>> [    1.040468] clk: Disabled unused clock: t7_sys_ampipe_nand
>>> [    1.041155] clk: Disabled unused clock: t7_sys_deswarp
>>> [    1.041790] clk: Disabled unused clock: t7_sys_gdc
>>> [    1.042385] clk: Disabled unused clock: t7_sys_cec
>>> [    1.042981] clk: Disabled unused clock: t7_sys_aucpu
>>> [    1.043600] clk: Disabled unused clock: t7_sys_aocpu
>>> [    1.044217] clk: Disabled unused clock: t7_sys_mali
>>> [    1.044830] clk: Disabled unused clock: t7_sys_ethphy
>>> [    1.045451] clk: Disabled unused clock: t7_sys_mipi_dsi_b
>>> [    1.046123] clk: Disabled unused clock: t7_sys_mipi_dsi_a
>>> [    1.046795] clk: Disabled unused clock: t7_sys_dos
>>> [    1.047390] clk: Disabled unused clock: t7_sys_ddr
>>> [    1.047991] clk: Disabled unused clock: pwm_ao_g

This is the clock of the regulator that drives the VDDDDR.

>>> [    1.048565] clk: Disabled unused clock: pwm_ao_f

This is for VDDNPU

>>> [    1.049135] clk: Disabled unused clock: pwm_ao_e

This is for VDDGPU

>>> [    1.049709] clk: Disabled unused clock: pwm_ao_d

This is for VDDCPU_A (for A73)

>>> [    1.050283] clk: Disabled unused clock: pwm_ao_b

This is for VDDCPU_B (for A53)

>>> [    1.050857] clk: Disabled unused clock: pwm_ao_a

This is for VDDEE

These clocks must not be disabled, otherwise the voltage may drop and 
cause stability issues. You can try adding CLK_IGNORE_UNUSED to these 
clocks and see if it improves the situation (especially for pwm_ao_a/b/d)?

I checked the DTS and found that the pwm-regulator devices corresponding 
to the VDD* rails mentioned above are not supported yet. If support for 
these pwm-regulators is added in the DTS and the corresponding clocks 
are properly referenced, the stability issues you are seeing may be 
resolved.

>>> [    1.051454] clk: Disabled unused clock: rtc_dualdiv
>>> [    1.052038] clk: Disabled unused clock: rtc_duandiv_in
>>>
>>> Also with the patches the disable happens 0.5 second later, from 0.5 
>>> seconds
>>> after the boot to 1 second after the boot.
>>>
>>> I am still investigating what is missing a consumer or what should be
>>> labeled critical.
>>
>> I've seen cases where a clock is modeled in Linux, but isn't actually
>> used by Linux, so it gets caught in the disable unused clocks sweep.
>>
>> Does the board immediately crash after the disable unused clock sweep?
> yes> If so, you could add a log statement, then 1 second sleep in
>> clk_disable_unused_subtree() and wait for the board to crash.
> good idea , thanks
>>
>> If you can't get timely help from the vendor, then you can add
>> CLK_IGNORE_UNUSED to all of those clocks, and slowly start taking them
>> off in batches and wait for the crash.
> That's what I've been doing for the past few weeks, but I'm probably
> hunting down a set of clock issues, as support for this board is still
> in its early stages. It's a combination of clocks, which makes it way
> more time-consuming.
> 
> I went with a more localized approach:
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 2b6fae54702a..3358f4dc871f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1489,14 +1489,95 @@ static void clk_unprepare_unused_subtree(struct
> clk_core *core,
>                  else if (core->ops->unprepare)
>                          core->ops->unprepare(core->hw);
>                  trace_clk_unprepare_complete(core);
> +               pr_info("clk: V Unprepared unused clock: %s\n", core- 
>  >name);
>          }
>   }
> 
> +static const char * const disable_clocks[] = {
> +       "t7_sys_pwm_ao_gh",
> +       "t7_sys_pwm_ao_ef",
> +       "t7_sys_pwm_ef",
> +       "t7_sys_pwm_cd",
> +       "t7_sys_pwm_ab",
> +       "t7_sys_ts_hevc",
> +       "t7_sys_ts_vpu",
> +       "t7_sys_ts_nna",
> +       "t7_sys_ts_gpu",
> +       "t7_sys_sar_adc",
> +       "t7_sys_vpu_intr",
> +       "t7_sys_dspb",
> +       "t7_sys_dspa",
> +       "t7_sys_a73pclk_apb",
> +       "t7_sys_pclk_sys_apb",
> +       "t7_sys_rsa",
> +       "t7_sys_mipi_isp_pclk",
> +       "t7_sys_mmc_apb",
> +       "t7_sys_hdmirx_pclk",
> +       "t7_sys_i2c_s_a",
> +       "t7_sys_hdmitx_apb",
> +       "t7_sys_i2c_m_f",
> +       "t7_sys_i2c_m_e",
> +       "t7_sys_i2c_m_d",
> +       "t7_sys_i2c_m_c",
> +       "t7_sys_i2c_m_b",
> +       "t7_sys_i2c_m_a",
> +       "t7_sys_i2c_ao_b",
> +       "t7_sys_i2c_ao_a",
> +       "t7_sys_pcie_phy",
> +       "t7_sys_usb",
> +       "t7_sys_pcie",
> +       "t7_sys_spicc1",
> +       "t7_sys_spicc0",
> +       "t7_sys_g2d",
> +       "t7_sys_spicc5",
> +       "t7_sys_ts_a53",
> +       "t7_sys_ts_a73",
> +       "t7_sys_spicc4",
> +       "t7_sys_spicc3",
> +       "t7_sys_spicc2",
> +       "t7_sys_aififo",
> +       "t7_sys_uart_f",
> +       "t7_sys_uart_e",
> +       "t7_sys_uart_d",
> +       "t7_sys_uart_c",
> +       "t7_sys_uart_b",
> +       "t7_sys_eth",
> +       "t7_sys_audio",
> +       "t7_sys_ir_ctrl",
> +       "t7_sys_msr_clk",
> +       "t7_sys_spifc",
> +       "t7_sys_acodec",
> +       "t7_sys_smartcard",
> +       "t7_sys_am2axi2",
> +       "t7_sys_am2axi1",
> +       "t7_sys_am2axi0",
> +       "t7_sys_ampipe_eth",
> +       "t7_sys_ampipe_nand",
> +       "t7_sys_deswarp",
> +       "t7_sys_gdc",
> +       "t7_sys_cec",
> +       "t7_sys_aucpu",
> +       "t7_sys_aocpu",
> +       "t7_sys_mali",
> +       "t7_sys_ethphy",
> +       "t7_sys_mipi_dsi_b",
> +       "t7_sys_mipi_dsi_a",
> +       "t7_sys_dos",
> +       "t7_sys_ddr",
> +       "pwm_ao_g",
> +       "pwm_ao_e",
> +       "pwm_ao_a",
> +       "rtc_dualdiv",
> +       "rtc_duandiv_in",
> +};
> +
> +
>   static void clk_disable_unused_subtree(struct clk_core *core,
>                                         struct device *dev)
>   {
>          struct clk_core *child;
>          unsigned long flags;
> +       int i;
> 
>          lockdep_assert_held(&prepare_lock);
> 
> @@ -1517,6 +1598,11 @@ static void clk_disable_unused_subtree(struct
> clk_core *core,
>          if (core->flags & CLK_IGNORE_UNUSED)
>                  goto unlock_out;
> 
> +       for (i = 0; i < ARRAY_SIZE(disable_clocks); i++) {
> +               if (strcmp(core->name, disable_clocks[i]) == 0)
> +                       goto unlock_out;
> +       }
> +
>          /*
>           * some gate clocks have special needs during the disable-unused
>           * sequence.  call .disable_unused if available, otherwise fall
> @@ -1529,6 +1615,7 @@ static void clk_disable_unused_subtree(struct
> clk_core *core,
>                  else if (core->ops->disable)
>                          core->ops->disable(core->hw);
>                  trace_clk_disable_complete(core);
> +               pr_info("clk: V Disabled unused clock: %s\n", core->name);
>          }
> 
> This makes it easier to let the sweep disable clocks for testing.
> 
>>
>> Brian
>>
> Thanks
> Lucas
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Best regards,
Chuan

