Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4416631985C;
	Fri, 13 Feb 2026 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770972934; cv=fail; b=C0raMlrpP3+skSu6TpSYdxz+Tcoh64ZWQeBNzTg+6usuFufCuPC6dKd4x1ivvLABoCF7fqeb7z/18X0W5mc5CfwvzIGMVMPTMWFAn+ceYUTVF8efviY/Z1cHnxtRqQPQUAzARQouNcIRHTK+GrCp7QO+tL7uc3Vwz+kji0dwteM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770972934; c=relaxed/simple;
	bh=wkVn3xqclij2j07sH0N9gkNATQYuIZvmp2WCDikHjAY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mkr7+u9pwd2OyZepzesLf24ClFzC4In8ug74Y4rNtJdBd4vLwa7vaJMiUgFacuQtq+NoAfCjV8/fqrXj3LnHauBu+F9UqFMsLDMJQRGVb8emNrkHyEhtyY32/nE8fOT2Ty7f39vmD5wZnZ8zV4UAjeUXkloJWSczvoSG0RGMmW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=G5HPP6tB; arc=fail smtp.client-ip=52.101.65.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="G5HPP6tB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTD5KRt6sMrU6pwIwVpDnZ+FSIhkMXnsxndr6Dw1YC9jZBAFM2zQOQzYSSp4xx19ACPMXUN9Rpe/mjoHTMg+4k2etLQvhsNMNbT4R1wQ4mEoOPEanD6zM6a4jtKzJ9j9vEN9hGHNt1fn6BRZj4JaY6mOxlIIg87lrlb7BPfPfkLkwJQDRuA9Trlif9BbHnUTQ6N4629OpXwEAMau8B6Ma1CUb1h4xKcA6a+kDEAGo7o6ldRNK/VBd5TMRLhexGWQBtS4ypoyfIJvOA9mCkijtgCeReQsgakckMop7kb3RTHPn7inVeIdvT8fS9aaEc9ZOItoLKkZKvP/FWPXOthR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qf9zLgD02ruSA77+gA+R+bnS0VifYCIh0DaNhbbr6Bk=;
 b=yTg1DNZNiVqr6pLfpeg8fEUQ+Y2QNZl4bYekE5buGtAIX9KWCaQWoq8Mz+V0y9N+8mYQcPF+ksoS73O+dnIgbADvzAiuJFprxZJO/V8EwYe6VROjRdy/splLnPOTweopH3d+6eSTvo1zQH5jnnXzUz9yr7dJx8BhosLcDohqzyJJqFZrMPoI1Z2W8j9hu100W0tApD6S1VWeJ0piXCAdULXYhBfqVFjPmMSdqOCdI52hikrvJFZICraMVsaPu3Bv3ucqe1+N2KlPe9W6q+817c0M8ICzubdNvneakb0uCVyY+1lmML7XpQii+ojCUmVKVTj27DF7cM/25cUckdiy7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qf9zLgD02ruSA77+gA+R+bnS0VifYCIh0DaNhbbr6Bk=;
 b=G5HPP6tBMmBe+hCoKiDcHxbGX/T/YSfsA8k+9FpoZn02Hl1a+kTKKcEUDIeaSEoZIcbBc7R1yYvhBWBMMapLzE93SOjz20bvP5u0rvIthxPgRmT6GMrQoWbOfR6XZp1qPi8DHV+OdOEkxootmVPe/AiTIH+0TQxEEIFo3d4DRRzKeVnSBvnBKh+N0Nxqdr0KHEuVsWgVPu4g8EFi8UbHjcTygRIhGAVCkjtirtSHZP4aBVyMiv0rTrvv7bl3+qudlMVMBzvesFnZKYNdR+NMmN4IjsOTmt0/Rl59ytiau4aKYIxQW+bz1KvQ320/EelM2xJ8v19FLiDMN4XgPAKE0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AM9PR04MB8540.eurprd04.prod.outlook.com (2603:10a6:20b:437::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Fri, 13 Feb
 2026 08:55:27 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 08:55:27 +0000
Message-ID: <1af793e2-bc64-4da4-90a5-2c17f1996da4@oss.nxp.com>
Date: Fri, 13 Feb 2026 10:58:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
To: Danilo Krummrich <dakr@kernel.org>, abelvesa@kernel.org,
 peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, gregkh@linuxfoundation.org, rafael@kernel.org,
 hanguidong02@gmail.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20260212235842.85934-1-dakr@kernel.org>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260212235842.85934-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::24) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AM9PR04MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f9a0f5-7bef-4066-f768-08de6adda1da
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGFrMm1sMHFsa2toVDhQZzk1MTNoOGRwQWM2ZCtKcTc0dUFsYllKeGRMczVi?=
 =?utf-8?B?alhoWTdtMkVnaE1FbzI5dnVmMWI5UnRkMlJDeEZWZU1ZZ1ZCcnIxWVR2akpY?=
 =?utf-8?B?WDFpVVZvSWtmYnYrSWJFUDVOTlFwWkNxWmIrcGlGVmdNU2dmWDRFR1A1bjdq?=
 =?utf-8?B?T3VxMk5zVlFsZStlMzdpVm9ZeWR2RDZKbngxZmJWSWoxU0FueW5hakJHYW1P?=
 =?utf-8?B?cnRBaGt1cS9YaXNnRTB2L3BzVmJhTGwvYjVTdnRwM0Z5TzEvSkdSMXNrbHJJ?=
 =?utf-8?B?Y1VjUmNNZlNyaGFVQzhSczZGZjZ5QnJYaUt6UkFnZWdUZ1BqbE1OdkcwbElU?=
 =?utf-8?B?NXNKUnk4Rm5WcjJ2bGtwcFFTOUVVWHZ3RFdTdURLaFpxZVNkV29wOXEzQjlN?=
 =?utf-8?B?RFp5cjBuOVVhYllvS0cvVC9PeG1wdkZnSzI2ODdyL2NFZmw4R21rZ3RGcUtx?=
 =?utf-8?B?cXdVNXh4N0c0em1ZeHQ1NGJzaUs5djEydUJSV1MvcmJ6UkQwRGlyREhiZjE4?=
 =?utf-8?B?MDZ4dDlLMUprdjQ2QU9kVUM4S3FKZEJkaVJCSE1ObllENWg3UHByTFYyczNy?=
 =?utf-8?B?ekZFMmxuamphU2dwdTJjSVA3UWxuK3VmNktmTjhyZktZcytySDV3U3hVQ09R?=
 =?utf-8?B?d3NHOHFwbmduUml3WkRLYWtEdlptemxjM2NvSmFFUi9PVFpFWktWS2RyTUNy?=
 =?utf-8?B?Y3FTZXRxVWRTOGhxc01WVi85cmZKRk9tOWpJZzNwWnFId0JscENObEhlOHZo?=
 =?utf-8?B?Tzgzb2I2UEkyRU1OVXd3blFDSVU4VmdDNkdRQmhKNVZjQXg4bFluTkRab242?=
 =?utf-8?B?aFZOanFTVDk3QnVqY01CTlJyMFd6bVlmQWNYY1Z6VGlyRndrZEdJeXg1STlj?=
 =?utf-8?B?KzJrTEQ3bnB4eE5ZYytRaGNCclJuNWNjcnJDMHdnUkhyd3lQdTlMZVNmS0Yz?=
 =?utf-8?B?N1FzMmdGTXR3cjBoYU5CcjF3NFZHWDBKVlFNdXN3TG5zQkd2d3grMXFvNWV1?=
 =?utf-8?B?YVlnenNIYzhUQ1pUMUo3NC9JNllJczgxQytFY0s4clFGQ0tZdit5V2hUUkFG?=
 =?utf-8?B?WXJ5bTc1bTB1cjN0RDFUanVsU2VwV25iOGp4M2Z1bnFIMHJqZGkvT1Z2ajVK?=
 =?utf-8?B?SG5mVURtUENYRjlPcDRFOUMwOUZsREZwUXZ3Q1NkOTU0TjlCS0NzM2tnVGJC?=
 =?utf-8?B?LzVENkU3ck55c1lDeHFUT3ErZXVGYVFyRlJIRC9OUjlwRVBLM0VtSUlGTzZi?=
 =?utf-8?B?bEozdWpOcnpNdUVxanl1YkxUa2J3OUltTUNDYkRhbFA1THo3MU1LRnFSbXZN?=
 =?utf-8?B?YWVJM3YxNUlEaGNzbkgvbzA0Ykg2N1hNTEFpVXBrOUJzc29JVFpPWnFOeGVk?=
 =?utf-8?B?RGR0bEJsdUVBd1JqM21tRHF3Z0lpdnU4Z1RDKy9TcWl5Y25PVDhvV2poOUVR?=
 =?utf-8?B?aXBoZktrOGhqQWgrVHpXWmpDdERPNHpnaGNIK1o2UlFnV0MzYmZMQVJxQUJ5?=
 =?utf-8?B?VE91TDU4YU1SRkNjS1RCTklNTlZKbndhSlhhd25WemVDckxiTWZ4R1JUdmd5?=
 =?utf-8?B?Ykd5M0NUTHR1ZUdManlqaFFoYWVvQUNuNW14aFYwYW5RUndrS3hWSDJHcVFK?=
 =?utf-8?B?YmxicVJxazR1ZTRHanY4c05mcVdidWNwTUtqV3pXb2F2Sm9JZXJoREpIRVln?=
 =?utf-8?B?dkZHSkdMcVlodHMwQlMyQU9nSkRXcGRLV3loeHdzNi9kUjlnNjRYQ21pZjgz?=
 =?utf-8?B?eWZmb1ozbjdQbWdOTkZTKzV0NVJHTVM2MXMwbmRhMzdCR3J0c0pYVlZoQm9a?=
 =?utf-8?B?bE00bVhVS2hLWGxFMjM4c0ozZzM0QTNjNWdFclpLR3VUc0VVdWgxdG9MWW0y?=
 =?utf-8?B?MThJek4zeVRoSlRGM1NMNnRHbHhPTktoOEl6TWdPUTRBMnlqc1RER2Zxc1Bt?=
 =?utf-8?B?UWpBSFRWbTNSejdISnhvNG9pNHQvdkFIWFhDRjdCbk9HQzdiYU5yMnE1YXIx?=
 =?utf-8?B?NktKcTFwajQ1UlNTZEI5RXdIU21sN3BOc1JoNFMwSWJ4Rk1tblFJQ1pZUmlH?=
 =?utf-8?B?MkxNM1ZQTTZTbUFSUTU4a3psdlZUNndHNkZMclFSVkFWU2NSYUNGU2RWamxH?=
 =?utf-8?B?TWpMVzNIaGxNUjQzUXVXR2dZOStld0Q4Q2RpL1B4cHhNWVZpN08rSUEwa0dx?=
 =?utf-8?Q?9p/g8iyW8JTcCKDtVV3jZ5g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QldMZGlaa3pHS2d4UklkdXRiUHBOV1ZiMmxoOWllVXZ0Ykc2TUltVGVmMmxE?=
 =?utf-8?B?Sy9jaFZlZ0JGUVJtMnRMWXcxb09rOW45WWt0ZDFSdkQyTVFmNFBvWktPTGtt?=
 =?utf-8?B?S1VESFJNMTVYZWhMRCtsRHZPeGhSSkJ1OFdVUy9zYlFsRktsak5tS2kydTNi?=
 =?utf-8?B?dzQ1Y2NnZUlsQ01sVkw2ekFLWXROWjd1ZS9RQTd6VWlmekhQTUhjaHZSWFBz?=
 =?utf-8?B?UXY4N3J5WDlWTmx5ZUNmRjNDWk5pY25PbUhKTVZIdGM2V1Vlc1U1UUJQQjRa?=
 =?utf-8?B?bmpmNjFJYlBkakhrY2lmN0lTTGRCOXZ3UWoxWEZzT2Joc1ZxWEZPRmNPcmg2?=
 =?utf-8?B?bVlPVDlGZ05BMjY3cE1kZG1UZnVUZXJFV2t3d3QrbzVoWWRWS0JCTW03L3JL?=
 =?utf-8?B?aFF4T1ZPRVNIcElSUVhIRVpRWmczOGdaTnYydmRKeG9BNWxPSG5SRm9EQ3F5?=
 =?utf-8?B?VEFHQlZvQWdWd24va0trblU2RzRJTk1uVnFNVnlqT2hsRWxQOW1RS1ZPODBk?=
 =?utf-8?B?UFdIdVBHdHdIY20yQTBxQVM1ZEd1bHpjV3B5cUphTmQ4SFZRUmlxQ2tVUi9N?=
 =?utf-8?B?dSs2NEM0dCtnYU50N2N2dUpmN0V4b3FiRW0yaHVvVWFPdCtDL2wzVDFoaHo4?=
 =?utf-8?B?R0x3TDAwcnZRSktmQTBWVEhIWUxCRGd5Kzd6elpHdEZub3RKUVJ5K1JWSmN2?=
 =?utf-8?B?aTZZU0RGL3NSNlMrYkg1Y0QyclRpZlRla1BLY2xiNVVVRDd5cUNDOEZUd05l?=
 =?utf-8?B?VVU1SjBzWjNZT1B2anJvTWt4eWkzYTlrMnZ2UVNoKzc3ZlFJSXBrOG0rZFdw?=
 =?utf-8?B?Wmc4ekZRUzRYNkk3ZTJMQks0Wk40eTUrVlMvam5jZmVsRXF0LzFKcWJNdkpM?=
 =?utf-8?B?b3Q2eXZjWkRBM3dkUWRGSVI4eHc3ZndjbjFHT3o0dVF6YWp5MUZGQkM2NW1C?=
 =?utf-8?B?Smx6aUNFNk5oTGE2WlF0VE9UV05WNmpvYWNYWGZWZGxkUkg3Umt5bkFtdS9K?=
 =?utf-8?B?ZTVCQnJwMzVoblVST05qQ1g1UjhOT1MycUxBdS9PWU5YVlV2ZVJkQ1V2dDJz?=
 =?utf-8?B?MjBneGhnZU5TdXlMMkdIaHZPNmN0WEpwVjRzVXVMOURDS1JzcFhqMFVTeFVL?=
 =?utf-8?B?WlJFNmk3aTJlTE42bDdhVitFdUZNZW5HQm5LRVdicUVxOVEyNG9jdmNBS2l1?=
 =?utf-8?B?cXMvZnFlN1YwcExWUVhoSUVtM09nZTkyU1grcVErVk1aWi85Q2lyMEw3TXVp?=
 =?utf-8?B?SjV6RmNHUWNhQWlhZzNRY1Fqejl5cGgrNC9VT3ovRlJBZjVPQkQ5NENNbHlE?=
 =?utf-8?B?TDI2MitVWnNYcUUvb2NqVGpFTXk0Z0JWZzlka1lpU1JTSlNqRUhPN05nbWli?=
 =?utf-8?B?L1dWSVJlUTRmNS9rS2xiMGQvRkhQUzltZW9LTytlS1lZUTdjYUFqTU5YTm5F?=
 =?utf-8?B?TnZXaXUrcU5mYlA4RGJVaW05RlkyUnRSTmdwSXU5Y2dVVVMzZUFnU09UNjBO?=
 =?utf-8?B?Yi9xeGxTZlRhaVZ5SzhzdUNDc3RQNHhsZ2g4NlIweTVybGZGVFNiRm5KOUI5?=
 =?utf-8?B?MndJeGl1YWZuWGNMVjNQb1RBNDBYWCs2VTVxQ1dRTExJb1YxZ1l1eXRpcjIx?=
 =?utf-8?B?M1ZlV1NNc3FOZ1VwVVE3TTJWMFFrSTJIOHpRSnJBUHdlWUNUNlVPUG1iR1hL?=
 =?utf-8?B?cnNZM1hzT3gwTEZxaU9WYnozRmp6d3V5OW5FWTRYOHhQVnVGMTZaOFpvZW0x?=
 =?utf-8?B?dWxZblpMRmlaQmVDQ0dvdk1YRis1Q1AxeXcycitNWTNrK3orbVAvbzhMcFND?=
 =?utf-8?B?UTA4aUVMYmlETDduNVJDbEdTMzZIV1h3UEFHd1RrV3ZDcFBPL2E2MzJJd1Fr?=
 =?utf-8?B?SDY1eFQrUUk1TXY4RVBPSmlQdW5HdUhESE00QWk0WVQxbXZqUUhyMVRNZ1Ay?=
 =?utf-8?B?bWk1NDN4ZVRXNDJNdWo4eWIwY3RXV094UHY5ckJLdTBWeGJ3ekw1aE8zaVBt?=
 =?utf-8?B?bEQyVjIwRSs2RHIxSlMrOFhSaWJHQXJVZkFycnVDL2RJMk43NmpaWkdwV2Fl?=
 =?utf-8?B?UWZnck5oeDlZVzdsbnZWdEt5ZTFNbEdwbnBsUjNWZEVDSXNsQ1VBL1FwZmpm?=
 =?utf-8?B?Z2gwWDArcTNhWmhHVzM2Rk1aZkI5TGFhNkRIQUhnamQzSStqQ0dzWm1acWFV?=
 =?utf-8?B?VUt5QnA0QU1HZGxLYnprOURub3hGRFlzMHUzejI2Q2RMWWhla1VTS2JRelAr?=
 =?utf-8?B?N0xBdHZOVnRKZG5ITzN1eStibmJtSE55UFp6SWxzZUFaZllCV1E1VzdEcUh5?=
 =?utf-8?B?bWlkWmVwdkhOc1pnNDA3aW9RRU9MVmJkRW9ENDNBZ28yV2hJSUxyQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f9a0f5-7bef-4066-f768-08de6adda1da
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 08:55:27.1519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfOsp0a9TSSay0oPiKt0c7ZyLwEq1BDvFvyZ8Xg/gH/dsVgC5JxYF7ZGMq6Vp/bBKBstbB1nV0U1gzVxM+C6kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8540

On 2/13/26 01:58, Danilo Krummrich wrote:
> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> called from IMX driver's probe() callbacks.
>
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
>
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> device_lock for driver_match_device()") leading to a deadlock condition
> described in [1].
>
> Besides that, nothing seems to unregister the imx_clk_scu_driver once
> the corresponding driver module is unloaded, which leaves the
> driver-core with a dangling pointer.
>
> Also, if there are multiple matching devices for the imx8qxp_clk_driver,
> imx8qxp_clk_probe() calls imx_clk_scu_init() multiple times.  However,
> any subsequent call after the first one will fail, since the driver-core
> does not allow to register the same struct platform_driver multiple
> times.
>
> Hence, register the imx_clk_scu_driver from module_init() and unregister
> it in module_exit().
>
> Note that we first register the imx8qxp_clk_driver and then call
> imx_clk_scu_module_init() to avoid having to call
> imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
>
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
> Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as modules")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/MBa8x
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


