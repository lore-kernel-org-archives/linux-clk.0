Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336A02BEFE0;
	Tue, 14 Oct 2025 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433206; cv=fail; b=HmvoqYInaUNyokkFuNv543xhWTPIbkC7ZXjfztFFVCK+acWgOWKQDMtAGfIwUqknDnv1BltbQfyClkdWQ4hFIdW3WwLp3JEoT9sSFuXvVJv4AYZkmqO0URjfxqJLBWuAz2kSjjeg2Yn60ZC+l1T3H84MHrtnJbm3ENdm4wu91HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433206; c=relaxed/simple;
	bh=0Vqch3OaoueE/AfWyWAKyuDqxctIWPAZbA0Qk5wh93w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UJwi1t8CfTQLvXQNfYMf1vQKc9IL430XjNXJsXkbh50SmDQk6nm3Di1g97jafOaBkz+jYb/d4KRrBSv63fDKZt0dN69N0Rws/V5bTQ6mcthioXDqlLEaJ2r0b0HMjLVI39gZEpfYpLhpT26J6dxHGDOeG+3Ut+6fcYNGgaoD2R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Khahb931; arc=fail smtp.client-ip=52.101.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Khahb931"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVpC0ClynQR9iIVHu0zSqdL4Wd7WTn2dBKw9YSTmmP0njmKXQGIWlnGWbMpN3FHjUmg+gSwZfl8IIJrO8+7GkezN4BXs/WuXmk+ta83ieCl3yFu1lIJVVEUhhLAUGpW2alsGo+Wpwnx1JVY8hRlUtFdXV+dgBJe9hCEV+aJ7SSP6rtCad7ReUlY5Pc3w1Us02QOupcEv9yNSwYlitTb0H2om+PI2BvXf8yqCG9wHhSbZmJLXDVQb5AoR9wROli3rjKkKHL/EQ3ntYc4tPzMXvN0exhXSoT4sdIdqn4qL0Roa1JVcRnfZuo0A5p6JYOoPzfaKbIxSb4DED6+3MPZFEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/oML7k624R1w5E3O2oDT1WldbYjenvEtTNpfTKarlU=;
 b=MWOWZAqkxDXaAHUiTtsayfvHTzLXwxvQmlXGo1qnPyZ9lSuh1/rXoDiA3U1fPFOyDItEvV0XXxL3/kslmEG4oOFrQIBbYGgsrZowNMP/S6YJHVM6TpztaMYiu0gZTqCjWE49Qroi/SzCUNs/t5Oa8wPrRY2CwXRmeo/8McydSnJjvUGJW1dQuOaELVxXyo3LjmmSeiqku+sgP+i8gyUez4kfBlNojQno+MXWMSRv+ydclM6lBle8zBgFCnUDZ/Q71Fm7XQoDZUu0MiyKhB6NvDYXZ/0pZ+2rwQVp7tGiUlYPXUOGfhccEDFJC32MM+5H1UYrAATR5U3sYdgzmTlkbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/oML7k624R1w5E3O2oDT1WldbYjenvEtTNpfTKarlU=;
 b=Khahb931QJkfYeKfU2G0g3Mz7w3n9uerXWlsTV5Fp048g7Jhi1IFXviReUHngKsGSWZXTB/aW8OtLbwA+sST622MdAFb2b3ixzN7GHpsHfntwUrdT5gcnm1MiFEvULadyr57QeshGUkW4mIb/PqrBivUoJ9mIEm1Gd6cCNYmrVJQLZBwFBW6JNQzpDDvEuqIIhKwH5GTt9vECJYs555KIONQkKuIroHEmz5tWQ569RFhPTsAUinzmWvYQChvhYEmQGxVOLV1ko1fbstl74zKf9dg8cwuWBu5u+AZvHVU7IWkOBbY8CIflZpgZUS1egUnEsgfXRbNb3gvesgxTkO82Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8615.eurprd04.prod.outlook.com (2603:10a6:10:2da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 09:13:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 09:13:20 +0000
Message-ID: <2a22c45e-5de4-49ee-af3e-002941a7e2d0@nxp.com>
Date: Tue, 14 Oct 2025 17:13:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0228.apcprd06.prod.outlook.com
 (2603:1096:4:68::36) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b77819-ef58-4240-ed54-08de0b01eb1e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?M1ZNODlrZzFYcUNVTWtnWWhIeEFieEw1VmtNVmZlYW1tRXFJcUdISjdtSHJV?=
 =?utf-8?B?U3JnU2JVRm9tdVVGMW03UnpxT2Q3Um9CV3JXT2pGeEVTb0ZDZEhKWmdXbXkr?=
 =?utf-8?B?MFlvWko4T2JNMXdKZENRUVVWSWxFZm9iM2thdjRCWEdwcXBmcjZIZ0crYUF6?=
 =?utf-8?B?KzhrMmRGRFdMM1N5dmdlK09KSDZuelZsOUI3QUJBNE8xSWxrenlhNEo0Snh0?=
 =?utf-8?B?V0RINFJ6WnluRWhjS0d3WTQ0RFhPVG1FVkNYUnZxTUYxQ0RpQVBvMWUzSnRD?=
 =?utf-8?B?ek5EbDdpRU9MUG5rc09PajVOa2pNc0p4VU13SC9hQ0wyTWQ1ZXlPRGxRZThh?=
 =?utf-8?B?Tlc0YUdjUllkT1UzM3RmVDlqRzJuVEZYRlVJL3B3T05IYVVFOGYrbENMcVgx?=
 =?utf-8?B?TXp1MlVPTmNQSDM4WFpMOHBmMEN0MkNFNHJxeXI4d2QwZG5VOFZhT3NhZXpl?=
 =?utf-8?B?cWJFYXZKWlFhVStWTTRVb2N1UTVQSDBxQmJrZWxtN1NQRHZ6b0VqaTFlRUpX?=
 =?utf-8?B?R2gvNVhuZ0xNSkY0dXpwWjB6YnhUYkNKTmltMDliWit6YlNNSjdUZ0NtREU5?=
 =?utf-8?B?Z01uRklqZ2JaaHliNC8xb3h4MGhSbm1xU0Y2RUJLNjQvaXJ3SDh5OER1TTRC?=
 =?utf-8?B?TVk5VEk3RWdyNXhYK01jelAwazV3bWE0eGhhQ2ZTYXV0ZG51M2w3Sm9NSVpE?=
 =?utf-8?B?eVZvWGpPOEhZakc2ZjZnWjFadVlFanA0cEMzNTJHM2srN3ZZN2x5NkNsRXZG?=
 =?utf-8?B?R0QveGRudTVpTG5zRWQzQUU4Tkd0SHd1R1ZKRnFISEowOElRTVNnV1A1QTJD?=
 =?utf-8?B?TWhIMUx4T0hPMS9xbHpIeEVoVExuRHlhWXBTdnkzcDEyNjB3Z1YzNlBkZkJn?=
 =?utf-8?B?VTVsTFY4RDA1L1JPdmVaaVBDZXJSWWZKenh5SUNJVDBiUy84YmxmTnFYY2Vh?=
 =?utf-8?B?eTBid1F1cnpJcDBESXYrRUVHMFdRMG1MS1NFM0p0U1FKVGJFaGUvRkRwRVJC?=
 =?utf-8?B?RmRCdFBhM0NLY0JSZ0s4THVzYitJKzJDTUliSndsUnRGY0YzUGtLallJYnN4?=
 =?utf-8?B?MEFrdkI1cmhRczlIbGl6RHVPM2ZpVTlOYWZuZHZNTC81c2FlSkZQVlVKa0Jy?=
 =?utf-8?B?cm1lQ2Fia0JhWTJBNWtiR3pRTHVpQjRJVjB1ajBRdEF4Y2VmNFJhSHZKQW5q?=
 =?utf-8?B?Znp1OVRwNkMxVUU4M3ptckw0T3JWOXd4aXl1ck9Ka0kvbTlCczN1aUNpbTEr?=
 =?utf-8?B?cWtTV1l4alExWCtFME92R0YzYjUvNGt6dCt5UHJVc0s4OER4blZ5L3Y1RER2?=
 =?utf-8?B?bTVvc0tSSERmUlBNUUxSK0p1QzBWL29RMUZyY1pkb1JwU1grUVNxT0lGSzM1?=
 =?utf-8?B?ZWtJcHhOOXVZalQ1enBWaGpPcFJiVU9Rdm5DVjRGZytsUjNSY0tiSHhDcVZM?=
 =?utf-8?B?cXAvd0dkUmVlTk9PZHZiRjJJdXNmNzk2bE1zQ1JBeWgvUXFXUU9RY1BneDRQ?=
 =?utf-8?B?NnhNSGFuRVh4Y0ZSM0VHdk9sdnY3cHFyVVNUc1lrNDQ1ZTloYXNPRVRQOFlX?=
 =?utf-8?B?WmUxcHovME94cjFiQ0VYZjQ5NGpEYmRGRXZtSFZjUDltT1NUNUduOUljemF5?=
 =?utf-8?B?ODU2eERyKzA5ZllTMUw5aUk5TEtpRlE3K2Jwb2lKYnV3MmxROUlOZXM1cVMx?=
 =?utf-8?B?d2hLR291QUFXN0E4eEhFZFlZa0Q3b0FreHFQSEFhb2g5ZnkzNWllRk44MURr?=
 =?utf-8?B?U244MVA5akk5TlRpbjNkdGl4VHRjRFhUNmxhVFdUbEFSbDN5WkJOSmdNbDlJ?=
 =?utf-8?B?N3FLSGs3VXpUZTRaRDlXbkJYd1FoVEZNbjF6UitwWEl5dVNydkkzdjJQNTk5?=
 =?utf-8?B?VW5wcE5OZGdSWkhKbFBoVk5weXF3L0dyd0I4SVdyTWJGOUh2dmNUekhPY25B?=
 =?utf-8?B?SEtDTndrRm9OYmdRc3JrMkxVODA3eDliT01NUExxd0ppQTk5YXM1MndCb0Fr?=
 =?utf-8?B?VzF2a2EyV2R3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YWVlUGp0M0NVdWhBVHhxb0dmUFZtY3ZJZERNbC9ZN3ZRQUtWVHVaU01JTEN2?=
 =?utf-8?B?dG92TENSaldBZkhtVjJibWxaM1FUVWNzV0NzQzVUUndpRkJKVlBhMDN2bFQr?=
 =?utf-8?B?S1NqQ1RSdVJPanRlbnpOOVVTZGtmOWoycjJFUkt0QkpkZ0xkTHVvM0dKTllC?=
 =?utf-8?B?Z3lWZ3o0T1BqQnU1bisrTDRJK1NXNnpZS25mNE9lTkhxU0xrRTNyVGVJclJi?=
 =?utf-8?B?Rmxsb3NTcWNDTk1xMFI4aWRkZ2I3eERsQ0s3S2p4MlVzUGp3ZFNiQnUzVi8v?=
 =?utf-8?B?TEExWmxVTWxKb3RrSEQ5NHkrdmwzVEthb0pPa1NORE1Lc1dRbHJITnNGWGZu?=
 =?utf-8?B?RmpJTHc2OUJIcFQ4TUkxYTA1SVluaFB1d2pWcXJteUVvTSt4L2xwTkViSTJY?=
 =?utf-8?B?NHYrSUkzanpoc2FSdUFzRk01RklMMEtUMnNSRTZrdlFXakRyYi91bmNCUHRx?=
 =?utf-8?B?ZndOSUxxMTJGVk1iZkhnWWUvbmNCWit6NG9pQUJtVWdTY2xGMkI5T2IrL2Zy?=
 =?utf-8?B?VTFBdDZpRVJRNytaRnVTQjVHTEowUWQ5cjNHbEZGZUx4MW9pYVRaYk11cFNa?=
 =?utf-8?B?Q25VL0l2cHpDUW01Slhkd1RtQU5TNlQwNjAzSUpRZGJyWnk5OE5VNi82K2Fa?=
 =?utf-8?B?RmNoOFoyMEk5RngwZlBiVTZZdC9ranhHVkpkRXlaYzBUZ1F3VHdsTkpVQWlD?=
 =?utf-8?B?VG5WT0hRcEZEdldyMkpicFFMN1BkWld0NWhWNFVMbHQvOHllZEkzdmVyR0V6?=
 =?utf-8?B?UGpNbkVTMHQ4Y1RpVlNuRjhJRmlKNjd2OGR3dDdmWE93QkVFeWM3TnQyNXF4?=
 =?utf-8?B?Um5RSVU4WmM3TE5xWWJxZjdzWE9GdTl4VkEyc0tkZFVNcU4weXJYUFdZR2Rl?=
 =?utf-8?B?U2diRXJjaVQ3eVF0SXMvQ1VZU1crSTNYNXVvS3lFQ01ab0ZUdTNld2xuOE0z?=
 =?utf-8?B?VHVuVmw1SGtLNk9ieDQ3YWNTQmY5R2ZVWTlOMElqWThKNHFtWW9jMW8wNTYr?=
 =?utf-8?B?VFI5T2Nxa1dKUitZMDRCeXhidDBwSkFsZ2lLT1hPazJaMEoralc2eVhsT0oy?=
 =?utf-8?B?cjR2VzBhd1IxQlZ3Yy8zOUFmdVFOVEpEQkNmNXlHa0xWUWxvV1k3Z2xXR3pa?=
 =?utf-8?B?TlIzcVJFWTFlZEVxc28wQVhvcHM0cWpxSmlMbjdXR3ZERG9nZ0tXZG5kQk9D?=
 =?utf-8?B?M2JSOVpwai8zRWNsTXEwS0lZaXZadEVLQVZpeVFjL3VkcWUzWSs5VzR2am5E?=
 =?utf-8?B?aHFPN0cwZFZNd3dKQ2srdldha1V6ejZ0REljRzhBbng4VzV5cGFZc2ZwSUQr?=
 =?utf-8?B?aWFzM3JMWnpYeTF2ZHMrSllyWGRaTTQwQ3lUb3F3aHBOQlM4NEw5bXVaTG41?=
 =?utf-8?B?Y0UrZlliUHl5QXc1b1E0VWFURXVLWlA4d3lKREVNRW1tNEY1MElJMzNpY0VT?=
 =?utf-8?B?NERhTXd1MW5yd2o0ZXZHMzFvblRETFdBTFlXM3hVYXhWNjZCeWQvb1lEWGkw?=
 =?utf-8?B?UW9VeGI5bHFTTjNrVUlwWGdPV1lHcXdqcmxoQzJMVUQ2cllTTGdvcmwzOFVS?=
 =?utf-8?B?YjNYSE9sQ2ZtS3Z2YlBvSVhNMmtaQVZhZW8rYThUakFUSWI1K052LzZqOUFL?=
 =?utf-8?B?SHFiMDNNaCtSYTI1Q3ptcDJUblE2dUE5R2ZaMXZuMnp3eGVtL2VXbkRwMDhW?=
 =?utf-8?B?VUVVd3ZYNXFyNGVoNi9kSGJvMXNvbGdWbW54VzRISjRlVjRjNUJmQzVTc2VC?=
 =?utf-8?B?dXozNElnREhNVGhKOGROUTFoaGRWWmkybnVZL0pVNktHSytDdnZZbkVRS0tu?=
 =?utf-8?B?VHRtdEtIbm83ZmxtbHR5aEc2TEdrcEdJYkZnOGdiY1ROM2dHUlhPWEtiQUNJ?=
 =?utf-8?B?OXZxUDhtNnRIL2l5ZHA5YmdZMEowc1ZNL0Nsb0J0ZFVuQzhYQ1hTZ0U4ZjRT?=
 =?utf-8?B?R0pUajMyR2VpYUp4WitONW5Xc3BFVWt6SDBVYzcrRTVsWlF1L2ZMd216ZkxK?=
 =?utf-8?B?enl0S21YN3I5VUlUcXFJV285NXVCeVJreDBkVEM4TWYybkt3RjdSbjNwdUw2?=
 =?utf-8?B?TkJyUTVXVEFYekhuRm5GOG8vckJQeUNvYVZmVC9md1ViL2JZaytsV01PYWdv?=
 =?utf-8?Q?tdwrPBc6KOgM0xFoavod1mQcs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b77819-ef58-4240-ed54-08de0b01eb1e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 09:13:20.3796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSYVgn67ML6qfAV+ezlY8tjxY2yQeWxmbgApqxcweAZortdU90eneJD/5JZQIZTu55xr9umGxA1DGyAodRoETA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8615

On 10/11/2025, Marek Vasut wrote:
> DPU is added into DC driver

This has conflicts with my in-flight patch series for adding i.MX8QXP DC
prefetch engine support(though i.MX95 SoC doesn't embed any display controller
prefetch engine).  You probably want to take a look at it, just a heads up.

https://lore.kernel.org/all/20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com/

-- 
Regards,
Liu Ying
