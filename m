Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023085.outbound.protection.outlook.com [40.107.44.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2745F2253E4;
	Wed, 26 Nov 2025 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764145985; cv=fail; b=Ryb1X93WFqFvUO/E8eqTYpqZer05gZ5x1DyprGmmzNiL03ONtRyOSI/iNz9r6yDeh2MLazXXzyRjutH2Qo1aLx8wMszFiPGtt83iTIjXojMMZ6keQzSNy7pZGoh+ABrpk5Oxb1zewoW2QifTpUJ+YOmKbmrqEo7/+wOxSx9Up6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764145985; c=relaxed/simple;
	bh=LKOdnTb4dEMU+dBFxZvicPAJUj9RCwTj/LFhqkBqh08=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VmG7uy8eCkdm3YfotdctusD+rWg+pAWTbMdhynzpwwkDkBJBPvyYvJe/mZqbpeCu5k+Iv9cF5m2Oz2Wr406EqwpnUHjqYelxRLt0bvlSm/dViM5oCnjGt8Juuwrd5LX2qS5Sav5J8g6w2pDrhYIGq2dzTLaHlC/rkRTtSPWbb20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=pu7xwyAW; arc=fail smtp.client-ip=40.107.44.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="pu7xwyAW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FM9sb329/UQ6RaOFLbKXBhaPRjLqHmN3SasgiZ+XtGhzcalcrcGCA3Ps65Ye5ceOm4Q7jEnbjEnaAxzzdM/hLiGOJ+T+NCGJ43udD7tlM/dG5gDjFbYD8QfoNbaqaddJPi7Ud6c1zQ0wSh62jC6WfYNQV5q8NoXZk2pIHsmPXqFcHMk/MrLHoCILQrfelc0h5Tt0NFHw+8m6+cG6HytA2VE17MXJ1VjactTWIcf2OcZzzqAsBm1exYNWgJnMKY6JlSX7jNLnxY2twZqnWP8RGwARN8cZLYJ2J9kZIIpxB/vtM0JAlDC/ask/LK5qwAx0Bd7j0hkw2FnFBmSsOlzzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQgqIa7EKJy+v32tp2eCj0u1UyUV6UmrYyCFm2IVVj8=;
 b=W+sNMYyeB51swV0qbNt/a0keBqAVrRTUbvi3DnvzdtlK9GWPJBhrutzPQ4d7aeNYV9AMAZEJdeVQAbpk8LbYBemUjh83ir5R+ovv6o/G0FR2mG09L1yXx3paeix5jjoycswhMrJzq//K6A2fYPv5STazPE760T4qyJTuVMSmBTKBCb+4dA1TYibT+kAEFItT0n8ZfwFH72lr24ZZfyle6IK8p/6XD1eDn5vHQAgGzjW3H+nh3eo18Bvx97S/HLx5jPzI5MGa3EpDkjF2fjxh1Ie4I9bT+5DOhoQUHAkDbh9wkTq+s7QOrReJ/TY7F3V3EJ+jspawLFV37XyQgqFyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQgqIa7EKJy+v32tp2eCj0u1UyUV6UmrYyCFm2IVVj8=;
 b=pu7xwyAWsRkpdZV9S6sOswGX5QxPLqVJwuJRvq4n6505zeoM0ScsM3fwvY0aPtgfobtSL+uAHmE9/vt1jxthxFpX3rDpTcO8UM/gxwV5xQu/UPpt95AC/VWAEtWKLAGOoLrjgSJY09k2afuQlzJAf12ZMLUL+rh12gN8n7/NvghRWDV9psSV7m5FJUTQTucFgqQLtVplzDaIvosj0tkkriZN0nNj/VVO9yZdiykNmGF2+GNWiZbMFQt+ZHJR9nhcQebP3vfp3Txfggpwe6VO+0hdOWD80RS3D2CeR6osA1fC2nhV7U7lCABvu4eXT4ZqePC/65D7qd7+QBvB6Lruhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by PS1PPF87FC24EE6.apcprd03.prod.outlook.com (2603:1096:308::2de) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Wed, 26 Nov
 2025 08:32:50 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.9320.013; Wed, 26 Nov 2025
 08:32:49 +0000
Message-ID: <fadb2f04-c523-4c59-8e2e-960a8bb25dff@amlogic.com>
Date: Wed, 26 Nov 2025 16:32:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] clk: meson: t7: add t7 clock peripherals
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
References: <20251121105934.1759745-1-jian.hu@amlogic.com>
 <20251121105934.1759745-6-jian.hu@amlogic.com>
 <1j4iqjvkaj.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1j4iqjvkaj.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:4:7c::25) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|PS1PPF87FC24EE6:EE_
