Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020130.outbound.protection.outlook.com [52.101.128.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB541F8691;
	Fri, 17 Jan 2025 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737110228; cv=fail; b=QSJ7i5mGS3oul2ZStia7FCnsTrGb3DPeIY+Qwpqx4s934dqgVs5UV8OKFLLxGK7RBPMOnSqfUcXdDItRNjoddkIpiQpiTxcxeS7/hMlnPICZK/oqg5NSCQ8kvgh50N+174QWbPpCAqhW+z4hnvgRGHDghwQWJL+vR4NY/vNIfN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737110228; c=relaxed/simple;
	bh=FtyCMt3ZzTCdWQY6x2nYG0laOuYN+PCPGSylR/44+EE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hsazzOI8GQsZLDZaF861aghsQACWzCqVXaRrXQBFfXcGZWiUkHdQeNZS0LluXBf/KEkvzy/JF/ODkahV41GE/LvT6fZQxCAr3yqZTUlyzgcrszu8WMymbpJgsxJuzDoiGTBM9dMGpsUbXJBFnVzfrpTdQet5ai2xrzzEILD1iE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=BhO6OtG/; arc=fail smtp.client-ip=52.101.128.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="BhO6OtG/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdhQ99X90TVFgb0O/ffyagulU9vkXP8MAVw7EqEHQSE4C+MacheJlxEtbsi+bKstimms7d01BpmcJZlpaGF4MccVzhDpgVXa8iWjO9esktOW6Mjbj0cfUZ26O03mo1LminZwfZDJkPwX4Av/v94f5cHpPsfVD/nPQrY7c560iUkoDimXiT0FoUQemY1HHxvf4GvYPZpKhV7itIQGfIITQDY0SHB5I6sl5t+tpK4RQAixghlX6qH+FK5Mp/TvEHsskYQe4XDG+mhGkXtZonNXXvev9mzIxc8pGI+MURsIHySoSQ5HUYh6M1Fwn4ptDGX7n+g9bIQRpVY1ZJ4744LV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPqV/HkIbDEqsf4qVDHlZ8i34of+/C7MrOjF9M3/Jmg=;
 b=LgS2hJXrrxF5lbAOU5NRpfI0G3hZX537VSQE0EKyRzIyrLLJodUfosnXd1Bm+r5nz8W51SdItiAm7UqO1dO7elQdPGAhG2iamoAfqjYb7W0ru6oENVSHwnVZPp7r9/rX8CvHiW01vZwcuRTk+vvUlMYTbKK9kqoIke9fzujbo+UPcw0pHKgaDWLI2vFzoSyK9h2ko9oD+LrGI5QPuR4ZKBYj2Uonq/w2jErcAcLNF4yaPNH8asypWYFK4xbOg+fz7fVUQ/aiNT+EEqeYKlGRKFUlu1bcExkxdGxFGpNp+GN+xR/IAok7e7KvmaZnmvJDCKTCM5a7VtaXHfISpiRmFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPqV/HkIbDEqsf4qVDHlZ8i34of+/C7MrOjF9M3/Jmg=;
 b=BhO6OtG/go07N7815KC8AfEp6wF+1/9UGTCnUa8xqZvJ0pX0WEgvxHnCTZTNnbeQ0I5C+BoZya2/UptGAoM8PCbr8C2Csf9xwE3MAdLZJ9PRuTwt3bApnHuYiE2oG24ewz4Y8JFpfkd9nEP4OhNp4Zm5KEjewH1dP0e5rcWNhTDnWtZCKmjUodRvTBNJO/fyOIQ03XQ7UGw5qEwIPNzOfm51zb7E+is1dJFq7HPxAFKndOOp8VsG46SyKJC1Iy0ZKkDIdSxuCgywIBYUG1HvjF83wZ327cgFYYUMv40X7jof/pmQ7+7eI9NfhgKqHh/3BuS3kY/0xJE5R1mJT9eN5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by JH0PR03MB8024.apcprd03.prod.outlook.com (2603:1096:990:3d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 10:37:01 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 10:37:00 +0000
Message-ID: <ec0de6c5-36a7-48ff-9ae9-2b4fce8bb8f0@amlogic.com>
Date: Fri, 17 Jan 2025 18:36:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] clk: meson: t7: add t7 clock peripherals
 controller driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20250108094025.2664201-1-jian.hu@amlogic.com>
 <20250108094025.2664201-6-jian.hu@amlogic.com>
 <1jsepm7f2m.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jsepm7f2m.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0043.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::12)
 To KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|JH0PR03MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 369ad705-a2dd-4da5-eec3-08dd36e2dff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGViRno3VWN4U29GeFV0dU43OC9VSU5JaVZNOGUwaHBCQ3JacVdmaVp1SUpG?=
 =?utf-8?B?NVFqcDV4blFkUGVkNmVTZmFJc3NFa29PZlFVMHpQcnUxSm56TlVvNi9xY1M4?=
 =?utf-8?B?blBiTHh2YkpBMlE2SW14SlI0SGFEUW5IRW5DenhabWM0TWNBMlU4V2twQjVk?=
 =?utf-8?B?MHJ2TmdVVExxdFdLWE92MUFyeUtkeFBnQk1OQXFNVnJmM1prbTBMV0R3bUF0?=
 =?utf-8?B?WjFsU3JSTGxpTCtncXBaT2ZmOHlSZ1pvVFpKdFZEL2ZFYy9jTGxJQXMzY2No?=
 =?utf-8?B?R1FlYWdjYURMMHczSzdrYldDZTN3UUQ4UzJna0xMTTBVT1BDZXhObjdvdXk0?=
 =?utf-8?B?S2ZJYWw1bTJoRG03ekwxL1lBZ3MxMGlDTFJWTkMvZDZicnp4RGpJelRYQk9R?=
 =?utf-8?B?MDhURGJtMkd5TCtSZDV4WkRaN1VHMERMUHZnWkc3TTU1NUFZMGsvOENPR3R3?=
 =?utf-8?B?elFESkk4aytrRWFaejBXdzd1UWloU1dmVlZkczFpSlI5V1A0UVNSQlR5RzFV?=
 =?utf-8?B?OUhlUmpkeXdpTFo5bkt4eGFhUVZLSFFTTktacGdsY0puVWJlRjVwcTNrb2Jp?=
 =?utf-8?B?bGFWN0wwYUk4QXArUEZsZ055NGhYWWFnSTcxdC8vN0RPT2FQem5RSmJxU2Va?=
 =?utf-8?B?WTE5Z1FVYm0ycWc0N00yUTlIQW9QRTY2OUVvNzQyS3pTTjMwL0JzSmJQWXZp?=
 =?utf-8?B?azhvL0VCbkNrd2ZlcktZYUJYVGNCRkptaEhTRHpuVk9ORWIxbEhYUWUwS3ZH?=
 =?utf-8?B?cUxDYVdsUGU5clF3WUdKbnlDREhSNERIZ0dRM2dFejB6WU1DWkdldEpMR3BD?=
 =?utf-8?B?VVdTY2o1Uk93OXJCUFRIV04zZjBDWWpYWXl2N1podjkzOHhnVU5YVlkreE84?=
 =?utf-8?B?THUyWDBZaG0yc1NRaUEwR3lFV0dpcEhyeUF1amVJT1QvS1ViZThVcWt3aXpI?=
 =?utf-8?B?U3NmM2hub3VYY2ovZG1BMDVFc1h6ckt4V3NBSE1jL25Qemp4YnM3UUxSOTRs?=
 =?utf-8?B?S296bkJSaGk4eTk5Q0g4eGhhTlFDblREbjVTY2Eybm9qbTRwaDM1aVBiL1J3?=
 =?utf-8?B?ank0c2FMVjExa1RrajZmcmt2U2JwQ3hiQ0MvS2VoYTJESVJiQ1cvdkdzREpB?=
 =?utf-8?B?ZGJjQk5sbmZjeGRmczdzazdod2k1WTM1NVQzRXJDUGdSNGtZb3FVTHl2YS9t?=
 =?utf-8?B?amIxa3E3NkFsSTJSaCt4a1BiRUVhbkF1NUVvNGx0VEhDNnI2ZDdsaDVxUzVZ?=
 =?utf-8?B?ZWR1bFoyQk9YdHBYQlFuVWVNZnFzekY4dnRlV1gyUFdJK0JodjFEUjZydnF5?=
 =?utf-8?B?MUlPLzZOTEV1aFNCdjFSTm84RWh5SkFPWk9NVHVMc1YyTi91bXkrWVlaK1A0?=
 =?utf-8?B?Wk5scHk3dkJhYjRRaHMyRlgzQkJ2b3dtK1FlUThLKytQQW5acjl3R2UzcWJ4?=
 =?utf-8?B?enQ4N3FQTWNJS1dBRzI4bWhyVnZPYk9md2pKY1d6dXJ4QWNyMlRZZWpueEl4?=
 =?utf-8?B?QTBERWF5Nk5iVWxnNjhsalFvZy9lOUwxeGN3MDU5aEI1dTZKTzRVNHRVNDk2?=
 =?utf-8?B?NVhEb0o2ak5sSCs3TDVvTGJVNFIyOTNhTGxEVDlVSHFST0RuamwzY25FWFhI?=
 =?utf-8?B?enVOc1I1cHUzVDlobU1QMUJaYitsWDVUakRzckpBelg0cVF0REtKZGlZR00v?=
 =?utf-8?B?ZGsyV1A3TnFPUlEzdDVjVjQ3OEFBQTU0eWNyd3hCVWxCMEZlWW9BSy96ZHZ5?=
 =?utf-8?B?SnJGMUpBVmRrMkM3T3dQd20yZ2tMQkZpY1JaQzIwbmRueUVlQzdKNkcyZW8z?=
 =?utf-8?B?Y1prWStoV3N3MGVWWkk4enBHVElWWkRuL1N3YTEvazI2MmpWNS91NDNtdDJi?=
 =?utf-8?Q?lpYpK2O1JDUKD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGpuWjFZRTRIa1RLUHM3Q01zUlU1cVZKWnQ5SDZON05tRzMxS0pxczVhMkk5?=
 =?utf-8?B?aGNoQ1ZzVHc4MFBNTkVBWGtBU1VJSFZvVERtc3EzeFNzc25wT3ZIYkhPWmgx?=
 =?utf-8?B?MzNZalliVWxZTmhqdTg5Ny9nS09SU0w2M0JGazUveUljMjlHWnZ5angrWjBj?=
 =?utf-8?B?SW5iN1VZM0FDYlJ1akF5M0ZjbHhBak9kR0dySks1ZkQzMUZJc3o3WDdVVFJ3?=
 =?utf-8?B?VHZacDJROWxoNDI5R0tYU2JOV3pDK3p1WDQ0Yy92MU1OUGs4aklsZ3ZKbS9v?=
 =?utf-8?B?dXlFeSt1a3grcmZ4cFgwbE15cEhpalFZTmVoRWJGVzJKbWxUZXM5aG1IRVhH?=
 =?utf-8?B?MWFJNUVMbHNOdFlLUmdzQXRaNW9scTA3Rm5SNE1hOE1HVkMwdDdObFB1S2N5?=
 =?utf-8?B?ZVRRNEF0SkpvR2ZGT3RZbU9RNmY0NForRDhqaVh1ZHRQWmI2YkRtYXBqYmJa?=
 =?utf-8?B?Qmgxb29wR3ZkQ3NocEQyOWpBaWRLRHlKZitZMi81U3kxdC9jZURuK1R4bkV1?=
 =?utf-8?B?TFBSR3ZQZ0N1RkdCUFV3MUlxUEltSXl1RGpRc0dqN3VtNWZaa1U3YWZEOHNv?=
 =?utf-8?B?ck1wRFE1M2pONFIvNnIrRTYxVEpxMEVUYjgyMjJPQlZBT0szTG4zNzFEUlIr?=
 =?utf-8?B?U3gzWmRaRDZkTjRWaFFrTVdDM3cwdGVYUEVhb1l0OFFTU3VMdXU0N0hhT3Jt?=
 =?utf-8?B?V0FHL1ZrdjJ5K0RSeHJVZnl3c2xNZG1LOWI2MFRsSXdneDhpa2ZwcWlTMzhP?=
 =?utf-8?B?MEw3b2dDMnpIVkpwanRmTGp0cUlXeW1CK3A5cVBNZkhDa2FNbE40aVQzcm9t?=
 =?utf-8?B?bzRadmE0ZlM0WlJIRWQ3NW4vL1hjKy9qaFAzRDhNVEY4VFlobzdYbnZ2Sndq?=
 =?utf-8?B?OUt2Um9WWGIwS2p3SW1IQ0VZZnRZaFpvTW1CK0RtVEU4Rnp1UnhBOWt6K284?=
 =?utf-8?B?djZGdnY1QmtNNzhvRjVNVkFrMHdoVENtMCtiR05vRlpKOUhQU2RsWXhRTys5?=
 =?utf-8?B?aHZCcUFMOU9MSzRvR0o2VjU5MVR4ay9qODh6cFdrSCt6aW14NUhRSlVuRHk2?=
 =?utf-8?B?RUlENmNvU1FVUnViQW5RalZ3SVNLQU5PZ3ZGWFNWci9sWWlvazc0MSt0NDlD?=
 =?utf-8?B?WW1FN2RvRnZHRTkwcHUvdU9ObUdmaXgwN3crNS9GQmN5L2dvcTZxVjdhR01a?=
 =?utf-8?B?eVBvVFdpbWVqQkRZeExocndPOEtqdW1XYlpnczZoSk1hM0gzeExUS1BRNTJu?=
 =?utf-8?B?Y3drOWNPRCt0NUNWdjF3bWthSytuVkI0Y2x2anVNMTIyZjVWNDR0YzRpWmhJ?=
 =?utf-8?B?Z2dPR3UvemV5ZWtTWEw3NlFGZE9iK0NpSWpMdmVLdVE4enRFVHJRVFdlUkVG?=
 =?utf-8?B?bTVGc2VZTkdYMFNDMUg4VDhUandCM0U5c2JVbzRmYlE2N2dwRmZPTEN0enZx?=
 =?utf-8?B?dENlS1k1SUY2a2NOM1Z2MlcrcmEwVUJXTkVOTEhYQUcweWNXdHRMZ1M3cjBi?=
 =?utf-8?B?aE5PUGVDKzZnS1dBZ0tIdlNlK05kdHE4VmRCZWRWWncxVXRGUFBkL0ZSeHZm?=
 =?utf-8?B?R1N3VUY2czAzeG5EK0dOekJPWDltUzhDa1E1OFhBdVJLam01RkNkL3lKaElq?=
 =?utf-8?B?dEx4OHVMLzlWeC9YOS9QRlArZk84VHBCVmRSM2tBMTNFZWNZOWIybVVOa2ZT?=
 =?utf-8?B?UU5xcThXcUlFNjZlZmNTMGtnSXpNbzJONU9BRDZqMjZrTWZNQUIvOHQ0c283?=
 =?utf-8?B?SDE4N0N5WitmK2I2SWVLOWdwcFo0SjRPSzJwZ3gxWU43a3hoNkN0S25aNTls?=
 =?utf-8?B?TzFHWVhPTXhsZko4dlh2d1ZaOXVNL2FQYW0vTmxCYkMzYXppajhDQjVuWk1P?=
 =?utf-8?B?ZkUya3VreXhpN24rYzZIOXBhbHhhSE5NTCt1cTg3WjBMeHNGa2ZaaG02dlpK?=
 =?utf-8?B?UDEvdENVeUh1bTcvSVArc3dFa1pyV2xDdVQ4U2FJLysyVm1QcThaenhUVDg0?=
 =?utf-8?B?KytEUjU2amJrcTh5UGliOUl5dnJiVXJDZWpzbVlhVE1iUFNsMitBTXRJQmNq?=
 =?utf-8?B?L0RpeWVhQWdFUVRSczJBMkNwM0ZJTTl4QmhCaEU4aytzUGwrYnVhU1V3Nnpv?=
 =?utf-8?Q?ubAY+PmT3zXZ/9Woe53CjUVDo?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 369ad705-a2dd-4da5-eec3-08dd36e2dff6
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 10:37:00.6250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHXy8QbQQF8zP4ntqnNfiEA/iQlEA+fc6FA26Ic8158zrD6lFpdaD4+DzYqZcy17NgHZXrY2A181b4OxvPzioA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8024


