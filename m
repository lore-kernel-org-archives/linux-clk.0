Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15302BE02C;
	Wed, 22 Jul 2026 12:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725175; cv=fail; b=aT4wpAB3cIWG3BccR14RrnYLB6SXutqV/d2i1wqlLk2BvaeF9EwcZ+8uCsRHV2DwgQ9Q8V7ETXXvCHnZmq+iYr10xWO24OS3uEzUUF2Ie1rebaFrgxPT2BrGtKqWfNbOoWIPGXEn5/yDW5pZlBF2Ma957rxMq4aQS3eXb1dQ9PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725175; c=relaxed/simple;
	bh=d6LDwvEpcSeO3zSco6PGoRCeFsjzn2lz+xBiwNuN7qQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FQjk5HC7r8x33dN/mzF22j5fXEl+DrPp3OCjLMUkQLn3xHR7EpEEtru4Za9QvfMPu9dWJnczMft4HUspMnk9MjdpLFHtwllN5qBRUeSORPjCV3AFSZUdmUt+QUZAh2oNwXmuTI1CdW+7vaH7LPKVpGOLNN0wAqmyO+gzwEaXYdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=dtEIa6Ws; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="dtEIa6Ws"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hu+du12PJzolLi8Cw0sZyFvItl6Rjla0TYDBgG0BvVtdqoFgNqIGt4irPA/ZW45cQABbt+2WhxEQQayHnUVysUI3Tyd3KXKs7+PRFVh+x85EYGOjyY7Ef4S1PQqWwcBBpL24C6ZMTBqC4zgSvhJdEI9XpB0jwHK17E46VM9NA99Ud/prPsP7pRQhoe6cWWBIhwEqLadqUOb21ouIpzVI0R8Yv9+0kP7FKLkluzxa6Eu4LBXEwf+yDMFSLBy3dNmabYJ1FuRR4cNE/dNi1cmxLkPFYW//ashgQqJyujdQTi2YUVxkzmlwfz8AHoOwgfIWYNV5NrCYTAm8J9p65kwbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1L26/j4Tz7Yco35XmugNjzMA8mzUylqW1JF6GCdt9E=;
 b=g8P0492vW6f6+vPwj09XgaBTqcGo3/+Ym0HQ/zDVyuMl+dJZ+HTiHXTcpk/WPrKvMtg+xBxL5/E6LNVQaa4xaCpsG5CY1TIs72RJRKmcHiUIklrorrfP5VwJCPhYiBMFTpC2gRaJp/gvQInaoKRBMa43hux63eC47+jYGg08VClptf4vz1Gf53bJ5MFdUXJ7oc9/WnYgYoVVV5uNQ/qC48N+GfTcR2Q9ortFPRrjxYM8H6mvkoqI26jgMyrtowaAUM3yy+UoI15i+yfFsE+Lx+DiYbpAXc1i/+/ud5zaH77BKw45Qj4pIQjg4PPJerVPwjX33wVGqtItueOwkERW8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1L26/j4Tz7Yco35XmugNjzMA8mzUylqW1JF6GCdt9E=;
 b=dtEIa6WsidQwNvCIdyR5ROjPSMdHXeS96695gL9jqIs2kbvpK8n60+127S9Ca35DlNPl+Q0a+i7i0YFsz6wmzMgdjQxbRJkP5pXn9Ga2zP43HX36o+K3C5ORMJNf5MdLC44YlTrHPLLDsy08U3l/heO17ZLHERto4IfXQA+26qw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by AMDPR04MB11553.eurprd04.prod.outlook.com (2603:10a6:20b:719::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 12:59:27 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 12:59:26 +0000
Message-ID: <b0111164-3726-4a1b-bc3a-0e678ea2ecad@cherry.de>
Date: Wed, 22 Jul 2026 14:59:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: rockchip: Fractional PLL coefficient on
 RK3588/RK3576 is two's complement
To: Alexey Charkov <alchark@flipper.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Wyon Bi <bivvy.bi@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net>
 <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de>
 <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::8) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|AMDPR04MB11553:EE_
