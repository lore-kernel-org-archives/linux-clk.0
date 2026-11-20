Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.80
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795145340;
	b=TTmEwdMoPxMbQ3OiSErMATR9TJql7l2XoZvqEdSLzeRqmQ4iyiJLZTP5ZE1f9Ksk7jbO
	 Fb4QB3WR176HsdN6o3FV4xXMsM2vczrWhufJmItntV8Rs1EBwaqsAX1rx/lFlIslRg4OI
	 dIsEJVHaUsyWY+6ZsZN7kM7WVZ1BpO2CKTAPT6K2tx9PhVXNf9wmvjlnqyW6qZ6/HwaD/
	 SxAmv+sdITKJ8bZukIowoavXbPXrDgg3Iawqm0vGfNZ1fVzDiDHXccROehgkHGlEZGvos
	 Vkpmy21nakZyAfBvoA/cJv0omegyBXqlPsMhMDodVyqDmyc7GD/mobmOqihz66UtvNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145340;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+NqJfb7q1BQednF8g+2f/VYXF3gZv1UpwOYXPT9FrCs=;
	b=LKgly0kxqbiaOYH/SLCfMrTQNb/d43eW3QWiae4F/bcUfsjTcQS8QxSOL1jdNZIDhHOP
	 UA0GbhUCTtnX0f409ZnbgfLbOHYXJDRvoZfMvolPRVny/NXFxIaouSJ5pfOujEGjQXg2T
	 yrFpgOybYscUlzaiJXobjVBk+m4XZR+R5Cc0z3fHCNvXvlQS6c6MNkGodF4f55tQohkxW
	 d/WAXGWkNZIaA8ihjrsv/Zgc76cM2aQt3W0qEJ0hUBIvUo6F1Gk8f1HiawNzkRHAw0B35
	 K77T5sQftWnwePH95F4p03GWEZwIX1CwEyarZwiqblOwZZ3dRxXPL3EQKP5VYuPJalQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=Kk6i6Aq+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.80
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023080.outbound.protection.outlook.com [40.107.44.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C99606A325;
	Fri, 20 Nov 2026 03:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C99606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=Kk6i6Aq+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBw+7FUfEs8mQIG4NY20JtRYuCo+2llskuMwkU2Mb4MKl5/nETLm/0uCCn7v+apRhjEU2SpAjSA9Z44pQoc8lPFKEaeGi4Ytf9GlpXQKBZcc5M265UjYYFh5AwvUwycK6oBIh2zypBwR8Vo9GicCGZfsi45aR/sA1TlpC/azz6CnXR4ynMmR2dmxXOT03cDEW+S547v+IcjcbB8Rrpo+wI6ossuNCAP7PKP5E/xKD6B1cBlfbopvQo5/wD0c6vJNX3uLC0hb5jr95AKNvvOThocAymwm8ydAsdUPTDWZoHo/lnOPMUuqrAUNlqH5W5ayvOo8GK5pVM/tAzupnzYB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NqJfb7q1BQednF8g+2f/VYXF3gZv1UpwOYXPT9FrCs=;
 b=KZLTbKUGKV4DcNjeM8IcMRjvM+ecZOoLEsghUgL1rHVrIiuMjMLEKXPFiIZL69JKfXCJYzA4utKVYFE/YXYzCOsKohace+zBmRIDvr5ILPNUmGU1XVEW7YUPymeok2076hNPFFez7JIsfobAucGCRo3Niz0xhzph9fl16unvWfIHpdPEpGBB6ORyrZ6bZ+DnRY591gabofCnGjqV9T1A/fwc5qJdggJ0dNkm/uO9uGtNSJu4V+3ELuokjEbnMK/HQ++ivtblR144JEihBYaFBL7k1YIE+8LrEq9F48WopLYLsNDs27GHzc6bZGL99qOcOyq5wYlc+bdaQyiNQ7CW5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NqJfb7q1BQednF8g+2f/VYXF3gZv1UpwOYXPT9FrCs=;
 b=Kk6i6Aq+eFh9+ZTpVD/eVYt53T0SBrojUZMpF8KVo1OCVAtzpCQqWKIGfaidFFxkA8SF2JlazPsLuf00gsCzIcvcPWQjHf2mZfk7kqs+g2EKyOadp9Nl/SyX8YgENv+avI6ER8yz0iRoNCYb9NmiWNjr5R3pUpuq97ItP7Jqcs8Slu8HqqvIajl7Pfihup+5q+qx2z/pq7gzPBUUgL68MX+Jz9ONOn+dXm+dIG5CayxmQCzaNl9FwPKjPqRtF5V5suTGfXGY//O/kLDyAhhAF69EeMVnUcEDe9jgdWIzDPNoH9+krGqp8+GHCip0ENJd1qF9aw75uY+nmcpUPZGnZw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by OSNPR03MB9939.apcprd03.prod.outlook.com (2603:1096:604:491::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 03:28:56 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 03:28:56 +0000
Message-ID: <f2633593-48a9-441d-b304-eebaaa45ba0a@amlogic.com>
Date: Fri, 20 Nov 2026 11:28:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT v2 2/3] clk: divider: add CLK_DIVIDER_INVALID_ZERO
 flag
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-reviews@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
 <sashiko-outbox-189068@kernel.org>
 <02476c54-d8ae-479d-898f-cd89ee2f7c24@amlogic.com>
 <179388599696.2573818.3573650064673131943.b4-reply@b4>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <179388599696.2573818.3573650064673131943.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:4:297::7) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|OSNPR03MB9939:EE_
