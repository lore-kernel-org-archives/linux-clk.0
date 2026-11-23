Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795409876;
	b=E+rjfu/eOFwGZnmL4TXJVv4/66kyKGW7R9AkQiqaSrYEk8R+CBPDqZplr0wwS5wa/4IG
	 xuilU8J/FYFQdmZdfJMaEiqQ3NHTCt9XGp8AXGiw4Jls13XgBmS5gz/LoTJ5gwzNH0NuW
	 3lZu9nrRuZVE0r85Jq4IvKi2lGcvfAI+FCpHbuVYXA4vCQbEZzB1t8s5STVpLmvKifSE0
	 sdo8yDpKFvfDTIS8OUp0iTcpoM/IkmomF0s+ztRwSAG/J/uhlMDiZPntYA/4bLtJ+f5dG
	 zy9029akfFrZep4gqrYU/pd6Yqj9ydg9bVQskIraxVFUvsxyhk7B5QfwDdfbam2ZqSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409876;
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
	bh=1viPmHmcFWOag9bZUgQxjZwxd/rfQwrU9pexWuxBvaY=;
	b=kFceJbl5Em2n8vVbpFukTIeUnlXkav3TrDtUaA5Al/caxEcNXXTeA5gyFwZXsVfI8ZRZ
	 TtiEDnpdGIrjQ8VLo4rCohZbE46yIN3rxUAxpIyRQmOQj57HIW0OvZtkWRAKTKkcSnQC4
	 CGCIhiyM/We7UMM/3o4N0GvM4XDqtYbxL5v9/oIO5PCNyK/gMGVGSZPe5PUvLQDQcMJZT
	 xYBcG3eXKbwTcQndQc8OvAo7tqzRJBA01mmTYn+jlJiZO3lMl+T/TDs+Yg3ax47Bxa05n
	 Wpm9t6lQFAuTBRR9X0sYFHTJKciHOD3Hc/YJBrSdC9s4mBMm1lzBAAvKa8b218wXN4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=TIPnv85G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.83
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19013083.outbound.protection.outlook.com [52.103.14.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96884606A31A;
	Mon, 23 Nov 2026 04:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96884606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=TIPnv85G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHU9PwO9ZOazj9gdt7JbX93NvcoAYZS4s+CNM1lwMtR//CiqCf7TEBhReZHuswSIBPw+ASu96H7ORXl2w+A7yEHLKbD9CRhnqtIcLTGoXNeB1M19cuWdomP/ChuhGtS4lmdmVDf9EtTIzU0ZXx1jKe0XJrMBmGKrh94pWrFGBifZTFFzgwLZFd+R1Oh4gdGGr9uXpgrNbdKGFSXQeto7Mwg9zMOlBr4QvOB/pqyiPZiatdoA1SeKoseW09sKHzyz9Mu+PD8SHmSiY+grUW3lf9AgQGBO20+LLakZNCw9+wT3wfqlyw5nGC6hfRRrXAOy8DBwqQN+ONAlkcCV80qEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1viPmHmcFWOag9bZUgQxjZwxd/rfQwrU9pexWuxBvaY=;
 b=XISLRSmol0U4h9iuDi8Ko2t7wjgwNKQtYWoHBDb35dDJ60CYjcsRASX8Ee3T+no0TJfwI9Hod2nCUV+9OvKwfuyRYMm6ckKhCU/Gbar3tp96ytcsVGpfbi32tbDKWDUNqqb22p9lU1KKT54ye1dNFQCaP9rMNlbquK8r3yHsKT9vVxAFhJvMHAQ6x9wHiN8csSuLrcif9lLHkU9+yGEGUiZyUbZ/wD/C6DDjbLKEIHk/pLXQ4OSAUmnwjy+lB0+CkgeWbFvbr8PxN+8mGQX5oI4EyTdCd8++6h3S77AJpBf+2vzuYU8phGTpAaCPdlVs1xNnl2aFPYq5E+WDuTCl6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1viPmHmcFWOag9bZUgQxjZwxd/rfQwrU9pexWuxBvaY=;
 b=TIPnv85G1NuJvFc5LFr1PIAgfJLKdLbsrLG8ssf7AcT2Vwx8BzValb0PyFt8omb2tYlAoZIcs75cR+BUpB7LIAsfvHUBT8dPvSu/NlKcLf8rFpEklTA1TGwUOOeNQGqNj13lDLfofxrlPnBvmOD+3NMU7vIIXHz0Rl+WReM8Sws+zGlM0+dnZCsV5MqbHxLzYfNOZZQlEOXKyY4brO23xZsL3TrjAW+SCUkJ6bXvJsvFbb9MMLeOZq0m7veJF516FXIOK6B5bvo2WieKoP+d0A52UiMAsyJ8EJSHak2uZEzCNbJ2PEGGLIH0ERiz3nnfa3b5/6/OC2F0K1sSlNdTHQ==
Received: from LV2PR19MB797041.namprd19.prod.outlook.com
 (2603:10b6:408:415::11) by IA3PR19MB897114.namprd19.prod.outlook.com
 (2603:10b6:208:707::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 04:57:53 +0000
Received: from LV2PR19MB797041.namprd19.prod.outlook.com
 ([fe80::624f:f239:4d56:7458]) by LV2PR19MB797041.namprd19.prod.outlook.com
 ([fe80::624f:f239:4d56:7458%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 04:57:53 +0000
Message-ID:
 <LV2PR19MB797041C0715177372AFC317B5F9D452@LV2PR19MB797041.namprd19.prod.outlook.com>
Date: Mon, 23 Nov 2026 08:57:45 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: fix swapped MDIO clocks and
 resets
To: =?UTF-8?Q?Dav=C3=AD=C3=B0_Steinn_Geirsson?= <david@dsg.is>,
 Jie Luo <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261112155801.610730-1-david@dsg.is>
 <LV2PR19MB7970413DF8BA90E631C5D6CD349D7C2@LV2PR19MB797041.namprd19.prod.outlook.com>
 <b586f418-a8e0-4502-9372-ed15d559305d@oss.qualcomm.com>
 <pYqXqvnKWNe70XfoCIw5qXcD5To1lzTA1BYdwXz72HfWGIGQZN6IENgVQxGr7Z0ueVHYs_kl6W5q18m70V1jj2F_nInBNewja7Ui7ks38es=@dsg.is>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <pYqXqvnKWNe70XfoCIw5qXcD5To1lzTA1BYdwXz72HfWGIGQZN6IENgVQxGr7Z0ueVHYs_kl6W5q18m70V1jj2F_nInBNewja7Ui7ks38es=@dsg.is>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DO3P289CA0001.QATP289.PROD.OUTLOOK.COM
 (2603:1096:790:1f::12) To LV2PR19MB797041.namprd19.prod.outlook.com
 (2603:10b6:408:415::11)
X-Microsoft-Original-Message-ID:
 <6bbc9410-5e81-4911-a0e7-786be80e7e82@outlook.com>
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
X-MS-TrafficTypeDiagnostic: LV2PR19MB797041:EE_|IA3PR19MB897114:EE_
X-MS-Office365-Filtering-Correlation-Id: 3567f3df-874d-4f54-2487-08df491e5498
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|15080799012|19110799012|8060799015|23021999003|6090799003|37011999003|5072599009|55001999006|24021099003|25010399006|51005399006|440099028|3412199025|4302099013|1602099012|10035399007|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGRidnFWWlRxNjcrcXVOeDhFb3lJa2VUMDB1Wkw3TVhsbDZZS0t0dEpIcDhk?=
 =?utf-8?B?NEJ4RDkvNXpXYmdmNWR5TlltaTl1SXlHMnd0QWxGN0JURmdOZ3ZGMGZlT1FH?=
 =?utf-8?B?ckN4QXNlUWZqVEdWU1dlOXI3Y29URkN2NTBxczE1VTZXMk84elZrSTM1ZkRS?=
 =?utf-8?B?ZWpBSVdyQ0ljaHRhMHE4L20wWDM2di9nMWRpUGtBS1EwV3VjNXJvM2VCMkVl?=
 =?utf-8?B?WTU0NE1mWGxHM0oxZS9MK0RjNXR1U1B0dTdhZDhqUWxPZTlOeHJCZFNjTnVG?=
 =?utf-8?B?eXZjd1hMTnpSY3RVTnBCLzExTENnMHBYV2srakRXU2JYNzA0ak1hRkFXQW5Z?=
 =?utf-8?B?TklDb3dGYngwSDR0bkJzdWRSWUxrbVdGMlovc2IxcXF3c3BNeXlYMXJ1UWcw?=
 =?utf-8?B?NWI3NmRDUUM2Z3VuaThFZ3Y4KzVma3lEaGJNaTMvbnZVejRHVlN4a1FpOUFJ?=
 =?utf-8?B?emJpU04wNURSa01pM09wOUdUSmQ4YTJ0aldtNGllY3VOV2hQdC9TcFAzNnpa?=
 =?utf-8?B?WGp4eTU1c1VZZEppd1lnVXdJQTJzcnBBeGI5SVN0bGgvVlNVWkR0T2gvNzN6?=
 =?utf-8?B?RG1ZYTZqZmRYVmQxaDNMNnR3N1MvellkMDM3amRldlpRbGxYV0NkQm02KzBz?=
 =?utf-8?B?SWppVFVZV1owTmVBYndab2l1VUNtbzNlWjR1UjJWSFErVmN3SW1pQ1F2bVdn?=
 =?utf-8?B?WnU5WG9FbVRzNlFxQVRIN3VkWlFtTG03MFZ2bUsxVXR3TG1KaVEveVM3YktG?=
 =?utf-8?B?dXVWOHNyVFE5Q0hxenZGRzlzY2piSVlOL1pEVUViN1F0ZUFmczFUcUlWY1Jm?=
 =?utf-8?B?bXhpK3h1NkV2RnBCYTNFbG9BSDcyUHplaFoybC80emNBVkFNcTRFVU42VnN2?=
 =?utf-8?B?ZzBPdGVHa1hEREIxMGU2M09lZEFHUHFiNi9aL21zTStGbTNsZTBaT3B1cUR0?=
 =?utf-8?B?Kzh5WWdrRXV2clhneEcyVWpOa0hHcmxlTEJpZERSeFdCd1dlY2FnQ2dsbmYz?=
 =?utf-8?B?eEZwUnBDMEVzV2ZQb0lDN0lSeTZxUkdhc2FYWDE0VjVvMVhBYnhCNWZmaTZj?=
 =?utf-8?B?MVRPUC9MaU1MVk52eDhvNzMvN2RKTjUrNzNoSHdQTm5xYzM4NGxLWUNmdWN6?=
 =?utf-8?B?SEl5TVNIaDdZeDhkbWhIeGpHYVZ1aUliWHlwNVliRW9EK054L2JLUEdMZEJy?=
 =?utf-8?B?MURqbml5ckVlckZlbWdhcnhKVkdjL2lHb1RnejErcmhFbjVsYzdsM1BNT3Zl?=
 =?utf-8?B?M0UvUUl5WmkzNHZDYU55bVBpbXVIcng0TjZObEZGejFPSGtHL1JOenZBcmZv?=
 =?utf-8?B?ZzVnaDJ1Z1RsdUdTeU5oSm50RWFmdzlQT2ZLU1hRMzNrbGdoYVg3RjY2RUwx?=
 =?utf-8?B?ZzBkWGtLWEJRYjI1OU5iaTdDV3dtRlJONEpOeDM1RVIvVUhxQ2xUckhabkpC?=
 =?utf-8?B?QlVsU3ZjZkJzWnpzTTVDUjlicVNlNkpiWTVqazJvaVB0a2Q5OG93VG81UmVm?=
 =?utf-8?Q?0geJao=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTlVK3VSV0pqTGFWTWlEd2dydWZ3Zzg0MU5VQmpDbGxmanBCL1dhUisyZ3V0?=
 =?utf-8?B?TmhTNUtpcWk2NU81U095NmJKYzBlZFFPbmFRNFZCTCtBY1grR2NmUHNKWE9R?=
 =?utf-8?B?Z01mK1RJWDVvWklud05lbVNFeTIyY0R1TjNVZDI0THk5R2pQT3g2VE5mYjVn?=
 =?utf-8?B?NzdtcXVqRWZrZlpubFErcXh1aUZ2aG0vSGVvOVZHLzU4MVJvaXExbmIrL2Ju?=
 =?utf-8?B?MjlDa0l4d1FpNXBoZGcrMjJFZXBWZGEwSlVJcC8wbTBLVW9MZXdyOTc3ZUJk?=
 =?utf-8?B?RUREaGJsb292U2xGNkxvMzZGMWNaZXN6QVE1UHc1ZmhvRG8ycUhzWnpjdHR6?=
 =?utf-8?B?cUg3bVNyZWo2dDNJQ1NqZVhKZFR5TFFpVFdZQ2ZadS9zL1c4aVhtWW1ZTHRO?=
 =?utf-8?B?a1Jod3pONjc0akFQM1NoKzV1dkRiTFdsOWdwY0ZmZ1hMdHd3VEFNcFE3VGp3?=
 =?utf-8?B?VXEyaTVPWjc1SmRLLzVPUzhpWEFDemkyMXkxYnJEbWJjRkxONUtlemVUVGtL?=
 =?utf-8?B?RUpqY1Z6czJPL2tyc3VmZ3RPTVBXa1o1Q0dvM3R0dW5veE5NeTM2L0xKL0o2?=
 =?utf-8?B?ekdYWkxRbjNacFIvU0NYKzVCOUhUSzBlaG84d0VkNEU0Y0lzeTB2T1Q5RjJX?=
 =?utf-8?B?ZmhMTmVPYWVlTGkvMGpSZTVqVTRCWi9IcktzbDVmUUhKMloyU1VkcnNpeWRO?=
 =?utf-8?B?OURrcVppM29NOG4zc2ZZMHFpUElwdzJBSS84cVhFcjhRTyt1c2dBTEgxZmxp?=
 =?utf-8?B?SzZWOVIzaWhUSVczQmxIZldWVHY2YUpMbWtBVDFvZmVVTDlaN1lxTU10a25L?=
 =?utf-8?B?RzBZOEh4SFA1R2Q2aVBJVXM3eFpLWHl0NHg0UXhtUE9jNFNxSmgraFg5V1Aw?=
 =?utf-8?B?eHBBUk1oaUxOaG00RnZlVHNPLzlSckhUem91YkpsN0FBekJ6SVpSMUpNZU1n?=
 =?utf-8?B?dmJnaDd3VGhtQTY2Y1VMMVNrQnhjRTlFVU5Cd1RYV1dBZmErYm1Bc3phWDND?=
 =?utf-8?B?ZlJJZDdsOGpaeHJ3RnltOW5KK0RiNTdsQmx0Q0VuNnp0UnJXdkhzYlR0ZGpO?=
 =?utf-8?B?bHN4czg5RndHRlU2eWM2cFY3Q1BuYjM4cDBrbHN0VTNZR2pPdlJOZmZjaFZV?=
 =?utf-8?B?ZFg1Z3IvbmVRb3dHZElod0ZBTk8xVmJmQnNScVBzS1JpTE5OT05WbzFrOU9I?=
 =?utf-8?B?LzNyQy9UV0xETFd1MTJpWXB5QkZUalJLQ1ZOcTFxSFdJRjliNHZtZm9Kbmxn?=
 =?utf-8?B?ZmZxTFFwSGIzUmV6MjZyWjU1aFRTZzJIVldNQ0I5RnNpSks5bUlCR1MyNTgv?=
 =?utf-8?B?VFd4WG1NZmdxYUN2MjdISVJQaDZKNVloNEZFVUU4eGFBWTJZNS82MlozSWMv?=
 =?utf-8?B?Qm1tbTEramNDN1JzU1l0QjJwSVdKSG9qeTREM0JMaS9uYUc5NE9ETm9oZFp0?=
 =?utf-8?B?TmR0eXVpVXNDTVBGdjR1V0pmZkFCbittcEpJWWN6b0FmOTl6WnN3VFlSb3dH?=
 =?utf-8?B?ejJrUnlqOTgwMXBVbjhqY1VzajVheC9YVWMzUWdnSjRqcG1rUkxKMGp0R2JR?=
 =?utf-8?B?TEZkcHcrREo5MnNweFNlTm4ybHUyTmlJY2xGYkJ1VkFBSnpHT05HQStuOEJK?=
 =?utf-8?B?N1J1UTh5blgrTlZQTkVuck9ORW9xV2tIb045eUwyVWZxRkZ4a3NXNGk0ak04?=
 =?utf-8?B?S0NJcjlUN3hSNElQU0tweFRYY1QrTDBWM3YrSTJWQ0FMU2NieTVQQzl3M1NK?=
 =?utf-8?B?SWQ0eGhLT2c0WHlEdG13VHZRQm9tUGlMbEtub2txaUNrN2cxbCtQdXRaNHdj?=
 =?utf-8?B?V00wellmTXRNU25wYnJuS1RUUHFjS3U5MWtEWUMwa1VqZnZwejZGTFM2TEpE?=
 =?utf-8?B?NmxIVHVtRUcxKzg0b1AwZHhKNXVUZXl4aHV2K1dHeGNHa3c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3567f3df-874d-4f54-2487-08df491e5498
X-MS-Exchange-CrossTenant-AuthSource: LV2PR19MB797041.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 04:57:52.9655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB897114

On 11/17/26 19:05, Davíð Steinn Geirsson wrote:
> 
> 
> 
> 
> On Tuesday, November 17th, 2026 at 3:44 AM, Jie Luo <jie.luo@oss.qualcomm.com> wrote:
> 
>>
>>
>> On 11/16/2026 7:41 PM, George Moussalem wrote:
>>> On 11/12/26 19:57, Davíð Steinn Geirsson wrote:
>>>> The GCC has a block reset (BCR) and an AHB clock branch for each of the
>>>> two MDIO controllers. The pair at 0x58000/0x58004 belongs to the
>>>> controller at 0x90000 (mdio1 in ipq5018.dtsi) and the pair at
>>>> 0x58010/0x58014 belongs to the controller at 0x88000 (mdio0). The driver
>>>> maps the GCC_MDIO0_* IDs to the first pair and the GCC_MDIO1_* IDs to
>>>> the second, so each MDIO node gets the clock and reset of the other
>>>> controller.
>>>>
>>>> ipq5018.dtsi enables mdio0 and leaves mdio1 disabled. On a board that
>>>> does not enable mdio1, clk_disable_unused() gates 0x58014 and the
>>>> controller at 0x88000 stops responding. Its registers then read back a
>>>> stale bus value, so MDIO reads return garbage instead of failing.
>>>>
>>>> Observed on a Ubiquiti UniFi 6 Pro, which has the internal GE PHY on
>>>> mdio0 and nothing on mdio1:
>>>> - Gating 0x58004 leaves the 0x88000 controller working and every
>>>>   0x90000 register reads 0xffff. Gating 0x58014 does the reverse.
>>>> - Asserting the BCR at 0x58000 resets the 0x90000 controller and halts
>>>>   the 0x58004 branch. The BCR at 0x58010 resets the 0x88000 controller
>>>>   and halts the 0x58014 branch.
>>>>
>>>> Swap the clock and reset offsets so that each ID controls the
>>>> controller it is named after. No in-tree DT uses the MDIO resets.
>>>
>>> confirmed working on Linksys MX2000 and MR5500. Both devices don't have
>>> the internal GE PHY on mdio0 wired up. With mdio1 enabled and mdio0
>>> disabled, ethernet comes up.
>>>
>>> Adding Luo Jie: I think this patch can be reverted because not all
>>> boards use the internal GE PHY and its LDO needs not be enabled for
>>> ethernet functionality on externally connected PHYs or switches
>>> controlled by mdio1
>>> -
>>> https://lore.kernel.org/all/20260902-qcom_ipq5018_mdio_pinctrl-v3-2-629c7bb05c44@oss.qualcomm.com/
>>>
>>> Tested-by: George Moussalem <george.moussalem@outlook.com>
>>>
>>
>> Thanks for testing on the MX2000 and MR5500.
>>
>> All of the Qualcomm RDP boards have the internal GE PHY, so it makes
>> sense to keep it enabled by default. A board that doesn't use the
>> internal GE PHY can disable it in its own board DTS, as you already
>> did for the MX2000 and MR5500:
>>
>> 	&mdio0 {
>> 		status = "disabled";
>> 	};
>>
>>>>
>>>> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
>>>> Signed-off-by: Davíð Steinn Geirsson <david@dsg.is>
>>>> ---
>>>>
>>>> Tested and confirmed working on the Ubiquiti U6 Pro with both
>>>> OpenWRT's v6.18.60 kernel and `qcom/clk-for-7.5`.
>>>>
>>>> A comment in OpenWRT's `ipq5018-archer-ax55-v1.dts` indicates this
>>>> bug has bitten people before:
>>>> https://github.com/openwrt/openwrt/blob/main/target/linux/qualcommax/dts/ipq5018-archer-ax55-v1.dts#L273-L279
>>>> That workaround should become unnecessary with this patch, though I
>>>> do not have the right hardware to confirm that.
>>>>
>>>> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
>>>> index 37ccdc44a8..bf1a4745d1 100644
>>>> --- a/drivers/clk/qcom/gcc-ipq5018.c
>>>> +++ b/drivers/clk/qcom/gcc-ipq5018.c
>>>> @@ -1969,28 +1969,28 @@
>>>>  };
>>>>
>>>>  static struct clk_branch gcc_mdio0_ahb_clk = {
>>>> +	.halt_reg = 0x58014,
>>>> +	.clkr = {
>>>> +		.enable_reg = 0x58014,
>>>> +		.enable_mask = BIT(0),
>>>> +		.hw.init = &(struct clk_init_data) {
>>>> +			.name = "gcc_mdioi0_ahb_clk",
>>>> +			.parent_hws = (const struct clk_hw *[]) {
>>>> +				&pcnoc_clk_src.hw,
>>>> +			},
>>>> +			.num_parents = 1,
>>>> +			.flags = CLK_SET_RATE_PARENT,
>>>> +			.ops = &clk_branch2_ops,
>>>> +		},
>>>> +	},
>>>> +};
>>>> +
>>>> +static struct clk_branch gcc_mdio1_ahb_clk = {
>>>>  	.halt_reg = 0x58004,
>>>>  	.clkr = {
>>>>  		.enable_reg = 0x58004,
>>>>  		.enable_mask = BIT(0),
>>>>  		.hw.init = &(struct clk_init_data) {
>>>> -			.name = "gcc_mdioi0_ahb_clk",
>>>> -			.parent_hws = (const struct clk_hw *[]) {
>>>> -				&pcnoc_clk_src.hw,
>>>> -			},
>>>> -			.num_parents = 1,
>>>> -			.flags = CLK_SET_RATE_PARENT,
>>>> -			.ops = &clk_branch2_ops,
>>>> -		},
>>>> -	},
>>>> -};
>>>> -
>>>> -static struct clk_branch gcc_mdio1_ahb_clk = {
>>>> -	.halt_reg = 0x58014,
>>>> -	.clkr = {
>>>> -		.enable_reg = 0x58014,
>>>> -		.enable_mask = BIT(0),
>>>> -		.hw.init = &(struct clk_init_data) {
>>>>  			.name = "gcc_mdio1_ahb_clk",
>>>>  			.parent_hws = (const struct clk_hw *[]) {
>>>>  				&pcnoc_clk_src.hw,
>>>> @@ -3585,8 +3585,8 @@
>>>>  	[GCC_GMAC1_SYS_ARES] = { 0x68438, 1 },
>>>>  	[GCC_IMEM_BCR] = { 0x0e000, 0 },
>>>>  	[GCC_LPASS_BCR] = { 0x2e000, 0 },
>>>> -	[GCC_MDIO0_BCR] = { 0x58000, 0 },
>>>> -	[GCC_MDIO1_BCR] = { 0x58010, 0 },
>>>> +	[GCC_MDIO0_BCR] = { 0x58010, 0 },
>>>> +	[GCC_MDIO1_BCR] = { 0x58000, 0 },
>>>>  	[GCC_MPM_BCR] = { 0x2c000, 0 },
>>>>  	[GCC_PCIE0_BCR] = { 0x75004, 0 },
>>>>  	[GCC_PCIE0_LINK_DOWN_BCR] = { 0x750a8, 0 },
>>
>> The GCC driver is correct here. GCC_MDIO0_AHB_CLK (0x58004) and
>> GCC_MDIO1_AHB_CLK (0x58014), along with the matching BCRs, follow the
>> IPQ5018 hardware register definitions. What is wrong is the clock
>> assignment in ipq5018.dtsi: the MDIO controller at 0x88000 is clocked
>> by GCC_MDIO1_AHB_CLK, and the controller at 0x90000 is clocked by
>> GCC_MDIO0_AHB_CLK.
>>
>>
>> Please drop this change and fix the DTS instead, for example:
> 
> Understood, will do. I'll be traveling for a conference the rest of the week, so I'll prepare and submit the v2 sometime next week. If George or someone else wants to submit before then, that's also fine by me. :)
> 
> Thanks,
> Davíð
> 
> 

should the labels of the controllers be swapped too to align them to the
clock names? Else you would have &mdio0 with the GCC_MDIO1_AHB_CLK assigned.
If yes, it will require changes to board files that reference these
labels too.

BR,
George

>>
>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> @@ -220,7 +220,7 @@ mdio0: mdio@88000 {
>>                         #address-cells = <1>;
>>                         #size-cells = <0>;
>>
>> -                       clocks = <&gcc GCC_MDIO0_AHB_CLK>;
>> +                       clocks = <&gcc GCC_MDIO1_AHB_CLK>;
>>                         clock-names = "gcc_mdio_ahb_clk";
>>                         clock-frequency = <6250000>;
>>
>> @@ -243,7 +243,7 @@ mdio1: mdio@90000 {
>>                         pinctrl-0 = <&mdio_pins>;
>>                         pinctrl-names = "default";
>>
>> -                       clocks = <&gcc GCC_MDIO1_AHB_CLK>;
>> +                       clocks = <&gcc GCC_MDIO0_AHB_CLK>;
>>                         clock-names = "gcc_mdio_ahb_clk";
>>
>>                         status = "disabled";
>>
