Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012024.outbound.protection.outlook.com [40.107.209.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19B3435A9C;
	Tue, 21 Jul 2026 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621356; cv=fail; b=d3v6+HIzsoHq5u/G0Uk/aoB2uOsemPLTLIcvIBl8Gbfx5NweW5i2c5vrT3g7OPjfK+MEMEZmmkzVzTvz7Zn8/FKVLOf4NRuvfAwHFk3d0eAGRNm69AnS19UOtSwBmK77Wk93Z9/9zPtv+uYnJ4emf4vlRZyGzfzIFSW0T5G6e/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621356; c=relaxed/simple;
	bh=SdWMuOQnX0VDiJrViSDB1KiqYyUvI7a632gRB3pX2Sg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hD0jmJff9qNjo9fU6wJrD0iJMmBStSTOGZZxepY9tuv1kZaH292OJP9XZoo79JovrMq9q/8sBbSpPFm6q6vSlR8ucPUsnhDx8tY0TmaZQYPXZ/UJZxS2VJ68sEwJiNrOT1BvGKhCHwzCAPENjwvVbZ+nJlyjvRpiWFQ5s6BEeNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DSrkYyjd; arc=fail smtp.client-ip=40.107.209.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DSrkYyjd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TChs53afO+tAU3idRM8JgGjx52yY5YA1j1Zs8EDruvB2xSneF5tgy9dpeD+h0LNaij2j27QEeYtSRGq+P7eYRFbzPxYD5utmO6MeFsYl2Fmyf4C4ZHxy27rxuCj6a8ITfgM3J4k3t0uoc1hsO98s/LN+8kVvVXFDyQDtUvcs0/H0rWcZrxMJQW4iNoaO77OCeHzx3WD5v5+rdHfGXvq02eoqSuinppvrnD97GAuYqSZaSFgXCxs+kFKx34asHFx8NgD36rysqWl+ST9kwnq+lTvPOMBIfEm6HknhLOZULPUwuyxP7coMmxIur7omtXsQUvy3MRfsEm6F884TL9egxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gMaSPX+IpVnUECG830qQ7jNJnRFjZxLG+zNEx4oQLc=;
 b=BEIVdM/QagjwaqNbuOgWhWLJTSDkb7VXj+zJcMyysjxr/gENmGeTSoqGoft0R3XNdUxgpH0T3StMVaSO4fmh2GMobwgzQG0pinLtyBBANQor3UH5ntnITPcYbFqill4YpcG5isw+w6JXHpMINH+8Fc4ZoWmcXzGh9OeyHEEQinWVRCG4uAvxOOXgq7T6DU7CGjBro1WIoNUHKr9/eNQ7OyC0/2m+FAVhErWSYzz9E24wzICULf9a0ogqYna9wTKRLpQYW8rBpErvyLmHgrzL406oXf3bw7tavIMkEMNTAI9jJDdWzWLHsOKQgLEfnsiscSAwEnc9jGCAwiQiCtTI1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gMaSPX+IpVnUECG830qQ7jNJnRFjZxLG+zNEx4oQLc=;
 b=DSrkYyjdcMaTLHxCql3RSrANkD9MyUQW3NZ6piTOpcQMtmACBpxyinEz7+aZjR/M5fmZWlVz91rUCik1hS8pnizTjygvaWAYJB7eIMpOMfijqIo252k6b4YUbcndkI+qiP0N91knq5zRUk/uoMp1xCkOdzmGuaGtctJ6aJLqzo4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by PH7PR12MB7870.namprd12.prod.outlook.com (2603:10b6:510:27b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 08:09:08 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 08:09:08 +0000
Message-ID: <8def1ecf-b7a9-4455-94f2-e98bd4aac7a5@amd.com>
Date: Tue, 21 Jul 2026 10:09:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] clock: versal-clk: Fix Versal NET clock binding
 and switch to CCF
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com
Cc: Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Stephen Boyd <sboyd@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, kishore Manne <nava.kishore.manne@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
References: <cover.1783516336.git.michal.simek@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <cover.1783516336.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:ef::34) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|PH7PR12MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 4833730e-21fa-4e01-5168-08dee6ff5725
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	J5e8Dmf3lg+bHB3WLgCIH6Z3SIsPidtyrdiGUTDC/Uv7eXpP9pZu+gr0PxsWC0DhwrVShnClO3g6gqpvJtGKtMsImVE+tQpiqr2asOxhlRmVA1JpMRmqj9j209AJMTYUPKnauY61+NU41vONDtV2opco4AsLwseVmg/fTxj4SqBOZa4L0J4W45aN4qpn+GF+qiYdKjN/OFsurxWAyNhBh+wEvp5oRVw1R9G1zfJTD4COCPlvtuP9unUFEsxvLAvmSadMDzou6HF9qkmzF686kqDI2QXVv+SG5d9vK8YdFxQAlyCNCkyXYJXHOXGk45N18PkzAS0ezCUvI4o4qFG7tKktLyxZ7Yy6ycT/PGMXZGUiP4385EXflktX4aUV8ppZp98JMBTBvwWMrxD82TIKAk5ILLC4EbbFlGn3q4tSust76vZlNgga4gdA+Znx0AFd0EoEYF8JdE1/cHkMZ+pcysGZ/EAQn+vniI7bCKSiS2/08QOacDAbZukL/RKlbrhaOikF5S1zyl0hzcs29T1tqRSCewQchm4N38h3+cPo3wXBZuwnMvRTk3IzB7oWlTzsTk/FzpXOBKrDjgePYtNbsxPIE93Bj8KBMSkX8i6pXEJ7y1RNSrg4P/Gl5XUE44mzbcpybGsiiGJQNd/TsitJ9suxC73mKjJxvMQobo57SR4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmRGbUNkbG8rdEd2YVJObEMzZE5RNG5hNXBYU0dCUkJxRnM2UFA1V0IzODdn?=
 =?utf-8?B?dzFBd21hUVRXYlF5VnR5SDhnZ1YyR2s5ck5NZzB6NHRhVWRJeWpQWVVXQ0dZ?=
 =?utf-8?B?RjcvL1BOMUgwUmJ0RDh6dUxKRXZaQklqM0U3Vm9KcTBQOUQ0SEY4QmR6UndH?=
 =?utf-8?B?SkVNL1V1eTBxb3FxMUpJYkloVmxWaFFhOFhiSXoyOGtyRnpxd2xGb2VZWkNX?=
 =?utf-8?B?RHlvMVFrUFF0aDVsYlBEL0R1SHozeEZLWjNzUlBLQkpQT05MZFJUQUJxcG9r?=
 =?utf-8?B?NWR2a3FYdmI2L1ZjSC95OWhnOTAyeTlqNXVwbkZackZ0Sk9JYUZvYUs2NWVu?=
 =?utf-8?B?TkNQUVNLUUtOd0tUYjdoR2xIVUtUSU5HQmt1NFNYTW1LYnB1cGhUUzkwYW1Q?=
 =?utf-8?B?VERQNktwSWwxNlZQZHpDSStwbm4yQStkZGQxYk80OGVvMUc0dmFGSkVxNXFp?=
 =?utf-8?B?WmhDbFhkbXovMk56cTVNYzhqWk5PS0JoZmxlMHI1ZU96aVNmYVpvNnZhY01l?=
 =?utf-8?B?ajJuemQ2dWt4a1ZRM2pjcGV4bXM2dFNCVTVuZGZ5eXJwRkxRb1g4RGRQK1I5?=
 =?utf-8?B?bnBvTEt5MStTZ05ZTzhzOFVIR3FZWG5PZ0t3elJvZ3kvZS9Rb3M3MkRLakFl?=
 =?utf-8?B?QklLdFZPOFI2bGx1NWFhZlNnUkNhTmRUZ0pYUHBCQ1RzWDljQVY1THp5eDFQ?=
 =?utf-8?B?Vk0xTXRxVkVRN1o1RXpCeVZoWFg0RU1aSEFneFZ0NkE5eEt1YmVrSDRJd2ZO?=
 =?utf-8?B?WE5RUDBBVWJSUUo0Z01GazJJbTE0Nmh0TUNxZEluTUtoTDlmaC9EcDFBVUZn?=
 =?utf-8?B?eCtQcTNNSUtnNW40OXRlV3VIeXhOdFFDLzZ6R1g0NFN5YndrVUdLODIzN2lM?=
 =?utf-8?B?ZWN1aXZiOU5YcnVZbzlUejE3T0xFTzFxSnRPMEhyNXZZd0Q5YzlOU2dLaGFh?=
 =?utf-8?B?S2VuWkg0VG1HaUt2WFlXbnE4S2ZPempJb0pmTlJqSURZbXo1RHVmb1FtOE55?=
 =?utf-8?B?aGUyb0R1d0dSNTkvOGx6Q3doblJ2aDRaOWZyV1kzc0dhNVlHUllEZkFyREJB?=
 =?utf-8?B?bSt4eDJDWE9oc08wVHNrOHlJN3lXVU51di9PbGt2UkU0ZmdtTHNrTm9PQ0NC?=
 =?utf-8?B?WWM5WnNlU0x3SXVaN21xNXI5d2lHYlRjUVB1azFTQUQ0SUgzRUc1eVY4VUZj?=
 =?utf-8?B?MzV3L3NtaG5MbFVNc1lRWUZONUtVMndReXd6MUJ6TFhIMDdWbXJMZUd1K3Fj?=
 =?utf-8?B?cFVKVzFvSytiMnl2TWR0MWVBUFlETnFJU2tITGpjOW9RUmNpekp0djBtWkNr?=
 =?utf-8?B?YzVGdDNiNVlrM3pUMnJJSGlJcWZJcVQ0aWNqTlo4cE5teDZEbGxxbjRGSlpU?=
 =?utf-8?B?bm40ZWZFMnZJQjZFVzVlZjkxWFpMSFh2S24wUnU2Zlp4dFBKZ2N3b1pIb09h?=
 =?utf-8?B?VENhbTltN1JuSXBWbGNmNE5QeE1mNjBjRjdIZGYxUHYvY2FibE02akNsc3V3?=
 =?utf-8?B?K3B3bTNBVHd0ZXZTWFlYMkRYc3k1SVlUR1VXTWUwQ3RJem8wT2RSRmQyQXNC?=
 =?utf-8?B?ektCNDBjUTU2MWU4YlRPUlZ3UDBuak9wT3hEMlgvMlM2YkY5Wjh3NGdDNi8r?=
 =?utf-8?B?U1FoTVVvR3JFelFidHRqUnNqNXlaeEFlNEVmNGtSWUZET1hkNVNicjExQXIy?=
 =?utf-8?B?R0xkK0RHdk1GZ0ZCNjVjbjgva2pyR1h0YXpZQ1B4bFR0ajZ4RTJ5ais4T0V2?=
 =?utf-8?B?Q29qODNreTBSWE9ZOEVsRlVDZHhtdFN3ejdJeTV2a3ZYMjFyWmhVK1REekhU?=
 =?utf-8?B?RC96b0JEdEpRT1NGTWpYc2w0emtaL2tBem00eFE0UDBVL0ZXNFQ1S0svSktS?=
 =?utf-8?B?U2ZoRi8xS2RmNkFtY1p6Y09mV3hKeVJiWGtmNm0vVXNXMVVXelVZbHoyWXBG?=
 =?utf-8?B?anM3S0tBWjErZk43dDJRdlFjclBLRWNrL0ExVDdibEhUKzcvaVpYK0NJc3pl?=
 =?utf-8?B?MzIwNU84dDZKcEQxNUFNOGlzSmhiQytQTXFuUnRkcDF4Nnk5OUZHY3lsaElt?=
 =?utf-8?B?N2RyRXhiV3U2cGg2L01qdWlYSGt0WEFWM2d6N1pCZ2Rlcmd4NjduWmg2b2Fm?=
 =?utf-8?B?Qkt2eElFbmdyZmQzSmJESWdaRi8rOVV2RWZ4ZE9Ba1J4UUF6cmhMZjI4VFVw?=
 =?utf-8?B?TkhXNzQ2Y1IzVHpaZDNsTkNIUDJpLzlPbWpCTkFpdkRISmVaY1dYaUQwV3VF?=
 =?utf-8?B?K2REKzB1cDExaVNLR0Q5ZlRnTjN0bGNOMVlrNEdlUjdIR3RnZXdyeUlMSDE5?=
 =?utf-8?B?RU1qd2VuS2hPVVpGbE9Cam44S2RZdkN3Z1NjT1JaVTg4V1VRc2hTQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4833730e-21fa-4e01-5168-08dee6ff5725
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 08:09:08.7259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ci8N6IEPigOVTP/FXg/AJjfDaSs/GlnTEMxGmqcJ1vICrKoMIr52vSUO1BZbjGXL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7870



