Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7504052A5
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 03:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442072; cv=fail; b=pK4al2q/v7NaHC9vSKAKwl794yMIXWZZuTKm8kHUt8eu7LTz9zQWqJ8mNNWG20qtjtteA/Wj2TpzTLv+rf7Cd1Gdfgty4lMQm/NdrCEJdkqg5yKtwvq4M8ehpa7MFxsLiABRuknaPhEcSJth+P0Ql0ZMcg014ijoaUL3vX+XZuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442072; c=relaxed/simple;
	bh=4YA21+dnk/ts6cmmUtfdDZGMXIYf+RDUwWcyogRAx74=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kBahFJJ0Au9FARuRr/aq4zwC0QDhYNZGumacqYKeNCGEechMaJd2qXGuVJneEFdzcpA1qKQsCcQUzVtKdZO+2bWz8mBnVPNVjtDp+b8Z+I/zrCXh7VIYntVXOOIRGATsVwVbla3V9ZplN/f9Ox2Vxy9z6wX8fmyDNQO3Lb2RscM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FTqmapuH; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FTqmapuH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKojljwxQv12r+XiT4hFTyluKWjaxJGYGs9qCj+W5geSepop+8uyvvc5U5apJFhbZu4g5L+T3M2TBc3o24IN3hYfrf5UTAsxyixqNSQNcuGgD9zGwBYCUWgACwYEPqvup9SxCnZsOHw6jXAHAVkwS6+EnNWw/PIKGHDVztvOE+a3KNQOWYtM1LqMrfGgwEtY5bxuGhJZoIc7JkM1SZaVPtpy2/8rZB/Whlt3m0FpYw8Dkm1QYbnLEAKUgOY8oOIb0GH7auUydxBj8bh1D967eXtV2iu+JauHaxP/POvjtmAokXv1bnAMWC88Y899Uqrbq6qkt8cR7TfxuWbefBjyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPwINLVwOKzJ584nap8C7DeyxEqqNzM02yRCv5THflI=;
 b=Je9KqL+Jybts/8pcvM5+2Y+3XVcccRGDgaP+kPpxnKgH4wsZD/kw0gs1vhxgEjAif4YzfSm5DvgGcoXpTV9+7qSfX4nKJUixgc9glMN/sOC5i4JRmVIIyOg6eDO9YhTQdamOWa3ATDPCjJ6iDCH1GF8ei4w3Vq6BPKEWpTQvlEutDIDX4LuKSd/kuYKXBzc6RNQEaZR2ofLb9aReaZ7RZBoW9LX2VsPH+tGNd05CaB2DMKaHGjUU7UNZc2PDNspBjkyjJCSAAD2PhhPQXmHcgY5YKCUFVSYbmfn4/1kwaAgmC+Ch2EYdLuq9stBknJFHEazEzLzorbSO/1KA3ddkpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPwINLVwOKzJ584nap8C7DeyxEqqNzM02yRCv5THflI=;
 b=FTqmapuHTkVAKftrTylUM3sa7hoGw9LpGKjUt/LN3TC3xNoDZCeI43yVXYiba/A6IXsl6tGsbzvdbMtlTBvK3TFYYmqp3UMpMrs3sMx7dWep+1kYi9sGbR31amLnFKgbDGQf7qk6j49x77BOMmClPNE1WFUZoa3XMaG4OmuLXSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TY4PR01MB13855.jpnprd01.prod.outlook.com
 (2603:1096:405:1f8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 03:14:28 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 03:14:27 +0000
Message-ID: <878q53ryss.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: renesas: tidyup DEF_GEN4_Z()
In-Reply-To: <20260915023617.7D2421F000FF@smtp.kernel.org>
References: <87cxufs0yi.wl-kuninori.morimoto.gx@renesas.com>
	<87bj9zs0xp.wl-kuninori.morimoto.gx@renesas.com>
	<20260915023617.7D2421F000FF@smtp.kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Sep 2026 03:14:27 +0000
X-ClientProxiedBy: TYCPR01CA0194.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::18) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TY4PR01MB13855:EE_
X-MS-Office365-Filtering-Correlation-Id: 91bf04c0-ff56-411a-9a17-08df12d77380
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	RSRMqVn8yoVohfMz9/Vf5IfvE558zQM/k035tEPX/ATZVNxdvBUK41zLD+oty7Kos2XtFcU2FBRVkw88oS2yZJ7uiPv0eYYWJb8jkm128SNO08EfcQJOfVFie69zd7bHC6fVBtbe4gaJZ2gYMhqGwP5pNLqQoIAKjqoil5C/0Vnrouk/56rbhohoa4ubRVcytfN9Aopn90YhuD4WFxh0GPZaq22NusPUFhNUCVMjKVTxGVIyUw/0zJI6z+04DsYk0CFxpg30VkzQC22CqCccquriqLtAyOa2Z0ipp8Qsp9elsbp6uj+AnroR75bpav5eHI2f7ueLKG+Gwcnb1fLp+A3iCXLKsywrTAlVKKKjTGjt8iTfvrjxdFjjbiIgCO+ryekmaYVG6BkG9ugAYhiUsylSU8HP14H42bHjlqunNEkHhKDfSfOdBCW5723swwN723Lsm2IK2O9+2d7M5dp8fyEWva6s58seXpWqLI5b9xnKKL+8+V/ZgxBIbGK5durmy5+sNTpEF7UYEKXcWhOvCbiB/mKKg6wABJhVi/p/kc8FR+Ruk7+gwtyuIdXwohIFXEyxuoUZy+nymUTVn6A2x3SfXHiPgWcuuqShA4xvkGfrFtWVO99EwEx45QF9ffi+0/ivF/DgZbWsTVLofwbbcxtYK0x+v8bGBzc8dWU34NpLGTUl8RSMHFVhOsbDdjtVvxonCF0YTLPsSFbLXAv3qn0YbNMLRRV9FUdterZ2agg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3k9R1ergTleJPagqyz+Mvrk3ie+0n0Udai0vv0/J3dYgOJe3KXtwUNQseEzS?=
 =?us-ascii?Q?Yoqb1FFFNsBS0xS65qDkGe/BWYVJ34cqB5xtLMLM/cGOXbB0s326kKg3yJMF?=
 =?us-ascii?Q?K1Kl5ER1Rjv45AhgqCD8guBhoCJnAHfI3ZNm+OVDH/9DivDEFb4xcqA4uGGc?=
 =?us-ascii?Q?v3QS+ifmoiiz6r+zV8EawMYqWDKSWsh3SCDUF02TpsLCjDE/W0gKbMa54Ks7?=
 =?us-ascii?Q?38iEr+H2mXOliHPRxj6Q4Dc0jni8ERhypcglZFpxExkowslXpQxsPYVO9JZH?=
 =?us-ascii?Q?1Wd2zDrK2hNuQBVrWslubh8pPI7lXYjoVgHyi0rtTQgRMMpB/6is1oV3CemQ?=
 =?us-ascii?Q?iUrRRfLZhT5vesTsrih4gdDy0CDy7tNLGcd7/orq+IAYLNKSeqie2m619/Pf?=
 =?us-ascii?Q?a8yw59R3KpqmjhX2aTA01W4u0ir2WPMY2mXJPazaTxdWsxPjDYpKKHphgnEA?=
 =?us-ascii?Q?dq0Z4UhVccl2kFM+tpYqHZriWW79Q42pvwOmV4meDFIF8K1LdrRMOvdaJmI5?=
 =?us-ascii?Q?Q5MhAxviGGXQGpHexof61MZoEfSw2rGBAbm7JX3ok1vfreD1gUVs7Ra6W4N3?=
 =?us-ascii?Q?4Khza8yxorZsxRH0jAb7SnYLBYI1Cho9We62lNx1Nfj3l9ADchBaw26Q4dou?=
 =?us-ascii?Q?WIBguPpy1WDcre4/+juPBZjP+/hCoiNvQIDVGfIkKxG/3tqtvptzxcMvHaHW?=
 =?us-ascii?Q?8Q+vczLk8gJZPM4RSjww75ydIsA7EYImJKaOzOBNianYUs7Dq1b8xNQACgie?=
 =?us-ascii?Q?SLVr1P4Mgy+94orUqh9XXV6LHhUahzwhEY2iC9cnEphhqYz46mfNEnWFYVe7?=
 =?us-ascii?Q?G6AXp+kxikELLwC7K7X3N3kO149KBiD1ueB/YOc6Ff1eTzA4EX+otbBJm9ZS?=
 =?us-ascii?Q?8Pk8BDA3lv7dGpVTj8OM59LCEb9wIDAfM5QOkKkPI988BIpOOhKN5BiT7mmP?=
 =?us-ascii?Q?VorvqBHIQ5k/cNSS6mUh0J+9RjJd/DaDLXZKBruK/dY5MsWGaTXspUt6H0h3?=
 =?us-ascii?Q?ENkU0YrhclFZnZsNGMEFsOpKtJHtsLzDKmEEffZNrtGW3RdHBGqQ9xFtD9bE?=
 =?us-ascii?Q?YXGa07Iu+n3ow5+73xdafm11fFWbvEyBmtYXpxEa6LohtjaNP4C/rp177b0l?=
 =?us-ascii?Q?XgIadKPZiFxGuGT9a9Obd8/xFfMpxo5iuaO+y7Z43RdTDKnl+JS3VbJWYA2w?=
 =?us-ascii?Q?1ncy/ollj4f3OkquOSMUJ4/IWPrIBJEAPSSerNYZ+ynZRdSSm0FxzXQ3kF//?=
 =?us-ascii?Q?Dgy0l44jDlTSrNpFxi4Ia4BeeEsArj0qfHMbHdhQlaKbPJ6LInussRnM308A?=
 =?us-ascii?Q?9CFMRJJ8R78nEwK1xkR8Hfbpx4QfquNdvUMKtPTC3wzjXTqec7JtzbuegaqX?=
 =?us-ascii?Q?hC7qljklb7PXem/mP+TBzF17d1vHgTw+0c3CXEhJZeXVIDezzxMXRGxzbcRe?=
 =?us-ascii?Q?tedqO5BAb1gYkVIj6qFkGIUujqZcCstiSc0KOXKkcdyu8EeDZ4L3M4fNwLnM?=
 =?us-ascii?Q?eM1HUAz9Q2LZFon0J/Y1i35YEl7Tjs4sjlB3dY/TgMRBFE5/xhaXtpP2ECmF?=
 =?us-ascii?Q?0UYveU2O0W83AK9NvbVW8goPh7koa48U2StH/h8UfLfh/ONCTEce36bBvXcs?=
 =?us-ascii?Q?60GiqHba5suibjr4s+WCZMCMwe3D4v3IZMAp7xbiuv1Uph7pf3/+vrFSr12+?=
 =?us-ascii?Q?KasExjWbLPNUSfoZ0h2P/b6+0RFlxqLGcI9xNr26LJ3UJs0w6FWYCm89A8G1?=
 =?us-ascii?Q?CcZKe00eQZ7xAn2VP79g3RUjyuPsPbijZvaKCg+RRhKcepIjt5VC?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91bf04c0-ff56-411a-9a17-08df12d77380
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 03:14:27.6282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2mCJ9lPVXANkqOWd5QCQfnKiMQL5T3qtDFcn8PoZD4GUELCyadPtahxNV0ImmNhUXSBxEYTWGL0Y1/q91K0ds0TMrBBpffPvpTxKZpf1JTCejS9OgpgfnDyV+GZMDef
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13855


