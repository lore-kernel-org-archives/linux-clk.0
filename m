Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7121820D4F0;
	Thu, 13 Feb 2025 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739450157; cv=fail; b=ISOV+6u3quJYYgUew3e2FmCUn7tRiwsN/w0rvIZ1EfKWBSGaK0AXDyFTKMuWCWa6Nsn+5IXxcYkIx9E+CnamolY9A4LYjalYO6Vlkl4Y7SQAU2tN5aMDbslBmLt4Ivp+65dxVNLu9mG/cV2+N48tqdVZTSnzZJBC48bkjz4kJiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739450157; c=relaxed/simple;
	bh=loVFR4P7MN/j+AT+D5MfYZ907zoLkli4oVlmKewPNlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oke7aCPCiJg1QTno06I2t7inz6ovMaoWzon6cpVMN3yvS3hPpsLra4AumM+G8PW9U8YYkcOkAbNcCG3iXONLLOKFh/TMjJwiHI5qc1i/Pwlq2nC57ttVQZ6XC6epMLjMf481Ml86KehTyWyojUR+q65RkJ6U+aVtuY71DJxgoq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=icTFJmDw; arc=fail smtp.client-ip=40.107.22.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="icTFJmDw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBAo5otyh69t8ECvtJjYIvSknhoKPXI1rShpgGYiGm3SJjL00onwtjqCKCwulOg80GThpSw4bTbY01n3mBVfBHkIDpxxUvzR+vsFcmKpvfaVS4AmjbSD1L+47OVRDw0Jg2mObUvFvyCiw/YNiR3H14yJKjaMFRySbRmJSeGhRJ1paJSWSzYedjaGyIRJv1Crs8CpeckTnAGgbQMxZVOz5HtfYo3uTaqq3TVwe8zuTBesEm9K6OBLXMZXWu9U8G02xkcf3KuVoPashienFYS6E+1vXcSIq2/vr4vaZRLvaUVdcfUbswnbZ5nIL+7AzL95WWlLbmVYcx261DJaGRQivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkhjL1lc8aA3m0M9qa2GzB+XMzHvaRfKjhrhDRQcd1g=;
 b=v3x6pblsbHEoyqEqUlPZq6YZRX2zseL3KQVBPhjrX5+56IgmOc/tBD2MyH3quLW5WU+3QPjAdxPZ/pLDRPNehZ7iPfOWcJY7VPApjmuAhD2M/2K+dILhM9TNMoerFM5ig/J4dBWVQkZLqzlPvEBFm3cBcrd8reTx+Nud0fNxWKOUb5+NNQI0uH1uMMEPbsHEHpSPdy6vPVIIvSG/UliFEmt11lpySdOyE9wk/3DA4nmRa2HP1qHzLjgX7Ce9mIBMczl9mC0HjxH9tjStq+9ygHqs0BS12gVXRvrniKm9h69n5FYnnkpxyxkMXq3FESS2LPth70GGIFsR75aNzE87Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkhjL1lc8aA3m0M9qa2GzB+XMzHvaRfKjhrhDRQcd1g=;
 b=icTFJmDwZ2+yo/WH9pG46SE9e0jJC5TwZSJ+5hmMpZZDiBavcAKYbcczfrtBYLcpOTA/M7HoIpZwOvEn7C8yayyCGknVaCUCkfaPF5pKxqWR+XZ+y6LNCDfiDd6nE++AoOaRSo1UuTupUoZ7U0R5K5UHz5p5ANDOowsh/aMgi0u68LJlQkxv307NXsXWVulyt/7fxTi4280Ddku9+hzHOnYp2EA2zg2SKd0wWdDlInMC0z+J03MQcfn7LtdUJlaLilH6oH4tZT5tMKqr8EoPL/JrB92+E133OZeKsDTNBzG0lmPHiPVkdk9nyepfCmKhut5uajLecn7rt2lDTvFqFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 12:35:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 12:35:52 +0000
