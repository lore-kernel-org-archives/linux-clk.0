Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794912659;
	b=CaNH/bZQt16OvrpbaCWzFDW85sgsLWZS8BU/yQoamrBXJlDliU8FI3PCk/jiQ07guGqV
	 FiM2bMeM4iAXjzWD1hWi04Vmnd8q/feN/bp8ThAOVpbnTCWQO3cNHp5YF55OUFLyUaXNE
	 mRxhzdswmdEA7j47l79RUbRVkmvU4v8jrYSvldfTOBFb7i8W0eneeJmSyau0M/B/Uu1KA
	 SCqqppR39SyDxUpa5BxgBy5a3UJ+5otEIgGIwcBIb44qIpfVGNwwIQGAvgDKc5DTES3ri
	 M/OApqohpq3lGcM5gepZJS06vD1C/tIJDl4hIxcoRuUtS8w8PvygpDdizh8JaTVT2/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912659;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=4GlJH3a0k1Uv/8C3ZO7LPFWM8uVB+SDunoL0qenHnew=;
	b=X7OQpnQ8s20wnVGDuxuvhLqQ74dvH3CC4yO2CDPvgz35vP1T46N/xMDqBzIHiffnTQXN
	 tp2efMobxcO6l3qpayVv3kCjNZymvXiQP/hi/B906d0My8AOTS1ZdR3He6X20y2Db+ICO
	 VCLXOnk0cS0vgTyc+9xXgXCxu/xRDCJ9Ayt3xMBvKCWjqUA0r/VZyA//fUQ/x6janyYDj
	 M1Q379vex9zDN0XA9p3B4Qv+1Ek0mxgNBoj8DiiIhx0H/FpM7/FElr+/ccZBtKJ2/Byfj
	 jUqiYMLAqRB+45Tw8FQJWinbBrSFlRWvDPloIkdGQ9EY9MgkIF+CDKKLq2abxfShdSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gieNcyT9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.20
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013020.outbound.protection.outlook.com [52.101.72.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AA2606A336
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 10:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02AA2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gieNcyT9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2hcCt82OLr5kXS87kPBuWZJSaH9YT4t+M0tUGKC/sa9EMoLaCNXk2LlLbpqoMizunjfGiOTdvQjE2mA5MvaBjoChzINUaV493i3vNYO+R3zXqmlxU8BBYj9vr0vduiKkAOXyi07AF5CKy6zv3S79iax9AgPwxkxwm4JrWNinInyCeYVQk5tO5bRXh05xUT8EKOH1zK3HICPApyIN70IYeGMYlIJIGkMopD7ItkceWlij5xOY0+1EmxM5TkpXvSCFw7hOcLW96PM+5Qbzyh1/DSNOK0oAYh2nYlPj6rBGVtOMUj2MnvYFizPcz7n3TRKSuLZfa0d5b/8K0mxQCm9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GlJH3a0k1Uv/8C3ZO7LPFWM8uVB+SDunoL0qenHnew=;
 b=xKQEYu/9Z+aoyVSwFbKHeKKtdTmUleu4uoHaIJsy7IJKaQxfaGclV1HFqc9+fOYPAKMZCjdTMkq3BBCkVUQt6vFjfrVmrx6HaAatR/6M8yn62Q+BW4iC8z+jMYtrta5uTbO7O0WdoBps1qna+6wO4yv3XWTMkhnictTq2IW1cy/e4nnm1KUwX3L1dFRUwIyo7wML5psMaP4+RGVcK9FjbR+6BdA3wl6JX2CWeA8boS6iMqdrcOGDf3b+N/1qePfj6R+0SXSiDlyafePbsSNu67or3uPJc5ItjiysTd5OU6SsKdP+2L7g4fg2H07fZaZqsLWE3RVBn8NZUnux5QNQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GlJH3a0k1Uv/8C3ZO7LPFWM8uVB+SDunoL0qenHnew=;
 b=gieNcyT9//xkhD3CrF38VUgkj+KQqeJW6teQhpnt+kkZ6kuzvfFVBzq7wyjWUFUJ3NawKwnco9W/VD9hf59A89qCI4neGvJadi995Pe37LF7G+TZa8DvZ5nlTFJ3MAw994COqkV9UvVI+RdyFpmgzOpbOa11DbIsqh8sxXuD6QwMZbSogl5YkvsdyNOMPdJqhjnP9/3QO//qw6UHxhbFj/QzGyh5xYOt0PcYSkhXVjuOAuhlbtIUoaP7vjH27IZObtEzssTAcvNW7mWitrFKqnfNCrAUyOh1JUaIQpAxg1g8TMNzVn1TGJTU3HsC/8gjIupxitjHV96NRwGvMXJ83A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB021426.eurprd04.prod.outlook.com
 (2603:10a6:20b:78c::16) by AMDPR04MB11606.eurprd04.prod.outlook.com
 (2603:10a6:20b:71f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 10:50:55 +0000
Received: from AMBPR04MB021426.eurprd04.prod.outlook.com
 ([fe80::1cb3:7fae:cd68:6de]) by AMBPR04MB021426.eurprd04.prod.outlook.com
 ([fe80::1cb3:7fae:cd68:6de%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 10:50:55 +0000
Message-ID: <e95a4520-b12a-42d6-a7d6-e98192b89b02@oss.nxp.com>
Date: Tue, 17 Nov 2026 12:49:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] firmware: arm_scmi: clock: discover clock domains
 on first use
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org
References: <20261113-b4-scmi-clk-on-demand-v1-0-7fd162097b57@oss.nxp.com>
 <20261113-b4-scmi-clk-on-demand-v1-1-7fd162097b57@oss.nxp.com>
 <sashiko-outbox-212926@kernel.org>
Content-Language: en-GB
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <sashiko-outbox-212926@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0029.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::20) To AMBPR04MB021426.eurprd04.prod.outlook.com
 (2603:10a6:20b:78c::16)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB021426:EE_|AMDPR04MB11606:EE_
X-MS-Office365-Filtering-Correlation-Id: 08753854-f0d7-4145-0979-08df4498a7a4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|10067099003|11063799006|56012099006|4143699003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jMNP0cqKFeZifmZif5Ba/MpE6kf+2EUHtlUbXMSoAz/Sy5v/QsXK8upnN4LUHCXgRGHYsaKY4Yiu6o/v1Cqa3dbNsysP9tZ3m66L1v9knhlWyfEfhhrCfCN5ugzWlzqhHCFMuOwUNvuQaabHIVtOlciN0QhDvMQw+0c9JbJ/0ZjBMlYGK4zlaTUgu5719eN4JBehAOywy6tVIe/QiBb8CHjZJY2G8zBc83AfrffrqpzE35U8R2l3JpAhoxbFoXFeLiF3/wA5ATqzJE6C/hlTVRCz53j45HnNXuhxvEHxlWuGh6DARkmQwVzvs616TdWxeDZAXLMdtdKrqma8K261DVuB8qIwx1P5LaLIyBKitSlMWq4NCG8ee+4m74ugkh5SjeG7l+x11vsZu9rL8U4L4Nl5baBtg1R2xmQQr6mo7MSYmcD2zvpgojTio8KpZ4oFCgBd9oRQwGydxROfxPAxe18xAfdMuF2AE9aWXPfyNRwjU+4ec6lUD7BB8O4Pi8vN8yGBrATTxYyZ/Njvk7ko2BUkIMa/AOSgc4PP8ImL/FVG9bV6dmCGiQ3vBZU11WBfq9E5j3EzcqfAoVc3aSJmur6mg3IhX5n7XwVzMiu2Nq8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB021426.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWM4T2RzZXJ2UkppdXFsMWRkaVEyR0dRN1RFNzRva3ZrYi92ZUNmQ0pzNFVq?=
 =?utf-8?B?RWRHY2U5cWdxM3AxbzY4QVE4cWU0Q2l1a3Y0NkhPb2RyQjVPVjNYL2VLTTg1?=
 =?utf-8?B?THlpYkJFYUhoUVk0RFJmZ1h1N1ZKUTI3WjkrTFB3SzM0R2dUWWoyVTNlVFB0?=
 =?utf-8?B?a2Y0NVRtdXV3WXpUZmxHYVRQbGRHdGhMTnVUTnpHUCtRSkJqVS81b0ZIa0hL?=
 =?utf-8?B?K0FabXl5bVpGYmU1YWZWdEtVcTg1bjBCVWJCdUNyQnFzVWV3QmJwN3ltMktB?=
 =?utf-8?B?VE1mUnNHZTRkVkR3eWxEOW9GYVZZbkR6SU5UM0pYRUJyb2hDZFdodTc2UUcz?=
 =?utf-8?B?WmtwaHBCekpSM2orOXdJM3VJTGZIZ0NTT2ZsaVd0c3A0RFZ6bUd2eVUzcmNT?=
 =?utf-8?B?dUpkcFM4UUw0T29INkVyQ1pKeVgybWR2cWlIT2FWbGdmWmYyRzVHWjdPK2h2?=
 =?utf-8?B?dFhnUVNodGFXS1d4NGhCMThlSFdWWm8rSE9kODYwRTBabHQwOWsvUjdtdU54?=
 =?utf-8?B?MGFrLzF1eE9MdERpU3loV2JpTUFsWUhyNFlRNkJ3SDQzUUcyeEYva2ZPRlBU?=
 =?utf-8?B?ZUQ2QXpab3BiSGFNRnZvTk1aNzZFZ0NKbnhPdG1lYWlqRytYSjJkQlFMUTgr?=
 =?utf-8?B?Q0h2THkvUXhDclVWVk1ndGdETTAveVlVY2dxMnp6eklCNUppbC9hUlprODNJ?=
 =?utf-8?B?UmNnMis2VTVRTDJpaTV4ZjlpUVdDODNTZnhGQm1EeUJwN09HUGhJU2paMjhJ?=
 =?utf-8?B?ZVZnK0ZqblloMk84ekJvZForOTZ5SnVrYm9mQ0VCNUNrQnpFL2dvZDM4RW43?=
 =?utf-8?B?ZE5YdEViU1RtN0NIay9DT0ZjTDhpU0NMSFdvZ254NUtocHRNWlVwZi8wQlJt?=
 =?utf-8?B?elNoMjlraHA5b0F6eHgxc1V2YjZEWDZ3cFJkQUdQQ09XamlKd25KZWhMZGE4?=
 =?utf-8?B?WDhHaVlqUitjY3Y2aFNCV2FyOXhERy9jRU1QWFBFSTBPOVprKzFDbVZxTGpj?=
 =?utf-8?B?dFhiZE9Vd0pSRWlEZWlIL2wrdlBZRFpXM25hejdvTDZTMlpTcEtZMk1NejBq?=
 =?utf-8?B?d0ltaEcrMS9LU0ZycXBlQ2VlSnVDa0JWNHpUUCtHd0x3RVorcGh3aUM2K2Iv?=
 =?utf-8?B?NjRnRitYOW1SNUJLWllLMndwamkyT0o4OWdVelo0V0VFU2FwMW5kZUlpQW9R?=
 =?utf-8?B?M1FqK1M0S0t2eW81V2RWeEE5Z09KaEJCNnNOclNQNlhlOEJkd2ZQL3VCaTRw?=
 =?utf-8?B?MjFIREdXdENwSmJtcjFHZi80SXFkNHlWZW9DZU9mUUJjTkMrU1hKbTJvSmJI?=
 =?utf-8?B?VEVYWmZaeEJYU1BqcndZTXRreGdvUlU4QnNtZjFGNW1mcHNNSGNOaVpVQlow?=
 =?utf-8?B?MTllZzZUT3J3V0U3R0d4amFEUlVoVmtTMSt5YVZDNnZnVlpCdGpFcU9RVGNX?=
 =?utf-8?B?NWsxSjRScC9yd25QU0htRGdQWVl1MEdjbHRwaytyd0ExYmsxWjU1dkpjeE9J?=
 =?utf-8?B?bmFpeGpkaXIvZFFuZGt5cjNBdlNDVS93MnF0Rms4QzJSN3BlVHE4QW1vb2VN?=
 =?utf-8?B?WkdtYWphZXMwOVpaTUZaaXJiQXloamhjYUJUN0dzZ1ZIcVRZUHNabkYzQVpH?=
 =?utf-8?B?VW9MakxBWU1jZTZrMGdiTTZiWWhZRmxKeXVXL0dwNytPbHFDckxKbXBpd2RV?=
 =?utf-8?B?VHdIcDRBV1c0UE0xQ25ud256bW5hMnpJdWxFL3dyeU11dUhxMWZVendjQVlK?=
 =?utf-8?B?VldqRDM4QnpSZ1MxNXp2WWlXdGNYcno1S3lIL2FvN1JUMDhENWFIUUhyRENl?=
 =?utf-8?B?NHh1aFU4c1ZWbCtlY2tsZnlGM25HR0NzNHlWSW85YXQwS1lkeXZFbk5tQ1Fy?=
 =?utf-8?B?MTMvZE9nWjFaRWRxUzU4dmNheWhtWnZMTHlvZ0FxTVRDMW9RVGpjUXB5TjI1?=
 =?utf-8?B?TGVpenVIYTYvYStscXZ5T0lHU1J3elpWTERpejR6UWpMSjNGMGNzNVpuOFZl?=
 =?utf-8?B?bTNmUHc0Nkt1WWpqbHllcitLek9BQk01aHZSbHJPU3h1Z1UzSW50bEdqMWo4?=
 =?utf-8?B?ejMwYzZUNzhqYytOaWtjc3dhUDExYlUyK3hzdGE5SnVBTjVTYW0zcTJRYjIz?=
 =?utf-8?B?WEVCaXFNbDN4SEcvQlJxNkJ5SFM3cEhISVdvQnBicmRKWUdlMi95MVROS0Jo?=
 =?utf-8?B?ZE1LSG5yUys1VVhHNEVTRTRGaHNZL3ErQkkwS3VSYkFMQm54MHpWRmNUL3hr?=
 =?utf-8?B?N2Nzd3FuSGR1UXplKzBjU1FvQ21JdHRaQW9abXZPVlJ2Y0JZVWsyN1c2TXBn?=
 =?utf-8?B?Z3lIL1BSV2RMZ09odmNKV1NZQ0dLNlJ5emRmWTh4blZvKzBYNVQ0aW52SVpm?=
 =?utf-8?Q?aLK/pqWZOQ7WrfVA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08753854-f0d7-4145-0979-08df4498a7a4
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB021426.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 10:50:54.9691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efLDJUythdmu9y4syLhJNf5kSgyzZsTAgWIbL6l6DN2h0ECggSkSQ/PTKtW3vHhiHYyEMPzVWxxewct0OrSVC6eQq/E9RIr7qIKY/kNE4R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11606

On 11/13/2026 3:49 PM, sashiko-bot@kernel.org wrote:
[...]

> [Severity: Medium]
> Can this underflow r_evt->sources[src_id] in __scmi_enable_evt() when an
> all-sources clock notifier is unregistered?
> 
> Because scmi_clk_notify_supported() now returns true for every clock when
> the protocol supports the notification command,
> scmi_register_protocol_events() leaves r_evt->sources[src_id] at 0 instead
> of NOTIF_UNSUPP for clocks that do not support notifications.  When an
> event is enabled for all sources (SRC_ID_MASK), __scmi_enable_evt() gets
> -EOPNOTSUPP from scmi_clk_set_notify_enabled() for those clocks and leaves
> their refcount at 0, while still succeeding overall if at least one clock
> supports the event.  When the notifier is later unregistered, the disable
> path in __scmi_enable_evt() only skips NOTIF_UNSUPP:
> 
> drivers/firmware/arm/scmi/notify.c:__scmi_enable_evt() {
>         ...
>                         } else if (refcount_read(sid) == 0) {
>                                 ret = REVT_NOTIFY_ENABLE(r_evt, r_evt->evt->id,
>                                                          src_id);
>                                 if (!ret)
>                                         refcount_set(sid, 1);
>                         } else {
>                                 refcount_inc(sid);
>                         }
>                         retvals += !ret;
>                 }
>         } else {
>                 for (; num_sources; src_id++, num_sources--) {
>                         sid = &r_evt->sources[src_id];
>                         if (refcount_read(sid) == NOTIF_UNSUPP)
>                                 continue;
>                         if (refcount_dec_and_test(sid))
>                                 REVT_NOTIFY_DISABLE(r_evt,
>                                                     r_evt->evt->id, src_id);
>         ...
> }
> 
> Calling refcount_dec_and_test(sid) on the clocks left at 0 triggers a
> refcount underflow warning and saturates r_evt->sources[src_id], causing
> subsequent enable calls on those sources to hit the refcount_inc(sid) path
> and report success without enabling notifications.
> 
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261113-b4-scmi-clk-on-demand-v1-0-7fd162097b57@oss.nxp.com?part=1

Hello everyone,

The points raised by Sashiko are fair. However, I would prefer to align
on the overall direction first before addressing them, to avoid
investing effort in an approach we may decide not to pursue.

-- 
Regards,
Ghennadi
