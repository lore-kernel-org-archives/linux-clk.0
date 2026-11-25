Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612022;
	b=2DTYPKACOMknowESnUDKTcRGR8JhjU+PWy+fi46iREyue5Ab6hDEIo2T0z+Bgodqv/JW
	 QjSNAuQPX7jdJ1eVBjkkhzwqllHXgCqYcokEtl9sD8S7fPRWgtz8khKdugjvmKOuJYfA/
	 aLh88B9OVJFTB5kcRjTxXwx6Pm6o0UCENIdGXlmy660nOmi0x6BnfjEg9U/SAhn/xRAnO
	 JhHofmDU2BOMSls1BfR6sfhWMlJ+xx7VvuROL/nJA2vgOU7A1jUzR3EjXIfRBlo2h+tGH
	 cZvyPnpFUpW0tMwzpUm1nrlE5gyCUHxaXIDFDI7W6Wn7ByTYNvqrkoc2YtFDLT1ywnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612022;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zoTiRbfQdkrEX78vR/CR8unNYfWr/THTHVI9d+DTkbk=;
	b=neiU03a1PJeXnXW1O8y4/N9uz1EBKiF2RXL/a3rtyOyNKiYROTBUwM1V9pAsdCOQbJf0
	 JgBUBMCva1e82+WVMdisXkuF9oHmrOnnAI7Q8L9LBmcvu2ZUoIbQR0GGbs14/Tk+vlANa
	 NL/HBc2YsDrJEemRQYZ3adRO3uMgwI1eH013H/lVJ5UWxrxG23dG83X24QFwO/O9tXq3m
	 EdQMCcSIUx5RIHPDdOMYeS6H+t1TMC9PPnoYEwhlNWBum8zl/u682suAvlOtV54PTo0ux
	 qX77HmKO2sRPH/Ilku2uKBaJhIeg5rd7KYPXshJTRyPwUW7OmFUK3OYEpoNNTIFnRdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=Po2YSI6u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.81
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022081.outbound.protection.outlook.com [40.107.75.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F9B606A336;
	Wed, 25 Nov 2026 13:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F9B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=Po2YSI6u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOpk696V8gGdkzDmZ8QLp/csV55aYy032pXiApyS9LpyXtmxwpTGURHwvumo0rGpml4I6PkW/2s4vDyjw8MWkAwrN0lSZztGLSEzZjC/g8mItoUickeVEROia8zbkBJ0xEJWXZnCu1J2jeabRtxnQWwD/vs5rHC/jUS2dsJKCd6ZkB57qkhEU/Cn0+oYy1O6WTaUEuvI746qy16npTS/6RHFl/Da36GBcKxU4sF6YSg0nfBnL88a48es3SKF6wC8OmnrjGlcFrAJ0W+K3ISOa2wVWVnNNlV/tnoOjq6TaPfdNeAxKUyawB3yjDXCRrtcSUfa4ZeGQxb1R063m/A0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoTiRbfQdkrEX78vR/CR8unNYfWr/THTHVI9d+DTkbk=;
 b=H/8dJEtIIuCr3NNLD3QHn/tCkcNEB6flxxfMYueC58Pfs98in6Kbd1kdOMB6PUKfHnwLLwqvis4iIEodd3g4LVR0wXMJvXpPvj6wivxVGXw0zchbpzOcgjs3GJzdv+mDnJ2029o09si5mawva8prbDF2/ZhJTcm6rZksbUwfCpwhT9Rb3Xqi59fRukPLQksVch8hyL3mjcGB9QRlTW8WM2s+GTggCBfcGN2OX+g58wTdWVK0IvXbdpIe5HzxcVHYs9PTkx8jkToh4YfhdEf/UPpHplALlX7AEFe01Me4Frix3aZnX7KFU0n6DaKik2xTHVSTrumDW06HIUVK5M74TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoTiRbfQdkrEX78vR/CR8unNYfWr/THTHVI9d+DTkbk=;
 b=Po2YSI6uxXpRH/eGYhPqGo65Rq5fHky77bc+PeS5WaELpKy0wYS92D0pXyxDXpR6RWDEcqRnEDFpwJXrCE4YWv/3FhjZUzztRmXbNzghUt2Bh++cMuHLa14rfibP6edln7LzYoi6cQ1pXqCD+bJnt3nVwEGyg8ls0EpExJla7hMgxacxW5WkYqsMhZqGiGXoVHDP+B56Xk/bBPGDrx8avAaRv1u3N3iKc6JBPpDB3Gz66pBh3yViMV+pH40CWUader7COcf4ERfAs7bcrP7rH4mmETNoWaJPmQAkNEG41bYXZn6gInJ9w0sJN+xWLky4OCp3bS0XWOCeAegnD5rHdw==
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KL1PR03MB8452.apcprd03.prod.outlook.com with HTTP via P2P; Wed, 25 Nov
 2026 13:06:57 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 13:06:57 +0000
Message-ID: <98fc8cb8-186b-493e-b74c-d8625d11dab1@amlogic.com>
Date: Wed, 25 Nov 2026 21:06:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT v2 3/3] clk: meson: pll: Remove the dedicated n
 parameter
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-3-ff4ac74e527b@amlogic.com>
 <179390104085.2573818.48733523079260500.b4-review@b4>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <179390104085.2573818.48733523079260500.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KL1PR03MB8452:EE_
