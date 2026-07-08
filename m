Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615883E7BAF;
	Wed,  8 Jul 2026 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495388; cv=fail; b=pr8Trx8n++GgKNchUiA0VsvYuMVLgXudM0KsWyM26vQ4Reor6LUK/4eIZtpWlF99X7wx9GYgCaEYrxRwG1VdLHt3o9+Fi+yjl0rtpqyuS8y6ZGWp1VXt7FVgXmYqC1QegYcpJHKeaRc1pXfewR5Sjp4q3IJrkBjSUSTCYs5Uu8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495388; c=relaxed/simple;
	bh=byRzFdBAURwPeRquMIpWnsdXGECvc9wzL9dGcJU7XcQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EDXxPimxrJln2iKyVgdTM1WZgrBT/tAZzfooKyTgtVqvBur6VuuXZJ+8+DimxzZ/PGsQJlxye+/vrbgSwhEX4dYu+BPwgWrY5J0hI3iHdRa7+piXFrXVExrT/wUiyO7h6HyiakcIGkzVYTX0KJaYQKL5Nlr55JeHGGz2nBpE46c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WLQI5azV; arc=fail smtp.client-ip=52.101.48.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WLQI5azV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icHNQbheYlaePZl8UA7oCxIjODAOSH1gMnDYoLnOXf4QtP8GFmler1VLY65N1SIxvb/t8A/nw4gEKZQRnl/11AayGf6D2JUK4QFqdZGMlkKAu20HVikspu1lCKBHXiaIug1CvAxZqfgiM+5XiyKqW8hVF7V4I9q5hGimlpfVJx4StgvVCLk6qdPqQfq1egQqz6el66lRChypAgfvMTJpVWkzBLIuU6LvMy1swchdb7LSN7LsNifa8by0laq1HBw6tQ0RyVo/KlXCOfyXEAVi6zzU8pX8RaOT5sW7N+hhGnC8JmPC4k4wogxsHuZvLoNwc3ZSe7II2r1z/gzeEBvmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haiKQSEONfXLgwLTNX2eNcLifMD3mEVZ29muTMJIy9w=;
 b=d1O/AP7m0QbxBrDOkxUi76rH0drp9QHCxwqiK4xLTbhap5Tk6Xe3nzkrkKHfZSQBZ3kMBIA+g2L0rQ4ESRjaDSRsQV9JiLVBMjsDTurVCGtlmEFGme5cuYiKfXM3SUgUBLvMdg5YcaYOiV/L8ASCSwys8fBy32lXQU4/zhUnXFyDV0YB8g5Sgwl6FnsMPcZQWZwZTaD7JBvuoHNCRCuz2NQIpTZN/xssGrSgW5wZLkb9INg/tDIrG9wK07/Yjo4gDT/L3Lz4bH7rmYC4t2zFEWB32A1YF3MnIyPDMsWIULgMB7ULnQHGo+Xdsxl9X7E/LZeNO4sImDff5pMTcrGYNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haiKQSEONfXLgwLTNX2eNcLifMD3mEVZ29muTMJIy9w=;
 b=WLQI5azVRoLLPJNJAdDd0m2OiYDxXBDgGPo7DzUHLkNerAJzvUFOBeP+DaFxg+fkCgxv2EGVRnikeKhEf7Scgp22lNeLoqE2QjjzzaZ4/HHCyBY3QLe5OZButPXhYZfxh1XeIDmhkAMk79bhNEa/x2BrY+XxVVrgJHi9p07jRx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SA3PR12MB7924.namprd12.prod.outlook.com (2603:10b6:806:313::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 07:22:44 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 07:22:44 +0000
Message-ID: <350447fc-95c3-411c-934b-26fdb37c5860@amd.com>
Date: Wed, 8 Jul 2026 09:22:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its
 own schema
To: Michal Simek <monstr@monstr.eu>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, git@amd.com,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, kishore Manne <nava.kishore.manne@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
References: <cover.1780499520.git.michal.simek@amd.com>
 <23d848e29176706548612c4a0751481d46176f11.1780499520.git.michal.simek@amd.com>
 <CAL_JsqLWwcRjzQs4DHV265w-ROzeW_OPVS0uP0Ew8p+-dYu+EA@mail.gmail.com>
 <da06120d-0850-4e79-9e07-efe481c057ff@monstr.eu>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <da06120d-0850-4e79-9e07-efe481c057ff@monstr.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0090.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::19) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SA3PR12MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf3bc6c-ecb0-49ef-2747-08dedcc1b401
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|3023799007|13003099007|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	SpoGK2NhuhGCqzaeGUVF68vi5lHmoAY5fv4xam96ETYFAyDrrs/SQOTlOcf746PHEpUKbP75BG7w9Y8SVDfnm8Z5f/9RjnDHOS/wqx+P8MsVpv9CHZ+p0YvISZHNaTwmpMb3By/v+EFIJ9zsXSZtsS94CSXLvyLIpxCSxs+b4HRuSjEANn+7NDBsgEEmNz9WRSPR8HT+UBtXKqxp7f1/kNrnmDDwMvWEstZLPvPIbkYfKAQygFsJAI9fUItgTD82oIaE6I+h19mKPBXc/mq7FpUwhRPt2TGrHr68n9fVowy6kGQKsO/70xym78XZ43BxRXRdvWCwzgOVQqB6XntsPpKqlu73pwBOFnVDCJZGerO9UZ0FR06mLryVxA94+mWIA8v9mnBOPrvUhcfW5AA/iWriZ5dimNeUXyyLjEZs21bNS/u7GcsPhJYPTuA+rVxi2cZgo6D6cpLYXbqGFpqIItu2Db1ljlutg3g6ivwyKK+SPHFHve91Z2oijOt7yrH/9WLNRtMuB7ttu+3pt//Z0LSnvD95ds+mj1wnftHnepv+2xycKhNhG8iA4iFucXr68CWAUIXEpz8mHimxfQuMSJYP8/UhOiDaTv6/7YIStSblzy0BQDdq1B9dGvAtN7H9vWFbPZUg0Ry8dv0gTyoRkptOHiZvgzVJLEz+Kur7rgs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(3023799007)(13003099007)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0lwWGkxYkhjN21wUE1wMG5LM29xTngzYXNFNVdlQ0pkVUpCZ2JCM21XUFRi?=
 =?utf-8?B?cTRxVHZDK0QzUFNoeXJnMjdJNStCK0pyUm1hYWlZS0QvdVI2VlMrY3YvMnNZ?=
 =?utf-8?B?WXZhRzdiVUtGeHpjeFpZOEVUWkVpQ0FabjhWaU9lSDZ3Q2NNZktOWFZ6T1JK?=
 =?utf-8?B?em1UZXZ5cVlKNE80UytIOEFzcUFuYzI0Z0UvQlovU0ppMkh0TCtPYXoraHQv?=
 =?utf-8?B?Y1RVd0VpQXJLN3NTUGRPOUx3d0ttZWRTb056QjkwQUZRWFh2UzRMT3Y0NE9v?=
 =?utf-8?B?VUlqenllZW84dmQ0emVrQjc4RVRwSzM0UlhtdGM4alpjVExGdXdUU0hhRXVz?=
 =?utf-8?B?WXdCbFVhWTVnTGh0TFBBdmRXRHh1dmlBUnB3WDJyampiMUR3MDJtVTFheTVo?=
 =?utf-8?B?RkVFb3dwWXpjZm4wNHBOTElEN0tzVzlrWU5LMEVLWVRpSlhrbHM1N28wMWJm?=
 =?utf-8?B?SUpJZE4xU3ltYms2amtvbllzUjJzTE5vZFNyN0EyY3dVd3BLUm53OXhRNlJ5?=
 =?utf-8?B?NDJBM1o3RlBxT3k4K0ErbE9ObUMwU1hBT1VmVHVvejNHbGR2WGF1c0lrZTBZ?=
 =?utf-8?B?WXNBUXNHbDJocEx2MFlDbmdNR1E4a2hXcHZ6ZjJJanVteFNmQjFEMnQ3ZFJ1?=
 =?utf-8?B?VytrbnFGNTZoVUZXU3VYa1luK29DckdqbkNWcmV1TG9GUU56cGdEWkJsbHlV?=
 =?utf-8?B?RlVXSm0wRzV4L2VvY3h0S1JYOE9abmFacVM0bDgwZFhrQVAzbmE4Qk9QOThL?=
 =?utf-8?B?Nm9TdWQ3cVNGcGZxRkZReG5qZVQ4dDh4UGlRY0srWEJTb08xdm4wZ3pidUJG?=
 =?utf-8?B?OFU3VFhOTnFxZ3Q5TlNEcHhFQTZhSGFER1hvekxYRXFTdkZpUHl4WWFzQVB1?=
 =?utf-8?B?K2ljemRMelFoUHZsc3BFWUxpNzBqdW9kM25lNUN5VTd6SzY3S080cGRPcHdV?=
 =?utf-8?B?RUM2UlBOUzZZK0gzY0h0UHlqcjRBL3pKTDJRZmNZVzBvemhqYTg3V0dmTUwy?=
 =?utf-8?B?WmZNVzdYUnFtQkFNbG9BRHozVHE0VXlkUElFNWNZSllMS1N3YjBxLzZpRkg5?=
 =?utf-8?B?bWhtTzlhKzIzNzc4K1gyZXQyVnloRFFHOXhtaWlZckJTS2FySGJpK0hCVEM5?=
 =?utf-8?B?WEdJT2ZUdGJSbUxBeVdIQkdkdUs4U1RnRS9mWG5ucW9BUGRIdVRJSkp6dmhz?=
 =?utf-8?B?Rks0NlIwd1EyVFo4a3ltVW1zdmRlQUtrZit2NXpZSXhxTUpGbXFlS29JWFNo?=
 =?utf-8?B?Rzdxb0Z0Q24xYkxJa20rTnpsN1ZhOFc0OFU5QkJEMHMxR1JWS1Y5cHBrUFhq?=
 =?utf-8?B?dTk1bHJYZjBBR2hadDg4Vmk0QkxFN0hIc0lnZ01mbktSM2F0TWwzKzdSZ1Jk?=
 =?utf-8?B?eXRRSElGeXlRZWxRWmUyTzVoUWVpUVdrM0dBTGNXeDhCenYwbVhFbmVOZkRv?=
 =?utf-8?B?Ty85cCszSlpGMUxJREhtOHZPM2NmUVY2amMvQ1FaWllxeFF2T2FDMDI5VE83?=
 =?utf-8?B?NEowMnRmQjQyMUlVeU42dnNYdGVpU0J6WmhtaU9nMENjOWtTYlN1QnRrdC96?=
 =?utf-8?B?QVY3ZzVlOE1HNWFSYkpycEZCeWk5UTNBSlp0SksxZTR4NWQ3ak5HaktubW1x?=
 =?utf-8?B?V09vdEsxM0tFSVVMZ09YbEhuRHg5TGtHVVBDWWhObXkrV2JnajBUc25BblB2?=
 =?utf-8?B?WGtiZDJUbG5nYm5tOVA3TXpieVJab2xPV2R2MU1BaXBoTG9LeDFjTkdnTitl?=
 =?utf-8?B?L0ttZ29MeHVLWkVpZENSZWlIQzNoK1U2UnlWU0diZEt4bGF0K1p4UVhKYlZE?=
 =?utf-8?B?WWlQNWE1QUx0RFlpZCtCRzJER0MycFp5K0JsR0VlZWwrVU4xR0loYTdDeVNV?=
 =?utf-8?B?Tk9KSy96RE1hcWlWZ3FXV0xSZTlTWlNXWDFXeWxNK2podno1K0xqNUdUbFN1?=
 =?utf-8?B?NnpBazB2VmttTThVSGpvNmZUdVFvZlpubTVXY1VqNFRBNGkvTWYwRXpQbWNN?=
 =?utf-8?B?dmI0by9sWXFmTlN4bVcxMkRLSkI0ZUlkN1RPMTVsT0p0Q2k4QkJMSnFHdUxB?=
 =?utf-8?B?L3pFYStNbEM0ZmNYS3FkV1F5cklubUhxQ24vcXJIUlRmcWpydWt2TU9meXcv?=
 =?utf-8?B?eWwvR0hkMzZkMUNqTXo3R3VvZG5wVEhmQWt5eVpnMGZiKzFuYU9qSUEyOWVu?=
 =?utf-8?B?MFdnVnR0ZHJEK0g3ejhoUDV2TFE4M1JFRVhnTVdpSkhTUGtTSEt0MzJ2WmlW?=
 =?utf-8?B?QXJ6TGtUVS91aWROOUM1QUJqS2t0NUdxV2dVMTRtczNUTU40WDl6TGRqbzhs?=
 =?utf-8?B?TWsraGJzUTNpVjAwMC9BMVpLckozTmF0TStvbFVBYlpLMEM1bURqUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf3bc6c-ecb0-49ef-2747-08dedcc1b401
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:22:44.0846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O41bTLscgqSc4/anXVoOFqBsxGINxjqYWpzueN9deeAKetXYp7oOsQTKJMNqeqtn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7924