X-MS-Office365-Filtering-Correlation-Id: 274ff713-8fc5-4855-dbee-08de2cc6622f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VC9MeTRIdXNaTEFHeWQ3RVJJVWxSQmd3c0UwMzFuOWl2QkhTZDZuVDZPa0p2?=
 =?utf-8?B?OUZYcncrRTJiaVlrWHBUaE5oVUc3Y2RVb1FCcXV5VnQ3UmFtWUlrUkJmSVUw?=
 =?utf-8?B?bUh4MDBCM2puK1dwZXhFMmVFN0tvd2NSRGtXTmxCZmF0WVRXUm5rUXVKYXVV?=
 =?utf-8?B?di9uT01ZYS94YmtvZmxtdXBlYktEWkdJMDYrbm1aVWl5azNtbGRHeVgxQk1B?=
 =?utf-8?B?RDZSb1BqMmpGNUNnTVJLUEN4N0s5MG1VdDFJUzV2anc1L24razZ5K3MxekE2?=
 =?utf-8?B?eWxkZUZsdnZiUmNGV0ZMek5CV0hKNWJOOWZnOGJUd0lZL1NxQTRQTTMwNVdu?=
 =?utf-8?B?TnJCKzZoc2RiWlJjckhzbGxUSGFkMUJMRE5kZjRKZFJGaHdwU0d0ZDQrNmJz?=
 =?utf-8?B?cUxheXF3aEQ0WkoxNmpodmtEY1MxMm5QNzAyVXA1UFFJR3F2aVZ2VnhjaFYx?=
 =?utf-8?B?N2xPMEFTUHV2c1lZVXdhME9WUEFjNWpFQ0U4RjJNWmJ0ZGpTaHVMU2pXZ2VM?=
 =?utf-8?B?MVBzY2ZveUpLSFpsV1lydWpic0d4a2Irdm55V3RySUduM0M1elROdnRBeGgw?=
 =?utf-8?B?QW80MzZSRGZnYzZ5anhwNlZUa3NDZFFiZDN2ODE5OGdkYXlraURnVmxtZTMy?=
 =?utf-8?B?SWlMQXdxMHBhVHFUT3h3cW9sS05MS29CUVFaTzdjbGQ0dCtRZzlBU2JUOWxw?=
 =?utf-8?B?MTRxc0ZIdW8zU29LS25OSElwdmw1bFZHQ1RHYUhpUjAyekI2cENKdkV5Q0Rl?=
 =?utf-8?B?dFRLVy9nSnpIbDk5Z0J2c1BWVjZua3RFaXJ0UG1zN3J5RHYwN3hLYmlEbjhj?=
 =?utf-8?B?YVZQbll6a0NBM3l6RmFNSUluODIwS1RjaTVjTTNtbFh5TXJKN3VsclJiZ0RQ?=
 =?utf-8?B?VFNXRWJqMEhZbWt6UHB3MWFlSW56MlgrK0xnRS9MQWpTNms1MUdVMWFTRzky?=
 =?utf-8?B?eGRTRjQza2Z5SVlmMy9tenNzS2lILy9kU2dzaTVkd1dhMktKeFBFNkxOd2tH?=
 =?utf-8?B?MkVndS9XNjM3eW5SMXluK2pnK0FLSkJRM1dRMkNhR24veUE3K3UyWjBjQ0hE?=
 =?utf-8?B?T2xwZEYxWDlXSlRwVDFwUjlxYnIyeFZzUndFNTZ1c0FucDVzZ3k4M05qSWFO?=
 =?utf-8?B?SzhEYWZmZE5YMzZhWUtBZHMwQ0NHeTVXL2FpQVRTbmtFOHIrKzF5NVpIMGFo?=
 =?utf-8?B?SXpPekZGc1A0dlZmRC9MaU9zSlBtRk03d3Y3TjY5MFhHeGRJY2tBNjZMeEw0?=
 =?utf-8?B?Y0tCZ2VYZDhCLzM0Rll5bzVQMkI0bGVidTlGWkJHb1hhc0JXOStwWmw4cXpv?=
 =?utf-8?B?WUNvbDV1eEVlUktFU1ZISkxUK1VmYy9BbC82MEppT1pETzMwYnpkNW1CVVBw?=
 =?utf-8?B?NFd1aDhncGk1M1F2ZWVJS1RPTnFFZXJGQ0JGaFErUWJrN0c5OGt1VHYyUlhr?=
 =?utf-8?B?OG9tZzVuTlU0WmZiZGNkTVB0cnMwMlZLcUlhK3dvVWxHWmRWamtKem84bkJn?=
 =?utf-8?B?REhscXJxMVhWMTlPVVAvNmQ1WGlsUlBsN0VBaVBLWUgvWnNNMlJJWVFrbUht?=
 =?utf-8?B?VHovL1dnbGV4MTZIMjVseTJUa3kxMzUwYjAzRFIrUW9INC9CZFF3ZzJ4QTB5?=
 =?utf-8?B?aElDNHJJR1JtdGFaUVZoY3N5SU9NQzJvU0NvQk8xYW5UMUxEVWN1bFI4OHZX?=
 =?utf-8?B?QWkwYSt2cS95bHJtb2xuUExOSHh4TjJkcDY0MWd3U1FRRmJ0NE5jRFJVR3Jr?=
 =?utf-8?B?d2xFaktBZWRLbjRwOXVoYnpkSjRVTXZNODVzdlRCTXRhcXlGaFJaaXA0R0FC?=
 =?utf-8?B?ek9RVmFKL1QvUVBKK3V6bldhOHF2aFljY0tvdFozUnhGZEVHVnZLRXBhdS9X?=
 =?utf-8?B?TEVIR1YxanFtMk9tVzhySUNtU08yN0E0U0dCVTIvTmc2K2ZLY3U2MUlVdXFq?=
 =?utf-8?Q?ibCzeV5Q+AJyLeS9flF3bnefEqCmuqeb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFZWajZlRzNiTmZ3SmtjUGorQ2JwUDk3MzZvZUxIbW95V0FWNUloRHIwSUtN?=
 =?utf-8?B?M01LV1NRckZpc1Z6azdkU01oTEZpK2dJZ2gwTWh5Uzl5YWEyMnhKOXFqYnpu?=
 =?utf-8?B?bitOT0I5bzVqRmNFK0g2bEVSejVwTWZveTJud2NnUkl6bjNlYVV5WERkZFFD?=
 =?utf-8?B?Ujk3dzRETkNsbVM1WWtqSkZkSGd0K21ucngreC9BTW9jOEg0RDQ2UXBkbUVU?=
 =?utf-8?B?MktpZUNySEtnbk0wZVN0dTlkRmJiZ0RuZFJNZUtOZnR0bUx4RmdkZVRNdnBN?=
 =?utf-8?B?VkYvSVUxVE9WSUFtYzRxOHdXZWRMSGZ4eGRuOWo5bi9IZXJFRndUN3cyRU1J?=
 =?utf-8?B?dEFndm9HQzBRd2ZUZWJzTy9pbW5jeUlwSjd4T1BDYjNBZUVGbG9OL2xIWFRF?=
 =?utf-8?B?UTFPdmM1K01sSjNFN0RKSCtNYU1pS2VjdlVwcDF2cllnZWhhRVQvcWhtc1NY?=
 =?utf-8?B?VnJtWHMyTGNYa3JpcmtiWWM3SEtyM0tORTlnNUdPOXFSS3pVeTBHNlpvNFdr?=
 =?utf-8?B?WVdSNW0xR1VHSmhWWk5ZNEd6Zm55TUFuaW1PVmNaZC9EZERpdGV3ajUwOG56?=
 =?utf-8?B?L21RV2FHNWFRZUVaTG1BdEswUWRLbTJuZWV3Z1pvTHJQS0ltYmxiTXo3eHpm?=
 =?utf-8?B?Mm5VSXQzZUNDMElJMzVJU1YvdEh6QXlOME5Nd1ZMVlFHOXYzVXg4OE1ZRTJ2?=
 =?utf-8?B?QjRoa0tBTmQzMjh0c2ZDYkdNZGQzbkxoazlOMWxMWFF1N0xjb3Uvd2NXekgz?=
 =?utf-8?B?NDdreTkrZ0U4OU1NUmFVZ1lBV3ZhZ0xnc05Md3paYVBEQ0tHcnNJeXh1bmtn?=
 =?utf-8?B?STlXY2hmTjJxQkYxNTRVME9mWDZmMlF2ZkIrenJKQ05uUHNTWXgxN3FYUkJN?=
 =?utf-8?B?OS9qQ2VveVNtZnhMM2VDaWlKQUtqQ2NDVTZmK0JKL2RMa05weVVySDE5eDB4?=
 =?utf-8?B?a01JbXRQUDYwWGNkQXk2MjZoUHpjbHpibGltdG9FdzRhbkxXM1plSXZZZGcy?=
 =?utf-8?B?aVpvYU9sUndvWi9QMWxzNFgxQ2JReEpTdzE2L2ROSzM1Z2dsb2xBb0wrY1dl?=
 =?utf-8?B?TGUzSURFWlVsUmxWeEljdFV1Qmo4VmFQTVhpaVNFbTV4NTZCbHI3b2dDVkUw?=
 =?utf-8?B?d2NTY2NKSjQyRHgrOEE5ODAvdFRmcnlEUXJBMUEydWk1MENkeng4eEozM3Np?=
 =?utf-8?B?TThKL3hmRnZVNTVvbzFHYS9mMGRXOUgxTGRnNFBwNWNMYW45WGFGK3ZDNHpi?=
 =?utf-8?B?S0h3N0xVWmxxTmYraDRpMm5PaUw1ZU9PazZqVDBZdHU1T1NZT0MvVzd5Wm5s?=
 =?utf-8?B?U1dIU0NWZVJrTDNPZ3AwS2U1YnhwMlRWUkdyVGlkN2RXcXhaZUpYUG1ycXNv?=
 =?utf-8?B?YVpXU1doS0ZkWUJ0SUhGazZWQmpVSjFoTW1NMDhVT2hzV2Iwc0g1N3F1aHdy?=
 =?utf-8?B?NVppbm5pa0xzS0dVSlBIRGF6cTRNTExGV2h2Vm9KNVYwU3I2SUVUN3pKR29a?=
 =?utf-8?B?OXNuRU1LdGR1cVN0NHI3TzRBODVpNlVDMnlwYjVKMmNSN1VvTnM1THExRktp?=
 =?utf-8?B?Y21ZTVdQWEgyYmpjeURPb0hTWnJTRHcrdHdGQnR0TTVQSlp6WnUxckhuQ3Rx?=
 =?utf-8?B?OVQ3QTBGVUhqei9CTTd6S1JlbFBMM1AyWWV0TUVXTjdWZ0cxeHRCdjBIWENW?=
 =?utf-8?B?OE93UEd4ZDVnU0E3WmVkRndvWm1CbnVkZWQzYk9Vc1V2amlpejF2SEdGc1N1?=
 =?utf-8?B?eFg1bUlPV3BwZ1RHQmJPZytGbWZrN0VOSTNjUUJBaCtIMmJISUhpUmRZbDVB?=
 =?utf-8?B?NlNVQ3BQdm4wYW9qUUdjekpmQi9kU2V1a3BJaFRCMjdIRFNYYUo5bEVhd2dr?=
 =?utf-8?B?eUV5RmpzT0tQQWluU1ZRSm5jVnNXL3VmdlRXOWxYMGF0T0NrTG1oVXZhTXBH?=
 =?utf-8?B?dVkwMXpDZEYzNjY2TE1MVmd2aFNxTTNrR2dUWkYxTVp5K2REYVFRejBPV3kw?=
 =?utf-8?B?M1B4eEp5amg3d0RkK2QzcWNKVmFMcVNkVmJaY2VwM2xPVjNGZ1FMQlhwbGdn?=
 =?utf-8?B?YWRydzUveEIrTHJsN0Y2ZVJCcHUwMjQ3cVlUdzBCNmlYM0xZSFB0MkJUbStM?=
 =?utf-8?Q?Zl8AoD5S74ESEH1+O4HpPRAKe?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 274ff713-8fc5-4855-dbee-08de2cc6622f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:32:49.7800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqjz9oXE5L8Mc6VTSH6eUw2sR8TTbtvBwFNO53pMymUtXl+XIxneX+xgx7it+OcY95wzThWIGCRp4UC5fN6jaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF87FC24EE6


