Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023115.outbound.protection.outlook.com [52.101.127.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1D633067F;
	Fri,  6 Mar 2026 07:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772783645; cv=fail; b=VCAmkZmlWw3iqDyGkKMNGs/KWCiQD+ndO0B/PrphMN9STHMf2/Y5oTkKzS+JtMu51yo9OBwip1mjm2Ukk554NiYT4bmBnZAFB0BVI4FvLvCMQ12Y1LpDIGewG9LSa4B8iz/VkymNba6rdiAKEeb0Pj5O7J9ksfcf9IBzvi901ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772783645; c=relaxed/simple;
	bh=z9mL3EFMFH1PejGfggPcYzJh8l8P2XLkNiSrNcScze4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ox4Z+UqaZfwTxemo2WWe9Hf4BnGgur61hFHSHmJJK08oz8YbPbj1bg+2y0AYSfr3wNtlb3523pLL8Ns7NiGdttV5kMnDv+YVm03J7AgWCpa4POWHy13zAeQYKMQmjydSdmL4IRHpq1ta2ETHCRt3SDFdY0wG1Y+gPwK8eELzthg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=zQftM4lZ; arc=fail smtp.client-ip=52.101.127.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="zQftM4lZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qb8cDrZeqMrszflZf3iLAcIsLYGtVlCPa3Svg+B6PN74i3mFCZFp42LQGSZ198JuRupi1+g90eO+rVMSgESCFFvfV6im7uMRWZ1RPu2ENVBtA0s3NvvYUlG6yNLjeMegfqWgao58wgTOjFJ8akoe0zbb88LhMC8sEPK311qnkMzvRACneGbkHqWGZFU32OFaxPgzOYHbMtJfJ0RlX32sdKB6dW4oxah55QI6k71OmpzvsA+i1WDODPa1knQj905rmh6JZr3hLhecPzDE7lBECIxsNPpykoEAcgeWJ+H9+iWOZvy5fijBBVEQWFkgkF2qz5YpulVEmoaH+wKON3IesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sjILeWf+I556ni+oIn62uBsm/WIriMIL6WbQRIF6s0=;
 b=E+dr9F4kbIOBcAwtfCf7g9GCSPIrF0NBuYZF/G9HoAi9z8X8ZDTTbXFBRdykXu1yvVegAuh6jarhufmABZGs6zqiDApotuP8w/2L+b0ohURbNb1UbXsZ5p+pUYMBE//qwdv/HITYH+ZHSj8l52hICy/um+IjU3TBsugOp3+O6jYblb0T+k2gfjoVq0WZhBPyh+sbTXKqvnOWmyIFyBQFDHwm4AZ05AqPnRAnmqUDT+hxtwtnPij7QlUDuzuTG2tEPL66snIwg6aDpq4BQJV95XVmq+8u3srLCEJ/03bz3lYkjn3pFPwqFAtYw6HxZtcoIaLzNhaoD/9pvXuELnj6vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sjILeWf+I556ni+oIn62uBsm/WIriMIL6WbQRIF6s0=;
 b=zQftM4lZa+WKDoh0F4zKIc1n3YDeXixrBWuDuNkxMCjEudhEqVtfgd1GPJ02IdBWGubYj2s8aEAoSrHQszX6PAvapf47WBxyRy+TVOKeZ1Vdf4d3NsxZnrEc7p8GqaOjMA1yxsZZgAKuHeN9gE8T+AD56lZJ0nhP3PWQ9Ok35NBf2qUPC1huWOi9d0/FwtL4UDs1p8YRa5rDq7UOQZTuto4/JY4OdpxUM9HcYS/qPHbI9iT6l10g6eY2L0RtOH7pxy8ooVxsoLghaEysrIe5CTe5Ko43ie4X9pCrUGMKyywzyFjs7PFfqok6ow1sP1CbxKW/Kk7uuOSiorWtGkq42g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYSPR03MB8132.apcprd03.prod.outlook.com (2603:1096:400:475::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 07:54:01 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 07:54:01 +0000
Message-ID: <4d49b0a0-fb31-4b30-9f59-141ebe479b3a@amlogic.com>
Date: Fri, 6 Mar 2026 15:53:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, robh+dt <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-3-jian.hu@amlogic.com>
 <177271832223.3486876.11276313304536737957.robh@kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <177271832223.3486876.11276313304536737957.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0103.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::13) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYSPR03MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: f654913b-052b-4291-3547-08de7b5587cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	rOmXT3ZkkgecZcWzPNBQKpf7LzEjKfkOqH76qTiY7PVVHWrcflqdrfximLi7T/RAIgqJ2p2air+pD5zd7csyUalQbOdX8tCWCJrYRiQOyBbliyRUCkrxkrEnNtbbTSsX4WT47Y5VF+ZHt24jQmIUk42Ag4m1P0oJzs/h5o7DwUR84RhdBUkxoREaV1+W+IsZUhCzlXpONtyfeS4IAu4b97dNwFOUk0JrFqgzegPBfwJR4GCtYyL0KUjefimYDViE3swHTtPkoUeZ38YKJQ9U1AhjGt+Dci9wVH0ujCW6W8d3ZWqDuJGSlmVf4S44euLYXStZdTNLUgW0YSyFcUPbZmdtArNIKqfz6NwTR1flBywjMjOYDs3Sd9DNLshEVRvMRK25npITN077X6Z5v0HZGCMjBXQ/Dj0kQqolt8J+5+8LQ8ziczo0UqB4/21piGTbgfHJBXEyJRIoJl2+WQSPQpy1doLuoILOEgZe4+eQb1spyH1bzHxodlt4eT0UGROi/hGefxLgSEjU/wtBAI5IsSvyrcPTq936VxxcfAD4Aef97WPtxmHC0cJo3Nk+8TLLwe+ouXVKaqhAoC1OSRIwmXJMeSe1T3c3k6qvsDpOv+rcVQcEt5+iqrA7x9D0hSfxAKUP9baanVFoKScUGNLECKJ9WEUGWhG4SuzRJwzNfIslIIkKEuL5flHBD5KfU70zg1hKqJyQcVYR+QeNWyvS/R59eCKaY7utDy01q7WKMzs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGFJQ0tGaUtrNFJqTGtWN3lhelRhOXZEVEFSM21ZOUxsQjJNSHptSjBLQWpM?=
 =?utf-8?B?cDFWMEUwaEhsVktINlE1c0xyb3Z4VGpSTWFpQ2JCKzBBQ0M4bzVreHFjaHpm?=
 =?utf-8?B?TW03NEsvbXNkM3l2b0wwVUNDa0lFQyt6RS9KVFoycXlhV0o4cUp4Z3plSWdr?=
 =?utf-8?B?SGh6MythMXZ4aTNvSnpBeDhwc3orQ2VHMWtmTnhGQTlNRXpXU2tvYnV6UGtS?=
 =?utf-8?B?bEFhZFBqelVYWVhnS1lhZHpvS09FT0hIb3JGWUIwWEM3cStXMzVIR3JzVm9Z?=
 =?utf-8?B?T1dqcEYxSjRVMGd5YWpKMkM3azlvZTd2WkxsN0JmVVpKZ0VPWUJTRGFWRzMz?=
 =?utf-8?B?M0JuTG5pT0pjbzJWUzlGNkZ4R1V0YXBNQlZKbzYrcGh2eUJUSHB1eEg2cDJX?=
 =?utf-8?B?VjlHa3FaY2hBMDE3M0tCVTIwTGk1cWpUdG1KSGt6M2lpQ216Z0h0TEJOeURr?=
 =?utf-8?B?aFZTdjdwSjcxb3BVaTMraGJyTnNCYm5HVm9zcG0yODVaSW16SWMvNG1vaS9P?=
 =?utf-8?B?ZXQ0LytHbllLcldTb3BiOVBjQlVRcWZ4cG4rUHRkYzVGR2x2N2VhekVtcDJ6?=
 =?utf-8?B?eW9HK1YyTDNhQzhwZ1pyZER1ZWhGZnovdkdiSThYbjh5dnpQc2tTRUc4ODQz?=
 =?utf-8?B?U3FNNk1OdWJXM3RVOENpK2RHaDc1L25VQ2JyTFRoK3lYSUhhOGtMc0gvR0FI?=
 =?utf-8?B?QWJYNXZoZkphQ2ZKQlNIcm1FcXEzM0xId3pCbVRpaE1GSm41dzQ2SzhyRFgz?=
 =?utf-8?B?VjJQVE02eE41QVZGZTh4Z1JlNnQrMWI1NE82NklJUHZNUTFNajlTM0lZN3RE?=
 =?utf-8?B?TzZxdjRNOXYyWVZrd2Z2VHdUNGc3RmdRRkFNM0VYTlc4NnZiRkxoa3FQMVZi?=
 =?utf-8?B?SFNPSHI1N0FWRjJ0QUREU01scUF1YlFrZy85eDU2T0lrMkp0bExQYUVSaTg2?=
 =?utf-8?B?ejBQc2xNSS9YOVpjSCtQWnpSNXhUSUxhYnlyZVQzb0N4dXJvVnJzYThrM0lK?=
 =?utf-8?B?WHhZbDdNQXBYa3lhZDhBMU1pOEl6ZmNsUkQ2NUgvSUlPai9TZ3ROYWZVTXVC?=
 =?utf-8?B?ZWkvTDRFKzBodFpYbTFOa3I3OHJpUmlsRDlMSTBQMi9jUnZzeXBWQVh4MG9K?=
 =?utf-8?B?NHdHL1pNWGVhWGF0QWt5b2FjdGFsQ3piVzZCeS8xeTN2T044M3h0enRGaE1P?=
 =?utf-8?B?b2FKenVIM08rSGRVUzJDTHRTenNVa2pzM0xIMVlVekt3WE9qKzc4MFdtbHJS?=
 =?utf-8?B?b2R2RHh0OWJyZ3VWWkgrNUF4WVFGc29ZSk03ajZTbkZiS3pObDd6NHltZ2Np?=
 =?utf-8?B?cEgyUGJ6SG9GbjJOMWNrSW9yTHRHS01mTklUeVo2MHYxVTAxVFh5UExnYUZj?=
 =?utf-8?B?Uk1xZUtrbmU1UytHZGtVTzZjYncwVE04bERZRzEyWTM1cjV3SmgxWVplMEZs?=
 =?utf-8?B?UHdjeWp3VmtGWlhTRUJZU25DdWRFblBReTJsRHo1elU3Kzh0bi9UR2ZRL3pJ?=
 =?utf-8?B?RFJLSTZUTTZOWEx4dWMwOFh6ZjJpRVFMNk9NeVVhbmhVM2ZlMU1vVTUzQU5m?=
 =?utf-8?B?UXMvMVFPZVo3RWlBWnNHMHQxcmJkSVdBVUdtcTFuMitQRTdhbU0xa0ZqSnR6?=
 =?utf-8?B?dlZFempycVZYVDV1K3lwOWsxQW14VGdDY0s3elpTLzU3eXpUVmVjSE1RakU0?=
 =?utf-8?B?T1o2NHJlWlhZODdvbzc1Wm5KZ2VCcFlSdGVGaUt5clJndExxeFpkbnk2eklP?=
 =?utf-8?B?UVVaL0tpL0hFTHVZZ1FZendPcUQrQXNYai9zMzZSa2IzVExSVTM0RnhPYnVI?=
 =?utf-8?B?M21MVjg5SlQvazl1c2h0VGx0Uy93d1dKSDVWV1A0clRDaDgzQTRSd2g4MnBh?=
 =?utf-8?B?N0hmRU5mVE1uUWpwZzRnRUdBdlJLTWhueTMxNVV0ekJOazdoY3JBS1hoQ252?=
 =?utf-8?B?WlZrYWVENmdwandqNmJGa2hWamQ4ZnJ6ZkljTWlLaGs0eUFHRlNBWWc5U1U3?=
 =?utf-8?B?NDhLVDZic2dBRnFnYkhmU2ZLOGQ5c2kyZjA1Y3RnbkwxYlpteGNMOW5YRHUy?=
 =?utf-8?B?OXFFVWFZWnlSSVlrZU5LeFozMHdCMExoODNCVGRXUDQ0RUJQYmtQK0RtOGsv?=
 =?utf-8?B?aWo0NTlhbWJUNUpwQzVVSUdlMDNLMU1UendWYVpvWmRzZ2xTNk0rSElDWE5n?=
 =?utf-8?B?VERrTWxhMXBZV2NYZ1BJbjZOTDRVUTJsdTE1MmlEbjk3dzh5Nm92NzQvdGM1?=
 =?utf-8?B?SUg5MEF6V2QvR1NlSEV4c0J5ckNvRHowVXVDenhlaVdsck1DdHQxcnk0bWNI?=
 =?utf-8?B?TFNMb3VmMlJrd0dnZkE5TUd0WjVmazBvZUJYdGYrWk1uN2pWYnVWZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f654913b-052b-4291-3547-08de7b5587cb
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:54:01.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYYu2pWZOFH4zyjwwsoATHgDcKgNtLVTMV4JjmIXdCpkmCYnKEOOoatbnCWwyk7SyaGiX0fEUJe9HbeOtwOLfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8132

Hi, rob


Thanks for your review.

On 3/5/2026 9:45 PM, Rob Herring (Arm) wrote:
> [ EXTERNAL EMAIL ]
>
> On Thu, 05 Mar 2026 15:43:26 +0800, Jian Hu wrote:
>> The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
>> the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
>> Add it to enable proper clock parent configuration for these peripherals.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,t7-peripherals-clkc.yaml       | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.example.dts:40.26-27 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2


I will fix the DTS syntax issue in 
Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.example.dts 
(line 40)

and include this fix in the v2 patch, along with the previously 
discussed updated commit description.

> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260305074328.639993-3-jian.hu@amlogic.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>