X-MS-Office365-Filtering-Correlation-Id: 45dd758e-a0a6-4a1d-d026-08dee7f10f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|22082099003|18002099003|11063799006|3023799007|4133799003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	hZs7bpwA2GF7B+Rn72Q84iR3W5FvMe9FPyJAOCGUqMlfSewSb0qfHj5Oxj+l2qBqRdYh5/rwB1OYbjW/YiVuCo7GiKlsYhyNyFqFEhf7NHWeS7vAvaRxKVY7nvn+KtMUXEX+zOw1KO58gcVOUx5CUJoJJbPJ13kphGmoUnv0+x4yxyy0VVLge7SBQl8P0D+Yll8/3Yedgay7pLVUPe/GYU7ZT1FujAeMYX0GYvFDqTeVBDe0VZ/NWPXuHjqygxPJ0NocOve2xBfSW2JUNxOp5r0pnj08PhkxNiSBDnojroKmrLz226UUB543qx+GjS8gfAOhOu+QWomSs+j/RzZ7qXGAY7AqYXoaQiSZjzoE7jPL8PgoJxI6ewTKhmscQIp0FrCMoMu5dx+kkU3s2xwqYtIclHToun094HvwqBlqjjJdAZ8YFSWiA+B/H8eTatTBr2/1Mar/npu9o7DIBUTB0LrQPPq3/a9m3dipISTrPeuc5PLGJ7ZuOPI8KAqKOPS/VR4MCJUUI/OaAsT9nvEdprHUFBKG9bMHIuNpGFtcg5/9bxUTWJ+J81vxypUVNb9y/f4O6KvbtptiaM+qrrIdg7evwKyA8yj7ttQE0tqJQTqWfKT6AxSglMzkYxjGdayp8YDrriUvZQ8pTDCzPuP7d8C5OBuKx7SgSoOPh8tlpNs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(3023799007)(4133799003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHJsUFplZlFZTkVtSll3bXBBR3JxbEpFN0lBS1pXYm5uNnplYlNDYjd6U0Vq?=
 =?utf-8?B?ajBHRy9SbElKdjhNeTY5eEpYNlRlMCtMQ2hkQitWbEFhcUYwNWlobXgwN3Fw?=
 =?utf-8?B?RDZFd2NZTXVwOG5YdFY3Q1hpczdRTDJkcTdRZGRVMHdna1Q4Vjd0b1plelpI?=
 =?utf-8?B?eTJMNm1EcFBkbE1rN2lUUG9RVWRPMFFmY0tBRHpFVWNrN1grWWdJamVqYkZv?=
 =?utf-8?B?Rm5WUDNVZDYvNWxkT0lmZ0d3c2xyU0gwY00xaE5uTW54YzhyYzgwUUdiRHdB?=
 =?utf-8?B?aWErTEdKSFhoVlFkNklrSE5qd3JiemozcVE1ZzlZWXlkV0FUYVBTMG1Zd0Jv?=
 =?utf-8?B?WEQ2VjNhV21oYm96TmNWYzBlMlNzaW04MGtENHBYSC85V2FhSzVPWGFMYVFm?=
 =?utf-8?B?YklCQVNmMDlBaDV6ODNPa3dsNHNYTndVNW9rZUxYcWc1d2psUXA3VHBNWDFF?=
 =?utf-8?B?RjBoSVE3MEpSazUvY0R1c3lNRU9LSUx4dXRDZ3VMTVVXWE14OWttNXdJUFlp?=
 =?utf-8?B?TmNUZjZ5aXdKTHpWQWdRblJCdWZXYXAyUis2NElLVk81K0xBd0gxNkp4eTcy?=
 =?utf-8?B?aHZLamVIcVp2WUNsNjdwd3J6WTdnbE5jSEd2NUpUZkZ0R1FxenZJZFh6d1lL?=
 =?utf-8?B?bXVCM0ZhV29HdWRCOXhGdVZnR0dlMUxuVThRZy9TcFlkQUVJcENyL2F1L3o5?=
 =?utf-8?B?VmtDcDVDRTloc0c2emxMVXI2QkdVbE5Kb2Zrd0U3c3BCQURVMFlQQVBCZWNX?=
 =?utf-8?B?SFBYQmkxTndLMDdnVktQdlhORFJZRnZXcWNaZkd0UkRlMytiZkZXWEhMcjkz?=
 =?utf-8?B?czF0Sit4eTVtdWc0Njh1aFJMdm9qTjFwbmRMUzR6RDVaclF3MC9QaWZybm1t?=
 =?utf-8?B?OGhMRFU1MDZoTjhHVGt5M0NVOEdENXYyL1g4VTl5T3NaSzlqeVRCV2lLSHk2?=
 =?utf-8?B?cjdQNmRCU0VZT3NJSlBpU2hrZFM4eXBsZGRad0k1a3E3K09VK1RzTGRaV1NH?=
 =?utf-8?B?QkJvT2NxVWRsN2VQeXh6dXU2cUpzUWw2ZHlDcDJGTytBaEV6TkxFNFZVTmpz?=
 =?utf-8?B?dUtFQUFIN2pLREg4QTNUNFNCdjlYT25WT2dWSG5Tc2hLL0pRMitabzFnM0RC?=
 =?utf-8?B?a3h6NU1kQzNJRGdvcUkyYlNxVEpYUmF4bE1ERCtFTHdpVnZSQkJrYXQ5RlEy?=
 =?utf-8?B?QnZOSEtFSG9CYXZHbVNsM0laSlpOT3JjRHIrdkQzbnUrZStPc2hLeHVXZ3hm?=
 =?utf-8?B?U0FNTDlyOUNJanUwU0hoV2w4Ukh0RGhneC95SDlzWlRodUdjakd4K3B3NmU5?=
 =?utf-8?B?Q1FlbHNrM3luNVJBWmdKd0ZwV1o4MnpBMU80ank1U1RBR2VRbVpqdXF1WUFx?=
 =?utf-8?B?M1RhODVQZWIwWGsxaUtkWXp1clcyZHJyR2d4d2Vac2Urd1NKem41bCtKNlp0?=
 =?utf-8?B?UFgzZFNXK3ZkRVRJQVZKRS9kZDNwa1NSUFZ1TUpna1Bud3hpVkkreW01Tmxz?=
 =?utf-8?B?ZFNNL3NBd0llamNLMDFHRlRMejJ4K3dlUUdaaVRrMXpGT2h0N3YvVTVoWUJy?=
 =?utf-8?B?NjE2K1hNelVZZ3dVSytRVENRU25TV2N1SE1UMlpaL3MvQ0F4eHdGbnl3WGdN?=
 =?utf-8?B?Nm52ak01ZHVJaFAvcTdQQmNzRU54bGNBY05ENGVjMmxuZ3NDTklpSWFHQTN1?=
 =?utf-8?B?Y0h2MmZKN3BPSkdveFQ3Q1U1T3VuS2s5d2twK0wyTmVxRFhuVTJLbVI1R0Za?=
 =?utf-8?B?YzlRWkNZR3NBNitIdEpkS2t0d01ISkVsUHJOS3RJY0F1OHBVN0V5RUt3aHBN?=
 =?utf-8?B?eXdsQng4aC90ME9MM2xDY0pQVDhVUUNLZXhqamJlNHAyVU5MYjRNaWtzbDN4?=
 =?utf-8?B?OVVUOVFsYWVVTlI5azBsVW8vcVM4c3VoZVgyQzNwK000Z3dEOExobGU2R3pE?=
 =?utf-8?B?d1lCWUVJb3VxNUFiTUd3ZmxNWnVwWXUxVUhFZmdMREc3OUVLVEp6b2lnaXpu?=
 =?utf-8?B?Q0Q0d0ZXelFBR3dhVngwSWRqNFRoNUJMRXNRRTI0ek5abVVRYVE1bGRJL0Zn?=
 =?utf-8?B?TGtjMThZZFdaQWZDTEZONGJjQVExZzRNYzAvT2xEdkd3dFFEeit0bTJSLzVH?=
 =?utf-8?B?MEtuaENTZ1FKejVYM080VDJ0NGoxOGpZT2haWGRhVDZJY3V2VWprM0V4UzVk?=
 =?utf-8?B?QnFUQjhSZWhURksvUHV1Mnd3V0Q5VFNaTTI1VG1XSXppKy9KTmp0N2NPNzB6?=
 =?utf-8?B?cDlhVTAzQno5S3dYZVB1NDlMbXh2eUFiOEE3OEI3dHdDQlVIVnhBcDFsSldv?=
 =?utf-8?B?VERVV2NoZk16WmYxc2xyb0I1V0pVVzVsN0VtUWU3cEM2MTVHbDFSQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 45dd758e-a0a6-4a1d-d026-08dee7f10f70
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 12:59:26.6870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPBWcxdO8LUJ/+vCJJACnEAFovYqEV5LPt+knMeAMKgi2uhWWcHHqiMfiGli1YnnH+tLJA43vSNI2Aw33He/UJy0ncv9orhxza7psa4WQpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11553

On 7/22/26 1:00 PM, Alexey Charkov wrote:
> Hi Quentin,
> 
> On Wed, Jul 22, 2026 at 2:35 PM Quentin Schulz <quentin.schulz@cherry.de> wrote:
>>
>> Hi Alexey,
>>
>> On 7/21/26 9:17 PM, Alexey Charkov wrote:
>>> When the PLL rates table was first committed for RK3588 (and later reused
>>> for RK3576), the fractional PLL coefficient was defined as an unsigned
>>> value, while the TRM clearly states that it is a two's complement 16-bit
>>> value.
>>>
>>> Rockchip's downstream kernel later revised the fractional PLL code [1] to
>>> account for the two's complement nature of the coefficient, but that
>>> change wasn't upstreamed.
>>>
>>> Change the PLL table definition to use two's complement for the
>>> fractional coefficient and update its users accordingly.
>>>
>>> Note that a negative fractional coefficient is meant to be subtracted from
>>> the next larger integer multiplier, so the _m values in the table are
>>> also adjusted accordingly for the two negative-k entries.
>>>
>>> While at it, fix the denominator of the fractional PLL calculation to use
>>> 65536 instead of 65535, as per the TRM (RK3576 TRM Part 1 V1.2, Section
>>> 2.13.1.4 Setting Guide on P, M, S, and K):
>>>
>>> Fout = ((m + k/65536) * Fin) / (p * 2^s)
>>>
>>> Link: https://github.com/flipperdevices/rockchip-linux/commit/7a72bc05dcc3a51e85ae531749e6270bf9b9212d [1]
>>> Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3588")
>>> Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3576")
>>> Signed-off-by: Alexey Charkov <alchark@flipper.net>
>>> ---
>>> Not adding Cc stable, because while this fixes a real bug it's not a
>>> regression, as the issue was introduced in the same commit that added the
>>> RK3576/RK3588 support.
>>>
>>
>> I don't think this is a valid reason :)
> 
> I believe Linus frowns upon changes like "it never worked, but we've
> fixed it now" being submitted as fixes. It's been broken for years,
> and since nobody complained yet, going via the normal development path
> (i.e. -next) seems perfectly fine to me.
> 

My bet is because of the Fixes: it'll get backported anyway even if you 
don't put Cc: stable. In any case, I don't care too much :)

