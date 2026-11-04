Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793808355;
	b=ZwktjYkEH2w0ZjrZXoVK6UQOlWBLb02VwYyluk84BttAM5rgeYY8W/jZQmrRUwdpEBkC
	 ldGEzho8hvyFICoVsFBS5i5I25A2sdz/bCRqafRIftuxfvzhyuVkjtlfkKvFt/LF+YZBM
	 oGgModAAKIWCRq5Y9GrEsZqziumUaXibU+Y3Vym7+Kb+UIxaKrUEhg8rzgh/UNIlEd0VP
	 yPpa6PpLkvs//chxTnDlbZEKfakd+Of9Ua050lkY/WRrLEe4vvyptXGOg7D+clqSXWO9n
	 cnkkZMZkZWBSz8UaRdfSgzHbyxdcPBWNt3yqV+UbtXHmCvTfVWPn/5jlg1CrWB0roqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808355;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	bh=eS+s++kUP315bhrFR/E3Ywnsm+5tZrMPEQ4qClcz2HQ=;
	b=fqUyWldmXpB9Tw8n4IJW9CMl9EyaqUS42eRDtsDruH9gc7wTv+ntuH8Lhsf+z9OMhDnh
	 oP7fR7k9j3C7C0U720V2zlwFKzQYgIqZqYGg6zuyNfiG52g+EwadbYrI00+IDKvgTb1ce
	 yl5384tRlVY4GsmTtYdAcuov+wdbXPyQ/A4xPkphc/Rv0Y9SU1eEZ0NPUM6/95iixmWlq
	 GdJw2CX+TB8VNroyziz/n6/oZ0/culbS39tYKokzYFHCrkvngCYhOvgwOSIueiR11LaN/
	 S1zZ1Xf7i+p14QJCT6Fc4E235Pr61AwYNMdV87mmv2/eKN/c/8Ozpn25yjLTAdqU9Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=DbHSMS9a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.18
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98174606A332;
	Wed,  4 Nov 2026 16:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98174606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=DbHSMS9a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnNdJ/AWnFbtUvCQdkGBkFkOt06R4Y+f7hUqRxiBykgl+FoF6wCWoowcVLPyXSkQgX57oKpoMbKm/YcQyioAaRt4PbLqSmnP/CtQZKZbZiUUhzAQfcZHLn7OPv0FSNGjdV+F4wf+G02ZDWIi6Yc3BVwS2Wfgn7F88QFfo2+epTebbK7+Tpp9l1oqwWSJP9Vz9AcfSS1spnMN9BRZo/ezLLXR0Ae4xDmFdll8Aa++8pYN+wHsw5Unpk94i91Y53nhV0rbuQmltrBEExVTh7Po4o2wCl3qJOaQozwmIScxztS8fZHvL5/ofd8HZXW+0vfOlX3sT+AvRtlqph+fJALRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eS+s++kUP315bhrFR/E3Ywnsm+5tZrMPEQ4qClcz2HQ=;
 b=lyepfqqA9DU3nA9y/vEzEZONDwpH6C1ftJu/zeacVvbMcBjxTrk3rvNUzTnwxrmBOrq+f62FT4qohs7WkuWTVxj64wOaLvEe4IrjutA4NfyuLbQoTNkTG7eHlwLFvSwfzyy7tm6u2rnxM6si2ZxBhhtf15K2tzI6xrACbt36MjXhZUOPZkAgImS6sUfWDkIKPLKBEJ4cDlv2WrIFq56ENCyIMQ4ysSZ8AUfKkuWk35fWwI52HPMJXT+e68wRL/Zbc8Qe2xI8WPYaX3HrVLKREFbfayTVkXwxInFex+a8S1IyskXa65c7ilx+pOxfRKd+vMPMXKRRm1L++cEzFwBx/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eS+s++kUP315bhrFR/E3Ywnsm+5tZrMPEQ4qClcz2HQ=;
 b=DbHSMS9aWmW5QiawnPV/j6XptG/yxKNxicoNdvFLDUwx7Kpmj/mOv4gKJx9PLDzp1EKnGKbCMMhR09gIjhyet+fsg/EhY3YUGPfwUkJKSy9nLaPb3nNlO77cgSpLpmg6U1DJQ0R7DOc8xsu3hjnoAE458/v59ltDS4uIB/3JP0I=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by TY7PR01MB14570.jpnprd01.prod.outlook.com
 (2603:1096:405:245::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 16:05:50 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 16:05:50 +0000
Date: Wed, 4 Nov 2026 17:05:32 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com,
	tomm.merciai@gmail.com
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h: Report the DSI duty cycle from
 the LVDS divider
Message-ID: <autXzHgNjFVf9Oyn@tom-desktop>
References: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-0-47f23de6bdb1@bp.renesas.com>
 <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-2-47f23de6bdb1@bp.renesas.com>
 <CAMuHMdX5XuDpdmcUhPHU_uNggpXq_L=6DRSN3ftWEApubu+VMw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX5XuDpdmcUhPHU_uNggpXq_L=6DRSN3ftWEApubu+VMw@mail.gmail.com>
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15)
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB295138:EE_|TY7PR01MB14570:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a15a118-7ff2-4046-d5b1-08df3a8d7eb6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|38350700014|11063799006|4143699003|56012099006|261021121427099003|261021135927099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261009223327099003|261102123227099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|261026121527099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3+F7HGOllCb+5MaH2kytMThV5z3bZCalGcYzWN5mwsIEvt4JRH3Zb9QgwwWVutzZKA1AyXhebx3YQcaPDd3AR4cN01gTSs2JkVQIFduxwNGqCSQG8v0Xi2weIRlWO7Qn+zmZO53IL9R+AQM01k4SjhpGDThEVUKyEbjThffS1b7SJKCTtsrAd6MuVYlPRzLP3xsui3YOzi4yJEEeOLU9AN6NsdL/+RY5Sysz6LPF+ijtkOSLLrf4V8ypGsoU6F/Atuor+8gDl/YlQZHPVBW2YQmqb30rEuzuHYn649ppE0k2Q0bmW2kqb0a8Y5TKLA6pgiI6gdvdF73KeGRUdc2mAJ9jysSZgf46MW5kxdGZ2NkJICcx5VykgEijLMQP0xl5RQa1CG01UXUUq5CCJ9CUFbNQzMMRavCcDT4hZ49wtzqP4q7OtWUNvjIzmAKBG1fdXm0w7PE5vTub5yihKbH45SRw3V+b/9bqlHoNCRf6WI3r3HqwVb53zoMJ8RHVujwfDq3nQz+UP+/x1hZFFNDRWb+Tl33atVZOH9Ba60tHLS2/QoQri58DgL9oF3pFeaH2lDOigEcuK9FjD8gKMZN8DuvVISfNkiGUnrT1cgbmaf2ZeHqHJDQp/3ZDQ5+F1WrK/tDi3r9/7y0kvl4qkikpEYvqHx3Bx1LFCIFNRre+cTPe9rVGAVdvGPyT5ahIVwna2i6plnwgm1GPsWfNeu2rYk7YoUTd8DnDcvQeckVi5Jc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(38350700014)(11063799006)(4143699003)(56012099006)(261021121427099003)(261021135927099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223327099003)(261102123227099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9C5nXC54qK8Hc33r8RAELho3EpLeVVylngkxcYe44rdugRptkz30Q9+tsOeR?=
 =?us-ascii?Q?N455GklFRVQC4U/yAUbsLyhO9JYZFP69Zwis9+aOfSVh1+Ca//fHkwkrwWo4?=
 =?us-ascii?Q?izI/g1wyFxZ/c04BQvgClEnhoLJk+fM7w8NbHxL3Xp+Nch/8iWZcjBrA0RLD?=
 =?us-ascii?Q?chN9NBn8r2izBJ6YW8u+rmOjJuqEnAboKSI84za7cKg1WyHiqTlXidO8VvOS?=
 =?us-ascii?Q?Fgp5e+FkB9PtB77wRkI9nAZ09WRDP2cLsQkcLau0esKOviu77hGWOgtNS5NK?=
 =?us-ascii?Q?ujJk4oAkGRWxcTfkeqAk5RHk01N4D3oZ4BbFPzFFO9SNHW1C3duR93SdbkAp?=
 =?us-ascii?Q?lSv5D77+DwU9w6UrOUoGKZpsHAvPTwzi7jmKgssjqV8qWwJVa/lY1ZcSkhu+?=
 =?us-ascii?Q?yjQ/i6Xmn72PsLF5YSM0tkrKuJltd7x8JBy+CELAbl0JuEMst1m/e/3XKZNc?=
 =?us-ascii?Q?lmQZR0YjICAB6lGTbzW36gpRpKo0fLkqeI9v6KClDmzV808ztbCu2R9ALGLO?=
 =?us-ascii?Q?za/94yoGktsTN6eyFbI6GF4nzMA8hqPdavpKQNkQtdW5SvlTrAqbeS7CrkXP?=
 =?us-ascii?Q?oJIKqjv/DGvXIY54N+f0ZR1EgmxDA59qUcNnyywzvnvgwwAEl0qVLcoqFGX9?=
 =?us-ascii?Q?oGlWK60Ho/oX8XU2+ElZI+RygCHCt/1q2zSwn7ERYjqve99/WmQ8NtlGTVRx?=
 =?us-ascii?Q?liPbG/jzqOkxLjxqao5w1XmV1T++7fYzQGcvzIn4xUp5huw2pA8C7NLqu9GJ?=
 =?us-ascii?Q?Pgl2+buEKuT3tiF3AZO/0OFWQJBcMD5+Viae/+7WGCN8NbhWYBOzRmbwirhi?=
 =?us-ascii?Q?BTqDsrLgf8Fv6ahD9UBtr1evqjXmHQfntU9nttfChGbksJOGOqQKXS0Ql0dB?=
 =?us-ascii?Q?1Hjx4YpW/Be6iznpLRm8x722yRhQ8uLvOFxLv8JzTZ3jgw3AuUpUjs8CtmxF?=
 =?us-ascii?Q?PXXhrYa+OYzG8Yt82VCOxtDua4qyBPlz/mDy38EdIhoTm9MPLGL7Rk3MBNXZ?=
 =?us-ascii?Q?wd/ajkF4O6fla4YPVeP1uY5DSBOarAM3B0cfLxM4y6m6Gw7pywIx1lvw2RDR?=
 =?us-ascii?Q?6RY7+GaL5vbsLlDnGu2+qQo6qNRBFVZBzxc99ig6Iwz49AeRxYxL0paxduqw?=
 =?us-ascii?Q?revxgcX+9ix1SE4sU3VtyzprDM49wA1NAabC0SIIK9h9vDFStZEla65mALXw?=
 =?us-ascii?Q?1/eWsx2YDsHy1WVkhiOKr1Up4tETgemxWxPspTKDmihKvub/vWjjt2DzWvDk?=
 =?us-ascii?Q?f6s1s7oHEeMmGWpybLeFRTnKjW5vUeS+11CbuqhxhWSa+SXL7ztAixgaTeG+?=
 =?us-ascii?Q?/72Kjmfbb/XSruwipYtkVKuCLpF8QH4hN1nW2RrcIrSHkai6dpz3+01vfNDS?=
 =?us-ascii?Q?0KbIRDDle3zbNXANTBzrtQnsP8zENjbLggthoSp9B7z4q0Mi28L9d8LFXKwx?=
 =?us-ascii?Q?PkAbb4+npoKccy4A5eEHGz8Nn4oPrMcDKRJYvfbZcaNyR6VQCHagGbr0M+FK?=
 =?us-ascii?Q?xraX8iigqiiFhKzvDmrkPjsc6fWaSZGqHkxxVYbhujB/0uuLJ+yJGNS4rrU3?=
 =?us-ascii?Q?ltRDsxZPhsFfrw/awQcxJa9FWjPmuL/xMfQKu6Eq2Duc9RQNZ1lUUTIngzhv?=
 =?us-ascii?Q?6p1l3DaBsCw9xRaRU9vk74Y1ctLh/YehfPWrRFfexxQCyXxSS/NSoIvE+K6L?=
 =?us-ascii?Q?WJj8qHThKEhd2Hf23R5OtqTm579Itdlhr37jeuIeucxhCjwlQiThtuyqYSad?=
 =?us-ascii?Q?AYFP5oVPD/91TfWxUlk8Ns+xTLEaKf2W8InIXuAQuwhVSLsDqcx1?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a15a118-7ff2-4046-d5b1-08df3a8d7eb6
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:05:50.1931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjh3SbBrc4rsl64uJicjzCqCJIFCHyT96ZMzk92tw/wFQeaAooPssYe2cuFVcBphZpRGk4787kNTeuM0Yfl1PCCxu2zJzxt4alF78FErgYRAIaWSUJCtJKnyokdrn/CT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14570

Hi Geert,

On Mon, Nov 02, 2026 at 05:16:09PM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> Thanks for your patch!
> 
> On Thu, 29 Oct 2026 at 15:26, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > The 4/7 duty cycle of the LVDS path comes from the division by 7, not from
> > the PLLDSI mux, as an odd divider cannot produce a 50% duty cycle.
> 
> Note that the latter is not true in general: if an odd divider looks
> at both edges of the parent clock signal, the output will have a 50%
> duty cycle (assumed the parent has a 50% duty cycle).
> If an odd divider looks only at rising or falling edges, the output
> will indeed have a non-50% duty cycle.

Thanks for sharing.

> 
> > Report it from a dedicated LVDS divider clock type and let the core walk up
> > to the selected parent through CLK_DUTY_CYCLE_PARENT. The reported values
> > do not change, the mux keeps selecting the path, and its duty cycle
> > constants go away.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v7.5.
> 
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> 
> > @@ -890,6 +863,94 @@ rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
> >         return &clk_hw_data->fix.hw;
> >  }
> >
> > +static int rzv2h_cpg_plldsi_div_lvds_get_duty_cycle(struct clk_hw *hw,
> > +                                                   struct clk_duty *duty)
> > +{
> > +       struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
> > +
> > +       /*
> > +        * An odd divider cannot generate a 50% duty cycle: the output stays
> > +        * high for (div + 1) / 2 input clock cycles out of div, e.g. a divider
> > +        * of 7 gives a duty cycle of 4/7.
> > +        */
> > +       duty->num = DIV_ROUND_UP(fix->div, 2);
> > +       duty->den = fix->div;
> > +
> > +       return 0;
> > +}
> > +
> > +static int rzv2h_cpg_plldsi_div_lvds_determine_rate(struct clk_hw *hw,
> > +                                                   struct clk_rate_request *req)
> > +{
> > +       return clk_fixed_factor_ops.determine_rate(hw, req);
> > +}
> > +
> > +static int rzv2h_cpg_plldsi_div_lvds_set_rate(struct clk_hw *hw,
> > +                                             unsigned long rate,
> > +                                             unsigned long parent_rate)
> > +{
> > +       return clk_fixed_factor_ops.set_rate(hw, rate, parent_rate);
> > +}
> > +
> > +static unsigned long rzv2h_cpg_plldsi_div_lvds_recalc_rate(struct clk_hw *hw,
> > +                                                          unsigned long parent_rate)
> > +{
> > +       return clk_fixed_factor_ops.recalc_rate(hw, parent_rate);
> > +}
> > +
> > +static unsigned long
> > +rzv2h_cpg_plldsi_div_lvds_recalc_accuracy(struct clk_hw *hw,
> > +                                         unsigned long parent_accuracy)
> > +{
> > +       return clk_fixed_factor_ops.recalc_accuracy(hw, parent_accuracy);
> > +}
> > +
> > +static const struct clk_ops rzv2h_cpg_plldsi_div_lvds_ops = {
> > +       .determine_rate = rzv2h_cpg_plldsi_div_lvds_determine_rate,
> > +       .set_rate = rzv2h_cpg_plldsi_div_lvds_set_rate,
> > +       .recalc_rate = rzv2h_cpg_plldsi_div_lvds_recalc_rate,
> > +       .recalc_accuracy = rzv2h_cpg_plldsi_div_lvds_recalc_accuracy,
> > +       .get_duty_cycle = rzv2h_cpg_plldsi_div_lvds_get_duty_cycle,
> > +};
> > +
> > +static struct clk_hw * __init
> > +rzv2h_cpg_plldsi_div_lvds_clk_register(const struct cpg_core_clk *core,
> > +                                      struct rzv2h_cpg_priv *priv)
> > +{
> > +       struct clk_init_data init = { };
> > +       struct clk_fixed_factor *fix;
> > +       const struct clk_hw *parent;
> > +       const char *parent_name;
> > +       int ret;
> > +
> > +       WARN_DEBUG(core->parent >= priv->num_core_clks);
> > +       parent = priv->clks[core->parent];
> > +       if (IS_ERR(parent))
> > +               return ERR_CAST(parent);
> > +
> > +       parent_name = clk_hw_get_name(parent);
> > +
> > +       fix = devm_kzalloc(priv->dev, sizeof(*fix), GFP_KERNEL);
> > +       if (!fix)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       init.name = core->name;
> > +       init.ops = &rzv2h_cpg_plldsi_div_lvds_ops;
> > +       init.flags = CLK_SET_RATE_PARENT;
> > +       init.parent_names = &parent_name;
> > +       init.num_parents = 1;
> > +
> > +       fix->hw.init = &init;
> > +       fix->mult = core->mult;
> > +       fix->div = core->div;
> > +
> > +       ret = devm_clk_hw_register(priv->dev, &fix->hw);
> > +       if (ret)
> > +               return ERR_PTR(ret);
> > +
> > +       return &fix->hw;
> > +}
> > +
> >  static struct clk_hw
> >  *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
> >                                void *data)
> 
> Since there are now two copies of this code (see rzg3l_cpg_lvds_div_*),
> perhaps the time is ripe to add odd duty cycle support to
> clk_fixed_factor?  As duty->num can be rounded up or down, I am
> envisioning two new mutually-exclusive fixflags parameters, e.g.:
> 
>     CLK_FIXED_FACTOR_ODD_DUTY_DOWN
>     CLK_FIXED_FACTOR_ODD_DUTY_UP
> 
> What do you think?

Agreed, thanks. I can send send a separate series, adding both flags
into:

 - drivers/clk/clk-fixed-factor.c

In thi way later we can converts:

 - drivers/clk/renesas/rzv2h-cpg.c
 - drivers/clk/renesas/rzg2l-cpg.c

To the newly added CLK_FIXED_FACTOR_ODD_DUTY_UP.

Not sure about CLK_FIXED_FACTOR_ODD_DUTY_DOWN which has nos users for
now. Please correct me if I'm wrong.

Kind regards,
Tommaso

> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
