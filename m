Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.191.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795463273;
	b=fE5TLH3WOHyzsKnDl3bLew8phKw4YkKgvANSYHjsPEKCQxfLgP6uwZPDTeHoAcLnzyH9
	 3trdo/TTCbDzFxnNjWYBVHzUCcIXotWFTGtQ+5cFEMgUIjXrWcN/rSDv+3MvYh5j2wkaP
	 LKZTrY/KQKcLSEDgkxs2kPmMUN1o2P/53fFqAxWyQ7F8GlbVbG9ISA4AKSn+F6oEnIlVY
	 ekptoHrHyUWfaCVfEcu1vItK0NCeSPJF5on9R77/e9hq19j8imOuvNVNyZwcG8Xz29sRN
	 ZhB/Exc4FLOGRL27ghz/0q+jNwbhxuUaMmFZCbsWPyAeO5dcZEg9s5mkm9jTHtHKFQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463273;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-AtpMessageProperties:X-MS-Exchange-SenderADCheck:
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
	bh=GeeFyNrTJ0QsritZKw63ARz1DmzWU4m4LEgDO2AUpvY=;
	b=Z+jk/3F+s/f7dPNAlw+AXieTXXmwMNmZwGYVeZDNAJq8NznMSLoZBSK67RJlpaCSvmyA
	 oM2Ywj3QhRQWUMxN0HQ9vZ07gP5IVZYgWd8cazUBhGAt9qpIQhLKd9CD5W1WeTEP6lgKr
	 ovz2o/V43SQkVYaIvmSdeGj5M3I+hqsnAHqlugncDSDKwo+KFV7D42JPb5MRRWltAX2yH
	 HQlVOS/6TQkoZajk2xVW9+enf+1aB4xyYwXfc/3vI27Li7f6JgxDWk9uczAew7288DTd+
	 qFKag4TB1YsD7gjyu0PwniWsLLkgB0Fnf0jZ7Nx+ac2uWM+ekTcGl3ZsGL7JofYiuEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=reliablecontrols.com;
	spf=pass smtp.mailfrom=reliablecontrols.com;
	dkim=pass header.d=reliablecontrols.com header.i=@reliablecontrols.com header.a=rsa-sha256 header.s=selector2 header.b="xNRD/0r2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.191.92
Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020092.outbound.protection.outlook.com [52.101.191.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BBF606A31A;
	Mon, 23 Nov 2026 19:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11BBF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=reliablecontrols.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=reliablecontrols.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=reliablecontrols.com header.i=@reliablecontrols.com header.a=rsa-sha256 header.s=selector2 header.b=xNRD/0r2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P16B+G+EiJunDdoTTM6YsJxuFPjPirmj3zicQ7aF/65I7Ng1obdtKBkXMT1vjgBCq/pEDy7E7ThXdXulVQXc3lB18vvZr3Ef5p+PE4VnV0XhdjBZ/3YuTyu5+P0mzrNu5NWL+rMPNhnX1QQygZNJVBnSyUyfqCT9LklBnR6BhZJri1jr00L5RasnTZMYA6xUJtFeqIu4vBjweDLELH48DxbAFl4/vBHcoAjW2J+WPYqoOmgrQMs2hLqV6hvzN8YyLsQ7+NLBCJIA6TNVJCGM9Op/dBC0hEVkqQITTW4QIOIJ4JqSi7Zzd6Uk4fgjndVVtNxCptgocmXANXKEoviSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeeFyNrTJ0QsritZKw63ARz1DmzWU4m4LEgDO2AUpvY=;
 b=bChuFjQefg/N7hSoEszM9kHjCmdn7E2umEuWIquwY5qRRjOoo9XmE4UvsHs4Xq+Ll8FV6OrCTCuOD8aZffddfXwtAaH4/QeNX/wvS06hbOfQTRjCHviWicApgWp3MGR/pJY8rI5AkOo1pOO68dzlYURq/eGi/YbEQSCAN3a74XPHUpT0eiGeFuLgN4BE8u6eOpWy9kQW7vnP9qe7yKnVNDwxmM7HJJGyFCiRxni94uzee5vZSr20bDE8W4mWIkc5X6CPwMRPf5eOhaSKBed/X12jwzc6YJySAiaWXbTjXdRGKTXAsi9eEVMpuxe/hs/9fqOyIeRElGsvCvxA2C72Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=reliablecontrols.com; dmarc=pass action=none
 header.from=reliablecontrols.com; dkim=pass header.d=reliablecontrols.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=reliablecontrols.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeeFyNrTJ0QsritZKw63ARz1DmzWU4m4LEgDO2AUpvY=;
 b=xNRD/0r2BrTLlDJWmm5rBAdiI5ZVs1vvmLLTqT9+Sf1bJDtbY7WAINOFBy43RMxtf5hslLUQZVRF6HJIMpvE3+g9R3NexpyUv6i8GuXihyUaby0SmQx4H680+4G85w51QBnRb1NeOuzTLglTTkoWPCohLoJ15u6MK/jffE3D0PpCrP3FNU2iFMl4CY5o21TxBune5X9XEL54T4GEh1THKDswR6xkHtl3etqI4WW8CRVFzYj2XenjWRbRceQZZ4KWxzVv0a52ut04EB2qZzZE19uPBtR8vNQ8RwKubbW2jJ4U7lQOESUzX+GeKPM0rueGbpzBh7UPLt/1LWQvwgR9dQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=reliablecontrols.com;
Received: from YT8PR01MB560833.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:a::10)
 by YQ1PR01MB568964.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 19:47:47 +0000
