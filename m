Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022088.outbound.protection.outlook.com [40.107.75.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8590369D68;
	Wed, 20 May 2026 03:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779248142; cv=fail; b=PFIPiCVSaII+n4ef6Vtd7iAEYZ6O/iOP0GbtLQG+gcF3E5xx8EQcWMEN65fh96DQEe1+nKGVi5SWieb7+t8JyAiVvCB7TVwYqTo8whUYs0Xu9Drm/nQN79bKTGbi0LyaTufzw/+4Okm6tFgmo3oRC34pe54Jj6Kf+wEn8TEOY1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779248142; c=relaxed/simple;
	bh=SvUODLX51emcIjwk4Zro3LT67VQsqeeikDOsIVxaOwM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tHcCnrGVZK3npn5PR4wfwW3l+Wi80PsZqRqpvGeAo0/8ThfBlEh7sktK+WdeXt5A0P4gvURgZXsOm7bw0IHoFeR10j8t2jb0b/z81PAyFO83KpwU1bnOMPemcAejQUWRBFui0Ear/sXRhif9hDz+jrCwiUb/B0iZyC0zY1/GjP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=IW8qMaMx; arc=fail smtp.client-ip=40.107.75.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="IW8qMaMx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6E8E0/o1d6+Kc1sLiz7JD/JuAsDwv/Psoi3YQ2hYdAZPnQWu+LcySBHPaHTdpi3+mcCH9bQZ1T1Lq2vozag+J3Z08eRHTAe7f3x+h18XstaB87qTjJ1xWA+qRwrmuWDbOAkEoz0gZ5J/pjLk3DJrXXhWSEek7NXEm8HGd2+n453bJz2I7u9iknQUDlq+zpogaEaMUHR8YYu51lH8w0V/JFPOVhBQ7sEz6JseLTy/xvFWF1t7lJEnPpQX6kFljWk3kOCNsU22e9lA1pRU+Yw3TruBZssC7zaMaGGbhK+7W4L8iK1nyJAHtxOCKLc6iW1ia/kcy+NNrBKNjpi34XEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96n6m6KpdgGs25hChwiLvbclSj5PoFykxSJyeDGjbaM=;
 b=b3qjQ1tiYh/k2i8o7GwFwCjKFmBRBgoUbCy7cH3LAa9n0DIr1lv7besktrpxfRi+M/tGu2Iz/rPc9Cq4KSpccEvelrEKyEOFFpbsuUIb//x41KXd9MPxoOymSCutlYuaIzzclqsG+xEUeP46s+X4AIN/UnneK2BlTLuBNECGrp//B+1qzqkXnlDt3L2WOLXkZnI2aKdoho05wasolyKWHnqxJaG4OqFYlOoPD+7SPyISBUYr5NwdXVUM1ev94rvH0W117q37KD+4Y54FK4Zh1Fl5c4sJtaPn+ONuFuPQ8+ntTvRTVhRfh3NpoQvclmmvIa0W3cd7hZRxsYbQWmv7wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96n6m6KpdgGs25hChwiLvbclSj5PoFykxSJyeDGjbaM=;
 b=IW8qMaMxrFlBl7h1sVLZv2/YbV+Kaby1/4esn5vwAiHkbsRDzvHyiX1n/JFaAUzYz+V8HT4SkYtVRKW+VYD3KzjKVp4RblZ2QSJPg2YIf7ZjAM7rMchNfiazqoezPtxBSZZy/RHQK1fOTrVKUnuC1cTpg+2IIzBZDe7kIsHIwGDikaxn9SLerZh2Gqj3pnikxo0H5qBZ+idn5yj3UrN45aHHCW/9HgDx6AvGfmAUBfvW1KkpNa3qZUWWw4ppmwAaB62SdWGXMPkoockB0BUZ2ylv+OJiZhnf43VeDdi/gPhpKOwarQsH9RJOwvf58TuPn5lKpocdUDt8TSANHPuxJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYPPR03MB9422.apcprd03.prod.outlook.com (2603:1096:405:314::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 03:35:33 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0048.010; Wed, 20 May 2026
 03:35:32 +0000
Message-ID: <26738e81-97cf-406a-94e6-b4a02f0b9609@amlogic.com>
Date: Wed, 20 May 2026 11:35:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] clk: amlogic: PLL reset signal supports active-low
 configuration
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com>
 <1jmry26my3.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jmry26my3.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0012.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::18) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYPPR03MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 328ea365-d038-49fa-47ee-08deb620d8d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|4143699003|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	a+DoxzDQ1qGkKRHiWsdHfTRpNId/3aSmJgwJOfj8eiV1WPQLRUZacp9rwbIQGJAuGzfV2zUuvFFv4hIxHtbF/165ue45WNNl+ODkWhYu30ObhzRmocWgHH5S1a9JEHcrfE00FbSzu5Mf76vjzwR3XaOvX8RmEfxSlyjIsZVZabZYfgN48UhNNpKJsyC++6FI9YNzYnQpBbEBPXyXLOUbwPkrScgvmDPuAfEB2r9EMWhlyiMDPLKc6D+GluazAjHwtUPczJ3hZv70H1FDAYvQ7C5Wvpx2HO37+YWFywr0U4Oh2CLoigPQWG6IFwjUxzQ782v/V0M3GmogB6gMq076EYt/H4Jqa6aHcCgDYX5QLPc/gDVrqjgou/IB5KVo3pRPhCVstXHO6SHG0E6kMd53U1vJHIk0AtpNu8ZIX60lVVEDMKN0pkg+p/tmfaLDJPcCGkfIPnJUaltd9G7cRr/3HmHABXebfs25Tiq9ja0UwsmjgRyslvjORvfT2HV3lFqnIt6+MvtUD0qF75W901CxMdgvDk4dOfBVRz0TpboW20Z9H061F8xCzJmlkdyPBvNHHnsdU54iY8AR+KZWggR8Bn2PaK9qZTZ7CyZb2PWk5Lua6+SeNAwJ+nMLOlDMhRkHyYptbjxyRvb4lIzIKVof4RCPKZEliCx/LwWEm9VNRwllCeWJ3padauOBratgW/vJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(4143699003)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTBialM3cTROYW90bFlabGg4anRwVjNGRmVYN1pla0dzeFJ0QzBTYWRvYnNv?=
 =?utf-8?B?YWs0dHBYby94WVAwQ2h5ODhscmc0aDQzTCtRdFR1VDZvOGF6MmtuZlUrK3N6?=
 =?utf-8?B?UjRRb2xjalJhaUpvU3g0bjFZelhwbFdPOVc2RW9Sd0ttZ0xsUDR4V0NrRDRJ?=
 =?utf-8?B?VTZuWEU3RUdZRHAvZ1VVZjJQWExTSEpGQ2c3Z1JmMzArVUM5NDFjbVRJTFFw?=
 =?utf-8?B?MHJvdUVlUXBHN0VPUjgxVXBVYmM3MEpESDk0ZzhRTmlqZlFDWUhCeHdIendQ?=
 =?utf-8?B?QVhYMjExMHdYbU5VaEx1d3ErT29ZS2wxb1RKLzFaNkRXZkh2M0xzVkQ2YlVp?=
 =?utf-8?B?dURickRqMWVKZ2pGM1VHM2IrdkRINytxWTlMMkVMbUo4dnMycWNaMUVzUVVR?=
 =?utf-8?B?MXhOZ2Z5SmErTFQ4dlQwTXJXRU5udm1Wb1RoZGdiYkMrTlpKMEowU1FXYVUv?=
 =?utf-8?B?SktUQUE5V2Zsa3FuVSs5QWJ5VTBLT04wK05uYkRMSS9wQW9NQmlLbmF3MTB2?=
 =?utf-8?B?eDhPWE4rV29sMEoxdTFSZFB2YVpmcS9EVWJnZ2NEVDBoZ0JlN0NKL2hiN0pK?=
 =?utf-8?B?UDFCeG9CUVZIMkNiU0xmTlJqamg3UnNseC9HRSs5UGs2RlFETEtoaWIrOGpr?=
 =?utf-8?B?cS94NVJBblhXdERPSEVOOHRRMDV6UUdJdll5ZHNUMHVBcS9rOWFnSjBoSXlp?=
 =?utf-8?B?VXpoQkZadll6aWhSTjZERkorNUFCZmREalkwMzdnbnpvNGt1SDQ5ekxwcGVI?=
 =?utf-8?B?WEVacTB2VllZMFU2cGlUM1UycjgzdllnRFBJYTNvaEk1eDgzU0FhSTY3RXdi?=
 =?utf-8?B?cWVmYkpmYmlTZXlRZjVSNGpjVFhWaFVKVEJiNHdDMUYyOGNFd1daR2xTSlBC?=
 =?utf-8?B?ZVg3UEtDdEpTRUxxUnpjMWZGdmhkZ05XN1NCakJIeDFCSXRjWmN2T1hBSjRP?=
 =?utf-8?B?dDc1MHQ2U2MwVE5qZW01S0VLUDVjRXM3R3lHekVvMDlHdzc2YnROaXQ1cUtl?=
 =?utf-8?B?R2pHUlMwdzdUdktjL281cjlsQmluL29jTTBZWUtlL3hmbDVsRFFLSVVRUzBq?=
 =?utf-8?B?amhhMzc3ZGp1aHIvaXVJbWtXWm5zQnhTRXpyOU1WV0ljdXNVQWdEZnF0bkt5?=
 =?utf-8?B?Sm1QZ1FobWxGS3V4ZWdMR2VBYXlLVGptaENwc2phZGJVTVVFMFdqVWloUlZt?=
 =?utf-8?B?UElJaGtFTHAvUDBrVC81Uk9Rd3NJTlpONGx6MzI2c3FicUthK3hXYWdvK205?=
 =?utf-8?B?c1ZpSVNxVDBHQkREOFFqQjl1azhJLzltS1pDTjQzQUt4VEhGZHV3YVNPeWFp?=
 =?utf-8?B?djRHaEdNR20zTFhwS29INzR5RGdhSkY2d1MyWFRGU3JhN3Q5THRhbThmTVZp?=
 =?utf-8?B?ODZqaFE0TUZyNTZJYndaY1JVR0tXQW9Dd0ZHS1Njc1U4aUhHdXhCeGNVc3RL?=
 =?utf-8?B?dnUwN2R5R2JkMDlMdXRKYTVyUWU1UjJEci9peDdnM1owU0ZhZXg2VXhnV2hx?=
 =?utf-8?B?Wkw0NGppbWF4bEdtRmpvTDRBaFNoUjV0bldlQzFwa1lWcGRQWnZDVld5bXVZ?=
 =?utf-8?B?ODk3RVAzdldrR2RzZ1NyN09wWXgrSjkyd0x6WDRZQU1EM3RoQm8rV2R5R2RU?=
 =?utf-8?B?YWIzbkk2T095S3k1eE1DZUJnQTlISFlWMFU2ZlMwcTlrWC9iWU1KMWxJU002?=
 =?utf-8?B?dDNabWNicEZSUDA0ZHN3ZWpnK3VOWEhOVEgzQm1iMzFjZG81NHRTdWJDMFRU?=
 =?utf-8?B?RkR3THdYU1kxZzAzOW9XY20zbU42dGdjYWQwM2JoVTVKbDZUSlphaW9yZzF3?=
 =?utf-8?B?OEtudVZNdnFET29wM09LUUNNbThRSzNxOEVwcjFNdG9pYnpBNU5oT2NMUlor?=
 =?utf-8?B?L2diSVExTFJQNmVNSTNKYjRZTzk0cXpSSGZLeXRMT01DcmJmeFRBK3VWSll5?=
 =?utf-8?B?eG5Lc2VRWkIwOEpCcm00OTBLSkVZTE9SZnNyRDgwR3VQcllkSGpSc0xkODcr?=
 =?utf-8?B?UUpXcnRYNGlCTkROdjNlTi9TN1dpZ0hQVytNNFp4WkUxZTBoMzFzM3lGN3RB?=
 =?utf-8?B?ZlAveDY0bUI4UC9LaG5TNlBJTDUvaC9jKzRBQkxvR3NSWlFIU1NlQUtXWjY5?=
 =?utf-8?B?T0NuSno2WTU1b1lPekhnZHpVUms4OStSQzBRSlZqdUZXRVRJYkZwRlVCMDEw?=
 =?utf-8?B?R1VmNW9lMkh1UFhLRHNFa241cVRMaExxUW1RNHJtcGN2Q0ZYdnpJbG1WNUp5?=
 =?utf-8?B?cytMWmcySjZYbUdCaDFZN2E4TmFZaWhGSCswUFB4LzhUblF3eWxRK3dVYWt5?=
 =?utf-8?B?KzVseDBGNlZsL1lxTjZ4OUJ0eEtOT0VKSFQ1K2tCVDUzOW90bmk0Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328ea365-d038-49fa-47ee-08deb620d8d1
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 03:35:32.8390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkUGZ7S7UGuk8rsxCDdJCD0nrntorTbREoQRFUE3yWoY+pmz/5HOjvDDH1JYvk+hToIHGEbygpGL7RtE6wZ/Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9422

