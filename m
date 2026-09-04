Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CF73DDDCD;
	Fri,  4 Sep 2026 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515351; cv=fail; b=qLzPYzNdS2N/cJO9on13T02+avUW/yybhnvCXoHoyV13R601VRy/FItP4nXxZj1yMY4MbUPfnbdbYgdIg3DvbZ4D4xL0Kbk37YT4X5uPFEMVCIPGihbHH0quXyGi+oZFTywcAXB4eSK8VWZ54uSZYUV6suCFoTOQ4LvsnFWfMjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515351; c=relaxed/simple;
	bh=mieT0qhpND9XxDfkIQqkgbhnioyAS9ZJ3zNVpNdBPTI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hOiHvmTUD+3OUe+M/Jr6W1Hmh1g12zOpqMCjbe87t2jF0Pugexe/Ngw/sx84VlS+2Tkfj8l/x0et+AOYWh7Qeq3k1aluXP0ExGkAvCf/fEBixx+yqIcAsKOZveijd5gHRasI+Be7pEXfHLprjjZHEmvGlRUqmQ3A1W2hwnbhKP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Y+6OKyRB; arc=fail smtp.client-ip=52.101.43.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Y+6OKyRB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuyBpUZQi+AoZ3e368k4x8cLhqZ8Gu+FAfTf50HhmxPjqhn0V5n3TOdm1VM3ICmWurUqQqOx62coN1Fnttlc/Gpmc9WgJi9Q2BI0uUBsposFjVwLTsNaV0I5lcR1JdUJ56vHQDw0KLSZZjfW3Z/ukqNHBAQ+fkVLJCwydGGt1mw5nlqejiRg5Stt2++n4bM8JkcpqDtIIWlMwH3TY4dZZmr15pUHgKd6EnxkH8iuihNbgppBUYUkta7MUn5ePFouIo/X49nZcLy1QFeLwhSmN6uifSRC6yyFbG07izoW680FYvL2MHx295QmqkxkMHpbAYLKRvKuzhvTSJ+qqbtLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MkIrbu7dnHc509GU3RDxpdcnROxaHupGPw/EVgwImA=;
 b=mYaYW0EBTJviVwYQO6j1ZnXOBdLp42FQUxs7zVvrO64uxHtdpRT+qB94vBUWLWEBfCZumY8u/9oDs01uT5GaYHnOeXa8Jjr7Ds0HQ6ast8P3QSLVuK5LFWZuQebQcFi8+n05wvBHuGwRl4g1WVVUFRpMZXhAU0Ycn8xwRr7UqMhDayuTP1rdeFdpMAzwGaEdMT6vJZGyo482/zLkM5HeXFH9x3RhvYm53+JtM6ks8t/uamjyH9WHDbOFnxnYED+hCAHCBsv5+h9JwPoLrHOIqTskeQ1EPMhGNK/Xto8Y8ecY3HduUVLpTo0MqlDgAnOWTHO9zhlcrD9+iQ0ltHa4tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MkIrbu7dnHc509GU3RDxpdcnROxaHupGPw/EVgwImA=;
 b=Y+6OKyRB9torm3iLHIpWhUm46D3+X05EUIMM6Q294cQt1BKqO1UJodzIVtmAkrUeasZIfZuoFnGBZggFWvP6GJiZy2OkPEA7LZzi8zdA5Eufrg8hyXU/W6+V6aujig5RMElgtoMjCiMFwi2mR2pqYvnv6qSgF+d+reZoKtGoDbxaeHVt82jX4oOImDsdzUFhnDycZTBSZRXpBD7CFc1/FVt/eIQKFfRPest5Rq6ManFFhy0J+zIyTYMABQuWwwFlpGY3KbfV6MCFCTO0GIHKR3X1GbJqcye5tTvbwzzwmh4wiw5BqtPJjIQ0odxFC1O7kE97lmBWkWua2EhJwQ/eRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by PH8PR03MB7245.namprd03.prod.outlook.com (2603:10b6:510:238::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 09:49:06 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:49:05 +0000
Message-ID: <b03f9d6b-947c-4190-8493-14b5f9c5766c@altera.com>
Date: Fri, 4 Sep 2026 17:48:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: clock: altr,agilex72-clkmgr: add
 Agilex72 clock manager binding
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Lothar Rubusch <l.rubusch@gmail.com>, Ng Tze Yee <tzeyee.ng@altera.com>,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Brian Masney <bmasney@redhat.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1786006669.git.evon.chiam@altera.com>
 <39f067c31125b43d9d4ee92cd02828e894de3f45.1786006669.git.evon.chiam@altera.com>
 <55153a0a-1cab-49f4-9a54-951aa9c40be1@kernel.org>
Content-Language: en-US
From: "Chiam, Evon" <evon.chiam@altera.com>
In-Reply-To: <55153a0a-1cab-49f4-9a54-951aa9c40be1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|PH8PR03MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 425218d4-08e3-473b-060c-08df0a69c1e6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10067099003|56012099006|4133799003|11063799006|4143699003|22082099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/S8H0318K0DrXk1GmJVk9cu53N8LG5KNswSpk7UcXyJYYtmX/ffVr7N+Mra18ymSHgbRCnMXToAOfuACOrXkaUkA/B5nw48TiM4dBoh5ZZxSCyY7dKyuO73DFBMQSzywK3lD4JjQyzpHUMO9pDq/wQS31PYJxR6wkw5ZcGwgLcjOAnA31WfGAimPhSxSMX4h0YeJwzgcoe33qS1452ed0VWvB4I2gqAfJNrYWbUw8fwVNVKTshrzyt/AFXXp3q5qJWjv2A+Hp6T8sEPzOeqJ3n6zwsQd+0x2yAJai4cVAvN8EB6j/k94ML4l6MgJQMvNxsN8r9Kce4Td28/ieQp6emI0BFh9J/7XYSalMH0j/4mAvApP8x/iQnmXlJpOWro/lxckxgDsdixk6zIVDJyRltsAJjLXWwYpT3L8lnQESZbNlztfFR/pYU+pjTyxAH7A91lmM60B16pRGB3Wy4ToL6XKsesx90AAKOefmlm1UJi3UBl1ltuZZjCQM5Rrjjl/GOSd+6pqqEZin8elR/NczLG8clSgosIT/3dbGVtqR7GroEEmB9Sk8lAWXXM59fL8e5DUvo+UoO45lRBg94/pDdpvt2kY53yqHEqh3xcD0BCBwr1yJDWpXYDszaSjPF5x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10067099003)(56012099006)(4133799003)(11063799006)(4143699003)(22082099003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWhoRXZzcVV1WFpINHpXL2dFWEdpM0c2eGZmZ2l3QU1XV3d3STgrMTJRbUJz?=
 =?utf-8?B?T3hmRmsya2dPS01hMm5valFTcWxNMUdKMG9pRXo4bldRaGk4cy84Y1ZhdDJn?=
 =?utf-8?B?bWNrMjl4d1phMnhXRjF3dTV6L0JWWGJBWWtzOUV2ejZrMFRLMEhBMGRpZEJv?=
 =?utf-8?B?YnR0ZHpkL1JYOFpqU2tJZDdUZ0w1Sjl4ZW9HMDI0NjdIQlR3R0I2cTZrY2cy?=
 =?utf-8?B?MW5IeVlrZFJRTm9BZWsveFdCTzErdi9OTk9waVprV0FSMHlhR3IwSWE3MHpy?=
 =?utf-8?B?SU9JNGxtU2MwV0VpamhsdmVub25tUGdLeVJGTkgxeGVjS3RhMnBNbXNRMkJx?=
 =?utf-8?B?SUNxcmN1MWxNVVpNc3FMRnRPanU3MHBEYnhNdzVVQVNLWDZJb3pXaXA5aDNC?=
 =?utf-8?B?NFNyNXE2eVlrNzAzdE5BR0ZXdTJSZXlTcmdibVl0MDhXU1J2YVNiMzdRVC9U?=
 =?utf-8?B?L0tpSXJVcjNDTmd2dm1DTVZoOXB6UlZ3TWdDVXdGWm5ncXRmV2NqYUxpOTdN?=
 =?utf-8?B?RFl3aTJHRXZDNXdQWFIvUUdBdnFaNE9RRkdpaW5IajEvWDk0Y0NoeEdvT1Ir?=
 =?utf-8?B?MnVUY2FxcUFUeG5kcnpZOTI3VWg2RXh0VEZZcVRMREtKUDJmVmlCd1ZPMGdz?=
 =?utf-8?B?NmFzVUpHYjhZUDl1T0VzMnE1MWN6cVFwd3Yxa3FUeWRxV05aRlVmNzJEUFdt?=
 =?utf-8?B?WDFZWFV5ZkorUjJyOWhRbm0wNUlaaW8xbjl5N0Z6RjFzWTgvOFpJK1pPVUxR?=
 =?utf-8?B?ekUyRHdKRkdvWWw3bHNtN2FTckVtcVJacUd3WHpxaEJ1dk95cjNlUVY0VjVX?=
 =?utf-8?B?VVZzTC9kNXNmSm96MlBaTGs0SUROdWVmRG5QdjhFblI4ZllWa1laUUlnL1NQ?=
 =?utf-8?B?WW1ZMkxUVzR2TkhNaVNkNjFUbFEwNm95dWZmZHFDVjY2eW9lNDNkdy9WVXhK?=
 =?utf-8?B?WVdleU5sM3Zka3JnMWVULy9YTjdDS2diMHg5MWFBWXRwYXcvYU53VDFscVNQ?=
 =?utf-8?B?c0NGRXdrQURCMmZYZHlBOWgvR2hFZkphSEtabFdBdm9nalQ2bnBkUVRLYTJP?=
 =?utf-8?B?L25VWHNLNjV2eGxlNFNCYUxDcElxVjgxNFdZbEJQUmRBd3EzQjBXODZtNXU2?=
 =?utf-8?B?Qlgwc1dDS3pSYSszMjFjMFJXS0I1bVpvMW53ZE13dUtMZzFieUlOUUtKRUlw?=
 =?utf-8?B?MW16K0x4UkRaUlY3azhNeWNQYS91aGdPQzJDeDlmSWNSMTZWdmNyZEtEanBS?=
 =?utf-8?B?emRENUI5ZHZDVkIxYmZqVFdqK2ZoNmlIZWxtOUJzY1ZqRkF6a1FXbS8zYVVK?=
 =?utf-8?B?VWRyZk15RTFTY0hDQktqVWxURFRYQ3JybjlKcmJVRnY5WjYzQmg1SnFVNDRq?=
 =?utf-8?B?eVFUcGJ0MzVoRGdTMHlpTTJWZzRmOTB6aG8xVkMybmVKeU1Gdmd6YkExTExQ?=
 =?utf-8?B?dkhJU3k5dFE2UjBrWEhPUiswYzlsUGdTWEI4R1ZnbTJxd0NncUFyV0tPeUV2?=
 =?utf-8?B?WjNybWk4cnNsWnVlYUQveDlIMjRQMHhtVGRra25IcjhjYkNCNTNUeSs5QU1v?=
 =?utf-8?B?Y2RrVmJxOXdNMW41MHkrZUJGN1ROblN4RTdiMkJqd3ZOZzlTSmtHSi9aWGY1?=
 =?utf-8?B?eEFJZUg3NzZaRUNjYXo0WDAvVmNENDVveUxsWjJJV203SHhjNmMwS2ZhV1Zj?=
 =?utf-8?B?cGMwcHdlKy9rcHdCV2R1ZTZ0N09qUFFWenJjZUxCK2NraUVYRTZENGxuS3VM?=
 =?utf-8?B?QmdIMm85THowcThYclJNcDRUWGZXNkxCTW9OSlcwMG04c1NqR3c2Y2ltbVBX?=
 =?utf-8?B?TVVpUmRvNVJsZ3RuZ1lLelErRUNQM1lmYWw1TDFORDYyakw5ajViYUNnUUt5?=
 =?utf-8?B?V3NOb2ZYTnlhLzF1V0lzamFZSExCT1NQb0V5NFdRL0xFYmhGV3JEOExRL3Vl?=
 =?utf-8?B?VVY2dVp1SGxyejIxSzJoanl1aDdOVlRPbVhYeFR5TDlWVW41YjRiRG5RTTdT?=
 =?utf-8?B?UHFyQzBuTmxEMEJrTDRxU0tHYmdSVlJmNmkwdFV4TkZaZDBtNDF5NUl6YU1z?=
 =?utf-8?B?V0I2S1hZTlNCckRNTFBYdkp6YU5rVjZqTHk1TzlnWW5lOEZKS0ZXU1U5VWNt?=
 =?utf-8?B?SGF0UkZtOU4zVFB0SGs4SGFBVUZuUHlRakt0Yk9JUG5neU9pcnJjZTE1TnZ0?=
 =?utf-8?B?MmRxYi9VRmF2MmVjMnFGajhtdUVwTkRjenorZmJMM1E3WU13L2lNRGhjSTVq?=
 =?utf-8?B?aWtESFJrak9jdjhyNy9ZMGk0TnI2OElCV3lDMHNBdVpsS012Sm5STUxOMTV3?=
 =?utf-8?B?RXJPcWlMaDVoWGVwQVNVRWt0VFlmQ2tDN3VEMzNidEk0QXVrdWw3QT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425218d4-08e3-473b-060c-08df0a69c1e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:49:05.6167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luP3y63lTupaNiLA4vIilyZtUgbdM+FpiE1OowzHZMyAhbfEvlGzFdiLpARHzheaGfeMv4obW2zlcyprtGd1+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7245

Hi Krzysztof,

Please find my replies inline below.

On 18/8/2026 4:23 pm, Krzysztof Kozlowski wrote:
> On 06/08/2026 11:25, evon.chiam@altera.com wrote:
>> From: "Chiam, Evon" <evon.chiam@altera.com>
>>
>> Add binding and clock ID header for Altera SoCFPGA Agilex72 clock manager.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
> A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
> prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
Will address these in v2.>
>>
>> Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
> 
> 
> 
>> +
>> +examples:
>> +  - |
>> +    /* External reference clocks supplied to the clock manager */
>> +    clocks {
>> +      cb_intosc_div2_clk: cb-intosc-div2-clk {
>> +        #clock-cells = <0>;
>> +        compatible = "fixed-clock";
>> +        clock-frequency = <0>;
>> +      };
>> +
>> +      /* cb-intosc divided by 2, then by 5 (total divide-by-10) */
>> +      cb_intosc_div10_clk: cb-intosc-div10-clk {
>> +        #clock-cells = <0>;
>> +        compatible = "fixed-factor-clock";
>> +        clocks = <&cb_intosc_div2_clk>;
>> +        clock-mult = <1>;
>> +        clock-div = <5>;
>> +      };
>> +
>> +      f2s_free_clk: f2s-free-clk {
>> +        #clock-cells = <0>;
>> +        compatible = "fixed-clock";
>> +        clock-frequency = <0>;
>> +      };
>> +
>> +      osc1: osc1 {
>> +        #clock-cells = <0>;
>> +        compatible = "fixed-clock";
>> +        clock-frequency = <0>;
>> +      };
>> +    };
> 
> None of above are relevant. Drop.
> 
Will drop them in v2.>> +
>> +    clkmgr: clock-controller@915c000 {
>> +      compatible = "altr,agilex72-clkmgr";
>> +      reg = <0x915c000 0x1000>,
>> +            <0x915e000 0x1000>,
>> +            <0x915f000 0x1000>,
>> +            <0x9160000 0x1000>;
>> +      reg-names = "clkmgr", "gppll0", "gppll1", "gppll2";
>> +      #clock-cells = <1>;
>> +    };
> 
> 
> ...
> 
>> +#define AGILEX72_COMP0_CLK             36
>> +#define AGILEX72_CORE2_CLK             37
>> +#define AGILEX72_CORE3_CLK             38
>> +#define AGILEX72_MPU_CLK               39
>> +#define AGILEX72_CCU_CLK               40
>> +#define AGILEX72_APU_SYS_FREE_CLK      41
>> +#define AGILEX72_HSP_SYS_FREE_CLK      42
>> +#define AGILEX72_HSP_MAIN_FREE_CLK     43
>> +#define AGILEX72_HSP_MAIN_CLK          44
>> +#define AGILEX72_HSP_MP_CLK            45
>> +#define AGILEX72_HSP_SP_CLK            46
>> +#define AGILEX72_USB2OTG_HCLK          47
>> +#define AGILEX72_LSP_SYS_FREE_CLK      48
>> +#define AGILEX72_LSP_MAIN_FREE_CLK     49
>> +#define AGILEX72_LSP_MAIN_CLK          50
>> +#define AGILEX72_LSP_MP_CLK            51
>> +#define AGILEX72_LSP_SP_CLK            52
>> +#define AGILEX72_SPIM_0_CLK            53
>> +#define AGILEX72_SPIM_1_CLK            54
>> +#define AGILEX72_SPIS_0_CLK            55
>> +#define AGILEX72_SPIS_1_CLK            56
>> +#define AGILEX72_DMA_0_CORE_CLK        57
>> +#define AGILEX72_DMA_0_HS_CLK          58
>> +#define AGILEX72_DMA_1_CORE_CLK        59
>> +#define AGILEX72_DMA_1_HS_CLK          60
>> +#define AGILEX72_I3C_0_CORE_CLK        61
>> +#define AGILEX72_I3C_1_CORE_CLK        62
>> +#define AGILEX72_I2C_0_PCLK            63
>> +#define AGILEX72_I2C_1_PCLK            64
>> +#define AGILEX72_I2C_EMAC0_PCLK        65
>> +#define AGILEX72_I2C_EMAC1_PCLK        66
>> +#define AGILEX72_I2C_EMAC2_PCLK        67
>> +#define AGILEX72_UART_0_PCLK           68
>> +#define AGILEX72_UART_1_PCLK           69
>> +#define AGILEX72_UART_2_PCLK           70
>> +#define AGILEX72_SPTIMER_0_PCLK        71
>> +#define AGILEX72_SPTIMER_1_PCLK        72
>> +#define AGILEX72_CS_AT_CLK             73
>> +#define AGILEX72_CS_PDBG_CLK           74
>> +#define AGILEX72_CS_TRACE_CLK          75
>> +#define AGILEX72_EMACA_DIV_CLK         76
>> +#define AGILEX72_EMACB_DIV_CLK         77
>> +#define AGILEX72_EMAC0_CLK             78
>> +#define AGILEX72_EMAC1_CLK             79
>> +#define AGILEX72_EMAC2_CLK             80
>> +#define AGILEX72_EMAC_PTP_CLK          81
>> +#define AGILEX72_GPIO_DB_CLK           82
>> +#define AGILEX72_USB31_SUSPEND_CLK     83
>> +#define AGILEX72_USB31_BUS_CLK_EARLY   84
>> +#define AGILEX72_S2F_USER0_CLK         85
>> +#define AGILEX72_S2F_USER1_CLK         86
>> +#define AGILEX72_XSPI_PCLK             87
>> +#define AGILEX72_XSPI_CLK              88
>> +#define AGILEX72_XSPI_PHY_CLK          89
>> +#define AGILEX72_SDMMC0_SDPHY_REG_CLK  90
>> +#define AGILEX72_SDMMC1_SDPHY_REG_CLK  91
>> +#define AGILEX72_SDMMC0_SDMCLK         92
>> +#define AGILEX72_SDMMC1_SDMCLK         93
>> +#define AGILEX72_SDMMC0_PHY_CLK        94
>> +#define AGILEX72_SDMMC1_PHY_CLK        95
>> +#define AGILEX72_USB31_REF_CLK         96
> 
>> +#define AGILEX72_NUM_CLKS              97
> 
> No, not a binding. Drop
> 
Will drop in v2.

>> +
>> +#endif  /* __DT_BINDINGS_ALTR_AGILEX72_CLKMGR_H */
> 
> 
> Best regards,
> Krzysztof

Thanks and best regards,
Evon

