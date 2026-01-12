Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023102.outbound.protection.outlook.com [52.101.127.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3D73A1B5;
	Mon, 12 Jan 2026 02:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768185443; cv=fail; b=ilv+FvmEjACA39nxpFPHOuM5XRJ5T5HANQQ3YRCS9BHxLL7WixeinYTIvjSlwMbMbqyJ9XonF4WBin/x8rZD7wmNqDNCJ9qLtbPIJB6P4X1UekJ3SUKjJv8xJgW2T6hlq/kfZKQkVw2+z1zXE4CoBOOaOJvk+oF9L5buDqtkhsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768185443; c=relaxed/simple;
	bh=SYeGdi1oaopE4i6y/qFAi5GNaWJSZheWVyPulpKIT/E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Rco0JK4VWzwVf/s5B7db5TQOi+//wdrZh6iUn5q1x51TLy3WdWN8P0zEJv1Jwz1VGKoW1/D3QvlEyWwshXWDHYLk/Nyi7gVTBxm5ygL4DtHa8M2nnYfuJi1oJI5g5k3kDqQx7P41VXWDlviIzw9NUe6C45UDJ03L/bkT/FbujYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=t+H7mbHH; arc=fail smtp.client-ip=52.101.127.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="t+H7mbHH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omS7xCIYHCFx8ydMLTPMSaRcUbDgu7jIsoHxgjlh/mcG0gQRKu0GvamIk3tUFN4IBzE0iVA6SbRTHRBLfQISqRwMyYq05wgObuDAl8VpoiiVI4c4r+w/NM8ccn4lcEZx8tbU4ZorhVzPyCfzYPnv6qFrD4hvGS57QLe/QA/w0rmejcvlI0fOqT5PV6XgYWbhfj1tWn068sIrkGaLUzELXCWNLm91zMuoWnLIl3ZWTrvDT5cVaDrN/xQG7GNcC9PNpkX1BPZTtW3VpFbHlNtm+HrI1EnfxO6tpicPZaseGKqXjlUmEZByWjYrE1dvzpuNqsKkz8ONIqSYz+9MWOB77w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDyrzWWIggVWApG80W6D7QveSK2EO9mV1fgnebJFbGE=;
 b=DxJ97bmGLzUJMNY1bhQXCuplFxe2tGkeHF3aXkjG5k152Z6hFmAWhTmVeZx+ZEjGpaHUQ/PRKDwlrzt+9Fwg9u6DTrUR6B/4112nPl4MGjvwigGJxPNK9MQx8qmzsPPtdlXoCrRZYNWDgk2pXDbLmDEvVj1GhtqJVG8RLwePodS2p3PC2XfzQZm3O4pba09zG/jYKsLUpyWBPXUJHQgooklwoxsXIhwL7SXTiuJbQQ14faD3kWMVW2KH53wlXOg5ZldHHHMtlnn+i+7uKqyh/FbBf/81zMo1bkV5HUEO+p3Y0vfPS/FLmAw6Y4rIi+gofKb/MbajgU3sdUQwzL0lIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDyrzWWIggVWApG80W6D7QveSK2EO9mV1fgnebJFbGE=;
 b=t+H7mbHH+Zhb4AbSLT5u1dbcrH1pCr6klQNoMjGrMY5eQzGvjWFH7VmYgeYzAe+3wDm5Y2F+xKS/LMUSAj1/P/OlqIW1WQx+UpX/8gQslLkEmKHrAzjhi3L7AXNocHbwuRBJUxWVX0AsJd5mqebyAEzY0dgVZq5jTRcRymqzwINqc/D4BFDELX+FLvTNLROVfEAEuCYvxvywSZxHSY6BJ45iixfaVU0iDxp3ye5Klgq39zUvMzaG6ecECgZvlVUE2Oqmr5AbyJTG4LkYIERgfDdjivjuXYP/QCCBV+8qfBUEZKr+VHjcvYoPsejBskBxZqZ94I+C+9up7cle1huKSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB7481.apcprd03.prod.outlook.com (2603:1096:400:421::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 02:37:18 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 02:37:17 +0000
Message-ID: <f2f636c6-a83f-4517-9b8d-3df427997b5f@amlogic.com>
Date: Mon, 12 Jan 2026 10:36:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] arm64: dts: amlogic: A5: Add scmi-clk node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
 <20260108-a5-clk-v5-6-9a69fc1ef00a@amlogic.com>
 <CAFBinCCPsaywQuePJ_bxMby0MJeh2ohkXcduRy=yxr8EExJ9nw@mail.gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <CAFBinCCPsaywQuePJ_bxMby0MJeh2ohkXcduRy=yxr8EExJ9nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: 084b8147-b0e1-4d26-2942-08de518380ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUlwWjY0Z210VkI3Z0JWcG5saVBrY2hPTVR3NTA3VnlTK1B6OWRPcXBIeUNB?=
 =?utf-8?B?elpGQ2VCa3V2aFR0ZytnL1pRajNwNlVPYXd0b3lYU2daZUZWSmhBRHZBc0dC?=
 =?utf-8?B?cXYvbUxzZ0xIU25LVVFTL2g2Y29veFFjQzRyaE9rRWtrdThBRzZIMHdabFdU?=
 =?utf-8?B?c2xFS2oxTm9wYndReUdnVHFXSzlzWUIyWUtTTWdJbUZ6WGVZQmNXMTlIVVFs?=
 =?utf-8?B?YU80RnZ1MDc2cW1xNy9tb3c2OS9xL3RjZmtoa2J6OUROSzBwSSs1dG5rZTNL?=
 =?utf-8?B?SG9NREZ3WC9GK3VHR1JVZkdic1pqUkhkREdXZUZtWUhQejU1blRFUWhqOUpv?=
 =?utf-8?B?WGNJTG9WVVBGZENpUGtVSlFmTDFpS01tS05BdzVYaVdUZDJOR1psQy9XQ0tI?=
 =?utf-8?B?ZDZnbXk3WUxEcExUY3V5eVJQblRWYU5pcjBmalkzR0dFd0hoR29ETlRYTmND?=
 =?utf-8?B?QnhDNkRsSmJGWWVTdng1Wms1VThxRzBMbW1SM1g3MndtY1JYU3NkQ0R0TlpT?=
 =?utf-8?B?VlAvTjFwV3c2REpKR1dHN2tqUCtLZEdMRVo2RndocUlOcnVDS0ZQN3UwZ0lV?=
 =?utf-8?B?NERLbU56THNaWFB6RTRVOURiNk5Pc0VqVlhZanBaNTNReXA0K2R1NUVRVVBt?=
 =?utf-8?B?bU5QWEsrbE1zUWlTKzlOSStDMnJvbWhrYm9scjNscFNmV2NtRzYwRmlxajRy?=
 =?utf-8?B?OG40dnZ2bEZ1Qk40MVd1dFNHNHRvZVczcGM0YUpNNVlxNkdrdzZKV0NFZlNB?=
 =?utf-8?B?anU3bjRlUFpaNFNzQU5QZVpPV0pkREw1ZXFIY3oyZEx3bllDaE53dVZCVkZy?=
 =?utf-8?B?NkhHN3ZYT090ODhiT1h1Zy9tMU9TVlpZcmp3TE02RmpMUWY5QmJGUi9ubjM0?=
 =?utf-8?B?SitaVWFpMUhrOGJsdE9LMVZJRWh6YnBxRXpSVFp3elpaYzdSTFVXU3crVHhW?=
 =?utf-8?B?cDFnSmVPengvUGhPbXdYZ1E2QzNuOSt6YWE2VWpXcjcxMlVVLzNJZm9nbU1U?=
 =?utf-8?B?a2k3bDNTZHNWVC9nanBYL3M4YXFwU05BaFQ2ODl1YXFZMExCNEVndDdXNDJl?=
 =?utf-8?B?Z0VrWWh3cWZkN2hFOUJQUmdFWU1oc3c3MVY5RWNFZlV4ZFJ6QnlqYVVYVmU5?=
 =?utf-8?B?OEFvVXBiYUpVVDU5WStTd2dIUEZuN2ZBcVgwWm81Uk5tKzNJMW9WaFpVY0dY?=
 =?utf-8?B?Y1pzVHFQKzhWalRaaXBUcGZ5ZGhEQ3plZ0tDeTlJZ1hibFowNm4xY016RzVC?=
 =?utf-8?B?blZHMEdPTVIyUnBUVldBd0FuajhpNkEvemRWaUFiWFFESVlsUFFKQk5oaFdh?=
 =?utf-8?B?a2RhM25xdlJPU2Rlazh1MmhtZEVLTjIrZlh1RkNZWHlnKzlVS29jNndWdktX?=
 =?utf-8?B?Z3Y1aEMyM25oWmdQUi9OK1lvT2dWT0NXellLSis1VlprVzUvMkVReElVRTQ5?=
 =?utf-8?B?SGZrUHZ4UlJpTnFWbTFRVUpDTVVYQUc0a2haLytZU0FsV0QwZzZISzRPQ1pp?=
 =?utf-8?B?VU1VWUYvUitWaUdRNTAvZ3ljQWRpUUtFaFl0WVB2bklZa0g1eXBXT25kTUh0?=
 =?utf-8?B?MmZMS1JkeTRHdWQ1dVZHL2hIeXVyeXBIci9YSXdaa05kNnNmSzFQV3JBSVpo?=
 =?utf-8?B?RS9nVk5wLzREUlRQTGJEcUdaMzk1UEt1UThYTWxOc0tKYTJpVWNMdHpMOGZs?=
 =?utf-8?B?WkFYZWk1SktGSHdQK3NORzI3VytlYXdIeXlCN2ZQbVhNOXB0N200R2xCcmJD?=
 =?utf-8?B?Z0g5bXhpVEZBbEo1WmJwNmZiVmZ4V2ZCc1VaTUwrN1JVaVhvT2h6M2hwV3Qv?=
 =?utf-8?B?VTlPSTZjK3k0ZXgzdUQveUFEKzdqeE03VUJIOG1wQjhJOGVnNGEyN1dqcDlR?=
 =?utf-8?B?ZHpkbEtIb2cwOEFycFh3aUQrb044UEhleERaaHJvSnc4SVcwVHpDa2JIbmJG?=
 =?utf-8?B?ZnBXV2VubHhFMnRkU3NIMnpOQkdvTGI5aHE5QkRzc0VnalFQemVZWExXcXJB?=
 =?utf-8?B?cnFHbW92VTZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmRrcjg2REkxRjBIVFYwOXArNXRoZ1RPNC9wbFo4TElSamE1MkhMelE3K1hK?=
 =?utf-8?B?NW5PODZiVEdoNGNNVUhEMnZ4b0M4YzBqMmdKUm4wcVB5NWJiaGJXaWc1MkRO?=
 =?utf-8?B?TlhrTXZtR1pMS3NqeFZRbnNzOFdoelNBVlh6SERPU3l5VUs5eGZJRm9NLzV6?=
 =?utf-8?B?VUQ0QzZxbjZvMzFJVHNsLzQyYmF6Z2VjcDJtVndkNG5VbE40aDY3a2FEWUJR?=
 =?utf-8?B?enpDNFhlZHQyWmg0dDFlSzk5S1grZHRmOXVCTmpOQnljbjQ5UEdnd00rYjhh?=
 =?utf-8?B?RkZqcE4ycDBLOG5TTndkNXg1REN3bzdOc1dXZjBFVzFuMmJyeGJZYXJTdldi?=
 =?utf-8?B?YStROVdWbnliUXdiYU42a1g1aC94SEdCNTVFRTJ5cjEydVlhdk81SEdpa0V2?=
 =?utf-8?B?MUV1dFpLSEJnWVhJVW9BVjRTRTcrbnFRd1dodFNZZFdOQnB6WnZSbVY3Y0tU?=
 =?utf-8?B?RWQ1eDl6ZHFJOWRCK05GMjNTclpNRTJiTS9RT3EyalpnM1A0anVzYkVIMU8r?=
 =?utf-8?B?Yktaemp1bFYxU255M1p2V2dtN05uRm1ZVkRnQ1FidjNxZ3dVNGlIdENzaTEx?=
 =?utf-8?B?eXM4d040N2FRY0FDOXY0U0ttamwwaXU1OHgyZ1lXa21lRnhKb0oyL3FIVFo2?=
 =?utf-8?B?QTFudmxhNW1FMXh0YTgyb2dSQnhqKzJTZ3Z2b0xqbVNJcjBDL3VzeWptRjk2?=
 =?utf-8?B?QlJ3NTZ1SkdxSE5IdnpSSTdXbG11SitjaVdoUUh6OXpzall0WWNBNWN0RXVT?=
 =?utf-8?B?bHRISWc3WTBzMEdTUmdIRFhhdncvQXhoVTNEeXFjREI0anRxb1BwVmU4dlJ1?=
 =?utf-8?B?MlhTNlZiSVVwa1JTSlpMS0hQMnl2TFNwZ0dlZml0MERsRmtxMDNZekpyMlJC?=
 =?utf-8?B?dXluMW9qRlNzdnBSbTVJbENxZHZTRXFVWUg4RXJMbC9WN2JMUzBqUGh3WnEr?=
 =?utf-8?B?amZJazBoWVdFY0wrN2d0ZllXNER3UUoxMXE4NUNGUG9nWDlLbENMUDF1OTlX?=
 =?utf-8?B?ZjJ0REttTmRnaEI2d3F0YUhhQ2tXdEZBaS9ZV1JIeldETVJXbzh3UFY5ZGJi?=
 =?utf-8?B?K2VWQXhsajkzR2xtOFc3NjFPc05Yd0lhSU5RajNKdmRpckR5UDNMMjlLdjUv?=
 =?utf-8?B?VUVnUkduakJic3kzOXdvL2p1OGtRY004VlR6T2U4VGk2d1grSjRReTl3NFRm?=
 =?utf-8?B?VXkrQlJqVkswNE16TDMrbE5JY3Fxa0xNL21tMlNzOUZtby9ESS9qaXFDdnBl?=
 =?utf-8?B?UW1KOFdTT21CdEhRSmExOG5BM3g2UVFUZ2wrQjBIcFU4VW9tV2luVFR2RUNn?=
 =?utf-8?B?eUVMZnhpUkRhNXZZL3gyVDVjbmVQQ2Zva3h2Zm1KSjc5cEZaN09hc3NpNzNo?=
 =?utf-8?B?S0hjVWp4bXlhNEhveEkzNjEzSzM2NWNkSXN4RWQ4aVdIOFFkRlpqdnBmR1BY?=
 =?utf-8?B?cG12NkV6QnlhODJ3NGRFUUNQZGFFSHIwVm83bUpWSldyejkyR1IxdGVES3lJ?=
 =?utf-8?B?MzNqUEJDVjQvT29IaGoyV21WbmxMSlZKc0lram9mUlJ1cHVSYWQrRC9KMW9X?=
 =?utf-8?B?VSs3T1BZbXNtOWlqS0lLSFQzSjVlM3cvNVNscmF1cmJZNGtwTGZSYWRmN0xL?=
 =?utf-8?B?eVl1ckRmWTRnWTEyL1c2cXRTTG9EaTVOdkNiNmNmdm5GZGV5Z1cyNit3aEJs?=
 =?utf-8?B?QXVHMlM1ZFRZOURYdVFiWGdoUE56N1B1a2I1MkluSkU2dlp1WmtTQmhzc0ta?=
 =?utf-8?B?dVE1TWpGS05JWVNiSkhyWDNzSkdqTTNnK0NWdDk2eWhWeTUrUmhkK2ZNRnBO?=
 =?utf-8?B?dDZYRUZkYXpkTS9RRXdJdlpWN1VBYi9ZZUt0em1IalJ4T1FTeEVlM0FNaG80?=
 =?utf-8?B?M3ZNT3VqNVpydms5TVpCdnlzWDRTZUdCOEhTYm5ZU1VwMzFTY2prQmFoSXYy?=
 =?utf-8?B?Z0Z3YnVTTjZpSFhlV0k4NUVvUVUvZS9FWlZvYzNqZ0ZMdlUzNnhyNWFrV3lM?=
 =?utf-8?B?a1VWdENNSHo4aHVhZFpKUy9mVS9oN29zYWlQc0U1YmowWlY1dmlSdkwyclA0?=
 =?utf-8?B?dnRoNFlKQjhMWCtpaFpKVjFJT1ZxbGh4VTRNYmJHc1pVVFR3TkszaDZUQThP?=
 =?utf-8?B?L1RmM3JDbGJ6R3Q3Q0dpRGZyWGJ6L2NpNW1HT1dTVDdJU1A2R25hSzRsMWVV?=
 =?utf-8?B?UWMraDFYYW9UeVg2UHJHTG5yckZqZFdnWUlvNjRaU1VVSUVhbUo2SHo2MVJY?=
 =?utf-8?B?RW1QaXI5K0lmSGgzSEhXLzhBOCtsWjRiaE5HUFlMNHV6QWtKSFB2UWFHeUZB?=
 =?utf-8?B?K2VsaXV2UmNqS2JRcnJqbGFPY3RWYjQxYkNBa1F2dzlYTlpOOTVzZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 084b8147-b0e1-4d26-2942-08de518380ca
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 02:37:17.8029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWmak/ep68q8lgz6fEuB5vtMTngCOALEgA16PP1rUy01S8DqH8TbI9/kLykuF+g20aF5WV1XikllHjICI4KihA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7481

Hi Martin,

On 1/11/2026 6:08 AM, Martin Blumenstingl wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi,
> 
> thanks for your patch!
> 
> On Thu, Jan 8, 2026 at 7:08 AM Chuan Liu via B4 Relay
> <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
> [...]
>> +       firmware {
>> +               scmi {
>> +                       compatible = "arm,scmi-smc";
>> +                       arm,smc-id = <0x820000C1>;
> Just before your v5 Neil merged a patch to use lowercase hex consistently: [0]
> Please update this here as well.
> 

Thanks for the correction, I'll fix it in the next version.

> 
> Thank you!
> Martin
> 
> 
> [0] https://git.kernel.org/amlogic/c/7bcbedd64ecf5624583140faebfdb0e2e2f6b43e

