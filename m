Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022110.outbound.protection.outlook.com [40.107.75.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8873126DA;
	Wed, 26 Nov 2025 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764148175; cv=fail; b=Fz0YoU0YWBc101g88SvzpJLd5AlicbUIewGyoTiEh2ODg+7VWXPgzBa4TVCV3HWby8tPWIafrFndcXcBikHnFSUvqFqePj0TEsBVEwRcazSMsJFyPGiryeGrVpT33A1jsJs4ydHVlHd0IZkFTON7kl/5NB0YeAYvJbC1Qz/QE4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764148175; c=relaxed/simple;
	bh=Ap0MhVmgyUOdKM9UP5I5HP3/JXyyL+KJ2K8wNL+HsUA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bNAGtxh+c4hdNvrWcsGSB06dYbWdUyMKWCrpkp5Z+55Kv4nHRNtgNn/hr/oeHMTiSs/Ou/hOwKOpJE2opodjvXX2BA+ZfAIRyEVKGk47/9BeTkmItw45BwQgkjUxaRQnQ/0ZYN8FSH6deSMN+ucQklN94pveftdDT5s5VAL1qqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=tTYddm97; arc=fail smtp.client-ip=40.107.75.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="tTYddm97"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCCHj6duriO7AqUYXSPwgs0U0MrJs7k59n5t6zF7R52MXOaq8x++L39k9pTnoPZluc21j83ci42K6HqukCdJOEpcq2Lzw5akLjUIZOAq1fajIAqhls5/3ZK3GQazybCHU7GTAKAjA6chn3FL1zIWqfXt6fc8vXoOlNTqPvF/yVTsuEMaAAhWG2O5pyB4fjBhqRx3uaxPUerctyFlr4ZLKLJfiRXg0D4av9bLg3e/7pzNxLSZWmA8y6mEpwOb3HSF1u570W1z4ZgQPwU3XRicTaIIwAt27YTuZNgmxHzcrPE6F9+iMhP8DRT7nADDJxNCse6g6lIg5/U+Y6UqVzzUqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCSaqr0yY7yMobqrTOd1MIc5ySSQkb7Sdi+zEbccLVI=;
 b=CXXe7KeQ+oaB8DPDCytHeUMmNlfdlOb7k6NgsX88Di12QkfJB6KsKOmYnswjQmu+ircC/GqmSYZK7pgal3kaeDpb9pwRXCfvERY3u6GdGQr1B6nrNfVFnyb56/3BMkb5hgveX4uUosoMTSojwm+g7DuB+GUS8FJ5OjJD8LtlNpgOXXPvJ+FYR7exC/9PsAnvYmr+avFnVWEcENSPYkWAzz2BeSN9YpMxGW46ArUH0f7KO5GziB08ZmhGOd+B96j/Bhy87vii7qH9Ohd47Y+h+HlLfINPYXymAgdc94GYBejOEa3M4CBvFyIAPIO0wKBTf/ResqR/1TbS3rzcgEDYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCSaqr0yY7yMobqrTOd1MIc5ySSQkb7Sdi+zEbccLVI=;
 b=tTYddm97GZfE9nOWwmTidoDH8fQRnPwcd3i30VSi+pgZ7ByO8pmQhW2zq/DiSMETwsAaypJomulSyVVjcs/h1NkmXDlBds5iABaB9kehQ5vpqM66dZNWDJShLs6fvJ9FBG4wehe/bDWNhVagKAuvRBj8fPMjuVrogevCwo5TCbuqNV6P2kddWEg4fMqC27NeMMP7Ef1AV0p7HHP8ib7dAuOiyGquFjxMDnEssS1x1UEPsZpyws0JJqvbmElSvxvo7gvXiPPUGLb87pz8xkptvzCUXn/54fSetE6Yh4An+k95VWIEAi8/pidEHXIvI6ps82mVr8YqdneotDZq4+6NKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TY0PR03MB8299.apcprd03.prod.outlook.com (2603:1096:405:13::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 09:09:27 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.9320.013; Wed, 26 Nov 2025
 09:09:26 +0000
Message-ID: <e1e3182f-8c6d-4b76-9659-5a1cd3a19067@amlogic.com>
Date: Wed, 26 Nov 2025 17:09:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] add support for T7 family clock controller
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
 <1jy0nvu5jz.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jy0nvu5jz.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TY0PR03MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e5f8ac-0d34-461d-d741-08de2ccb7fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWEwdDdVVnlXQVY5TjZ4VnVwVkg3Q3BuVGFjZmJ2Z0J0K1lwOWtJQlc4NTdD?=
 =?utf-8?B?Q0RraXd1VkU0NDN1ZUJOcE9TNktSczVUc01TN2hKdmtkeVlFUE8yd1RZanVI?=
 =?utf-8?B?NTJ0Q1MweEV6SHZEcS8wVlJDWnpsa0VOR1krSDNYSExlYm5tb3NaTjR4TXRI?=
 =?utf-8?B?MjIzTTdTRzNsNmF1R3RNNVgza0ViWnRXRVUvaVlYMzMrYU5zNm5vY29lOXZD?=
 =?utf-8?B?L1E4TForWUtLK3dsQkZmYWVMbEJsdzlMWTdrNXVxZjFkQXptc250WERMVTZG?=
 =?utf-8?B?TEtoTmczWmg4Ni9iTFZocmNTZXZ2ZitCanJOR3NySHZZcTRxUnJ0bjJTYlBJ?=
 =?utf-8?B?LzBmTXlZWSt3QUZQeDV1akQ1Wm54dnJkN3NsekZnU1R5Nkt0bnhwOEFNUG9q?=
 =?utf-8?B?U3RHQStoYzg4azI0MXRLTFRxMzhidEhGMFNFbXo2ZVNBR1kveklkaUt5OERJ?=
 =?utf-8?B?alJJZnBsQ2FhaUpJNU5nMXFDYWNVVmoyQzM4Q1Zkd1Erb3U0UnFJQlp4OXZW?=
 =?utf-8?B?aFp4dFR5UTZncVJGUlVXV2FUQ0txNy9TbENBZ2FpUzB5U2plQkhiTFl2ellV?=
 =?utf-8?B?cnI2NnFkcTNlUWpTTzZpL0hzUWkyUC9kcFUvcjh2dkprcFRlakp0VWk4aW9y?=
 =?utf-8?B?ekhUTGJwc1A3bzRLUXY2NDdRM1NLenpTZ0w3YzU3SkV0OExHa2lLY3NyRTA0?=
 =?utf-8?B?c0w0bU5JQkVabXhDOUtUQlFHWGdud3V2OEhuWFFUcml6Mkl6K2tRS1h6bWhr?=
 =?utf-8?B?L2ZwSWlFRkpYcUM0L2hBU1YrV1E1SlAzS0Q5R1c5bUFNTFhWSitod0ljRVlO?=
 =?utf-8?B?clREVm9TK2hKclBXd0xvd3lOenRjVVhJbVZCd3laaGp3aGJsT1dLS1FZQUFq?=
 =?utf-8?B?Y202Nm9VZVAzMnVFTUFXdUdDZUhvcHp1Qm1hblh5Q0dvOVdFNm92bFU5OWZE?=
 =?utf-8?B?eUxxMmN1Nnd2RjQwanhsRUVzTkE0UHhTSkVvWXZQayt4cWNqQ3hYMUpLajdS?=
 =?utf-8?B?d2VFR0FQRDNXYjFuYkdHTzh2ZVF0NVJjVll4cWU0V0NiUCtKTXI1dlFRamJ2?=
 =?utf-8?B?R0ozcVNYODRIbkhIWXRXSFUrOWlQSzFPY0Y3R3lac0dxL1lJNGlnMUdJN1NV?=
 =?utf-8?B?N24rWlhHQjNsek5ndXhielVteWd0blJ5WGtlM2FvOEVIN2lHVWRvOG5UT2ph?=
 =?utf-8?B?VUpHeko3djluTG9BNitvbFpRZ05ZckFkWk9FUFZKRk5ZR1NiWmUvZFdSQ0hL?=
 =?utf-8?B?YkJkSzd5TXZwY2lGMXhoaWtBK1NtMHJFYU8zWTdNWEIxOHVTWUpKc21WZU15?=
 =?utf-8?B?eUxld3Y3Wmw2UXZsZ251ZlcwM1RNRHl3TkozWGcxNzluOElrZ2x6VUlZaStp?=
 =?utf-8?B?NTNFOS9BSENvMG5GRkdSVWczOFI1QWlnNG9JQUNoY2tTa1BjbEQ4OGNhYjZo?=
 =?utf-8?B?NWVqQkY2bVZVb2JOcWlmQzhOUGNHMzl0SmRFWCs2bm8rNEhFVU9yQXBTWmZo?=
 =?utf-8?B?dlBaRUFNRFE0OHN2QjdlU3lUcnZ1RktrYURyZStLNHh2S0xyVm5zeGJneVhI?=
 =?utf-8?B?OEV0aDNJRkJUdjNHcHZobkJ0THRRczByWXdtUTc0Nmg0MUNwWWFOL0hmdHFZ?=
 =?utf-8?B?WkJ2L0YwOC8rR0llZ0w5aXVKZHQxbHBLb3M2bHlwNUpBWmNSWnJyczR6ZEpp?=
 =?utf-8?B?OHdORWNQUFdLNnFOVjk3WmNYNkw5RFBWTjdzeEpUVk5YcnRySkh3Y2xIWlJ3?=
 =?utf-8?B?ODR1RGR3azI3SW1oNFloNHBlRS81eGdNNzEyN0NoL0tLSjdqck92aC9pMGhy?=
 =?utf-8?B?K3YzRlkvMWZZTmpqK044d2Z6M0NucjJaNEFwOG5CS3lXNE9lYm5YdXdyR1Nr?=
 =?utf-8?B?Wit2cHNqYitZdzNpaHhmVGJYYmY1RjZQa1BWZWowaU80WGgrQ2w3cWNPTmFo?=
 =?utf-8?B?K0xHSmtNc2pQVEZlbDE1bFcwRVJzOGE3UFU3d0RJVktjajQwcjdLVVZvYnRX?=
 =?utf-8?B?dG9MREJ0VjlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amxEczZPRGJCclFMOVBicHFDdlVadWVtZ24vMFpxcmprMlJXR0QxZ2hHa0ZM?=
 =?utf-8?B?ampTRUs5My9LTVkxVHhPcXVNdFNXZU9uc1lTWkc0TTdIdDJFQ0piYUZwa0NV?=
 =?utf-8?B?V01Ccm43Umx2QWFFQ1hwcUsrVGZyeGoybDk0RjVwUkdtblJQQ2tyaVhrbWVy?=
 =?utf-8?B?N3lzS0VGbWd5ZGxGUEdzSk5SN2l1blMvMnJ2b2crOVlnUGtLbWhUQ2h3cGZB?=
 =?utf-8?B?REZPeFZPUUVaSEJaU1JwMXlXb04vcjVSRjRiOTZtd3ZJUHlPMzZ2cUJjN3gw?=
 =?utf-8?B?UTFvT0VKUHdZbkF6cmluejJNd29NY2xzRWlIeHRvN1lwUW5DbVhMMlkxRm5J?=
 =?utf-8?B?SXVQRWNXb1ZFSmtQTDRRZVUydEtxTHFBSzIwMUZ6UTZFRHcvRGthUlI1SnNy?=
 =?utf-8?B?MDlJSWdDUUJEVTNFU2p5L1lkQ0dxWU0xd3F2NWhoMERVeWZHc1FSbW4xQzk0?=
 =?utf-8?B?KzJ2N2RRYmJEZmhyQW9vWWNZbVVsSmJ1aWpLRGplY292Z0JLNWJmMmNCQ2RG?=
 =?utf-8?B?NDEzVHBDT3FaSytxNUJUM0Y2RFVrYWFMZUszcUQ0SWdqNmplWUFUWEhxN2lp?=
 =?utf-8?B?SjVYazJWWEp6VFdRcWhaeWR4NmZpdW1RNUtMSW00WXZvc2xicFVjY29BcUtr?=
 =?utf-8?B?c2hrZjNJb1RFK2NVZnY3cmRTeHlYS2s4WnIxS3NTcGZYOEFyZ3NBWXgvQjRZ?=
 =?utf-8?B?azhBMFJzamtsU09pZklBQklyeWdWbTFLMHlBbmRjOG9SSlpHdU5CYjl2ejB0?=
 =?utf-8?B?czFtOGVIYUNTRmtsSEs1Z0l3VjNiNmRtZ204SVdrSWh3d2RSL3hEWU5YUnJU?=
 =?utf-8?B?a0JkZXdXcmhiMS9GL2toODNoanp0Y2NSUjF1UGdhaHVRNzQ0M2Z1eFdSbEJF?=
 =?utf-8?B?b3NnQmVjQlV1NEs2MllHOFBKNThyRlRWUXdTT3BRcFFJY0dZbzFwUy95dXZE?=
 =?utf-8?B?STBWcU5GSW5GU2YvV0kyWnlzZWlxREVtWnN2d3RwemNuOFNxOXJDM2ozMmVQ?=
 =?utf-8?B?d2tEcGZsSzhobmNWRkJhQlN0dzZsOTRZK2pLeG1tL2JTem02NlVnemFhOXpJ?=
 =?utf-8?B?M1NJYzViVkt1c2JaSDFQemJOMWNCSFpUc2ZSbWxoQ3o2MTRTNCtScGQ2MHkx?=
 =?utf-8?B?UHVKdlFGT2xjOUpGOGFqcUNTYy9HYlRhYTVra2VMUzRqYTc5cU5VdGZuQkls?=
 =?utf-8?B?OWlhYXYvTEtaY1FlTGFjRGQwcVRiOVhrcWcwazVOQjAzVmxhbWN1V1dXeUlB?=
 =?utf-8?B?akpKYVhGcUhMUzBiUGJVL1J3NFRJRVJKeHI5dmNqSysrTGVDK3k5ZlFkUEJ3?=
 =?utf-8?B?ajQrdks3UjZkTnhraWZsdXMwWFlTT0kwVVZzQmd5RGlqNUxTRndiazZvUjZZ?=
 =?utf-8?B?RVNQRHZGcENibHgzSXJpZ3YrMHBZUElpWWQ5ZXJFVDJQVFp5OE9mMmV0aGlO?=
 =?utf-8?B?N3l0TVZMWldDL2V2L0hiWjlzR0pVRk5xWG1xaWdxa1Fzek1WL3JMZENLdWdz?=
 =?utf-8?B?dlYrck1qL3F1ZEN4RC9sZXExTG1KOUM0NGJ2Nm92eS85ZUd4N2hUZVRRZURF?=
 =?utf-8?B?VGJBOGc5cUptS3hrVDgyOWtIdGNjMDJ6Q3R4TFIwZlJPNEpxcWhDSVZWMkhD?=
 =?utf-8?B?TktYQ1l6YlR4YzNrQ0haeG0xaWxZSmxUSGQ2NGhWaGVDNWdMLzdsNU1lU0Zs?=
 =?utf-8?B?MTUzamxaa2lwWXNwZkxrVkNWZStTZmN3VFZEVXYxOG1GL2g4UDMrVjV5TW41?=
 =?utf-8?B?dFp3dENoRkRNc09qdkEwUThyd092R25iN25UWWpuK3pKR2FmSGVoeGkzaUU3?=
 =?utf-8?B?bUxGMXNVRXBESG9nc0t4SXZkSXg5d1ZGMmFMMmxHdE9mWkVNS1l2aDZaRUph?=
 =?utf-8?B?N05nczYyRlBZNVUxT1pvZ25yNnR1aUQweFc0YTh3T1FxTVJqQkNXQWhjMS9D?=
 =?utf-8?B?NStCclVMem1JMGh4MUt3N2M1V1Z6NHd6TXh3SU9xS1R5R3h0UU1sY0FSaERs?=
 =?utf-8?B?dGRzQ1ZCalZXL0krTGtlbHpJRmNINlhlNWN0Y0JPQW90ckVjZFlxNTZQcXRk?=
 =?utf-8?B?b3ZvUGZJekV5bHZrY2E1bXlpNlJsbjlGY1RtZUZlT2IzZ0RXWmJ6Z0NlSXU2?=
 =?utf-8?Q?UQbX320/2HP/NcdQRr2Th+Sg0?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e5f8ac-0d34-461d-d741-08de2ccb7fc2
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:09:26.8627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JqQRYOZW/D7QsMnuEoRatTke+ViqcXhkULu3NczqZ8X3i5W5ffkngsWojJ46CfH2vEKStTpmYGzwNjkdmLA1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8299


On 11/24/2025 5:46 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Fri 21 Nov 2025 at 18:59, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> It introduces three clock controllers:
>> - SCMI clock controller: these clocks are managed by the SCP and handled through SCMI.
>> - PLL clock controller.
>> - peripheral clock controller.
>>
>> Changes v5 since v4 at [4]:
>> - rename rtc and cec dualdiv clocks
>> - rename dsp clocks
>> - rename anakin clocks
>> - rename fdiv2_divn to 25m and fix its parent
>> - add flag for T7_COMP_GATE
>> - use T7_COMP_SEL/DIV/GATE to define glitch clocks
>> - add CLK_SET_RATE_NO_REPARENT for t7_eth_rmii_sel and rtc
>> - move module_platform_driver after clock driver
> Looks good to me, just a few minor comments.
>
> It is too late of this cycle. Please check the comments and re-send on
> the next -rc1


Okay,  I will address the comments and send v6 patch for the next -rc1.

Thanks for your review!

>
>> Changes v4 since v3 at [3]:
>> - drop amlogic_t7_pll_probe, use meson_clkc_mmio_probe instead
>> - add CLK_DIVIDER_MAX_AT_ZERO for pcie_pll_od clk
>> - add frac for hifi_dco_pll_dco
>> - add l_detect for mclk_pll_dco
>> - drop v3 5/6 patch, and use MESON_PCLK
>> - drop SPI_PWM_CLK_XX macro and use MESON_COMP_XX
>> - drop the register's prefix
>>
>> Changes v3 since v2 at [2]:
>> - update T7 PLL YAML
>> - add 't7_' prefix for t7 clock name and variable in t7-pll.c and t7-peripherals.c
>> - correct v1 patch link
>> - add new macro MESON_PCLK_V2
>> - update the driver,header,yaml file license
>>
>> Changes v2 since v1 at [1]:
>> - add CLK_MESON import
>> - add const for clkc_regmap_config in PLL driver
>> - fix eth_rmii_sel parent
>> - update T7 PLL YAML file
>>
>> [1]: https://lore.kernel.org/all/20241231060047.2298871-1-jian.hu@amlogic.com
>> [2]: https://lore.kernel.org/all/20250108094025.2664201-1-jian.hu@amlogic.com
>> [3]: https://lore.kernel.org/all/20250509074825.1933254-1-jian.hu@amlogic.com
>> [4]: https://lore.kernel.org/all/20251030094345.2571222-1-jian.hu@amlogic.com
>> Jian Hu (5):
>>    dt-bindings: clock: add Amlogic T7 PLL clock controller
>>    dt-bindings: clock: add Amlogic T7 SCMI clock controller
>>    dt-bindings: clock: add Amlogic T7 peripherals clock controller
>>    clk: meson: t7: add support for the T7 SoC PLL clock
>>    clk: meson: t7: add t7 clock peripherals controller driver
>>
>>   .../clock/amlogic,t7-peripherals-clkc.yaml    |  116 ++
>>   .../bindings/clock/amlogic,t7-pll-clkc.yaml   |  114 ++
>>   drivers/clk/meson/Kconfig                     |   27 +
>>   drivers/clk/meson/Makefile                    |    2 +
>>   drivers/clk/meson/t7-peripherals.c            | 1266 +++++++++++++++++
>>   drivers/clk/meson/t7-pll.c                    | 1068 ++++++++++++++
>>   .../clock/amlogic,t7-peripherals-clkc.h       |  228 +++
>>   .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |   56 +
>>   include/dt-bindings/clock/amlogic,t7-scmi.h   |   47 +
>>   9 files changed, 2924 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>>   create mode 100644 drivers/clk/meson/t7-peripherals.c
>>   create mode 100644 drivers/clk/meson/t7-pll.c
>>   create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
>>   create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>>   create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h
> --
> Jerome
