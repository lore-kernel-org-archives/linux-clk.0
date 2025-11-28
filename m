Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4EC2D4B61;
	Fri, 28 Nov 2025 03:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299680; cv=fail; b=NYLPTVc9fY3TA1W28cW6FaOUE7T2hsuyOoHo/59nT6+qUdHhuUvviZroEFzFtUkBzcNnbDQFEBk1/4MP+P1sgDqixXp6n7XKPH+POQsIYL94uyn9shsc+vZBtmKHMLUne/KX+p8IHIZAf8f+Sn3SZpYn9QahZQDD/mmLE0LRPio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299680; c=relaxed/simple;
	bh=Mt/jrUUpbkLcQAhwBVHsez1FgJYBsRXp4+e3ep1kXuk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gea5T3RtfDnInjZeJoEQWD99FkpQqKvvvBhN7oapB+QyYhL4IuudomNFk1JZ/FUqhGpXefL1FutMGA+oL4gBYmXfN3SqHpsG4gXR/ck9NfPyytMm/y3vVNOac5CBDQX+BIzIH84WOFtli1wxKsim4OAhC+U3u7MvqEQqE676+lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UnyAlz7j; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UnyAlz7j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNOGnd6y9/No8pCm+Z/IX0jWQdQ1OuGCu5eqanI85t0JofwkwAofNajkFC7JPz6SXlWej09INMwwSANAlWwU0WYGymD1Pj24E/hzYf4ea5qDY549+cv0BhAqlq4dDAoYdjpXO3XTp6vJaY309mV7hQKQIdD2x+XSOgsFwOU67phsWRpbOL9A/O6azlkhaYz00fVm4/74MLjT4Lrr73v2RAfiyU5/o/c+zpMgKKRX8hSy1XwN0iCFPx6e0NuqX8FVkoOI31Ig7JSqdVq+6K9e7xeQCaYot+UNmfggUrrBPnZ3c4V+LZHSX3nPS/9gW4ft2ciM3U0A3NoppZ8sBGQzGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2c5XWz8oWufzexQwuegXMhMlKH2LJSiXckPA8k6DY6Q=;
 b=OBidGPHrIxBswTJHGgPixCpjzL4yjiP5tWbcPXqrRii2dXz/7/B9a+KIy9W2llg4AUomypclF2zneAED81zSZLA0Fopde838xhK1oISMgSLaRCz8B1Ftm/e7oMfNmf6dpdv7kDATQbwmdrjGcwhU+bipTSfoN6WW71+3wz36Qfu0lUy8BIPkcmua9Z+YD2DR9WOdk4E3/YuhKwxbUEwfvnqjsLxducu6J1O5rpBH8Cp7NQfZLvr6fzOw8r/2KgV9iRk19FHTKAC/abdFDc031XFUa9O86CwevLrUAD3I2IIDRVFr8ZIB4i7irQPYoUxWlgcOIFUKuA0S+39CEGcG2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2c5XWz8oWufzexQwuegXMhMlKH2LJSiXckPA8k6DY6Q=;
 b=UnyAlz7jU1DnaYWOaExJ8D+cTskvzJIvN/5fv5XY6EgEm7oi2jTHW1VwW6pNAp5Oz6Y45LYUEw7GGIhJbvb7NsKmiYH2v76PjwmVjqXD/0D9EI6qc1UQJ/ZZYIO2VK8eIhhfvKxG3hjiZKE29oVXEGv0PHHnvUFejpUbm62TadS1NjASCoS9uD7n6Try3nR9C9uCmryWi51PeGX2gG8pKv5gEvA2vto57APf8Sr1jkLQG28ugutklMknNLUtYVJx/QQWQ3Kksu56Us3s+70AHwEEA/Vqqtd9DNacF/rC8Fbk95Jk55dIMLWfd4HPiayCopnmOwrPzVPAs4Upa9KgMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 03:14:35 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 03:14:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 28 Nov 2025 11:14:11 +0800