>> In any case, this patch is doing too many things at once. I see the
>> following things that would warrant individual patches:
>>
>> 1) fix the wrong denominator, stable candidate IMO,
> 
> I could split this one out, but since it's a trivial one-liner, I'd
> like to hear what Heiko prefers.
> 
>> 2) fix the table (using unsigned int still), to match what Rockchip did
>> in their downstream fork (maybe check they did maths properly first :) )
>> stable candidate IMO, except if they are related to 1) in which case
>> squash with 1),
> 
> Not related to 1), but directly related to 3). The old table was
> calculated using a flawed logic as if the k is unsigned and purely
> additive (and thus k > 32767 stayed at the lower value of m), while in
> reality the hardware subtracts negative k from m (thus k < 0 should
> come with m++).
> 

Yeah ok, I missed that we aren't using the signed decimal value in 
rockchip_rk3588_pll_recalc_rate() and thus k > 32767 really is used as a 
positive k, instead of the signed value (thus negative).

> This is confirmed by manual recalculation of effective PLL rates under
> both approaches:
> - If k is treated as unsigned and purely additive (valid logic, but
> doesn't match the hardware) the effective rate lands within 40 Hz of
> the target for the affected table entries

Valid logic, but the hardware won't actually do that at all and be 
completely off (as it'll subtract for anything above 32767, as the s16 
MSB will be 1).

> - If k is treated as signed and subtracted from the next higher m
> (similarly valid logic, matches what the TRM says and also what the
> updated vendor kernel does) the effective rate lands within 40 Hz of
> the target for the updated table entries
> - If the parameters are mixed and matched, there is a 2 MHz delta
> (five orders of magnitude difference)
> 
> So I don't believe that splitting the table updates across commits is helpful.
> 

I agree, because it currently is sound logic but result in broken 
hardware. I honestly understood the commit log as "the register is s16, 
so I'll just switch the kernel driver to use that to better match the 
hardware" (i.e., a cosmetic change). Maybe really highlight that the 
current approach resulted in completely wrong clock rates (as k cannot 
be > 32767).

>> 3) switch to signed integers wherever applicable, not stable candidate
>> IMO (but eventually may be backported to facilitate backports of future
>> fixes),
> 
> See above.
> 