X-MS-Office365-Filtering-Correlation-Id: 62733d9b-7c98-4e95-5eb6-08df46b6688f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|18002099003|4143699003|5023799004|11063799006|56012099006|10067099003|261022075727099003|261026140227099003|261028144727099003|261026121527099003|261009223027099003|261021121427099003|261102123227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	9OkoTqVj8Es+OlRTlSqJ2g/ZLtF+GSqoys0qJom//mjVks1k9Dwbdsa/9NtzX9ehgUi/HfyEkPzmuHr6nZlLl0ffOhKSeDCt00CgbtbbFltDVkJLfezIrHWiGkLt1Aa0K211x9b7vce0sIURq7OyxiXiEyk5PSa6tZxfW65n1svWRPNjNgnQlzl4SthRsMMxblaGHOL9KzpGwkKTGpvO9L07+1Zgc3icradENbEkZf7QpncQbZVl2eN2XTzm1ssKYzH27shk91vmqwD8cagu3APUgV29SBQpS4JkLeLDWH254FiT2sPma/kK7I/eSMV4L9BumNnpDuD2WUrvOFFw73t2lSUxyDGJassM+FxJ0nHaCNjnC/eddXJCos2lzBy2HtW8hTvPUVwQ6vmJhW3dbLBvLMQxvpYxkng7cmI8v07aC7QatqMwkChZqF6CZCaqvwSa6onWQFpCaI4jPQviSwDetak+FdW+dbQ5z2kwY4DKcKz3//7b4DO7bKqY+zdIzZpsVyp/pkGaIRJgxrfqC3Hqnc+ODaaGczdWy7ic0BPBy52DsKVQ7dk+957kP0wFfiULHhdAw9CwUXIE+UuhItNZigHJY1pjIHpt42S8axpG7QmgFWHk5+PLLfuvuYnUGIoTkEizRCBal4BOwFAp/Jvar3yNzToIIeexGUoqd+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(4143699003)(5023799004)(11063799006)(56012099006)(10067099003)(261022075727099003)(261026140227099003)(261028144727099003)(261026121527099003)(261009223027099003)(261021121427099003)(261102123227099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDVYWFJTd2Vybi96NVpsM2hHNmYvN0FqUEJxOTU1bkpOcTRNcFpWMU5tQ0ZR?=
 =?utf-8?B?MTdqbGUxTTRSOERjY01JcUJFbnR6dHdWODBGNGNLWXZZUUVocHRBcHdTVVVZ?=
 =?utf-8?B?Mm1TS255dmZFZnRJcXlLRjFlekRWRkt5eTFlQTgvZUtCb2NxK1c5bnZFQ0RT?=
 =?utf-8?B?cUlHWVhMNG80L200U1pIRkpuYldtaTFRY0RETGQrTUJsQWNVenZmUUV2U2dm?=
 =?utf-8?B?VXIwRHdXbFo0YjRRSUx3bnhtWk92T3BFcHhuSzF0UER2clJaNUp0bHVPWFFC?=
 =?utf-8?B?em9wVzhJYzVldWUrUWloZHJqRmxPOG55T1h5K2pXU2NWZGM4VmExL0E2K2t3?=
 =?utf-8?B?MVdnbXoxRDYxMWtlU1FXSHZZNXRDcTMvNFFvRmFyekFxaXM2RjQ4Uktmazd6?=
 =?utf-8?B?RlFKTkVFTWhyekFITEFGQ041L3NqbEtqNjZ0Q3Eyb2NqNXU4K2lGLzIzSU5i?=
 =?utf-8?B?anU5YXdYZWpKdVdaVXBOczdkYVRVdG16YmgzKzAydVp6Ui8yTmIrMEpmTXBh?=
 =?utf-8?B?OGF5V0x3Q2xibUtXNW0zTS93d3FVb2k0T3N1NW1oTGVTcGNzZFRLc3JrUUtx?=
 =?utf-8?B?MGtGbExPNXVhdVQ1R1dhRzhSV25jWXlZUDBieTJpdkhWcjBDak5oM1dTOVBP?=
 =?utf-8?B?bE1DQy9PUERvOHQ5ekhvc1BxT3YrUWFFL1JwUVBzWS9qY3RqcERKN1M4a0pX?=
 =?utf-8?B?cUUrbWFvaG51SnBTdzV3VTNyeU5pYTFVOS9haDFVTW9qU3BoWEM3Tkd5dklX?=
 =?utf-8?B?aGF4bi80dFVGRHdyRXBNOUc3aWhKNGFoSEI4OEkvRGZZNUZIK092SCtaQ29q?=
 =?utf-8?B?WTh4UDFCNktQREgvOWhkT3dpRENsVjlpTURGR2trTjI0L3duRGZmZWtiRGw3?=
 =?utf-8?B?dWRkMVpFaEtBUmh1RklweC9tc1RSWFF3K0JGTGduL3FKM1BJNjZBUmZ1UUlh?=
 =?utf-8?B?UWJmY1hRcGI4OWUrdmMzaUZ1d3Q1cEJJaS9LM2hRcnlFZWxXRWNpcXhVckwy?=
 =?utf-8?B?UFRGR0YvR3FKcVJKc0FhdW9YdzNEeHBGUGpBcnJjTERoc05EaWZwbU5tMWFU?=
 =?utf-8?B?WHJCZHp1THQ0ZEFOOC9YbkpjWm5GMExYeFh1eWU2SHhPVFhJRE5kMXdKU2F0?=
 =?utf-8?B?U0hneXZLcUI3NlQ3aTNhT2NCejNoNU1ZWVdTWEJ6dllPMFpKZDhNeDFuVUwv?=
 =?utf-8?B?RzNVdzYyMXdHVDNCL3Z2RHBEMWRGUG94V2lERXhWTDdMV2oyYkxsRlBCdVpn?=
 =?utf-8?B?V29hWXZKMWZCdUxyZEliMER3RDc0cFhqTmxya213RUFPZHM3c2JNRUFlY29i?=
 =?utf-8?B?N3plbUlZNXBwZUsremlhM29BeVhQUDlMZXhNcVBNZUM1UXN6dkptdEd4NkRO?=
 =?utf-8?B?ZCtxbW5pZ3lYZE5ZN2ZaRlo2N0pTOWowb0VvQlNrZ3hkcTFBWEJkOFh2NU9R?=
 =?utf-8?B?SVEvc09UbGhieS9CNFZYNndlWmNaa2RCZlF2dHovK21xd255YUQySVdOWlpv?=
 =?utf-8?B?bHc5WTh6SjVta3VXaHR3NHRyOTNxNG0wbjBjYmpvcE82Y00xdXZrMXl6Ym5O?=
 =?utf-8?B?REZWMlFuRDNKTkZzR3BNWGN0bUNmZENpeHE4VmJrZEt1N2k3aDNwZG9YdGZF?=
 =?utf-8?B?UGdqcnBiRE8xbWwya0psZ3k5K0F4U3l2RHB4UExDRGhBMnN5QnpWdFJUb3Er?=
 =?utf-8?B?UFNEUGZ0YW40OWhqbEdaR1hYcVBJa25paVZBS20xRVVLRHVzZC9JcDN3MTZn?=
 =?utf-8?B?UCsvRmtsZDZsM0U2V3BmeE8vbkM1MDRSd2t2blpHdTZnNTg2dWhOK1kzckJE?=
 =?utf-8?B?VnYrSjgya3B6OWlQblFVQVQ5VkgyOHhVZXVjVWZxb1Z5ZEx2Uk1JZXVuZ1Rx?=
 =?utf-8?B?eVNqcjFWeEZ5UERwdVRWWW04dGZzRG13elpLUjNPSHFRQVkvL2JtRjhoZ0Yr?=
 =?utf-8?B?UGFtOG1jMm5SMGw5L1NaaXIrZVM1YTZWSmRWR01TaithR2pnR24rL09VNTM2?=
 =?utf-8?B?Wi9QSUl6VzZaUkdRTU9iakdpZ3FvYTArbVVGakVYM0JaOWJsWjQ0R2c0cnV5?=
 =?utf-8?B?NU1nd2VJajRqcDdNMDhtTnc3ek5hc0NzMWFqUGJQVUVzd3krNmR5ZWxFd3dR?=
 =?utf-8?B?bEordXNBRXBOdHdNV3BhQnF2SzgzRG81R0Z4L01Ua0xsSGdCSFh1YVZvNkgr?=
 =?utf-8?B?ZnMwb1NhbE9SYm96Ti9EMGc2Ny9hVnVGRHFSeitlKys5dUppTTZyekNGb2lF?=
 =?utf-8?B?aVN6d293S0I2OGxReENhWWZ0aGxQRzVIalFyZWNjUllBS0dhc2ZUZlJoSnl4?=
 =?utf-8?B?VjRBK2JLbHZkbTRzMXF4S2VZdXpiN3ZPWmhQb2xYUFlYQkptMDdqUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62733d9b-7c98-4e95-5eb6-08df46b6688f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 03:28:56.4106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9amo/+jw4pigg7EFW7VZLUN7A+cH8FupgGuoTaijL636oPQRKoEE0TcDmqq8veXUOY0qFg57V4byay0E5vOawg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR03MB9939