On 2025/1/14 2:18, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Wed 08 Jan 2025 at 17:40, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> Add Peripheral clock controller driver for the Amlogic T7 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig          |   13 +
>>   drivers/clk/meson/Makefile         |    1 +
>>   drivers/clk/meson/t7-peripherals.c | 2323 ++++++++++++++++++++++++++++
>>   3 files changed, 2337 insertions(+)
>>   create mode 100644 drivers/clk/meson/t7-peripherals.c
>>
>> ......
>> +
>> +#define SPI_PWM_CLK_MUX(_name, _reg, _mask, _shift, _parent_data) {  \
> The same macros keeps getting defined again and again.
> This has been going on for too long now.
>
> I'm addressing the problem it will take a bit of time and I guess it
> will delay t7 and a5 a bit.


Great,  a common macro can be applied to c3/t7/a5. Wait for your good news.

>> +     .data = &(struct clk_regmap_mux_data) {                 \
>> +             .offset = _reg,                                 \
>> +             .mask = _mask,                                  \
>> +             .shift = _shift,                                \
>> +     },                                                      \
>> +     .hw.init = &(struct clk_init_data) {                    \
>> +             .name = #_name "_sel",                          \
>> +             .ops = &clk_regmap_mux_ops,                     \
>> +             .parent_data = _parent_data,                    \
>> +             .num_parents = ARRAY_SIZE(_parent_data),        \
>> +     },                                                      \
>> +}
>> +
>> +#define SPI_PWM_CLK_DIV(_name, _reg, _shift, _width, _parent) {      \
>> +     .data = &(struct clk_regmap_div_data) {                 \
>> +             .offset = _reg,                                 \
>> +             .shift = _shift,                                \
>> +             .width = _width,                                \
>> +     },                                                      \
>> +     .hw.init = &(struct clk_init_data) {                    \
>> +             .name = #_name "_div",                          \
>> +             .ops = &clk_regmap_divider_ops,                 \
>> +             .parent_hws = (const struct clk_hw *[]) {       \
>> +                     &_parent.hw                             \
>> +             },                                              \
>> +             .num_parents = 1,                               \
>> +             .flags = CLK_SET_RATE_PARENT,                   \
>> +     },                                                      \
>> +}
>> +
>> +#define SPI_PWM_CLK_GATE(_name, _reg, _bit, _parent) {               \
>> +     .data = &(struct clk_regmap_gate_data) {                \
>> +             .offset = _reg,                                 \
>> +             .bit_idx = _bit,                                \
>> +     },                                                      \
>> +     .hw.init = &(struct clk_init_data) {                    \
>> +             .name = #_name,                                 \
>> +             .ops = &clk_regmap_gate_ops,                    \
>> +             .parent_hws = (const struct clk_hw *[]) {       \
>> +                     &_parent.hw                             \
>> +             },                                              \
>> +             .num_parents = 1,                               \
>> +             .flags = CLK_SET_RATE_PARENT,                   \
>> +     },                                                      \
>> +}
>> +
>> +static const struct clk_parent_data spicc_parents[] = {
>> +     { .fw_name = "xtal", },
>> +     { .fw_name = "sys", },
>> +     { .fw_name = "fdiv4", },
>> +     { .fw_name = "fdiv3", },
>> +     { .fw_name = "fdiv2", },
>> +     { .fw_name = "fdiv5", },
>> +     { .fw_name = "fdiv7", },
>> +     { .fw_name = "gp1", },
>> +};
>> +
>> +static struct clk_regmap spicc0_sel =
>> +     SPI_PWM_CLK_MUX(spicc0, CLKCTRL_SPICC_CLK_CTRL, 0x7, 7, spicc_parents);
>> +static struct clk_regmap spicc0_div = SPI_PWM_CLK_DIV(spicc0, CLKCTRL_SPICC_CLK_CTRL, 0, 6, spicc0_sel);
>> +static struct clk_regmap spicc0 = SPI_PWM_CLK_GATE(spicc0, CLKCTRL_SPICC_CLK_CTRL, 6, spicc0_div);
>> +
>> ......
>> +
>> +#define T7_CLK_GATE(_name, _reg, _bit, _fw_name, _flags)             \
> See, redefining the peripheral once again ... something all the SoCs
> uses with minor variation.