Agreed. A reworded commit log would be nice to highlight they are indeed 
related.

>>> Note that there is a separate unrelated issue with the rate table, namely
>>> the 2256000000 Hz entry currently leads to a VCO frequency of 4512 MHz,
>>> which is just above the TRM-stated maximum of 4500 MHz. Also multiple
>>> entries in the table end up with Fvco < 3 GHz, which according to the
>>> TRM leads to a PLL period jitter of +-2% vs. the +-1% for Fvco > 3 GHz.
>>> To be revisited separately.
>>> ---
>>>    drivers/clk/rockchip/clk-pll.c    | 8 ++++----
>>>    drivers/clk/rockchip/clk-rk3576.c | 4 ++--
>>>    drivers/clk/rockchip/clk-rk3588.c | 4 ++--
>>>    drivers/clk/rockchip/clk.h        | 8 ++++----
>>>    4 files changed, 12 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
>>> index 6b853800cb6b..f445b01aabd0 100644
>>> --- a/drivers/clk/rockchip/clk-pll.c
>>> +++ b/drivers/clk/rockchip/clk-pll.c
>>> @@ -13,6 +13,7 @@
>>>    #include <linux/delay.h>
>>>    #include <linux/clk-provider.h>
>>>    #include <linux/iopoll.h>
>>> +#include <linux/math64.h>
>>>    #include <linux/regmap.h>
>>>    #include <linux/clk.h>
>>>    #include "clk.h"
>>> @@ -913,11 +914,10 @@ static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned
>>>
>>>        if (cur.k) {
>>>                /* fractional mode */
>>> -             u64 frac_rate64 = prate * cur.k;
>>> +             s64 frac_rate64 = (s64)prate * cur.k;
>>>
>>> -             postdiv = cur.p * 65535;
>>> -             do_div(frac_rate64, postdiv);
>>> -             rate64 += frac_rate64;
>>> +             postdiv = cur.p * 65536;
>>> +             rate64 += div_s64(frac_rate64, postdiv);
>>>        }
>>>        rate64 = rate64 >> cur.s;
>>>
>>> diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
>>> index 2557358e0b9d..63f229e73a45 100644
>>> --- a/drivers/clk/rockchip/clk-rk3576.c
>>> +++ b/drivers/clk/rockchip/clk-rk3576.c
>>> @@ -79,13 +79,13 @@ static struct rockchip_pll_rate_table rk3576_pll_rates[] = {
>>>        RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
>>>        RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
>>>        RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
>>> -     RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
>>> +     RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
>>>        RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
>>>        RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
>>>        RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
>>>        RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
>>>        RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
>>> -     RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
>>> +     RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
>>>        RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
>>>        RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
>>>        RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
>>
>> For some reason Rockchip didn't fix this for RK3576 in their vendor
>> kernel, so it's still using the value from RK3588 from before the commit
>> you pointed at.
> 
> Looks like an oversight on their end.
> 
>>> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
>>> index 75d42fea2a11..24baa0ef9bf3 100644
>>> --- a/drivers/clk/rockchip/clk-rk3588.c
>>> +++ b/drivers/clk/rockchip/clk-rk3588.c
>>> @@ -79,14 +79,14 @@ static struct rockchip_pll_rate_table rk3588_pll_rates[] = {
>>>        RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
>>>        RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
>>>        RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
>>> -     RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
>>> +     RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
>>>        RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
>>>        RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
>>>        RK3588_PLL_RATE(850000000, 3, 425, 2, 0),
>>>        RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
>>>        RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
>>>        RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
>>> -     RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
>>> +     RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
>>
>> Are you sure this is proper? Rockchip changed 51117 to 51119 (so -14419
>> to -14417) and 49806 to 49807 (so -15730 to -15729) in the commit you
>> linked.
> 
> This change of theirs is not explained in the commit and is not
> related to the code changes they are introducing, so I'm reluctant to
> blindly copy it. I also suspect that reducing the magnitude of the
> negative k will result in overshooting the requested rate (but haven't
> checked).
> 
> -15730 results in a -41.504 Hz delta vs. requested
> -14419 results in a -32.959 Hz delta vs. requested
> 
> So yes, this is proper.
> 

Please specify this in the commit log, since you point at Rockchip's 
vendor kernel and don't actually implement two's complement with the 
same values in the table.

>>>        RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
>>>        RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
>>>        RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
>>
>> In the commit you provided, they also change this line (though they
>> don't change k, so unsure why (if) that is related). Wondering if this
>> isn't related to the denominator fix they also have done in the same commit?
> 
> It's unrelated and unexplained, so I decided not to change it until a
> valid rationale is discovered. Their kernel never used 65535 in the
> denominator, FWIW.
> 

It actually did use 65535 for some part, c.f. line 1601 (- column in the 
diff):

n = div64_u64((uint64_t)ppm * 65535 * fbdiv, 100000);

but that is guarded by CONFIG_ROCKCHIP_CLK_COMPENSATION which isn't 
enabled except for rv1126_defconfig, so I guess we don't care here indeed :)

Looks good to me!

Cheers,
Quentin