On 11/24/2025 5:42 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Fri 21 Nov 2025 at 18:59, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> Add Peripheral clock controller driver for the Amlogic T7 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig          |   13 +
>>   drivers/clk/meson/Makefile         |    1 +
>>   drivers/clk/meson/t7-peripherals.c | 1266 ++++++++++++++++++++++++++++
>>   3 files changed, 1280 insertions(+)
>>   create mode 100644 drivers/clk/meson/t7-peripherals.c
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 6cdc6a96e105..d2442ae0f5be 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -215,4 +215,17 @@ config COMMON_CLK_T7_PLL
>>          device, AKA T7. PLLs are required by most peripheral to operate
>>          Say Y if you are a T7 based device.
>>
>> +config COMMON_CLK_T7_PERIPHERALS
>> +     tristate "Amlogic T7 SoC peripherals clock controller support"
>> +     depends on ARM64
>> +     default ARCH_MESON
>> +     select COMMON_CLK_MESON_REGMAP
>> +     select COMMON_CLK_MESON_CLKC_UTILS
>> +     select COMMON_CLK_MESON_DUALDIV
>> +     imply COMMON_CLK_SCMI
>> +     imply COMMON_CLK_T7_PLL
>> +     help
>> +       Support for the Peripherals clock controller on Amlogic A311D2 based
>> +       device, AKA T7. Peripherals are required by most peripheral to operate
>> +       Say Y if you are a T7 based device.
> I don't think anybody "is" a clock controller ;)


