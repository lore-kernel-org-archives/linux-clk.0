Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013046.outbound.protection.outlook.com [40.93.201.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8253254AA;
	Tue, 17 Feb 2026 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771323815; cv=fail; b=gF2dVCNx6jzVFJ7pPMLbsPu2qWHF1RVPeIvgfQ4v6HUO5x00/NE+DO51zngM8SWi62yE8ibVaZnBWwrNfcooWe9c/SGnrm9Ui1qtdvhCOCHqGEAZ4py4FFKXklawBeiU31WpLCTva4nPd9FR/Vzs/7JxnwHhbtYlKsQEAfL4uAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771323815; c=relaxed/simple;
	bh=ruNIvyHPBIftD7Li2dh217EkH/9CAC3EUtMmJ3U5Zao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfMl2cQV2powQK9goCQ1TUYNaK2/iwHJObl0crQUyyidk1bezw6jFJ4qOXHbUH3zfodpQVUspMxLfZK1HV3ofE5sxSMM1/TW0uJ8/4sfFPMuDCfMT4vbuQeIaW/iyRMxCifWxL5jxQWs7v1NfLV/ZxTPVQkKOI0KSaTuxnwH6Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=IyY6NGIR; arc=fail smtp.client-ip=40.93.201.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="IyY6NGIR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAB95bj79irDnNmSnykutC4G1v6xvlZNkKW2VLAKUR8MAm/mmx2jWB1jP+sEmXetbyEYEX8AU0rItD8dI+71imgPsecjqzKx0oxDnBuIVtITgfwKf3dnZGPJkGbH1JRT02cTHIePlsk0cPLgmBZJA7AoLHQ+ET1EbMaeb5wwBQJCDiPn8Mr/tSJiQUgW10rQ8YqHoSVxU6Ct6lSbalYu+k52uj/S1BS3PQ9c1/qzBay4MgEX5zo+UK30EPKoWzmMnKUxJnXrftb0DltTdrBT2lQw731/15coNFNmgl7bYSfW/FF49xfHi0AtMfdZONOa1O+xE5AbYEwzYGbxbYTQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8i6+u/bpWa+b2K8kEUTWbYqKM2qsbXNNKPoTsSjMNs=;
 b=M2Ib551bSrNcaSBOV6VvD/OekPTGsq883rnsGXUKMzbH64px0bcSd7N1B1CVU4MxVXCta808ZgE8A6vtewNHyk15fbSprJNyfuq0LaZNUcteh4aQN4tM3TmGu+3BEovXL9SwRG67SQ6IpsH0vQOWT7zTSZQTWtVaqWeapu97ATODPCNksZtejJvOv9LAEmij5cBO44CW0Di8+u5ubT8gGY8wcitPE9ocYgl4pypN2oG0qKT2ZHWs/tvfwJTuHTWnGkBdxTTxT5Qaa9iWzJtTift/lW9NDO0bnVxmf0p00yWqzgPY0TwCF//9q+8azta4x6KvKkZWzv4cfsbRC6/GDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8i6+u/bpWa+b2K8kEUTWbYqKM2qsbXNNKPoTsSjMNs=;
 b=IyY6NGIRy6pUPJPKi21lyozsMmR4j2eBq8+WqOlUNZbQ/j1fWLquJYQmflTm3XW4rQHBZajSj4gXpr6bh0VwYA79yJUY/6JqfkPUCJTUMPDXXxwj300Ahe0z2k7hM01HGUHzc9oQ3LbuSyxNvUMoLhfCpz1+pSml8yRph9VxyuZbkHJUnVBAWbQYxkzSS7rTpRhDIksx0tgKtdLDsGP6HKs4HJpBFWLX15oDmtl4854CfDvDYDQE0HbhLqEafwr06L0qR785/GwbbZmCyGrW8REXLkD9w9H9zYbvPAYbH/4SVJRO9Z0UvSygE5UafmGD8guP80CRcdTqyLmM8EKyng==
Received: from SJ0PR05CA0015.namprd05.prod.outlook.com (2603:10b6:a03:33b::20)
 by LV8PR22MB4710.namprd22.prod.outlook.com (2603:10b6:408:1ca::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 10:23:29 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::3e) by SJ0PR05CA0015.outlook.office365.com
 (2603:10b6:a03:33b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 10:23:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 10:23:28 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 5FF92E8F41;
	Tue, 17 Feb 2026 12:23:25 +0200 (EET)
Date: Tue, 17 Feb 2026 12:23:24 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: pll14xx: Add 756 MHz entry for PLL1443x
Message-ID: <aZRBnD2KOP4PYP16@zeus>
References: <20260217094152.19958-1-ian.ray@gehealthcare.com>
 <rvz22m6k4g62gopbghfssyuwz43raxzoxeohfn7hpvbou3htoi@de2ajdoeybm5>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rvz22m6k4g62gopbghfssyuwz43raxzoxeohfn7hpvbou3htoi@de2ajdoeybm5>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|LV8PR22MB4710:EE_
X-MS-Office365-Filtering-Correlation-Id: d19fdb41-6486-4ec8-8153-08de6e0e97f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2hqRGIxWkx6WHZqRDF1bTBveEQwUnJScUJQdGl4cU83R2VGS0gwRWVQUVVC?=
 =?utf-8?B?NlVFUE5QY3BaejBuRmlZaEoyQXhSK3BtV0d6VGVQaEVTQTVyYXpWaHllcnYr?=
 =?utf-8?B?a1llNG1MZFpLVk9Ic29pSSswekNYUlk5SGFWandpcTZhR3BNWFN4UVdpRmho?=
 =?utf-8?B?WHRiYkw5OFFCVXhITnpQT3JNZi9LWDNsN01nQStnYW1aQmJvSFlzekUvMWZD?=
 =?utf-8?B?MlV0OFprVC8vYkl0MEZVcU5DcVRDT3hhbmRvdXBXWEp2SmV3K29EVkkrYTFj?=
 =?utf-8?B?aEs3YmNuM2E3MjNibjJNNXgxN3pRZWlKNE1xRUZwb0ZHbDdlMnMvSS9zeFRw?=
 =?utf-8?B?UWcvYm5GVVVYRyt3alF3c2Q1OWIwZHphY1NPODZtNXNkeXdGYU94alFPaVpw?=
 =?utf-8?B?Y1hqeXArOGtLcURleGowZDB1RkV3dEMzbS81dkZYSEhwZU9pUDVVS09WdVBN?=
 =?utf-8?B?MVNUMDBLc2ptdXJBVW9HT3Vac1FJdEdhOXRXTW16R0JIRm5sK0Qzc1hxcHBR?=
 =?utf-8?B?aGJSZUU4L29ndkNWallRbVFnM0IvQUJNcFFBSExMRHViRDU0b1NJWTV2ODRF?=
 =?utf-8?B?Yk5IbFlMbUFrQ1J6dGcva0pDNEJwakFsVnMvdERZYXBZcTVuVlA5SUwveGZn?=
 =?utf-8?B?ZkVTUmFETjNUV2o1aThQL0d4bnAwQ0RqVjU3ZXI1SUFuSWowdmMrK3hwRFlo?=
 =?utf-8?B?a3REQlFFaE04ei9jdnViS2pDUEJ2dnhiM1RmY1Q1clFGTnZxM3NCaVlPd3R4?=
 =?utf-8?B?MWZQZXBzSWNYOThONjZiVTRwTHpZUVVWTDNnWnIzYStMRkprcE5uRW5PUVNS?=
 =?utf-8?B?amgvdThJRzArUjVMM3E1bmxac3pJRDhIektBVi93a0QwWlA2YVQ0ZFBSenJ0?=
 =?utf-8?B?c05LS2ZJRGlJeFZKZzVPOXpORjhjM2JlVlhNVWN6Tm4yYW9maU5ORkx1QU9M?=
 =?utf-8?B?QjRlakQ5UDlyQ0tSMEZMMWJneTJtY1BCL1VUS3F2RS9ZeXFzSmlSUEhVaG5F?=
 =?utf-8?B?Nmp5YUxqdUJLckJmSUpWeFZJNnpiZHhCcWJ3azFTMHRyWnl1a0ZUQkN0TmhK?=
 =?utf-8?B?L1ZnajhjdVZYNFpJRWRwQ05OMmhuNEJ2ZVFTM215NmduSDE4bkp6WXpxeGlI?=
 =?utf-8?B?TWtPTkRiZlFyMjdOOU1FU3pUZ3ZCcVkxWE9tNkEyVWdHbVVwTzBJRjhCV2dF?=
 =?utf-8?B?VE5xYkVteElLektjOUF0anRIL1V6R3E0YklNcUxTSWNOUTRZN25uMmtINlhv?=
 =?utf-8?B?RXYwdUU1M082WTBYSGJ3TU00bit5UVpLOVpHUzl5Q2JjaWNwZFlLMUdIdWt4?=
 =?utf-8?B?dzllR0FSak5XS1V0OGV5bkR4cTZCRGRlWDUyNUx3WmpXaTFrU3FZQ1hESHd4?=
 =?utf-8?B?WmJJMTFBWHhOZFI5dTBTME8vVHdLaEtOWTNyT01kTHdXWlRtZGVBaDJZNUQ2?=
 =?utf-8?B?WDFyMFoxVzFhQkpZS2VKdHpWZFFTbFJCTzI5NXh2eVNpTlJkUzdVdFBkKzF2?=
 =?utf-8?B?TGxOSGhLbEpUd0I5ODZqeHJGYkVmZmJySG1zYlZxK2grTUdadDJuZmVTMjBK?=
 =?utf-8?B?S0xOd2taNUR3aEowcjJXWHR4SFBROU94QW83UmliNkdFTUZWK2NOR2RZOFFB?=
 =?utf-8?B?Ryt1Z21pTXVBV2UrMVhQSDhRR3dwWGl1M00zNUpOSWZxaUZMR3RoWERiV3ZJ?=
 =?utf-8?B?RnFMQXFnclpEdUt4eDdkbERnZGt4aXE5bTNwRHB0dGhCUzkrNmNQM0NyVWF0?=
 =?utf-8?B?OUVoUU85OEp5VHdsVDh4Q3JuSVZ5N3NCZ0VKamEwcW1Gbnd2Sk1FeDkzdkJp?=
 =?utf-8?B?ZGVNMTl4Kzh6NllsRTZIS2oxeFIySUJwRXZvbzFBSzN0bm5wSFVBZ3Q4RkZj?=
 =?utf-8?B?UGVYZWtGWmNYVm42bC9MUDJJTjlKSlBYNjRmQ2ZPaFRpeEZhbVB0R3AvRklY?=
 =?utf-8?B?MVBKcTFKeW43Z1hMR2lrTVozVzFDcTZIcnRMcTFFOEFXV0FqY2xEdDZ0MjVv?=
 =?utf-8?B?RzJCczI5ZW5LYkNyME0yUHdiUWtLcytnNVBiS0V1RlZ2YlVpaGlOdk1qOEVa?=
 =?utf-8?B?Nzl2d1VrNWRlNnlkaWdmcWtLdklqSDZSOUZkTGlRcHJtUU9HT3B2bUpZRkhW?=
 =?utf-8?B?aUFrZ1Avb1pncmg3ZUdCcmg2QVl4ckwrNkNPc3pMT0t1QzczNkdyQWp3MlRt?=
 =?utf-8?B?akE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	txik19aUbZXO1PUcQZMlE/xz2wN+2MFMWUMaPZS5BhvEcMq1S0PpdHvB8j8Uj/wDVc43wqww7Q86V2Aa9ulmUtjTSimnU3AKlF0fo1X+fCG1kuu7F6rFtbiEAuPwPD7XNMNTWHWqVme/muqaXckZybnGD1+ThNumtRUbwEnhC8SYD/8MdR3hWokmELHYK/zVZ9u6pVoon3jIyaM8QEYjs1rvVmoDCt8by/vBgtQi80afmpW8F64voPeiMlTmj6rd1kxApjZI/MsIr5Q2bYBYY0kiU3TvhL063ghyIYwC5qyJgP1dTHLe3ECuM0EBawKboCU1vAB1wjcrRhhViWnLLLNIq3PHdgilgDaAz+3zt8xMlpeBPURZUlbncGQq/RtinRx57fdBgh6bVwnNewKgNEtI6sY6AG/f9B0XYnrZ3d7x64BTYqSLOpl60//+aVSn
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 10:23:28.7333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d19fdb41-6486-4ec8-8153-08de6e0e97f2
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB4710

On Tue, Feb 17, 2026 at 10:54:49AM +0100, Marco Felsch wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> 
> Hi Ian,
> 
> On 26-02-17, Ian Ray wrote:
> > The PLL1443x is used to implement VIDEO_PLL1 on i.MX8MP and can be used
> > for dual-channel LVDS displays.  Add new rate 756 MHz, which divides by
> > 7 to provide 108 MHz LVDS pixel clock, and by 2 for 378 MHz LDB clock.
> 
> the on-demand rate calculation doe for the PLL1443X PLLs is not
> sufficient for you?

Apologies! The on-demand rate calculation does indeed work. So please
ignore this patch.

(The patch was needed on kernel 6.12 IIRC, and I automatically re-based
it on 6.18 without re-testing. Once again, apologies for the noise.)

> 
> Regards,
>   Marco
> 
> 
> >
> > Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> > ---
> >  drivers/clk/imx/clk-pll14xx.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> > index 36d0e80b55b8..84279cf9f12b 100644
> > --- a/drivers/clk/imx/clk-pll14xx.c
> > +++ b/drivers/clk/imx/clk-pll14xx.c
> > @@ -63,6 +63,7 @@ static const struct imx_pll14xx_rate_table imx_pll1416x_tbl[] = {
> >
> >  static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
> >       PLL_1443X_RATE(1039500000U, 173, 2, 1, 16384),
> > +     PLL_1443X_RATE(756000000U, 252, 2, 2, 0),
> >       PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
> >       PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
> >       PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
> > --
> > 2.49.0
> >
> >
> >
> 
> --
> #gernperDu
> #CallMeByMyFirstName
> 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