Subject: [PATCH v6 2/6] clk: Introduce clk_hw_set_spread_spectrum
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-clk-ssc-v6-2-v6-2-cfafdb5d6811@nxp.com>
References: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
In-Reply-To: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB9PR04MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: c86afbef-6ca5-41ee-9d9d-08de2e2c41da
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2o0ckNyeGNucTVHWkZmY3VTNThZT2hOMElXaUwyM1dPK1FNQng1aENZNCtr?=
 =?utf-8?B?SzFjQnVTcHNSNlBlalBFYTEvdVFlZjNoZEJhbGlYb2NIcjlIcTBIcHJvbFBY?=
 =?utf-8?B?SmtrMlZEckRZb0w5THVQcW1obUkyRzJxU2lkQk43VTZzNnR1V1d0TVFTZjR5?=
 =?utf-8?B?KzJ5T3ppeE4wYnVQR09pam1uQ2xXbXJ6OUhiM0Vwc2NJWEhHTHdBR0M3c1F4?=
 =?utf-8?B?Y09zbW90UnYxb0R3SWJpNXZRbHNibUMxS1FaT05vNHcyNzkwcGpMT3dId0xH?=
 =?utf-8?B?NzlaYTVhQjc1eUoxQVVXOVVwaWhhdFphZ2w4ZUgxcXZJTGF2ZEZ1TjFFOTZl?=
 =?utf-8?B?bVh0SXlFRHduSXY3MzJCd0VBZUs5dnNjR3lKN2NEdDlZK1A3NHJkNi9FazZj?=
 =?utf-8?B?eTJHYTFTdktFR0NuUDVNd2tYcUtCTUU1UTVraXJNNG9VMjNjSFVieDRqVml0?=
 =?utf-8?B?d1h0TlhrMGNDWWJyWSsreU1Lb0tnN0ZVWXkzTjFxQjNYU1dIcnFIcTFxYURn?=
 =?utf-8?B?UUlwM3V5SnBVMzlUQmhTQzBUYytnT1k0VUN0eEZzQW82SW5ZT3pSeW9QaFE5?=
 =?utf-8?B?R3dBR2dSZTkvOER6aUpteFVySlNwSHgwbk54RVFrWEJsVHdZS0NtSllQd0Zv?=
 =?utf-8?B?WlZaT3ZESm9TTWQ1VFpyWEVpajNXN3haYklBVTc3SE90NVRYK01PSWhkaFpV?=
 =?utf-8?B?eTROcFo1VithdjRVd2hleUFDMVZpQ29VdWN0aDN3MEV5UjBiYmdudmZYQ29p?=
 =?utf-8?B?WXpsTmhOMXRQdGI5MnhmbHdSUVJRbERpNXMwZzFIQW00Y0l3eVNaYnJxM2xF?=
 =?utf-8?B?MGhUdGdUZktScnl1TlFjUGJkajZpZ2UvTUV4TDFKNis4eUppeW1TSDhSa1hW?=
 =?utf-8?B?VW5zNE1GWU8xbXRhblVCSExOK2MrMTl0K0tKMk5yWDgxSWRqN3FyQjNUOW9M?=
 =?utf-8?B?bDRrVnNVb29lL1FGR0VDVmRxS0VsVVVwa3c2QUZSdDBraWh5b1pnVXMyNVRl?=
 =?utf-8?B?VDRUMCtWOVlCa0c5c1dwenVoRjJZMmQ2bWlnVEpsS3lSdHJVRE02OEF4ZHls?=
 =?utf-8?B?Mi9HbmpMRyswMkZCRmhCaXN4ZFhCdGhVSUVzeDNGbFRWdW54RUJKQ0FOS0w3?=
 =?utf-8?B?cnZNZitZMUQ4ekZCMVRiMFJlZ0toSGIrYzlCaG8zdlF3bmdMdklJSCtwRXJY?=
 =?utf-8?B?MGRrZVVwWVQvdks1Umdja2Z4UG0vR3RMVmhvVzZjVTBMZUZxRC9wYUVFV1l5?=
 =?utf-8?B?Q0VuakRDZC83SkZScnBhNDAzU0d3SXVjaThUVFBXK3lnNFlrWXBab2MvbXJq?=
 =?utf-8?B?MEphYzR2emNLZzNlZmxnT29RK0VqZW9OL1gzUVJ4d1FIQ1FIVTR6cTh3eXJI?=
 =?utf-8?B?emw1dTlFcGI5MDZ4WjgyN2Ywd0M1ZTlMS3dwd2ZRRzF3elMvTzNCcndUZnc1?=
 =?utf-8?B?TndZSFhlQWxpRlNLaFNKd3VuQWtsTndhRERyNHFLY2RNTGc3cFV3ZXNHT1hE?=
 =?utf-8?B?cDlYQnJRUGlLaHRpTnBPWW9icEhkT05wdlUyRVdmYVBROE5pZ25oZ0xkem9Z?=
 =?utf-8?B?OURnL0JwaG0wSHkxMU5CYTkvTjRTbkhiUklkNmFLNnlCaXZGMExzZDNCbFQ0?=
 =?utf-8?B?QVRzU3JmSjQrQldLV2lyQ3piZE96cWNWM3dDMVVpZjVoYjFoako4SFk5bVRE?=
 =?utf-8?B?MUprY3dJa0dPdlZPNzd1cmEwYmZQbDVwbW54alZTWjBEVUVLcnFFa3VzZThK?=
 =?utf-8?B?QnV4Z1lHRVFHT3lqYTNsTVlMTWRsdkt5bDg2VWszelhzYWYvdWcrOTBUYldO?=
 =?utf-8?B?eE5rU1Qwck9qUmkwbTE5SkVkV0grUjdPYS9hSFZ1S255d1ZreFI2VGUzZi93?=
 =?utf-8?B?OEZiamZybHh5a1RRSkVDcldmdGVNODNMSHhlVmJOVFN0S2hDNy9EWkwwZnNN?=
 =?utf-8?B?QUk2ZllIZzkvOU1hL29XbXdRYXZKQW42TmYrUndjTWg5dWwxam1JWFlMdTk4?=
 =?utf-8?B?RVZEQ2RBRGduL29YK3dXenpTRGpQa2dGTzJ3OTlvR0x5Zyt1RTF4UGFrUk9Q?=
 =?utf-8?Q?uWWDLe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnU5NjRJSGRHUHB6YmNlT2hOSGs2NHFzK01CRlpuWDFkbE84TWh0THI2RnhD?=
 =?utf-8?B?Z0hNaXVhbUx4b0UrSW1vRlJ4TW9YaExUM1F6TTQ3UGVsdnJtSTBQTFp2bThi?=
 =?utf-8?B?UUQ3cktWdWc2bzRBTURZK3Q5cnBueWlQVmNBK3JYZHJhcXdJd2VBSkQrODc4?=
 =?utf-8?B?Vm5ITmNQK0NqNzdkMGhDbjVWM0tvUDhiNW9OeENuQ2daOHpMaEM5WmhBeTB1?=
 =?utf-8?B?RXJVL0tLTnBVZkg1R0pEOHQxT2RrRWdjYzBFdTdWdGFBTmFqRzUyRWFHWU5L?=
 =?utf-8?B?N2FnV2ZOa0Zabjd4WG9sQWdyNjBucFFveGFLYTArSVNPNk91YUhrM25hR0do?=
 =?utf-8?B?a0FCT1ZBbU5XYk5aUU5pSHFqbE5JWEd2Y2pKbExUSWxUaDlqZ3o2NkpwWk0x?=
 =?utf-8?B?RWRKeEI5OG9YQ05ha3VGSnVYa1RzakdocDdKeDJXVTZNaFlpM1NRbGpwM0lE?=
 =?utf-8?B?OGFQRHlSQTR4SmxpcW0rTzRuVXNNTys3RDZTaUxqSU54K05yZzYrOU5wS3h1?=
 =?utf-8?B?cUtHeHRlbVFjcUEwWUEwbXBLM09qeXV0eWdxK1RrVVZUMlYzWVJTclJ0YWlj?=
 =?utf-8?B?ekpNZDk2UkxHSnpwSERaMEx6M21qd3NsK1dSY1JPc1VjTUFHRHFZb2NTTmIr?=
 =?utf-8?B?Uk92ZW1WVHQ5cnpUNTBFalpFMkFQZzBxTnFFTXlVUXo5bEFRcENUR0hZeEU3?=
 =?utf-8?B?ZlpqUVpyYnl0Zm9acFd6Ti9Oa3o0NlNSYkxydC8wM3ovODlUZkVSaXFJaHpG?=
 =?utf-8?B?N1kzTnN3dlNGK0doL1lZc3pmc3RKM25ocEU2SVFWTitJK1Y4U0VLOXphdzhZ?=
 =?utf-8?B?K0JFTEc4SW9mVlU5VFl3Tk9pclhGZVhsTDVVTFBGOEhnR3FpNFUrVHA2ajZj?=
 =?utf-8?B?SWp6SzljT3dGL0xtSjczbjZQVTlvOWZjbzUzcnA5MVNXdngyVlZmb1c4TXd2?=
 =?utf-8?B?TTM3RWtmTlhDSWswdjl5ekdZZmNES2JpcXkwc2toVmxQVUhzTFhDU0JWM2lE?=
 =?utf-8?B?Z3EzNVZHdmU1R2dDVERiZ2JtVDk5RkI2eE1DWTBzMkdsT0Uyb25YR3J3N25y?=
 =?utf-8?B?Uy9QaHNVQmlCNkkrK2RSVlpmWXJsWjd6TVlIS05TalFjUjhoRnBML3ExSGxE?=
 =?utf-8?B?MEEzVnZNVjVQb3JXRlR3NCtTeHVUUGNnWm1NUHpTUkdYdjByejlnbld0Ylhu?=
 =?utf-8?B?YmQ0eExyL25wREdtRXdaV2hyVXY2V2VISWpRa01RbkFNWUNPT3V0R2VVREh2?=
 =?utf-8?B?OHY2OTFteHJJSTJveERzUzc3MGVJVDRjRnl3U3JZdmRJSnRlTDQ1a1JaNTJR?=
 =?utf-8?B?bXNYUmhCbEVUR2lkN1lueEgzN3JnK20vT2JwQi9waC9QYTZYUWJrV1YwWC9U?=
 =?utf-8?B?ZVd4UElueUl0RFpkTVJPeWkweHFURFhNZUF4RkxxWEU0N2wyYWZVbEZzZXlw?=
 =?utf-8?B?THBXaW43aDV6RjU3aExuaER4eDdSMGdaWVo5T01ySTF4eVcwb01nT09lYWtt?=
 =?utf-8?B?a2sxSDZpTHAxSzZhb2VrenVlaStSM2ZVbEFEbThFSW9NVFA0Mks3V3c3NVJw?=
 =?utf-8?B?QmdVM2s4NWxPcFM0OTNmT0pTandDWmtCc2EySy9qQ2ROMENPbjJqc3NXeFZQ?=
 =?utf-8?B?TWVlekJ6K1M2cFdJbDBsejR3Ui9RWFRBM1VBdjZ2LzR0R3ZuT1RKTE44RWF6?=
 =?utf-8?B?WWhteDhUanN2QlBZcnMwb3dicEJaaGpjMHRKSS9nSGpuVUtyZlJ3ZE9DSUhl?=
 =?utf-8?B?R2MrdVFBcG84OHlweFVqNWRpamUxaGJ3cy80UitNTUpYdkcvQUdQK0phd2dj?=
 =?utf-8?B?cGpjaVNUN2lvbWd5d1hVU3ptZTNERXNuZ0ZqSnJDVzRYTFhFL3FIYXNiOFJy?=
 =?utf-8?B?MHBRVC9wdkRBYUU4VVNjakVOOXE4cEdLUEhMOXZVRXUvaWRkM1VPVncxZFMv?=
 =?utf-8?B?ZG5MbGs0MVFqeTB1cDFYOHlKL05Yc3VERFEvUEdrUlB3TmZYL1ppT2tQRUJ6?=
 =?utf-8?B?UGMwa2pCQTBhcjgyeFlMWDM5SUU1T1ozbVR1OE0rYXdCbG56OFlpYmhFeDNu?=
 =?utf-8?B?OWxVa1VoOGY0b1lSQTlSV05tVGFmT2twRCtLbno4enk1MkozM0xEdlRSRTQ3?=
 =?utf-8?Q?J1u6neeT0JHxo+lMAi+kNypz3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c86afbef-6ca5-41ee-9d9d-08de2e2c41da
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 03:14:35.2642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blJV1nHNCz/+CHMMgOb8SicAkze1xj8i+foo1r5SCRsc3P8Al82jTNmpDdp775aG/5weAu3/38f3jvLUrBUkPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8429

