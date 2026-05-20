Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022116.outbound.protection.outlook.com [40.107.75.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A03200C2;
	Wed, 20 May 2026 05:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256057; cv=fail; b=txhQ/FgmswvvNZAY7mSH8OM8ImnRjT/drsN9YDxRMMd17jfp4x7gsQzZyXdYR/RFItx/YZpyJEtv2cknb8Wvk1EYHi8vWS0EM4QWr9o3TsonkQE6hhd8VcnLSc63Vy+xT/qtjFPuy28ajccpoqhJwpMCnRu67mX4mWDREpl4LyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256057; c=relaxed/simple;
	bh=uAudWDDIGdjirPdIT8iOhrylrqonp3ohVH0w2KgSIZY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qSAmylr/AbzLHfn1GycufLidBXPOONRcUsME4z1DJ/g4YrL9BonqONho0clGgr3RotR4fyPRJYYWKG6UeYfuQF1POhkvhqrYRbkZfM4yVWtZlg+bkHg+1zQNUBPaIcTPBv2vX7qvQL0yTIZnt4W1rr/x6kD4ttQwppUczjQPKwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=puJRa+t+; arc=fail smtp.client-ip=40.107.75.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="puJRa+t+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6i5qXqxJ8rOeJrnAH2/lOzmsdaRMwX2T2BOvXjNLv/uKqSeANK63Vns8ODQylBP02HCAe1oNsdZqjFNMIBetEhVPYjwAL8Bnt/kdFXNs94x3Vzl8g4fxZm7qa+manoPXNgP1XUMzqsLrdM4QizZj+bgPBKRpBUVQFRSZxGkpkPZ79fE7/wKYPhkXXL8CuWrGjvJZBsX1+0RSYxRGVa7M9TJx7n3a6g/HmXWrnPDu3eqPkfcFJZvhUQK68M8eoZzjRvnEerhbPF4Ayb4AG3IePMBU/bzxrT3FkB3u9VYj3i6oKFr74FTD2HCHmpTnCVlzC2eCfP6Dw/hUCqOMaxoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZAbD2kuO5id/dqaG0reeCxIkdx0hVg9tJGGtFqLm7o=;
 b=cmjwDK3D/5kmz2fpwKZt5i9c1gKghKz8QQM55eZETmc92UHSfeEVkLsg6HcILV47apLZZMHj9KO/asr2g5SuVlfnf3C/XvxhauaFpvEYR7Ws4ICg9p+VYQQIYpHmECLR6qGYO/qULvrupf0mYHk1JSatGSGob4DPvE2ya6cNZ0Dn0DFd7kwAbyDz26Te0WGpj7DIgmJ89s9GLrU/S88p0oxC3tUMY8HY9Xhhw0AAVQuaDbO7MUTenPGsqIbFYNYQVr8OK9TWrd9IffVRe7CDW+j48tZF4zBxY+NR3Z5Hfk/ov0nWhDhj57K/Z8j67qN4djhkXtFCjPfnzNEV0UUggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZAbD2kuO5id/dqaG0reeCxIkdx0hVg9tJGGtFqLm7o=;
 b=puJRa+t+ct1IUR+1ZGuMe04++Fsuf2vrpwaM8FeonbYa/dLirBCwU4qN7kONBE90apcuNBdrGNioMLO59es9tSpooF4w0O3KADLxAyC9QEnRY7CxiTPeUPrTch9rtBZdOhi3++7nuj69GD90ty6OKYAZ/1hzAiYcC4neBrJgjPXPKKTsjR3UOygGBapNN+7wbtf25BreeaKa2VAuwAoyzU8QHhyPFJiWhdQFh7oXf4Kex3KmjA4qzWpUx5ZGPGS2+2woRk7oyHiJPtb7wA4+uz0T1SGo8rTWbe+RDl3Tv9N1S0AFIulPpPoJCVPdoZYgfb7i7xnlgJEiiInfRY9Hdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KUYPR03MB10359.apcprd03.prod.outlook.com (2603:1096:d10:9a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.13; Wed, 20 May
 2026 05:47:31 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0048.010; Wed, 20 May 2026
 05:47:31 +0000
Message-ID: <8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
Date: Wed, 20 May 2026 13:47:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
 <1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0083.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::8) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KUYPR03MB10359:EE_
X-MS-Office365-Filtering-Correlation-Id: ade9f45f-50a2-4166-4594-08deb6334870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|4143699003|22082099003|56012099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	1AArEbfbiy8SZiFwKVLN+rnGt1/xzuV847V8hksi5WeADKfoLfH6LqjhA1jYMpPP8xNsM5euk/DgrOcASk4mOym6Z2tI/BngKTaSY7z3ZHE5akPhqMkY64lGI/+vBAfpTGGeblHqRaYjEvrQzUFghxfWYhtynttoj6Zkhi1xDfTW4ZDa36K8XBzO3V+U1/10zAd9IGYIizHCg9SRpzhfKo6HgLktABplcRz3Pn6jTSOwmwU2lAk+ffEn8Az4vigO+ZpFfYtklS//Nwc8ynxi5hrnNmEGTnFZkdBYrkYcBqZmhoZMP9rkfUwqSl40Kg47zqeg2CvU5AaGyZV8YnFlyAmfV38+udqGFh8kbsFXpLELZJNmSuUk20zKp9ScW9zuFabh7mENTZJsvZqaHW8izQ9uh8dnTiTpX/zGlCv99DBHhmdPcSPlreGs/W6aqRQ1S43YOj1PV+66QadgWRjaiWxgDhdwDMypz9abggQ+tS/G02YYH0VmP53mqkfSXN5h9zhVX/C9x1S82W66yQ65QeNaHkAEiL+fSyHCGVU1OPiYAzpgArcJ/FwUbX/FCY8MwEBz4XBV2na0FB9M2LTJ474xNT14CEdRFyoNqJGInF8i23GHuGg1yC7ySFqUJfoSjrzzlCNck1EzgsRH+cjbIqD4DW2ab/vkQ3+x4EWRLnCLX7rlLArwNqeeY3uellIa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(4143699003)(22082099003)(56012099003)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlRjMndjc3pORU9FTS9hUGdlNG85TVZtS0g0T3l1N1NMREd2WE51VnZUTUFn?=
 =?utf-8?B?T1Y2SlFzT0tDTGU0ZlJJaEdnVFA3cGFjdkh6alU1cHdaV2c3U0VYeGtaWDZY?=
 =?utf-8?B?eldPS003NEJXMmZSUGpPL1NWclU5N05PMGVXM1FVZVNtQXoydUZMbzhpVThM?=
 =?utf-8?B?TTR3UUJFTnpmSHJpRUhYcXhnYkJ0UmhTWDQ3eXlBbnkvb3FITzVUNGhjbHlx?=
 =?utf-8?B?S1BldmZXSWt1aTNMb1psaGRGeThkTXF5TDRYaW9QU1Q0V2MyZVNvMXdNQjdQ?=
 =?utf-8?B?ci9GNStBcW5YZEFPMUVodC9FVUFCeTlhZnRsdlZGaHJxbVF4aHMzc0tnanBZ?=
 =?utf-8?B?RUFETkYvTXBFb3E1Z0hJSUVrRFE2K0lJYnhnTy9Wc2J1ZERKQ0paRktVWndF?=
 =?utf-8?B?YkRWTDl6NEtyeHBTZElpaUlTVU9OMkQwWUZUeGN1WkpqQndLMmFZZW9HUlcx?=
 =?utf-8?B?TjlmeUQva1RGYjBQR1ZmMTFEdWVlaXd6d1IyTWFaMnc0RC9jbitzSVNmVnFs?=
 =?utf-8?B?WmpMYnp4QnEycEhrYVYwOUs5b204a2dXemFKK09GV0xPalZ5MVFJTkYzR3cy?=
 =?utf-8?B?Zkp6L2Fqc1lyeC9ESUJRUklQK3d3aWhGanRQVkM3Nlk3OVRNL0IxZlZXL0JY?=
 =?utf-8?B?MXZiSzluQjg1aEM0Wmp6QXVPVTJmY1pQU1oxY2d5RmFpQ0tmdHkrTzVHL1d2?=
 =?utf-8?B?TndLN2JmYjBzQ0xhSFVScEYrbzdxeW9Xc0MyVkxFRC8zbklkNEhIQmsxdDlK?=
 =?utf-8?B?dzFpbVVYZ3RGOUlMSkhFNWZVc0tyVUNNUk5RNlAzRW15ZkNreHh3ZlNhNlF0?=
 =?utf-8?B?bWxUS1RxcGhoU3djdEJXU3Z2TlI4VUdlMkhVcWZJUHBLR0JRbCtXalpVNHVY?=
 =?utf-8?B?U0I2VXdaVWxWRUZqWWQrbVRuRjI3dnZGaWwvMUMrNWp2R3V3eG1Fd0NESmpl?=
 =?utf-8?B?Vk5qazE3RGN5YS9aWS96N1hGQktYOEVIeE90MEd2WjVyRnNjeDlFVXNiWDRs?=
 =?utf-8?B?NFdYMEx6VExxdGpXTGtmb2x4TnVYT3p6eHMxZy84RmI5UjhUR2NKNFN0dTA0?=
 =?utf-8?B?bDErYURDUFRSdnQ4UDFuVWFRSWRTWWZvSG1mNjVGN1RZcUF2MnhIQXdtank1?=
 =?utf-8?B?TXgwOTE2cGtuOEl6OGlhWGdsMDR3b3dYbEZTdFNPNzljdCtSemFmMEcwYjRT?=
 =?utf-8?B?UnNqSzBqZjFYeW41bEZ2ZnZzWGpSUDBRWTdSeEdCZVhSTGVFTkZYZFI4MVRP?=
 =?utf-8?B?ZVNzOGgzYldJR0ozUnpqU01UYnhLS25WMXV4WXZ1QnZ3RFNDL0NWMUNEb29q?=
 =?utf-8?B?SDRTUFViN3Zvb1dydlVwTnpXRTR4bEhkVHo1YWx1T0RtUExWUTNESDE5d0I0?=
 =?utf-8?B?UXVmeVdjZ0M1Q3diamM4dmgwbXpWMXRIRnd5Z3g2bzFobnlNNFMvRnRtYnpt?=
 =?utf-8?B?dDU4RU5PL0hWOEhwR1dGNkFNeFR2K1QydzRzMVNhc1o1RUhjOTYwc082eTJo?=
 =?utf-8?B?WkRKWjdVbm04Z3FsTm0xRXJmQzdlczBhemlJNXBoNloxRTV5NWtlKzdYZG9B?=
 =?utf-8?B?SDIxcGk5SE4zbHZ4ckJjTVZYTDRqdEdHciszMC8weUV5K0xEZUlzaFR2OUpl?=
 =?utf-8?B?NTFsSE5vTFB2SEZkVkdqUENKd0s2cjlLYmhjWElEYmUrRjlpOGdWTDJpT2V0?=
 =?utf-8?B?b1VVeG5yQi9wRTIwcVZ4d01uUURvVjhJOS9xSCtEeWE0VnVMUDArYkRoRjBG?=
 =?utf-8?B?NGh5dmdzM0JGUUVqSDBET2d5czR4TVpnL2JKVUd4NzN6b3lpQmNvdUxEd0lW?=
 =?utf-8?B?eG93bjljS2t5bFhmOGVRZmh3VjIzUHQ4T09kYnFjMXpiMzNvYVIzRlpsMHlB?=
 =?utf-8?B?YVUvelUzZDBqQWZXQ2xYQWw0U2xPejRzTDRxUm9tZW9Tdk9ibFdMZ0t3NTR2?=
 =?utf-8?B?YStLdVVuWUZLWGV2WFpwN2Y3Y2tZSktBdTlDTzFFWVg2VEMvQzdPMGoybi9T?=
 =?utf-8?B?NlBTa2d2N0pnTW1keGVlN0NtVTc3elIxT1JTOEM2RExwc0tPZk82VzlqRDA2?=
 =?utf-8?B?RWZKSXJMMWpWQ0pTOGZ5S3B6dEVYOVllWkx1QnIxdTVhK2VmdjFvRDJmUUFH?=
 =?utf-8?B?T3ozazBOWVoyb21vZ1UwSGVmSEJKd2RzVVBYaGVnbHJOMFNFZnJIUlRPUmlM?=
 =?utf-8?B?S2U5MGNzS0xPMVZ3STdaN2xrTjA5dTRaZVQ4TERNZmdVN1pPNGJScE5XQVBV?=
 =?utf-8?B?TjMwU2QzT25OK3dhQ3A2REtqOXBBdWtYVEhJSW5xeHAvUEtZYThwd3JYb3ls?=
 =?utf-8?B?S2NOaEpLdnZEM0pkekZZY05pTy9lTG1wUG44em9CY29zZXFtbEM4Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade9f45f-50a2-4166-4594-08deb6334870
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 05:47:31.0042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvkZYNv3EM9e7ngRRQQAudARN7Xt+SDR8QpbUMFjkrQMuq1y4Zp2MxqT0o2c1AJqkVnzcTYBDF8jC8e4zoJcFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR03MB10359

On 5/14/2026 11:11 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
>> duty cycle of 50% after predivision.
>>
>> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
>> pre-divider division factor is 2^n.
> I understand what you are doing here but I have to ask why this can't be
> implemented with independent dividers that already supports power of 2 ?


If we use independent dividers, the n member would have to be removed 
from meson_clk_pll_data.

However, n is referenced 35 times in clk-pll.c, which means we would 
need to modify all
related logic across the file. This would be a relatively large change.


Moreover, for all Amlogic chips, the n divider is an indispensable part 
of the DCO clock.
The difference between SoC generations is as follows:
     Previous SoCs PLL: n = 1, 2, 3, 4... (linear divider)
     A9 SoC PLL:            n = 2^0, 2^1, 2^2, 2^3, 2^4... (power-of-two 
divider)

Therefore, splitting out the n divider from the DCO clock might not be a 
good design choice.


[...]

Best regards,

Jian