Okay , I will update the help message.

Say Y if you want T7 peripherals clock controller to work.

Same with T7 PLL help message.

Say Y if you want T7 PLL clock controller to work.

>>   endmenu
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index 8e3f7f94c639..c6719694a242 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -27,3 +27,4 @@ obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
>>   obj-$(CONFIG_COMMON_CLK_S4_PLL) += s4-pll.o
>>   obj-$(CONFIG_COMMON_CLK_S4_PERIPHERALS) += s4-peripherals.o
>>   obj-$(CONFIG_COMMON_CLK_T7_PLL) += t7-pll.o
>> +obj-$(CONFIG_COMMON_CLK_T7_PERIPHERALS) += t7-peripherals.o
>> diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
>> new file mode 100644
>> index 000000000000..10e77456b0d0
>> --- /dev/null
>> +++ b/drivers/clk/meson/t7-peripherals.c
>> @@ -0,0 +1,1266 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2024-2025 Amlogic, Inc. All rights reserved.
>> + * Author: Jian Hu <jian.hu@amlogic.com>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +#include "clk-dualdiv.h"
>> +#include "clk-regmap.h"
>> +#include "meson-clkc-utils.h"
>> +#include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
>> +
>> +#define RTC_BY_OSCIN_CTRL0   0x8
>> +#define RTC_BY_OSCIN_CTRL1   0xc
>> +#define RTC_CTRL             0x10
>> +#define SYS_CLK_CTRL0                0x40
>> +#define SYS_CLK_EN0_REG0     0x44
>> +#define SYS_CLK_EN0_REG1     0x48
>> +#define SYS_CLK_EN0_REG2     0x4c
>> +#define SYS_CLK_EN0_REG3     0x50
>> +#define CECA_CTRL0           0x88
>> +#define CECA_CTRL1           0x8c
>> +#define CECB_CTRL0           0x90
>> +#define CECB_CTRL1           0x94
>> +#define SC_CLK_CTRL          0x98
>> +#define DSPA_CLK_CTRL0               0x9c
>> +#define DSPB_CLK_CTRL0               0xa0
>> +#define CLK12_24_CTRL                0xa8
>> +#define ANAKIN_CLK_CTRL              0xac
>> +#define MIPI_CSI_PHY_CLK_CTRL        0x10c
>> +#define MIPI_ISP_CLK_CTRL    0x110
>> +#define TS_CLK_CTRL          0x158
>> +#define MALI_CLK_CTRL                0x15c
>> +#define ETH_CLK_CTRL         0x164
>> +#define NAND_CLK_CTRL                0x168
>> +#define SD_EMMC_CLK_CTRL     0x16c
>> +#define SPICC_CLK_CTRL               0x174
>> +#define SAR_CLK_CTRL0                0x17c
>> +#define PWM_CLK_AB_CTRL              0x180
>> +#define PWM_CLK_CD_CTRL              0x184
>> +#define PWM_CLK_EF_CTRL              0x188
>> +#define PWM_CLK_AO_AB_CTRL   0x1a0
>> +#define PWM_CLK_AO_CD_CTRL   0x1a4
>> +#define PWM_CLK_AO_EF_CTRL   0x1a8
>> +#define PWM_CLK_AO_GH_CTRL   0x1ac
>> +#define SPICC_CLK_CTRL1              0x1c0
>> +#define SPICC_CLK_CTRL2              0x1c4
>> +
>> +#define T7_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
>> +     MESON_COMP_SEL(t7_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
>> +
>> +#define T7_COMP_DIV(_name, _reg, _shift, _width) \
>> +     MESON_COMP_DIV(t7_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
>> +
>> +#define T7_COMP_GATE(_name, _reg, _bit, _iflags) \
>> +     MESON_COMP_GATE(t7_, _name, _reg, _bit, CLK_SET_RATE_PARENT | _iflags)
>> +
> parathesis around _iflags please


Okay, I will add '()' for _iflags.

MESON_COMP_GATE(t7_, _name, _reg, _bit, CLK_SET_RATE_PARENT | (_iflags))

>
>> +static struct clk_regmap t7_rtc_dualdiv_in = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = RTC_BY_OSCIN_CTRL0,
>> +             .bit_idx = 31,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "rtc_duandiv_in",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "xtal",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static const struct meson_clk_dualdiv_param t7_dualdiv_table[] = {
>> +     {
>> +             .n1     = 733, .m1      = 8,
>> +             .n2     = 732, .m2      = 11,
>> +             .dual   = 1,
>> +     },
>> +     {}
>> +};
>> +
>> +static struct clk_regmap t7_rtc_dualdiv_div = {
>> +     .data = &(struct meson_clk_dualdiv_data){
>> +             .n1 = {
>> +                     .reg_off = RTC_BY_OSCIN_CTRL0,
>> +                     .shift   = 0,
>> +                     .width   = 12,
>> +             },
>> +             .n2 = {
>> +                     .reg_off = RTC_BY_OSCIN_CTRL0,
>> +                     .shift   = 12,
>> +                     .width   = 12,
>> +             },
>> +             .m1 = {
>> +                     .reg_off = RTC_BY_OSCIN_CTRL1,
>> +                     .shift   = 0,
>> +                     .width   = 12,
>> +             },
>> +             .m2 = {
>> +                     .reg_off = RTC_BY_OSCIN_CTRL1,
>> +                     .shift   = 12,
>> +                     .width   = 12,
>> +             },
>> +             .dual = {
>> +                     .reg_off = RTC_BY_OSCIN_CTRL0,
>> +                     .shift   = 28,
>> +                     .width   = 1,
>> +             },
>> +             .table = t7_dualdiv_table,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "rtc_dualdiv_div",
>> +             .ops = &meson_clk_dualdiv_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_rtc_dualdiv_in.hw
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_rtc_dualdiv_sel = {
>> +     .data = &(struct clk_regmap_mux_data) {
>> +             .offset = RTC_BY_OSCIN_CTRL1,
>> +             .mask = 0x1,
>> +             .shift = 24,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "rtc_dualdiv_sel",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_rtc_dualdiv_div.hw,
>> +                     &t7_rtc_dualdiv_in.hw,
>> +             },
>> +             .num_parents = 2,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_rtc_dualdiv = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = RTC_BY_OSCIN_CTRL0,
>> +             .bit_idx = 30,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "rtc_dualdiv",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &t7_rtc_dualdiv_sel.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap t7_rtc = {
>> +     .data = &(struct clk_regmap_mux_data) {
>> +             .offset = RTC_CTRL,
>> +             .mask = 0x3,
>> +             .shift = 0,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "rtc",
>> +             .ops = &clk_regmap_mux_ops,
>> +             /* The first and fourth clock sources are identical in RTC clock design. */
>> +             .parent_data = (const struct clk_parent_data []) {
>> +                     { .fw_name = "xtal", },
>> +                     { .hw = &t7_rtc_dualdiv.hw },
>> +                     { .fw_name = "ext_rtc", },
>> +                     { .fw_name = "xtal", },
>> +             },
>> +             .num_parents = 2,
>> +             .flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> Are you about sure CLK_SET_RATE_PARENT here ?
>
> Also, no need to have the 4th entry:
> * Just drop the the 4th entry in the list above
> * Add comment that xtal is also on parent input #3 but that it is not
>    useful to CCF since the same parent is available with parent input #0
>
> ... assuming this is not a mistake


Okay , I will remove the CLK_SET_RATE_PARENT flag here.

I will also remove the 4th entry and add comment for it.

>> ......
>> +
>> +static const struct clk_parent_data t7_sd_emmc_parents[] = {
>> +     { .fw_name = "xtal", },
>> +     { .fw_name = "fdiv2", },
>> +     { .fw_name = "fdiv3", },
>> +     { .fw_name = "hifi", },
>> +     { .fw_name = "fdiv2p5", },
>> +     { .fw_name = "mpll2", },
>> +     { .fw_name = "mpll3", },
>> +     { .fw_name = "gp0", },
>> +};
>> +
>> +static T7_COMP_SEL(sd_emmc_c, NAND_CLK_CTRL, 9, 0x7, t7_sd_emmc_parents);
>> +static T7_COMP_DIV(sd_emmc_c, NAND_CLK_CTRL, 0, 7);
>> +static T7_COMP_GATE(sd_emmc_c, NAND_CLK_CTRL, 7, 0);
>> +
>> +static T7_COMP_SEL(sd_emmc_a, SD_EMMC_CLK_CTRL, 9, 0x7, t7_sd_emmc_parents);
>> +static T7_COMP_DIV(sd_emmc_a, SD_EMMC_CLK_CTRL, 0, 7);
>> +static T7_COMP_GATE(sd_emmc_a, SD_EMMC_CLK_CTRL, 7, 0);
>> +
>> +static T7_COMP_SEL(sd_emmc_b, SD_EMMC_CLK_CTRL, 25, 0x7, t7_sd_emmc_parents);
>> +static T7_COMP_DIV(sd_emmc_b, SD_EMMC_CLK_CTRL, 16, 7);
>> +static T7_COMP_GATE(sd_emmc_b, SD_EMMC_CLK_CTRL, 23, 0);
> I admit it is a touch pedantic but C, then A then B is odd ...


Okay, I will move sd_emmc_c after sd_emmc_b here.

>
>> ......
>> +
>> +static const struct meson_clkc_data t7_peripherals_data = {
>> +     .hw_clks = {
>> +             .hws = t7_peripherals_hw_clks,
>> +             .num = ARRAY_SIZE(t7_peripherals_hw_clks),
>> +     },
>> +};
>> +
>> +static const struct of_device_id t7_peripherals_clkc_match_table[] = {
>> +     { .compatible = "amlogic,t7-peripherals-clkc", .data = &t7_peripherals_data },
> Nitpick again, please use multiline format when it is long like that.


Okay, I will change the format.

>> +     {}
>> +};
>> +MODULE_DEVICE_TABLE(of, t7_peripherals_clkc_match_table);
>> +
>> +static struct platform_driver t7_peripherals_clkc_driver = {
>> +     .probe = meson_clkc_mmio_probe,
>> +     .driver = {
>> +             .name = "t7-peripherals-clkc",
>> +             .of_match_table = t7_peripherals_clkc_match_table,
>> +     },
>> +};
>> +module_platform_driver(t7_peripherals_clkc_driver);
>> +
>> +MODULE_DESCRIPTION("Amlogic T7 Peripherals Clock Controller driver");
>> +MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS("CLK_MESON");
> --
> Jerome