A common macro is better for it.

there is common macro in clk/meson/clk-regmap.h, but CLK_IGNORE_UNUSED 
flag is added.

it can not be used here. maybe we can rework the macro or new one for it.

>> +struct clk_regmap _name = {                                          \
>> +     .data = &(struct clk_regmap_gate_data){                         \
>> +             .offset = (_reg),                                       \
>> +             .bit_idx = (_bit),                                      \
>> +     },                                                              \
>> +     .hw.init = &(struct clk_init_data) {                            \
>> +             .name = #_name,                                         \
> There is an exception in the naming convention for peripheral clocks.
>
> The name is soc id prefixed in most SoC. It is these pointless minor
> diff that makes factorisation difficult.


Yes.  I think a common MESON_GATE or AMLOGIC_GATE is okay for it.

And how about this change for it? it remove the old defination and add 
new one 'MESON_GATE' in clk-regmap.h :

--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -114,7 +114,7 @@ clk_get_regmap_mux_data(struct clk_regmap *clk)
  extern const struct clk_ops clk_regmap_mux_ops;
  extern const struct clk_ops clk_regmap_mux_ro_ops;

-#define __MESON_PCLK(_name, _reg, _bit, _ops, _pname)                  \
+#define __MESON_PCLK(_name, _reg, _bit, _ops, _pname, _flag)           \
  struct clk_regmap _name = {                                            \
         .data = &(struct clk_regmap_gate_data){                         \
                 .offset = (_reg),                                       \
@@ -125,13 +125,19 @@ struct clk_regmap _name = 
{                                               \
                 .ops = _ops,                                            \
                 .parent_hws = (const struct clk_hw *[]) { _pname },     \
                 .num_parents = 1,                                       \
-               .flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),     \
+               .flags = (CLK_SET_RATE_PARENT | flag),                  \
},                                                              \
  }

  #define MESON_PCLK(_name, _reg, _bit, _pname)  \
-       __MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
+       __MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ops, _pname, 
CLK_IGNORE_UNUSED)

  #define MESON_PCLK_RO(_name, _reg, _bit, _pname)       \
-       __MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
+       __MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname, 
CLK_IGNORE_UNUSED)
+
+#define MESON_GATE(_name, _reg, _bit, _pname, _flag)   \
+       __MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ops, _pname, _flag)
+
+#define MESON_GATE_RO(_name, _reg, _bit, _pname, _flag)        \
+       __MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname, 
_flag)
  #endif /* __CLK_REGMAP_H */