On 5/14/2026 11:16 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> In the A9 design, the PLL reset signal is configured as active-low.
>>
>> Add the flag 'CLK_MESON_PLL_RST_N' to indicate that the PLL reset signal
>> is active-low.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/clk-pll.c | 42 +++++++++++++++++++++++++++++++-----------
>>   drivers/clk/meson/clk-pll.h |  2 ++
>>   2 files changed, 33 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>> index 5a0bd75f85a9..8568ad6ba7b6 100644
>> --- a/drivers/clk/meson/clk-pll.c
>> +++ b/drivers/clk/meson/clk-pll.c
>> @@ -295,10 +295,14 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>>   {
>>        struct clk_regmap *clk = to_clk_regmap(hw);
>>        struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>> +     unsigned int rst;
>>
>> -     if (MESON_PARM_APPLICABLE(&pll->rst) &&
>> -         meson_parm_read(clk->map, &pll->rst))
>> -             return 0;
>> +     if (MESON_PARM_APPLICABLE(&pll->rst)) {
>> +             rst = meson_parm_read(clk->map, &pll->rst);
>> +             if ((rst && !(pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)) ||
>> +                 (!rst && (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)))
> Again not a great usage of binary ops. What you've written above is the
> verbose version of a XOR.
>
> The code duplication remarks applies to the rest of the patch too


Ok, I will update this and the other similar instances below in the next 
version.

Here is the updated code for it:

     int active_low = !!(pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW);

     if (MESON_PARM_APPLICABLE(&pll->rst) &&
                 (meson_parm_read(clk->map, &pll->rst) ^ active_low))

[...]


Best regards,

Jian


