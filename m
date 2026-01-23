Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B287299A81;
	Fri, 23 Jan 2026 06:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769148798; cv=fail; b=nQaiSE99IFIvhrUmVDf+9JeqkrTTpdsM7zW77fQhTS9RoGPg89YQjR7SiVpNOofrlCkDnUHrAE8p6z89jto1aLle7qZ0N6x+TlwG5kt5q6w/xQ0jO9ZmQ1AyzFrZUWU2M9DuV3WrRBp7WK0stbcfo2Wn3MGZocq30DBZc97f9HA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769148798; c=relaxed/simple;
	bh=di52mPuj4hLVFlf15M0VVUZkoS5T+os9gcTo+Qooy9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N2vHYZWc3Ix3W43Brj63dK1yBzBvMXKB86AQ8rbsoUHOyHFPg6to+t/8qT70pyWZgT/H6aLjRqKGaAtNfHWj7BCqQV2WJOLQbsZc3phtO8WnUOyCdhIwKv0b0jmqwkBY3TBtYcnHGeELSAxO5Ld1NWuuiFo6AyMg21eGQPxRk6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u6YjY+W3; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u6YjY+W3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6QStH2MURFv9PmX8dv1d5iSl4cYUMxTWyExu7jqpW0ICvXUXkXROQGTUkin5awdFWiV0R7AJmkCCINt2irY+vo5BGHyc03xsPKT4C340vLJQ8+7XCJiilNenbelQGI+soUoDkiUfFUvJKOUc8GKWD88gmhQCtAMxoipBVzCAkdRPazK9YQygqI+wTGSVGsCI0KPcVJGzZUknAZ3i6r5ZKqfJMQDAnuX0C7d2c3xUBHhAFhQJsuQ9IvkMgBCDHYNwQdDzeG1nPGcr3XncXKz2I2PE8LlbyEkgFcl6j+lP62b+jr0uRsbYYk/qNw1cQgCm6O3Z/vE+3NIdxhm2cP4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrGbo2L7D0H2RH3iPvh1Ab1HWPKVzZ5/HEW5YJ945H8=;
 b=jV+CBebjrV4IpCg4YIlyqBMYKKjXzFiKRTEL29YaBkyhDb+LBZx+04EjDB+WJudn4yERQkWBBBo3Nljm5W3qNFMFvG5lTNCIsYttGmiD69nfQFy2qEMMkFl/MZQvX37hYjnppQSwD7hsBF5Jia3pFBWLXTRFZorCAo2dh+gYVmH+ZuwrM5j0F2wEAjBkdzApIzfpU0d13isE8zEih5YXFQeTDqCexwxW6kORdUPTT4WR5zDEeKNN/8OmHIocbeUxZNpjOgNPDpeh3mH8Cm7rTa05m7ShOsA4cvcBYiilg9ruOSe1+7LxZ6+Ixne13OhN9T/jT+SCbSwkUIpSngr/HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrGbo2L7D0H2RH3iPvh1Ab1HWPKVzZ5/HEW5YJ945H8=;
 b=u6YjY+W3LBxStBQh2t8ev49nqWQNCZYkkJAceGVZspXRCY0urA5WwrxFi39izTH8tWh+aDaB9c8p+39uR0X6WYXMA+haidPQpBtwUK81rmRNqCTzZ6/pB5Mq0XcH4u7wymL8yrXgqKycopar7g3VUPCKzYcEGsAn2unRvuNwzbtGTaDQ2RG0a08gRnqiure1tnw8PdeQvnFHk9se++j0BktTjc6sebyodPw2KBafabF8bhR1KKYNsv7En/3wfvzeZFTtFNyr19IErl1bLK+GIHitmqK+I8hzuzkBEVx2Gm43yfZf+Tbe2MKkNEPnlISO9QD8cKvxlzaPaEpvDtzfWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7631.eurprd04.prod.outlook.com (2603:10a6:102:e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 06:13:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 06:13:03 +0000
Date: Fri, 23 Jan 2026 14:12:51 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 0/6] clk: Support spread spectrum and use it in
 clk-scmi