On 7/7/26 18:34, Michal Simek wrote:
> 
> 
> On 7/7/26 17:55, Rob Herring wrote:
>> On Wed, Jun 3, 2026 at 10:12 AM Michal Simek <michal.simek@amd.com> wrote:
>>>
>>> The ZynqMP clock controller binding shares only #clock-cells with the
>>> Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.
>>> Also remove "(Optional clock)" from clock description because it is visible
>>> from schema itself.
>>>
>>> Suggested-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>>> ---
>>>
>>> Changes in v3:
>>> - Cover change in zynqmp-firmware.yaml
>>> - Move clock-cells to be the last in the example
>>> - Remove comment around (Optional clock) which is obvious from schema
>>>    itself
>>>
>>> Changes in v2:
>>> - New patch in series
>>> - Split zynqmp-clk from versal-clk
>>>
>>>   .../bindings/clock/xlnx,versal-clk.yaml       | 50 +-------------
>>>   .../bindings/clock/xlnx,zynqmp-clk.yaml       | 68 +++++++++++++++++++
>>>   .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  7 +-
>>>   3 files changed, 76 insertions(+), 49 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp- 
>>> clk.yaml
>>
>> This is now causing warnings in linux-next:
>>
>> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/ 
>> xlnx,versal-clk.example.dtb:
>> zynqmp-firmware (xlnx,zynqmp-firmware):
>> clock-controller:clock-names:0: 'pss_ref_clk' was expected
>>          from schema $id:
>> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
>> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/ 
>> xlnx,versal-clk.example.dtb:
>> zynqmp-firmware (xlnx,zynqmp-firmware):
>> clock-controller:clock-names:1: 'video_clk' was expected
>>          from schema $id:
>> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
>> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/ 
>> xlnx,versal-clk.example.dtb:
>> zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clock-names:
>> ['ref', 'pl_alt_ref'] is too short
>>          from schema $id:
>> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
>> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/ 
>> xlnx,versal-clk.example.dtb:
>> zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clocks:
>> [[4294967295], [4294967295]] is too short
>>          from schema $id:
>> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
>> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/ 
>> xlnx,versal-clk.example.dtb:
>> zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:compatible:0:
>> 'xlnx,zynqmp-clk' was expected
>>          from schema $id:
>> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> 
> I will look at it. Thanks for reporting it.

Today Linux-next won't have this series and I have also sent v4 with fixing this.

Thanks,
Michal