On 7/8/26 15:12, Michal Simek wrote:
> This series fixes the Versal NET clock controller DT binding validation
> and switches the platform to use the firmware-based CCF clock interface.
> 
> One patch extracts zynqmp to own DT binding file.
> 
> Another restructures the if/then conditions in the versal-clk binding
> schema so that xlnx,versal-net-clk is matched first before falling back
> to xlnx,versal-clk. This fixes false "too long" validation errors caused
> by both conditions matching simultaneously when the fallback compatible
> is present. A dedicated example for the Versal NET 3-clock configuration
> is added and all examples are split into separate blocks for independent
> validation.
> 
> The last patch switches Versal NET from static fixed-clock definitions to
> the firmware-based clock interface, enabling proper clock management
> through platform firmware. DT macro headers for clocks, power domains
> and resets are added.
> 
> Thanks,
> Michal
> 
> Changes in v5:
> - update commit message s/zynqmp-clk/versal-clk/
> - Also update firmware node to match xlnx,versal-firmware enforced by
>    schema (change taken from next patch)
> - Update commit message
> - Move change done in v4 to previous patch where issue started.
> 
> Changes in v4:
> - simplify expression to [0-6][0-9] from 0[0-9||[1-6][0-9]
> - Update regex from previous patch
> - Also update firmware node to match xlnx,versal-firmware enforced by
>    schema
> 
> Changes in v3:
> - new patch in series
> - New patch in series
> - Cover change in zynqmp-firmware.yaml
> - Move clock-cells to be the last in the example
> - Remove comment around (Optional clock) which is obvious from schema
>    itself
> - Move clock-cells to be the last property in the example
> - use 2 spaces for indentation in example to follow the same style which is
>    already used
> - Add fixed tag
> - Remove interrupt from zynqmp-power - Versal NET is using event framework
>    instead. No interrupt is required.
> - Remove unused GEM{0,1}_REF_{R,T}X macros
> - Update commit message
> - s/zynqmp/versal-net/ in subject
> - Update copyrights
> - Make all macro values lower case
> - Fix guarding macro names
> 
> Changes in v2:
> - New patch in series
> - Split zynqmp-clk from versal-clk
> - Update logic without ZynqMP part in this file and have if/else only
>    around min/maxItems
> - use clock-<HZ> node name for fixed clocks
> - Reuse existing versal-net-clk.dtsi file
> 
> Michal Simek (5):
>    dt-bindings: firmware: xilinx: Add missing example for ZynqMP
>    dt-bindings: clock: versal-clk: Fix mio_clk index range in clock-names
>      pattern
>    dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema
>    dt-bindings: clock: versal-clk: Fix Versal NET clock validation
>    arm64: versal-net: Switch Versal NET to firmware clock interface
> 
>   .../bindings/clock/xlnx,versal-clk.yaml       |  93 ++---
>   .../bindings/clock/xlnx,zynqmp-clk.yaml       |  68 ++++
>   .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  15 +-
>   .../arm64/boot/dts/xilinx/versal-net-clk.dtsi | 345 +++++++++++++-----
>   arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h  | 123 +++++++
>   .../boot/dts/xilinx/xlnx-versal-net-clk.h     |  74 ++++
>   .../boot/dts/xilinx/xlnx-versal-net-power.h   |  38 ++
>   .../boot/dts/xilinx/xlnx-versal-net-resets.h  |  53 +++
>   .../arm64/boot/dts/xilinx/xlnx-versal-power.h |  55 +++
>   .../boot/dts/xilinx/xlnx-versal-resets.h      | 106 ++++++
>   10 files changed, 797 insertions(+), 173 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
>   create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
>   create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
>   create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
>   create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
>   create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
>   create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> branch: xnext/versal-net
> 

Applied.
M