Hi Geert

> This commit updates the DEF_GEN4_Z macro to take the register offset
> and bit position explicitly rather than deriving them from a single
> flat offset. It simplifies the offset calculation logic inside
> cpg_z_clk_register().
(snip)
> > +#define FRQCR_offset 8
> > +#define DEF_GEN4_Z(_name, _id, _type, _parent, _div, reg, pos)       \
> > +     DEF_BASE(_name, _id, _type, _parent, .div = _div, .offset = (reg << FRQCR_offset) + pos)
> 
> [Severity: Low]
> This isn't a bug introduced by this patch since current callers pass simple
> constants, but could the lack of parentheses around the reg and pos arguments
> cause issues in the future?
> 
> If an expression is ever passed for these arguments, operator precedence
> rules might cause the offset to be miscalculated (e.g., if reg is passed
> as BASE + 4, it would expand to BASE + 4 << 8 + pos). Could parentheses
> be added around (reg) and (pos) to prevent this?

Yes, indeed. I will update it

BTW, I think we can include CLK_TYPE_GEN4_Z into DEF_GEN4_Z(), and
reduce the line len ?

	DEF_GEN4_Z(..., CLK_TYPE_GEN4_Z, ...);
	                ^^^^^^^^^^^^^^^
Will post v2

Thank you for your help !!

Best regards
---
Kuninori Morimoto