diff --git a/drivers/clk/meson/t7-peripherals.c 
b/drivers/clk/meson/t7-peripherals.c
index 362000fe4a7f..3a1aec703618 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -1750,25 +1750,10 @@ static struct clk_regmap t7_pwm_ao_h_div =
  static struct clk_regmap t7_pwm_ao_h =
         SPI_PWM_CLK_GATE(t7_pwm_ao_h, CLKCTRL_PWM_CLK_AO_GH_CTRL, 24, 
t7_pwm_ao_h_div);

-#define T7_CLK_GATE(_name, _reg, _bit, _fw_name, _flags)               \
-struct clk_regmap _name = {                                            \
-       .data = &(struct clk_regmap_gate_data){                         \
-               .offset = (_reg),                                       \
-               .bit_idx = (_bit),                                      \
- },                                                              \
-       .hw.init = &(struct clk_init_data) {                            \
-               .name = #_name,                                         \
-               .ops = &clk_regmap_gate_ops,                            \
-               .parent_data = &(const struct clk_parent_data) {        \
-                       .fw_name = #_fw_name,                           \
- },                                                      \
-               .num_parents = 1,                                       \
-               .flags = (_flags),                                      \
- },                                                              \
-}
+#define T7_SYS_GATE(_name, _reg, _bit, _flag)                          \
+       MESON_GATE(_name, _reg, _bit, &sys.hw, _flag)


