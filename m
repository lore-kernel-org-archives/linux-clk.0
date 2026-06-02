Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011043.outbound.protection.outlook.com [40.107.130.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D031DEFE8;
	Tue,  2 Jun 2026 22:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438750; cv=fail; b=K/BKBAtmyH3jxYc3WNKiazfD+zlpGc1JRRA7nd6Tosb/WE1zDKT7JLtH4ZOIU6mKtU+67Fu6M4VaTsVoLW/AX5NIpuAdKS1pcklJxC/tbOo+xXTNRpWRrufOT7Tqi54WxLCy/V7LlFAIKita6mdy/XcUBpKC3jrFSfAQ/nvkODs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438750; c=relaxed/simple;
	bh=iTY0vYhtII9eVt5+2DLzPicp9tQqlH/1/gXJ/RA7vAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s0skw4ZCRUi+LgMbEUxh+Z7rDzYfraFrX1zGg8WfMj1ukgrxHgfbFwksKbhgKdmGX67wtlCKqYs18cVu1pKCGL+uTGD4gP78cB9BdCKC04ZiJ7BTyu9GEP2UodeY5xJl9EAcVhxSlrmImCD89ZGKlDpPgb4q0X6FaYTSCVENiBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a+qlfZcn; arc=fail smtp.client-ip=40.107.130.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a+qlfZcn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ugp1xRmz7APEeadLkptdSPkxf2iokwh49GRyMKhHLor4+3LWIBsmhIr2tDWFw8tIFojKsIsbb8jIopo51a4uolhEb1F82jFCTrwiSnx2xAzXeLhuN1CGGbAPk9TMXC4FlohkNeFw6LKHw+azkioQey+9ec+2++SBTBSQ4T8KMjor//2JMY1SHQMubLIlsUyRI3j/e7hLChmWI4ciOQwmroZS3C3kaXVM/pp02ukJOjYewp8XdxOyH81ZCoXo8R/LZFLZDa+MdUmx+ZJVHEG6tTWzAeH2dZf8JVe56ylNrNypl81GJTNRLWcSY8+bXvYV5ICH/DTqk4hz5wo0V1bubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Omhfqkx236qIB2nAVnhgrFoaGUtWgQZBWM7Oy2IRc0w=;
 b=aAxhoWWvRU6sn+QwJhj++jv9YKDoHLCI966Aw6KrkTfP/c6afMELdZQbilP6h6vzvzhSnIoOPKeeAA5LR+8GMH/me9W0VcH8gyzLw3nR0KRk9NpN9N1TDQGXtVOe9TEHhk2LnQJroju8WAFNgbNuoU0JUJAykl8PGsVWJJQkh7+wsNLC+vBCEtOxdOn93TaHL5cxUe1vA/UXq0sdou+LLytGLkbu13oOMQ/8RNwZ9aZR7L7M0htH39UVi8ua3+3hIJasAOyQ4BmkibOfRMYesRQhk08kbCt7mX1whPJXQNPtzV7obby8jaEJFs6IKPU1EewkGOgTR0uf389wKJFSqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Omhfqkx236qIB2nAVnhgrFoaGUtWgQZBWM7Oy2IRc0w=;
 b=a+qlfZcnYAdjc8Jb+LYKojhajQaSDWFvUyroZTzbI9OqM7iTx3AuNqBXc57bJjqY7gXs4g1hh+B2Ob+BcTJm0HVG9snTv6McQAeqjQZglBefvOz6HUDosrUrRYkMT8fMlBKikOJG3Ho+RqhWTEf/le+hFY7BBERHEvziYBwt3h8pKrcOcu9yOzkrQT4+jLlnL4Xb3PGZmgBlO371Hfj+Sm6mPb0Hth1d50dzu+cRBw/lBIpwlUQ81DKNI3nVDoH8cigy5C+R3QRcCKwkp/ZQBfu6vc3fCR5IFg1BRhE+IFSV445MO4RS8XGQ1o8etegPAM6SlaAhG3J75Q8aOUJo9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB11635.eurprd04.prod.outlook.com (2603:10a6:150:2cb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 22:19:03 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 22:19:03 +0000
Date: Tue, 2 Jun 2026 18:18:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector binding
Message-ID: <ah9WzQmwPrP4yWTC@lizhi-Precision-Tower-5810>
References: <AM9PR04MB8353FE81D06852D45514E460E3032@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <d2b13e51-1684-4acb-a5ed-294c8aa95906@kernel.org>
 <AM9PR04MB83538C4A07A6835FF8A74793E3002@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <20260519-macho-degu-from-nibiru-960af2@quoll>
 <AM9PR04MB8353B563519EBC1AD6C5BFE1E3012@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <e23a610f-e1ad-4536-80fb-8b5707e77f39@kernel.org>
 <ag3GMdmxw60B15Oe@lizhi-Precision-Tower-5810>
 <74eb56fb-546d-4b2c-9bbc-01a40937f5d3@kernel.org>
 <AM9PR04MB835333895276201A81251210E30A2@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <8046287e-87a2-4d18-ad3d-248620a752a9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8046287e-87a2-4d18-ad3d-248620a752a9@kernel.org>
X-ClientProxiedBy: PH7P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV2PR04MB11635:EE_
X-MS-Office365-Filtering-Correlation-Id: 78fdac8f-bb93-49f6-35cd-08dec0f4f33a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|19092799006|366016|376014|38350700014|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vaegt5ztkde8tTnLVIAH/a2X8uG3kEsnJq1Ua9vhOtKNuQVSCypoo0kjLbhyoCk19JR1NAhoL0onq4/QWNFMn138VA6u8THlrPh/YPWsrN1IYrJPF6MP+nRtvwxA+E7IahLGFzlcJjc8E2g6xsIpuLzRQX4xdRVJZvpDH3Reg1kDZeog1zD1OqLVokZg49nDPHFOA211FqGaDIpVR2Sf/2ImGzUNf3K3Xyd/B7bQNO5eor2i7vtQt1XRHCa6fDCz1QZ2fJeavjctYbbZQ6DAAmwdSPycPZcNqtQRWPr/+tq6dP0PTvDK5mv+EOESt+7nq1l7kP1DdVtf27WmF391cUpB3Qtcq5yNcHbVhPZ1Z/9wENL4PbmrF7oDrHRirnV/rcUgCWoUkbZ9p7A0T6FlHnUrz9xgP1Hy05W3EFnVGe1ylWCj6FIgn0H5gvxDdqwYVKc2wlt/qH0HVZQZyB788qzAcOA97WQw7pH/4Y0RGt0fuHjs4p5XV6D8XTp2O/vCjo9ijsuh1V5r59ttEdCxuUq+4Pc9UGJAZ5jg1l60g4r0bKzGZW4e4/6YXqA2UTPuw7m8lx180iWDtYSEyhdDfaL264qi6BR7X8+0qNRRsXDgTyy2v5dE3wV0ANbbc2IZblFI0M42PvlLut5qVy5ySxp0VdoS9DY18BwXHpXqU5418I071SMafYYdpyanUCXpu554sTtr0ag+PgP+XRIv9JjY5ohNPFEpJRNfDmME7C0TZWSMLN86JAfJSwTWYsnN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(19092799006)(366016)(376014)(38350700014)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWJVZFBYQTJpM2FGWHR5cFpwaW9MKzBGK05MRWc1VVkvTWtmd1l6STBPalE1?=
 =?utf-8?B?M1VyNS9vMkhlQVJld3hqK0JoS092Z00wdzBZb0E3RFdDbFY0L0RZNlFvVTMr?=
 =?utf-8?B?T2tVQ1VtaldXdlB2bGVLT0VnZU4rcDZOSjdpS21oQXd6cU1OeEx1aU9IY3dZ?=
 =?utf-8?B?L1A2R2VsMU9ud2dCRk9BTjFpY0kyZGlBVDJGVkM5RjFtck1SczFzNGQ5MUZJ?=
 =?utf-8?B?RW9RRVJtVTdTRklHTVJpQ3pxZG9QZnlwQWtMcGhEcUdoR2dhaG5GanZoNHFI?=
 =?utf-8?B?bEV6SXlvOGdDNkk1ZTZ2WWt6YUlSVnB5WVphRkY5UTFsakt0bWx0U1NrNHBm?=
 =?utf-8?B?bkROOFE2MkpZa2ZRa0FGeDdITkc2SjJMSU1ZMHpIL0x1K3hYZHBuZ2xKL2Rn?=
 =?utf-8?B?Z1JHeU5xcGIxWmNHZ0tqSk9hem9RWnNpaDFZdTA3ZXBReFJ3dXlHbFE4cm5N?=
 =?utf-8?B?V3pwRVBPSzRlQmI1VDFqMGpiZi9HaUc0K3piZCtaaFNWZ3hEditmYWtZTlFw?=
 =?utf-8?B?V1dQNnk5SFNndGYzTDErU3UwRTVLWWd5dFdoR0FQck1oRGE0dEtlL1o3eUww?=
 =?utf-8?B?VTM4TDY4QXhpZVhvc2Eya09rYVhEbUFYQzBkbnRFbVUzSVpHMlBtQUNVVksy?=
 =?utf-8?B?QUJVNWdsV3FsNGJ3VEEwRlYvTUsvayt1UHE2OE0xV2p4WWJMS3owQ3BEYjVt?=
 =?utf-8?B?M1J1MmJSVzFmdnBINlJUUTFGeWZSTUFTRmN3TzFwUzI3aG4rdFI0MHFMMVVw?=
 =?utf-8?B?dDNaM2RncmhiNE9TOG5PNlI4cXZpcXkzV1pKZHZhT1dzNHRGbFRzTHFmbUcr?=
 =?utf-8?B?Nzlrd29DclV4Uy9FejV4cmdMeGwyRCtVRzFhSzNteXhMWlkzODQxci82SVhZ?=
 =?utf-8?B?WVMvempnaGwyZ0pMMU1LTCtIV1orUEJhWkVMQnNYQm5idkh1VjNUZDdMdWIr?=
 =?utf-8?B?RmJXL29KZ2cxNTMwYlMrVjJJdzlZUWFmaXhXZlJqdUpVN3JZbmVlQkQ5c3Fy?=
 =?utf-8?B?b2wyMHBTQ003a1FKOFFEbDJMVlZ6VlB2azRaNjhVbmZBbEVnc1VrYlp1QWwy?=
 =?utf-8?B?YnhmejU2cmxWajhzTWw3bmU4ZTRBc3RzalpKQWZlN3VQY0tWS2t6MWNSNTRV?=
 =?utf-8?B?ZEZ1cTB2ckgweUwyWmZwVnU3OUJmVzZHSzJrTnpjekJwdkdjMnZacnFZYlY3?=
 =?utf-8?B?Tjl6V2FmUFc5dVM5bUt2VUt4eTRWSDNoMitPRUU4dmpQYjI5SWZpd01LUW9z?=
 =?utf-8?B?aTFIcmovR1hrbTZpaG40UmE1Wjk4UHJ3VHBTT21menNtcmhxbE9pRm5ORGow?=
 =?utf-8?B?VDJoVnUwbnJJV3Nzd3Q0RDhrRUlMTFZSU245UTNPTlBqNHBRSng4Tzd1K3JE?=
 =?utf-8?B?S2gzYXkwSHJDbTNhSm9wZFhHZ0xUT3Rmd2kyQ3pucUIxNFNKNEFTcVZNUk9w?=
 =?utf-8?B?S09MM2dUY2p2WG15cTFVd0ZUaEtUSWw3eHdJbUtUZHUySDRCQUtuTVR1M0lV?=
 =?utf-8?B?UktpR2NEWmRZalYvNi91Q1lRUldScloyODJmcEVLenF0VWkzZDdhK0NnK0dx?=
 =?utf-8?B?VVRPc00veFFrWVVKWGdzOE42SWtWdVd4YTVPbFdtaExXazRleXhJZWFBbU9H?=
 =?utf-8?B?eUF3QzdkOGtJSmpNYUFKM3RGeTB2OEVHcFYxOUZCazJvcWFHM09DVTdGa1pL?=
 =?utf-8?B?bVNPc3NXVjBydWN1YUF3bUlCMTM1WXV6V0cvUDdDdStxcFdJRXBJWXZOUEQ0?=
 =?utf-8?B?OWozandGWDFKMWNmMzdra0ZkamU3Nnh5UjJDT3VFL3pUZmh0c1Z4V1dSSFBT?=
 =?utf-8?B?ZFF6TUJLeDRIbWF4RlNIcXFmQzdlOFVzZStLY0FPVlpYbDM5bTBtamY3ZGJr?=
 =?utf-8?B?S1hpRllDSTRsUkxOQlZyL01KakZNOCtYTnRWOVBwYVJXeXFqWE12U2czc0Ny?=
 =?utf-8?B?S1NXd1pxTDlncE1CRXhQV01mY1JDMEFNNDhFRHpxTjUwalJkcHcrb3h5RmpB?=
 =?utf-8?B?RENQMHUxUmFianpJVXNKb1FkMmliVzdJV1ZnZ1pPMm5pc2VPTlI0NHhmemZG?=
 =?utf-8?B?bnBQeHY1Ylc2Um9ybnpFQnBHTzNUdzVnNzFHNjFBQ29PcG1DN1lkOG93WGNP?=
 =?utf-8?B?aGtod2l5SXB2K2Z1empzbEZJajVtLzlhRXg5RUxtcFQ3TEpPaHZ0N1VBR1Na?=
 =?utf-8?B?UGJoTlU2T0F6MFdHWTI3QXN1Z1hQQTRabFBkUFFYeDdtbmNndm9lams4NXpV?=
 =?utf-8?B?Qk5BaVBFN0RmMUtOMzBhb1ZsZnlRaEpLMEZMMFpvZFp3WVVFRytXTXpUdThQ?=
 =?utf-8?Q?PcWMRnLWqhlozEWDqN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fdac8f-bb93-49f6-35cd-08dec0f4f33a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 22:19:03.0240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11s59cGKnfzefv/lxGM+jK2wdn8EeCbJbFdCU1tyAiw4vDKPOdVUVW80+21w9s/+ymKJz7XpSCdNS4tWzuBVJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11635

On Mon, May 25, 2026 at 02:28:32PM +0200, Krzysztof Kozlowski wrote:
> On 25/05/2026 08:26, Chancel Liu (OSS) wrote:
> >>>>>>>>>>> +description:
> >>>>>>>>>>> +  The NXP I/O connector represents a physically present I/O
> >>>>>>>>>>> +connector on the
> >>>>>>>>>>> +  base board. It acts as a nexus that exposes a constrained
> >>>>>>>>>>> +set
> >>>>>> of
> >>>>>>>>>>> +I/O
> >>>>>>>>>>> +  resources, such as GPIOs, clocks, PWMs and interrupts,
> >>>>>>>>>>> +through fixed
> >>>>>>>>>>> +  electrical wiring. All actual hardware providers reside on
> >>>>>>>>>>> +the
> >>>>>> base
> >>>>>>>> board.
> >>>>>>>>>>> +  The connector node only defines index-based mappings to
> >>>>>>>>>>> + those
> >>>>>>>>>> providers.
> >>>>>>>>>>> +
> >>>>>>>>>>> +properties:
> >>>>>>>>>>> +  compatible:
> >>>>>>>>>>> +    const: fsl,io-connector
> >>>>>>>>>>
> >>>>>>>>>> Everything is IO. Everything is connector, so your compatible
> >>>>>>>>>> does not match requirements from writing bindings.
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Yes, this compatible is too generic. I will rename the
> >>>>>>>>> compatible to fsl,aud-io-connector.
> >>>>>>>>
> >>>>>>>> aud is not much better. Which boards have it? What's the pinout?
> >>>>>> What's
> >>>>>>>> standard? Is it described anywhere? If so, provide reference to
> >>>>>> spec/docs.
> >>>>>>>>
> >>>>>>>
> >>>>>>> This is not an industry standard electrical interface. This
> >>>>>>> connector
> >>>>>>
> >>>>>> Then if you do not have standard, then you have board specific
> >>>>>> layouts thus you need board-specific compatibles. You can use
> >>>>>> fallbacks. Generic fallback could work, but both io-connector and
> >>>>>> aud-io-connector are just too generic. Every connector is
> >>>>>> "connector" and "io", thus absolutely anything can be
> >>>>>> "io-connector". "aud" improves it only a bit, thus honestly I would
> >> go with board specific fallback as well.
> >>>>>>
> >>>>>
> >>>>> How about board specific + common fallback compatible like this:
> >>>>>   compatible:
> >>>>>     items:
> >>>>>       - enum:
> >>>>>           - fsl,imx95-19x19-evk-aud-io-connector
> >>>>>           - fsl,imx952-evk-aud-io-connector
> >>>>>       - const: fsl,imx-aud-io-connector Since the daughter board is
> >>>>> named “IMX-AUD-IO” in publicly available
> >>>>
> >>>> I don't think it is named like that.
> >>>>
> >>>> git grep -i imx-aud-io
> >>>>
> >>>>> documentation, common compatible clearly indicates that this
> >>>>> connector is intended for that.
> >>>>>
> >>>>> Also, I want to talk about the topic of generic connector. It's a
> >>>>> common design that daughter board is connected to base board through
> >>>>> a connector. This connector more often acts as a nexus that exposes
> >>>>> a constrained subset of GPIO, clock, PWM and interrupt resources to
> >>>>> the daughter board. Can we document this kind of connector as a
> >>>>> generic binding?
> >>>>
> >>>> So this binding is the connector between carrier and some addon? Then
> >>>> you don't get a compatible for that at all, because it is not
> >>>> necessary, not useful and NEVER used. Do you see socket LGA "connector"
> >> bindings? No.
> >>>
> >>> Not exactly. Any connector connects a carrier board with an add-on
> >> board.
> >>> The key point here is that this connector type is reused across
> >>> different boards, even though it is not an industry-standard
> >>> connector. Both the signal definitions and the mechanical layout are
> >> defined.
> >>>
> >>> The same add-on boards can therefore be reused across different base
> >>> boards that use this type of connector.
> >>>
> >>> There are also GPIO mappings involved. For example, pin 1 on the
> >>> connector may represent reset-gpios, but it could be connected to
> >>> GPIO0 on board A and GPIO1 on board B.
> >>>
> >>> Without a connector definition layer, this would create an N × M
> >>> combination problem. The Nexus node discussion already covered this
> >> topic:
> >>> https://osseu2025.sched.com/event/25Vrw
> >>>
> >>> An LGA socket is a CPU socket, where the signals are completely
> >>> transparent to software, so it is not a good comparison. A PCIe M.2
> >>> Key-M/E connector would be a more appropriate comparison.
> >>>
> >>
> >> So the terminology of daughter and carrier boards was confusing. If this
> >> is a hat, mezzanine or other addon, it's fine.
> >>
> >
> > The IMX-AUD-IO is an add-on board that attaches to the base board. To
> > make it clearer, I will replace "daughter board" with "add-on board"
> > throughout descriptions.
> >
> >> I still insist on board specific compatibles - fallback and specific.
> >>
> >
> > The base board has a slot component that is mechanically compatible
> > with a PCIe x8 connector. However, it carries no PCIe signals and the
> > pins are repurposed to carry fixed board-level audio I/O related
> > signals.
> >
> > I think we can name a compatible reflects a standard mechanical form
> > factor.
> > For the compatibles (specific + fallback) I propose:
> > - enum:
> >     - fsl,imx95-19x19-evk-aud-io-pcie-x8-slot
> >     - fsl,imx952-evk-aud-io-pcie-x8-slot
> > - const: fsl,aud-io-pcie-x8-slot
>
> Does not solve my request, so I won't ack it. Maybe you will get ack
> from other DT maintainer then.

Krzysztof:
	Thank you for your support. This type header/slot is difficult to
name it.

After read again previous comments

"Then if you do not have standard, then you have board specific layouts
thus you need board-specific compatibles. You can use fallbacks. Generic
fallback could work, but both io-connector and aud-io-connector are just
too generic. Every connector is "connector" and "io", thus absolutely
anything can be "io-connector". "aud" improves it only a bit, thus
honestly I would go with board specific fallback as well."

Do you means
oneOf
  - items:
      - enum:
          - fsl,imx943-evk-aud-io-pcie-x8-slot
          - fsl,imx952-evk-aud-io-pcie-x8-slot
      - const: fsl,imx95-19x19-evk-aud-io-pcie-x8-slot
 - const: fsl,imx95-19x19-evk-aud-io-pcie-x8-slot

Frank

>
> Best regards,
> Krzysztof
