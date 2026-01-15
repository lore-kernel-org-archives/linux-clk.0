Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023094.outbound.protection.outlook.com [40.107.44.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3F323D2A1;
	Thu, 15 Jan 2026 02:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768444732; cv=fail; b=ozln2xHEsiQf9TY7A31ZRm7YB2miXMYOQMMRXKfbgB79I1fVZxCjr6frj+AimBhWGKRGBS2UsmQmlR+XmcJD6be8w0MDZ8HAf+XoQn4tIT5B0XWsAe8TQETsHlpNsnSUI6/lz7w2y7wkErepu1bgFVC/R6Q3rAqrmVy5Hs0QlLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768444732; c=relaxed/simple;
	bh=NztzIkex5FmeoVtUG4/aMpxVq9A2k/ozS7yI3p7yAik=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D1n8QkDp7TSKFAWuc7kR3HS587pBgGD0UPS1WWivv6+rM9Kw8ddpQ5xZpxvP9jt1k7pdeEPfvy7DCbOwQ2hQEx+V36U4AodUnb24s6/BzqQmT+65ylcjP+Ar+QCzW6YZlNyWh+ULXHymC63tu70LLiz76BVn6vJNMgIlCqV4Rx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=CQst50qn; arc=fail smtp.client-ip=40.107.44.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="CQst50qn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaLZngtVQ2fpLTPXJuHDPG+4bTBpQzVrks4FcOccIAYddwVAzYJebVF/wbDazir0/ucgvGJecg+rMNeWvZ4burPcC1djO/9uxftCUKnVup4SXoW1PWTESCxHlLsCmAk4HL7pFJKyS0016aCZs5o83Umi7Yolya/oBPt8kPVAVzCRm7rzmU+wvRNbCsDlxg40yLpDIaTFq+E5uSfRtLdfZg5x3n8AnaK9pcQAIhUGgXQO7P7CMr+rNaqByeo7ZYM2dfvj+nVPUQea1sXdib69RP2YwY9EUecCVRJD8fFYCPSlSg+Z9bETjqBe0BvTGbqkpWn1wDkJaosaMKfrm5OHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83uZEZi/0O5TAZo4inHidoRxE1inApQCi5HW5fgbh7M=;
 b=LfN5f+wDuoZm5ntAqJnnxwRWfVyIGRcg9u9zwqYNeyLmJ+b0U41HUKt60yoTVkmI9h2+JVCR7a9EMYG/P8W8M5bRUxZ0FL+2MeGI+1e+TpZ6OF0k0py7UCg0TfvX7JeEz2VjSgIAqJ5oP0VhepbHIAKuZFy3mEXtCn5GVROu81poCQFyqvcDy/hlZhQpV17r4rTL3Ox9cGx6zpixOKbHW4hNigdIHPpKf/Vm5km+6M4ruVzpjSEDa6BDxe73T7HTyuTeEMe7Fl1u0xlA0CBSrehc9yJN+P1lvYDLJv7xcBSUMHqfYEzgYz/EGR1N9mcitVmovgMnnR+7BWZl6OFBhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83uZEZi/0O5TAZo4inHidoRxE1inApQCi5HW5fgbh7M=;
 b=CQst50qngb9yHLp1UMYPV2j1bvT0R+SvV8LBWOi5ca8aX0GafYyV6Sb4HXxUgN9mA/5i6vu7PxZdMu302VPYoh1NDsXn1QI18td8rRD6VFRSmgdM5Dlu6ga1phuD4IWzWGBtBLS9Iy9nW77+CDGEDhES/rRYLzS+QPbMFJiUjpaibFxE4xOLm23Z8jEkbkiW5ClwQqvv2y2YDY2REcP/UPTZQy9RhXU/z5CgHnHNF92lmr1E3we9Ep9+WHp7Mc95GvBUM0r1we3gm58wxQxkuCH1EpAYdCukQn3Td1SPxIE7z1UYUlKE1IyDVCjCvH1kYW6PSxPShYuYBCiYHxQMQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by JH0PR03MB8172.apcprd03.prod.outlook.com (2603:1096:990:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 02:38:45 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 02:38:43 +0000
Message-ID: <fe437139-4c33-489f-90f9-44e3dd3b0f9e@amlogic.com>
Date: Thu, 15 Jan 2026 10:37:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Ensure correct consumer's rate boundaries
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260109-fix_error_setting_clk_rate_range-v1-1-bae0b40e870f@amlogic.com>
 <aWhDLNFtaoU7A-AN@redhat.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <aWhDLNFtaoU7A-AN@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP301CA0053.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::20) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|JH0PR03MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f17c4e-4c34-46d5-39c6-08de53df331e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZS9mYThTNk9JQVc0TS9GaE1IRDB4WGFlKzl5U05HblljLzNWd3ZlOXl3V2d4?=
 =?utf-8?B?ZkcyeU1BSmNybytQN0U4MGNFRTkzd1ZjYUtWN2M2aEpyQlBkdUN5bkpOQzUz?=
 =?utf-8?B?TTk0Und3bWc1NmVjdnhaRVQ0S1VnNnJaVEVzdFNaNzhlMi85Vkc0cEhHOENK?=
 =?utf-8?B?U1VZSlluREJqaWJMYUVTKzRuYnc4ZEdCTUdFZXk2cUpLWnZvckRQZmpsYkZa?=
 =?utf-8?B?WEhSZVFLbHUxMHBwNFQwZllnVUdoTlNtU3ByWkR6R2VPNEpieDJ6YjRwYVUr?=
 =?utf-8?B?bFh1blRpazgvSjMyR0E1cjhRTWRqNUFYTHp5SEtreEZSMjJvaGRONWc5WkxF?=
 =?utf-8?B?MFBTUlk5TER5YXpUQjZrMitUbWNuOTJqZnVzdHBzQW51REdNTFZVZ1VmYUJ4?=
 =?utf-8?B?RzR1TWpjR1VhdkErb1cxZmM4b3YvUGsxUS9XdUZva1BkN2RQTmNsY21iVXhu?=
 =?utf-8?B?Mko2b2srMW1QaVIxbTYyeENFSGlUa29RRGRHZjN3MUFVbFdOMHJyS1NTSG9N?=
 =?utf-8?B?eVdIU2V5Z3RSZ3dmcjZrUk9nME9rblprb0lHdEtKNzJ4OHVPckQvbDRJY1N2?=
 =?utf-8?B?ZU14a1RUQ2FpWlZIMEtqSHNTUEFlL1ZBZmNRbndDUDY3U2g1QWdWUlc4TjRl?=
 =?utf-8?B?MVgxNEFydlVZbGxjeTRDQ0dQM0Fpb2RtdnQyY2FZV2FJNFVhTjh4OHpHWmpR?=
 =?utf-8?B?SUloamNGS3ZBWEk2aExOQmFHMlZheHVoY3B1QkZNYUFTanZjMER4dCtUTko4?=
 =?utf-8?B?U1BRcVFFbGNWQ2V2NEJZejNab3hJd0JkMFZsSkI5dVQwVVhsMUpQUGpuT0Z3?=
 =?utf-8?B?clRZWm1jbkUzb0pSNGFjL0J1dWxZMUZwa1VoMlBLbm01N2lDa2k3Um1JZDVr?=
 =?utf-8?B?N3pSZWNvUmxKL0dja2REblpGUDZQZFVRNk1aUTVTRDl2Qkc1RzF4UHdidjBC?=
 =?utf-8?B?RFcyL2FKK3U3SWZkL0xKeHAxTTRHNXNmLzljcXVScExCSkwvdGk5NGI3VmJj?=
 =?utf-8?B?aTRNdzJsYlJrWU1CZ0xHUmVCNktoZ0lkY3dMYmxGWmhYTzF5QjIrMkdUMU1a?=
 =?utf-8?B?TGFMYS95YUYwL2ZaODRwN3k2SndnU2dnbncwWFI2MnpmeGV1eTZnVjRLUy9N?=
 =?utf-8?B?UitYTUdqODZua25KekMzQmZLeTkyc1ZYbXM3L3dGL0w3UnVOcVNkSTNuRWpG?=
 =?utf-8?B?Q1N0eWVRUUNuZnV2VDh0NmEwTjNoZm9xQ1Y5eVZHVVArZEF6RlY1aU5SbUkz?=
 =?utf-8?B?UjJ1Unp6SkdGZ2x2S1RER3pVTXk1bmFoc2VWbUN0WlVuZnhIajdCWjBFSmt6?=
 =?utf-8?B?dWdTOFBTMG8reTBsdlNhMlhSdTNJZXE4dlI5QmVmVDlHb0NWQUsvYXNCZkxt?=
 =?utf-8?B?NEd3ZHZYMWVFV3RMcEdXMUZqZEIvMWIvUEV6NVNLZEJmLyttbFZ3ZjkzZkV5?=
 =?utf-8?B?WWlwdUFibWNFaHdLMlZJMGd5YmI3QWNUNkpXTkdxMUR0MDQvc0djOUt0V0po?=
 =?utf-8?B?Y3ExYlFtdk5zTlJSWSt4eWlhZUdFRkxGTzBUcUFEU2FadTc0ckg0em5ibDF1?=
 =?utf-8?B?ZFhLNlNkTEpDR3QyRmhtU0k1K1dhTEc3aCtYbWhMT3hkNFVaMjRUYkZvejZS?=
 =?utf-8?B?enFVWkFmdENpZUJlSzNCbEJWYlJUenpEUkcvbmVSZmw2dGxjT0tTaElmWVVs?=
 =?utf-8?B?TUU3SnhDaTh0cXRWZnd3LzlsbDd3eEcyMGt2M0xsL3JOU3pkTlhyTFUvbUFq?=
 =?utf-8?B?RjByaG5BUks0WnNmZE9zL0JIQ0wxMUZIandGOG81d3NKUHMxNS9uVHZxUk1Y?=
 =?utf-8?B?cTBNd3lBcGtXcjdwTkFndmpxMHJWTGg2STdXd1haS3dlLzRRL2JvcGhWeE5R?=
 =?utf-8?B?eWJlZlBkU2RRY1U4M3lYWjRScHNBL0x1Qi8zWk41NWtHNXNQMDdvdUFTTWxL?=
 =?utf-8?B?TndBcUx5MjBaa2Voa3UxOTY0NEg0YnpFaytSdnJyMGMvNkUxWFM1WkRqejh4?=
 =?utf-8?B?U1dydDlXYldkT1RZSzJzbDM5bEhnRldQdnExcEdQZGtrMTFvRUh2emYvdlMw?=
 =?utf-8?B?bmk3RURxQmRVQmZaSWdDSkZPTUFFN0luSlFySjRyZEV1WE1SZUJ0UUF0dGVZ?=
 =?utf-8?Q?qMHE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW1ZV2RVc0M0VTdBNU9CTjlwV3gwdjVPRmlNYkZYM2VDWEdsVXNzZ1RaaVhQ?=
 =?utf-8?B?WUZnWjhFMkVvNEpueWU5M1kwbmhGVncwRGdtcjBYcnZNNnQxdmNLMWQzWWxl?=
 =?utf-8?B?am9EQTlicVlFQU0raHYvVXFiU1NRK0ZSV0gvOWJEU2dBQ1hScjh2RUZVTGZZ?=
 =?utf-8?B?Z014ZVZISHFBTzdWN05ndys2dnIreUtDTnNSQm1qcGdzeUxXWUV5SS8rbzBi?=
 =?utf-8?B?RU1kVlJFdGpxTlZmWGNOeXUySTVOWDBsVkl5WlFwbERyT0xaeFVRZFFycWJs?=
 =?utf-8?B?Y2VsVzlWZFB0WDJwVTRGZGhnVllvaXo3MitocGx6TmwyQ2F4c2hsZ2JsVFBH?=
 =?utf-8?B?WXozeGx6TG8yZDZmcG1hYUw0WE9OT3hLcjY3VnN6SzhtZGRWTDdwN2VvK1po?=
 =?utf-8?B?NzNhNE90RE5saDZTcWVQc1JMMG9IVVFyUFlETVNESDJoYXV0OUp0TlVKU0o1?=
 =?utf-8?B?aHRWbXczT2h6cjkxdTBRMWNQUnF0V1FvTi9hdmlBdDJtTjFOQ3prMjRsWGZv?=
 =?utf-8?B?QTh5QmQ3RzJqaDNTT1BpNHBJWDNSMzlyY0trK2dlU3NBL2syQW5SWE9jYlVp?=
 =?utf-8?B?c0tuV2NIS2g5S2FrZG00YnorN0tqL2MvcjlVbmVpVnYrNTVncnlNQkdBeEFJ?=
 =?utf-8?B?SFFleTYwVUkzMUFTV1Frcng5b0RxZUxhd1VZWXBNVjJjRmxUNThzMHNCN1RS?=
 =?utf-8?B?YlJrTXhEOFZjQlRnZ1pzcmtJRWtmaHQ0MVJQWGl1VUV5amNSQ1ZwRjZTR0l4?=
 =?utf-8?B?N1YxZzdyWnRoQ2U5ak43RENGYmdleE9WeTNlbVF3N0JhWUFYNzJRMzBEZHFP?=
 =?utf-8?B?RDhnR2NWUWI2Sm1OU3NJWjN1V1NJVXQvVnBsbmVTSUhXWGw1TU9pL0RRVkN5?=
 =?utf-8?B?WUoxb1UzMk1DRk1KVFJNR2txTWw4cnZvRWd6RGtYMEoxMmFHRzhaMjBZRWdF?=
 =?utf-8?B?eHdJNFNvWkNIQmV3UHcxdG9EY0VTR3FtMEptMlVqSFJXcXVyS1orK3EwK2Iv?=
 =?utf-8?B?US84MkFSL1NaaHBvdFAra29rY1hsMmFIVWdKeGc5ZzAwcjgyMDZYdzZHdFB2?=
 =?utf-8?B?VU45dnM0YW43N2g5bkN0QW82QU50QUIyaWlDYUlscGFpVE01ZzVWZmp2QkE0?=
 =?utf-8?B?Nm5pSUlVUEtrR2Z6YWxsVFdyWkt3R1BTSU1oeDJHak9KbEFuNCtSdjZUbmRS?=
 =?utf-8?B?SFBTSU1aREl2Tnp2aDVxM0RTMFB0cGFjQXNPZURqR2VXTEtPbDZXL25YZFI5?=
 =?utf-8?B?djRJUStZdUR2V3YyT2dzeFF1OTMvSk5jVlV3S0dBT1NHeTN3VlZjTHFLdHlH?=
 =?utf-8?B?Slk5SWFvYXd1Q1ZQTmpRWFdneEUyQkkzcndzY1JkODFqTHRZUEdYMkRMbHZW?=
 =?utf-8?B?VUdhbVdWbXhOOEZuem00TDgzV3JMdFZycVN5OHVsWlRyYXJrZk9nQ3dtR25Y?=
 =?utf-8?B?NThWTkR1a0F2VHhzc2JNU1FOcEFmbkdyZnBIQXFPWG9wTnBlN0JuM1duVGY4?=
 =?utf-8?B?ejBTZTBWbUNScldnZlNqUzZvWFFGSWU5cHc0Y0NmYXpKY1F2U25PM3NUVmtB?=
 =?utf-8?B?Y0g5TFlCQ1RTNENnU2VVbGY3eGsvUy9Ib2tXWmI3UWw0TC8rTWFyTVk4WjNm?=
 =?utf-8?B?TkQvbWxYQVFNaGQ3c0dhS3MrQTl0bk5FSXJKMzdpNU9DR3laZ01GbmNBZlJz?=
 =?utf-8?B?NGZmcWRFNlFFVVhja003NEhhdHpzRU1lZis1QTFoMFUwbjYxM0gycjFndjlE?=
 =?utf-8?B?R1JGbzEzM0MwdFlWQWZVdDhMektsT1FWbjJCcTVFMHNxM2NGNVpudURWT3E2?=
 =?utf-8?B?S3dpWkxBK1NtVDVvTm9lOHk1TmhnbnZEUFRQZGxENUF4TCtrSWJWbTAxeGIz?=
 =?utf-8?B?aTF3R3JFWXhDdENvNnNUYW55OEQ2NXVVSDFkb3F3NDE0R0N4Nk1lK3VtRUhw?=
 =?utf-8?B?b2NnUDFGS25OSGRleitBSWdvS3lFbSsxZElXcm5SZ05hQzVSbE1PZk1wellL?=
 =?utf-8?B?S3dtd3RIdzVidTlJZFlLZEszRHAyNE1iQkFacFpLdDgyQjlTZ3VtWXQybUpy?=
 =?utf-8?B?Um4xaVIyM21sZnNUY0FzK2lPNk9VSlN0QmIrUjhMWVAwYnl0eVZsRHRicG9p?=
 =?utf-8?B?RmcyeS9OdG4razJ1QTVCVWt6dXdHZHNGdEpHaWJ0Tk1YUmVRY3BEM2RtcU5D?=
 =?utf-8?B?SThvT1JyUFl4N2R4UzJGSXM4UjJCVS9wVUhRYmNUdkg0b09Eb05BVElyVlQy?=
 =?utf-8?B?YlFveW9XaUd5Zi9GbmU2ay8zOWFGTms4OXdPSW5pbGltVTFmNDhoRzB4MTNF?=
 =?utf-8?B?c2w3L0dNNkZXU2VDaXhMa1lQTGh0WUVJenI2bGRVSUJzRXorcWZ5UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f17c4e-4c34-46d5-39c6-08de53df331e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 02:38:43.8084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhSwm98JEGpvJMf9Iz3qwCBf5pltba+6VOyXq+qnPs7dHguLhGsT3k3jQ41iClSbnGoY8cNMU3STXUoiSdZZaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8172

Hi Brian,

On 1/15/2026 9:30 AM, Brian Masney wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi Chuan,
> 
> On Fri, Jan 09, 2026 at 11:24:22AM +0800, Chuan Liu via B4 Relay wrote:
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> If we were to have two users of the same clock, doing something like:
>>
>> clk_set_rate_range(user1, 1000, 2000);
>> clk_set_rate_range(user2, 3000, 4000);
>>
>> Even when user2's call returns -EINVAL, the min_rate and max_rate of
>> user2 are still incorrectly updated. This causes subsequent calls by
>> user1 to fail when setting the clock rate, as clk_core_get_boundaries()
>> returns corrupted boundaries (min_rate = 3000, max_rate = 2000).
>>
>> To prevent this, clk_core_check_boundaries() now rollback to the old
>> boundaries when the check fails.
>>
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> ---
>>   drivers/clk/clk.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 85d2f2481acf..0dfb16bf3f31 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -2710,13 +2710,17 @@ static int clk_set_rate_range_nolock(struct clk *clk,
>>         */
>>        rate = clamp(rate, min, max);
>>        ret = clk_core_set_rate_nolock(clk->core, rate);
>> +
>> +out:
>>        if (ret) {
>> -             /* rollback the changes */
>> +             /*
>> +              * Rollback the consumer’s old boundaries if check_boundaries or
>> +              * set_rate fails.
>> +              */
>>                clk->min_rate = old_min;
>>                clk->max_rate = old_max;
>>        }
>>
>> -out:
>>        if (clk->exclusive_count)
>>                clk_core_rate_protect(clk->core);
> 
> This looks correct to me. Just a quick question though to possibly
> simplify this further. Currently clk_set_rate_range_nolock() has the
> following code:
> 
>          /* Save the current values in case we need to rollback the change */
>          old_min = clk->min_rate;
>          old_max = clk->max_rate;
>          clk->min_rate = min;
>          clk->max_rate = max;
> 
>          if (!clk_core_check_boundaries(clk->core, min, max)) {
>                  ret = -EINVAL;
>                  goto out;
>          }
> 
> Since clk_core_check_boundaries() is a readonly operation, what do you
> think about moving clk_core_check_boundaries above the code that saves the
> previous values? That way we only need to rollback in the case where
> set_rate() fails.
> 

Perhaps it would be more appropriate to move the 
clk_core_check_boundaries() check before saving the previous values, 
like this:

	if (!clk_core_check_boundaries(clk->core, min, max)) {
		ret = -EINVAL;
		goto out;
	}

	/* Save the current values in case we need to rollback the change */
	old_min = clk->min_rate;
	old_max = clk->max_rate;
	clk->min_rate = min;
	clk->max_rate = max;

The changes in this patch are intended to avoid altering the original 
driver execution flow, while making the minimal modification to fix the 
issue where the range is incorrectly assigned.

> Brian
> 

