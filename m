Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794829294;
	b=2d4RSdURpnbfwNp0KE50LghvCCmEEYmITUwjC/hAy5q9XFSLA+bAddbn/4VOR3QWlV+W
	 XA3aNcZWIYhrbs+z+iSRXOSH772spw0C1wqV4/9nst5G+5Xi6Bl2Sb6YpjiUP+ghjfahB
	 iuXSCCYOZeEHvW7ClWiaknUlJVlmiYk15tb5VDLtABdoFZphykoDg+viwLukTgW5gUpvm
	 Jq76L9pE6SZy/6HxvfaW3aa8vWk6B/W3v4MLmose1aikEOt58gXJkhlHiVlS/KJBB+d1A
	 SAjHLaqY/JupEMKzCN1iYnOMBerDXDXgcaxcrGVb9VM/+C2NQk045p50G5SN3lPFVdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829294;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jScG4XI1GqFb0BkA+FLb9l4CgqiZAfJUE7LuBp/CqZA=;
	b=jOyykxq+VhTfVLw/9cK5bKy8Nfq6ck50dNTv3usWCcPNvjTFiZm0hUyf5arloEO022rq
	 y2ixbmx+Ck04zc/WOvpkIbhlLf/4d52ZCKOegmXkXZ2nZalyaTooL99BsOeErBn30AeQJ
	 Hk8Y+rer9GoFWPGyxPjlYFHRIabA4VCC+FXRejyGPp0ZPf7SI5tiC6EUOlxlHPmHFlPwM
	 AdZPxiQYii/ZEWVkEg5dr5MkjrDI5No2c/hWpDlfmd7tJpEfkGG0bJ/1ApVTeo+MWHnXv
	 Aq8UgVcBEIzdb2OmBDUa1vpnSJ55pzSXB9vlnUssWMyg0Cw36GMhRh7NTF5QMYPXkKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=lST63H5i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.38
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19012038.outbound.protection.outlook.com [52.103.23.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6A2606A31C;
	Mon, 16 Nov 2026 11:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA6A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=lST63H5i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fz6U5SeauURO1Q8O0OsEEk9H/f1gTa/FW62u75aBdKhucDSNy2vOEngRacUU1sdiYpVrYE5JZyqBKFV0Juahz0WpfD9M1mh+RAUZD6M41mzcCeiJRGKgBj1kq4myzkE9pTs7/ikB1UXRGNxJ44sc2aKdoG3JujAssghjgHyFzunpKps2GOQk6Nx55y4NzwjBMjSWer+UD3b+gqMPf8WuL2c+8MlTqgQDXferN1ed55DOzeOaGD1e5z4VSrB+m1EWywaGP6cOAAUqoZAp7+0bZcIUjiiGfvUD5udmUbyj/Y0HiLGnsfLp+BThdtZSlcw3ZjxCR8fk3YKq3WI5BIh3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jScG4XI1GqFb0BkA+FLb9l4CgqiZAfJUE7LuBp/CqZA=;
 b=DjO/+kmI5ARGMUOyL5uAeL0qyjDr1pXS1nyGc4OPDQFVzgkG03SxBgEghcScpq3Iw2Ivg5h7xqP7OtiMJz2Se6mHeiUZyY9hdxmCrcalrkJvWj0r13QLxz1SZrbmBKUvtH8Rd4BSgk85SYBvV09MuPVmGOiKKSZjMKeDNn4rnzMUv1fG18sHL9fNAcfAS/CXSDCQeNVW3LBrHV8rkHWeDayjzTfHT1hki43pE5swxtRwzXftd41igtHMLylkZrvjeHiLwVNifuldZ/LZnWvVfJcd1bdf1rukPimnz/HI69O4dejx+9lQt5WKMunbGPrANUd4VeZvaJOIDDHLdullng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jScG4XI1GqFb0BkA+FLb9l4CgqiZAfJUE7LuBp/CqZA=;
 b=lST63H5iQpfygrDQKWlgPJH0f4R/2Wp/FxSWVxzK3GWF2nOpsn2TXAX/vsfnMzaAmOLLEdOfU5thmTT76vy/FhOzv6h+aQgvNsI2rwDnkwimQmi3Egjan7I3AatCHOU2bHEoKqFRph4TLx+DzFlhjYaIYpOsxlYZWvqqoHn/INmSSJH3yp8C+igD3BQFastn4YgQxj0N8mqR1iN9PxOuCaKyKAnzAmWxWuAhPDp/haOcy+qGYCuG3u+mCOrDcafRgb4QAdA4DgJw15vut30UxmdkhzRZNX+G0u++atFBNqUNwZ3rczwdmUDTtUBpvzdCo5bsRYo63eJfs5CK7enjhw==
Received: from LV2PR19MB797041.namprd19.prod.outlook.com
 (2603:10b6:408:415::11) by PH0PR19MB5193.namprd19.prod.outlook.com
 (2603:10b6:510:96::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:41:30 +0000
Received: from LV2PR19MB797041.namprd19.prod.outlook.com
 ([fe80::624f:f239:4d56:7458]) by LV2PR19MB797041.namprd19.prod.outlook.com
 ([fe80::624f:f239:4d56:7458%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:41:30 +0000
Message-ID:
 <LV2PR19MB7970413DF8BA90E631C5D6CD349D7C2@LV2PR19MB797041.namprd19.prod.outlook.com>
Date: Mon, 16 Nov 2026 15:41:24 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: fix swapped MDIO clocks and
 resets
To: =?UTF-8?Q?Dav=C3=AD=C3=B0_Steinn_Geirsson?= <david@dsg.is>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261112155801.610730-1-david@dsg.is>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20261112155801.610730-1-david@dsg.is>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX0P273CA0035.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:58::20) To LV2PR19MB797041.namprd19.prod.outlook.com
 (2603:10b6:408:415::11)
X-Microsoft-Original-Message-ID:
 <95ca2ab8-bc68-4a91-9067-f6658c997bd9@outlook.com>
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
X-MS-TrafficTypeDiagnostic: LV2PR19MB797041:EE_|PH0PR19MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bfdb8ef-5918-44b6-4ea4-08df43d68e99
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|37011999003|41001999006|5072599009|15080799012|6090799003|23021999003|4140399003|25010399006|24021099003|39105399006|19110799012|22121099003|8060799015|440099028|4302099013|3412199025|1602099012|10035399007|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2NXNE9QWVpxWk4weEhxMko4a25YaU5lVGZKU09pa0Vubmh3YlJaTmk0MTBF?=
 =?utf-8?B?c0tTRUJtd0ZVYVkwMS9SL2ZZaFowMlhZamNINWpGbEluS09kQUtiSzJjU3Y0?=
 =?utf-8?B?VGxmbG12a3dvR0d1azhpME5kT0Z2ZTF0RUdVVzBEQ0hPSGN5alZEOVFXMDRX?=
 =?utf-8?B?OHNGTVJPaEwrRG0vcFJVRnduS2kzMWtlUmd6YjZ5ejM2M1B6RHBITmdPZE9L?=
 =?utf-8?B?WitkY09qbHpqcVpWVU9OS1VkQTl2SEZwZ1dEY2l6eENNM1NWNm5maC94R3Zk?=
 =?utf-8?B?azFCVUYyMTNIZjdlVkd1ZW1mZXlaRmNtWnFYMGhqOUluWWtlbkg4RVhjY3lC?=
 =?utf-8?B?NExWV2xYNDk2WGg3cUR3VmhlbHYxMUlqV000d0s0Qm5iazBiN3R1QjdIaTVm?=
 =?utf-8?B?YzN5U080NzVwN3d3blVpVlR0VFRHMUZmS2UwVVJ3SkNkK1FHK2h6ZXRvaFRh?=
 =?utf-8?B?VzVPODNtblRTVTZONDhGbVFTc0NTWWxnVmxYRkoyVWdhaG4yUTJBUVBGM0dC?=
 =?utf-8?B?M2c5aHJDcWFXMXMzcThVR1p0MTVHZ0IrbjAyQnNJSDMwVytYQ1ZuZncxVnZx?=
 =?utf-8?B?RG5UanIxL1d2RHBsOGFNYUdUVDZVMjFKY09ZcmlPeTAzdUZucUt1M3VseTFW?=
 =?utf-8?B?S2VhS1duejJZODRnMGxDNGtTTmZjNUVseHNMME5HZGw2alFvbStEdDJnVUEv?=
 =?utf-8?B?TDU5OUVVSU5aSE9VZ29vL1UyZFlRRzlyT1ZyOGd4NlJRTjlLRlhaSTRNZ01T?=
 =?utf-8?B?ODY4cXNCWmxERnhUeXZyUjhsWjdmL05KREpLUG1ZV2Y2Z0M0L0MwU1pVMDEr?=
 =?utf-8?B?ZGd6bFBDblczZnlLdFhPTzFVTW9sRmYzdlVaSVpkc3dBUjVRUWtwVDhlYzVh?=
 =?utf-8?B?Rk1wbzVIODhLdjhSMFNKVDdzVmxoVERsc2ZPNGQydHZSeXpKZU1PMmFEalp4?=
 =?utf-8?B?eXltRDByc0tzOUdZZXEwYUZXMkNkeVVOMlhXNUIxNGFmck5yb2s4ZkRoMWwr?=
 =?utf-8?B?dkZhV2xQQU4vM242ZzRPM2pzek93K2p5WGFCdmRWdzBoOGZwdkxRTUw2YXM4?=
 =?utf-8?B?NFl6SlY3Q0l6ZkFVZ0lGYTQydEZYSmJDcDdqbXpCM2xMMncxOUpkaTQyckNU?=
 =?utf-8?B?V3ErcUh5MG5NdnFOcjZYUjU5NjFZOVkyektvUDVyV3lBcXJEc1M5Zi91RXlx?=
 =?utf-8?B?Z1RERFVDd0lTZ1crZmk0VzlZQ2xZTWR4UHpoRXNtOXZQaFEyMjJIaERJWE0w?=
 =?utf-8?B?NWRwbEk3QU54RHdIL3FoWVVpZDdDN2lpVnQyamRsSzhjYW0vYmtUTVRtcnU5?=
 =?utf-8?B?Y0p5clZWTFB6UXk5L3RWQWZiZ3poOWNpaHkzallxM3liT3B4aUpnNm1xbVBl?=
 =?utf-8?B?MkR6MTlhRVZkM3R2TUxEYnNXS3Fhb0F6RytwNXdlOUNqUzNWQzhOVkNYdVRh?=
 =?utf-8?B?WmJMZlpjMFVSQXRyWGFzTmdxTlEzQkgvSHBMZEpMWE1BcGRvTjBvL1VDRVdQ?=
 =?utf-8?Q?QNcTQc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGFwYVJMY0JZUEE5ME1NN3I2bFJ6WmNhR2cwWVdMZ3FSaXRPOEhUQ1F2VWlw?=
 =?utf-8?B?eHhmalNGU3RvbFN0YzB6RnNnL0twaytsZnVpcFVhWm9sSmhaV1NlTlVlQ2xS?=
 =?utf-8?B?NWMwU2U1NHNXbVRkekR1d2VJYndKcVpPNEdSbHlnK2xRVHk5ZDhiL0x1aVlM?=
 =?utf-8?B?Y28wbUxCTkFNbE4vdndwRnhwRU1BY0hMemI5bjVVNVZwY3RtYjNOMmdscEJi?=
 =?utf-8?B?OXAvNmZhbWxjT1kwcDh5QVI3bnNmY0RZcU1idHNPelAyRGVndEUxUURQM0dM?=
 =?utf-8?B?UHdBSjJvdUJzNnRPSlZsWEtYSEJHYlhmRy8xU0VIaXMwendOMkx4M3dKTFlF?=
 =?utf-8?B?c2dmVHFHRGJsTWFpQktzQWU5RmQzL0VrdWRsNktjWFpHQktTQmI4ZXFGQmIz?=
 =?utf-8?B?b01JWldYcVR2bldJWENsZ01JYTFQdC9vRWgzbWU4ckZmUEFSSTJLWHJzYkNT?=
 =?utf-8?B?Y0p0WHpQRmRoSXZhcTZ4QjVuc3FZL3pkV0k5NFY4djVONkpsbm9QOEZiT3dF?=
 =?utf-8?B?UXFoY1kzbzFTR05PMHgzSGwwQlppUVRDVldLUUxJRUU4Wm8wdWVNa1RVeEdI?=
 =?utf-8?B?aWNpczhhSnhKcHVyYkk4RzB1TWdpd2laK0JCbEVhNUQzalBCL0ErdGJMZ1dY?=
 =?utf-8?B?V21USVJmZ1JzL2tZVm05YTlzUm1tb2w0ZmM0TEVNWURlNysyR3NTa0VZRzdX?=
 =?utf-8?B?TmNvcnpSSWc2cEQ2ME9vMitIM2p6eTR6UzB2dkhHMVBDZzVqeHZoVEQrMjgz?=
 =?utf-8?B?UklLZlRzOG1iUjV6TW5RVnc2dzBTSnVqdEZlSWUxMzJHU0FLejdTRmFZMnI5?=
 =?utf-8?B?a2w4MFNhZ2RwRU1tYUNsNEJsczBuclNEcCsyRU9JeWRNaHlveDhrVG5iNmUr?=
 =?utf-8?B?T0RnT2dRRDZyek92djRlV3Y5WE5Dc2ZMTHVSUERXaHRrbHJrUUxhbjRVdUN4?=
 =?utf-8?B?UzA3eS9PblJob0hDUWYrMnFCY0VSUEo3eHU3d3ZMcTFZcVpzam8zT3YxWEpv?=
 =?utf-8?B?dDJYcFhiMVVCQzdkWDNlRnYwTkErUTh3MncxN0wzbi9laXZ6V0RvNUw5QndO?=
 =?utf-8?B?ZE1LbURXOUl4Z2p4QTk0ZS9RZ1B3WSsrNE5oQ0lpNU9Yc3QydUhkY0RPaE1s?=
 =?utf-8?B?YWJKMlJEMzF0ZlVhMVN2eldXUlRHT2xGNUJaTHNTdm1FOWk1eThVQUhNVEF0?=
 =?utf-8?B?VVJjQTFIQ2EwWFkwbW15OTh6RUpscEVnY0w1S29UYzFqVzZtSzhhQm05anRk?=
 =?utf-8?B?SEU4M0k0TmRLSGpEOVFtVWovNTdJV092VWxvNmlFZVBlTHdBMVUxbGZDY2tz?=
 =?utf-8?B?V3NhR1hzVk5zR1hwQ2R6cmxLNEx3UGtLUE8yaEU0cFFvY1lSTkJzck9Tdktw?=
 =?utf-8?B?T3hIOG1HM1IzR1dXbFY5blpINGNPeWMzYkt1MTdzdFhUcEtRSWg3NTdJQ3hY?=
 =?utf-8?B?azdYckxCcWVsSE1MbEVlMlQvNXFpZEl6MzNHMjAvWnhPQzNaaForSDI3MlNQ?=
 =?utf-8?B?MEZtdXcrNkg1bE1yQ2t3aDFjZUNWRFNHWXl3RHNtRFVySnVFck1XOXNEanNZ?=
 =?utf-8?B?Z2RNa25NVU1CeUFVcDVPRVB5U3p1TTRUUjZrK29vSU9Mc3N1eElDY0RENXJW?=
 =?utf-8?B?QitmQUw0aytoL0pjemdXaXQwanB3djhkQUZRU3R1UDB6NGgrVnBFSEtFWDFT?=
 =?utf-8?B?Sit0UHZvZ1JMb3NSN2xGbTM2WHh4bkZQTHBZZUZEMkx2MURhazA5VGhNQmpm?=
 =?utf-8?B?WCtvSkpnVTRTZ0JkTGp0UFU5bGxGbUNVTjQzOWI5S0dsY2tLSlBNUjl3Y0xz?=
 =?utf-8?B?NE0ya0dNaGlvbGFBRlpna01oQUQ5SGY3KzdjVEJJS2haUUliNmVGc0hmZmF6?=
 =?utf-8?B?QUVOMjRGQmtDcG5ZSEpMTm9TVjhWNUdNUGd0R05CZHl0MVE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfdb8ef-5918-44b6-4ea4-08df43d68e99
X-MS-Exchange-CrossTenant-AuthSource: LV2PR19MB797041.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:41:30.8632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5193

On 11/12/26 19:57, Davíð Steinn Geirsson wrote:
> The GCC has a block reset (BCR) and an AHB clock branch for each of the
> two MDIO controllers. The pair at 0x58000/0x58004 belongs to the
> controller at 0x90000 (mdio1 in ipq5018.dtsi) and the pair at
> 0x58010/0x58014 belongs to the controller at 0x88000 (mdio0). The driver
> maps the GCC_MDIO0_* IDs to the first pair and the GCC_MDIO1_* IDs to
> the second, so each MDIO node gets the clock and reset of the other
> controller.
> 
> ipq5018.dtsi enables mdio0 and leaves mdio1 disabled. On a board that
> does not enable mdio1, clk_disable_unused() gates 0x58014 and the
> controller at 0x88000 stops responding. Its registers then read back a
> stale bus value, so MDIO reads return garbage instead of failing.
> 
> Observed on a Ubiquiti UniFi 6 Pro, which has the internal GE PHY on
> mdio0 and nothing on mdio1:
> - Gating 0x58004 leaves the 0x88000 controller working and every
>   0x90000 register reads 0xffff. Gating 0x58014 does the reverse.
> - Asserting the BCR at 0x58000 resets the 0x90000 controller and halts
>   the 0x58004 branch. The BCR at 0x58010 resets the 0x88000 controller
>   and halts the 0x58014 branch.
> 
> Swap the clock and reset offsets so that each ID controls the
> controller it is named after. No in-tree DT uses the MDIO resets.

confirmed working on Linksys MX2000 and MR5500. Both devices don't have
the internal GE PHY on mdio0 wired up. With mdio1 enabled and mdio0
disabled, ethernet comes up.

Adding Luo Jie: I think this patch can be reverted because not all
boards use the internal GE PHY and its LDO needs not be enabled for
ethernet functionality on externally connected PHYs or switches
controlled by mdio1
-
https://lore.kernel.org/all/20260902-qcom_ipq5018_mdio_pinctrl-v3-2-629c7bb05c44@oss.qualcomm.com/

Tested-by: George Moussalem <george.moussalem@outlook.com>

> 
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> Signed-off-by: Davíð Steinn Geirsson <david@dsg.is>
> ---
> 
> Tested and confirmed working on the Ubiquiti U6 Pro with both
> OpenWRT's v6.18.60 kernel and `qcom/clk-for-7.5`.
> 
> A comment in OpenWRT's `ipq5018-archer-ax55-v1.dts` indicates this
> bug has bitten people before:
> https://github.com/openwrt/openwrt/blob/main/target/linux/qualcommax/dts/ipq5018-archer-ax55-v1.dts#L273-L279
> That workaround should become unnecessary with this patch, though I
> do not have the right hardware to confirm that.
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
> index 37ccdc44a8..bf1a4745d1 100644
> --- a/drivers/clk/qcom/gcc-ipq5018.c
> +++ b/drivers/clk/qcom/gcc-ipq5018.c
> @@ -1969,28 +1969,28 @@
>  };
>  
>  static struct clk_branch gcc_mdio0_ahb_clk = {
> +	.halt_reg = 0x58014,
> +	.clkr = {
> +		.enable_reg = 0x58014,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "gcc_mdioi0_ahb_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&pcnoc_clk_src.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_mdio1_ahb_clk = {
>  	.halt_reg = 0x58004,
>  	.clkr = {
>  		.enable_reg = 0x58004,
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data) {
> -			.name = "gcc_mdioi0_ahb_clk",
> -			.parent_hws = (const struct clk_hw *[]) {
> -				&pcnoc_clk_src.hw,
> -			},
> -			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
> -static struct clk_branch gcc_mdio1_ahb_clk = {
> -	.halt_reg = 0x58014,
> -	.clkr = {
> -		.enable_reg = 0x58014,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data) {
>  			.name = "gcc_mdio1_ahb_clk",
>  			.parent_hws = (const struct clk_hw *[]) {
>  				&pcnoc_clk_src.hw,
> @@ -3585,8 +3585,8 @@
>  	[GCC_GMAC1_SYS_ARES] = { 0x68438, 1 },
>  	[GCC_IMEM_BCR] = { 0x0e000, 0 },
>  	[GCC_LPASS_BCR] = { 0x2e000, 0 },
> -	[GCC_MDIO0_BCR] = { 0x58000, 0 },
> -	[GCC_MDIO1_BCR] = { 0x58010, 0 },
> +	[GCC_MDIO0_BCR] = { 0x58010, 0 },
> +	[GCC_MDIO1_BCR] = { 0x58000, 0 },
>  	[GCC_MPM_BCR] = { 0x2c000, 0 },
>  	[GCC_PCIE0_BCR] = { 0x75004, 0 },
>  	[GCC_PCIE0_LINK_DOWN_BCR] = { 0x750a8, 0 },