On 11/5/2026 9:39 PM, Jerome Brunet wrote:
> On 2026-11-04 17:07:10+08:00, Jian Hu wrote:
>> On 10/29/2026 5:47 PM, sashiko-bot@kernel.org wrote:
>>
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [High] clk: divider: unhandled zero divisor in divider_ro_determine_rate()
>>> --
>>>
>>> commit 5ec3118aee2f03855552c58a4a8533e035b565bc
>>> Author: Jian Hu <jian.hu@amlogic.com>
>>>
>>> clk: divider: add CLK_DIVIDER_INVALID_ZERO flag
>>>
>>> This commit introduces the CLK_DIVIDER_INVALID_ZERO flag for dividers where
>>> a zero divisor value represents an invalid hardware state rather than a
>>> pass-through. When this flag is set and the divisor evaluates to zero,
>>> divider_recalc_rate() returns 0 without emitting a warning.
>>>
>>> [Severity: High]
>>> Should divider_ro_determine_rate() in drivers/clk/clk-divider.c also handle
>>> a zero divisor when CLK_DIVIDER_INVALID_ZERO or CLK_DIVIDER_ALLOW_ZERO is
>>> set?
>>>
>>> When a read-only divider has a register value val that maps to div == 0 via
>>> _get_div() (for example, when CLK_DIVIDER_INVALID_ZERO is combined with
>>> CLK_DIVIDER_ONE_BASED or an unmapped table entry alongside
>>> CLK_DIVIDER_READ_ONLY), calling clk_round_rate() or clk_set_rate() invokes
>>> clk_divider_determine_rate()->divider_ro_determine_rate():
>>>
>>> drivers/clk/clk-divider.c:divider_ro_determine_rate() {
>>>           int div;
>>>
>>>           div = _get_div(table, val, flags, width);
>>>
>>>           /* Even a read-only clock can propagate a rate change */
>>>           if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
>>>                   if (!req->best_parent_hw)
>>>                           return -EINVAL;
>>>
>>>                   req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
>>>                                                             req->rate * div);
>>>           }
>>>
>>>           req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
>>>
>>>           return 0;
>>> }
>>>
>>> Unlike divider_recalc_rate(), divider_ro_determine_rate() does not check for
>>> !div before calling DIV_ROUND_UP_ULL(), which will trigger a division by zero
>>> in the kernel when div is 0.
>> In this patch, the dividers which set CLK_DIVIDER_INVALID_ZERO use
>> divider_determine_rate(),
>>
>> not divider_ro_determine_rate().
> Yet the point raised is valid. The change must work for everyone, not just you.


I agree with you. This new flag should apply to the entire CCF.


--

Jian

> --
> Jerome