-#define T7_SYS_GATE(_name, _reg, _bit, _flags)                         \
-       T7_CLK_GATE(_name, _reg, _bit, sys, _flags)
+static T7_SYS_GATE(t7_sys_ddr, CLKCTRL_SYS_CLK_EN0_REG0, 0,    0);


or another patch based above.  T7_SYS_GATE macro is not necessary,  and 
'&sys.hw' is needed for each sys clock.

and we can define the clocks like:

-#define T7_SYS_GATE(_name, _reg, _bit, _flag)                          \
-       MESON_GATE(_name, _reg, _bit, &sys.hw, _flag)

+static MESON_GATE(t7_sys_ddr, CLKCTRL_SYS_CLK_EN0_REG0, 0, &sys.hw,   0);

+static MESON_GATE(t7_sys_dos, CLKCTRL_SYS_CLK_EN0_REG0, 0, &sys.hw,   1);


Please help to review it,

>> +             .ops = &clk_regmap_gate_ops,                            \
>> +             .parent_data = &(const struct clk_parent_data) {        \
>> +                     .fw_name = #_fw_name,                           \
>> +             },                                                      \
>> +             .num_parents = 1,                                       \
>> +             .flags = (_flags),                                      \
>> +     },                                                              \
>> +}
>> +
>> +#define T7_SYS_GATE(_name, _reg, _bit, _flags)                               \
>> +     T7_CLK_GATE(_name, _reg, _bit, sys, _flags)
>> +
>> +static T7_SYS_GATE(sys_ddr,          CLKCTRL_SYS_CLK_EN0_REG0, 0,    0);
>>
>> ......
> --
> Jerome
