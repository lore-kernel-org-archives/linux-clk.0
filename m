Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85281519AA;
	Fri, 14 Feb 2025 05:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739509736; cv=fail; b=hTPUV2ti8fdLhZf2RU2yNZRqEm/KxTZVNEVTnPSbWGcPM1n2pUu3gZClNTAM/H8iYYK3bq5JuhfCe92xBmmGNDszNekqo7sll4bAw9wGbnbZedf6W5gEB4ff9nNm2o2IjmtwA8gX3xz0gJ9WmumytTIOj4KyMmSSYCjEiEyS+Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739509736; c=relaxed/simple;
	bh=GlJ/eBcNo+kCc+vuaMLkOiOOSkSx5sluDkzCu98qPWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FjfT3MgmSNpfBN7LCp4J8cUWsLzqrp1Duop253itASYnngOQEcPsaYO4k3feD/T2G10OoHYooZO8eSNYkYni/kaSzLNCgLPfmG2voupQEn7kSLV9L14lIPmTo5Fsv/r/+LVsMgzay5absuAkMdjXJMoVz52aDQSayqRCmZpAjQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=yDWlhNId; arc=fail smtp.client-ip=40.107.20.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="yDWlhNId"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKpWROHccFErqye9c7Y15ANTiGSYxRuJvVreLPZL4KkR32u1M4N/VQJdi7Ne3IxFlN3Cg6nZErx0dhVnQI8oMaeF2iD3F9IppYD6bb+cn/4Jzsa7hsSGc+TPdGKRH3dkSKJGImWq2x/b0C6sYNZtBZsqsQqqbZJza7kR1ZmSB66Pv/hD+yV0qNqICrInP6sVCh/zii9QlA/sNaijUAcp2u1UBANmHw3a+ke2t6FoNnmtiM5KofgPtSYCeN5PpmUSlz+UGssfPCJRbADeeS17GB+hRokvePLmYJ1KYja4o5L8PMQorO4OFSIZql0mlxX5wYwgs5c26VCm5GbCUbvzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5pSaPO52CqZO97GOXa/mqSB84NFaKMq9B6+LChsflA=;
 b=DXqxbiGqgMHcikdH65ufv7pwrC+MaqNBTchL9/oz/6GbcKoroktQwyIhWdS6shvIfFWLpEUcUhfct+xO0OI8CPV0ISZsx+eIttdDwih9CYwiXiSnWbpZ0BnDFvXIWWUf9LEvKHEfaOUkrh8iMk8h7qYMP+tO2XGgqJhdimv+YJUbhd5MIZH45YO0b/4lPz82rhuX7SBZ6E8+CbcDUmMv/hhQo9yVbqacuYGDZGb5ZpCT73YRjpYbyE/OEEBJKeSGLQmHktNrEnQE6JWUQmNGADPSzxovBoTHzP+lTJlkJNpV/CynYoGMrYip5SEdHnRygqeU0So3qGksvskDItJc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5pSaPO52CqZO97GOXa/mqSB84NFaKMq9B6+LChsflA=;
 b=yDWlhNIdzL9M8l25z2lkUqtjciDyHjgKYZ26lG8gWsGOTGmXaYxY9HykQ22lNSQZNuLzuIoKsCiFtnwoKuSnK0vvSLXl4KFAW4TWSbtwg6dRWYLJYvfbMPiSvMEJvmZ4QZ6cDWaTSpC/iiG5A/szV9wT5v4JEc+poeaHX1Zb55jCO4yUv+AeUfat0ByUOCvMojFRvgxBSKMQPwsUl0xpFcIK7eL6byu516vX+aptdwQOP60O49OGyg8eVnCCBTbhj21Cl9s54YkIAWEkLibrHKx3TpoWtnU1y+8Lr+Vz5DZsJy2xOllCH01rg0t1dQ8GBx6pegslwrsQ2k9CRwI0SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10474.eurprd04.prod.outlook.com (2603:10a6:150:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 05:08:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 05:08:48 +0000
Date: Fri, 14 Feb 2025 14:15:41 +0800
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
Message-ID: <20250214061541.GA23652@localhost.localdomain>
References: <devicetree-org/dt-schema/pull/154@github.com>
 <d385e871-f33f-4133-8347-3f108f8a6736@kernel.org>
 <CAMuHMdWLWDTi1jeSOGKDAmvhGZzxAVTM-NjBJzW__1jfECHFQg@mail.gmail.com>
 <20250213134247.GB1208@localhost.localdomain>
 <CAMuHMdX78GBk3Fm-USGgGyCo+Fy028qccLrDuE1Vrkw=OAz1Vw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX78GBk3Fm-USGgGyCo+Fy028qccLrDuE1Vrkw=OAz1Vw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10474:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6af48e-6e3a-4448-430a-08dd4cb5a9f9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yhVSHxKLBQu5fduDRsgjNRgYGEtcxgGA6GaKR3Z93+kHsEWr1OcKvC/c9MTP?=
 =?us-ascii?Q?bwQ4wN4jy9fC3W92Leksy2SIYCyMAOnhyCUv0NHYgPLQAdoZs5TdVlkwyiJh?=
 =?us-ascii?Q?z8YQ88z5N83le/QpM7V4J6clzS/2+mm8mnkrvPexG4nL76M/Z8f4IV8PCxPZ?=
 =?us-ascii?Q?RAJALAzEfZqa7hgscTaD+TyqWo50r/oO7ypAx716GhnsqRmMJXpTafWOkcQw?=
 =?us-ascii?Q?UE8izPO/EdnK4CxjYqo1Ss11FFYDn5pP3Ohlp5pftdoupoU28wCdd0Ua8kOz?=
 =?us-ascii?Q?jHUTBazjAzkLCpc/aNJHdjfRK7v9rnR8QpdpNWUSCXjyjxrOfeWPiZtIgv6J?=
 =?us-ascii?Q?f+dhsP3tydlQBsJKJhI9WMihqatkzeOjx/QV8QSKK9FQROxkfdoTTa3aVKBc?=
 =?us-ascii?Q?MAEoUpRc/rnjp9vQRD6TW1kH3IsyxwINzTWFfSaRKs+cbIDCAcN3QfdUOU/6?=
 =?us-ascii?Q?wC/rAzEEtw8QfpcwAWJzHiU113mM0491sGjenLeCekAP7phAJGf37n5KcFkg?=
 =?us-ascii?Q?cRRnI2ieZ4qRuWA5Pq/WXw9vRGMVfV5cktZDZT2LGZMF9zOkjNSI7dpjh6Gw?=
 =?us-ascii?Q?Q1/hzXynXnMWjX3tgA3cy90Cn9ehpJOdd4+yt3xeV4MFhj0t1gKcC6FfEiPT?=
 =?us-ascii?Q?jmG0hEQuB7HTpFvbhwVOZcsIaxhVcuH1erdXCKQ5KyGDWNAuHDStacQVYtsv?=
 =?us-ascii?Q?2AD2Gl+gwupyPv3mKVD5e/kFkmVlw9LQBlZhlDdlx3lzhnpdgMsuO0BWyoZw?=
 =?us-ascii?Q?NoaYYAhW9RZ9K2by2aZPNa7iLaEtWBEC8+a7zDPua6Fb4FLDJXTQBtoTjPnO?=
 =?us-ascii?Q?yx3pmEHU4D5rIbuvFISjH9Vkp6D0FPF75b6QC4vOsj8Tff9+mhGeiN55QVSc?=
 =?us-ascii?Q?I3F4snhxw4+ohK4ca/0y4TGp7bgKIkUQNUIc6XzOPEhBjVgXSVN0Uo4TNrid?=
 =?us-ascii?Q?LUQoeCnJvOxYMXl05BWzLKrrhaJAi7uSLX9lxtl2o25UcKkouT3dT6kF1gx5?=
 =?us-ascii?Q?nIiYADWlqzPIM4Rv6p6udLOkAod59GcSYQJ6RW8q/C04Zv8RU8ZqLiWovxX+?=
 =?us-ascii?Q?HPIYHXc/HD2NkvuYMCQ+oHaRgJfsZwP4/d83Bs6v4rLrx8XEZIZQlnxKbziD?=
 =?us-ascii?Q?KTsIj+B2dpUFojvqQ10P3fDY06k2SsrWIGSkhUxv/1xq1gPa8CaHWgV2GS4V?=
 =?us-ascii?Q?kMqayqP8svk35xhjabJwp7vk5z8utiE3AvNEu1hxUbENJ9Xa498Wo8vDRoFH?=
 =?us-ascii?Q?x1btkWPP2gm5/50GyPZ92vO7xmhxhv780Y3o6qzxyegkC0w77EWGGUe7pDcD?=
 =?us-ascii?Q?+9naHagj61zhhMp3tpxX0Xvns/Xd+BZYRsdLTohHLyos9a8Gx7T0q+qlTVW1?=
 =?us-ascii?Q?E5M8p2ZK56ieoX/zUKdeSZAnRRO6JXSv8MlLQ1UHpd/u85/5SQUp2rS3TCiE?=
 =?us-ascii?Q?TUfXo5W/cMZ2Q9H7At+Hi/WGRBM8+50E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jyHmT/Wv9cfNKlq+LdgrvSMNEsJYv6oGioOjm8HiuSa6XFD3llyLagpSB/Cy?=
 =?us-ascii?Q?yT/LBrsXbM/wuWD2lqpljE3VYktY8graUXS16Q+1KMlB87Ub9QCD3RvVitMl?=
 =?us-ascii?Q?DXaPchT8SrWKPPVWt+7T7vPycgb3YfXFEpdHg6u/J9loQVKX+MEK+8lvSZNL?=
 =?us-ascii?Q?RyDrSL3V2srLmf+l6B6dwPykYFP49fLr7ZkgLwANZ1qOnAaWE6+7M23qA+l+?=
 =?us-ascii?Q?KRTPKwMoD4w3ev+kEt8TPDWNz0iuFT5EOM9+KnfwJT6+vEm1K6CoRdjpiDEz?=
 =?us-ascii?Q?Pb8H/CGoOm+ASNbSZitN1Z5uHyR1bVBB/i87UoHa9Z+xXTV/J6PGI2CuJyv/?=
 =?us-ascii?Q?mv8w5GbZCaJAu35Zh9GKwWMSwNOfNP+oIqszwkZyaqAF5RTJYzxKveWCD8cJ?=
 =?us-ascii?Q?7JUpwwVzk7DHBFLlXsgIkO7FIRIB2GRPGBCqb5rOW+eHYu49smI8vI+fAGcN?=
 =?us-ascii?Q?K+aa8A3yhKE44AUjYxbSE9d29Qf7hrtuCkpcEgCfouaYMS/6M+2BakdiNoym?=
 =?us-ascii?Q?VsDzwgEsa4xpqUprUrCnWaZkoMVDipKFEq4/Ek8c1iddM2XPHt5YhxihyD+Z?=
 =?us-ascii?Q?xLKlgybC8c5L2+SYdnYtl2d5iDXXXV7CV4wSbwPIAUmwohYWLW0OPKuMCx1n?=
 =?us-ascii?Q?k8UE5eq5f9T8P6KtpR9xW3d51z8WwfiE0zYnGw7aZJCXXOJoKwqVdulN/1SA?=
 =?us-ascii?Q?F9oahC/xW2gyc8ooDqhUmAMLdojgLvkHcdFEEIJKMPZ4OpYulrH8V4AWfK7g?=
 =?us-ascii?Q?CYMFdqVxANWkKm0gaSmBoeHHa1VsddOiUZ2ZNXipJWQZh5Tjh/Cw1mzqR/vy?=
 =?us-ascii?Q?/0IM6KfHxc3WtnONz21jJShJYJRt/00JZ8Gt6svUKsUBeFyiibiGcS6cjc1+?=
 =?us-ascii?Q?veFCALGk9KRUJKeaZyGGnlEjPd6s+MfaV9c4r/54ksJfaH/aSDeKKsHdzdum?=
 =?us-ascii?Q?W6OU0XFbO4SLUSV3euiMZWPZsjC8/QsBwCxuAosQ3RZv3UhZh4gcbaM41WP6?=
 =?us-ascii?Q?vLos8nnPbUcUdsLHiMxVKdlKxNTxzEH2wXUp21S7Unvef2RmW2xvYLLnGppI?=
 =?us-ascii?Q?Uyc+5sn9szod82Jvo37Zts7B5MpWNGAD+8gDNo8JdU/mCm5MvqEufgcz7rbf?=
 =?us-ascii?Q?bsoFbYcQfrytOX4Z6SWWU2SDh2IQMi2ofX1Bhw1o0c52s85nzBxZ5wj+4Adr?=
 =?us-ascii?Q?iin6XBKaROkI4TW/JKuPnrCc2PQOBjI2HGRZneWNvTOsS3Cy5N7vpwyiDR8r?=
 =?us-ascii?Q?h+o6DpvIIQ16RdOYqLLASkGAS6RnRvf9c5u4bEh5z8jUWVDjB/WuUWSd3Mhz?=
 =?us-ascii?Q?zkYRYvnilhaNHT+/LUZc21jbEK2l+3TKx5GbE4d5sV9yqNiniqSuAfjyf84F?=
 =?us-ascii?Q?VUrmEg6q+X3ypWJREQXvzP9x8mq8DdU0hhrpPqS5W6u2ZpGiiQmxG/8CFbEK?=
 =?us-ascii?Q?Qh1SevCzUMw96U6oKrM8fyS/K+UM1Ka1Tt7+ITxYTbotD3glwrzM3hiCGv+Z?=
 =?us-ascii?Q?O1Oh6GFOzFkEIbCjOUDR7wuJ7AejcV20ClOuzoW9PTN2/v7xn6ie2Fo1kqF7?=
 =?us-ascii?Q?Ev2Znuph1NtcOSRhxUuXcUW7EWViWLFGL/2Ynm97?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6af48e-6e3a-4448-430a-08dd4cb5a9f9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 05:08:48.3491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2wNlVPU5CyccIp5+gOTgSPQsJ9gnyBGLSeCKV3h7HlUfZlI/3MKt+eFMpRsMkq5bwzqGQre6V8wxSBRNUdQng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10474

On Thu, Feb 13, 2025 at 02:29:41PM +0100, Geert Uytterhoeven wrote:
>Hi Peng,
>
>On Thu, 13 Feb 2025 at 13:35, Peng Fan <peng.fan@oss.nxp.com> wrote:
>> On Thu, Feb 13, 2025 at 11:16:31AM +0100, Geert Uytterhoeven wrote:
>> >On Fri, 24 Jan 2025 at 15:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> >> Just FYI, below is a foward of pull request for dtschema for bindings
>> >> adding spread spectrum to clocks. As Clock framework maintainers this
>> >> might be relevant to you.
>> >>
>> >> -------- Forwarded Message --------
>> >> Subject: [devicetree-org/dt-schema] schemas: introduce
>> >> assigned-clock-sscs (PR #154)
>> >> Date: Fri, 24 Jan 2025 04:31:30 -0800
>> >> From: Peng Fan <notifications@github.com>
>> >> Reply-To: devicetree-org/dt-schema
>> >> <reply+ACPRLI5YLXX27TFZX2P7NVOFT5USFEVBNHHKO4ZXHM@reply.github.com>
>> >> To: devicetree-org/dt-schema <dt-schema@noreply.github.com>
>> >> CC: Subscribed <subscribed@noreply.github.com>
>> >>
>> >> To support spread spectrum clock, introduce assigned-clock-sscs, it is
>> >> an uint32-matrix with format multiple elements of below
>> >> &lt;modfreq spreadpercentage modmethod&gt;, &lt;...&gt;
>> >> You can view, comment on, or merge this pull request online at:
>> >>
>> >>   https://github.com/devicetree-org/dt-schema/pull/154
>> >>
>> >> -- Commit Summary --
>> >>
>> >>   * schemas: introduce assigned-clock-sscs
>> >
>> >>   assigned-clock-sscs:
>> >>     $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> >>     items:
>> >>       items:
>> >>         - description: The modulation frequency
>> >>         - description: The modulation depth in permyriad
>> >>         - description: The modulation method, down(2), up(1), center(0)
>> >
>> >Is there a way to explicitly disable it, if it was enabled by the
>> >firmware? See also my comment in "Re: [PATCH v2 1/4] clk: Introduce
>>
>> The binding here is just to describe the parameter to configure
>> spread spectrum of a clk.
>>
>> To disable spread spectrum, the clk_hw_set_spread_spectrum could be
>> used with enable as false or as you suggested using CLK_SSC_NONE_SPREAD?
>
>But the bindings don't have an enable flag...

The modulation method maybe updated to
down(3), up(2), center(1), no modulation(0).

Then no need a separate entry for enable.

Thanks,
Peng.

>
>> >clk_hw_set_spread_spectrum".
>> >
>> >>           minimum: 0
>> >>           maximum: 2
>> >
>> >What's the meaning of these limits?
>>
>> Modulation has three methods:
>> Down-spread modulation
>> Up-spread modulation
>> Center-spread modulation.
>>
>> I use 2 for down, 1 for up, 0 for center here. So the limits:
>> min: 0, max: 2.
>
>Silly me, they apply to the last description...
>
>Gr{oetje,eeting}s,
>
>                        Geert
>
>-- 
>Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
>In personal conversations with technical people, I call myself a hacker. But
>when I'm talking to journalists I just say "programmer" or something like that.
>                                -- Linus Torvalds
>