From: Peng Fan <peng.fan@nxp.com>

Add clk_hw_set_spread_spectrum to configure a clock to enable spread
spectrum feature. set_spread_spectrum ops is added for clk drivers to
have their own hardware specific implementation.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk.c            | 27 +++++++++++++++++++++++++++
 include/linux/clk-provider.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..6cd941a729590b501d66101e352b99e51ca18464 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2784,6 +2784,33 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_set_max_rate);
 
+int clk_hw_set_spread_spectrum(struct clk_hw *hw, const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_core *core;
+	int ret;
+
+	if (!hw)
+		return 0;
+
+	core = hw->core;
+
+	clk_prepare_lock();
+
+	ret = clk_pm_runtime_get(core);
+	if (ret)
+		goto fail;
+
+	if (core->ops->set_spread_spectrum)
+		ret = core->ops->set_spread_spectrum(hw, ss_conf);
+
+	clk_pm_runtime_put(core);
+
+fail:
+	clk_prepare_unlock();
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_spread_spectrum);
+
 /**
  * clk_get_parent - return the parent of a clk
  * @clk: the clk whose parent gets returned
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129453c241f1b1755f2c2f2a7ed8f77..9ec25bbccd613eafd77aca080dd7f51b1bfdadc1 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -6,6 +6,7 @@
 #ifndef __LINUX_CLK_PROVIDER_H
 #define __LINUX_CLK_PROVIDER_H
 
+#include <dt-bindings/clock/clock.h>
 #include <linux/of.h>
 #include <linux/of_clk.h>
 
@@ -84,6 +85,26 @@ struct clk_duty {
 	unsigned int den;
 };
 
+enum clk_ssc_method {
+	CLK_SPREAD_NO		= CLK_SSC_NO_SPREAD,
+	CLK_SPREAD_CENTER	= CLK_SSC_CENTER_SPREAD,
+	CLK_SPREAD_UP		= CLK_SSC_UP_SPREAD,
+	CLK_SPREAD_DOWN		= CLK_SSC_DOWN_SPREAD,
+};
+
+/**
+ * struct clk_spread_spectrum - Structure encoding spread spectrum of a clock
+ *
+ * @modfreq_hz:		Modulation frequency
+ * @spread_bp:		Modulation percent in permyriad
+ * @method:		Modulation method
+ */
+struct clk_spread_spectrum {
+	u32 modfreq_hz;
+	u32 spread_bp;
+	enum clk_ssc_method method;
+};
+
 /**
  * struct clk_ops -  Callback operations for hardware clocks; these are to
  * be provided by the clock implementation, and will be called by drivers
@@ -178,6 +199,12 @@ struct clk_duty {
  *		separately via calls to .set_parent and .set_rate.
  *		Returns 0 on success, -EERROR otherwise.
  *
+ * @set_spread_spectrum: Optional callback used to configure the spread
+ *		spectrum modulation frequency, percentage, and method
+ *		to reduce EMI by spreading the clock frequency over a
+ *		wider range.
+ *		Returns 0 on success, -EERROR otherwise.
+ *
  * @recalc_accuracy: Recalculate the accuracy of this clock. The clock accuracy
  *		is expressed in ppb (parts per billion). The parent accuracy is
  *		an input parameter.
@@ -255,6 +282,8 @@ struct clk_ops {
 	int		(*set_rate_and_parent)(struct clk_hw *hw,
 				    unsigned long rate,
 				    unsigned long parent_rate, u8 index);
+	int		(*set_spread_spectrum)(struct clk_hw *hw,
+					       const struct clk_spread_spectrum *ss_conf);
 	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
 					   unsigned long parent_accuracy);
 	int		(*get_phase)(struct clk_hw *hw);
@@ -1430,6 +1459,8 @@ void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
+int clk_hw_set_spread_spectrum(struct clk_hw *hw,
+			       const struct clk_spread_spectrum *ss_conf);
 
 static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 {

-- 
2.37.1