Date: Thu, 13 Feb 2025 21:42:47 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [devicetree-org/dt-schema] schemas: introduce
 assigned-clock-sscs (PR #154)
Message-ID: <20250213134247.GB1208@localhost.localdomain>
References: <devicetree-org/dt-schema/pull/154@github.com>
 <d385e871-f33f-4133-8347-3f108f8a6736@kernel.org>
 <CAMuHMdWLWDTi1jeSOGKDAmvhGZzxAVTM-NjBJzW__1jfECHFQg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWLWDTi1jeSOGKDAmvhGZzxAVTM-NjBJzW__1jfECHFQg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc51b00-7883-42cf-6a57-08dd4c2af3ef
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gUcl+QVdIscPzcmw2QtMNZ7aungm3OLgoTsH4sMCZB5Ph1IKrd0WD8DiojDG?=
 =?us-ascii?Q?0q0xlrYAFGnbvZFvlr6LSqy7q4nCwyg2fv+GdAT9CA6HoXL9Q9UcmZmaIWLk?=
 =?us-ascii?Q?W5PLIcL8XiqYTim0q8Xg658h8yw3H8YNQ1UjmEyyTbfbW2jwXCf2RYW4a+J9?=
 =?us-ascii?Q?x6jUIse45whvkpDoyQVzTuesqPvo7+7hy+dOn5/NmNc5UZRudloFFPCR4an+?=
 =?us-ascii?Q?zXPYliVtGkHG3CJ/YlbaGA5/zY7WUFB7fFKse1BpVUMkqoaa3QZmOzcZGhIH?=
 =?us-ascii?Q?QM2T7/lb7eDJ82KSafiTdaMPqVw+KBzxzSMuHaN7Vj7P3IXqbvgMcp8cIRV+?=
 =?us-ascii?Q?7frCMsVHADRwwUgN4OKq3//fpsdBLO5WJJBnxTUjws3E8hirmxlv2jAEinp1?=
 =?us-ascii?Q?X2ss7C9BQ7xNzTa6qa2HuFR6pgQqn2YGT/oUFfMZ+vZRWQbdh3tV5ZmkmgC7?=
 =?us-ascii?Q?3ejougTbOGqilGP0zQ6zTlRiMNw/8JKLjflaGwEAiEyN+BxxtwxtC1tODoRF?=
 =?us-ascii?Q?X1wEHCcSrR4BTrUD6cvxHJqCugHWGac+rgnvH/GoTCJ15EoDag+0UQ5qjzxQ?=
 =?us-ascii?Q?b7fgm1e1d4zeDp6OIi70/FOY+6rgTTqOcrGnAPIFKW2EWU74yjX7nEGKhsKg?=
 =?us-ascii?Q?2XHGXuIZk8KYWNfCiq3VGLfotQFVJmYKnXtX924+3cx6CRUs8yF50kuOB9EM?=
 =?us-ascii?Q?Gha4ChLbLx1Rj3CrmKWB43ARL2AZ68Zcvcj/+iPokF2m6eGCZcBm2Z7SGnrI?=
 =?us-ascii?Q?dthnKRGgqLdRe5dEBMlcJtBoncNzFHqRk87KBrmxyn6W7+ktjS5r/buMdLuc?=
 =?us-ascii?Q?AMQKXPXVHBmVZmlLCGiw3vV8AyuSeOO9buCITqIfVdlFIX2n3SsNVBkRlSj6?=
 =?us-ascii?Q?PT5FfE9d3YKUhdV9v7XJtYjvNbCpUrwf2zKUB3z/o7N6flMfRQ93harBhesX?=
 =?us-ascii?Q?WFF0Dx9hJG/JzWcHI5mPxRv8D8wmo5dkGWT0sc3IP00tvAEBQ7YaG5ZR8eiW?=
 =?us-ascii?Q?A47IFAH/tK+fCNyCtGK2O+GR6Pd9BdeMjX68G55/HvF16jnzZ/eRMl0HEPB4?=
 =?us-ascii?Q?H26FCO/y3H36Dck/bwR5Mgm5qyMnSBgH7Y5PbQYIFqJs/G98XT+nRRp4wKep?=
 =?us-ascii?Q?U3n8Dky/tDLQdPVdHa3IlwTI1sxIay+1jBgMq1RDeSfYxb3YYsrWCeeu/9iO?=
 =?us-ascii?Q?4tMxzrdGcqOGN57qaEISR3QI/K7Tq9iLV/brrHhC4oU7+d3gvEjm6UIoHrzz?=
 =?us-ascii?Q?Lf8Igo8QmYsk1fEjEdzPeHsJdCF/EYfIAKXTO691VsdmFO8S2dgHoZYMpiYL?=
 =?us-ascii?Q?Nqb5EJkrMco/XP8NQWB9gPeuFkaG7cfshG8z/ujXYWncUvug89AVMOd9us4V?=
 =?us-ascii?Q?BNGUczyX/808/sPuJy+XFji/fTwyrzMdzXeqb+GqxCNGgcZeig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VoFjb3BQ5oktkdNq1cNpWROCJdB1t0i1aGK5SILufn+z2HN+MkY1nsBGYm9K?=
 =?us-ascii?Q?+rXGZ3BK9c/vgkk3XnpKfFb8kj6WT+qeV5OTaSvE/C2un9s9pNNMlP0v8BSK?=
 =?us-ascii?Q?WjixG8Sw4FO0f2YrJLJ1rguFcUaZGr3f8idxl1BDYEhwKNRejSmzSNi4K3fZ?=
 =?us-ascii?Q?4uzhLR8XAS1i64FDPvpn8k36bnliKrZ7GeFYQ3XZYyhEoxoA+N6ECWhGQ4pk?=
 =?us-ascii?Q?HegnbngX9FmJI/2uSSZWv7RiRRtLuYuC6HQozZI2v+NzuKWkX8QWoZH65R61?=
 =?us-ascii?Q?RaLmy2siAeEv8N7X22EyJJ8VYuTueJqdbXtsiqcS+12XMXMCHJZ9G/pNFQ7B?=
 =?us-ascii?Q?raCmYtPhZ3ytRCRuoPmQcxBQLxuHHm9py7Wr5/q6uUnhzprBHuwYfsxipOOy?=
 =?us-ascii?Q?+MNEaDK7oEMJ54MYWDYs8TGv0qPe7b7Co54wbecYiBW8G3YLi+LRTB2PmJ++?=
 =?us-ascii?Q?zjpbayUjDw6x12l4QO/SjzrPPnGh5HThg6k8AHPDKUgM13o45Ay5vMummy0r?=
 =?us-ascii?Q?9CEImUT0RHzf+47/WPWcA1qzieLqKqltWmqVjiK2dXdMW2iwgUkr/LQhsNip?=
 =?us-ascii?Q?9ZFIimqUBShM4vdtl7VeOOW0Q9xNhaVLGxzRluu3lVO7ngt6iY6nYyg/BRKU?=
 =?us-ascii?Q?VqeDAbKmPRjZvE1kLE5jg0rUyDdBXyPypgE0CxLw9Vkvzx/b00L2mtCm1R69?=
 =?us-ascii?Q?dz3m9nbjucAD7cbpz1Sy6CDtFw8RWV4IoDqpDL5RAma3C+ivvv+gLb8RuVY5?=
 =?us-ascii?Q?Rtodce52W84uELHs58IzUenVPM93BbklXBTa6IPP8cibSUMaGChZT7Hdr2Sz?=
 =?us-ascii?Q?69b2d+55qPXyGlGpqhZud3UCPZpGSQ/5BXUr+stquo/zoAh01NLT9byUDt+x?=
 =?us-ascii?Q?NyaJJrG1gz+/NI4gRrwNIYY7mzJl4QSGTl/L17AIiKTHUx/kwZOxHRbFBI3m?=
 =?us-ascii?Q?4OnaaiPQ23/2/yM/3U7vn+78XiLqEf0/HFhrsvp3i8RW9kvYHdOBJjEHTCr+?=
 =?us-ascii?Q?JB0Ad66xfyBVj4i6E0QVFmrX29q2cKSq1O4LyG8nkxmE4I856epik6C7TSOD?=
 =?us-ascii?Q?wr3o12xcnmwDTdhPiPrISXfrRajrqA1W2hEZXHGKEaxs3mQxpYEpfDPCcW3q?=
 =?us-ascii?Q?x9gTWFDakJ5tDP0DmwRL56vHyjwb05SIPwfM+Qd6HY2xUDKgn1YAvQ8qbMpV?=
 =?us-ascii?Q?8qo9kG0D2/bL0sxHrDf3QV36jdwPFzLj7YcUBqmiP6sJMVNf3LM9VkabeNDZ?=
 =?us-ascii?Q?kUEZ7iuh9f9MaFp6KXqTgu67jpqcY30A1+DExSoRXlRKjelzIeVlCrjl5ovX?=
 =?us-ascii?Q?iymfacFm0b0CyMAo6hAxjpTzn8YNWHvA21f2ynXn+KM8g+PyuudCt+sMBvmh?=
 =?us-ascii?Q?rK/vNX8Wudyj56426pCc4hzli8fDj0FwSEn3NlMx84BmytOjaBqiiLLSM7XY?=
 =?us-ascii?Q?5zyZtbfn0lhdbt1PjodVx5ItLxnXK8amLSEHtMyoeVW9mb3p6HxmrNjtcuk4?=
 =?us-ascii?Q?QuZlw+tXW0c6u2ZZHixFGBhCz3u9dQ52bxD/vhZflu3iBx497EBQoWxZcPCI?=
 =?us-ascii?Q?GI8liVYLSvgd7L8d0FRnUF4nmE+pIZmBZLQW2k3y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc51b00-7883-42cf-6a57-08dd4c2af3ef
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 12:35:52.2835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJ4OBTgEO3qVxBaJBRfAXL3Sxd+oS8upRh1+5r/Do24WvNW6fY6WQkJNpLVQZv4y64H1+UygRJ07GqyiQOP9Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640

Hi Geert,

On Thu, Feb 13, 2025 at 11:16:31AM +0100, Geert Uytterhoeven wrote:
>CC devicetree
>
>On Fri, 24 Jan 2025 at 15:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> Just FYI, below is a foward of pull request for dtschema for bindings
>> adding spread spectrum to clocks. As Clock framework maintainers this
>> might be relevant to you.
>>
>> -------- Forwarded Message --------
>> Subject: [devicetree-org/dt-schema] schemas: introduce
>> assigned-clock-sscs (PR #154)
>> Date: Fri, 24 Jan 2025 04:31:30 -0800
>> From: Peng Fan <notifications@github.com>
>> Reply-To: devicetree-org/dt-schema
>> <reply+ACPRLI5YLXX27TFZX2P7NVOFT5USFEVBNHHKO4ZXHM@reply.github.com>
>> To: devicetree-org/dt-schema <dt-schema@noreply.github.com>
>> CC: Subscribed <subscribed@noreply.github.com>
>>
>> To support spread spectrum clock, introduce assigned-clock-sscs, it is
>> an uint32-matrix with format multiple elements of below
>> &lt;modfreq spreadpercentage modmethod&gt;, &lt;...&gt;
>> You can view, comment on, or merge this pull request online at:
>>
>>   https://github.com/devicetree-org/dt-schema/pull/154
>>
>> -- Commit Summary --
>>
>>   * schemas: introduce assigned-clock-sscs
>
>>   assigned-clock-sscs:
>>     $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>     items:
>>       items:
>>         - description: The modulation frequency
>>         - description: The modulation depth in permyriad
>>         - description: The modulation method, down(2), up(1), center(0)
>
>Is there a way to explicitly disable it, if it was enabled by the
>firmware? See also my comment in "Re: [PATCH v2 1/4] clk: Introduce

The binding here is just to describe the parameter to configure
spread spectrum of a clk.

To disable spread spectrum, the clk_hw_set_spread_spectrum could be
used with enable as false or as you suggested using CLK_SSC_NONE_SPREAD?

>clk_hw_set_spread_spectrum".
>
>>           minimum: 0
>>           maximum: 2
>
>What's the meaning of these limits?

Modulation has three methods:
Down-spread modulation
Up-spread modulation
Center-spread modulation.

I use 2 for down, 1 for up, 0 for center here. So the limits:
min: 0, max: 2.

Thanks,
Peng

>
>[1] https://lore.kernel.org/CAMuHMdWn+sKiC1B4MF1vHwS2ArFYQXGzpYi2EcsyERPSCc9bvQ@mail.gmail.com
>
>Gr{oetje,eeting}s,
>
>                        Geert
>
>
>--
>Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
>In personal conversations with technical people, I call myself a hacker. But
>when I'm talking to journalists I just say "programmer" or something like that.
>                                -- Linus Torvalds
>