Message-ID: <aXMRY2oXA9PNdsL6@shlinux89>
References: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
X-ClientProxiedBy: SG2PR01CA0177.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 52590cb5-503b-4b68-863f-08de5a46772a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFdqekRMODFwbDRYbzAzNlFVUzFwMldvd0xLQ3BOeGRBMnY4SGhPNGZWMEEx?=
 =?utf-8?B?aEFYVCtld2VwdGVmWUNIT0JnL1VLbWFmYUxndEE0OUwrQWNzVkF6ajhMWFNm?=
 =?utf-8?B?MUFKWDlhU0d2anFvVThMak43UmVQSVJlWjh2Q1d0eXQzRGZ1TGx1di8zQ0FH?=
 =?utf-8?B?TWNXK016aFg0cWgrdDNoclZCT29ab1EyTmViYjlyUlJaTk44QnZMQzdaTWFl?=
 =?utf-8?B?ZDFsU0VMSW1CYXREVzFPMEZ5QytJdUVDZC9CbWVZc1lXcy94RWNkZm5RUFdH?=
 =?utf-8?B?ZUdIYkc4R2U1RFBPVjYyeUtGQ29oME52akdsNll2Zzh6S1dEeU85dUExbUww?=
 =?utf-8?B?c1JlNHZRS0VuQVc2U2JoM3lpc2ZIRUs2OEhjanFXdGg3a3Y3Zy9YamFONmJj?=
 =?utf-8?B?cFZFUEdWLzNaSWVxYkRQTUpqdTN5d0lGSE9XcHdpUyttNXpnSW1FMHprdFdS?=
 =?utf-8?B?b1d5NTZ4Z1hnaE1pcFFXTmR1Y2V5d29CNlA2Vm1MblNGME5oTytzSXFLQUY4?=
 =?utf-8?B?V045QnllN3JSNDZnaFFvWUFNZjNMcjBaOUFhTGhFL3B3Wk5vTWFWZVlHTEgv?=
 =?utf-8?B?d3RYN0YwRlp5SkoxNXE4OXkrbUY2Z1Z3REw2Y2t6bE9SbXI2NkZEaFJmTDFu?=
 =?utf-8?B?SEZveTkzUlV5bnl0UVE2R1lxR2pyNXhqQWVQRG44RUFWS1pmV25jczdqTXBB?=
 =?utf-8?B?em9Vd21zbHFTcktwb0xmbUlUNG9MK2IwMVZkMy9EejVSdy9JUk1ibkh5WHBw?=
 =?utf-8?B?WWJCTVV0dC85VnNocWpOOFFLN3hjMTQrRW1Dd2hPS3VZQlpIb25qTHFaRVNm?=
 =?utf-8?B?MnZRMk9uWk80RzNVQkJjdURhSmQyc0ZnQWh4eDZXWWJxMzJpMjV0Zys5Zi95?=
 =?utf-8?B?SE94L29VUk9ZUi9hWVhoMmxIejZHMHJkcVU4ZktFS3h4YmIwZ0Vvd3F2UFkw?=
 =?utf-8?B?ZGdXT3RaVnhMQktUOGNORG9saXNlY3ozNmRSeko2T1p3d09vYUdiSENtc3hT?=
 =?utf-8?B?VEJVWXFHODI0MjhCRFQrUVFTeUpTeFlZc0l1cmFYeG9RcENwcEV3ekducEtS?=
 =?utf-8?B?S3JnVk1qTXFTYVU2ZkVqUC9GQmZqTVpMb3hQUkNLQUVoN0dGOXpFcERTSEU1?=
 =?utf-8?B?QlRhSExVRmkzSzZrdHlVQm5EZnZQaWprZExCWmZoM0hWcnNIbEUySFlWVHli?=
 =?utf-8?B?VTFQY2dnVWx5NXMvd2xldWpTUmp6akI5Vm85SkdjZld6NGtJbEhjSkRETE1x?=
 =?utf-8?B?S0tmanpmWUJFVjRNamFDWWlzY3ZQbDVUSlEyNDZDQTc5V3RudHlvNHdmY3ZV?=
 =?utf-8?B?WHViNXR1WUJPTzZ0anJjb2FGbEJzYWZVWi82MzdyVUUzeHp1MUs5K2xlbElO?=
 =?utf-8?B?cjk1clNLeVNybEsxWkQraU5RcDcyVllPR2k2cnlvaTk3YWJsVDNoSWl4MjF5?=
 =?utf-8?B?WlpIdUg5bUFtV1JrWXRFV29KNGlVd0o2elFSWnhjSWZWMlhQblFUMUJTeWFF?=
 =?utf-8?B?OVlGNEE2cFcwWHhuT2szWUpGTXcwSzBKNC9VekN3djA1L2d2ZVliSlh4Yk1I?=
 =?utf-8?B?dWlva0tIZ3pHVE83TFlBUExoNkVYTlNZU0cyOENRVGtVWHlha2RRRElEcXhp?=
 =?utf-8?B?WmF6ME85NEJPMEQ0UUo1cEpHYUlMR1NGOTdVZGtHOGxrMmludUJuNDFzQTh1?=
 =?utf-8?B?enVLUGZGdHY2Y2xoc1VKNHhPQzFwVzE2SEt3ODcvOGN3SC9BQ2dmVHQ0dUJS?=
 =?utf-8?B?NTNXZ285b2lESDBtUTR6NjRiOGx5MEFEVmVGZWRlWWxTdFNTRVQwTmQrVkRo?=
 =?utf-8?B?Q053M2pVN1FCMHNpbXR5LzhSYzZmdEVicnlZVU9yM2VQQStqRHFoVHc2QVR1?=
 =?utf-8?B?RG11ZWFJSmVkdjNESDI2MzRtZXBxdkFBZ2hWbnArTFlRSXdZa3BBdFgrcHdv?=
 =?utf-8?B?UjlsSmNTQm84VS9TSHczZTVSUzdiWk90WGRjU3lxUm1oSVNTdnBGNUY0ZGlI?=
 =?utf-8?B?T1FYcTE3U09va2VWWktXYVJ3MWJSNXRNcDMyTnBhaG1BTE9wUjB4d2dkTC8v?=
 =?utf-8?B?OGtoVTVUUjJRR09IdHlYd0xZQ0FTV0t6elVGNFVCdm9aTnZDOSt3VlpVOUdF?=
 =?utf-8?B?S3R3TSs0YmRHdDZobWd6MU0rOENHVDlyZVY4V21UQW14cWlNdSsyTEJIWXVX?=
 =?utf-8?Q?bvar/VKSeHPpN/x2Lfry4vzxJn+ULsvUVDOceRAqu13i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkpnMlpmVjd5WUUrZE9UYU1ZNVNnakQrTGNsb0tCdGE3ZEJWalNrd1BuZGx2?=
 =?utf-8?B?RFdCbUh0bUNiSTBNZEkrRTVRcURTQW5BNEJDUHpVQ0JMaEV0YVkwU0VMTlhF?=
 =?utf-8?B?L0VsaUphejdyWVVVNjFMQUdWdXhKcklnbjZjN2RKZUhib2t5OXc5cFVnY0Fn?=
 =?utf-8?B?d0cxR3YxZHcrYmZnN0Jnd0c0N3dYZHhQZllvODI4ays5YnNjL282Kzc2bGM4?=
 =?utf-8?B?emRBalZlNGZ0Q2ZWbVIxWUdRTXpnSjlaMzhkOG5nY1pkZGZNYXF5a1R2aXVm?=
 =?utf-8?B?Q1RzNnpUVHA3R1o5UGwzK0U5MGtoZzh0em9YTkZBODZzTVQwZ0ZKYXRGakxP?=
 =?utf-8?B?R0xGRURDb29Zb3NCNnlnOEEzZlhpYmZsN0htWkVmTmhoSDBYWjJxcUZQcHdN?=
 =?utf-8?B?Y1AwbEJTK3FRdC91dWJ2L2Z6cUkvelIzcElPSUNkbEFLdHJTamNUZUd3b2Qv?=
 =?utf-8?B?QlVTWUdNOU9IQ3Z0cUFXcEkrNzlkZzZDUzhmbzFSOUNXQUllR3c5U00xMkdD?=
 =?utf-8?B?Tzlya1NCbEs0WmJiVW9aWHA1QWNOQ2xFR1JtMEZXMkhpbnJyUVVZblVhYjFj?=
 =?utf-8?B?TWxTMXdENXNHcms2ZFJtcm1Ta2RES2ZQRGRnbTBueE9iN1BVekIyU05vN096?=
 =?utf-8?B?SzFVVGRwQUNrVUNmOE5tVytrdXN5aFd1amZXUTNYM1lwbzAvb1pMRDdYK1gy?=
 =?utf-8?B?MU1NTE1vN3dpcXBIbFB2VERHeVdSV0E5aUg2QmFPRzRYekVtUDdScko4SEY2?=
 =?utf-8?B?OWZEMmJaZU9EbTNwMUtxaGRlT0lKUU51SC9PMDU1NWpnK3U4c1NFSFRLaktQ?=
 =?utf-8?B?cERlNU9VSmw1TzJqblQwYWE4RFJxckNoUlFLZWhmZkRMRXd5Wkc2SlFJWWZh?=
 =?utf-8?B?Z2VWRnQ1eE0vd3hXeUhlNERsWmdmS3VITU1iaFdzaVFoMXhNMWRUSmg2VWp1?=
 =?utf-8?B?cjNBVy9FRUNQMnZUbTREVmJXSldCanpyVlM2bjRmcmdzTFRjZTRIaDFLTnh6?=
 =?utf-8?B?VVJtN2I4R3UzRzVMQXVPdUVHWlJpU1pLQWxJcDlHcUxoeG5GUXJKT2Zrd043?=
 =?utf-8?B?ZDVMUHduZ1phRHlyZkNCdzVlN2NRNE5IaHNjNzJVYTA0Q2NMMzl2WWNFc0ZT?=
 =?utf-8?B?OTBYcnlxU0NjSXhwMVZ0bXhjVGtmdlBRTlNWR3VGY05ZTFZwbHNWYUJvTWE0?=
 =?utf-8?B?djJUWGNQNmtEM2dhWXNWNFdzNlhUSm9GUWgxWWpTTlFJRTBkVkFHMU51WE9Y?=
 =?utf-8?B?ZWRyOUVmU1V2bFJLSTVGKys3TFpBUEUxeUdLcmMwRkVHeElhSGlCdU5ZVXgy?=
 =?utf-8?B?RUt6NG9wd0lWaXBmZElOVXQ4d202L2JvWDRrWldqU0lHN21TNmllNnNmdlgy?=
 =?utf-8?B?RldiZ1g1OTU3bUJXR3B4U0F3d0Y3U0JSZ3VDRzN5WGdoaVY4MVlXQzljbmk1?=
 =?utf-8?B?aTNwa0x3SkFBUFVuOFhOY1l0V3BLMUFxdzQ0eEQyR1FuU2R5OEpNWWFRSVpN?=
 =?utf-8?B?bVFRRDF5OUFVemFsdm4xOU1TTWxpOFdMTjR1VGltZFlZTnQwSHJvRjRkUmZY?=
 =?utf-8?B?aHBlNGltUy9jVXVpZy85MjdzM2UrZStVYlhKY0s3M1FrVFFIN0VIS1Uxd2Vh?=
 =?utf-8?B?U0czZUVHNEk5YnNIOVQxMEpSM1d4WmhJbG43T2NyYkswcU1yWlo2Ty9zdWZR?=
 =?utf-8?B?bmpEMlhEbElTRWVIVWl6Rzl1OXJiaW95SnRJMTFNcG5IaWJkUXB6NXJxK09F?=
 =?utf-8?B?NVlOZmgyb0I3c1ZXelZpM2pic08wdHBNazlTQUJQU0poeXk0SXRIODQ2bGU1?=
 =?utf-8?B?ak1WK0pCdGFUUU16cnhGV0MyZDN6NmdZRWV4MUF0TEUwOUtJS2t2bklTc1pQ?=
 =?utf-8?B?VjN2Lyt3RUxRZzYzU2pGaS96WCtWQWRNa05sZWtPcFNBLyt2TlYySTNiU1RH?=
 =?utf-8?B?djNWSlp1a1lkKzgxZzl5QUhhTVI5eXVUUUdITkdrVis4QUY0NHU4ZHVId0xN?=
 =?utf-8?B?UUxDdTZBSWZpZUkwRnJ2MU8rZVVOZy9NaWNFaVN5VFE1WWd3b0ZzbEFROWsz?=
 =?utf-8?B?c3daVXR4cjZadTFQU1QxU3VwdnAySFh1S1hqWDluRTNOTU5INDdxcEI5dmky?=
 =?utf-8?B?bmJxZ2x6TkxOTEVDd0tkRzByZHdhV0JvVVozdjhFWGpvWUxWK2VTWVoxOWY4?=
 =?utf-8?B?U2lGSmdGdnVSZ0pzTzhYU2dHdS9FVGN0U293WEZMRzIxLzcwUmNVUVJ4aE16?=
 =?utf-8?B?djdwREcyT0ZydmhuNjZ3RStWdVRPQ3pycGgrOHVqU1JCempUN1cwUnAzVlV3?=
 =?utf-8?B?VVNZMkRUc3NRSkVhMHI4eXI0TWRKOThub04rNzZobGJ1d0FhLzRFZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52590cb5-503b-4b68-863f-08de5a46772a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:13:02.9633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zanq2Cp3pdCs5BNi9HMY8DjEK2C0HYq+Ag1IZ5OLz50NuY561sTGezg8pN6rHkThpesWMOr4T7yqQphrdjq22g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7631

