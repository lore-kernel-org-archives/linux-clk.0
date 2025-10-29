Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013034.outbound.protection.outlook.com [40.107.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D93C261588
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 18:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761761870; cv=fail; b=c6tmusKYQDz3Fvz7r7fwBKJAJTyJfmZw03wi+ATdCCOlP2CRUOIghTGWpLFp2By0S7M6PyYHueZTXb3O/0MbxDD90/T1FTJRvRpQ6OTNHoFfbe65U/qOjcSjirkjkjP8jSbhoCZeTGeSZixgbwlbjMmPOuotzRxpencJXLfiWKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761761870; c=relaxed/simple;
	bh=D9IwQx1w1zlifSp2WrjZVvzBjNYBxDgUNPHLr/dHbwE=;
	h=MIME-Version:Content-Type:Date:Message-ID:Subject:From:To:CC:
	 References:In-Reply-To; b=nU+E7AJDhhNB5GfuDeVPHu/U2+pfGmJ42xEsQW6Q2S0xUDci6uNbf8zevMcafD36RLrU/xwfy2wkt5q8LpSozEs+yDoqbV2dhDc1uaUgphsxn3GbPIPepzvLF24ksdDjPCdQjaLz46PLrTvkRwbwWo4bTwm2k6cYWJ2wirPZ9kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eHYvIjwp; arc=fail smtp.client-ip=40.107.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eHYvIjwp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxkuvVooT5RoVnLQnD+1vmCv0zghF1TpT3TyfwJS/AnzzYU56Fs6wdzGL217vEbHbbncCuiPEG8a0XoX2zXpCT56Z7F4vuqCr1um4Yb+6eE3wNiuVGx1SDfifgSzuCqgGMnJ5/Gl5a8She2tAEbxo156193kk2+uUbSFhTkkrKc7b2R8dXPnH1zzGA1yp/8Ou8fw+CXYDsKcYhV6lo2PCplHmJaCfemD7ZI/czGPnKhI+vIeQ86P8kIvvQhyBZpHIA3qn6qBCJJS1g73fMog8oelCvZh+XSCoj9RR7yj6AdkAX9KEgPezFJwfrznR/ytUr0NrlpMyhbWhmRLOX27Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9IwQx1w1zlifSp2WrjZVvzBjNYBxDgUNPHLr/dHbwE=;
 b=MNo8PpAJD5JyMs90dq11Elv/6peiTd0pkc7p6hMiL5G+dYql+mSl8/ECJQEvnNZ5BuuIa+E1p3ty+ckClIaxKx2UzS8QKcVm3j0o9lHplMP7BOFSwfhtQLxSQae7nV+/aQ2bXgudm24lrBOqTTPOKrOJA5I2iIduNSWNl87B9wdklw7H4ofXD848XOhlsmOXAdUQBYzWoHjj5YCmr+/A3DkDf/YeoJlw6vU90oDRXAd5NtpiC1EjAm3OC25Q9cEIcJdTW/WF/0v9OAI/3oBKtgRzmlAv7RAwtSCrJD5rkjhSN1ih4lyql4CZnxdgN9K6E59agPTMOYVuEXlS0bn0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9IwQx1w1zlifSp2WrjZVvzBjNYBxDgUNPHLr/dHbwE=;
 b=eHYvIjwpns9eGlmtsyByFpkA32QzYj9vMLB1v0wzAAS/FZ1vutGVlBYmQ5x8N3xwJWi9Th5mwZn43+uCRsXTVMQb5MutJeTz/5G6DoDu7jS1aN7eWyHyIyWUnjtlEGsHEA81stCy6FfVviUShqaVCfX76kZOal85rTv1Lnq7psQ=
Received: from DS0PR17CA0019.namprd17.prod.outlook.com (2603:10b6:8:191::8) by
 DS4PPF5ADB4ADFC.namprd10.prod.outlook.com (2603:10b6:f:fc00::d1f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 29 Oct
 2025 18:17:36 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::bd) by DS0PR17CA0019.outlook.office365.com
 (2603:10b6:8:191::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Wed,
 29 Oct 2025 18:17:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 18:17:35 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 13:17:35 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 13:17:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 13:17:34 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TIHYtp270944;
	Wed, 29 Oct 2025 13:17:34 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 29 Oct 2025 13:17:34 -0500
Message-ID: <DDV0GF1W1NZA.3VK0XLXOZMRRY@ti.com>
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
From: Randolph Sapp <rs@ti.com>
To: Maxime Ripard <mripard@kernel.org>, Randolph Sapp <rs@ti.com>
CC: <afd@ti.com>, Michael Walle <mwalle@kernel.org>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <linux-clk@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251003222917.706646-2-rs@ti.com>
 <DDJPIJGC8W1L.1BCHJEG3FO574@kernel.org> <DDKSRCG9J0MB.3NKE0JJWUWDTD@ti.com>
 <DDOCJEZSBJ1V.WPWWUAR7M1H9@ti.com> <DDOMVXFQ82CN.FJ0FMPGMTFPN@kernel.org>
 <DDP8GWMXBBTK.317J8GMC6JDH@ti.com>
 <6oalyicklokagq4lllhxpw7ipzvlzhg645pewbkueaz4zdr4uv@msu3w66ig27z>
 <DDQ2M53W798B.2SK01V6NUG2OU@ti.com>
 <3hqmv26wfxruow6aojtvthgxcxten2potzezbodkevugwrifjv@ppkxevw3awf7>
 <DDTI5QH69F47.392V8CW35LY60@ti.com>
 <p35suwiji3bsf5ibe2s2f553ngveonyynlnharxqp6wn2jwmba@dgx2ahdlg2fs>
In-Reply-To: <p35suwiji3bsf5ibe2s2f553ngveonyynlnharxqp6wn2jwmba@dgx2ahdlg2fs>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|DS4PPF5ADB4ADFC:EE_
X-MS-Office365-Filtering-Correlation-Id: 6901bee3-faff-425c-62fd-08de17176f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGhCdTJzT2pxZC9PdERpSmFTWVBIdnY0cFpBU1F4bWNhVzR0ZjBzVU1BbnRu?=
 =?utf-8?B?ODU0SkYxTTlHUGtzNGJ2K2s0RGFwWEdZTWsxMWVnTGxyeE02aXp0SDdKT0gw?=
 =?utf-8?B?VzhzMGxBRmswR3JadFE2TDVqY2R5UUp4MW95MGVSOWFTODJnMGJWV1J1TTFV?=
 =?utf-8?B?ZkprdnNDK2hKQytwWnpTYUkrUFFHOEt4cUM0S0NBUnhYMWhTKzBIekxoWDM4?=
 =?utf-8?B?WUdSS2k0b1plM0g5Z2JVVzRNU0FwVUxpbXdjWVovQlB2ZTBacnhaRXFqcnFF?=
 =?utf-8?B?TzNHQzZyZnFpR3BsYXRLNjVxNVRlZnlCc0JLQU5Ca05IM25qMUJLcFA1WFEz?=
 =?utf-8?B?dnVFaXo3Y1VGcytVSkJZVm0vMGcrd0FwQUxxT2tUdmhWTlFuR24zTGRMRkhv?=
 =?utf-8?B?NTUzaXVLMHBFclNwSklUMGVPTWFYTTFnTS93bVZIbnhzZDJpU0VnSlBkSnNy?=
 =?utf-8?B?K2pvRXkzZG9mSEtHd0ZYYXFvMjhQRDdhL1ZYT0JHaDBUTEk2TWd4b2dNeXow?=
 =?utf-8?B?UzVON1YyYzArUWM1QmRqK3BjRmN1Nm9maEdtUGtFS3ZhZnBqSmNGSHlSL0hK?=
 =?utf-8?B?UG8rOHFvbXlLS2I1Zkltb3BXanJ4UDhwNWtST1AvNVl0cVNDdnpQVGROVGtl?=
 =?utf-8?B?Y0UweHp2Uks5UnBybnBleUtJK0I0VUZDT0MyUW9Cbi9Ma0xxYURyTE5PekIw?=
 =?utf-8?B?QVUzeDN6bXVyOStpek5DcHc1Vlg3a2tWcms1UlljSkF5QTd4M1FQRFBBNk4y?=
 =?utf-8?B?Z1h2bkdPNU9TY0k0RWFJMXRZdUN4S1A0VFptZGFMWXpyblo3YjNwYjFwNGQ0?=
 =?utf-8?B?MTVtS2Q4T1NyRHE0S1d0TVBWV0tvTGtSS1M5RnBBNVVUdFZTUWo3SDQ0bjV2?=
 =?utf-8?B?N1AxYU84YUZ5Uk9uZlhZOGVOb1hmWXVDZklRWDRGclFmbis0R3lSRi9nWllt?=
 =?utf-8?B?TkZ4empsd3VuUzBiRHpwc2xLMThCaFM5Yk4wbnFubUR3T0E1cGFFdHRtemJz?=
 =?utf-8?B?TXBTSXdwLzhnQU9QQ3JrSStML0ViSWlDaVNoUkk1UVdXRHRFczUxYnc2cjhH?=
 =?utf-8?B?T1BNY1dtL1g2cUVRelRpd0RFTEpySEJPYnZBOFd1Z3FHbEo5MWxyOXNieGNP?=
 =?utf-8?B?VnB5ZUZWcDlMZ3crM1J1VlJ1dmJndnNUR1VlOHg0RW1YR0VqMGpaZW1tQm1F?=
 =?utf-8?B?bFVocXhxWTR3YU1TNkVzQi93eGJ4UXNTdUxIdXJVbGJCbURhc210cjJmdUo4?=
 =?utf-8?B?S1pvVEc3RnVvUFBJemZTdHVBaURkcExQQTB3SXFteTZndDFqd281WjZnQ2Qz?=
 =?utf-8?B?VGJ2ZzJ0bW1LUzNuVGlGKzhRTHVrTHdCMkRYNGpFQTZFVjgvOHl2eVA2U0I2?=
 =?utf-8?B?Sk1QOWxWVFJIZFR1R3kzZURYbjhsRFcvZ3E4WGlPc3hPcVJFVkZhZ3JMcWdk?=
 =?utf-8?B?NTZ0OU9BRnRmT2kxdk1PRUdEZEcwZkhncjRjVDJhTWZhZ0JJcjNkZnBueXVw?=
 =?utf-8?B?Yi9aaGk3alppUi9uUzBtQ1BVVUxUVGovOUc0VDRhNFBYV0I0UEdIWDZvUnlp?=
 =?utf-8?B?ZVd5dW1XM05RZmNHcGhCU3B4WFYrWFNNYkpqTndNQ3VvMXJDdzc5VlFWSzFR?=
 =?utf-8?B?UUFqV1lJVitRTTZmODFERVR4QlBLTHVZM2VpaWF1bTM5N2FJZTdBTmZENllM?=
 =?utf-8?B?cEF2TkFXYkNGV3c2cEZDTVlzL1ZlV2dQZ2hYb01aZmQ5blVIc2tXZHlMcHlz?=
 =?utf-8?B?c0JKQ01oNk9qVnJsR2QvaTBjMm4vRmJsbUxjM0dsR0pkdWhxYzlRM0R5cGVl?=
 =?utf-8?B?OFFpZTB3bDhIMkJQTmtucTJBaUhiTitwOFlKdmxLVnpRdE82alR4a1JtdTR3?=
 =?utf-8?B?ZDR0aUZ3RnFPVVNhWmY1ckJnUUVIRGJVc3YvOEUxREtEYWRwZnpaRldLSUVE?=
 =?utf-8?B?WVE1SVZsR3F3RldDUUlGVGM0a0lDK1BVOURqZDlmeHlyeDIrTXBhdnNYTFNs?=
 =?utf-8?B?dnRrWkJrZmJGakJvV1dWRjI3NVJQZWpUTXpzb012VTdrWU1vOCtOUVMxM3B6?=
 =?utf-8?B?N2VKL0dIbGlLc2Jnc3AzMkVwWGF4VEhyL29hRXM0ZkF3MUZlWnVnSXBVa0xJ?=
 =?utf-8?Q?rc/Q=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 18:17:35.6652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6901bee3-faff-425c-62fd-08de17176f9e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF5ADB4ADFC

On Wed Oct 29, 2025 at 4:05 AM CDT, Maxime Ripard wrote:
> On Mon, Oct 27, 2025 at 06:44:37PM -0500, Randolph Sapp wrote:
>> On Fri Oct 24, 2025 at 6:23 AM CDT, Maxime Ripard wrote:
>> > On Thu, Oct 23, 2025 at 05:55:45PM -0500, Randolph Sapp wrote:
>> >> On Thu Oct 23, 2025 at 3:36 AM CDT, Maxime Ripard wrote:
>> >> > On Wed, Oct 22, 2025 at 06:18:22PM -0500, Randolph Sapp wrote:
>> >> >> On Wed Oct 22, 2025 at 1:23 AM CDT, Michael Walle wrote:
>> >> >> > Hi,
>> >> >> >
>> >> >> >>> Am I correct in my assumption about running clk_get_rate on un=
prepared clocks
>> >> >> >>> though? (That it shouldn't be allowed or, if it is, that the r=
esult shouldn't be
>> >> >> >>> cached.)
>> >> >> >>>
>> >> >> >> Any follow up to this Michael? I wanted to be sure this was som=
ething the
>> >> >> >> subsystem should allow before I look into further workarounds.
>> >> >> >
>> >> >> > I don't know. I'm not that familar with the ccs. My first reacti=
on
>> >> >> > was that it's asymmetrical that a .set is allowed (and works for
>> >> >> > tisci) and that .get is not allowed. That way you can't read the
>> >> >> > hardware clock (or think of a fixed clock, where you want to get=
 the
>> >> >> > frequency) before enabling it. I could imagine some devices whic=
h
>> >> >> > needs to be configured first, before you might turn the clock on=
.
>> >> >> >
>> >> >> > OTOH Maxime pointed out the comment in the kdoc of clk_get_rate(=
)
>> >> >> > which clearly states that it's only valid if the clock is on.
>> >> >> >
>> >> >> > -michael
>> >> >>=20
>> >> >> Yeah, I still don't like the way we handle clock in firmware but I=
've already
>> >> >> been shut down on that front.
>> >> >>=20
>> >> >> Regardless, there are quite a few drivers right now that use clk_g=
et_rate prior
>> >> >> to preparing the clock. If the kdoc reports clk_get_rate is only v=
alid if the
>> >> >> clock is enabled, should we report a proper warning when this occu=
rs?
>> >> >
>> >> > It's more complicated than that.
>> >> >
>> >> > The clock API documentation mentions that, and the CCF is one
>> >> > implementation of that API. It's now the dominant implementation, b=
ut
>> >> > the CCF itself never mentioned or required it.
>> >> >
>> >> > And thus drivers started to rely on the CCF behaviour.
>> >> >
>> >> > Plus, leaving the documentation part aside, being able to call
>> >> > clk_get_rate when the clock is disabled has value.
>> >> >
>> >> > How can you setup a clock before enabling it to avoid any frequency
>> >> > change while the device operates otherwise?
>> >>=20
>> >> Why would enabling a clock change it's rate unless the current rate w=
asn't
>> >> actually valid?
>> >
>> > That's not what I said, and it's also not something that enable is
>> > allowed to do anyway.
>> >
>> > Consider this: the clock feeding a hardware component is out of its
>> > operating range. You enable it. The device gets stuck. How do you
>> > recover from that?
>> >
>> >> I can only see a change explicitly occurring if the clock parent has
>> >> decided that the associated rate was not acceptable.
>> >>=20
>> >> If some device always resets the rate when enabled, isn't that alread=
y
>> >> problematic?
>> >
>> > Resets the rate to what?
>>=20
>> Doesn't matter. The initial comment was about the rate changing when the=
 clock
>> was enabled. I said reset here because any change on power on would assu=
me some
>> default state it was returning to.
>>=20
>> >> > Or how do you make sure the clock is in its operating range and thu=
s the
>> >> > device *can* operate?
>> >>=20
>> >> Well, if enabling a clock doesn't change it's rate there's nothing st=
opping
>> >> people from enabling the clock prior to getting the rate.
>> >
>> > The first thing clk_set_rate is doing is a clk_get_rate. If you want t=
o
>> > actually enforce a rule that hasn't been applied for 15y, go ahead, bu=
t
>> > that means also mandating that you can only make clk_set_rate calls on=
ce
>> > the clock has been enabled.
>>=20
>> The clk_set_rate only runs clk_get_rate to see if any change needs to oc=
cur. If
>> the clock isn't enabled then this is likely part of startup or resume. T=
he
>> likelihood of needing to change the rate in this scenario would be high =
anyway.
>>=20
>> >> > There's a reason people have started using it. And it might be
>> >> > abstracted away by the firmware in some cases, but not all platform=
s use
>> >> > a firmware, so you can't rely on that either.
>> >>
>> >> Thanks for taking the time to talk with me about this. I assume there=
 is some
>> >> specific thing that violates my understanding of how this should work=
, but I
>> >> feel like things are too loosely defined as is.
>> >
>> > I mean, I kind of agree, but also, the clock framework is newer and ha=
s
>> > been more liberal than the clock API. And the clock framework is by fa=
r
>> > the dominant implementation now, so I'm not sure what the big deal is.
>>
>> There's no big deal, I was curious if there was a consensus around clock
>> initialization that could push this fix in a different direction.
>>=20
>> Considering there doesn't seem to be any consensus I'm fine with moving =
forward
>> with the initial cached rate workaround. I just need to rework it a bit =
to cover
>> the initial corner case outlined.
>
> Don't get me wrong, I would like some clarification as well, but I guess
> what I was trying to say is that clk_get_rate is such a mess when it
> comes to what it's allowed to return or not already than trying to clean
> up when it's allowed to be called is going to be a nightmare and you'll
> break tons of platforms in the process.
>
> Last time I tried, I ended up in a philosophical discussion with another
> platform maintainer that went nowhere, and we ended up reverting the
> patches.
>
> So unless you get a maintainer that steps in and say what needs to be
> done, and enforces it, my advice is you should workaround the issue.
>
> Maxime

That was my conclusion as well. If we purposefully aren't enforcing some
*suggestions* of the common clock framework and our clocks don't play by th=
e
current rules then we need to reevaluate.

Kicked all involved parties on our end again. We'll see what the consensus =
is. I
have a feeling we're going to have to implement some horribly hacky selecti=
ve
caching solution to make everyone happy. I say horribly hacky because it wi=
ll
still have requirements about the ordering of particular calls that will ne=
ed to
be manually enforced in all corresponding drivers.

Well, this will be fun.

- Randolph
