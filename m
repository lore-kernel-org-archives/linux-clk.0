Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023127.outbound.protection.outlook.com [40.107.44.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766862C3259;
	Mon,  8 Dec 2025 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765183264; cv=fail; b=rTXiCbINrP3jQ6TptbqD9iv5jtnJwutppWqUIoP6w/brLQfy/ypvbCUWybUqRY9JJLvPFLhop3JMcmGsbfvNomMM7MaP10LGUWzGdjvUg5yuzNOm1D9VLSBcdQ48h7vy2/6hyx4hZmtbYYs2Q9whxNF2G4wbsR9eQeSHt0F5ZjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765183264; c=relaxed/simple;
	bh=jpVCYtT0SN2uCsQd3ZVsUkt9KgkfyhpzMNugsgHgtDc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sOOOydMug/FtrqgTud511uRp6cAzn1ZrMNs8vif7cawxwPhOzMfWXDTu4Srtv536+PtVZZDJYJeeutBreJrdA/5wDtrhmUmZgNJ68GV1PRDEJuE/z/Xq+sfEcjOx+JHDEl9gn7iExnE3R9fD5NR8wL7jW6PS20VbCzwAtGjOSCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=BhQwDyTq; arc=fail smtp.client-ip=40.107.44.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="BhQwDyTq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEGDP02NkI8FZx+2cojgK3KhnLmA+JUFKmwRUQ9qSWaJMg2eE2ynkPYEuKZtMjwM8xim5CbAkuXZOJ2CJQgzGxbuEZLGYEckg8rkhvzZdP+2bUrBsu2Ef796AdyTcgqOmf7yLslC+8+U0W7LXrqyEv30eaCVp9uGZE4d7L1gzT7DsulaxwmtbNeOo5ET+yeVejQ50Sd4Fbd+WFaBiVkPpnvZ6ZLJaWYMGgaSqxt9fSKXiZJYru6rp6M3kQW9/xN1BXMbIB+Icx0LJPJL/wFzQpQglGZagMp18eAtwKvMk3LP3SmtkvdavzvC6XDCuYi7jg/mmzZKBlDLetaQ1/nJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25gliexFIPw1xaXaA4p1vXERtNcjYDKdlRD07e+H4mA=;
 b=lUzuGNiZwNTMpkz0hgZKm6WGPMXs5GFmQRjJyYNjmli+SXACtHAVjCVKdIM0mw1/NwQKjQcefr7sl9wZMFyhJrr0FCF4Dgg3QPZO+JqNG6cdIcPx7HdqB2EKNULdNEG/A1KTBxyJxqOFoDMnvLj/JFsqv9apF79pUG9RVS/S7Qgjdzx195yNNLCItDi4/oALl+njV6SWULskMk6JhYGdJMdCjubbxeQEj51WOVokUK36LqciNUtKLdqGry+Qsbb7fsAnB+EWY+Ffq1t3q9XOAedeBr++f2zESPlvRMSIoFFu8U8vWu6Piu0RYyCCVZ9Ye0ClnCCboeQ3XDXsURfULg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25gliexFIPw1xaXaA4p1vXERtNcjYDKdlRD07e+H4mA=;
 b=BhQwDyTqW0PnN9UmnEPsTAbwdEWmvj469ri2IGHBgKt+ZgxOVhRGDYBLIiG6gAw7zRjRYtPggOLWqObJbdD/zKBuvEb31PB05SBxqDFcdyYQLEkCIm8DW0jnEpTCzN10/HlvdOOnLLyYEuFOkyXD6J/zjUZz21wN+mtdLWgxFjYQiBwBihwvDxfxR6cbgu2IjN2x9QbQFwyB0/agwqvIQXRjCKDUqQNWVlMv9H9lR30+ejGSPeAQtF3ZAqMmJux6mWfudNYD1E+DLR4kqwwREK1ioN4IvOW0P/Q2y3g8/eQTtreowt0f4EvwSSTNfI9DEg3AmVzl5qAiLfmPVqkEMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB6569.apcprd03.prod.outlook.com (2603:1096:101:74::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 08:40:59 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 08:40:59 +0000
Message-ID: <dd90b445-bafb-46d4-8cec-e0877cf425b3@amlogic.com>
Date: Mon, 8 Dec 2025 16:40:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20251204053635.1234150-1-jian.hu@amlogic.com>
 <20251204053635.1234150-3-jian.hu@amlogic.com>
 <20251208-independent-warping-macaw-74a169@quoll>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20251208-independent-warping-macaw-74a169@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 3506ffbf-ffe6-4298-b2e1-08de363582d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVd3Q2VxQ0xiL3NaQk1kbEk5QVU4aEM2aWtPM3MzaU5SaEFrbi9QSVZTckIy?=
 =?utf-8?B?SmxJcEhTQll5Tkl4RmJ3LzFzWWZEUFdobEd2OWRLaXZ0MTZkQTVTNzNqbmFT?=
 =?utf-8?B?SkNYa0RnQ0NQR3UzaHpOZzczdTBJNzBxenZFL2U0N0ZxTVJ6VmRrSHp3OWdZ?=
 =?utf-8?B?dVlURTY2byswN1krWXRLb1NrQmI4RnZMOVdBNTh3K29BVDh0eVdrcVdZUVcx?=
 =?utf-8?B?MVQySDBnUE5LNkg1ekN6ejRSSVR5cEt6bG9DeFByRFN2aGlTQWRQdzExL2Ja?=
 =?utf-8?B?UCszZnlsYUVGcXY1Ukw5Rk5Ec3lCZWk4VnhmRVpBbGFWaXc1YjROV1FjMzkv?=
 =?utf-8?B?UkYvY2JGOGxRQnEzU2h1dmFKcGI2d2FvR2dzVk83TUtMSjVXbDNPZW5qWWhQ?=
 =?utf-8?B?ZzEvTVpKNXlzOWRTeHF3UmlVSlRDbmxTMjU5RFl6Vnp5Z1dSdHZLMkNOTkhK?=
 =?utf-8?B?S3BNVldSUlJoYVpZWm5KOFNMRldSMnNlMTdmdklZbVArL1VXb0Jvd2RSb0s0?=
 =?utf-8?B?Zit3V1M4K3B2c2hMazBUbmFtc3g1eE9MSmRHWjdUeERmWENBM3VzSitxR3lh?=
 =?utf-8?B?VmhqUXpIRVBodktMbVlOWjgvN3hsTFRzckJLeFRwN3lrcU80WEc2YmJCcG1i?=
 =?utf-8?B?U3NlQUNPN2d1TWxxNjVPckNaYjRwTk4wODJjNXdwYnF2TjZxUFBrYkhGQnFw?=
 =?utf-8?B?cE1GOVE0RVNjd3hIVER3L0xHSTZsSmZsQ1RhVng0TTI2WGo4MS8yMmU2Z1BF?=
 =?utf-8?B?eWRVYXc4UzNYODg2SHBpbDhwVDFwVm9oMDVTVmx3eG5nOU41VmpFZHJDREwv?=
 =?utf-8?B?dTlEaXpiMk5KQkdKZ29SMG9sWXZkVThTT1JvMTBkQWxQVFozZVlsSkVwbHZu?=
 =?utf-8?B?WnVxSk1XdWs0ZWZ3aVRzNlRzZlppQ3pDZlV2SFhjbkVOR1JSMmFYL2QrVDA2?=
 =?utf-8?B?Vkh2KzFMeTBHTVFPSFVwQVR4c3NPTU1rY3U1R3hkMy9kdTJxbU9Oa2Z2TzVr?=
 =?utf-8?B?SWxkY3JpaWdBN0RZd3dxOEpQYjFLU01IQW5xdVpyaWZIalhnMjhuRjgrT25W?=
 =?utf-8?B?Mm04Q1FZbzBJOVlHWStPSGFHbGRBUjA1azZncXlQR2lPT2tCazhncjRkZ0Zn?=
 =?utf-8?B?WDlvbSttaDFhU08xc2NDMjRsc0paL2VCZWpVdHBzV3hsUGFCNDVBYlhFbkY2?=
 =?utf-8?B?Rk1xWHZUMURMc1RQOUlkdzN1VEZsQ0lpUmg3cytLU1lVUlNtV2NhY1ByMEFv?=
 =?utf-8?B?K0RpMkcyQVVJV3NzcWN1Umtzc1IySSs0RUM4VjF1Z3RnRGwwRERybUpGaWN6?=
 =?utf-8?B?R3dudG5rNzFCbk00VXZadXlpY3JWTWY3ZENJOVQ5V2tpQVBwZFE0WVV5RFJ0?=
 =?utf-8?B?QmhHK3RPNjZqVHNFOWV4ZXJYaEVEZWQ5a0VTdG5oNmZPcEpQRDdiTjQzZm9s?=
 =?utf-8?B?NkMvenF2M2hUNGhLLzNEZldxaFJpU1NndUp6RWM3S0NDL2FYNGNybVZWaUdt?=
 =?utf-8?B?TWZacUhNTjZNdjY4czhwRDltYjdWMXU3RSt0S3JHTHNpcjlPdllvWUIyL3ZR?=
 =?utf-8?B?QlRXTG9FWEI4WkNPeGk2dzFESUFLTlhUbWRJNjd0MEJKemozSmpoeEUrTlJl?=
 =?utf-8?B?NlhsWVhWMjBUSlZWRXRycTVxd09QMVVnQlJ0M0gvMDlzTlpzZGZ6emJaS3lU?=
 =?utf-8?B?WEVMU21FMmVoMG43T0w0MXcwNGNMdkdxNXlNd2hBV1hUYzJBcVIxQklqRkNR?=
 =?utf-8?B?aVdjT2dZSWFjNnhHbDZMc2J4K3p3SkwvbU03dmtUMjQrVFU1ZWVEemxmUEtk?=
 =?utf-8?B?RFFlVWp6cmE2K1VMVUFuR0VyT3FIRUw0K2t1c1VRR3QzRUtDR0pZY3lWTWFD?=
 =?utf-8?B?eEJPUGN6VGlCamg2YVJ1M3QwUTViTElPQjMzLzMvQzl6TG0vTm9YTVoyeGNP?=
 =?utf-8?Q?rcSdwUkxZQReyqrB8Clw+YHIgtqq44/L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlpPQzNLVnlpemV5N0xnbCt1S1pRUGgwTTArcUJCdCtTbDJDT0c3ZFpPOS9J?=
 =?utf-8?B?V3BmQ3dBUnk1dFJWNVRnY2dHdFFHZWI2V2hoSk9mSWlUL1JYRDR6bzdSRjJ4?=
 =?utf-8?B?ZVdQc1ZyN1RvMjQ3UGpFUHR0N25mdnlXYk8xZVlhblJzb3pjQ3hWZ0VybzdU?=
 =?utf-8?B?SUxQSjJsc3pzSmRrbTdLc0d3MVdvWUVQdlFNakpXbWZCdHRwSWo2cEVsNU9W?=
 =?utf-8?B?U2MvNkNZd2c0Q0ZwZWNxSWxsd2dMc0c4SHZXdWJkZlEva2JaOWwxK1J4T2NY?=
 =?utf-8?B?WThOZ0Fuek1JQkQ4Z2FEWndLeU9xOFlRODVRK3dxOWxPdGxLejNBdlhBUFRC?=
 =?utf-8?B?U1B3Sjhsb0tCck9mUVZDeStBcjN6ZnBldm5nRTNkNnBjUTZRWWRXNGh1VEpq?=
 =?utf-8?B?cERGb0U1d1lUdUJleHUvUVJVZG1jTnZOemJUV1gwOEJycko5QStaUitsWWRl?=
 =?utf-8?B?U0dmZjE1Sng5R2dTSWFLb1pPRFpqMjNYRkswZ1hYaWFtU1VRSUd1MXhaM29P?=
 =?utf-8?B?UWhTcm9sN2lEcWxFVHBFOGx5Sm9sUnI5WWUvNVdiZ2ZpZEpGb1M1Z3lJdVNN?=
 =?utf-8?B?UkZ0SDQ4T01adi9OUmY1SDRnNnpteHNnQU01TzZRNW9sbVBjSmprckVlRThM?=
 =?utf-8?B?eUpmdVZaMWQrL2hBZUNTa3crTkxKL0N3L005d2xoMWlrUURiMXF1VkQwcjh1?=
 =?utf-8?B?TTZ5Z1d2MjFoY3RZY0k5U2VwWnpWNjQ4WVJhQ0hORDkzM1VKbVdId2kxRmho?=
 =?utf-8?B?ZzY4WlJkeU01UnR3eVdHNzhFZmNVdDUxTmZwM0laS2lGTEFxQWVqdmUwNTNS?=
 =?utf-8?B?MlMxMUZtcUtqRmJDYTFVMlNraEJyejN5N2VhQnQxSVI1djRkUHlrRXhzcSsw?=
 =?utf-8?B?VHVzK2JRZVlqdG11L0QyQ29CcFMrSi9yYUNIazM0UnoxN0xPZjE5a0FFTFRI?=
 =?utf-8?B?d3RRVFlZZ3VkTVdrSUd1eG1mWVFjcTNhblMwNW02eG1mYzZ1N3FhOE5OT3Fa?=
 =?utf-8?B?K2NaSlByWno4OVUyMU9vZ09ONDRpWUp3YTMwLzNiOHVWTy94L044YnZTcVkx?=
 =?utf-8?B?dk8yUm1DcGdNbWVsZkU4NjdGdVNCWmVINVdKNXVxVDg1ZWZEUDFkc1V0QlYv?=
 =?utf-8?B?eUw2QnNmdXhNNGZFY2UzMUQ4blpEa2xqZ0orTU5BeGl6VjZzRHB2anNWMWVZ?=
 =?utf-8?B?bW1wN25hZi9Ec0tld1hqS1o1ZzR0TnlVVEUxaGNoZWxmVk9NendCZVA5Q0Ni?=
 =?utf-8?B?WlNzSDVlVkFjLzBxakpzUkpBNWdoeStOc2VtN2xDQitmQUx4cE03cmU5Y0VR?=
 =?utf-8?B?TXJ6alU5cys3d3hCZmJnY2FHSUoxK2NVTU9rdjgyQTRMajFuaitsVjJoVU1l?=
 =?utf-8?B?WlhtbUsxOVgyU3puZ2NhSXVYVndDcEh3d3JuczBFMFdrbllXaEtkTWIrdEF0?=
 =?utf-8?B?dzYxVFZPaCtOMm5ucjNvVENZUCt6T3RhREJ1RHhvWEhodGRWdUc2VThCaDVP?=
 =?utf-8?B?TnovS2F2Wnd1Tk5NaTY4TGFJRENoSFEyR0lqSWM0UWEzd2dOSHBSam14NElh?=
 =?utf-8?B?WHVUOEZBbnd0SU02MDVVSk9FQmhPdUVHU2hTVjcvWGlSM2M1alZyakdPZXg0?=
 =?utf-8?B?dUlCL0o5ejRtMTZaUERjU1ZOaUZ6K0NkU1JvWkRZdGlCb0JGQlVYYUZ4WURw?=
 =?utf-8?B?WFVlMXByYzdWY1grU3lydG8vWWRRUmhvcmUvdnpyUlM5dXhpaUR5VjloTllZ?=
 =?utf-8?B?RVo2K0pnWHhSRmx6UEJCQ29IbE5qTkY5bzVYVEZLVUthdDk2Tlk2a3cvRmlX?=
 =?utf-8?B?Wno1eUl0d3VSN0I5NW5ldDQzcGpCUjVGSEg0MndaOGJ0dDhZOVRQek9kdG5P?=
 =?utf-8?B?UVhBN2ZMVU5xOS9JSDZRNy9OM3pVWHgvRHZYd0xhSDFyU1FwY3lmSXhXMkRE?=
 =?utf-8?B?ZEQ0clJQT1VxOXFtRjBMQ04wMTFmMUNCRy9tdnZFR1BZRjQ0QlY5aWJ2Qjhh?=
 =?utf-8?B?Q2dxVmw1QjdUZU1YbzVNekU0cmRpbXZCV1E1V1lMcElBS3huTjNjZTlJdmtw?=
 =?utf-8?B?OEJuczhPR3NqaUM2VkZCZ0xZc2lqNnVhbUVCMXFYektUVTUvK3NLelVyZldm?=
 =?utf-8?Q?62HyjyPjwChc1vAT2kAEy9d5N?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3506ffbf-ffe6-4298-b2e1-08de363582d0
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 08:40:59.0557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ln1+cA2wetbz/spxCUToa9Cnfd3f888aN9zMBES7pXTYIEQ/zH0IGPvgHWwoMqrqCrbGyXy1ycBGeENCHWMn+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6569

Hi, Krzysztof


Thans for your review.

On 12/8/2025 2:17 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On Thu, Dec 04, 2025 at 01:36:31PM +0800, Jian Hu wrote:
>> Add DT bindings for the SCMI clock controller of the Amlogic T7 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>   include/dt-bindings/clock/amlogic,t7-scmi.h | 47 +++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h
>>
> Where is any binding doc for this? Why is this a separate patch?


The ARM SCMI device tree binding specification is located at 
./Documentation/devicetree/bindings/firmware/arm,scmi.yaml.

Certain secure clocks on the T7 rely on the ARM SCMI driver stack, which 
is officially supported by ARM.

The kernel-side SCMI client implementation resides in 
./drivers/firmware/arm_scmi/.

To enable ARM SCMI on T7, three components are needed:

- Kernel-side definition of ARM SCMI clock indices (this patch addresses 
this component);
- SCMI server implementation in the ARM Trusted Firmware (ATF) running 
at Exception Level 3 (EL3), which has been integrated into the bootloader;
- Device Tree Source (DTS) configuration for ARM SCMI clock nodes (the 
DTS changes will be submitted after the T7 clock driver patches are 
merged upstream).


>
> Best regards,
> Krzysztof
>