X-MS-PublicTrafficType: Email
client-request-id: b7a7d394-e222-408b-9e9a-9205597b526e
request-id: 17fa2980-e17e-403f-0002-08df4af4fc25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|22082099003|6133799003|3023799007|56012099006|11063799006|5023799004|4143699003|261102123227099003|261009223027099003|261026140227099003|261022105027099003|261026121527099003|261021123027099003|261021135927099003|261022113327099003|261028144727099003|261022075727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fatelVcKoPn6OugmY/MfI4iJ10o7RwBhM7qnGDDAoDBJrtDUdl4Ux4O66hGgaofzy4UUu8Vxi7jTBGpGk/ef/VCIl+Q0Ujm5YRrjRoH1BpNgTftiwYuVs+V7ABYctQIWDBihx1WkAxOv8Po37d3XerirtvJOSFd8cff+GWyEXS3TqYM/hmmU4T9/dDItzVhky7MlZ8oma07ByxAjQg7E1Mks3Nc5mZ3cZDZ+y02pfM8OSJTSMQXNkFCZ/NesD/7KCSvxLt9LHhv/5AYS+Bu251Mv9xlnnzhnk6N/n22M9n+qB7f4oF3kQ3zKk/i00DfABOMXcaspoAIwEnd4/bK8g+tCt8rmJMs4TdagpDdUljsswbH8qAjTiXHOSYZ+wna5awVxQBla4ZwJFMspMgFihfNDD416Qtj6JpJp4D7Kva3V2gIh0wqKkKxH5C4Wn1r9bEJErbrcvKgAMxrsriPaf7Bt9n6K62NEAcQ9NUeYYDfH/8vYgWzOVnXUknFNCw68HPn8Ql3IhNTi537rg3QxG7kxRoUuQICCNjUcWRe0dwAuYOofFWXvNeLhCNScxA2xU04pw1cQ2EYtAnSq2Ytdn1Ul3rJKy3Gvk7lGQB5MEcO343ps5TX6hucEZ+Etlo7fNmLRew3+e9z8DUTRtyT9k8a7o60h6/2Gkj1Ftjq+wCY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(11063799006)(5023799004)(4143699003)(261102123227099003)(261009223027099003)(261026140227099003)(261022105027099003)(261026121527099003)(261021123027099003)(261021135927099003)(261022113327099003)(261028144727099003)(261022075727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkRFakhGdWlhK01PTW43SS9CTTQweUJJTUxQbXpaVWFQLzF2aXFUb0dKc1Bz?=
 =?utf-8?B?dDhvdmhsUXBNL0k4Qkl4eC9wckFhT1oxcXlERW5meXVIa2RYZE01UTJ3R1lp?=
 =?utf-8?B?STUwUmo1RlovalE4NldNYkhaVFVPeW1UWDlMWjNzVVRFbktlOEpSb3RjbUxY?=
 =?utf-8?B?d2tKbFZXRHRXZXFJSzFQUnRBc1NTMGxkRTlqM3dTM3JkM3VQbWUyOE54V2Fu?=
 =?utf-8?B?enZiWURiVERBaisyV1ZoUDV0VkFRUGlBaVhrOG52Zmd0L1F0NUU2S3VGMmtM?=
 =?utf-8?B?UWlaQzNBNnhuUnB0cFU5YTFKRFVZOWppTUROck1sR3FXWmhoY2tOYXR3dWkr?=
 =?utf-8?B?aThVb2dzelhPQTdXeXhJWmplenZNNUJycFJsUmFUUjk0bU9HeDlWMXFIdWpC?=
 =?utf-8?B?QllJR3NFTG1sdm5yZnhDZDlqWTVvN09VS2RUYTJnbXpjMlZ5K20vNjBoc1J4?=
 =?utf-8?B?Ukx2QlR2OTlqUmljNnhKQ3BQNEVoK1hhS05sZzdtTzg4c0IydTAvSmIraGph?=
 =?utf-8?B?L0V6NmNLbVBSTmhDTGttaFlIcXNhcC96cjJhTEVVSWJxdU9IVlhjcUV5eEl3?=
 =?utf-8?B?WUZnQ1h4cGxObCs4KysvbkNuZ0RmUzFNeU1VQkhWMlBqM0NQYXJlUjc0bWFK?=
 =?utf-8?B?KzQ0Z3VQOTRIdXEzUVgrcEcxSzd0b3pJMHBMbSswVXFORElHSVJtV0lKaSsv?=
 =?utf-8?B?Sm84R1dmOVo3bWFlNXRGeTM0Q3RQRzNaQUVoZHBYY0lwRDcveWcvMEU1dytE?=
 =?utf-8?B?UW5tNDRrQWt5dUFwUGh5RmxISXFaSjNYaktMNHo5REhvdWVjc1BqdDBNTFk4?=
 =?utf-8?B?L3pXbnpubzVwMWVtUWt6R2RtV1VMYmpadzlTd3ROak5Nb1NDMkxSY2VBa3dl?=
 =?utf-8?B?Q09Za2J1WWR1SiszQU1TMVBqSlNYVE9IM3pzRGFxcmx5ajhnbklNU0QvbTBz?=
 =?utf-8?B?dFR2bWI4QWJxeWt2UlhqMUIvb3Vyay9qclRYSVhPZWN1MTA4QWlVdE5nQTBI?=
 =?utf-8?B?VkpkYVMyalFzdS93Z2w5cE1KeGlwdGlzSkkwSms4ai9JaEZrMlhENEZlYkRB?=
 =?utf-8?B?aTVVNGt6aVZJVzhSUE1HSFJaTmJ5bEhYNjhWdzN1VFJIekJJRUpacjZPaFZQ?=
 =?utf-8?B?WGtuN2RDdWh6Szc5WEl3Uzl0NDQydHNhTGh4bmJQZ2VoL2pIQUVvYUNTYjFx?=
 =?utf-8?B?eGtidndLRzNSaUNoNlJaczVZeXFQeGJMSy9pMngvTks5TTJyTUhxVVNKV0tn?=
 =?utf-8?B?blVpazhjcWtwb2JXM25vbks3dGdNd0FWSzhnN3JHMStrVFlSVjg0dVdseWwv?=
 =?utf-8?B?dmZBY2YrZXJwNU41RU51eEpEUmEwMG9XaWhNMGpPOWZCRHZ5MVM0Q283YmtL?=
 =?utf-8?B?VDFTSUxJS0Y0THB0eWNiMTV6dmxsUXA4NWxUcy85ZnVETDI3VTBla0pranBh?=
 =?utf-8?B?djlBdlZ1NVl5cXpwbjg4NVQ5S3h4dWkzMEZEdkZuSm10eVZsNFg4VDhBUmZ0?=
 =?utf-8?B?OUVqQUF1cWpUdW1yN2JWZy9ncU10UExkTW14eEJUQlo2ZDhBLzJMWW9qblZp?=
 =?utf-8?B?Y2xBdUhPNXM4Y0NzRDFrQituQzl6YkpoVGhuK2lRdlJjeWt4VitGRUxzRFFZ?=
 =?utf-8?B?V0FWODRzU3d6aW9EZHhQTmJIZVBBVWV5WllBdUJ2RVhFd2RzUHF4N00xL3B3?=
 =?utf-8?B?a3NyYzlGM0xuSWlWNHVuOFpoSHZRQkdoQk80QkY4c0dCVEZBdHZSMFVLMFJX?=
 =?utf-8?B?L1p3bzVwQ1gwVWZERnVia1Z4eHVlTXJtd1NnK3NGbmN3TGx2N0s3K01HT05w?=
 =?utf-8?B?ZGFLSnEwVFhNM3h3WEtKdG9pcFBXdWpwbThNUVZ6MzA4R2NrNnpHM3lzbnRh?=
 =?utf-8?B?MUhvejc3MHBPVWhtUlA0djBCNjlkUlc4ZDdKVWZUSGVUanIyeGpxd01IM2lG?=
 =?utf-8?B?cnY5dFlnaXZRZjEzeUZOL3o1V2luK2hURFVobXorRVp2MjBMODdLSlJMRW8z?=
 =?utf-8?B?T3gydkgxQVF6aDFIUmdMVXhzWmZBSi9UWmo5ZTZMTkVBK1hGTEhPNE5RN3lV?=
 =?utf-8?B?VWdjWUMyRUdKbDRudkpLdDIvN2JWZjJrM2c3K0tVcHMrTDhPcU1HRWhaeXQ0?=
 =?utf-8?B?NW5weExvckpFOXNRU2NxZWtOaTVQR3ZudlQ2by9iSTJBejdkMkd0bXoyS1pK?=
 =?utf-8?B?eDgzZXN6eGM0cEJDWnJCUlU4YThpajRBY2hWektSZUZRNWRrUXRLNmRleUo3?=
 =?utf-8?B?VHRybGRpZ0lHVkxqRFhxUHh1L1MrM1E0YTlHcWhmck1CQVpvNmRGWFkzV0xI?=
 =?utf-8?B?WHIyN3hZVHMya1ZLamtGR21qamRrOEo2VnZlWG1qZC9CWUx1NEE2UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fa2980-e17e-403f-0002-08df4af4fc25
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 13:06:57.5503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IH7SJIXJmEzoeLcr18BmSNqbyvzup4jqcKb6+K67xd+eXYPYSEIJTS2KsoDOgrlAnLwsoi/e7IdbnovR6x3QSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8452


On 11/6/2026 1:50 AM, Jerome Brunet wrote:
>> The Meson PLL framework models the PLL pre-divider (N) using a dedicated
>> field in struct meson_clk_pll_data. Since the common clock framework
>> already provides a generic divider implementation, there is no need to
>> keep PLL-specific support for it.
>>
>> The pre-divider is not intended to be dynamically adjusted. According to
>> the hardware design, each PLL has a single fixed N value, defined together
>> with the rest of the PLL. N = 1 for most PLLs, and N = 3 for a few special
>> cases (the axg PCIe PLL, gxbb Fixed PLL and the meson8b GP0 PLL). The PLL
>> input frequency constraints are respected by this fixed value.
>>
>> Remove the dedicated n parameter from the framework and simplify the PLL
>> rate calculation accordingly. The pre-divider will be represented as a
>> separate divider clock by platform drivers where needed.
>>
>> Replace the dedicated PLL pre-divider with a standalone divider clock
>> for all amlogic SoCs. The PLL DCO now takes the pre-divider clock
>> as its parent instead of the input clock directly.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/a1-pll.c     |  69 ++++++++--
>>   drivers/clk/meson/axg.c        | 230 +++++++++++++++++++++----------
>>   drivers/clk/meson/c3-pll.c     |  99 +++++++++++---
>>   drivers/clk/meson/clk-pll.c    | 203 +++++++++++----------------
>>   drivers/clk/meson/clk-pll.h    |  17 +--
>>   drivers/clk/meson/clk-regmap.h |   2 +-
>>   drivers/clk/meson/g12a.c       | 265 ++++++++++++++++++++++++++---------
>>   drivers/clk/meson/gxbb.c       | 304 +++++++++++++++++++++++++++--------------
>>   drivers/clk/meson/meson8-ddr.c |  39 +++++-
>>   drivers/clk/meson/meson8b.c    | 238 +++++++++++++++++++++-----------
>>   drivers/clk/meson/s4-pll.c     | 128 +++++++++++++----
>>   drivers/clk/meson/t7-pll.c     | 186 +++++++++++++++++++------
>>   12 files changed, 1224 insertions(+), 556 deletions(-)
>>
> This a fairly big chunk. What you could do is:
> - make the prediv optional in the PLL temporarily
> - make one change per soc
> - finally remove the prediv from the PLL


Ok, since Carlo has pushed the patch to make the pre-divider optional.

I will split this patch into 11 separate patches:

1. 8 patches to remove 'n' from various SoCs

2. one final patch that removes 'n' entirely.

>
>> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
>> index 100c4221256e..681ba329d52b 100644
>> --- a/drivers/clk/meson/a1-pll.c
>> +++ b/drivers/clk/meson/a1-pll.c
>> @@ -25,6 +25,36 @@
>>
>>   #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
>>
>> +/* Keep the pre-divider at 1 to achieve the best PLL performance. */
> What performance ?
>
> Suggest:
> Force the PLL pre-divider at 1 to minimize PLL jitter.


Ok, I will update the comment:

Force the PLL pre-divider at 1 to minimize PLL jitter.

>> +static const struct clk_div_table a1_prediv_div_table[] = {
> a1_pll_prediv_div_table


Ok, I will rename the table to a1_pll_prediv_div_table.

>
>> +     { .val = 1, .div = 1 },
>> +     { /* sentinel */ }
>> +};
>> +
>> +static struct clk_regmap a1_fixed_prediv = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = ANACTRL_FIXPLL_CTRL0,
>> +             .shift  = 10,
>> +             .width  = 5,
>> +             .table = a1_prediv_div_table,
> This table is only useful if the clock is writeable.
> Otherwise, a simple CLK_DIVIDER_ONE_BASED would do


Ok, I will remove the table and use 'CLK_DIVIDER_ONE_BASED' instead.

>> +             /*
>> +              * The PLL pre-divider have a zero value after reset,
>> +              * which does not produce a usable clock. Use
>> +              * CLK_DIVIDER_INVALID_ZERO to report this state correctly.
>> +              * The pre-dividers below use this flag for the same reason.
>> +              */
> That is the definition of the flag you've introduced, so I don't think it is necessary.


Ok, I will remove the comments.

>> +             .flags = CLK_DIVIDER_INVALID_ZERO,
> Actually that flag is pointless on RO clock.
>
> The point of this is not just to silence to warning but also to let the framework
> know the clock need initialization, which can only happen if it is writeable.


Got it, I will remove the flag 'CLK_DIVIDER_INVALID_ZERO' for RO clock.

>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "fixed_prediv",
>> +             .ops = &clk_regmap_divider_ro_ops,
> You've argued with sashiko that you are not using ro ops and don't
> need to care for them, yet here we are ...


Upon rechecking, `CLK_DIVIDER_INVALID_ZERO` only applies to writable 
dividers and should not

be present on read-only clocks. This was my mistake.

>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "fixpll_in",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +


[ ... ]

>> -static const struct pll_params_table axg_gp0_pll_params_table[] = {
>> -     PLL_PARAMS(40, 1),
>> -     PLL_PARAMS(41, 1),
>> -     PLL_PARAMS(42, 1),
>> -     PLL_PARAMS(43, 1),
>> -     PLL_PARAMS(44, 1),
>> -     PLL_PARAMS(45, 1),
>> -     PLL_PARAMS(46, 1),
>> -     PLL_PARAMS(47, 1),
>> -     PLL_PARAMS(48, 1),
>> -     PLL_PARAMS(49, 1),
>> -     PLL_PARAMS(50, 1),
>> -     PLL_PARAMS(51, 1),
>> -     PLL_PARAMS(52, 1),
>> -     PLL_PARAMS(53, 1),
>> -     PLL_PARAMS(54, 1),
>> -     PLL_PARAMS(55, 1),
>> -     PLL_PARAMS(56, 1),
>> -     PLL_PARAMS(57, 1),
>> -     PLL_PARAMS(58, 1),
>> -     PLL_PARAMS(59, 1),
>> -     PLL_PARAMS(60, 1),
>> -     PLL_PARAMS(61, 1),
>> -     PLL_PARAMS(62, 1),
>> -     PLL_PARAMS(63, 1),
>> -     PLL_PARAMS(64, 1),
>> -     PLL_PARAMS(65, 1),
>> -     PLL_PARAMS(66, 1),
>> -     PLL_PARAMS(67, 1),
>> -     PLL_PARAMS(68, 1),
>> +static const struct pll_mult_table axg_gp0_pll_params_table[] = {
>> +     PLL_MULT(40),
>> +     PLL_MULT(41),
>> +     PLL_MULT(42),
>> +     PLL_MULT(43),
>> +     PLL_MULT(44),
>> +     PLL_MULT(45),
>> +     PLL_MULT(46),
>> +     PLL_MULT(47),
>> +     PLL_MULT(48),
>> +     PLL_MULT(49),
>> +     PLL_MULT(50),
>> +     PLL_MULT(51),
>> +     PLL_MULT(52),
>> +     PLL_MULT(53),
>> +     PLL_MULT(54),
>> +     PLL_MULT(55),
>> +     PLL_MULT(56),
>> +     PLL_MULT(57),
>> +     PLL_MULT(58),
>> +     PLL_MULT(59),
>> +     PLL_MULT(60),
>> +     PLL_MULT(61),
>> +     PLL_MULT(62),
>> +     PLL_MULT(63),
>> +     PLL_MULT(64),
>> +     PLL_MULT(65),
>> +     PLL_MULT(66),
>> +     PLL_MULT(67),
>> +     PLL_MULT(68),
>>        { /* sentinel */ },
>>   };
> Contiguous tables make no sense anymore.


Ok, I will use range instead.

>> +static struct clk_regmap axg_gp0_prediv = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = HHI_GP0_PLL_CNTL,
>> +             .shift   = 9,
>> +             .width   = 5,
>> +             .table = axg_prediv_div_table,
>> +             .flags = CLK_DIVIDER_INVALID_ZERO,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "gp0_prediv",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "xtal",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>>   static const struct reg_sequence axg_gp0_init_regs[] = {
>>        { .reg = HHI_GP0_PLL_CNTL1,     .def = 0xc084b000 },
>>        { .reg = HHI_GP0_PLL_CNTL2,     .def = 0xb75020be },
>> @@ -280,11 +337,6 @@ static struct clk_regmap axg_gp0_pll_dco = {
>>                        .shift   = 0,
>>                        .width   = 9,
>>                },
>> -             .n = {
>> -                     .reg_off = HHI_GP0_PLL_CNTL,
>> -                     .shift   = 9,
>> -                     .width   = 5,
>> -             },
>>                .frac = {
>>                        .reg_off = HHI_GP0_PLL_CNTL1,
>>                        .shift   = 0,
>> @@ -307,10 +359,11 @@ static struct clk_regmap axg_gp0_pll_dco = {
>>        .hw.init = &(struct clk_init_data){
>>                .name = "gp0_pll_dco",
>>                .ops = &meson_clk_pll_ops,
>> -             .parent_data = &(const struct clk_parent_data) {
>> -                     .fw_name = "xtal",
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &axg_gp0_prediv.hw
>>                },
>>                .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>>
>> @@ -332,6 +385,24 @@ static struct clk_regmap axg_gp0_pll = {
>>        },
>>   };
>>
>> +static struct clk_regmap axg_hifi_prediv = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = HHI_HIFI_PLL_CNTL,
>> +             .shift   = 9,
>> +             .width   = 5,
>> +             .table = axg_prediv_div_table,
>> +             .flags = CLK_DIVIDER_INVALID_ZERO,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "hifi_prediv",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "xtal",
>> +             },
>> +             .num_parents = 1,
>> +     },
>> +};
>> +
>>   static const struct reg_sequence axg_hifi_pll_init_regs[] = {
>>        { .reg = HHI_HIFI_PLL_CNTL1,    .def = 0xc084b000 },
>>        { .reg = HHI_HIFI_PLL_CNTL2,    .def = 0xb75020be },
>> @@ -352,11 +423,6 @@ static struct clk_regmap axg_hifi_pll_dco = {
>>                        .shift   = 0,
>>                        .width   = 9,
>>                },
>> -             .n = {
>> -                     .reg_off = HHI_HIFI_PLL_CNTL,
>> -                     .shift   = 9,
>> -                     .width   = 5,
>> -             },
>>                .frac = {
>>                        .reg_off = HHI_HIFI_PLL_CNTL5,
>>                        .shift   = 0,
>> @@ -380,10 +446,11 @@ static struct clk_regmap axg_hifi_pll_dco = {
>>        .hw.init = &(struct clk_init_data){
>>                .name = "hifi_pll_dco",
>>                .ops = &meson_clk_pll_ops,
>> -             .parent_data = &(const struct clk_parent_data) {
>> -                     .fw_name = "xtal",
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &axg_hifi_prediv.hw
>>                },
>>                .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>>        },
>>   };
>>
>> @@ -771,11 +838,35 @@ static struct clk_regmap axg_mpll3 = {
>>        },
>>   };
>>
>> -static const struct pll_params_table axg_pcie_pll_params_table[] = {
>> -     {
>> -             .m = 200,
>> -             .n = 3,
>> +/*
>> + * A pre-divider value of 3 provides the best performance for
>> + * the AXG PCIe PLL.
>> + */
> Again, define performance here. what does it mean ?


To clarify what "performance" means in that comment:

Some target frequencies cannot be achieved with N=1, requiring a non 1 
pre-divider.

N may not be 1 for Amlogic fixed PLLs and PCIe PLLs.

This AXG PCIe PLL is designed based on N=3 for optimal bandwidth.


The AXG PCIe PLL rate is:

24Mhz/3 * 200 /2/8 =100Mhz.


I will update the comment:

/*

  * This AXG PCIe PLL needs pre-divider 3 to hit the target frequency 
100Mhz,

  * which also yields optimal bandwidth.

  */

>> +static const struct clk_div_table axg_pcie_prediv_div_table[] = {
>> +     { .val = 3, .div = 3 },
>> +     { /* sentinel */ }
>> +};
>> +
>> +static struct clk_regmap axg_pcie_prediv = {
>> +     .data = &(struct clk_regmap_div_data){
>> +             .offset = HHI_PCIE_PLL_CNTL,
>> +             .shift   = 9,
>> +             .width   = 5,
>> +             .table = axg_pcie_prediv_div_table,
>> +             .flags = CLK_DIVIDER_INVALID_ZERO,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "pcie_prediv",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "xtal",
>> +             },
>> +             .num_parents = 1,
>>        },
>> +};
>> +
>> +static const struct pll_mult_table axg_pcie_pll_params_table[] = {
>> +     PLL_MULT(200),
>>        { /* sentinel */ },
>>   };
>>

[ ... ]

>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>> index 1ea6579a760f..a7e3f8c8eb78 100644
>> --- a/drivers/clk/meson/clk-pll.c
>> +++ b/drivers/clk/meson/clk-pll.c
>> @@ -14,7 +14,7 @@
>>    *        +--------------------------------+
>>    *        |                                |
>>    *        |             +--+               |
>> - *  in >>-----[ /N ]--->|  |      +-----+  |
>> + *  in >>----------->|  |      +-----+  |
>>    *        |             |  |------| DCO |---->> out
>>    *        |  +--------->|  |      +--v--+  |
>>    *        |  |          +--+         |     |
>> @@ -23,7 +23,7 @@
>>    *        |                                |
>>    *        +--------------------------------+
>>    *
>> - * out = in * (m + frac / frac_max) / n
>> + * out = in * (m + frac / frac_max)
>>    */
>>
>>   #include <linux/clk-provider.h>
>> @@ -52,8 +52,7 @@ static int __pll_round_closest_mult(struct meson_clk_pll_data *pll)
>>   }
>>
>>   static unsigned long __pll_params_to_rate(unsigned long parent_rate,
>> -                                       unsigned int m, unsigned int n,
>> -                                       unsigned int frac,
>> +                                       unsigned int m, unsigned int frac,
>>                                          struct meson_clk_pll_data *pll)
>>   {
>>        u64 rate = (u64)parent_rate * m;
>> @@ -66,7 +65,7 @@ static unsigned long __pll_params_to_rate(unsigned long parent_rate,
>>                rate += DIV_ROUND_UP_ULL(frac_rate, frac_max);
>>        }
>>
>> -     return DIV_ROUND_UP_ULL(rate, n);
>> +     return rate;
>>   }
>>
>>   static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
>> @@ -74,17 +73,7 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
>>   {
>>        struct clk_regmap *clk = to_clk_regmap(hw);
>>        struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>> -     unsigned int m, n, frac;
>> -
>> -     n = meson_parm_read(clk->map, &pll->n);
>> -
>> -     /*
>> -      * On some HW, N is set to zero on init. This value is invalid as
>> -      * it would result in a division by zero. The rate can't be
>> -      * calculated in this case
>> -      */
>> -     if (n == 0)
>> -             return 0;
>> +     unsigned int m, frac;
>>
>>        m = meson_parm_read(clk->map, &pll->m);
>>
>> @@ -92,21 +81,20 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
>>                meson_parm_read(clk->map, &pll->frac) :
>>                0;
>>
>> -     return __pll_params_to_rate(parent_rate, m, n, frac, pll);
>> +     return __pll_params_to_rate(parent_rate, m, frac, pll);
>>   }
>>
>>   static unsigned int __pll_params_with_frac(unsigned long rate,
>>                                           unsigned long parent_rate,
>>                                           unsigned int m,
>> -                                        unsigned int n,
>>                                           struct meson_clk_pll_data *pll)
>>   {
>>        unsigned int frac_max = pll->frac_max ? pll->frac_max :
>>                                                (1 << pll->frac.width);
>> -     u64 val = (u64)rate * n;
>> +     u64 val = (u64)rate;
>>
>>        /* Bail out if we are already over the requested rate */
>> -     if (rate < parent_rate * m / n)
>> +     if (rate < parent_rate * m)
>>                return 0;
>>
>>        if (pll->flags & CLK_MESON_PLL_ROUND_CLOSEST)
>> @@ -119,128 +107,76 @@ static unsigned int __pll_params_with_frac(unsigned long rate,
>>        return min((unsigned int)val, (frac_max - 1));
>>   }
>>
>> -static bool meson_clk_pll_is_better(unsigned long rate,
>> -                                 unsigned long best,
>> -                                 unsigned long now,
>> -                                 struct meson_clk_pll_data *pll)
>> +static int meson_clk_get_pll_range(unsigned long rate,
>> +                                unsigned long parent_rate,
>> +                                unsigned int *m,
>> +                                struct meson_clk_pll_data *pll)
>>   {
>> -     if (__pll_round_closest_mult(pll)) {
>> -             /* Round Closest */
>> -             if (abs(now - rate) < abs(best - rate))
>> -                     return true;
>> -     } else {
>> -             /* Round down */
>> -             if (now <= rate && best < now)
>> -                     return true;
>> +     if (rate <= pll->range->min * parent_rate) {
>> +             *m = pll->range->min;
>> +             return -ENODATA;
>> +     } else if (rate >= pll->range->max * parent_rate) {
>> +             *m = pll->range->max;
>> +             return -ENODATA;
>>        }
>>
>> -     return false;
>> -}
>> +     if (__pll_round_closest_mult(pll))
>> +             *m = DIV_ROUND_CLOSEST_ULL(rate, parent_rate);
>> +     else
>> +             *m = div_u64(rate, parent_rate);
>>
>> -static int meson_clk_get_pll_table_index(unsigned int index,
>> -                                      unsigned int *m,
>> -                                      unsigned int *n,
>> -                                      struct meson_clk_pll_data *pll)
>> -{
>> -     if (!pll->table[index].n)
>> +     /* Multiplier exceeds hardware range */
>> +     if (*m >= (1 << pll->m.width))
>>                return -EINVAL;
>>
>> -     *m = pll->table[index].m;
>> -     *n = pll->table[index].n;
>> -
>>        return 0;
>>   }
>>
>> -static unsigned int meson_clk_get_pll_range_m(unsigned long rate,
>> -                                           unsigned long parent_rate,
>> -                                           unsigned int n,
>> -                                           struct meson_clk_pll_data *pll)
>> +static int meson_clk_get_pll_table(unsigned long rate,
>> +                                unsigned long parent_rate,
>> +                                unsigned int *m,
>> +                                struct meson_clk_pll_data *pll)
>>   {
>> -     u64 val = (u64)rate * n;
>> -
>> -     if (__pll_round_closest_mult(pll))
>> -             return DIV_ROUND_CLOSEST_ULL(val, parent_rate);
>> -
>> -     return div_u64(val,  parent_rate);
>> -}
>> -
>> -static int meson_clk_get_pll_range_index(unsigned long rate,
>> -                                      unsigned long parent_rate,
>> -                                      unsigned int index,
>> -                                      unsigned int *m,
>> -                                      unsigned int *n,
>> -                                      struct meson_clk_pll_data *pll)
>> -{
>> -     *n = index + 1;
>> +     unsigned int i;
>> +     int ret;
>>
>> -     /* Check the predivider range */
>> -     if (*n >= (1 << pll->n.width))
>> -             return -EINVAL;
>> +     for (i = 0, ret = 0; !ret; i++) {
>> +             if (!pll->table[i].m)
>> +                     return -EINVAL;
>>
>> -     if (*n == 1) {
>> -             /* Get the boundaries out the way */
>> -             if (rate <= pll->range->min * parent_rate) {
>> -                     *m = pll->range->min;
>> -                     return -ENODATA;
>> -             } else if (rate >= pll->range->max * parent_rate) {
>> -                     *m = pll->range->max;
>> -                     return -ENODATA;
>> +             if (pll->table[i].m == rate / parent_rate) {
>> +                     *m = pll->table[i].m;
>> +                     return 0;
>>                }
>>        }
>>
>> -     *m = meson_clk_get_pll_range_m(rate, parent_rate, *n, pll);
>> -
>> -     /* the pre-divider gives a multiplier too big - stop */
>> -     if (*m >= (1 << pll->m.width))
>> -             return -EINVAL;
>> -
>>        return 0;
>>   }
>>
>> -static int meson_clk_get_pll_get_index(unsigned long rate,
>> -                                    unsigned long parent_rate,
>> -                                    unsigned int index,
>> -                                    unsigned int *m,
>> -                                    unsigned int *n,
>> -                                    struct meson_clk_pll_data *pll)
>> +static int meson_clk_get_pll_multiplier(unsigned long rate,
>> +                                     unsigned long parent_rate,
>> +                                     unsigned int *m,
>> +                                     struct meson_clk_pll_data *pll)
>>   {
>>        if (pll->range)
>> -             return meson_clk_get_pll_range_index(rate, parent_rate,
>> -                                                  index, m, n, pll);
>> +             return meson_clk_get_pll_range(rate, parent_rate, m, pll);
>>        else if (pll->table)
>> -             return meson_clk_get_pll_table_index(index, m, n, pll);
>> +             return meson_clk_get_pll_table(rate, parent_rate, m, pll);
>>
>>        return -EINVAL;
>>   }
>>
>> -static int meson_clk_get_pll_settings(unsigned long rate,
>> -                                   unsigned long parent_rate,
>> -                                   unsigned int *best_m,
>> -                                   unsigned int *best_n,
>> -                                   struct meson_clk_pll_data *pll)
>> +static unsigned int meson_clk_get_pll_max_multiplier(struct meson_clk_pll_data *pll)
>>   {
>> -     unsigned long best = 0, now = 0;
>> -     unsigned int i, m, n;
>> -     int ret;
>> +     unsigned int i, max_mult = 0;
>>
>> -     for (i = 0, ret = 0; !ret; i++) {
>> -             ret = meson_clk_get_pll_get_index(rate, parent_rate,
>> -                                               i, &m, &n, pll);
>> -             if (ret == -EINVAL)
>> -                     break;
>> -
>> -             now = __pll_params_to_rate(parent_rate, m, n, 0, pll);
>> -             if (meson_clk_pll_is_better(rate, best, now, pll)) {
>> -                     best = now;
>> -                     *best_m = m;
>> -                     *best_n = n;
>> -
>> -                     if (now == rate)
>> -                             break;
>> -             }
>> -     }
>> +     if (pll->range)
>> +             return pll->range->max;
>> +
>> +     for (i = 0; pll->table && pll->table[i].m; i++)
>> +             max_mult = max(max_mult, pll->table[i].m);
>>
>> -     return best ? 0 : -EINVAL;
>> +     return max_mult;
>>   }
>>
>>   static int meson_clk_pll_determine_rate(struct clk_hw *hw,
>> @@ -248,16 +184,32 @@ static int meson_clk_pll_determine_rate(struct clk_hw *hw,
>>   {
>>        struct clk_regmap *clk = to_clk_regmap(hw);
>>        struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>> -     unsigned int m, n, frac;
>> +     unsigned int max_mult, m, frac;
>>        unsigned long round;
>>        int ret;
>>
>> -     ret = meson_clk_get_pll_settings(req->rate, req->best_parent_rate,
>> -                                      &m, &n, pll);
>> -     if (ret)
>> +     /*
>> +      * The pre-divider resets to an invalid zero value and reports a
>> +      * zero rate until it gets programmed. Ask the parent for the
>> +      * lowest rate which keeps the requested rate reachable; the CCF
>> +      * will program the pre-divider when applying the parent rate.
>> +      */
>> +     if (!req->best_parent_rate) {
> No you are only handling on the prediv being on its bad value here.
> Doing that is incorrect.
>
> What you must do is properly implement rate propagation, without assuming
> the predivider is RO.
>
> The mean calling clk_hw_round_rate() and not just when the its rate is 0
>
>> +             max_mult = meson_clk_get_pll_max_multiplier(pll);
>> +             if (!max_mult)
>> +                     return -EINVAL;
>> +
>> +             req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
>> +                                                       DIV_ROUND_UP_ULL(req->rate, max_mult));
> The above means you would prefer the running PLL on its max multiplier,
> so a lower parent clock.
>
> What happens if the prediv round the clock rate down from this request ?
> AFAIU, you'd end up out of range and would not be able to abjust
>
> A way to deal with this could be to :
> * target the middle of the range and round the parent
> * If the parent provided allows the range to provide the requested freq, you stop here
> * if the parent_rate provided would put the multiplier out of range,
>    then, you ask again targeting min if you were above max ... and if you are still above max => EINVAL.
>
> It is a trial and error approach similar to what the simple divider is doing.
> The difference here is frac gives you a very fine adjustement ability so all you need from the parent
> is to be in the range.


Ok, I will update meson_clk_pll_determine_rate as your suggestion.

>> +             if (!req->best_parent_rate)
>> +                     return -EINVAL;
>> +     }
>> +
>> +     ret = meson_clk_get_pll_multiplier(req->rate, req->best_parent_rate, &m, pll);
>> +     if (ret && ret != -ENODATA)
>>                return ret;
>>
>> -     round = __pll_params_to_rate(req->best_parent_rate, m, n, 0, pll);
>> +     round = __pll_params_to_rate(req->best_parent_rate, m, 0, pll);
>>
>>        if (!MESON_PARM_APPLICABLE(&pll->frac) || req->rate == round) {
>>                req->rate = round;
>> @@ -268,8 +220,8 @@ static int meson_clk_pll_determine_rate(struct clk_hw *hw,
>>         * The rate provided by the setting is not an exact match, let's
>>         * try to improve the result using the fractional parameter
>>         */
>> -     frac = __pll_params_with_frac(req->rate, req->best_parent_rate, m, n, pll);
>> -     req->rate = __pll_params_to_rate(req->best_parent_rate, m, n, frac, pll);
>> +     frac = __pll_params_with_frac(req->rate, req->best_parent_rate, m, pll);
>> +     req->rate = __pll_params_to_rate(req->best_parent_rate, m, frac, pll);
>>
>>        return 0;
>>   }
>> @@ -420,7 +372,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>   {
>>        struct clk_regmap *clk = to_clk_regmap(hw);
>>        struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>> -     unsigned int enabled, m, n, frac = 0;
>> +     unsigned int enabled, m, frac = 0;
>>        unsigned long old_rate;
>>        int ret;
>>
>> @@ -429,19 +381,18 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>
>>        old_rate = clk_hw_get_rate(hw);
>>
>> -     ret = meson_clk_get_pll_settings(rate, parent_rate, &m, &n, pll);
>> -     if (ret)
>> +     ret = meson_clk_get_pll_multiplier(rate, parent_rate, &m, pll);
>> +     if (ret && ret != -ENODATA)
>>                return ret;
>>
>>        enabled = meson_parm_read(clk->map, &pll->en);
>>        if (enabled)
>>                meson_clk_pll_disable(hw);
>>
>> -     meson_parm_write(clk->map, &pll->n, n);
> N used to be written here. With your change, it could be written out of this
> code, possibly while the PLL is running.
>
> Should the PLL use CLK_SET_RATE_GATE ?


N is typically fixed. When the PLL is enabled, N is already configured 
as expected,
and rate changes only touch DCO and output divider without modifying N.
N is only programmed to its fixed value in set_rate when the PLL is 
disabled.

Since there is no path that writes N while the PLL is running,

'CLK_SET_RATE_GATE' is unnecessary.

>>        meson_parm_write(clk->map, &pll->m, m);
>>
>>        if (MESON_PARM_APPLICABLE(&pll->frac)) {
>> -             frac = __pll_params_with_frac(rate, parent_rate, m, n, pll);
>> +             frac = __pll_params_with_frac(rate, parent_rate, m, pll);
>>                meson_parm_write(clk->map, &pll->frac, frac);
>>        }
>>
>> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
>> index 949157fb7bf5..cf20deaac1ed 100644
>> --- a/drivers/clk/meson/clk-pll.h
>> +++ b/drivers/clk/meson/clk-pll.h
>> @@ -11,9 +11,8 @@
>>   #include <linux/regmap.h>
>>   #include "parm.h"
>>
>> -struct pll_params_table {
>> -     unsigned int    m;
>> -     unsigned int    n;
>> +struct pll_mult_table {
> nit: a struct with a single member. A plain 0-terminated
> `const unsigned int *` list of multipliers would do
>
> Also, there are spaces instead of a tab before `m`.


Ok, I'll remove the single-member struct and switch to a 0-terminated 
unsigned int array.

The helper's table pointer will be updated to 'const unsigned int *'.

The spacing issue is resolved as a result.


To avoid ending this series with a mechanical patch touching every SoC.

I will submit a separate patch before the per-SoC changes to add a 
'mult_table' member

to the 'struct meson_meson_clk_pll_data' structure.

>> +     unsigned int    m;
>>   };
>>
>>   struct pll_mult_range {
>> @@ -21,11 +20,10 @@ struct pll_mult_range {
>>        unsigned int    max;
>>   };
>>
>> -#define PLL_PARAMS(_m, _n)                                           \
>> -     {                                                               \
>> -             .m              = (_m),                                 \
>> -             .n              = (_n),                                 \
>> -     }
>> +#define PLL_MULT(_m)                 \
>> +{                                    \
>> +     .m = (_m),                      \
>> +}
>>
>>   #define CLK_MESON_PLL_ROUND_CLOSEST  BIT(0)
>>   #define CLK_MESON_PLL_NOINIT_ENABLED BIT(1)
>> @@ -33,7 +31,6 @@ struct pll_mult_range {
>>   struct meson_clk_pll_data {
>>        struct parm en;
>>        struct parm m;
>> -     struct parm n;
>>        struct parm frac;
>>        struct parm l;
>>        struct parm rst;
>> @@ -41,7 +38,7 @@ struct meson_clk_pll_data {
>>        struct parm l_detect;
>>        const struct reg_sequence *init_regs;
>>        unsigned int init_count;
>> -     const struct pll_params_table *table;
>> +     const struct pll_mult_table *table;
>>        const struct pll_mult_range *range;
>>        unsigned int frac_max;
>>        u8 flags;
>> diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
>> index 8e5c39b023e1..ee2a4b3408f0 100644
>> --- a/drivers/clk/meson/clk-regmap.h
>> +++ b/drivers/clk/meson/clk-regmap.h
>> @@ -75,7 +75,7 @@ struct clk_regmap_div_data {
>>        unsigned int    offset;
>>        u8              shift;
>>        u8              width;
>> -     u8              flags;
>> +     u16             flags;
> Needed for BIT(9). This is a clk-regmap change that every Amlogic user of
> the flag depends on. A separate small patch before this one would be
> clearer, or at least mention it in the commit message.


Ok, I'll split this into a separate prior patch and note it in the 
commit message.

>>        const struct clk_div_table      *table;
>>   };
>>
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index d0d4c7b6dc82..4be367c89aca 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c


[ ... ]

>> @@ -765,15 +884,15 @@ static struct clk_regmap g12a_hdmi_pll_dco = {
>>        .hw.init = &(struct clk_init_data){
>>                .name = "hdmi_pll_dco",
>>                .ops = &meson_clk_pll_ro_ops,
>> -             .parent_data = &(const struct clk_parent_data) {
>> -                     .fw_name = "xtal",
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &g12a_hdmi_prediv.hw
>>                },
>>                .num_parents = 1,
>>                /*
>>                 * Display directly handle hdmi pll registers ATM, we need
>>                 * NOCACHE to keep our view of the clock as accurate as possible
>>                 */
>> -             .flags = CLK_GET_RATE_NOCACHE,
>> +             .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> On these SoCs, the display clocks registers are poked directly by DRM unfortunately.
> Those clocks are read-only and NO CACHE, including the prediv.
>
> CLK_SET_RATE_PARENT does not make sense in that case.


Ok, I will remove 'CLK_SET_RATE_PARENT' here.

>>        },
>>   };
>>

[ ... ]

>> +
>> +static const struct pll_mult_table gxbb_gp0_pll_params_table[] = {
>> +     PLL_MULT(32),
>> +     PLL_MULT(33),
>> +     PLL_MULT(34),
>> +     PLL_MULT(35),
>> +     PLL_MULT(36),
>> +     PLL_MULT(37),
>> +     PLL_MULT(38),
>> +     PLL_MULT(39),
>> +     PLL_MULT(40),
>> +     PLL_MULT(41),
>> +     PLL_MULT(42),
>> +     PLL_MULT(43),
>> +     PLL_MULT(44),
>> +     PLL_MULT(45),
>> +     PLL_MULT(46),
>> +     PLL_MULT(47),
>> +     PLL_MULT(48),
>> +     PLL_MULT(49),
>> +     PLL_MULT(50),
>> +     PLL_MULT(51),
>> +     PLL_MULT(52),
>> +     PLL_MULT(53),
>> +     PLL_MULT(54),
>> +     PLL_MULT(55),
>> +     PLL_MULT(56),
>> +     PLL_MULT(57),
>> +     PLL_MULT(58),
>> +     PLL_MULT(59),
>> +     PLL_MULT(60),
>> +     PLL_MULT(61),
>> +     PLL_MULT(62),
>>        { /* sentinel */ },
> Again ... drop those, it is something I had already asked on v1 I think.


Ok, I will drop the table and use a range instead.

>>   };
>>

[ ... ]

>>
>> -static const struct pll_params_table sys_pll_params_table[] = {
>> -     PLL_PARAMS(50, 1),
>> -     PLL_PARAMS(51, 1),
>> -     PLL_PARAMS(52, 1),
>> -     PLL_PARAMS(53, 1),
>> -     PLL_PARAMS(54, 1),
>> -     PLL_PARAMS(55, 1),
>> -     PLL_PARAMS(56, 1),
>> -     PLL_PARAMS(57, 1),
>> -     PLL_PARAMS(58, 1),
>> -     PLL_PARAMS(59, 1),
>> -     PLL_PARAMS(60, 1),
>> -     PLL_PARAMS(61, 1),
>> -     PLL_PARAMS(62, 1),
>> -     PLL_PARAMS(63, 1),
>> -     PLL_PARAMS(64, 1),
>> -     PLL_PARAMS(65, 1),
>> -     PLL_PARAMS(66, 1),
>> -     PLL_PARAMS(67, 1),
>> -     PLL_PARAMS(68, 1),
>> -     PLL_PARAMS(84, 1),
>> +static const struct pll_mult_table sys_pll_params_table[] = {
>> +     PLL_MULT(50),
>> +     PLL_MULT(51),
>> +     PLL_MULT(52),
>> +     PLL_MULT(53),
>> +     PLL_MULT(54),
>> +     PLL_MULT(55),
>> +     PLL_MULT(56),
>> +     PLL_MULT(57),
>> +     PLL_MULT(58),
>> +     PLL_MULT(59),
>> +     PLL_MULT(60),
>> +     PLL_MULT(61),
>> +     PLL_MULT(62),
>> +     PLL_MULT(63),
>> +     PLL_MULT(64),
>> +     PLL_MULT(65),
>> +     PLL_MULT(66),
>> +     PLL_MULT(67),
>> +     PLL_MULT(68),
>> +     PLL_MULT(84),
>>        { /* sentinel */ },
>>   };
>>
>> +static const struct clk_div_table meson8b_fixed_prediv_div_table[] = {
>> +     { .val = 4, .div = 4 },
> Previous table was showing a prediv of 1 ... here it jumps to 4 without
> an explanation !
>
> Also, it is a RO clock, so what is the point ?


This is similar to the AXG PCIe PLL case. The pre-divider is fixed at 4,
which lets this fixed PLL output 2550MHz and gives optimal bandwidth.
The table was used so the fixed PLL DCO rate can be calculated correctly.
Without the table or `CLK_DIVIDER_ONE_BASED`, the divider would be 
interpreted as 5,
leading to wrong DCO rate calculation.


The 'HHI_MPLL_CNTL' register for this fixed PLL is set to 0x600009a9.
The output frequency of the fixed PLL is calculated as follows:

24Mhz*425/4 = 2550Mhz.


I will remove the table and 'CLK_DIVIDER_INVALID_ZERO', and switch to 
'CLK_DIVIDER_ONE_BASED' instead.

> --
> Jerome

--

Jian