Hi Stephen,

Is this patchset good to you?

Thanks,
Peng.

On Wed, Dec 31, 2025 at 06:12:47PM +0800, Peng Fan (OSS) wrote:
>Since the assigned-clock-sscs property [1] has been accepted into the device
>tree schema, we can now support it in the Linux clock driver. Therefore,
>I've picked up the previously submitted work [2] titled "clk: Support
>spread spectrum and use it in clk-pll144x and clk-scmi."
>As more than six months have passed since [2] was posted, I’m treating this
>patchset as a new submission rather than a v3.
>
>- Introduce clk_set_spread_spectrum to set the parameters for enabling
>  spread spectrum of a clock.
>- Parse 'assigned-clock-sscs' and configure it by default before using the
>  clock. This property is parsed before parsing clock rate.
>- Enable this feature for clk-scmi on i.MX95.
>
>Because SCMI spec will not include spread spectrum as a standard
>extension, we still need to use NXP i.MX OEM extension.
>
>[1] https://github.com/devicetree-org/dt-schema/pull/154
>[2] https://lore.kernel.org/all/20250205-clk-ssc-v2-0-fa73083caa92@nxp.com/
>
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
>Changes in v7:
>- Add R-b from Sebin
>- Drop __free usage per comment from Krzysztof in patch 3
>- Link to v6: https://lore.kernel.org/linux-clk/20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com/
>
>Changes in v6:
>- Add kunit build warning
>- Update OEM string comparation per Sebin
>- Link to v5: https://lore.kernel.org/linux-clk/20251009-clk-ssc-v5-1-v5-0-d6447d76171e@nxp.com/
>
>Changes in v5:
>- Per Stephen, export clk_hw_set_spread_spectrum, use enum for method,
>  add const for set_spread_spectrum and rename clk_ss/conf to ss_conf.
>- Per Sebin, Cristian, Sudeep, I added clk-scmi-oem.c to support vendor
>  extensions.
>- Link to v4: https://lore.kernel.org/arm-scmi/aNQPWO6pfA_3mmxf@redhat.com/T/#me81231bf286e2a8e4e00a68707ed1e525a2b4a3d
>
>Changes in v4:
>- Add R-b for patch 1 from Brian
>- Drop unecessary change in patch 4 Per Brian
>- Link to v3: https://lore.kernel.org/r/20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com
>
>Changes in v3:
>- New patch 1 for dt-bindings per comment from Brian
>  https://lore.kernel.org/all/aLeEFzXkPog_dt2B@x1/
>  This might not be good to add a new dt-binding file in v3. But this is
>  quite a simple file that just has four macros to encode modulation
>  method. So hope this is fine for DT maintainers.
>- Add Brain's R-b for patch 2
>- New patch 3 to add Kunit test per Brain. Since Brain helped
>  draft part of the code, I added Co-developed-by tag from Brain.
>- Link to v2: https://lore.kernel.org/r/20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com
>
>Changes in v2:
>- Simplify the code in patch 2 per Dan Carpenter and Brian Masney
>- Rebased to next-20250829
>- Link to v1: https://lore.kernel.org/r/20250812-clk-ssc-version1-v1-0-cef60f20d770@nxp.com
>
>---
>Peng Fan (6):
>      dt-bindings: clock: Add spread spectrum definition
>      clk: Introduce clk_hw_set_spread_spectrum
>      clk: conf: Support assigned-clock-sscs
>      clk: Add KUnit tests for assigned-clock-sscs
>      clk: scmi: Introduce common header for SCMI clock interface
>      clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver
>
> drivers/clk/Makefile                               |   8 +-
> drivers/clk/clk-conf.c                             |  75 +++++++++++++
> drivers/clk/clk-scmi-oem.c                         | 103 ++++++++++++++++++
> drivers/clk/clk-scmi.c                             |  44 +++-----
> drivers/clk/clk-scmi.h                             |  51 +++++++++
> drivers/clk/clk.c                                  |  27 +++++
> drivers/clk/clk_test.c                             | 121 ++++++++++++++++++++-
> drivers/clk/kunit_clk_assigned_rates.h             |  10 ++
> drivers/clk/kunit_clk_assigned_rates_multiple.dtso |   6 +
> ...kunit_clk_assigned_rates_multiple_consumer.dtso |   6 +
> drivers/clk/kunit_clk_assigned_rates_one.dtso      |   3 +
> .../clk/kunit_clk_assigned_rates_one_consumer.dtso |   3 +
> .../clk/kunit_clk_assigned_rates_u64_multiple.dtso |   6 +
> ...t_clk_assigned_rates_u64_multiple_consumer.dtso |   6 +
> drivers/clk/kunit_clk_assigned_rates_u64_one.dtso  |   3 +
> .../kunit_clk_assigned_rates_u64_one_consumer.dtso |   3 +
> drivers/clk/kunit_clk_assigned_sscs_null.dtso      |  16 +++
> .../clk/kunit_clk_assigned_sscs_null_consumer.dtso |  20 ++++
> drivers/clk/kunit_clk_assigned_sscs_without.dtso   |  15 +++
> .../kunit_clk_assigned_sscs_without_consumer.dtso  |  19 ++++
> drivers/clk/kunit_clk_assigned_sscs_zero.dtso      |  12 ++
> .../clk/kunit_clk_assigned_sscs_zero_consumer.dtso |  16 +++
> include/dt-bindings/clock/clock.h                  |  14 +++
> include/linux/clk-provider.h                       |  31 ++++++
> 24 files changed, 586 insertions(+), 32 deletions(-)
>---
>base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
>change-id: 20251231-clk-ssc-v7-1-402dd4f9e629
>
>Best regards,
>-- 
>Peng Fan <peng.fan@nxp.com>
>
