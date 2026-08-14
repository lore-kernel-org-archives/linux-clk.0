Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B0E425CEE;
	Fri, 14 Aug 2026 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786695556; cv=fail; b=SyUtFu2DTTjdBP9Rt7x2NSAeRGK1a/pzQbpEblS6pQpDVWFcaEE1vxpdns8Bss8MdlMNDw8N92tmZC+4COTYSMS7ljxfiUo6fYlHlvDFseNwLrWyg5Y91GQwMh/2H5jR2oRoLC702cP/ZUseqYKMiVwHgx6n3t+oJUuQtd6Mrr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786695556; c=relaxed/simple;
	bh=zyRFRTJS6sG4wOUwcb74y9Ea1TOQj0lbeg//nXDYaZ8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JNvvNt07UeUYIGK9iMx5knzjXipuG/vlXDtjzV1aEKhWSs67mTn+5ztagPDpYe1nJexIOHRnNLGZTUCrID6WXGZ0bXn1LO4/2/kC+O3lYZSJppcK9Gb8I2mFhiWh+pqpzw2x4VOJi2TR6lbNCEomWpvr+S3gt8uvswXIeWewbNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=FB2HJFrX; arc=fail smtp.client-ip=52.101.43.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="FB2HJFrX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dox1PkfDkNdGOpvPpJeEESHR0KiKqYmL5NGdIuZQ8SQasH/ecqTWFWwyFyKNiwndvXU8tkM/SfOxYTN+u7qTbXdNofvkFCtztW1wQcWTTlR8h7KRRLJFPmvBvQ3fy9t19XoebvPGm62AKVbceU77pu/KqQ0Rt/rX9A2H0Le1F+1BGF8GOPtY+98mAcy4MvhUcG0MrrO2Env3PRwroIwE2NGAm7goqKKcz3saEMsX+aZzkREksr1ozT+v1AUlkEFPNPkjKyQKuqPLg7wy4k152lHp14rtEVEMVMAfZxKCaJAStIebMNdkRAP9XxHvkBWTTK5HZ8ck1QGrsAMjIYN6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqtckgFMQg2RoRMgUMAQb9Wd7fuNrYpiXVgw0wecxr4=;
 b=HKj7YiUsPN0uYnfDOsWeVwoqx3CgRlng+gSUHgXJW0EvKhf9wY78iBy/JcFmigv9vFUtHC98k/tFirIGvcH1ydYaDzo0504vuH7ioWg6zMHhERYyLUM4VtKyBxJEIY+fbyYolSG5BCOooKrNlMWOaRSUrUqi009C/e1rXRhM7FGa+/MSar4KQp2FspivVTQQJWzG16UNTFgfmfCngIO+u5gp8hyw1LD70Fd8+NXO2vX/jA0S3mD/Y++XKrZdKf6OREOXTYbUSO1761kq3dHNII8vvwwP20kjtOHsuFg/bmX4zO0M7k2lz00qOmOwkbee1R5KVLIgc1HF5cRO0WO46w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqtckgFMQg2RoRMgUMAQb9Wd7fuNrYpiXVgw0wecxr4=;
 b=FB2HJFrXsp9dORSL+UTNwOxy8e8Suju9hpyCatNkNsZA+4f2Ra7RlVkadWY+y7mCuYx42HJaaYWBFbdjHUbBiwzRNcg1FZvtPABPgLi7EXwB/D75Te3nr6Bt9BHwj9/Q0uScMPIL/sHKz1Vqa1XBBVdb0TDmJBuIy254p6HCK6h+k4ZyM7P9QlnMGBO8ZD1OXgFv8PulsFKsQffnOrPEVQOryaKW+1NUHLx9hvIm5Ds1CxQ2xLODtLj+rguJt0cGWKjV8e0KtkFsrQQ6Pww/zW44Zigjvb5i4ErEfEFUdNgqvIxPvyyRH89R5+kUZfkZA2w+i6KPclO5Gz+vAJ1dEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by BLAPR03MB5396.namprd03.prod.outlook.com (2603:10b6:208:29e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 08:19:08 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 08:19:08 +0000
Message-ID: <b027b8cf-a97b-4670-a57c-1585feccb21e@altera.com>
Date: Fri, 14 Aug 2026 16:18:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: altera: fix Agilex72 compatible
 vendor prefix
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lothar Rubusch <l.rubusch@gmail.com>,
 Ng Tze Yee <tzeyee.ng@altera.com>,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Brian Masney <bmasney@redhat.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1786006669.git.evon.chiam@altera.com>
 <b467b990e5290a2eccaedff826968a50fb51100a.1786006669.git.evon.chiam@altera.com>
 <20260812024937.GA616612-robh@kernel.org>
Content-Language: en-US
From: "Chiam, Evon" <evon.chiam@altera.com>
In-Reply-To: <20260812024937.GA616612-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|BLAPR03MB5396:EE_
X-MS-Office365-Filtering-Correlation-Id: e52e313b-4df2-45e0-54d8-08def9dcb677
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|7416014|22082099003|55112099003|18002099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	itwi5jInxAIwxQgXqD4OQb4i0LaQxqnfN3VlI32+JCX3UdEI8RedhDHWjw8Uz6FxmrLZi80IetbRdbENjb84qHZjsqt6oFgTbsrSU+5RlvAG2R5/HwPJgfo57y7buovCdhW30KJWqdOef2rW5ChvCQ46wRKupjg4CJA++SJCMdohAcGE8SyggT/QVUAWeY7mSE9kLsPaifmV4ga4ZQQGemxgCA8QXfQwm48d+R+x6YsShOVXkUMPZ/M/EJPLeJblTczYdrKmo+lX/sEuoMdjj1kSj9Z//wqcvk0UZ+Z4H4WIj241AYvqIa2AsEMUwMlVVrpC14d/z19JU7ZSz1huon7xuH3+KA8h5Bdxi6D23S3wlM/rMq0zqCXmmqBXaZtfNrWYyfK/W/qEQ70wKBXhin7aIMd1JnTrEhDpi81L3uz4Ay7Lna1Zd05yax73Ayu7NeziK1k+hMwdYMmN17WTWJPoqsxsqGOC6L5ihWKm2Q0jMN9XSon61s0ZcmRi1y/yJ6+/Mae/giETn3UMghXil7CRzhRwJZTCRbjYwzllHuiPHBDCNNlHSRgYueEU70Ma2RLDwjJN60I0aMkLOX9pJfFZcF7pHyolm/4rvJht6JmzrEFPWOOfDU/mFWanKu8VjWcubmFeyrEW9m+zdPQ8YN6ZfXUyJH5QBgRty2ar3NQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(7416014)(22082099003)(55112099003)(18002099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHBjVzRtd0tKa0VENW5Sc2c5eCt2YUYwczEyMzBYemQvNEdmVWo1MHBURWwz?=
 =?utf-8?B?RExUOEh5enk2QjNBYnRhZ0wxeVp6SS9wdUx4dkVybXFWeUVGYTJHamNlZU56?=
 =?utf-8?B?dWlaOEVpSFRGQ3l3TmNSS2JqTjQvYVZIck9GSllRRkFYOTFuWkN6M3B0RFN3?=
 =?utf-8?B?Ym9LaWZvOUhNQzV4cjRiRFZ6OVEvTVFBQ0RFQ2hMUEhTbGxDRXVGak1rUndU?=
 =?utf-8?B?ckQ1NzJvbHJZNkluU0hIWDlmdXQ1Sng1VEdjdTJaaHdpc1I5WXFwRUdIUnpI?=
 =?utf-8?B?QXpsMFZKNW45eHhGdXF1WHE0Z3dISHo4V3RuaTVJdUFTNE5OR09kdXcwUktU?=
 =?utf-8?B?Tmk2angxY1poSENCcmlxQnRHUHpsc3FMYXZLYmRndFJCMmxhaTNLd25kY1ox?=
 =?utf-8?B?ZGZxV21talZUMmhqM1ViNys1dGNMYmtTbHFMYldaL2xFT1hISjVPRlJrVlhw?=
 =?utf-8?B?OTdzYnBBOTRqM29QSXVITVJQOW1YQWZ3UTFsTlZ5NzNEMG95SkxiV1psRm5n?=
 =?utf-8?B?dGVqci8xSUZqcjd0bVBWQW13bUs1YzNXQ3c0RXUraW0vM3F6c1dZYjN5dXR0?=
 =?utf-8?B?c05RN2MwZXpmMlN0WHllL2dxOVRSS3IyYjlIRU9LOEZGbzhCL0xuOTE1Rmo2?=
 =?utf-8?B?OElFczNQcnhCKzViS2F4Y1pkZlRuZTBXZmxDYkswRkYxaEZzNWJoUVRzTDJJ?=
 =?utf-8?B?NCt4RVBiYUVaWlg5QlR3dHFmZTI2UGZmamppVWRLSTNNUFpzRU5tejhEK25k?=
 =?utf-8?B?YWdCUUppZkk3dDVFZHRJZUpVaDJEZFdld0JneVhCckJHb1lLOUNQbUdHTHlL?=
 =?utf-8?B?bStwaHp6QWtDcm1zaDhaU0doOC9ZaGRvSVB2Z20wN2RkZmxPRnBRTDFadHRi?=
 =?utf-8?B?WnlmcW9vMTRxV1RqRURsWWVMak9jcGpUYmovSWFNNnFIMGRKaGJZQ2hVQlMr?=
 =?utf-8?B?SWpsNXBrTEt4c04zajJIVTIxQmxKTlFlWkpTZUNUbU1iWHVEbElmNjRPUWZE?=
 =?utf-8?B?VlFYR3h0enNMQWhCUTdoRVMwUXhvdnVtdmRYWXA1YlIwWmJqSGVKb0JTTGZh?=
 =?utf-8?B?MkVzRFlJVzBEM0xwdjNFekdFbVBYamJ0eDljNVpCc2xsZ2c2MUIyVGZpN1J4?=
 =?utf-8?B?MDd6U2hlZ1pYM0RMR2thaHdhK2psMm9EMlVnSE5ERkFsbm9xem5KRHphUWYv?=
 =?utf-8?B?UEl2Rm9OM0hLNUMwQi9FWXJWMk95MTBzRndnK084cGxrbzVnKzJyalZpRkJG?=
 =?utf-8?B?Ym5HbFN2a0poUG1jNktQdUlmZXBxZERGTjR6NGFPaTJzVkdHY2FtOXBLcnNT?=
 =?utf-8?B?dWtmUGFyaXZQdDZjZnhWWmVlS1dxNnJoUTdSdVhUS1dyVFFUODFsT1FFRFl6?=
 =?utf-8?B?RnJjcVFJZmxIcXFjMmlDQklLVzBDakJsdFg3VStxeHRldHVkcDFwR0xOZnJR?=
 =?utf-8?B?bm94SFJyR0VCSjIyWUpsYS9sM3J4TGplNnRGb1ZrVVZiNi9jcDJ3TUhPVDlx?=
 =?utf-8?B?dlJuUmplUmx2VGs2c1VWNExpM05mbkpxWUlHSURDNVhNTk5GSFpOY1E0eThY?=
 =?utf-8?B?R3RIUGU3cVgzMkpRR3JURm9xZ01iNTVFZS9MUi81VDFZdjFvRHJzOGNxTHht?=
 =?utf-8?B?N2ZTeE93eSs3K3dkK0hnN3V5N2lHanp3MmplZUQxc1ZuWlgzWmJkbWpjcmJI?=
 =?utf-8?B?bkYyVkIvRnkrdWxzbHQyM0ZYSzJQYlVKcFk2am5VVVBkQ3RhcFZGc21aVmZY?=
 =?utf-8?B?TmRPWnVpcmlON1E3MGhhTlRCZzIvVzBxV3JxMEk2UFpXQTdJWnBvR3VMR1pj?=
 =?utf-8?B?Q3ZBUkJzYlBEUDJrSVNOVTVnRzFWa3czcUNxNnhzdjAzUGxFVUhta3dJbURG?=
 =?utf-8?B?cnRUMnkrYTZPRmp5QkVJOElKVmpPVDlDQ3E5ZDVaQSsvUmVqSDBqZVNqZWxR?=
 =?utf-8?B?MXlMM1NhRzJlUEN4OFM1YnlSeXJEaEFuWjErN3JnR2xRMkNvaDNEU0lvZ1Z4?=
 =?utf-8?B?eTAxZE5Wak50ZHRUNzRJVkxhdlJZSmxuWGV1R0dtTWhIZlZIU1RmWFdMZm9h?=
 =?utf-8?B?WU5jckJIbnpaNUZUTzR1cm5VTW5yNUJwc2hYdnk4ZmlFb2ZFazhPdy9tdFFi?=
 =?utf-8?B?WG1ESlBYQ3FOQ0VLSU5YRlhvb0dIK0lGMTFkRnhMSE0zMFFKMk1HWVNmcjN5?=
 =?utf-8?B?cXF3dWFSZTM2eGk0TlRVYm03d2V1R3U2Q012QzRKdXZ5dGJVbHY0L2hwby9i?=
 =?utf-8?B?S3JqbmJVYlBua2RXemt1NVJybkpYUnV5VkgzbjlTdlNmNDlWOE9RNU9ranky?=
 =?utf-8?B?L2Zianl2em1PMm9uQ3JxZHR3a3EvNHhyZ1FDemduZWNHSjdMdEdLQT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52e313b-4df2-45e0-54d8-08def9dcb677
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 08:19:08.6138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/ShAf9KRxjB3MbpDSSrfpqMNR5NXFgqa9G6XP2L7FiegdH+eGR+zpsFnX3zJaLH/xdulUxed86zGuU1gpJQig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5396



On 12/8/2026 10:49 am, Rob Herring wrote:
> On Thu, Aug 06, 2026 at 05:25:01PM +0800, evon.chiam@altera.com wrote:
>> From: "Chiam, Evon" <evon.chiam@altera.com>
>>
>> Altera has separated from Intel. Update the Agilex72 SoC and board
>> compatible strings to use the Altera vendor prefix instead of intel.
> 
> Sorry, without better reasoning, you are stuck with them as sashiko
> pointed out.
> 
Sashiko’s comment on the DTS still using the intel compatible strings 
was based on reviewing patch 1/5 alone. Patch 4/5 moves the Agilex72 DT 
from arch/arm64/boot/dts/intel/ to arch/arm64/boot/dts/altera/ and 
updates the compatible strings to altr. With both patches applied, the 
bindings and DTS remain consistent.

Would you prefer that I combine the patches 1/5 and 4/5 into a single 
patch so the binding and DTS updates land together?

>>
>> Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
>> ---
>>   Documentation/devicetree/bindings/arm/altera.yaml | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
>> index 3030cf46fe74..2ab53cade2fe 100644
>> --- a/Documentation/devicetree/bindings/arm/altera.yaml
>> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
>> @@ -119,8 +119,8 @@ properties:
>>         - description: Agilex72 boards
>>           items:
>>             - enum:
>> -              - intel,socfpga-agilex72-socdk
>> -          - const: intel,socfpga-agilex72
>> +              - altr,socfpga-agilex72-socdk
>> +          - const: altr,socfpga-agilex72
>>   
>>         - description: Agilex7m boards
>>           items:
>> -- 
>> 2.43.7
>>

