Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022079.outbound.protection.outlook.com [52.101.126.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D8F33065C;
	Mon, 26 Jan 2026 13:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769433707; cv=fail; b=baDP7Ct8MooOxY6jEGaiJiG0yyOSgUY6FOZFFcOZh8GNr0sWP5Et0l7bKDsW/gLj2MCCEGFuvTbARwrvsrPX/14YJaKWBbvSMV1aPXCndUlL5qe7KiE7s3/OFW5fIl6AEAsMXWnmDa5loSA3Q0Ii1XKsd1lm1ew3yV9uYcQZ9pI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769433707; c=relaxed/simple;
	bh=4cMSI/oAPx/DydLqfsRS/oEvvx+w+fXW0hFJzqe2wMI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jtW4T5r85bN1BKWhfTqriDD+of3muo0uNPTP0naRspf41paNtX9HBw5br0mRHnYaiPoyu1TQs5QNHFUHeCNga6ipnEPF7WKsVZlU/4a+q6BiMHFxDTO693EJiZIS6anvud6vgl28iTyas2drZxHq80nQGC1z9pIsLRu3z/v6CfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=D2GIrksi; arc=fail smtp.client-ip=52.101.126.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="D2GIrksi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtFo3rVmEn2cYOjqZne/E67vd9sXe6AlAbMsJT1yZsdXDScmgKdPw8AJe6kViIIEblCIYHTE5mPTJk9s1x6QzH/cRaM5MyG725bf5Axl50dsEy/RE1/RrwBNZMtpn+U9DTZjAAaLPOhAJuyb414jc8eap92W54TfoAQANS1ktDQqeifG8qtf50BZmWWG7mund3GVfWkHDydvqxWHi/oxdihHdaMwak6LnS9AdI+sQO2zaw4RpA0SLm2x9xUbQj3kAaFubJ7aqNNBcsT3Wp26499u//mKrx+UtiL/7SFTROOuw/+FHgP7691mAOgMjG8DUZm7cwNzfN2GjrsLkgPwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK5PDdsD4xjHsrM0Hu/1YNtaeKTbnjPBpcLnD7UL7rw=;
 b=PQJrHoX39q5tCFEpdjaq1DA7nzQCEntlBMyiA7sJZ1z/6/NS6xwvo/vHm4XbN/hyAqAO50JB7WK/Ln7r6UJpTXyz1BW3E18QlU9rv2KaUqPjiqNZkHUVvX2lEcQcRjYnuLSBCpmjY1T6RgSTqzx89NKm59/HUyB06KLA2oLMBuvDDRXAMDe/rDg4CXOkIckCS5jv8I2sEfCZ8VV+5Z3AQzUCn8dT13rWcm1p4csEb2Byw9V2TYHab/aEsN7/6KFxJ6z7ONRFKR31X5gx++MKuSIMXo+rR0khGJS/EOlKcHOHcs3fCM9FNS90O6Ief8yL4GOFiYROCWS/dCqu8CJSag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK5PDdsD4xjHsrM0Hu/1YNtaeKTbnjPBpcLnD7UL7rw=;
 b=D2GIrksij8EAsjplkHV/yJ4etJXTk4BcFcXDsooGmZqUr/qcJ3ic8bhI9afSnG6SLtdYU2KtiWcW2bOOGFh4ri6Qfoz3PXL3LW9D2fTIM2O7qVxAFwHT2z3Py3K3l5fprOMXCDowc7N208htB3BJFz75+0qWDwgFNZ2pWZHRqHwsH99/PDprbO3VygGrl3CZ+ChaSBoUAwGKIfN4DMK49rV8veDmPupKUack8TNpOvSbEcsU0AyMdEjK/fD/6WEHWgpFjCO3uLyv0c2qsTOlJQ806mZw5YVM1xFpuR8JDl1+FN/LPE6foeD/AZZBcjoyIRwrGfytNmSmfiTyc1vfuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by SEYPR03MB7316.apcprd03.prod.outlook.com (2603:1096:101:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:21:41 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:21:40 +0000
Message-ID: <d403bf7d-6e73-460c-b2db-8019d9d44a67@amlogic.com>
Date: Mon, 26 Jan 2026 21:20:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
 <20260126-audio_drvier-v6-5-99e350855bc2@amlogic.com>
 <1jcy2whb9k.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1jcy2whb9k.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|SEYPR03MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: bed8b5ed-2188-40f1-3a83-08de5cddd76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ti9UbFBHZHkrZzlLdks2VWJzV0d3WTlibzhDNWtBT1g4OTBvWVZVN056a3Fp?=
 =?utf-8?B?SUlTWVA4UjhpUXBCYzFPWUFHL0dhaU5oeGplRmxaWjZDTTY1Y3pQZXc4UUhK?=
 =?utf-8?B?d1lMRE9yMy9lZVAzYUxYUVpybzl6MGI4amsxSUgzNUtUeWZ2YlhTa3lwQ3Rn?=
 =?utf-8?B?ZXNuYm1IL2ExazRrVUJ3VkdqaVZwM01GL3NIU2grNnRXck1OTTVvNDBhWE1x?=
 =?utf-8?B?ZFJnWXlIMUVlaGVpZXZBcWFPR1VSMHl0RmpWS1oySlV0dmR1WHUzcHRRRHV0?=
 =?utf-8?B?NllPQ0UxbmVUaGdIbHJqQS96T2ZKa2pDOVg4ZjNyL0xOcEZxbW5JMVE0SlBP?=
 =?utf-8?B?cEtwSDh3OTgrOU5ZOS9qN3h1UTNJSmxaNG8xNVhCQ0Y4c1grdXpabitiMG9B?=
 =?utf-8?B?RDNobmlaclBBUWE5QkhJRVZFZ1lYTlRhc3p5VC85YktGNFY2VnF5UlJzcm4y?=
 =?utf-8?B?cjUydlUwcHZPc2tkamo0bE44ejJNTnNIU1laK3lWaUxzdnY3UHoyZkpDamRF?=
 =?utf-8?B?bTlxMkRtSFBLOXA3eXptdHJnYmJtYXlsd0NxWVp6U2J6aFJ1WllKU1l0WTNs?=
 =?utf-8?B?Zm9yY0IrQm9laTBzM3lXWk1tRmNDNENjclU3cHc1MkNRN1hhQ0VWanJ2dU5C?=
 =?utf-8?B?alczdEZ4aFliU1N4ZGUyS3RZV1ZXQkRPYWJHV01sNjlqT0JtM1ZHc2JMQXBj?=
 =?utf-8?B?T3YxY3ZtRjlOYnkxbTc5bCsvZlJ2c2U1TkU4K1dzdStRSW5TeUlSaFFwOEhx?=
 =?utf-8?B?RkxaZFJ1UVpFMlR0RnZsZDFuZVN3WXE0bm5ZQ1lBMzBmOGt5RlMxa2V6dnVz?=
 =?utf-8?B?QzNOUEU5d2lLbHdQVzBZYzBVbTRtTXpsY2FaOXJQSEIxZGowbEdhUEdla3BV?=
 =?utf-8?B?d1VrbjQxd0tPc2grK2RoUmVBTC9JM2UwN0U4elNGOTd5cE02b0ZwRjU2MHFq?=
 =?utf-8?B?Rk10ZzdwZ3l0Vmh0K053UUFSU0ErMit6ZXptSzVtSFZjaFAzbzdCRGdnMXlL?=
 =?utf-8?B?eEs4TWs2NUg0OFMzbUpIZldxTXhkZktpMTc4NVEzRVZscDZoZ3NPSzlzdUVj?=
 =?utf-8?B?ZFhwMFQ3dkZyMjNXNVR1bks1Q3pMTEd1M1d6MndaUzZsMzhQR2FSQUI4NkM5?=
 =?utf-8?B?ZytHQlY3NFFmNTBRMlBOcmFvQUZVeE96N0MrV09pNE1iVFJHRndvSGdsenNv?=
 =?utf-8?B?VXpSNTZKNGNvUkpRK25ZOWZhMWlDQlpQYTdwVFpaditpSm83STFLUXlpSktx?=
 =?utf-8?B?YzZyZWtIam1CNk1XWTdhdUpWaUVPMHFKbDh6UjV6OHEvWWw5OHYrVWZ5R0lW?=
 =?utf-8?B?SnYzdTk4QnY0WnprNzdENlRHSXE0Ym01R3ByeTFhejZaN2pCQjBhT29HNndm?=
 =?utf-8?B?Vi8waEN5VDBCNFFhSG1ZL3Vsc1AvQ0EreEpMdXoyMnh4Q01udHpMLzVYQXZo?=
 =?utf-8?B?UjgrMHJ2VVB2bWNaODg2eWtaY2RoSGxUaExaREJRaHRwM2c3Z3c2N1VUNEsy?=
 =?utf-8?B?TElwKzdqU0twL0pNL093blJHalBrejNUWlpjRThLTTRaRzVqLzRMcTc4NEs3?=
 =?utf-8?B?dE14ZmRYblEvcWlCMFJCMVB6U2RXNDhpRFM2U2dsRXV3V3YvTElUYTBnVXFx?=
 =?utf-8?B?MHBodmNER3JpVmx5QTJFaEIrOTQ4YkdadmFqWVVUZTRMQ2c4Vis3Y0t5MFh6?=
 =?utf-8?B?TzgxclZjc1dPa0hVTzZTUG5kN2gzWnJlb0ZPOW9USWRwS0dlR2hmMVJ3ME5y?=
 =?utf-8?B?VXdoT0c3OU1OQzdaaFpoaTJwOCtxYVdTNlovQ1BVRi90WWl5TjVMcVd2RnRS?=
 =?utf-8?B?OWlIOGRwcUZtMEwwY0VvNWx0TGJVTXdzdHJkQlBlcGxFSHdpUVJuRjBZellK?=
 =?utf-8?B?NjM0WGFSdi9vajlNNTFqUzVPbE5TZHVZYkdaNWxuUE9yaUV0TUMxNTh6cFNG?=
 =?utf-8?B?OXQxYWJLcEJKc1dOM01VcmIzQ1VHRkNRTWlqZlE2ZEtGd3hENnkrWm15U3ZE?=
 =?utf-8?B?WkJFaVl3SGRYM2l6MzZqQk9mN2ZUbHNIYUNtWmJ4WmhKYjFhK05nbkdKdFZL?=
 =?utf-8?B?ajBsYkNBaGtKd1hOc2ZzelVzTmtLTXppaGxCTTFMU2xPMDAwRHVvNUpCWVFB?=
 =?utf-8?Q?Ux50=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHNWWnZOdmg2NmdKdlRDT2FDaG9jY1VrUFkwOUJtcDh5OE4wVTRiSVZrWDJX?=
 =?utf-8?B?K0VXNXRlZ092bE91RnNTQUV6VmdqL1p6U1VLcUtKcHBlM1JSYTRmNFMybEYr?=
 =?utf-8?B?NEtyUTlwVjlFaDFJSzkwd1R5ZGlna0I2NDJIenJTTnpGVUJqOEdCcVFXd3VL?=
 =?utf-8?B?UmZhVmFtZWRiOTNONE9DbEJWMktTTFBkbmtYemxpN2pFSzBvZC9OUXFHUmJ1?=
 =?utf-8?B?MDEvNWRoOUlDVWNMa09zS2pCK05OQ3BlTE93SVNYeTM1bFZrZHNNQVhJMDRG?=
 =?utf-8?B?NERLVjhvdDV0aXRKdTZ0YThqTGFwQ3NGeTZHZFIvamRXVUI2VHVLQlVaZjll?=
 =?utf-8?B?NGlUbVFsdm9VMW1VZXpBdEVuNDFtM3VOZ0RVQTFEbVRwNmpvVnBuZUpXKzZy?=
 =?utf-8?B?TkZud1FLbWJNemhDSXhXRS9tM2JCdGpKSTZtcWtpbXZLUTN0cVd2bU9sT1Va?=
 =?utf-8?B?VWpNR0cvTHZwOVVoR0U1enJPNmpLSjdlUlZxQXNSL0VHZFZRZ2NKQlU2VkFP?=
 =?utf-8?B?UTVYbDdOOHJDeS8vS1ErczFGR04waXJpZXBVYWVqa3Q4ZVdwekdScTBaYmhM?=
 =?utf-8?B?am5aY1M0UFJ6RFBkY21VOTJCVlFwVm5FcnViVndKNnhzKzRKL3FyYUUzL2ZS?=
 =?utf-8?B?cksrRFdUWk8yTEFwN0V3Wm45YXVGeTRrQVRiU1c0WTlwbW4zN0ZZSU45YUJW?=
 =?utf-8?B?YlZxdXNJU3RXY1h5YjNZUXVHYzI5a2sxVlp6RWNJWTk5c01FUXl1azZwYmIw?=
 =?utf-8?B?dnVPVE9MZURHYlByNk45bXoyd2V0cnNlYXNzV21VNGgrU08yNUdqSkpNUllJ?=
 =?utf-8?B?dG1aT01LOVJlSlovam1BbXBMYW00WnJ6T1ArZjk0Uit4NUhTd3ljZ0FONkpP?=
 =?utf-8?B?S3V1d0k2RDFxanRMVll0RnEzRzl0V2JRbVNpNEQ3S2IwU3N6dkpNeExwVWRX?=
 =?utf-8?B?T0c4NzZJTWFzbE5LWWNrb05zaGRsRm1Eb25JSHhCM3A5aFZ5MzR0NGE4RzlI?=
 =?utf-8?B?WHdLcUdITnJlcGdHZXJtZ3V5UGNCMWlHQUc4SnZLZkxwdEJFRUNDcHYyOXhv?=
 =?utf-8?B?ekNKK1NIc1hFVTA5L1dkL2ErQVFaMlZMalR2V0tFdlpyaHE0VWJuVDBZWmFz?=
 =?utf-8?B?Zy96YW5IMGdVNUJjaktqWFRzLzVoUGN1QkdUOHRtYjVXS09INWJ4SzZXY3p3?=
 =?utf-8?B?ZmEyODNFalFWdlIrQmZWVDlaK0l6RmJEMmF4a2l6M1hTK0FWc0FOWjBBU2xQ?=
 =?utf-8?B?S21ROWEzT1ZaRHJkaFRRSlc4S3pjd2FDK0JtZjY5aVZldDdhZitQcTFxQzB1?=
 =?utf-8?B?MExZSTZiS1Iydk84TllDSmtxdXJaZ3BQbWFCWC9LQit2QUh3UWVLeE9UaGJW?=
 =?utf-8?B?cFc3bUhrb2R0ZmtidmpuOExYVEk1K2JPNFpITUl5QUNLQkprdmtSKzRKTGU3?=
 =?utf-8?B?Mzk5UGdCRmtPdXA1TmhDQlJ6dk15amhEa3dRRnVud2lkN3VxWndRZTN6VjIy?=
 =?utf-8?B?b0JVTEhaVmVHUC9tdklNTU9lS2ZmTVlsRWw1YldJOTk0L1l3SEdoaVZSVVdU?=
 =?utf-8?B?d2lZNUVlbHUwVVo0aUZ2d0xQN09rME0wQ2pQYWNYSm9HR3pQNE8vRU9QMEli?=
 =?utf-8?B?WGNhU3hXeTJxVGhlVDFBdERyZmhESjdmWEp3SXZYR3R0ZDR0TVRFMU9WOVFN?=
 =?utf-8?B?V1JqbW11VHUya3l5M0hoaUFiU0k1R09xZzZsc05sMXNYZnNwL3hvZFplSVVx?=
 =?utf-8?B?N0VVUlpNa3djT01yanhsZGFscG84Y1IzUVBxWjVCNlBmc3hTQUJkYVFZMDZV?=
 =?utf-8?B?TnhvMVFVWEVuRjZ6TXJxMnd2VnZQQ2dwa3dRTnJWbHdMVW5DWXB0TEhWVDJX?=
 =?utf-8?B?d056cHRKdDE5ZXJCU0U2SU5meWsreVJPQTRteHQ1ZjNoZHJ1bnRDbHJSeG40?=
 =?utf-8?B?Ynp0VXp6WWpBVjhuTlE1ZHpGZVZSc3lPRlNLbVdZY0xOUm5IbEdYemZZQVFp?=
 =?utf-8?B?QmFEQ3Vud1NMZEQ5Tkt4ME5mNDZmNXpGRE02OVp4QWZKYXc2OXZteWdqL3d1?=
 =?utf-8?B?WFVQUGdRWjY2djRCa05BVFJ5VkxieVVHZ3dsQXU1QU5VTjEyOTNWRjliSC9v?=
 =?utf-8?B?THB3ZFZmaFF3Z1dQM2RGNkcrRUtJOGdjc05ycS9GcG1BMHdyMm9zMXZBeDFB?=
 =?utf-8?B?SGJSS0tDaGZLOWtGNkFObThWbXE3bXNpOEVxUEsxQndYanVFeVJHcjBRU3Az?=
 =?utf-8?B?b2xwT1Z3S2RFcS8xYkRQZlE5TkdLVjJ6OVcyRTlzamFGa2JRcTc4bHpjOG8w?=
 =?utf-8?B?c3dIdHY2d2tTbnIrdGhwV0phdWlHMVlCM3E4b2FlQkkzeW5VSUdmTUFRRjk3?=
 =?utf-8?Q?khabbHQi0DXQV1Y0=3D?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed8b5ed-2188-40f1-3a83-08de5cddd76d
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:21:40.9137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dd4jZVsuYK//9+qWWDGnreoEIH5+1ebyG4XSnr7iV0sgYncDEVxeSpp2ipika+AP8uV05vLZjbIEieMYCghTXuzD+drQEKTUpPpCVzgp7lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7316


在 2026/1/26 19:19, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
> On lun. 26 janv. 2026 at 06:01, Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:
>
>> From: Jiebing Chen <jiebing.chen@amlogic.com>
>>
>> Add basic audio driver support for the Amlogic S4 based
>> Amlogic AQ222 board.
>>
>> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
>> ---
>>   .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 222 +++++++++++++
>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 361 +++++++++++++++++++++
>>   2 files changed, 583 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> index 0a3f81ea0fb0..43493bc9da46 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> @@ -75,6 +75,19 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>>               regulator-always-on;
>>        };
>>
>> +     vcc5v_reg: regulator-vcc-5v {
>> +             compatible = "regulator-fixed";
>> +             vin-supply = <&main_12v>;
>> +             regulator-name = "VCC5V";
>> +             regulator-min-microvolt = <5000000>;
>> +             regulator-max-microvolt = <5000000>;
>> +             gpio = <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
>> +             startup-delay-us = <7000>;
>> +             enable-active-high;
>> +             regulator-boot-on;
>> +             regulator-always-on;
>> +     };
>> +
>>        /* SY8120B1ABC DC/DC Regulator. */
>>        vddcpu: regulator-vddcpu {
>>                compatible = "pwm-regulator";
>> @@ -129,6 +142,215 @@ vddcpu: regulator-vddcpu {
>>                                <699000 98>,
>>                                <689000 100>;
>>        };
>> +
>> +     dmics: audio-codec-1 {
>> +             compatible = "dmic-codec";
>> +             #sound-dai-cells = <0>;
>> +             num-channels = <2>;
>> +             wakeup-delay-ms = <50>;
>> +             sound-name-prefix = "MIC";
>> +     };
>> +
>> +     dioo2133: audio-amplifier-0 {
>> +             compatible = "simple-audio-amplifier";
>> +             enable-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
>> +             VCC-supply = <&vcc5v_reg>;
>> +             sound-name-prefix = "10U2";
>> +     };
>> +
>> +     spdif_dir: audio-spdif-in {
>> +             compatible = "linux,spdif-dir";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "DIR";
>> +     };
>> +
>> +     spdif_dit: audio-spdif-out {
>> +             compatible = "linux,spdif-dit";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "DIT";
>> +     };
>> +
>> +     sound {
>> +             compatible = "amlogic,axg-sound-card";
>> +             model = "aq222";
>> +             audio-widgets = "Line", "Lineout";
>> +             audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
>> +                              <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
>> +                              <&tdmin_lb>, <&dioo2133>;
>> +             audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>> +                             "TDMOUT_A IN 1", "FRDDR_B OUT 0",
>> +                             "TDMOUT_A IN 2", "FRDDR_C OUT 0",
>> +                             "TDM_A Playback", "TDMOUT_A OUT",
>> +                             "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>> +                             "TDMOUT_B IN 1", "FRDDR_B OUT 1",
>> +                             "TDMOUT_B IN 2", "FRDDR_C OUT 1",
>> +                             "TDM_B Playback", "TDMOUT_B OUT",
>> +                             "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>> +                             "TDMOUT_C IN 1", "FRDDR_B OUT 2",
>> +                             "TDMOUT_C IN 2", "FRDDR_C OUT 2",
>> +                             "TDM_C Playback", "TDMOUT_C OUT",
>> +                             "SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
>> +                             "SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>> +                             "SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
>> +                             "SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
>> +                             "SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
>> +                             "SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
>> +                             "TDMIN_A IN 0", "TDM_A Capture",
>> +                             "TDMIN_A IN 1", "TDM_B Capture",
>> +                             "TDMIN_A IN 2", "TDM_C Capture",
>> +                             "TDMIN_A IN 3", "TDM_A Loopback",
>> +                             "TDMIN_A IN 4", "TDM_B Loopback",
>> +                             "TDMIN_A IN 5", "TDM_C Loopback",
>> +                             "TDMIN_B IN 0", "TDM_A Capture",
>> +                             "TDMIN_B IN 1", "TDM_B Capture",
>> +                             "TDMIN_B IN 2", "TDM_C Capture",
>> +                             "TDMIN_B IN 3", "TDM_A Loopback",
>> +                             "TDMIN_B IN 4", "TDM_B Loopback",
>> +                             "TDMIN_B IN 5", "TDM_C Loopback",
>> +                             "TDMIN_C IN 0", "TDM_A Capture",
>> +                             "TDMIN_C IN 1", "TDM_B Capture",
>> +                             "TDMIN_C IN 2", "TDM_C Capture",
>> +                             "TDMIN_C IN 3", "TDM_A Loopback",
>> +                             "TDMIN_C IN 4", "TDM_B Loopback",
>> +                             "TDMIN_C IN 5", "TDM_C Loopback",
>> +                             "TDMIN_LB IN 3", "TDM_A Capture",
>> +                             "TDMIN_LB IN 4", "TDM_B Capture",
>> +                             "TDMIN_LB IN 5", "TDM_C Capture",
>> +                             "TDMIN_LB IN 0", "TDM_A Loopback",
>> +                             "TDMIN_LB IN 1", "TDM_B Loopback",
>> +                             "TDMIN_LB IN 2", "TDM_C Loopback",
>> +                             "TODDR_A IN 0", "TDMIN_A OUT",
>> +                             "TODDR_B IN 0", "TDMIN_A OUT",
>> +                             "TODDR_C IN 0", "TDMIN_A OUT",
>> +                             "TODDR_A IN 1", "TDMIN_B OUT",
>> +                             "TODDR_B IN 1", "TDMIN_B OUT",
>> +                             "TODDR_C IN 1", "TDMIN_B OUT",
>> +                             "TODDR_A IN 2", "TDMIN_C OUT",
>> +                             "TODDR_B IN 2", "TDMIN_C OUT",
>> +                             "TODDR_C IN 2", "TDMIN_C OUT",
>> +                             "TODDR_A IN 3", "SPDIFIN Capture",
>> +                             "TODDR_B IN 3", "SPDIFIN Capture",
>> +                             "TODDR_C IN 3", "SPDIFIN Capture",
>> +                             "TODDR_A IN 6", "TDMIN_LB OUT",
>> +                             "TODDR_B IN 6", "TDMIN_LB OUT",
>> +                             "TODDR_C IN 6", "TDMIN_LB OUT",
>> +                             "10U2 INL", "ACODEC LOLP",
>> +                             "10U2 INR", "ACODEC LORP",
>> +                             "Lineout", "10U2 OUTL",
>> +                             "Lineout", "10U2 OUTR";
>> +             clocks = <&clkc_pll CLKID_HIFI_PLL>,
>> +                             <&clkc_pll CLKID_MPLL0>,
>> +                             <&clkc_pll CLKID_MPLL1>;
>> +             assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
>> +                               <&clkc_pll CLKID_MPLL0>,
>> +                               <&clkc_pll CLKID_MPLL1>;
>> +             assigned-clock-rates = <1179648000>,
>> +                                    <270950400>,
>> +                                    <338688000>;
> Seems like you've got the 2 last PLLs serving the 44.1kHz rate family.
> Why is this needed ?

Hi, jermoe

Considering that the sample rate is up to 176.4K

PLL0 270.950400M max support 24bit *176.4k, 32ch for tdm mode

Perhaps PLL1 PLL1 calculation error , it should be set up 361.2672M for 
32bit * 176.4k * 32ch.

In fact, most situations are limited by the speed of the IO pin.

Can we remove MPLL1 here and keep MPLL0?

>> +
>> +             dai-link-0 {
>> +                     sound-dai = <&frddr_a>;
>> +             };
>> +
>> +             dai-link-1 {
>> +                     sound-dai = <&frddr_b>;
>> +             };
>> +
>> +             dai-link-2 {
>> +                     sound-dai = <&frddr_c>;
>> +             };
>> +
>> +             dai-link-3 {
>> +                     sound-dai = <&toddr_a>;
>> +             };
>> +
>> +             dai-link-4 {
>> +                     sound-dai = <&toddr_b>;
>> +             };
>> +
>> +             dai-link-5 {
>> +                     sound-dai = <&toddr_c>;
>> +             };
>> +
>> +             dai-link-6 {
>> +                     sound-dai = <&tdmif_a>;
>> +                     dai-format = "i2s";
>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>> +                     mclk-fs = <256>;
>> +                     codec-0 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
>> +                     };
>> +                     codec-1 {
>> +                             sound-dai = <&toacodec TOACODEC_IN_A>;
>> +                     };
>> +             };
>> +
>> +             dai-link-7 {
>> +                     sound-dai = <&tdmif_b>;
>> +                     dai-format = "i2s";
>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>> +                     mclk-fs = <256>;
>> +                     codec-0 {
>> +                             sound-dai = <&toacodec TOACODEC_IN_B>;
>> +                     };
>> +                     codec-1 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
>> +                     };
>> +             };
>> +
>> +             /* 8ch HDMI interface */
>> +             dai-link-8 {
>> +                     sound-dai = <&tdmif_c>;
>> +                     dai-format = "i2s";
>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>> +                     dai-tdm-slot-tx-mask-1 = <1 1>;
>> +                     dai-tdm-slot-tx-mask-2 = <1 1>;
>> +                     dai-tdm-slot-tx-mask-3 = <1 1>;
>> +                     mclk-fs = <256>;
>> +                     codec-0 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
>> +                     };
>> +             };
>> +
>> +             /* spdif hdmi and coax output */
>> +             dai-link-9 {
>> +                     sound-dai = <&spdifout_a>;
>> +
>> +                     codec-0 {
>> +                             sound-dai = <&spdif_dit>;
>> +                     };
>> +
>> +                     codec-1 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
>> +                     };
>> +             };
>> +
>> +             /* spdif hdmi interface */
>> +             dai-link-10 {
>> +                     sound-dai = <&spdifout_b>;
>> +
>> +                     codec {
>> +                             sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
>> +                     };
>> +             };
>> +
>> +             /* spdif coax input */
>> +             dai-link-11 {
>> +                     sound-dai = <&spdifin>;
>> +
>> +                     codec {
>> +                             sound-dai = <&spdif_dir>;
>> +                     };
>> +             };
>> +
>> +             dai-link-12 {
>> +                     sound-dai = <&toacodec TOACODEC_OUT>;
>> +
>> +                     codec {
>> +                             sound-dai = <&acodec>;
>> +                     };
>> +             };
>> +     };
>>   };
>>
>>   &pwm_ef {
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> index dfc0a30a6e61..a6c2c83eea16 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> @@ -11,6 +11,11 @@
>>   #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>   #include <dt-bindings/power/meson-s4-power.h>
>>   #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
>> +#include <dt-bindings/clock/axg-audio-clkc.h>
>> +#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
>> +#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
>> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
>> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>>
>>   / {
>>        cpus {
>> @@ -863,4 +868,360 @@ emmc: mmc@fe08c000 {
>>                        assigned-clock-rates = <24000000>;
>>                };
>>        };
>> +
>> +     tdmif_a: audio-controller-0 {
>> +             compatible = "amlogic,axg-tdm-iface";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "TDM_A";
>> +             clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_A_MCLK>;
>> +             clock-names = "sclk", "lrclk","mclk";
>> +     };
>> +
>> +     tdmif_b: audio-controller-1 {
>> +             compatible = "amlogic,axg-tdm-iface";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "TDM_B";
>> +             clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_B_LRCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_B_MCLK>;
>> +             clock-names = "sclk", "lrclk","mclk";
>> +     };
>> +
>> +     tdmif_c: audio-controller-2 {
>> +             compatible = "amlogic,axg-tdm-iface";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "TDM_C";
>> +             clocks = <&clkc_audio AUD_CLKID_MST_C_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_C_LRCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_C_MCLK>;
>> +             clock-names = "sclk", "lrclk","mclk";
>> +     };
>> +};
>> +
>> +&apb4 {
>> +     acodec: audio-controller@1a000 {
>> +             compatible = "amlogic,t9015";
>> +             reg = <0x0 0x1a000 0x0 0x14>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "ACODEC";
>> +             clocks = <&clkc_periphs CLKID_ACODEC>;
>> +             clock-names = "pclk";
>> +             resets = <&reset RESET_ACODEC>;
>> +             AVDD-supply = <&vddio_ao1v8>;
>> +     };
>> +
>> +     clkc_audio: clock-controller@330000 {
>> +             compatible = "amlogic,s4-audio-clkc";
>> +             reg = <0x0 0x330000 0x0 0xd8>,
>> +                       <0x0 0x330e80 0x0 0x10>;
>> +             #clock-cells = <1>;
>> +             #reset-cells = <1>;
>> +             power-domains = <&pwrc PWRC_S4_AUDIO_ID>;
>> +             clocks = <&clkc_periphs CLKID_AUDIO>,
>> +                      <&clkc_pll CLKID_MPLL0>,
>> +                      <&clkc_pll CLKID_MPLL1>,
>> +                      <&clkc_pll CLKID_MPLL2>,
>> +                      <&clkc_pll CLKID_MPLL3>,
>> +                      <&clkc_pll CLKID_HIFI_PLL>,
>> +                      <&clkc_pll CLKID_FCLK_DIV3>,
>> +                      <&clkc_pll CLKID_FCLK_DIV4>,
>> +                      <&clkc_pll CLKID_FCLK_DIV5>;
>> +             clock-names = "pclk",
>> +                               "mst_in0",
>> +                               "mst_in1",
>> +                               "mst_in2",
>> +                               "mst_in3",
>> +                               "mst_in4",
>> +                               "mst_in5",
>> +                               "mst_in6",
>> +                               "mst_in7";
>> +             resets = <&reset RESET_AUDIO>;
>> +     };
>> +
>> +     toddr_a: audio-controller@330100 {
>> +             compatible = "amlogic,sm1-toddr",
>> +                              "amlogic,axg-toddr";
> no s4 compat ?
>
>> +             reg = <0x0 0x330100 0x0 0x2c>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "TODDR_A";
>> +             interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
>> +             clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
>> +             resets = <&arb AXG_ARB_TODDR_A>,
>> +                      <&clkc_audio AUD_RESET_TODDR_A>;
>> +             reset-names = "arb", "rst";
>> +             amlogic,fifo-depth = <8192>;
>> +     };
>> +
>> +     toddr_b: audio-controller@330140 {
>> +             compatible = "amlogic,sm1-toddr",
>> +                              "amlogic,axg-toddr";
>> +             reg = <0x0 0x330140 0x0 0x2c>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "TODDR_B";
>> +             interrupts = <GIC_SPI 33 IRQ_TYPE_EDGE_RISING>;
>> +             clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
>> +             resets = <&arb AXG_ARB_TODDR_B>,
>> +                      <&clkc_audio AUD_RESET_TODDR_B>;
>> +             reset-names = "arb", "rst";
>> +             amlogic,fifo-depth = <256>;
>> +     };
>> +
>> +     toddr_c: audio-controller@330180 {
>> +             compatible = "amlogic,sm1-toddr",
>> +                              "amlogic,axg-toddr";
>> +             reg = <0x0 0x330180 0x0 0x2c>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "TODDR_C";
>> +             interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
>> +             clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
>> +             resets = <&arb AXG_ARB_TODDR_C>,
>> +                      <&clkc_audio AUD_RESET_TODDR_C>;
>> +             reset-names = "arb", "rst";
>> +             amlogic,fifo-depth = <256>;
>> +     };
>> +
>> +     frddr_a: audio-controller@3301c0 {
>> +             compatible = "amlogic,sm1-frddr",
>> +                              "amlogic,axg-frddr";
>> +             reg = <0x0 0x3301c0 0x0 0x2c>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "FRDDR_A";
>> +             interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
>> +             clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
>> +             resets = <&arb AXG_ARB_FRDDR_A>,
>> +                      <&clkc_audio AUD_RESET_FRDDR_A>;
>> +             reset-names = "arb", "rst";
>> +             amlogic,fifo-depth = <512>;
>> +     };
>> +
>> +     frddr_b: audio-controller@330200 {
>> +             compatible = "amlogic,sm1-frddr",
>> +                              "amlogic,axg-frddr";
>> +             reg = <0x0 0x330200 0x0 0x2c>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "FRDDR_B";
>> +             interrupts = <GIC_SPI 37 IRQ_TYPE_EDGE_RISING>;
>> +             clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
>> +             resets = <&arb AXG_ARB_FRDDR_B>,
>> +                      <&clkc_audio AUD_RESET_FRDDR_B>;
>> +             reset-names = "arb", "rst";
>> +             amlogic,fifo-depth = <256>;
>> +     };
>> +
>> +     frddr_c: audio-controller@330240 {
>> +             compatible = "amlogic,sm1-frddr",
>> +                              "amlogic,axg-frddr";
>> +             reg = <0x0 0x330240 0x0 0x2c>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "FRDDR_C";
>> +             interrupts = <GIC_SPI 38 IRQ_TYPE_EDGE_RISING>;
>> +             clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
>> +             resets = <&arb AXG_ARB_FRDDR_C>,
>> +                      <&clkc_audio AUD_RESET_FRDDR_C>;
>> +             reset-names = "arb", "rst";
>> +             amlogic,fifo-depth = <256>;
>> +     };
>> +
>> +     arb: reset-controller@330280 {
>> +             compatible = "amlogic,meson-sm1-audio-arb";
>> +             reg = <0x0 0x330280 0x0 0x4>;
>> +             #reset-cells = <1>;
>> +             clocks = <&clkc_audio AUD_CLKID_DDR_ARB>;
>> +     };
>> +
>> +     tdmin_a: audio-controller@330300 {
>> +             compatible = "amlogic,sm1-tdmin";
>> +             reg = <0x0 0x330300 0x0 0x40>;
>> +             sound-name-prefix = "TDMIN_A";
>> +             resets = <&clkc_audio AUD_RESET_TDMIN_A>;
>> +             clocks = <&clkc_audio AUD_CLKID_TDMIN_A>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_A_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_A_SCLK_SEL>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>;
>> +             clock-names = "pclk", "sclk", "sclk_sel",
>> +                               "lrclk", "lrclk_sel";
>> +     };
>> +
>> +     tdmin_b: audio-controller@330340 {
>> +             compatible = "amlogic,sm1-tdmin";
>> +             reg = <0x0 0x330340 0x0 0x40>;
>> +             sound-name-prefix = "TDMIN_B";
>> +             resets = <&clkc_audio AUD_RESET_TDMIN_B>;
>> +             clocks = <&clkc_audio AUD_CLKID_TDMIN_B>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_B_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_B_SCLK_SEL>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>;
>> +             clock-names = "pclk", "sclk", "sclk_sel",
>> +                               "lrclk", "lrclk_sel";
>> +     };
>> +
>> +     tdmin_c: audio-controller@330380 {
>> +             compatible = "amlogic,sm1-tdmin";
>> +             reg = <0x0 0x330380 0x0 0x40>;
>> +             sound-name-prefix = "TDMIN_C";
>> +             resets = <&clkc_audio AUD_RESET_TDMIN_C>;
>> +             clocks = <&clkc_audio AUD_CLKID_TDMIN_C>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_C_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_C_SCLK_SEL>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>;
>> +             clock-names = "pclk", "sclk", "sclk_sel",
>> +                               "lrclk", "lrclk_sel";
>> +     };
>> +
>> +     tdmin_lb: audio-controller@3303c0 {
>> +             compatible = "amlogic,sm1-tdmin";
>> +             reg = <0x0 0x3303c0 0x0 0x40>;
>> +             sound-name-prefix = "TDMIN_LB";
>> +             resets = <&clkc_audio AUD_RESET_TDMIN_LB>;
>> +             clocks = <&clkc_audio AUD_CLKID_TDMIN_LB>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK_SEL>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>;
>> +             clock-names = "pclk", "sclk", "sclk_sel",
>> +                               "lrclk", "lrclk_sel";
>> +     };
>> +
>> +     spdifin: audio-controller@330400 {
>> +             compatible = "amlogic,g12a-spdifin",
>> +                              "amlogic,axg-spdifin";
>> +             reg = <0x0 0x330400 0x0 0x30>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "SPDIFIN";
>> +             interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
>> +             clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
>> +             <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
>> +             clock-names = "pclk", "refclk";
>> +             resets = <&clkc_audio AUD_RESET_SPDIFIN>;
>> +     };
>> +
>> +     spdifout_a: audio-controller@330480 {
>> +             compatible = "amlogic,g12a-spdifout",
>> +                              "amlogic,axg-spdifout";
>> +             reg = <0x0 0x330480 0x0 0x50>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "SPDIFOUT_A";
>> +             clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
>> +             <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
>> +             clock-names = "pclk", "mclk";
>> +             resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
>> +     };
>> +
>> +     tdmout_a: audio-controller@330500 {
>> +             compatible = "amlogic,sm1-tdmout";
>> +             reg = <0x0 0x330500 0x0 0x40>;
>> +             sound-name-prefix = "TDMOUT_A";
>> +             resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
>> +             clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
>> +                      <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
>> +                      <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
>> +             clock-names = "pclk", "sclk", "sclk_sel",
>> +                               "lrclk", "lrclk_sel";
>> +     };
>> +
>> +     tdmout_b: audio-controller@330540 {
>> +             compatible = "amlogic,sm1-tdmout";
>> +             reg = <0x0 0x330540 0x0 0x40>;
>> +             sound-name-prefix = "TDMOUT_B";
>> +             resets = <&clkc_audio AUD_RESET_TDMOUT_B>;
>> +             clocks = <&clkc_audio AUD_CLKID_TDMOUT_B>,
>> +                      <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK_SEL>,
>> +                      <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>;
>> +             clock-names = "pclk", "sclk", "sclk_sel",
>> +                               "lrclk", "lrclk_sel";
>> +     };
>> +
>> +     tdmout_c: audio-controller@330580 {
>> +             compatible = "amlogic,sm1-tdmout";
>> +             reg = <0x0 0x330580 0x0 0x40>;
>> +             sound-name-prefix = "TDMOUT_C";
>> +             resets = <&clkc_audio AUD_RESET_TDMOUT_C>;
>> +             clocks = <&clkc_audio AUD_CLKID_TDMOUT_C>,
>> +                      <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK_SEL>,
>> +                      <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>,
>> +                      <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>;
>> +             clock-names = "pclk", "sclk", "sclk_sel",
>> +                               "lrclk", "lrclk_sel";
>> +     };
>> +
>> +     spdifout_b: audio-controller@330680 {
>> +             compatible = "amlogic,g12a-spdifout",
>> +                              "amlogic,axg-spdifout";
>> +             reg = <0x0 0x330680 0x0 0x50>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "SPDIFOUT_B";
>> +             clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
>> +                      <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
>> +             clock-names = "pclk", "mclk";
>> +             resets = <&clkc_audio AUD_RESET_SPDIFOUT_B>;
>> +     };
>> +
>> +     toacodec: audio-controller@330740 {
>> +             compatible = "amlogic,s4-toacodec",
>> +                              "amlogic,g12a-toacodec";
>> +             reg = <0x0 0x330740 0x0 0x4>;
>> +             sound-name-prefix = "TOACODEC";
>> +             #sound-dai-cells = <1>;
>> +             resets = <&clkc_audio AUD_RESET_TOACODEC>;
>> +     };
>> +
>> +     tohdmitx: audio-controller@330744 {
>> +             compatible = "amlogic,sm1-tohdmitx",
>> +                              "amlogic,g12a-tohdmitx";
>> +             reg = <0x0 0x330744 0x0 0x4>;
>> +             #sound-dai-cells = <1>;
>> +             sound-name-prefix = "TOHDMITX";
>> +             resets = <&clkc_audio AUD_RESET_TOHDMITX>;
>> +     };
>> +
>> +     toddr_d: audio-controller@330840 {
>> +             compatible = "amlogic,sm1-toddr",
>> +                              "amlogic,axg-toddr";
>> +             reg = <0x0 0x330840 0x0 0x2c>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "TODDR_D";
>> +             interrupts = <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>;
>> +             clocks = <&clkc_audio AUD_CLKID_TODDR_D>;
>> +             resets = <&arb AXG_ARB_TODDR_D>,
>> +                      <&clkc_audio AUD_RESET_TODDR_D>;
>> +             reset-names = "arb", "rst";
>> +             amlogic,fifo-depth = <256>;
>> +     };
>> +
>> +     frddr_d: audio-controller@330880 {
>> +              compatible = "amlogic,sm1-frddr",
>> +                               "amlogic,axg-frddr";
>> +             reg = <0x0 0x330880 0x0 0x2c>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "FRDDR_D";
>> +             interrupts = <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
>> +             clocks = <&clkc_audio AUD_CLKID_FRDDR_D>;
>> +             resets = <&arb AXG_ARB_FRDDR_D>,
>> +                      <&clkc_audio AUD_RESET_FRDDR_D>;
>> +             reset-names = "arb", "rst";
>> +             amlogic,fifo-depth = <256>;
>> +     };
>> +
>> +     pdm: audio-controller@331000 {
>> +             compatible = "amlogic,sm1-pdm",
>> +                          "amlogic,axg-pdm";
>> +             reg = <0x0 0x331000 0x0 0x34>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "PDM";
>> +             clocks = <&clkc_audio AUD_CLKID_PDM>,
>> +                      <&clkc_audio AUD_CLKID_PDM_DCLK>,
>> +                      <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
>> +             clock-names = "pclk", "dclk", "sysclk";
>> +             resets = <&clkc_audio AUD_RESET_PDM>;
>> +     };
>>   };
> --
> Jerome
