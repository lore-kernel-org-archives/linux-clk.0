Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF8B2BE7AB;
	Wed, 20 May 2026 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287615; cv=fail; b=uL9YQtaarAF4tsaX7MPS6+XHHE4qhprpKlJr/PuEipnhU04OGc3V5KMl198ldRI/jhfN0aWpLJQW6HIcrOXBPzQdsXoCCZzwtiN6jC4d5OKGzaXHdy7WFE8vKX3XLsHdV+fyFyhJtxHtNc7q+Fd2ghMc4n6KEYktHIx0avh0NEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287615; c=relaxed/simple;
	bh=AE6G4NYJEV0SBtRPmzSREIAyfIX0jhPBwH8vx5+JUnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pDhfIoGlCqkjI3nCjgG5jgVAmjtNJ5GcOidkVEspn0PUikuxt/naSPJpfn6+OklgqfrGjh3JaSozD2DxUy566jpCP+YADwL5Wbxscui1w2JVn2dgHQCBGlu4zFmWdUXtXNQ5yvUxsU+nV+gVir37QktCBTfW5UlV4wcp3DtKZDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aDCa/o0P; arc=fail smtp.client-ip=52.101.84.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aDCa/o0P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RleDAGmdC3mwByWL96dKKuw91CNnsAJY53RVyKXIh0AAm+Ni7Sj5x54eDx+aAYUVYvSRNyYrY2xemcVL76v5HqgQvVyasS9153lZTBi9jgesagCPeQ4pies0nZ7t/i4gd5Dl8K6uu5hkn2pCvSG93s7v8AGzE3mCHE2XmLHirwAaEzFDmgoFLzIA/XfZnbz79tQElWRVisRXa/z1X7YJmNvRDXfbhb+b62nwpnCg0wUsPJ+dCEop5u60ThpEwCn1zJAySFKcdQOx8XlN7uH/w5D53ub6g0YOmCRkRWvX6j9UDy3FR/1QYGRKLoYcRKtwLR+uwjYleSan4bZWKoLMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqnho9d3n0Mc3dfYHNxqYOQNtijksR/m5fgVFiA60Tc=;
 b=iGptMGkPJ5rLj9PtiilmSmNycnxp3sDvmOgfXYnmSxntsj7pBfCweJ+0N3mW3rO4pA/nEZgJi76f7rUvKwP8oLM72yeJNgtRs3rXimnwlbYpDyi9ko+XwWu0gwnH/FGWrUKxVQMrBflqhPHQNcyOSErykZkbGy+RtsKQuaXNEXEXjjjvtUc+V7sd+FzjpjS4EXFw1BnayHl23pz8bfeWrhHy8x1Xx16NYJiUUNUOaWqhz2lHuSv8USavOBz1qMTZylh235AuXLVrda3npnxUrU4u0x2h479HzmQyPhugHqCFRmHDIvqDIFwzlR8X9d22gMPWM4Zi27iXymPCPtaORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqnho9d3n0Mc3dfYHNxqYOQNtijksR/m5fgVFiA60Tc=;
 b=aDCa/o0PWaXXfrpZo9mq5a3RkTcIAcpjPdpB/ySyqIN1ZI1H/cOs/PXSzvh1hPuS470pR4K5UHkuiutXf0itH/ryTeLVcwT/g8LMqYTBzmjgDQIfaPInuHBuH3OEVnf0HbAuiXednUVlZpkXN+ddoAGRVQ/rDRn1ou7Xi3we+evfGTTD3agG2WFGl3O0meYV2EmcrQpsVHAXWn/3r9FpYZzR8wdsQgpqhcqAz4VyYeoPT6Ra4oFfqk1ERkFIKauP84NxFqVvEL6J/iXheHNAG/j+V6wiJCnN5GTqxP3KaKEv3dCL/JlMa6/ixczpT5Yb8ZAJwputECMmeULD2wyGRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10566.eurprd04.prod.outlook.com (2603:10a6:800:268::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 14:33:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 14:33:29 +0000
Date: Wed, 20 May 2026 10:33:21 -0400
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
Message-ID: <ag3GMdmxw60B15Oe@lizhi-Precision-Tower-5810>
References: <20260509024846.2094049-1-chancel.liu@nxp.com>
 <20260509024846.2094049-3-chancel.liu@nxp.com>
 <20260515-resourceful-singing-roadrunner-ce25ec@quoll>
 <AM9PR04MB8353FE81D06852D45514E460E3032@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <d2b13e51-1684-4acb-a5ed-294c8aa95906@kernel.org>
 <AM9PR04MB83538C4A07A6835FF8A74793E3002@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <20260519-macho-degu-from-nibiru-960af2@quoll>
 <AM9PR04MB8353B563519EBC1AD6C5BFE1E3012@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <e23a610f-e1ad-4536-80fb-8b5707e77f39@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e23a610f-e1ad-4536-80fb-8b5707e77f39@kernel.org>
X-ClientProxiedBy: SN7PR04CA0080.namprd04.prod.outlook.com
 (2603:10b6:806:121::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10566:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c4ab84-623f-4fc2-174b-08deb67cc2aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|366016|1800799024|6133799002|38350700014|56012099003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	UI9e2Xjq1BPWD7sRK6JeXfXgox2r2N3fJykhw1mcre3Hfwr2KzXJ5EFrm0vSZChFAU7kuEro1zOZYqSu/adfVWuIzh1jKKVAjqYoj8FRYqdrpAdlsDFfSfhEOux3+DkrfGXx8wH1qn3P2uSp4Drf2xZdsvm9V8NHx70xZabKxRnU8F7AM0gLp+xf5u5F3m6W+4Un5mpumfazmgTLL00MlDmA0BTqdad2J02wt3yOyT+5kmv5HbDtQW2wz9h+sV14eWjJfXAFl496FfiiNv6kdGdMh52x4MZ/elOneIs+ZZhQVYVZ1F9xj14TNRDlyM9fa60E1GanJIoGV1a1qW1qTtyxDMZTWo9nCslSJABhwgNsAtTp22ioOkV0yIntF+ME1nSg3nuzypSDJ9OR0u7NHes9xTM6F9IDzxoBSC+KMe4DxqiB6/CILKvWOi4I9YqyB8mztTq5ihy1TwI++rAjq6T2rmIHztZOyP7+x+JZrhwixLLVWPnP1le4aD5KBGhyXlIplgOcCnHoamzZDl4jcrsjNyZpbxMXHSAnF7pGuQphNEkDsGQ7/DgbYJNsoZgfkPejcfXQniKM7XJp0vMqCknmtxqnFZP02DJCYtz8Z4NbvkVLSuEnlsRjNmZGQZPim8tZPdsujAZKiUSiXJmWXtixEdJosXt5AK+wUHDHQ/urApIMTGcvfhEs6WtfeVjv881y0T4o3ZdwFlu9H1QhGNWhIQ5oQvsX33apfmmg2LXXyhdOQMw8UZKqJl5uhnj0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(366016)(1800799024)(6133799002)(38350700014)(56012099003)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0tBY2txNWlsVllBSjRNVThoTHJXQk9pdHBaN0VqVktmT0N1aERLSWJtc1R5?=
 =?utf-8?B?RUsxTmQ4SXk4Yk9RZURVVTJaYmFQKzFBZkhyWnprY012RkM5Qk9BeU1ISUlP?=
 =?utf-8?B?UlFzQVJtTmJZRXdXaml5RW5USkxIbWVuUzhaZlBxNTBvM3F6bUlvWGpFbDU3?=
 =?utf-8?B?MTlLd3A4YUFhUzhEL0RHS1I0eXZGR2p0bzFmQ2ZMeUhOQmticHRnd3FZZnZ0?=
 =?utf-8?B?RC9qZ1gyeVhiMW9XTUg0UHVUSEJKdHpVUS9pOGF5Um9FYVZ0OHVNbndmMGxJ?=
 =?utf-8?B?SXo1bUNCZ2lWSEJFVVlMakNEanZkWGp4RVZmdmwvVlh2STVUTmF3UFY0Tlpi?=
 =?utf-8?B?MkRoS0lQMlRRZnR3YmFMdGZ5VERDTmNEYnppa2dzOHlTWitHbHQyZ0FIcys5?=
 =?utf-8?B?YnN1MGlHWDNUdTRvRDl2UGZPYXl0S3NHVmRiZ1cvKzBBR2tUaVZsTmJvbHdI?=
 =?utf-8?B?bElzMjY2eHFXcGRvK3ZybUM2dDRVRzVHOU80QW1DTytKZUZCUGRua0dWaE1s?=
 =?utf-8?B?YUFSM3dMR3NsT2ROMGtTSjlqa2owZHh4eUdOS2xOR1ZNOXpXRXFjT3Y4SE5h?=
 =?utf-8?B?WDZtTzdpS0pOUCtTcVk4ajhDbWkvYVNVTmF0MSsvTkdXdlNBM2cyUkZ5ZDIz?=
 =?utf-8?B?ajc0dVc1eW1rRUtXcGZGQWZGdXRNRjNlb2VpeTlFWkpmbmNVdXhQNWlJWWh2?=
 =?utf-8?B?Q01Gd0YxOWVyb3dlaTdkV1FCN2RHMTJ0SlIrYkMyWlhtMXFuNjYzZlZEc3kw?=
 =?utf-8?B?RFZTN1JIa1JERTd5c2pmYkd1UTZnbXovYUdCZ2FOVnlscnQ0M0doWHBVWGlj?=
 =?utf-8?B?bEFUcFJZOFZqZGRvOW8wQW5STzNMbGM5ZGRFUzFEb1c3UG5zeWxRaFFhalF1?=
 =?utf-8?B?azBUUFhBK1hOdjQ1OUd5RjJuTFE4OHdTdVBjSDN1bGsrR3VDd3RpVWFDTGxk?=
 =?utf-8?B?d0pnVy9zd3hQTlR2S0o2TlplUjlxK3pyR2pPSEI1TzI0TVpXaFRnczZXS3NI?=
 =?utf-8?B?YU1Wb0dEZXFlVEJrRWNuZngxTnF2UURvcVBvWTNNUitJL285cGhoTEFSeU1l?=
 =?utf-8?B?YmdLdGphNHNBZTc5WjRRZ2hyTXhYM0Y5U0JUMmVJODBOcnNVcFlycVYySW96?=
 =?utf-8?B?OTNwWlJBZUtBQlZLLzgydlJzZEI3VHQyeTdnaDI3bGo2eGtWeGVpMUxBRDls?=
 =?utf-8?B?Zm1GamVlTm5Ma0s5YTJiWGNyVm51ZFlpbWcrK1RXekVuSGk0Wk1Rc1puSkZv?=
 =?utf-8?B?YkNlSUVvMC9md2Z5MEpZVEdwTE1DdVVrMVJ4RFI1UGFUc0pHWDRkS0ViU0Ri?=
 =?utf-8?B?a1gzOFpTY2JObzFXMzc2TDFIZVdRVHBueEZQWXhaVUZ2NTBMMGlwdEhsTDY1?=
 =?utf-8?B?NEQvWGZuUXAvUU1TaVpsV2pvVDI2enF4K3hhbE5mNEV1R0lJeVRqdURhUFI1?=
 =?utf-8?B?RkhaUjlnYTVtQWFxVVU4U0diUCsyYldqdzVzQXNBYWxjalFUTW5PVEdhelBq?=
 =?utf-8?B?Y1pPOEQycHpkbS85LzVpVk5BSlp4djNmK2YzRGUxM0lkNnl2S3V6Y3ZIOVgv?=
 =?utf-8?B?N3U1by91RkhjdkVsS2VTRU5rWnp4N2NVT3puUGF3ckJieFN3Nm0weVRPL0J6?=
 =?utf-8?B?cFNmamVIS0lBb29RWTVFblFmMTA2M0MxWmN2enlaRFpQZ3FtNDdxM1grSy9N?=
 =?utf-8?B?Wi9nenIzcnNlaUVwbGd2OThpdnFZY1VoMnFsNGdiU3VSd0R4YnE0dGpCRDNz?=
 =?utf-8?B?RmJkejYzTTczMFJKYmxsMDBtRUo0d2ZJQTVLRHVHczlQQWxnSjhYU2czazFz?=
 =?utf-8?B?YkpnYWtsaEs5THRQSFhrUGZvd3RWbGFsSy9QRzJLVW02dEtoaWU5U0tHcDVo?=
 =?utf-8?B?R2lON01Ib2VnbU5Ib2lTdC9taDh2cVZYSFdhTzRrQVJmUktWbG1vTnBPQS9N?=
 =?utf-8?B?WUNzM3lIcFAwL1V4d3hYVy81K1ZpOVVzSkRrVXBWU2luVkVuUG9NYjhZNlpL?=
 =?utf-8?B?WlpKYmFFOThBcWVGRG51ekNxR0d3SUNMendnb1FGYytrQ3pBcUFmUHIvamVu?=
 =?utf-8?B?MVJIUFRseS9EZ0FLa3Z5bFFQcUx3aFZ1ejdkeHMrYjBJeVU0WGpzS0FaUVE5?=
 =?utf-8?B?RkxEME1tUHlTNkRKZ1JMYzR0bHg0REpuTEYyaXdCTFNmUXF1T1ArRU8zVm11?=
 =?utf-8?B?UU9PdmFIVENPQ2ZvZWQ4U0drREZXRGQ3d1VZVkJsZEswdUpBWGtRNEFaZk4v?=
 =?utf-8?B?WHBBVUhWQTR0aGkzRmg2SDVZTDRzVUEwTlp3T09BUXBTVFpmMk9yNmFpOUFZ?=
 =?utf-8?Q?L2h8mVm52C6DxUCwJs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c4ab84-623f-4fc2-174b-08deb67cc2aa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:33:29.3004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgAfGpfGi8w/WN1MyBYAggWsyACe9gDWMat36f31bqe+OZlZDytgQ0U82FKjKkDi8vYtVUOO3bbDsbdS63foEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10566

On Wed, May 20, 2026 at 09:08:42AM +0200, Krzysztof Kozlowski wrote:
> On 20/05/2026 07:02, Chancel Liu (OSS) wrote:
> >>>>>>> +description:
> >>>>>>> +  The NXP I/O connector represents a physically present I/O
> >>>>>>> +connector on the
> >>>>>>> +  base board. It acts as a nexus that exposes a constrained set
> >> of
> >>>>>>> +I/O
> >>>>>>> +  resources, such as GPIOs, clocks, PWMs and interrupts, through
> >>>>>>> +fixed
> >>>>>>> +  electrical wiring. All actual hardware providers reside on the
> >> base
> >>>> board.
> >>>>>>> +  The connector node only defines index-based mappings to those
> >>>>>> providers.
> >>>>>>> +
> >>>>>>> +properties:
> >>>>>>> +  compatible:
> >>>>>>> +    const: fsl,io-connector
> >>>>>>
> >>>>>> Everything is IO. Everything is connector, so your compatible does
> >>>>>> not match requirements from writing bindings.
> >>>>>>
> >>>>>
> >>>>> Yes, this compatible is too generic. I will rename the compatible to
> >>>>> fsl,aud-io-connector.
> >>>>
> >>>> aud is not much better. Which boards have it? What's the pinout?
> >> What's
> >>>> standard? Is it described anywhere? If so, provide reference to
> >> spec/docs.
> >>>>
> >>>
> >>> This is not an industry standard electrical interface. This connector
> >>
> >> Then if you do not have standard, then you have board specific layouts
> >> thus you need board-specific compatibles. You can use fallbacks. Generic
> >> fallback could work, but both io-connector and aud-io-connector are just
> >> too generic. Every connector is "connector" and "io", thus absolutely
> >> anything can be "io-connector". "aud" improves it only a bit, thus
> >> honestly I would go with board specific fallback as well.
> >>
> >
> > How about board specific + common fallback compatible like this:
> >   compatible:
> >     items:
> >       - enum:
> >           - fsl,imx95-19x19-evk-aud-io-connector
> >           - fsl,imx952-evk-aud-io-connector
> >       - const: fsl,imx-aud-io-connector
> > Since the daughter board is named “IMX-AUD-IO” in publicly available
>
> I don't think it is named like that.
>
> git grep -i imx-aud-io
>
> > documentation, common compatible clearly indicates that this connector
> > is intended for that.
> >
> > Also, I want to talk about the topic of generic connector. It's a common
> > design that daughter board is connected to base board through a
> > connector. This connector more often acts as a nexus that exposes a
> > constrained subset of GPIO, clock, PWM and interrupt resources to the
> > daughter board. Can we document this kind of connector as a generic
> > binding?
>
> So this binding is the connector between carrier and some addon? Then
> you don't get a compatible for that at all, because it is not necessary,
> not useful and NEVER used. Do you see socket LGA "connector" bindings? No.

Not exactly. Any connector connects a carrier board with an add-on board.
The key point here is that this connector type is reused across different
boards, even though it is not an industry-standard connector. Both the
signal definitions and the mechanical layout are defined.

The same add-on boards can therefore be reused across different base boards
that use this type of connector.

There are also GPIO mappings involved. For example, pin 1 on the connector
may represent reset-gpios, but it could be connected to GPIO0 on board A
and GPIO1 on board B.

Without a connector definition layer, this would create an N × M
combination problem. The Nexus node discussion already covered this topic:
https://osseu2025.sched.com/event/25Vrw

An LGA socket is a CPU socket, where the signals are completely transparent
to software, so it is not a good comparison. A PCIe M.2 Key-M/E connector
would be a more appropriate comparison.

Frank

>
>
> Best regards,
> Krzysztof
