Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013007.outbound.protection.outlook.com [52.101.83.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA73123D7C8;
	Wed, 11 Feb 2026 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770821793; cv=fail; b=FgnxABVDVI8dzaYAZXhhXu4e5zf+BNL9SOPmuBAWPi1zOsUwtAxM16GTSd2C/MpbmiQqyNiv85FdzcL9dSQB+swQH4E7VEM33NRQhf6w4NI8sqex2lAGhJVjEryutFTcs16s5lpVP0sKy3mpLwGpKxz3Qpc46+0+1dICmJu7b/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770821793; c=relaxed/simple;
	bh=tAsvOsSNkTWhQBe/QZFTtf9l0UsrdJ6PNJt5YI8EGP0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BGu5eYwH3pdMgy+Dw1xNvn05dUiH736IrFx2cOEYhMfO5cMSVenlT0/HcNiUL+ypHx4cHkOu2Xb41GlMKwYuN/8E5rNGUzZAVi/TIAokNTph35fX8VT4QmseWLWmuh/2ugTmcbOAl61UjBcx7W/0gOlWBzR2TH5VpC9xU9qIYyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OiJGtwZU; arc=fail smtp.client-ip=52.101.83.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OiJGtwZU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFEGSp1TvyNYZfNFjMzYnyEAl9iTFlv0G3O1tHeiN3lUuh8gcH/220q9t2zqvtVGkxABBCNKrQwRf75R1f9lDX22BPzEWk+1lZxpCDy6Nfwp2lqX2VCQjbGmHSVsvtIixIsdZgSMGHtVW5NuWsxJ7tYxASusFfoFwrS/3phC/Taa6GQbZolveyhUpUNMKhU0LL2sotFh2JX6KLo15jTpzBv981cayT0hrX1rqjrOsR0W+I6Fr3/Xe5gIxn686u1X6Wb0nQvc4jMIoZ/lBsfSopgr+0DfCsRCs1Mhmpsn5ABXPeDKRufMk8WdfboNq0A1V+qe8YjLXfDvklOdUrkdSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEMIgdDBhZI8jUYiBS/LrmUj2lKbS6PML+BRkdspUUo=;
 b=ye/jzU6JBmU9zwW0Wghu6zxf59me9EcM5Q/cnhJlfXrmkHk0t3CPwxUXh3sCXnwkp+oO7LJ3h55Fk1bfX1jMybVTbQ700qt2DifIWMH8bMuc4DI/FYGCNq1t9qZwdzlJMkCwNGGF56kaiC4VZ9RDWWlXWinaPRdTwAmRBUirwE6hBEtq3+dZZ2HpagP1/T0jzgQhORvCOVUrtJm5RJm8CV3VKIa3CShPov9p6tEICedxLb78HiKV8BWnMjg4foXiiRbhUaJtbfQdVyeVGD2Gnb99QgO+cLqumuB3Nd9gxuigQB2fNY1m5HJXM/nkFYj5mnOROa6Lh/vM5eI2MjrHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEMIgdDBhZI8jUYiBS/LrmUj2lKbS6PML+BRkdspUUo=;
 b=OiJGtwZU7f0QsW+rZWK/lkXpZayPh+Gi7SEqkcoSUK9SCg6j7AWGx2VA2WA4EZ90qZd1YMJ4e4OalTwzE0v4UZ4ki6KvlMK8GvEoJU1jo4f5pVcF08DW8prqoUQeCUe4RxGGQUxhx2vhsZDz0EOKujYhPNUs0QLG2OgtSmd6qQKcvU0qHBLIeI+/Fptvts7i6OSdrPBss0uTArz1bU0NCdDV6E2C3uKs54fs2AQOTcsVjT0tUUciM0F8o+MOEBIIphqOw33m8zY3j21ksLcIBHco/c82WAcNHHwo16sP34jQrgziOfd5Ng1iXahMln+/u3BdcLZFFGe/ScpXfan5Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB12115.eurprd04.prod.outlook.com (2603:10a6:800:313::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 14:56:25 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 14:56:25 +0000
Message-ID: <9e33e5e5-76cd-4395-acb4-e2e03e436bf5@oss.nxp.com>
Date: Wed, 11 Feb 2026 16:59:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: scu/imx8qxp: do not register driver in probe()
To: Alexander Stein <alexander.stein@ew.tq-group.com>, abelvesa@kernel.org,
 peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, gregkh@linuxfoundation.org, rafael@kernel.org,
 hanguidong02@gmail.com, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260211142321.55404-1-dakr@kernel.org>
 <10809444.nUPlyArG6x@steina-w>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <10809444.nUPlyArG6x@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0139.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::6) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI0PR04MB12115:EE_
X-MS-Office365-Filtering-Correlation-Id: 73acf8ff-453c-45a3-5c92-08de697dba60
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emRuVGxETHRRb2xVN0ptdzlNTnIxLzNSWmN4OWxtWkF6Tis2NWJTaDJzZllX?=
 =?utf-8?B?VGNoV1RPOE9hZGRMZjdlRHRtaVR3anlYQk5KeDFYcko5dTFJTVluZ2NhY1ZD?=
 =?utf-8?B?bUNpS3B4aTRiSFVTb2ZuZnFoc3BYbVltZnpRTUFHbnAyeitrTm9na2wyMXBI?=
 =?utf-8?B?S1pXZTNyTnJhV2xoOHJvaU9wa003UUNoUUFtU0lBejE2d1BoWmc2c1BGOXJZ?=
 =?utf-8?B?WnQ5NitRYVYwQ3hnZjlIOTg1REJNNlRtcmFkUXNjUmp0TDBNbjVNeVhiQXht?=
 =?utf-8?B?OS9LcUVaV3VBNzVXYWhKUEQ3OTRLV0l0N241Kzl1Q3doUngrU2p6WnUxZFlJ?=
 =?utf-8?B?VHBoQWtWRmNIZS9UL3VwVU9uTUJqcmRyamxoNE1lNzlwakZHQk1mblBiTito?=
 =?utf-8?B?cW54VU5GeVhJbENGaU9aYzZ1NHdRTTJQTnZmM3VhaW9BZ0dXd2NrcWNlRVFE?=
 =?utf-8?B?MzlpR3NPNmJaTWkvYnZQUUh2M0l4UElza0lIRnVyUEZFUXlEYk9ZZjdPNFVn?=
 =?utf-8?B?bFBHWlp6bCt2YnJsU0NQYmtQTEk2aHJnK1lza0doNEJ2YVRYL0NUb2MwRTRu?=
 =?utf-8?B?NW5Qc0ZhODAxWHBOYjJONEViWW0zUmxXSFNIeHRMMGpjVUM2RHJ4eEtTR0lW?=
 =?utf-8?B?Z1Y5aDJ3Mnk2QXVneFlRRlVieVFudGVBbWc2Q2RyZ3k4QnB2L2NVR1h3ZUFV?=
 =?utf-8?B?Wk0rZWdrUlJDc1o2YmVUQkhFelp2eHZ3RVR6SDVVWGx6TVdHNGRISHpTazVa?=
 =?utf-8?B?THBnU2NCdVdNSGpmVnJJQUFOT016K1VXME14RXBSMHpJMFcvSnVQSGh6cDlW?=
 =?utf-8?B?ZVRhOHVVNSs4aWZ3YitGcnZWdjBUaWRMWkZSQ2h1Zk9pbzNqU2N0WW5MMmNC?=
 =?utf-8?B?NFdQUHRTZzRYQU5TODFGQk00MWliSXRwT1JTUUJhSjFIdGp6TDJvejFpMXFX?=
 =?utf-8?B?RUZtTXdNQ3FrMElxaUwwTmU4dUZEMkRvZVVxVHhZUEZpUmZQWXNDdlNmSkFt?=
 =?utf-8?B?ZzVha3QxYkhaZUxldmhoMGpiRzBVaXAyRmgvamNQVWtYeWl4NkFjT1Y4K2Fq?=
 =?utf-8?B?TG1PTGVkVzl2dk5Td3o5ejduOU50YzYxczVqSUZvMG1TbG5SVTB4dmt6QUta?=
 =?utf-8?B?TWlzeFpkNThMaS9LaEVPUVk5eGx1VlhMRnVPZmZUSkN1a0w3YzFWbmVLTWVa?=
 =?utf-8?B?N0xLc3hYdEM3V254dTd5RFlZYzBOdWN2V1JwWFJQbVh2ZjFXdFJJbUxCQXpT?=
 =?utf-8?B?czhHZWdISFVLdmpiT0hick9VbWxxcDBkaVN2TVNtQnI0bzN5Rys2ckRtcTFE?=
 =?utf-8?B?MkdKTHFnaHNBKy84dDdVZGE2TU5wRFZ2YWY5REp2ajFUbkxNSll4b1k0NHVt?=
 =?utf-8?B?V2FIaFR0MU1kNFZqQmJtUkgyMHBMcTR2SEtZSnNuVjFBL3FtN3pVSVE0eVg3?=
 =?utf-8?B?S3RjeHdaR3M2WW15d1JPaWorNUE4NGQ5d2FSUDR0bHM3aVVySndjNTlkU0kx?=
 =?utf-8?B?MXpIM3RNM3hZcDhUY3hqOUh4Y21UNkpqV00rVllJQmJJL045S29TM0VJRWNV?=
 =?utf-8?B?L2dLd1EyL05lUk0xaG1uN0hjOTlKUnZjbTZYRGR2M3VFSU9oTTI1NGVGbDlT?=
 =?utf-8?B?VnorM3E0d3ZVVlE5QTJIbnZQV3ZmSEZYZFpVR3lHQWQ2Yno4MXVYSkJ1Zm9t?=
 =?utf-8?B?Nko2WXJlT0VuT0NoNWZzMnY2aUZaaW9XdjNNblJTcmN2d1BySStWdnc4cjJL?=
 =?utf-8?B?ZkFHOFdJcWRRVGNVMGprZnRtUEllMmNuVUp3ZnVuRVNnZm9CTlcreHdrKzF4?=
 =?utf-8?B?Znpjd1IrcTNlVjZpd0JtNE1QWUV3VCttTWpXWVBkN3VnNWJ0RWJFMEdETmNJ?=
 =?utf-8?B?NmpMMDRhb0JBUVlIY2VhOWxmWjdPSEVKc2I1YkVRS21MUmlDcU5BQmg0dnZC?=
 =?utf-8?B?M1I4OWtXTmVpMEZ3V09PQjd6ZmZTQTM1ZDZiR0FMUlY3NDQwMmF6Wi9WcVJP?=
 =?utf-8?B?Y3ZXcCs4Qnc0blpWWGNiZnRoTE81aXBoZWRCUGt4NERYaXpKRTBaY21SeHVB?=
 =?utf-8?B?MmhuU0pUTmdpdnpXZ0xpMU52d09iR0h0VWZndkFTY1ZIQ2d6NUxSMTd2Ymc0?=
 =?utf-8?Q?A39OObFAxvnkNbiWSfzWlGf5/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFZzSk5hM0g4b2thZWJuNzRpREFVZmF6RWU3UlZxV1VRa3lrczZJL0RvQW5G?=
 =?utf-8?B?Zit2RlVvRFMzQnhjdm1jS2h4TmNScTJzd210NlJLa3k4cE1TcHhlbE9jODRN?=
 =?utf-8?B?bFNJdDlkSUw2SldVenBhWWN2M2NmUVdTZCtZYXp3NGV0aDhLUElpWWNENEZB?=
 =?utf-8?B?eFRhV1Z2QmttS1A2M0ZZVWwyVVgxTTB1cTFtNFZZQ3BheHNBMjR5ak9kSnhu?=
 =?utf-8?B?STB5YVNlbXpqcGtOMjNKdUczVGZjRnA3Q2lEV3FCOEpPQkJmL0d6UldsUGhQ?=
 =?utf-8?B?S2wxS21Id0JlaCtabWJ6M0ZuclQ3WFpTQkI3V2VscnhiUS9MSW45YnVLaVBi?=
 =?utf-8?B?V2pRMU5VNFBkaEZvaUk3Y0c3ZC9qdGh0Yjc0Wk5QQWFPQ1pBaGlDc0RvcElZ?=
 =?utf-8?B?M0NUcFJOaHRXWlI4VTEzNGFKWjk4M2ZiSGJWb3pGYkR2Zm8zSUsrVlB4dDNN?=
 =?utf-8?B?d1NwN1VxU3BwWVJMeVl0bUhycmdSYnNLQ1dDcWVPNDRpT1lEdCtIR3dDemlY?=
 =?utf-8?B?RGlQTUhqM3paRCsrekVIUDZaNks3eWFWOWxNWm9JTFZoUjZSUWpudmJjbzBy?=
 =?utf-8?B?NFRRQ3JJWUExcGdQUkFGeXJYR2kvUHFvTHl4TVdEeS9NUG14VXZOOEsrVStw?=
 =?utf-8?B?SW5SaXowY1hDL3BKems1ejJCR24zK1BSZmcwcUpubWRiZDlkYXZkL0dSWEVI?=
 =?utf-8?B?OW9MQ0lzeXRMM2hYZUhRMnhoQStMUk1ZQzE2LzdBU21wUjdUVlFyNTZlQ2dS?=
 =?utf-8?B?VkxzaGZoWnY0NzFjZDFCYkJqRVRCZWswRHNLVXVsZHVydDJFeU13QWZrdytX?=
 =?utf-8?B?UEVtMTZNL2g3MXRVUnRsWWc2SU9QT2I2WitzUnhGYUgwb05RT0Zzd1JJcFpF?=
 =?utf-8?B?L2pHOW1Rb2dRWjFGeVVDR0xlTXV4Q3ZNWFFTOW9vL0xoNU5aTVhzV2ZMZDUx?=
 =?utf-8?B?a1ptbXR1Q0wrWXpkU3ZPU01tY1dlV2VzNWRQV2pER3F4UDZKdTJyZTlLOE95?=
 =?utf-8?B?WmhHWnJGdmFheEUycFBHcjR2TytLSmhoU2ZPUUJmVllVdnRnYjBYNmZVMDVR?=
 =?utf-8?B?Y3d2bjhlejJGMzdEcEFhb0N3Z2NZamR3VUtQcmxyQ0d5VW8zb1grRjZ5S0Jr?=
 =?utf-8?B?eW0rZldlWEhjNW94UWpFdWNSTzJCYitUVnR3MHJVbVZEUjZNTlVxQTZHNTYx?=
 =?utf-8?B?dU56RlRwYjNOMTJiZklqMFFnbzVCTktEdEVFSGZJeHVSSnRzUkVxakRnZVNN?=
 =?utf-8?B?WnJ0ckpxUzBvcUVKU2hiNDNGbmNkS2tQL0JabXdONVRWSk9EWnY3QmhyTXJP?=
 =?utf-8?B?d2ttUlhDRkR1M1pURU91TVcrd2lMZEtjckxQZVBER3Bab2dOeUVZbnhUalla?=
 =?utf-8?B?bHgzNVF6eUFzM3hvcjlSZlQ1RlNJYWdJL2k4YXdMOFBjN0pqRWg5U2dpRlJF?=
 =?utf-8?B?eGZGQnBMdUZPTWh1cDlZWm1DQ213alR2WDZUUDNaVUM0c1VIL1JBejI3YkJW?=
 =?utf-8?B?dDdyVldJa1dBb0JBVWRNbXY4ZEZxVjl1S094Zzk0VGFpcUlEeGJMRFMyN092?=
 =?utf-8?B?L0ZoSDBUY0FjcFowYWZpc0txTERLQTM0TTRXR2g1MWdCQ0FRTUxiS1d2anNk?=
 =?utf-8?B?a2RDU1lOYVUyZEpXdjFDeXZKbE0zUzIyVWNCZmNvZkZ0STVMZFlKTjZScnNr?=
 =?utf-8?B?eVo2eDlkU0JhZjdQUW9pcUU1YXRpVEtmdDlPMDZlL2J1cnF1ckpHaGp2aWdH?=
 =?utf-8?B?WGE0eGliUjhVWUxweTNPRDlwNXBuMDdOalpGSVptb0E2aVlsZG5DMFI0N2dm?=
 =?utf-8?B?dFZaemlDSjBaUW5QQjhpcS81UjdBZURwZysvRXlEeE5pT0QvMWIvdnZzRmFi?=
 =?utf-8?B?QXc0TGFDYlVWS2JzZEFxYUpiYXJoVVF1ajZJeUI0MGZBelRNN1dmNEsrQTF3?=
 =?utf-8?B?ZWkwcjRWSFhqSW55Z2ZEbzlrcHdlT3pyY2RkdkNMV3N5eThhNWNrZ0pJM3g1?=
 =?utf-8?B?TmE4c1JRTDJUS09UKzdrbmlBczdySC83R1N4TnRlVXp3ZlBwRVE4RFc5TXpI?=
 =?utf-8?B?R3JNcWJyekdUTnF0T29IUG91bkM1dHd6c2NDd2ZwelREeEtFRys1TXpHbWNX?=
 =?utf-8?B?cFhiaVFwczZ2TXJJUDgrejYxMjFBbHlkNjBOaFk5K3o4aDNEY3Q5K1AzaGMv?=
 =?utf-8?B?N1RKR3dhMzk4Vit4K2ZxdXdMb3pDK0ZSc3BmR3ZKVnl1aU1QVDZ6SHh0c0JU?=
 =?utf-8?B?a3k5MXAwQmsva2hrMSttNjV1VkFGUWhkZDh6YUJ6YmI0a1FwTmcxU0VEU0Zu?=
 =?utf-8?B?elptQ3c5Z0NodUVmVExsWFduTVhIYTdNYUJySis5YkhDcnNEd21xQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73acf8ff-453c-45a3-5c92-08de697dba60
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 14:56:25.3745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W943JNspXXCYikT+JWJOCPJWtDJjKKyodNh0MzCAiiKcg/WzEKtsHM1fGg2NS9TldPBxARKSUFt8cn8ng9PzfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12115

On 2/11/26 16:43, Alexander Stein wrote:
> Hi Danilo,
>
> Am Mittwoch, 11. Februar 2026, 15:23:16 CET schrieb Danilo Krummrich:
>> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
>> called from IMX driver's probe() callbacks.
>>
>> However, it neither makes sense to register drivers from probe()
>> callbacks of other drivers, nor does the driver core allow registering
>> drivers with a device lock already being held.
>>
>> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
>> device_lock for driver_match_device()") leading to a deadlock condition
>> described in [1].
>>
>> Additionally, nothing seems to unregister the imx_clk_scu_driver once
>> the corresponding driver module is unloaded, which leaves the
>> driver-core with a dangling pointer.
>>
>> Hence, register the imx_clk_scu_driver from module_init() and unregister
>> it in module_exit().
>>
>> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
>> Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as modules")
>> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
>> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Thanks for the patch.
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/MBa8x
>
>> ---
>> I plan to send the driver-core PR for 7.0-rc1 soon, which will also contain
>> commit dc23806a7c47 ("driver core: enforce device_lock for
>> driver_match_device()").
>>
>> It also contains an IOMMU commit similar to this one:
>> https://patch.msgid.link/20260121141215.29658-1-dakr@kernel.org
>>
>> The commit was originally scheduled for 6.19-rc7, but was deferred to 7.0-rc1 in
>> case more of those cases pop up (which now happened).
>> ---
>>  drivers/clk/imx/clk-imx8qxp.c | 24 +++++++++++++++++++++++-
>>  drivers/clk/imx/clk-scu.c     | 12 +++++++++++-
>>  drivers/clk/imx/clk-scu.h     |  2 ++
>>  3 files changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
>> index 3ae162625bb1..d89a2f40771e 100644
>> --- a/drivers/clk/imx/clk-imx8qxp.c
>> +++ b/drivers/clk/imx/clk-imx8qxp.c
>> @@ -346,7 +346,29 @@ static struct platform_driver imx8qxp_clk_driver = {
>>  	},
>>  	.probe = imx8qxp_clk_probe,
>>  };
>> -module_platform_driver(imx8qxp_clk_driver);
>> +
>> +static int __init imx8qxp_init(void)
>>
>>
I would call this imx8qxp_clk_init. Same for imx8qxp_exit.


>> +{
>> +	int ret;
>> +
>> +	ret = platform_driver_register(&imx8qxp_clk_driver);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = imx_clk_scu_module_init();
>> +	if (ret)
>> +		platform_driver_unregister(&imx8qxp_clk_driver);
>> +
>> +	return ret;
>>
Also, because the logical flow is that CLK driver is uing SCU for calls I would first call
imx_clk_scu_module_init and then register the imx8qxp_clk driver. 

But there is no functionality issues your your approach too, just a better logical flow.

Thanks,
Daniel.
