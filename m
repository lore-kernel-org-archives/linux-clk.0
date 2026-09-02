Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010062.outbound.protection.outlook.com [52.101.61.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D414144C667;
	Wed,  2 Sep 2026 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345190; cv=fail; b=IbeXerQlqm1XlqczLi36VVAugdy92vwgfG/fCXqg+KeJpjstifDbBuISiWSyQDXNDldsB05cKhcC2s0Pz7EZywG335WdJ8nX5hbbUqCRNIwdSeMKVcs+7uclCswHykK+JZ6tnRuRa3MM0rMUbAdaq6jPaDPbiGssaQiQYkKZg7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345190; c=relaxed/simple;
	bh=/TZIcucUUF1BRwDu8MZm66uqJmWRww0SpoJ9/me6hcc=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D13XSzAqma2rsYtmry0J2pYrpSe3xpTG2I05NddK3SvCe/DPkLVeqar55XOywwAEzx7N5B6si88/mOAVauc+7Uo5suK9lBvn8hWYO54auxG3uEuFtEoJ76npCzL9dgXKexUccoPUN0f8KlZpLU7FaFrvQ0GOuhkYX4jawlKX4IA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=XL+yO0N9; arc=fail smtp.client-ip=52.101.61.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="XL+yO0N9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUkar4ClkGzTNI30FOIIx5cAr1EF2oTwbZFTuaX3/8skiSK+2lg/wiPe/58FrueTaUeNGM9kFEHQCSppkuIiFIHS5nnTWo/9a8Qi5dp1TUc3N72UyxF80TfZI35pdTUacwxwM56/cF6qvBtUDVTJDeacICgcS+5WF3TeNkwkt13Zyie08QWhA1s0QuUkWsAmvgvZmEo3K2M2Ss9x3YiLD29zvd77NiHH2StXujyZy4c6c4rih5WugpcmTQYfE2VVpEVDGKL3sCDftZ9IiBLIqO77l16X5b98C4T3TrFdtPQP6zwUeMi7alPs6VKRiRp9baPNRH67Abb7z2wE7V9CKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuYVfIsCPGRtDCJS8Nat4zRKtvws3yw8AfMA3QR1FZM=;
 b=QqnJ1V7Eru7MOQ44E66UZP5SeWN4hcgswSlId3D3L7doyer/NtKav8X3QSGWSUAOhXzRolsfss6gEa3mTBRYG/LjtfJvJU49Kjp2zH61M8FljAAKgDyClFjfd6qrBC9HjNP1arElYIJ+0suszRA8Xfa+s41dqudUDkdTrPz+4W7Eh6eLFKz2fPxW+nVfWYRnUTMlRD2sQ07Ep6lU2xuGQZfIzm/IlXKZ4qGaZxwg9HUY3DPHWzEIo1/nPU0XRN/cF1pXILoNCI3mWTQYp+QQS5QbEFOEar90mjTLGxtyO/vJT8qL7UR5YzxfxVpW6FLN5dyuO+/SQLAYAIasp4CexA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuYVfIsCPGRtDCJS8Nat4zRKtvws3yw8AfMA3QR1FZM=;
 b=XL+yO0N9SYjwEn16/U2sjUmwRmmIaiArcDsC3GtXJDvaiR1wglg2Zhl6cmDQGtM73JY6yV0h+H/NqY6dwIKmS0SHvSOs4igr+kRFDog/JclYVyxg14vmwjl1n6ScwoT8iDzRYa0I5Ft3bMbvE5pOyoAfGYBjrOjeon+sLYz7w0fUqreQ5SSKdmGRZUG4VdXjQ1Z/MGL8CGJHk9g+N36G22wCDCvXDG5sQBKuuAnlPVw3irW/Jxy3OLCOfLezdwsK4YWB6vVifos1AvvqUk+0ItCGJBuf8fndXtrLNum53sTcQaCOhKsPiulkp61QArvEOTRKn8Jwt3fe6bh9eAgBTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by SA0PR03MB5561.namprd03.prod.outlook.com (2603:10b6:806:bc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 10:33:03 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 10:33:03 +0000
Message-ID: <d04f7897-b775-4591-b26f-31cd57ad1b5b@altera.com>
Date: Wed, 2 Sep 2026 18:32:56 +0800
User-Agent: Mozilla Thunderbird
From: "Chiam, Evon" <evon.chiam@altera.com>
Subject: Re: [PATCH 3/5] clk: socfpga: agilex72: add clock manager driver for
 Agilex72
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Lothar Rubusch <l.rubusch@gmail.com>, Ng Tze Yee <tzeyee.ng@altera.com>,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Brian Masney <bmasney@redhat.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1786006669.git.evon.chiam@altera.com>
 <97675c0efd40a9407b6b1a1941cc73b73dd45d39.1786006669.git.evon.chiam@altera.com>
 <4a493c7f-a248-4896-890d-3aa55e074ddd@kernel.org>
Content-Language: en-US
In-Reply-To: <4a493c7f-a248-4896-890d-3aa55e074ddd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:a03:255::13) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|SA0PR03MB5561:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d005e0-c544-4b3d-14b6-08df08dd915a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|10067099003|22082099003|18002099003|4143699003|55112099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	En7ASBT8IZXm9sDa66In1qkq6eYABvGq+jN+Nts9M3UZkMobEVDWD8HzyH3g1JuoVbCKLjJiVzdFI0aae4nyIXq8flJ7ZwIi5rF247WtYNKW9PX483ezkWpMcOS6+yaFZ4ke43u9E8b0fc/DvJe+wJkR3uPC2/JLnXnITwmPm7iN86VjovXTWiwHfIxMIa6uw5SRY0xxd+ECUva9/tC9Wj682u+aYAnoglnRn2ycncLHRIsN0B22HzBlzgZ5souPEFEEazxfmCcxggV5eBi+zHs8t81E/QVhesaXIDWyim8OJDs9XNQQl6neXgUcoLHO1xQ29x8w9lwgAOQhQT7Ig/O2t1MIrdmtU8KgdkLyWiYJiIogicmJKMhOOe0z1RJOqCjRV4eCFVxNc0g49tsnPxVvWosR3NEFOYZfhhwd9rN4LApJTIKuNXxNZKuQ3Z06bktIk5n9Fe1c63n8Gce6NrWDe4QrXvRpYje4HclZqVb25K5dYCE0a7u5z0TEolU1LRjKkQfw78xeVJSLnNu+pm5Kpb/oHPb2MFHnk6lxqKwzwbfH0145BGzWQs5ngObrY0nR0vAXhIdJpFhy2Ok4KACH7DTJUbruwVdTG34AhJvZM1zwmOQB+z0oCF0//Gy5pDvreTzoNhLE38a5yvdypqKqrsVPmaUS++AwVCZmAr0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(55112099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0hXQWYzYmplZWRXNDZPejgyZTZzcURvQlJMaEJMdXBEcW9hOG9uTkFEdm4z?=
 =?utf-8?B?K1pUeEduWXVhMGlvVytCQWxEdUpNOHN3SWQ2ejQ1QmNoSVd4OUpXeDdTMW9u?=
 =?utf-8?B?Myt6Z21EM0Rmci9PRVRkRGJhcmNzcURLUWNoRXZYeHllL3VTWUJlVlFsUHJE?=
 =?utf-8?B?T3dhblpiRTVKSkVKckxOcVFrempXNmZGeXkzeHhzVGxYYzlHb1dBclZZdjVB?=
 =?utf-8?B?TVZGU2FiejNpcW5FVDc1THVwMFdZQVoxZzQ3UDBuaGdaUEZRM1VzMytib3dC?=
 =?utf-8?B?bjJmTW5KMEpTUjZJMzZUTDk5alRrckhLR0Uza2d0d1hRWkgzTWFaUTVYY0Vu?=
 =?utf-8?B?Y1Q4QTRnT0VRQlYwSElWNDdSZFB2T1JSeXdQNStQRFgwaVFMNkhrdUdVMnFs?=
 =?utf-8?B?L2Z3VmdHZ1JUSzdBWFRtZVZWNDBGaWVkTW1aenNlSDI5NElMZmQ0VWVEQnQz?=
 =?utf-8?B?RnZhZFF1bFJ2SXlNKzdvbHc5NjJEdHgycW5RbXN3SzdLbXpCaVdIVitMUVo1?=
 =?utf-8?B?dkZxNGZvZ09UQkNlZXdvMWoxSzRIV3RNZVI2UGdXWGt4enFVQ1JLbWl2YWVi?=
 =?utf-8?B?Z1ZJYjFMR2YyM1FCNVZIVGFVVFd4Zkc3SmZsWEtKZjZPMEhuS3R6YUQ3b0kw?=
 =?utf-8?B?WVgwVmtITmMyTnFhaloxK0VTbnNIMXh4U1luUWNKaGY5MGp6ZVdwVTdKL0Nv?=
 =?utf-8?B?empNOEFyUFR2dm03ZVJWeVZGRUJlZWpxTWV4Y0pGczVBMysyL1V6bVRnM0Vy?=
 =?utf-8?B?SEEwaWo3VGNva3p1SkY3NWdVSmh0VTVKbWRDMXpKY2tDcGMvbk5INTRqWXdH?=
 =?utf-8?B?VUJBeWk5Z0hvOXNtQVhLemVwTUhUYmswczZxQXhETW9LZHhiNmlIcS8vTkRN?=
 =?utf-8?B?YUhURlY3MGdjNjdGZXJLYUw2aDdOT2syK2hnb0k0Q01oNC93Q29hZGVGUEsy?=
 =?utf-8?B?SS9nMTR5OWxnTEE5SzFtem83RnlQR3RtUWxjU3EzbGw3dis1SUQ3V0h4dVdS?=
 =?utf-8?B?THpBcGd4QjNKS2lDSkhKSzBVYVZOajhzY1R4ZXNxcy9aaEtUN0ZnNlVjVjRP?=
 =?utf-8?B?RitnMjdyYjFvSDZ4VHM1azRRMVpzR3hYRXlBZmJ2YzNXZmxKTnNnOWo2Q01k?=
 =?utf-8?B?TllJYWpNZ1phUkh2YlVMZndZZy84OGlDaWN1MTl6NUNYMkc0bzV6VjNpbFlw?=
 =?utf-8?B?SUNXV1BQRlI2SlRnNFdpdkZZaTl6NkZhSjB5L0NiVFRwajdVMmJZaXJwL0VW?=
 =?utf-8?B?RURQMTJXNjV6WUw0emRGTnF5Y0NDYTZpWTFBYWhadlMyeUt4SXlEL2hWYVQ4?=
 =?utf-8?B?dW9UZERxeEkrODZFWDhCOFMveGlkR1Ayb0N3L1hGUU1tdjNXYjF4cGdsVFZS?=
 =?utf-8?B?RUxRbVp6cWZnK3Z2N0VSeWtsZmVtRzRrT3NVL0l2VGcyay9BTnQ1eDN5Zk53?=
 =?utf-8?B?UHZjem5LWmdMWE02RXhEbHBZUXlMbFI4Wjl6QjQ3TEZzU3laZ1VlSEZCSGdH?=
 =?utf-8?B?NTU0UVFzQ2h2WTIwdG5vM3RBT2NiS2NaeUM1MGNmKzNyV3BmNG04eUlFc3N5?=
 =?utf-8?B?QkF3UnlycW45VW9xUnNqSTAwN3hFQUY4c09WRnhyVGZkbWVudFNyVms2R1hv?=
 =?utf-8?B?TkI2NzRHZEpDMTRzdzU2dEgvZGlNSFI0Szd3dUh5RkV0RjdST2dva1ZnZGdO?=
 =?utf-8?B?dGYycElCajl0bHR0cGR3VjJ2Z0V0cDZnejlKRWNFR2V4L0wxS201ZjI5U2R5?=
 =?utf-8?B?UU55dG5pbU14QUR4S2pCb0dKYS8zYTRuVzIzdW9ndjdDOWRJODBiZWVxZ3ZQ?=
 =?utf-8?B?MmovODB6c1ArenJJOHA2K3B0amd2dkIvcll0aHlJYnlYY2FaakIwcWFDWFF1?=
 =?utf-8?B?TEppRW1mcTRMUGxxL2pYQndHMityMjVsR00rT2t2d3RFc3RsbWxFVmhNY1dU?=
 =?utf-8?B?cjM3UlVNMFp2MnIxblgvS1dBNExFaEd6MmtMZ2U4alpEVHpyVXJPZUNSa1Bo?=
 =?utf-8?B?RlBTdTRSQ2doc1E1cW1MWlluWStQdDVSRGEwNXZJYU1ZbmowRVA0bkcrNTZN?=
 =?utf-8?B?ckFUbGRvS1MxZW82bWlEN0ltUW9jQ25ZM1JhU2FPb2tRK2U5S29TbTZYcW5m?=
 =?utf-8?B?SDFLbTQweTZacHdMVUdFQ2VIYU16Qk0rTUN6dVVpL2MzWStOMEcvVlpHenhs?=
 =?utf-8?B?MUxLRHJBeDV0SjRRdEVWZGI0ODlFeVUzb2hrdlRGK0hJZTVCcWJvMXc1czYz?=
 =?utf-8?B?SlZjNFRXbFRyblM4OThnNFJCYUVtV2NQWERvcVdlREtjMUs4aTUzNGE3R0Ri?=
 =?utf-8?B?Sk1LWmVKRng5YUFoVk5Pa0JuNVkrU1orUFRpRXA3emVyZlgyV0VZUT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d005e0-c544-4b3d-14b6-08df08dd915a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:33:03.0974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ri9Bc220C9SS/vhYTm5QYpkUMHAZXQowsXMSjbevx19WdpfyH6/VkHhrq6CFgGiL7x7UkKwdWaH3FlY/WwYrJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5561

Hi Dinh,

Please find my replies inline below.

On 27/8/2026 10:38 pm, Dinh Nguyen wrote:
> 
> 
> On 8/6/26 17:25, evon.chiam@altera.com wrote:
>> From: "Chiam, Evon" <evon.chiam@altera.com>
>>
>> Add new Clock manager driver to support new Altera Agilex72 platform
>>
>> Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
>> ---
>>   MAINTAINERS                        |    5 +
>>   drivers/clk/socfpga/Kconfig        |    3 +-
>>   drivers/clk/socfpga/Makefile       |    2 +-
>>   drivers/clk/socfpga/clk-agilex72.c | 1181 ++++++++++++++++++++++++++++
>>   drivers/clk/socfpga/clk-agilex72.h |   91 +++
>>   5 files changed, 1280 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/clk/socfpga/clk-agilex72.c
>>   create mode 100644 drivers/clk/socfpga/clk-agilex72.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 15011f5752a9..1b850dc3d6b6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3581,6 +3581,11 @@ S:    Maintained
>>   F:    Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
>>   F:    drivers/media/platform/samsung/s5p-mfc/
>> +ARM/SOCFPGA AGILEX72 CLOCK DRIVER
>> +M:    Chiam, Evon <evon.chiam@altera.com>
>> +S:    Maintained
>> +F:    drivers/clk/socfpga/clk-agilex72.[ch]
>> +
> 
> I'll just maintain it for now under all socfpga.
Got it, thanks. Will remove ARM/SOCFPGA AGILEX72 CLOCK DRIVER entry in v2.
>>   ARM/SOCFPGA ARCHITECTURE
>>   M:    Dinh Nguyen <dinguyen@kernel.org>
>>   S:    Maintained
>> diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
>> index d88277e2a898..40cac9428fbe 100644
>> --- a/drivers/clk/socfpga/Kconfig
>> +++ b/drivers/clk/socfpga/Kconfig
>> @@ -13,7 +13,8 @@ config CLK_INTEL_SOCFPGA32
>>       default ARM && ARCH_INTEL_SOCFPGA
>>   config CLK_INTEL_SOCFPGA64
>> -    bool "Intel Stratix / Agilex / N5X / Agilex5 clock controller 
>> support" if COMPILE_TEST && (!ARM64 || !ARCH_INTEL_SOCFPGA)
>> +    bool "Intel Stratix / Agilex / N5X / Agilex5 / Agilex72 clock 
>> controller support" \
>> +        if COMPILE_TEST && (!ARM64 || !ARCH_INTEL_SOCFPGA)
>>       default ARM64 && ARCH_INTEL_SOCFPGA
>>   endif # CLK_INTEL_SOCFPGA
>> diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
>> index a1ea2b988eaf..97af3dfdbbad 100644
>> --- a/drivers/clk/socfpga/Makefile
>> +++ b/drivers/clk/socfpga/Makefile
>> @@ -3,4 +3,4 @@ obj-$(CONFIG_CLK_INTEL_SOCFPGA32) += clk.o clk-gate.o 
>> clk-pll.o clk-periph.o \
>>                        clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
>>   obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-s10.o \
>>                        clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o \
>> -                     clk-agilex.o clk-agilex5.o
>> +                     clk-agilex.o clk-agilex5.o clk-agilex72.o
>> diff --git a/drivers/clk/socfpga/clk-agilex72.c b/drivers/clk/socfpga/ 
>> clk-agilex72.c
>> new file mode 100644
>> index 000000000000..e350d8a9bb4d
>> --- /dev/null
>> +++ b/drivers/clk/socfpga/clk-agilex72.c
>> @@ -0,0 +1,1181 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2026, Altera Corporation
>> + */
>> +#include <linux/slab.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/io.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/string.h>
>> +#include <dt-bindings/clock/altr,agilex72-clkmgr.h>
>> +#include "clk-agilex72.h"
>> +
>> +#define EMAC_BYPASS_OFFSET          0x10
>> +#define CLK_MGR_FREE_SHIFT          16
>> +#define CLK_MGR_FREE_MASK           0x7
>> +#define PERI_CLK_CNT_DIV_WIDTH      11
>> +#define BOOTCLKSRC_MASK             0x2000000
>> +#define BOOTCLKSRC_SHIFT            25
>> +#define SOCFPGA_PLL_POWER           0
>> +#define BOOT_CLK                    "boot_clk"
>> +#define CLK_MGR_PLL_CLK_SRC_SHIFT   27
>> +#define CLK_MGR_PLL_CLK_SRC_MASK    0x3
>> +#define PLL_RATE_REG_OFFSET         0x4
>> +#define PLL_CR_N_HI_MASK            0xFF
>> +#define PLL_CR_N_LO_MASK            0x1FE00
>> +#define PLL_CR_N_LO_SHIFT           9
>> +#define PLL_CRHI_M_MASK             0x1FF00000
>> +#define PLL_CRHI_M_SHIFT            20
>> +#define PLL_CR_C_MASK               0xFF
>> +#define PLL_CR_BYPASS_DIV_MASK      0x100
>> +#define PLL_FRACT_DIV_REG_OFFSET    0x5c
>> +#define PLL_CR_FRACT_DIV_MASK       0xFFFFFF
>> +
>> +static bool agilex72_gate_is_emac(const char *name);
>> +static u8 agilex72_parent_index(const char * const *parents,
>> +                size_t num_parents, const char *parent_name);
>> +static unsigned long agilex72_boot_clk_recalc_rate(struct clk_hw *hwclk,
>> +                           unsigned long parent_rate);
>> +static unsigned long agilex72_clk_pll_recalc_rate(struct clk_hw *hwclk,
>> +                          unsigned long parent_rate);
>> +static unsigned long agilex72_peri_c_clk_recalc_rate(struct clk_hw 
>> *hwclk,
>> +                             unsigned long parent_rate);
>> +static unsigned long
>> +agilex72_clk_peri_cnt_clk_recalc_rate(struct clk_hw *hwclk,
>> +                      unsigned long parent_rate);
>> +static unsigned long agilex72_gate_clk_recalc_rate(struct clk_hw *hwclk,
>> +                           unsigned long parent_rate);
>> +static u8 agilex72_boot_get_parent(struct clk_hw *hwclk);
>> +static u8 agilex72_clk_pll_get_parent(struct clk_hw *hwclk);
>> +static u8 agilex72_peri_c_clk_get_parent(struct clk_hw *hwclk);
>> +static u8 agilex72_clk_periclk_get_parent(struct clk_hw *hwclk);
>> +static u8 agilex72_gate_get_parent(struct clk_hw *hwclk);
>> +
>> +/* External parent clocks come from DT via fw_name */
>> +static const char * const boot_pll_parents[] = {
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +};
>> +
>> +static const char * const gppll0_clk_parents[] = {
>> +    "osc1",
>> +    "cb-intosc-div10-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const gppll1_clk_parents[] = {
>> +    "osc1",
>> +    "cb-intosc-div10-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const gppll2_clk_parents[] = {
>> +    "osc1",
>> +    "cb-intosc-div10-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +/* Core free muxes */
>> +static const char * const comp0_free_mux[] = {
> 
> Do you mean core0 here?
> 
comp0 is the hardware name, not a misspelling of core0. It's for mixed 
CPU complex.

>> +    "gppll1-c0",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const core2_free_mux[] = {
>> +    "gppll2-c0",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const core3_free_mux[] = {
>> +    "gppll2-c1",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const dsu_free_mux[] = {
>> +    "gppll1-c1",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const ccu_free_mux[] = {
>> +    "gppll0-c0",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const hsp_noc_free_mux[] = {
>> +    "gppll0-c0",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const lsp_noc_free_mux[] = {
>> +    "gppll0-c1",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const trace_free_mux[] = {
>> +    "gppll0-c2",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const emaca_free_mux[] = {
>> +    "gppll0-c0",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const emacb_free_mux[] = {
>> +    "gppll0-c0",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const emac_ptp_free_mux[] = {
>> +    "gppll0-c0",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const gpio_db_free_mux[] = {
>> +    "gppll0-c1",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const usb31_free_mux[] = {
>> +    "gppll0-c0",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const s2f_user0_free_mux[] = {
>> +    "gppll0-c1",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const s2f_user1_free_mux[] = {
>> +    "gppll0-c1",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const xspi_phy_clk_mux[] = {
>> +    "gppll0-c3",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +static const char * const memdevice_phy_clk_mux[] = {
>> +    "gppll0-c3",
>> +    "osc1",
>> +    "cb-intosc-div2-clk",
>> +    "f2s-free-clk",
>> +};
>> +
>> +/* Secondary muxes between free_clk and boot_clk */
>> +static const char * const comp0_mux[] = {
> 
> core0?
> 
comp0 is the hardware name, not a misspelling of core0. It's for mixed 
CPU complex.

>> +    "comp0_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const core2_mux[] = {
>> +    "core2_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const core3_mux[] = {
>> +    "core3_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const mpu_mux[] = {
>> +    "dsu_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const ccu_mux[] = {
>> +    "ccu_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const hsp_noc_mux[] = {
>> +    "hsp_noc_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const lsp_noc_mux[] = {
>> +    "lsp_noc_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const cs_at_mux[] = {
>> +    "lsp_noc_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const cs_pdbg_mux[] = {
>> +    "lsp_noc_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const cs_trace_mux[] = {
>> +    "trace_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const emac_mux[] = {
>> +    "emaca_div_clk",
>> +    "emacb_div_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const emac_ptp_mux[] = {
>> +    "emac_ptp_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const gpio_db_mux[] = {
>> +    "gpio_db_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const usb31_mux[] = {
>> +    "usb31_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const s2f_user0_mux[] = {
>> +    "s2f_user0_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const s2f_user1_mux[] = {
>> +    "s2f_user1_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const xspi_mux[] = {
>> +    "xspi_phy_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const char * const memdevice_phy_mux[] = {
>> +    "memdevice_phy_free_clk",
>> +    BOOT_CLK,
>> +};
>> +
>> +static const struct agilex72_pll_clock pll_clks[] = {
>> +    {
>> +        .id = AGILEX72_BOOT_CLK,
>> +        .name = BOOT_CLK,
>> +        .parent_names = boot_pll_parents,
>> +        .num_parents = ARRAY_SIZE(boot_pll_parents),
>> +        .offset = 0x4,
>> +    },
>> +    {
>> +        .id = AGILEX72_GPPLL0_CLK,
>> +        .name = "gppll0",
>> +        .parent_names = gppll0_clk_parents,
>> +        .num_parents = ARRAY_SIZE(gppll0_clk_parents),
>> +        .offset = 0x160,
>> +    },
>> +    {
>> +        .id = AGILEX72_GPPLL1_CLK,
>> +        .name = "gppll1",
>> +        .parent_names = gppll1_clk_parents,
>> +        .num_parents = ARRAY_SIZE(gppll1_clk_parents),
>> +        .offset = 0x80,
>> +    },
>> +    {
>> +        .id = AGILEX72_GPPLL2_CLK,
>> +        .name = "gppll2",
>> +        .parent_names = gppll2_clk_parents,
>> +        .num_parents = ARRAY_SIZE(gppll2_clk_parents),
>> +        .offset = 0x60,
>> +    },
>> +};
>> +
>> +static const struct agilex72_perip_c_clock main_perip_c_clks[] = {
>> +    { AGILEX72_GPPLL0_C0_CLK,
>> +      "gppll0-c0", "gppll0", 1, 0x24, 23,  0, 8, 8 },
>> +    { AGILEX72_GPPLL0_C1_CLK,
>> +      "gppll0-c1", "gppll0", 1, 0x28, 14, 23, 8, 8 },
>> +    { AGILEX72_GPPLL0_C2_CLK,
>> +      "gppll0-c2", "gppll0", 1, 0x2c,  0,  9, 8, 8 },
>> +    { AGILEX72_GPPLL0_C3_CLK,
>> +      "gppll0-c3", "gppll0", 1, 0x30,  0,  9, 8, 8 },
>> +    { AGILEX72_GPPLL0_C4_CLK,
>> +      "gppll0-c4", "gppll0", 1, 0x38,  0,  9, 8, 8 },
>> +    { AGILEX72_GPPLL0_C5_CLK,
>> +      "gppll0-c5", "gppll0", 1, 0x3c,  0,  9, 8, 8 },
>> +    { AGILEX72_GPPLL0_C6_CLK,
>> +      "gppll0-c6", "gppll0", 1, 0x40,  0,  9, 8, 8 },
>> +    { AGILEX72_GPPLL1_C0_CLK,
>> +      "gppll1-c0", "gppll1", 1, 0x24, 23,  0, 8, 8 },
>> +    { AGILEX72_GPPLL1_C1_CLK,
>> +      "gppll1-c1", "gppll1", 1, 0x28, 14, 23, 8, 8 },
>> +    { AGILEX72_GPPLL2_C0_CLK,
>> +      "gppll2-c0", "gppll2", 1, 0x24, 23,  0, 8, 8 },
>> +    { AGILEX72_GPPLL2_C1_CLK,
>> +      "gppll2-c1", "gppll2", 1, 0x28, 14, 23, 8, 8 },
>> +};
>> +
>> +/* Non-SW clock-gated enabled clocks */
>> +static const struct agilex72_perip_cnt_clock main_perip_cnt_clks[] = {
>> +    { AGILEX72_COMP0_FREE_CLK, "comp0_free_clk",
>> +      comp0_free_mux, ARRAY_SIZE(comp0_free_mux), 0xbc },
>> +    { AGILEX72_CORE2_FREE_CLK, "core2_free_clk",
>> +      core2_free_mux, ARRAY_SIZE(core2_free_mux), 0xb8 },
>> +    { AGILEX72_CORE3_FREE_CLK, "core3_free_clk",
>> +      core3_free_mux, ARRAY_SIZE(core3_free_mux), 0xb4 },
>> +    { AGILEX72_DSU_FREE_CLK, "dsu_free_clk",
>> +      dsu_free_mux, ARRAY_SIZE(dsu_free_mux), 0xc0 },
>> +    { AGILEX72_CCU_FREE_CLK, "ccu_free_clk",
>> +      ccu_free_mux, ARRAY_SIZE(ccu_free_mux), 0xc4 },
>> +    { AGILEX72_HSP_NOC_FREE_CLK, "hsp_noc_free_clk",
>> +      hsp_noc_free_mux, ARRAY_SIZE(hsp_noc_free_mux), 0x104 },
>> +    { AGILEX72_LSP_NOC_FREE_CLK, "lsp_noc_free_clk",
>> +      lsp_noc_free_mux, ARRAY_SIZE(lsp_noc_free_mux), 0x108 },
>> +    { AGILEX72_TRACE_FREE_CLK, "trace_free_clk",
>> +      trace_free_mux, ARRAY_SIZE(trace_free_mux), 0x144 },
>> +    { AGILEX72_EMAC_A_FREE_CLK, "emaca_free_clk",
>> +      emaca_free_mux, ARRAY_SIZE(emaca_free_mux), 0x128 },
>> +    { AGILEX72_EMAC_B_FREE_CLK, "emacb_free_clk",
>> +      emacb_free_mux, ARRAY_SIZE(emacb_free_mux), 0x12c },
>> +    { AGILEX72_EMAC_PTP_FREE_CLK, "emac_ptp_free_clk",
>> +      emac_ptp_free_mux, ARRAY_SIZE(emac_ptp_free_mux), 0x130 },
>> +    { AGILEX72_GPIO_DB_FREE_CLK, "gpio_db_free_clk",
>> +      gpio_db_free_mux, ARRAY_SIZE(gpio_db_free_mux), 0x134 },
>> +    { AGILEX72_USB31_FREE_CLK, "usb31_free_clk",
>> +      usb31_free_mux, ARRAY_SIZE(usb31_free_mux), 0x140 },
>> +    { AGILEX72_S2F_USER0_FREE_CLK, "s2f_user0_free_clk",
>> +      s2f_user0_free_mux, ARRAY_SIZE(s2f_user0_free_mux), 0x138 },
>> +    { AGILEX72_S2F_USER1_FREE_CLK, "s2f_user1_free_clk",
>> +      s2f_user1_free_mux, ARRAY_SIZE(s2f_user1_free_mux), 0x13c },
>> +    { AGILEX72_XSPI_PHY_FREE_CLK, "xspi_phy_free_clk",
>> +      xspi_phy_clk_mux, ARRAY_SIZE(xspi_phy_clk_mux), 0x154 },
>> +    { AGILEX72_MEMDEVICE_PHY_FREE_CLK, "memdevice_phy_free_clk",
>> +      memdevice_phy_clk_mux, ARRAY_SIZE(memdevice_phy_clk_mux), 0x148 },
>> +};
>> +
>> +static const char * const hsp_mp_clk_parent[] = { "hsp_mp_clk" };
>> +static const char * const lsp_main_parent[] = { "lsp_main_clk" };
>> +static const char * const lsp_mp_parent[] = { "lsp_mp_clk" };
>> +static const char * const lsp_sp_parent[] = { "lsp_sp_clk" };
>> +static const char * const usb31_bus_clk_early_parents[] = 
>> { "hsp_main_clk" };
>> +static const char * const emaca_div_parents[] = { "emaca_free_clk" };
>> +static const char * const emacb_div_parents[] = { "emacb_free_clk" };
>> +
>> +/* SW Clock gate enabled clocks */
>> +static const struct agilex72_gate_clock gate_clks[] = {
>> +    { AGILEX72_COMP0_CLK, "comp0_clk", comp0_mux,
> 
> CORE0?
> 
comp0 is the hardware name, not a misspelling of core0. It's for mixed 
CPU complex.
>> +      ARRAY_SIZE(comp0_mux), 0x30, 8, 0, 0, 0, 0x3c, 5, 0 },
>> +    { AGILEX72_CORE2_CLK, "core2_clk", core2_mux,
>> +      ARRAY_SIZE(core2_mux), 0x30, 10, 0, 0, 0, 0x3c, 10, 0 },
>> +    { AGILEX72_CORE3_CLK, "core3_clk", core3_mux,
>> +      ARRAY_SIZE(core3_mux), 0x30, 11, 0, 0, 0, 0x3c, 11, 0 },
>> +    { AGILEX72_MPU_CLK, "mpu_clk", mpu_mux,
>> +      ARRAY_SIZE(mpu_mux), 0x30, 7, 0, 0, 0, 0x3c, 4, 0 },
>> +    { AGILEX72_CCU_CLK, "ccu_clk", ccu_mux,
>> +      ARRAY_SIZE(ccu_mux), 0x30, 6, 0, 0, 0, 0x3c, 3, 0 },
>> +    { AGILEX72_APU_SYS_FREE_CLK, "apu_sys_free_clk", ccu_mux,
>> +      ARRAY_SIZE(ccu_mux), 0, 0, 0x50, 22, 2, 0x3c, 3, 0 },
>> +    { AGILEX72_HSP_SYS_FREE_CLK, "hsp_sys_free_clk", hsp_noc_mux,
>> +      ARRAY_SIZE(hsp_noc_mux), 0, 0, 0x10c, 8, 2, 0xf0, 9, 0 },
>> +    { AGILEX72_HSP_MAIN_FREE_CLK, "hsp_main_free_clk", hsp_noc_mux,
>> +      ARRAY_SIZE(hsp_noc_mux), 0, 0, 0, 0, 0, 0xf0, 9, 0 },
>> +    { AGILEX72_HSP_MAIN_CLK, "hsp_main_clk", hsp_noc_mux,
>> +      ARRAY_SIZE(hsp_noc_mux), 0xe0, 1, 0, 0, 0, 0xf0, 9, 0 },
>> +    { AGILEX72_HSP_MP_CLK, "hsp_mp_clk", hsp_noc_mux,
>> +      ARRAY_SIZE(hsp_noc_mux), 0xe0, 2, 0x10c, 10, 2, 0xf0, 9, 0 },
>> +    { AGILEX72_HSP_SP_CLK, "hsp_sp_clk", hsp_noc_mux,
>> +      ARRAY_SIZE(hsp_noc_mux), 0xe0, 3, 0x10c, 12, 2, 0xf0, 9, 0 },
> Are any of these clock critical? Meaning, they cannot get gated off?
> 
>
I’ll re-check the clock definition and update accordingly in v2.

>> +    { AGILEX72_USB2OTG_HCLK, "usb2otg_hclk", hsp_mp_clk_parent,
>> +      1, 0xe0, 0, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_LSP_SYS_FREE_CLK, "lsp_sys_free_clk", lsp_noc_mux,
>> +      ARRAY_SIZE(lsp_noc_mux), 0, 0, 0x10c, 2, 2, 0xf0, 9, 0 },
>> +    { AGILEX72_LSP_MAIN_FREE_CLK, "lsp_main_free_clk", lsp_noc_mux,
>> +      ARRAY_SIZE(lsp_noc_mux), 0xe0, 0, 0, 0, 0, 0xf0, 9, 0 },
> 
> Does this clock really share the same gate as the usb2otg_hclk?
You're right. usb2otg_hclk and lsp_main_free_clk do not share a gate. 
Will fix this in v2.

>> +    { AGILEX72_LSP_MAIN_CLK, "lsp_main_clk", lsp_noc_mux,
>> +      ARRAY_SIZE(lsp_noc_mux), 0xe0, 1, 0, 0, 0, 0xf0, 9, 0 },
> 
> Are you sure this clock share the same enable bit as the hsp_main_clk?
> 
Yes, hsp_main_clk and lsp_main_clk both use the enable at offset 0xe0 bit 1.

>> +    { AGILEX72_LSP_MP_CLK, "lsp_mp_clk", lsp_noc_mux,
>> +      ARRAY_SIZE(lsp_noc_mux), 0xe0, 2, 0x10c, 4, 2, 0xf0, 9, 0 },
> 
> Also here, the hsp_mp_clk has the same enable bit?
> 
Yes, hsp_mp_clk and lsp_mp_clk both use the enable at offset 0xe0 bit 2.

>> +    { AGILEX72_LSP_SP_CLK, "lsp_sp_clk", lsp_noc_mux,
>> +      ARRAY_SIZE(lsp_noc_mux), 0xe0, 3, 0x10c, 6, 2, 0xf0, 9, 0 },
>> +    { AGILEX72_SPIM_0_CLK, "spim_0_clk", lsp_main_parent,
>> +      1, 0xd0, 11, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_SPIM_1_CLK, "spim_1_clk", lsp_main_parent,
>> +      1, 0xd0, 12, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_SPIS_0_CLK, "spis_0_clk", lsp_main_parent,
>> +      1, 0xd0, 13, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_SPIS_1_CLK, "spis_1_clk", lsp_main_parent,
>> +      1, 0xd0, 14, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_DMA_0_CORE_CLK, "dma_0_core_clk", lsp_main_parent,
>> +      1, 0xd0, 15, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_DMA_0_HS_CLK, "dma_0_hs_clk", lsp_mp_parent,
>> +      1, 0xd0, 15, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_DMA_1_CORE_CLK, "dma_1_core_clk", lsp_main_parent,
>> +      1, 0xd0, 16, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_DMA_1_HS_CLK, "dma_1_hs_clk", lsp_mp_parent,
>> +      1, 0xd0, 16, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_I3C_0_CORE_CLK, "i3c_0_core_clk", lsp_mp_parent,
>> +      1, 0xd0, 22, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_I3C_1_CORE_CLK, "i3c_1_core_clk", lsp_mp_parent,
>> +      1, 0xd0, 23, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_I2C_0_PCLK, "i2c_0_pclk", lsp_sp_parent,
>> +      1, 0xd0, 17, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_I2C_1_PCLK, "i2c_1_pclk", lsp_sp_parent,
>> +      1, 0xd0, 18, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_I2C_EMAC0_PCLK, "i2c_emac0_pclk", lsp_sp_parent,
>> +      1, 0xd0, 19, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_I2C_EMAC1_PCLK, "i2c_emac1_pclk", lsp_sp_parent,
>> +      1, 0xd0, 20, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_I2C_EMAC2_PCLK, "i2c_emac2_pclk", lsp_sp_parent,
>> +      1, 0xd0, 21, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_UART_0_PCLK, "uart_0_pclk", lsp_sp_parent,
>> +      1, 0xd0, 23, 0, 0, 0, 0, 0, 0 },
> 
> Are you sure this clock share the same enable bit as the i3c_1_core_clk?
> 
You're right. They do not share the same enable bit. Will fix this in 
v2. uart_0_pclk should be bit 24, with uart_1_pclk and uart_2_pclk at 
bits 25 and 26.

>> +    { AGILEX72_UART_1_PCLK, "uart_1_pclk", lsp_sp_parent,
>> +      1, 0xd0, 24, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_UART_2_PCLK, "uart_2_pclk", lsp_sp_parent,
>> +      1, 0xd0, 25, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_SPTIMER_0_PCLK, "sptimer_0_pclk", lsp_sp_parent,
>> +      1, 0xd0, 29, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_SPTIMER_1_PCLK, "sptimer_1_pclk", lsp_sp_parent,
>> +      1, 0xd0, 30, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_CS_AT_CLK, "cs_at_clk", cs_at_mux,
>> +      ARRAY_SIZE(cs_at_mux), 0xe0, 4, 0x10c, 24, 2, 0xf0, 9, 0 },
>> +    { AGILEX72_CS_PDBG_CLK, "cs_pdbg_clk", cs_pdbg_mux,
>> +      ARRAY_SIZE(cs_pdbg_mux), 0xe0, 4, 0x10c, 28, 2, 0xf0, 9, 0 },
>> +    { AGILEX72_CS_TRACE_CLK, "cs_trace_clk", cs_trace_mux,
>> +      ARRAY_SIZE(cs_trace_mux), 0xe0, 4, 0x10c, 26, 2, 0xf0, 10, 0 },
>> +    { AGILEX72_EMACA_DIV_CLK, "emaca_div_clk", emaca_div_parents,
>> +      1, 0, 0, 0x118, 8, 2, 0, 0, 0 },
>> +    { AGILEX72_EMACB_DIV_CLK, "emacb_div_clk", emacb_div_parents,
>> +      1, 0, 0, 0x118, 10, 2, 0, 0, 0 },
>> +    { AGILEX72_EMAC0_CLK, "emac0_clk", emac_mux,
>> +      ARRAY_SIZE(emac_mux), 0xd0, 0, 0, 0, 0, 0x100, 26, 0 },
>> +    { AGILEX72_EMAC1_CLK, "emac1_clk", emac_mux,
>> +      ARRAY_SIZE(emac_mux), 0xd0, 1, 0, 0, 0, 0x100, 27, 0 },
>> +    { AGILEX72_EMAC2_CLK, "emac2_clk", emac_mux,
>> +      ARRAY_SIZE(emac_mux), 0xd0, 2, 0, 0, 0, 0x100, 28, 0 },
>> +    { AGILEX72_EMAC_PTP_CLK, "emac_ptp_clk", emac_ptp_mux,
>> +      ARRAY_SIZE(emac_ptp_mux), 0xd0, 3, 0, 0, 0, 0xf0, 2, 0 },
>> +    { AGILEX72_GPIO_DB_CLK, "gpio_db_clk", gpio_db_mux,
>> +      ARRAY_SIZE(gpio_db_mux), 0xd0, 4, 0x114, 0, 16, 0xf0, 3, 1 },
>> +    { AGILEX72_USB31_SUSPEND_CLK, "usb31_suspend_clk", usb31_mux,
>> +      ARRAY_SIZE(usb31_mux), 0xe0, 7, 0x118, 12, 6, 0xf0, 7, 1 },
>> +    { AGILEX72_USB31_BUS_CLK_EARLY, "usb31_bus_clk_early",
>> +      usb31_bus_clk_early_parents, 1, 0xe0, 7, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_S2F_USER0_CLK, "s2f_user0_clk", s2f_user0_mux,
>> +      ARRAY_SIZE(s2f_user0_mux), 0xd0, 27, 0, 0, 0, 0xf0, 4, 0 },
>> +    { AGILEX72_S2F_USER1_CLK, "s2f_user1_clk", s2f_user1_mux,
>> +      ARRAY_SIZE(s2f_user1_mux), 0xd0, 28, 0, 0, 0, 0xf0, 5, 0 },
>> +    { AGILEX72_XSPI_PCLK, "xspi_pclk", lsp_mp_parent,
>> +      1, 0xd0, 9, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_XSPI_CLK, "xspi_clk", xspi_mux,
>> +      ARRAY_SIZE(xspi_mux), 0xd0, 9, 0x110, 8, 2, 0xf0, 14, 0 },
>> +    { AGILEX72_XSPI_PHY_CLK, "xspi_phy_clk", xspi_mux,
>> +      ARRAY_SIZE(xspi_mux), 0xd0, 9, 0x110, 8, 2, 0xf0, 14, 0 },
>> +    { AGILEX72_SDMMC0_SDPHY_REG_CLK, "sdmmc0_sdphy_reg_clk",
>> +      lsp_mp_parent, 1, 0xd0, 5, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_SDMMC1_SDPHY_REG_CLK, "sdmmc1_sdphy_reg_clk",
>> +      lsp_mp_parent, 1, 0xd0, 7, 0, 0, 0, 0, 0, 0 },
>> +    { AGILEX72_SDMMC0_SDMCLK, "sdmmc0_sdmclk", memdevice_phy_mux,
>> +      ARRAY_SIZE(memdevice_phy_mux), 0xd0, 5, 0x110, 4, 2, 0xf0, 15, 
>> 0 },
>> +    { AGILEX72_SDMMC1_SDMCLK, "sdmmc1_sdmclk", memdevice_phy_mux,
>> +      ARRAY_SIZE(memdevice_phy_mux), 0xd0, 7, 0x110, 6, 2, 0xf0, 15, 
>> 0 },
>> +    { AGILEX72_SDMMC0_PHY_CLK, "sdmmc0_phy_clk", memdevice_phy_mux,
>> +      ARRAY_SIZE(memdevice_phy_mux), 0xd0, 5, 0x110, 4, 2, 0xf0, 15, 
>> 0 },
>> +    { AGILEX72_SDMMC1_PHY_CLK, "sdmmc1_phy_clk", memdevice_phy_mux,
>> +      ARRAY_SIZE(memdevice_phy_mux), 0xd0, 7, 0x110, 6, 2, 0xf0, 15, 
>> 0 },
>> +};
>> +
> 
> <snip>
> 
>> diff --git a/drivers/clk/socfpga/clk-agilex72.h b/drivers/clk/socfpga/ 
>> clk-agilex72.h
>> new file mode 100644
>> index 000000000000..e120fe97fd65
>> --- /dev/null
>> +++ b/drivers/clk/socfpga/clk-agilex72.h
>> @@ -0,0 +1,91 @@
>> +/* SPDX-License-Identifier:    GPL-2.0 */
>> +/*
>> + * Copyright (C) 2026, Altera Corporation
>> + */
>> +
>> +#ifndef    __AGILEX72_CLK_H
>> +#define    __AGILEX72_CLK_H
>> +
>> +#include <linux/clk-provider.h>
>> +
>> +struct agilex72_clock_data {
>> +    /*
>> +     * MMIO bases ioremapped from DT resources with "reg-names" property
>> +     * in probe:
>> +     *   [0] - "clkmgr"  : main clock manager register block
>> +     *   [1] - "gppll0"  : GP PLL 0 register block
>> +     *   [2] - "gppll1"  : GP PLL 1 register block
>> +     *   [3] - "gppll2"  : GP PLL 2 register block
>> +     */
>> +    void __iomem *base[4];
>> +
>> +    /* Must be last */
>> +    struct clk_hw_onecell_data    clk_data;
>> +};
>> +
>> +struct agilex72_pll {
>> +    struct clk_gate     hw;
>> +    void __iomem       *pll_base;
>> +};
>> +
>> +struct agilex72_periph_clk {
>> +    struct clk_gate  hw;
>> +    void __iomem    *div_reg;
>> +    u8               div_lo_shift;
>> +    u8               div_hi_shift;
>> +};
>> +
>> +struct agilex72_gate_clk {
>> +    struct clk_gate hw;
>> +    bool div_linear;
>> +    void __iomem *div_reg;
>> +    void __iomem *bypass_reg;
>> +    u8  div_width;    /* only valid if div_reg != 0 */
>> +    u8  div_shift;    /* only valid if div_reg != 0 */
>> +    u8  bypass_shift;      /* only valid if bypass_reg != 0 */
>> +};
>> +
>> +struct agilex72_pll_clock {
>> +    unsigned int    id;
>> +    const char    *name;
>> +    const char    * const *parent_names;
>> +    u8    num_parents;
>> +    unsigned long   offset;
>> +};
>> +
>> +struct agilex72_perip_c_clock {
>> +    unsigned int        id;
>> +    const char        *name;
>> +    const char        *parent_name;
>> +    u8            num_parents;
>> +    unsigned long        div_offset;
>> +    u8            div_lo_shift;
>> +    u8            div_hi_shift;
>> +    u8            div_lo_width;
>> +    u8            div_hi_width;
> 
> I don't see div_lo_width and div_hi_width get used at all?
> 
Yes, those fields are unused. Will drop div_lo_width and div_hi_width in v2.
>> +};
>> +
>> +struct agilex72_perip_cnt_clock {
>> +    unsigned int        id;
>> +    const char        *name;
>> +    const char    * const *parent_names;
>> +    u8            num_parents;
>> +    unsigned long        offset;
>> +};
>> +
>> +struct agilex72_gate_clock {
>> +    unsigned int        id;
>> +    const char        *name;
>> +    const char    * const *parent_names;
>> +    u8            num_parents;
>> +    unsigned long        gate_reg;
>> +    u8            gate_idx;
>> +    unsigned long        div_reg;
>> +    u8            div_offset;
>> +    u8            div_width;
>> +    unsigned long        bypass_reg;
>> +    u8            bypass_shift;
>> +    bool            div_linear;
>> +};
>> +
>> +#endif    /* __AGILEX72_CLK_H */
> 
> If clk-agilex72.c is the only consumer of this .h file, then just move 
> the declarations to the top of the C file. Or take a look at
> 2050b57ecda0 ("clk: socfpga: agilex5: add clock driver for Agilex5") as 
> an example.
> 
Will address this in v2.

> Dinh

Regards,
Evon

