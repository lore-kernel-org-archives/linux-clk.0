Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023109.outbound.protection.outlook.com [40.107.44.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FD7355F41;
	Mon, 16 Mar 2026 12:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773664419; cv=fail; b=h2OoYtSoWxtR8BxrfHYY+56mkmX7kJRxzXRUNwh1KbT83O7qiXoBjEz1nypjeEHc3yyYLH2iP6AWpTHeSa4ro94nGAPFezwDgwT30azfXfB2PNEDbc9C2mDcXXcja6DswBEdqZwGZFNorITVsMxupSEftbAyT/2iONPoFXRoKl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773664419; c=relaxed/simple;
	bh=7ntmtRsTfln3FaZswxQEqrT7jlvZ0JblM9dMjFlnt/Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OfqOO79G1BkTXJOrUEmTb6v3iIdbwPieCI5r2eldEOb2dxs8qiRlQ6ZXUU+R8I1ydw3Xsj/fD4cISqqaCt4n+rUY5bxbZhKFo2M2n6KVyCa3HmLyZcCh99zoAS6hXvwK76Dcf5PYI0Da1TWOdZ9RB9TD0MC9oOp7LlukoLx+hTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Zl1zEG2l; arc=fail smtp.client-ip=40.107.44.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Zl1zEG2l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D27oTDRl9mY6tJEl2XmSH8D+wl+EAxHwD3YcOl874/w/NwXreLNhOSAn0JYqErFBvcnC/QokenEGqPl9GBfoFNgfUWenh6kfhIVP+d6lBzKatH+CfWWrdr5LaccNKwhF3DqDO0i134qEI+JbowaAKWmGm+T4di399h3kaf/Tk4/JepNHGMR9af4OjSLyDIrj3HFnO9JGKd09MGs+Nl5fZpsYi0IdtHcbaN4zC5YBcs76F7csGUQdEsOTpZ/rnw9RfC9DocsIb3CLQCYiK7zE9O/Ma/ytJ2CIBexF/PgJtKesjjCs6s6FZar7c7XgGWV9CfO1rZOP/qKWWssZVup8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyn8GFWBEXYCK75Ah0uolOD3bHGAvPuYziEU3uyJJds=;
 b=VPlTYjVougjdl73C0H15ZOgEZTJCw7dRIeTgRA/rwarw/AA4YERNtRG6pzcTeFNFXWHjbsL8odNd2oKRrmWJkcJwHi52Liybgk/SD1gGME5E3pVFLb/6iet8RknMJuWP82akvsWQxlooIzd4uNMxDAF2zbDh4WihBM8nP/H6El65BS/hv3qdRA1M/yh41uA/NTTFeqPltwX+YJbenLUnEKhWoH2IA3PZUsPw0Uj9RcUM34hzHOYHixAPv17Uwyzdpue2vfimpZ9WdIRe08PwAmALp1H4J6YBo5NU39rNep+lLgTFiXK2woBc6erygRYThEsj5LwURONnr8vN20hFhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyn8GFWBEXYCK75Ah0uolOD3bHGAvPuYziEU3uyJJds=;
 b=Zl1zEG2lCGLJ5zLDFW56uDrBOivLnuifJrZmyn5mF9eMwQ6uFN4B707nhWCeFtTAG+5gsqjoEj7J32bv9qrwDeX4J8t1xbDKWIzWnoQxMctdhkuwbmx6xuvQxSPcu5Q8In77LmooJT5SNcK+M/oY3of55EbJXMNqU936IWtRF9vfAnOW0JGT66SB35/urWnsSacRS9KpzEj3n/ak+YXdqvOIRJh1GAY6GyRfe7H7Lf5COZZ2FvTzV4L1WIIx5pR3RKPFge3J4LW7CYv6lURL9HtPD0GZIY1t69HepOcDIpRp9SqXYkc5u1Iqr11pSoEoJSXBSge1U2wNV23qqKoFig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TY0PR03MB6908.apcprd03.prod.outlook.com (2603:1096:400:27a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 12:33:34 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 12:33:34 +0000
Message-ID: <0a8a9e15-2f11-4cdc-be21-ef3ddca27a47@amlogic.com>
Date: Mon, 16 Mar 2026 20:33:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Ferass El Hafidi <funderscore@postmarketos.org>
References: <20260313070022.700437-1-jian.hu@amlogic.com>
 <20260313070022.700437-3-jian.hu@amlogic.com>
 <20260314-splendid-thoughtful-ostrich-c211dc@quoll>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260314-splendid-thoughtful-ostrich-c211dc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0098.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::13) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TY0PR03MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 897f41b2-9274-49d0-7ad2-08de83583d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qDCOgrHBaRzszfPllg6qn2bhFdVuc3whhKs7AyUiFlsAFtKRkLBcDGvkf9filBzaRpzsFMXQw8WPT7fAontywT4JQ8WXlfQ13YBeiOwP1EQ7ujk+Pud3J0Z0t3YI9jBZ5puYDwPqbvnKGTDcNhpGc81iYNYsuqkCfJMItbU+fVVYvXLaWgnC5R5y+CIXAsNOFmxlWq5l/pl6+RUzLdY5DwsGARSgJiZmliInsicYii3GktfX3OaDziTmQC+lwQP4hQnexxHhttKuvieKvJ5vqrUfLifu6RuQ497CjMTunTfj+v5UL70/UjuVeQrLGNEnrXboADdkoLyNZsEeF3/Pg59qWl3hH2F5ei5PaiyfFQxRxebKi04gMDbIjRtS34XslzsBurWVK4irlkCJanvDYyGx1KQCHTUlElNWAZUAzCj01oNH+8fpCM5PQg39voWy33b5p15jvBDTZ/POMZYDYUuJdfvCY7lgc7Oxz5LyipV3SstgFSxz8xEjCpuDeCDr0F9DhJxG57mqQr68+ZZPix5HKMQwTnBfwET9CcTMr2+z9Zmf5Us6nl31n+IT05CbabihWYqisidz1O+eMLV7ZhsDJK+68nJGeNOnp0FKal92lGWhBiOPxBTsr5+XfQ7S8VXhKgTlO/6rMIageIZJfjA7eSQvmNSH8nppZ37ljEMqinuSA+iDuuIpO4pq64NI9AsCxU/CDkGqVG2I7oKDLUWCdTlZMDCzo+bAbDNR1O0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUllUEZpQnArWTByZmZiUmh4aDdOZFVIOU0yT2dVTzdnQXlaaXVLY1BCMVlZ?=
 =?utf-8?B?cHhmS0pJODMzY1EvR1J4YVg4S2tvYkd0TXRjRWcva1hFYkV6c2VibmxUbFky?=
 =?utf-8?B?YklUamQ4emtoOXFTQWJWNk9xN3F4cHZYcmRFc3ZhR3JWSHZXZ2R5U3VPbDFi?=
 =?utf-8?B?RDI4UGlzL3ZtR25TZ0JlMXNISTNPZVlaL1dGZnY5WUx2UzNEeVBNc0hlOWI0?=
 =?utf-8?B?M0xoV2tVbDdUQmNObFFXcTE2ZGpLUWlCTzJCMWhYNlBuMzl2QmloOE9ORnU3?=
 =?utf-8?B?NkplK3lKWlE1cWptWEJqYUdyd29vTHkxM1BiVjVDVDNnaHp1Ym1SV2lpaURU?=
 =?utf-8?B?VUptUWZkNEFkemJzL1llV1laWHROMEU3dUlBOGUvUEE5c3lLRTJnQ2xrSkZ6?=
 =?utf-8?B?UE9OZjJVcUNPd3E3Q3NCeGoyMjVuTVZER1dTWUNmWTlERDRkODQxa3QrcEJn?=
 =?utf-8?B?dCtxRThPUnlNZDFSRW5PK1BYWG1tSkR1eXhkMnVCMkpNZEdaOVhLSVp5cXpY?=
 =?utf-8?B?R1hvZ0pYemIrM3VzSFZvaWR0NFlWWTRYUlR5MGJqMFVwWEhrSkR4QklOdGor?=
 =?utf-8?B?MUNkVEJFblN3QlhDQnNMT0xuL1ZFcnFNSnp2MVpqMytYNXF1dEFrbXk2VkVJ?=
 =?utf-8?B?dHJabW9wTGRTd3BoODExNjROUWhYOEVsNFVBQWJHcjBkdU03djhzeDFWczVx?=
 =?utf-8?B?YnlBUzdCelpIMExLNThiUTR4ZmJFeEcxYzdmRWhhK0N5UmJhRnpLYUZrOGRz?=
 =?utf-8?B?eDJvcDZibHVZMUdkaTI3SGVLVzBiWXBlcXJ5TStrYzk0WDJHekVOZk9tbW5h?=
 =?utf-8?B?UkNuT1JYdEllc0lkaHJJUEY5ZlRQRUlLV1BsQTAvc0VEcytQYWhxZVd3Ujl1?=
 =?utf-8?B?K0U1RHlJSUNFdlk0Ri9ibmZsK29hVk5WWmNhRlIwVk1DK3hFcEhadTFVQWpk?=
 =?utf-8?B?dzEvNGNmaGsrTEQ1UEpDWVNxTUp4WE1VK2Z1Vlo2czVDZG1ZRkRlc1VlWDN1?=
 =?utf-8?B?NSszbFJuZnRGa2lYWDArN0lnYmNLZ3E1QjVrRjNwbENQbjJCTUNmcURuZDVR?=
 =?utf-8?B?R1BMeDIrdmlPclgrRUVLTlM2R3JQTngzeHlVVHVNdHZXWFZWYmVSWW5GVDAv?=
 =?utf-8?B?MDI1S3J4NEJFMTZBOXJDRkgrRHdBWUJvT2JvVkRQUnUyMUpWMTVidk1FL0Z2?=
 =?utf-8?B?b3Q5ZjJGdEJhYWQ1V2tpM2xhZTdwNmNqcStuak84b1lRTi9PNzNHdEZPbGZn?=
 =?utf-8?B?K0REYVRjVlN4azRnUjJrWmdMVFJWZkxHYlVxWGZxaWp4Y1JyYVQvNSthOXdF?=
 =?utf-8?B?NnhOeW1lZzZLTXBPZVRpOUR2bm9NSXNzS094Z3cvNVJoWlZvdFFyZ0VLbmVR?=
 =?utf-8?B?THJtOFlyNzl6M0JUUjQwc2dzTkFRK2FBWVB3MWJJUlpzdXVwbGpBUk93WTJl?=
 =?utf-8?B?eERrb1VFYm1WRmhwRy9YbVNnSWhKU3lhemJxSmN5N1F3Vi9ia3d5bkI3bDZ6?=
 =?utf-8?B?QWNJVUFPUmhPL1Z1MGNUcUFMSjZjSUVEdE55YzlGd0R1T0FwQUR0SzI3S2ND?=
 =?utf-8?B?ZlhnU2FDSUVFbUpUQVFVdzI5b3JDL25ZR0FWK1hWTEhnanNHd00ycWx1bmxO?=
 =?utf-8?B?NzRlaVZwbDY2b2FZWW9DaGtaQ2RPdVFielFtZ3lHQklWQ0ZmaUVONTRib3Fr?=
 =?utf-8?B?NkFrSmI3T0s3czIyTnNRZkMxeElYNzJ3czl3K240cUgzQTZJeTFydHpMclFT?=
 =?utf-8?B?STZtemRDa2RUeUN1SXE4OVJ2azVzQThrbi9za1lzNXV5bXNhM3hrSXF0aWl1?=
 =?utf-8?B?bllmVGIwc2d6d1R2a25iZG1PS2dIS0p1N25oVEJDR0swRDlFbHFGMHRpKzZ0?=
 =?utf-8?B?T0NZdjBoaHR1V0VyU2dpd3dsZ2FCSzR2WjVVTHFQRk9vQmNaZmhTelhOUEN6?=
 =?utf-8?B?R3NOZ3hmc2RPY29WaHJ6clJhdWJqdzg0dGgxVGxmYUc2NDJUb0VkWklSZ1Fv?=
 =?utf-8?B?Q0lEZ3dyK21qQmYyTjRCRkNyU0EzZHorUHEzbkkwR1UyWHdGSHl2R083NEdK?=
 =?utf-8?B?MUU0RVZENG5TOURRTXdNcFhSMmplMXNaZ2F4ZUNYZjJGZVdLNHlvbDZTMFdQ?=
 =?utf-8?B?UTRWa3JFS2kwdjRuWHVTWExjL3IvcFJVZFBPMzQ3ckNTUmJkUHVUQ2M3Smxj?=
 =?utf-8?B?ZHZrbURVZzNCQkg2c25kZlMrSUlsNnVKSGFINmZIVTEzakNwdWZyK2s3VGZm?=
 =?utf-8?B?UmRZRWF0Nnl5b1VGOEtwZlZqSlhWeVplQm4reGl0SWNRUmhscEVTMmdGUC9X?=
 =?utf-8?B?dWJyemVaMGx5aU9tWDhsU0xvUmZzWWxVSzEzd09HL1FiOEtkZk1Wdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 897f41b2-9274-49d0-7ad2-08de83583d3d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 12:33:34.2428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+18gys1B8ayM/qx4h2x6PiQEXYBAxqaZIa/pFIGhG0SvkobtdYXdi4WqejBjIdKYiZ6C3nhx70UnBdWBhvlhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6908


On 3/14/2026 5:57 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On Fri, Mar 13, 2026 at 03:00:21PM +0800, Jian Hu wrote:
>> The mpll3 clock is one parent clock of the sd_emmc and mipi_isp clocks
>> on the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml
>> bindings. Add the mpll3 clock source to the T7 peripherals clock
>> controller input clock list, so that sd_emmc and mipi_isp can use it.
>>
>> For logical consistency, place the required mpll3 entry before the
>> optional entry.
>>
>> This change breaks the ABI, but while the amlogic,t7-peripherals-clkc
>> bindings have been merged upstream, the corresponding DT has not been
>> merged yet. Thus, no real users or systems are affected.
>>
>> Fixes: b4156204e0f5 ("dt-bindings: clock: add Amlogic T7 peripherals clock controller")
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,t7-peripherals-clkc.yaml  | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
> This should go for current fixes cycle and your cover letter is silent
> about it, while patchset combines fixes and non-fixes. You clearly don't
> care about maintainers time for deciphering all this.
>
> Well, not my problem.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Thanks for pointing this out, my sincere apologies for the mistake and 
the extra work I've caused you.


I will add the reason for each patch in next cover letter.


I will strictly follow this rule in all future submissions. Again, my 
apologies for the inconvenience.

>
> Best regards,
> Krzysztof
>