Received: from YT8PR01MB560833.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bda5:1597:e27f:11a6]) by YT8PR01MB560833.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bda5:1597:e27f:11a6%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 19:47:47 +0000
Message-ID: <65383108-4648-4558-b6c3-bbe69ef97c69@reliablecontrols.com>
Date: Mon, 23 Nov 2026 12:47:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: renesas: r9a06g032: Add reset controller
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
 <20261120-rzn1-miic-resets-v2-2-f1cfa678615b@reliablecontrols.com>
 <awDIp5YYhxQM6bHo@shikoro>
Content-Language: en-US
From: Kyle Hendry <khendry@reliablecontrols.com>
In-Reply-To: <awDIp5YYhxQM6bHo@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::16) To YT8PR01MB560833.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:a::10)
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
X-MS-TrafficTypeDiagnostic: YT8PR01MB560833:EE_|YQ1PR01MB568964:EE_
X-MS-Office365-Filtering-Correlation-Id: c19c728c-4e6e-498b-f190-08df499aa628
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|261026121527099003|261021123027099003|10067099003|11063799006|4143699003|56012099006|261009223027099003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mC8iyr8Lu95oJ5MJIoUQ61Qk+wMwF0QVuQkyfAtfjTYuMSWET2ZvgDKdGJu0otNFGNrb34OJLYzrcgDhHjTUGiFcwCwf377g4tkAg9cFkNTrelqLo1rHeq8iVCAlFeMBf7ejuxqUnvtJ77LkQYcFhOr/it+HmzCPf7zkwtUNHjin4j/jUQOZ8pzxBxSGhhl6Y35j/uklaFwQnV1NaQczbBMzLVVNOwiGV9no3uWpu/sdcuKgytrgJdO5iAFJ9IZ5x5doPua/mV2SiU26RkXotMkvNvSUQSa1zcAEzw3RWkO7Lb50UUe8tHBqB78RRrsqu9LNcNAkIqcyGju2/z5B0O4XtD4u9PzwL9DtU5/hZNdxshB3CNc4vNfRAxVLTLh8mkwBPscXdW2E5xaeLzN2981r6VkM8dLoNPB05+q/CBPbUoMbkz+w8ATxi58F/ir99XEk4rB92Am/u1q0TD7mDd0flFRa6c//6H1OMHzrLJC+iGIVQEHnCrSf2y5+KzKWxC+/h9cWmuwqPwlA8v2ogfrsr3yhTyrA9yCp24Gk0hUooX/97lB3HCTUxBUfqhf85hrJlLn75R/YUdkVK9jqkdW1+jI8UiVYbLvZCtAGza68yh4f/QY4Yig7bUBAoDGMjs1W7ZL5qJ40ZkILrqugMJaKQpiplX2jh4MrOz6xrbg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT8PR01MB560833.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(261026121527099003)(261021123027099003)(10067099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmNFem4xWTZyT3pKc0pmdDZaODJGTTNCUEZpdFVyb2RaUFBtVzRFWUNCbVR2?=
 =?utf-8?B?VkZVYllpNTRQcm13SEV5S0NqREFSNFA4UnBXSHp1WndmbDc5OElCK1AvVjBB?=
 =?utf-8?B?TitVU3doQ3I5NEpPUVNZMnVWT2xqQnpOeFpHaU5zRGFHQVpoWTRrRktEcm9w?=
 =?utf-8?B?YjNWZWlvM2s3eDV5dUdReW9wUU5kcVA1U1JqaTJYdm9LRzVvWjdaZnFrWlpB?=
 =?utf-8?B?d2R2b25Yc0FPZzZPN0dtVGdpMHlLUW5PcVhwYmxpMk1PQzdmSjJtdW9aN2w3?=
 =?utf-8?B?bmd6Q1AyL3UxL2dmUWt2K3IxV05zcFhrdGtTdkNDM3lhKytBc2hPMFJZd1Ew?=
 =?utf-8?B?ME9PU1d6bWRuMzBTNG5CY09vTjAwU1hiY2lYVWFwZWhqTHBNZUlJdHhNTGoy?=
 =?utf-8?B?ZklxRktka1cxUDFlcUkzU0NFUzZGRWNCWkNkNEZaaDk5dDFZcHBPWnNMUThD?=
 =?utf-8?B?OE1QRm84dFY3U1BxRFl1bXk2UURZdmUxaitXNUdkdmJGRWY0VjF6SUREZnlN?=
 =?utf-8?B?Z0pZWlU0UDVoU0Q0SnR2K1pFWmpJUUwxQno4M3U3YXptMjZvREltNzdlTkNx?=
 =?utf-8?B?OGgzSlFCMnlvK3lLMmtYSFY4eG9ib0xsZDg1VENXekpsanBqRlU2YlpUMXQw?=
 =?utf-8?B?RmdFNXdDcUFMUGFNZXphRTZOeVl4Mys0RzhUMi94dTNMWnVic3YreUhDbTB4?=
 =?utf-8?B?R0VhZUpSbjcwUWNjNDgyYXZuL0h4a3hIQ0pRVkV1SUNycVAxMkhSZmhDUnJ2?=
 =?utf-8?B?YnpoL04vWHkwa1hOYm9hM0V3cW1GT3dEUjI2SWMwaUh0bzBuUURoUnowL1U3?=
 =?utf-8?B?TkdTV1VBMlNHcGx4SVV3b0VwWkgyd25ianMwZU9iRU5XTjMrZzdHV0Y5NkNs?=
 =?utf-8?B?SkN5NXI2aXpGaStSdVpCR0RwdWFDdk4yNDZrdmZmMXFnYlM0NUZ1YjVYTTFU?=
 =?utf-8?B?U2p5dXNsczFjM29Ibk9yY1RoakRuelQxdDdFUk1QdGtuVWhubXVtejhCNkJu?=
 =?utf-8?B?WmtIQ3NDclg4ZzNqNjQ1UUVvaXVyV1lFYmlVd1FyN2RmejFwZUlyQlUyVXk5?=
 =?utf-8?B?MkczSytLRVJZOGJIUHlqR3F1QzQ4aFpiTW9TTi9Rd3dDMU5hSWhwZDBTT3lG?=
 =?utf-8?B?Ly9oNUNjTkRtSUJpTjdwM1VDT1R0eFdqVmhvcGppS0JPUHdoNzNrMjgyb3B6?=
 =?utf-8?B?SEFTVVVGeTEyR1pIMGlrbHVJWG5OZ2tFSk0zdnZkMEt4ZEpreFhKVHpKMzA0?=
 =?utf-8?B?akpSSDRZeUxTcnY1TGt3NkYwREk0ZXgvVXlrSVdwOFJ5OWFFa2hLaHlmeVJX?=
 =?utf-8?B?T2RwQndnMjhDSlcvNDJtRWo5SUkxQWVsWGFWeWZYcXpGV3FOcHdrN2JLUFE0?=
 =?utf-8?B?d1N2OG1FSVY1N3pLaEk3YXhua0wyRWxlQ0Vrb2VrbFg0RCtIT2wvemYzYWhm?=
 =?utf-8?B?OFFENjNPZGdrWG9yZ0ZOWWtOd1dkSUVsSjJLODk2ME5KTTkzMVI5RGIwWEFi?=
 =?utf-8?B?NkpOYkhpRWtCdVZkMTNXa3NEQlBXRm9IQ24wL1JIaXZBdzZaTnRZMFJkaDc0?=
 =?utf-8?B?cm5xaWVBaE5FVllzNVJwNUxhdTZxL21ITHJTSUxKTjBPZUNzWkVNQjNPSDZO?=
 =?utf-8?B?RnRYdkpQb2VzcHc5SENrd0RzVWJtNUpubGtCMnF0d3JPRkRpUU9ybVRXRDNX?=
 =?utf-8?B?OWxYM0wzYWw1YW5xTSsyY1dGTUVXR05CRHdHTjdQVFdueEJObDZ1aEordjVM?=
 =?utf-8?B?bVEyN2xiaVROYW0zcHgxc1VOQVdUUGJlQVlTOTBsR0t3Q2RJVmRLTjdLMUlT?=
 =?utf-8?B?WmhnR2tnZml6bnFkNFhoNUphZlQ1RVNPc1I2WjErWnhBNmpLTThCRzg2M2Zj?=
 =?utf-8?B?UUxGK1N4dEFBM0pab0NmY00zR0hpUEJ6YXVwTmxDSWw5SWRUOUdBL2Qzb1dE?=
 =?utf-8?B?ZlhlaHdoajQzNXlhWXZtYTRwZ2RWV1FucjdDakZrYXBPNm5rQjdqOWhjZlNU?=
 =?utf-8?B?ZGdFV3o0blFWNDlaL09MVzMyQStHbURRenNrRkVHYzR4b3YrVnRITUJoL0lr?=
 =?utf-8?B?MDlaWGc4ZmRYUHdGcGNBRW9TMjI5b3dJRTJGd1lLM0JyTStQejFIQXp2d25y?=
 =?utf-8?B?ZEZjN2gxTHVhYktwU1FPSzBpK2pSQW1iVG0rWXRLM2dzTS9Say9hZm5kQW5l?=
 =?utf-8?B?cUhBWWhwSjZDM1Z0c01hTDlIeXovNnBKcWxQcllkMjdlcVRrNWRhckhaQnZp?=
 =?utf-8?B?cm52aFJpdUw1Mmd0SS9KZnVpOEJZWkFLM3JWYkxKRE5ZNElHSCsrclZONWFO?=
 =?utf-8?B?bHY3d05qajlEM1VKN2NaRVRjaVZ6YnFzSkM0WnRWZy93c3p6K0dpR1pIRjF3?=
 =?utf-8?Q?4hLMKcOsH4iQaH3g=3D?=
X-OriginatorOrg: reliablecontrols.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19c728c-4e6e-498b-f190-08df499aa628
X-MS-Exchange-CrossTenant-AuthSource: YT8PR01MB560833.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 19:47:47.2755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70dc28cd-aa9f-493c-abf3-5c1ff69c0ddc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9K0wygHXV7qC8vMy/b2LhsDYcxBxWWZXKosvAlGjBDyhb1AdelGmSIGd/9DpygZv6qWK82uSRcunHbidyxVeEZ2ummhAyYf2gOkYRpuaqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQ1PR01MB568964

On 20-Nov-26 15:24, Wolfram Sang wrote:
>>  	struct clk_onecell_data data;
>>  	spinlock_t lock; /* protects concurrent access to gates */
>>  	void __iomem *reg;
>> +static const struct reset_control_ops r9a06g032_reset_ops = {
>> +	.assert = r9a06g032_reset_assert,
>> +	.deassert = r9a06g032_reset_deassert,
>> +	.status = r9a06g032_reset_status,
>> +};
> 
> How do we ensure now the 5us recommended delay for reset propagation?

I looked through the renesas u-boot code and it didn't have an explicit 
delay after deasserting these resets. Should I add it back anyways?
