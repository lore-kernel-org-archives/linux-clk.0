Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E181D31A575;
	Wed, 31 Dec 2025 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176015; cv=fail; b=RPPYn9kWc83GGpbx/ZMjVRyscbjc/q6Xbn9qgLq9Zchd+Qe7VuFiLHoe7nJGsF31xvuAyOUz4qUncotzTHcmfU1lfhbDyiyoPUqvGeyEuMSVBguNpYOIENiBB4qqRFSkEOT+19IV60wBr0U3dq30+/PqbYo9W7O3qI1XVTQPkIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176015; c=relaxed/simple;
	bh=+hOJ4I+Goi4OkBL2R9kNM1VlXnZmu3W6t9Exvux8RyU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bJ6LzP4erYvmrWAVcooqKJjly5uXCrH7uQytN9QI9zDdY6LDYRQIu7FQbmTRScYLrdLgwxsBQ8Q9xHES636hEzERFNUrNpsoK5BCfz5JHezRqj1ExolpHXNIUaVQFk5CKc1gZKlLcvlLq94X4BoavyKS9ixfPOH3fR55EfmqueQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Nrk1DXA+; arc=fail smtp.client-ip=40.107.159.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Nrk1DXA+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUlvRozkWBZQa8Ws6b8O0yVVyAeele7jqjVFo99ts+Vpvt0iaSCEUhAp6OxgQV1M0nzoz02LT3Kul5LJiFRQvwrL2TeM3HnUcjOY2UbKnPMGIwcgHGEX2KjcbwyjUG8NDcCyF/EADjKrelMchxOOyXCTWjuRh3AZfQ0Tgpj+RX0F5UqEmq4CYQ6FNRFLZ8Cv+bJcoEOcGKOfylKrjKzi54WZrPYXsA5TyPYUtxFY5sc3BBoq7D4C7UepZA4DRHPTIOr581hAhZ+tvR+yAiFawOKCJc7FwHcjTj3ACcoaxhs0GS6Yqlnn4KgXBrzGMzJOr+I58e0ZaNtDg5fyQaTgwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv4b6BXKDGsrbzB7WGUe4UBy5CTRXGMJh5EzfdmH+Jw=;
 b=vdS0vso/lap9xBYR+Jjzivha85bjPPX9d2IVbvVOv9X5BhkwRXt0hDVzdF3/plbQh7Cc/8WpcNiIbxpTnBhaHDp3khKsveYXQRDVDjUsyeUjiziC5ed9f8A/HIVilTh6wX7mNvwvq13ooXOskDt9HWEHZ7/aJYZqhGwqJmjiu7NIMqgzagz1ITQJZCivgG32Yf/cY80vha0BkbYIU1SKRub2a1hrifvP+oEe977IoxSNfDDPQf09UOr05hD2kQgzKr4C8C+Zpq4kHXfwIG83fa4sz6JMwUTjny38WH2o1BcUBJ163e6iBX5uvMwbAu9LNmToYdq9ZshGleMYhMwQBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vv4b6BXKDGsrbzB7WGUe4UBy5CTRXGMJh5EzfdmH+Jw=;
 b=Nrk1DXA+V7Vub3aFvuHncJkdTKU8vINO2H/uKZA2MuaQC3OKSYM5D97ryGb7M+fyGmw6wGxBudRIsHhrrfO40uN38Ql3mXRowl1sWAatxkv1ac6j0w7aFpDMJlwqsAfYan1NcHA7ANjh3JXrf31wYLz5vOAXt52EKiz/YBTlweM8LwEmBwaJJkjl+Yn/mQu8Siw0kWpk2eUMvDF4GcfgyMJtXlFErO/v7wv7g+TTEVY/yoqPsvlVmHcKUkIWq2yDKBK22gdqGxgh9XaIJD1Xel5PIcP6gCat0f3A0q97VbJ7SJTep/co8yTh1FXHE75vouFmDOx87uZ3jgvLQlSa3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU7PR04MB11089.eurprd04.prod.outlook.com (2603:10a6:10:5b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:13:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 10:13:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 31 Dec 2025 18:12:52 +0800
Subject: [PATCH v7 5/6] clk: scmi: Introduce common header for SCMI clock
 interface
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-clk-ssc-v7-1-v7-5-380e8b58f9e3@nxp.com>
References: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
In-Reply-To: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU7PR04MB11089:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e350a1b-70cc-45c7-3e8b-08de48553f2d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THVxSWROZm1pUlc2RjlnU1NFTUNvQ2IyNzJ3eDhoUGg0RnRFWlBhTStoeDA3?=
 =?utf-8?B?V1ZtZ1JGbkROc3c5MDdERzRZSktlNzcrb3kvbGJVTFZHSFptUnk1YlJudXE3?=
 =?utf-8?B?MDJBTE5XeElIbVBCL0lBVGgrR3lJZWVTNXpEQkdOZUxSZDZaM005Zms1Zzdx?=
 =?utf-8?B?VFdLbzJXT3hJWWRsendwTTVZUlRyQTh1azJBSExzTkpOaDJkUVhIdUkyMVhE?=
 =?utf-8?B?L2ovaFoxSHBPeXovN3VOZ1VSTFRPSnNMRTViMS91cU9JYWhvMGF5aDg3NWFY?=
 =?utf-8?B?N1k0ZTh6WmhiQ0doKzVra1JxUG4zdHZxTkt3QlNNMFBxUWp6REd2WFR2ZndQ?=
 =?utf-8?B?a2RRMXF0SDFnenhZWWkxTEdldzFYMnFYcFpEYmd3bmtxelU2elpqY2oyTUM1?=
 =?utf-8?B?N0gvY0VoQUN3WVlRaEVhcXpQV0Y0aDdiODdLYjZOTkRsVStHbjdrdWxtREFv?=
 =?utf-8?B?VFFIOGRYUGtDNSt1T2tVcG1neG5DR090aWo2WmNMa1BDSHJ0RHpUUDdIRWVP?=
 =?utf-8?B?YmQwRmRxVlFicXc0U2JmRFNTbHRHSklzZlFsaVppS082L1RreWZaTDJDcWg5?=
 =?utf-8?B?Smw5aFRDQUhFSXBQQWJENmpWV1dEWHBlUDdrNlpLVm5ZYW9qd2FESmZScTM4?=
 =?utf-8?B?TVVJQUFuSlcxd1RGS3VCcmpzc3JpQWl2bHN1RnlnYzNoajJ3VC9PL0xpbDJr?=
 =?utf-8?B?VGcvT3FGaFlCdzFBN24yUkdZckZ0Y2RNNkh0NnI3Vnk5Rk9udy9ISFdzVXJG?=
 =?utf-8?B?YklpclU2NHNJcC9nRStjTEw2eVROcWQ3eHVaQ0VQbEVsZ0NCWC9yRG8xQXVW?=
 =?utf-8?B?TEdZVTVqZkYyQTN4OEtuYmtSeEJFWFF1cmJlYzZ0NWMySENMM2xmUXJId1h2?=
 =?utf-8?B?MkpnSmZWV001Mjd3SHU5NTF5bmMyRFd4M2QwN0lZcG1WNk9BcFFoNE5QcTc3?=
 =?utf-8?B?Rkp3YVdkdzBqcTZuT3hja2luV0EyQzlGbDdVMEpmNjkyNmdPUW84TzkraEow?=
 =?utf-8?B?ZG9DaFl1WU91V3Y4M3BhMGNxL1B3MzVuSjlSbExKMnRSaGxGUExzbWZPK0FU?=
 =?utf-8?B?NlNZckgxbEVWNFg3RDkzV1YrNGNoOXgwaHQ4Q2ZmZm5wTDY5UkF3bldjQzdk?=
 =?utf-8?B?d3MvS29SKzgvKzRldkh4dXF2bzk1dkpaUHhUZ2F3RU9vUEFLeTBFSnFCQ2lp?=
 =?utf-8?B?V0dJTU9ieXIxeDZoc2l0aE1qRSs4WENKZks4emYxUnJlZkZDQ1pORXdZdFFp?=
 =?utf-8?B?UHB0c1dIVzhHdGxnQVMvOFhWWlFLQVBjRGJJZS9mSUE3WTB4TVlEbHd3RUJV?=
 =?utf-8?B?aVpxYXNWVTFwTGtZeGNpTVNhbU5jVE5adi9BZHNqdElQdjRoSk5ROWxKYkM1?=
 =?utf-8?B?eUtuR0ZUZTRBWlF0K0hTc01vN3VyZVZNTVdhaE5SaS9sS1kyZW9LQ1ZkeGxP?=
 =?utf-8?B?ZlRtT0dJZGdxckQzVkRPT3l3VXBHRzUvTWM2UlZzc283WU9jWXBid2duUlQ2?=
 =?utf-8?B?UmJJemUxakZNdk9wL2NZbTFwK2IxTDMxVW05dGhSYUlIeWVuRUtWSDNyb1gw?=
 =?utf-8?B?L3dnWGxyN1IwWTV5RnE4eUdRT1NOT3crKzVqQitXUmplVjNnTXBFUkRuSHFa?=
 =?utf-8?B?Y0IzMjMrd3o3Y0xDK25wdkpTZkZwTjJDMUI5QVI5TkFjVy9sN0YvK2txalVk?=
 =?utf-8?B?ak1pRDFGaXlsYmpoK1JPQUs2VUE4N05ZL1ZDajNwZEFsVDRYOFBJZmRMeEtq?=
 =?utf-8?B?WVJlbUJ3YTNrOFVwRFBBK3o2dG9GK3FTNmVhSm5Qd21pYzJpdXVDY2s0RnIw?=
 =?utf-8?B?aXZIZ0h2TTlVcjE1YUczT0I2TUV4RlhZOGl0UERiMDNKU1g0Y1U3ZXN1aDgz?=
 =?utf-8?B?dHJGdmFQRkVpOWhPNmFoV1RKT2lNeVJOTWxMT2hOcE9jRVFkeVpCRzJTb3Z1?=
 =?utf-8?B?OFpOYzhRSUg1ZFJIRkRKK21KTWh1WTBaWHJ5M016QjVNZlZCOFVWSlFQMlBw?=
 =?utf-8?B?MTdHV0tIb1U5M2Z4Ui9oZ1ZCa09JMFA5c2tZM0wrcFBWcXJpdmM2NUV1T0Fj?=
 =?utf-8?Q?rhxYW2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWpDeDdHb3ViTGpVMFlianpHWEZiSmRIUEZHeHBzQmQ4MmRnQUc1cXVuZFNO?=
 =?utf-8?B?TjJvU1RGQWJOZFVaSWtzSVJMT281ZC94bGZQL3hoUDFtNXBUYURDSldiLzRp?=
 =?utf-8?B?MzZlUVZzSndRUUxGdFNGMGU4d3RHTnB3ZnV5amNsb3N0TTg2dGhRSk9HZHR3?=
 =?utf-8?B?OFpQMHR5alN2bHBJT3pGTVM2U1lzbWQ4L1RGZ0pJR2dOYVFxY0oyWWEzT2cr?=
 =?utf-8?B?VFNETzZ6ZG9lVjdrK0ZlVU0za1RWWk10TkxxVEFmcWtJMjBOSDFRcDcxNHpn?=
 =?utf-8?B?NnI5Q3czUERmWGlXOU9JbWxFWHB2RkdKL0dhdWROZmZHTWpGOStnUWo0TnBG?=
 =?utf-8?B?YWhYR0Fob2lmUDV5UlBHNUd0Z0h4VzR1TkVpdXBzODVYWjh1T1FNWHdhbkRt?=
 =?utf-8?B?NmlkZVBPYU9ZOFNGZWVhR0k5ZFIwRTcwOWROV0JRQTlMKy9paGhiekNyOEhX?=
 =?utf-8?B?QWNaL2t1YTdEK3VxZ3NTMFRsYk1xUW51MnNuZzB6anpNWmxlbDArUEpORXBM?=
 =?utf-8?B?NTFHNU1jaVdCcXorcVR1SXRDNmxnYkl5Tk83YmZIM0RiQ3RsRWYzTnltejB5?=
 =?utf-8?B?TmNpMjZSVDYrMWlQWlZITnlHMEc1VWF5dURYOGxKNWZKc3Z3Ym5GZHRJaU1m?=
 =?utf-8?B?dzc0UU53VTJsTnpEa3BlOFpSei9McllKbjlNRzkwYUUrQVZSUXY3MTZGRGdD?=
 =?utf-8?B?TXVwcy9SdXlhZnFVdlpnNnU2VjVVNTd1WnNhQnVCbFhiSTFrNXdrczV1b28r?=
 =?utf-8?B?ZEFjSmxQbVZCOEJKdXdNcU1obm0ySTRnL25xdHZCaEZ2WmR1S25YK0JoUEc0?=
 =?utf-8?B?U2ZlT1pQeFFBU0xZOFo1ZnBNcFFhb0E3dndmL1lyVUdIS01qbnJ5ZHl2N1Bq?=
 =?utf-8?B?VHZSU0lxdDVJY0xqdlorc1h5ODBSN1hFU0VFMnNLNkEvOGpsYTQ4em1Lcmp5?=
 =?utf-8?B?eE1IRXE5NnUxSXU2NmNXa2lkL3FNd2JVWWNYRmcxSlh4YTh1Q2RvOEtjbGJJ?=
 =?utf-8?B?eHlZVGQ0eVNzYzlPR2dqSnhpbkNnRFkzVk9SMHYwUHZhdE9DWHhJSnhUS1Rt?=
 =?utf-8?B?K213OGltaUlDbU8veXo0YU5CS3B1ZDRMc0tqKzh3dlRvMDhlS2l4MXJ6RUNL?=
 =?utf-8?B?K1QzS1JJYzdrRVc2YmxrL2VuMTNtYmt1NGdhTm1oNGQ5OUlSVHNINFI4L2hy?=
 =?utf-8?B?SnR2Qko3NU0zbVRSOWh2RTVOTlE3d0VqWWRkbUlJZzlSMDZ6ZmVLTW1hM3lN?=
 =?utf-8?B?MUVkVXg0b1NJLzVlRTdJZkRZSmh4MmxxVzNzbFQrc1M0TVhuQnpPcVQ1Z2dK?=
 =?utf-8?B?empYbXRqWDNMSktRbXdnWU9uSDNaa2NXSkYvN0ppMDY5dHIyelJzMnQrTDJY?=
 =?utf-8?B?RUV2R0NkL09HcEdWWGpIejZkd3c0dE1DZWN5UnFEa1FaNEFURWdVTTNTM1Vl?=
 =?utf-8?B?dW1pMkJUL0FoUUMyR0pZWk96S3ZVTzIvaExpZWx0OEE1aGdvT1VETFQweDdY?=
 =?utf-8?B?OE13bS9tUmxLNGRNYnJGcHd4bEYxOXBSR1ZFdGxxUHRGclVTQ1lPUE5UQ3lt?=
 =?utf-8?B?S1E4ajgrcmpTRTFtV1laTXBmSEg0UWtsZmNtRSsrWEZ5dm85YStoSzBrWW5l?=
 =?utf-8?B?Mnk3Ukxzb0t5akRQWm1UU1AwQXlrU0pQNEF3YUM1NEkyYnpCQmU2RE1QcGVp?=
 =?utf-8?B?a0VTYmh6YnFMZ0I5eUFROHlhemZSbXNGVndYTEtFZXo1OEFGRXFFTENxRk5P?=
 =?utf-8?B?U0xSVnlsVVlsdyszTGpBZnR0M1QzR1BGR2UwQ3dacGU1ZmtxSk5ZUFlWRm9E?=
 =?utf-8?B?R2tkcWFodjM0dUdacVkxZlVQY3V2WlloMEFpeGE0a0NOajFVeXJhc015NjdT?=
 =?utf-8?B?Q3N2ZWluMkxHVXM1ZUpFazhjSGRxbEQzdWVxeFQ5aXA1QVVOK084WExYREdE?=
 =?utf-8?B?TlpQTXpSanRJQnRpSjBvVGk3THpPdkZvV0lyaTJoTzUvV0pYNUpnRjl2bDli?=
 =?utf-8?B?SWNwQ3lZWUZUcldHREVrV0Y5QjBYSGFGN1Q4WDIvZnVCODhxVXp2YVBBNEhX?=
 =?utf-8?B?SFhBbUVlZ0R4YUVHZUoxZDkvTlZ3eWhXekhlVUxNYnRuNU9IRW9udStodW55?=
 =?utf-8?B?dTdmM1JFamtCeUJBRmo4M2llazlLL3FyZFZCVFpKeUdJSW1OcTVrbDlBUnVo?=
 =?utf-8?B?VVpySWNpVnVBV3ljSWpOT1Z3eHEyaUVoRTI1VnNHM2ZkbUg1ZFVYZ1owRHpw?=
 =?utf-8?B?MWYwaVdCdXhGMlkxOU1ENlJXZktueWFNUmJpb0FrNWFtTVVBaHFwZEtjK0Y2?=
 =?utf-8?B?Q1Q2RVV2Nlp0eW9pZzB1dGVYeVhCSHdmZC9JUCtPQldlM1pCUjFrUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e350a1b-70cc-45c7-3e8b-08de48553f2d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:13:30.3441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rt8SDfp2PC1eAsFuyxzO01HH01k1hIuZayW/0iPj5MH7FisRFDINwMkq5vKTwjXRKeeGPRnE+ZWp07qTex9gCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11089

From: Peng Fan <peng.fan@nxp.com>

Added a new header file 'clk-scmi.h' to define common structures and
interfaces for the SCMI clock driver. This header will also be used by
OEM-specific extensions to ensure consistency and reusability.

Moved relevant structure definitions from the driver implementation to
'clk-scmi.h' to facilitate shared usage.

Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-scmi.c | 27 +--------------------------
 drivers/clk/clk-scmi.h | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 6b286ea6f1218c802d0ebb782c75a19057581c20..bf85924d61985eb9e596419349eb883e3817de73 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -14,32 +14,7 @@
 #include <linux/scmi_protocol.h>
 #include <asm/div64.h>
 
-#define NOT_ATOMIC	false
-#define ATOMIC		true
-
-enum scmi_clk_feats {
-	SCMI_CLK_ATOMIC_SUPPORTED,
-	SCMI_CLK_STATE_CTRL_SUPPORTED,
-	SCMI_CLK_RATE_CTRL_SUPPORTED,
-	SCMI_CLK_PARENT_CTRL_SUPPORTED,
-	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
-	SCMI_CLK_FEATS_COUNT
-};
-
-#define SCMI_MAX_CLK_OPS	BIT(SCMI_CLK_FEATS_COUNT)
-
-static const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
-
-struct scmi_clk {
-	u32 id;
-	struct device *dev;
-	struct clk_hw hw;
-	const struct scmi_clock_info *info;
-	const struct scmi_protocol_handle *ph;
-	struct clk_parent_data *parent_data;
-};
-
-#define to_scmi_clk(clk) container_of(clk, struct scmi_clk, hw)
+const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
 static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
 					  unsigned long parent_rate)
diff --git a/drivers/clk/clk-scmi.h b/drivers/clk/clk-scmi.h
new file mode 100644
index 0000000000000000000000000000000000000000..6ef6adc77c836dc2d599ff852cdc941f217ee388
--- /dev/null
+++ b/drivers/clk/clk-scmi.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright 2025 NXP
+ */
+
+#ifndef __SCMI_CLK_H
+#define __SCMI_CLK_H
+
+#include <linux/bits.h>
+#include <linux/scmi_protocol.h>
+#include <linux/types.h>
+
+#define NOT_ATOMIC	false
+#define ATOMIC		true
+
+enum scmi_clk_feats {
+	SCMI_CLK_ATOMIC_SUPPORTED,
+	SCMI_CLK_STATE_CTRL_SUPPORTED,
+	SCMI_CLK_RATE_CTRL_SUPPORTED,
+	SCMI_CLK_PARENT_CTRL_SUPPORTED,
+	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
+	SCMI_CLK_FEATS_COUNT
+};
+
+#define SCMI_MAX_CLK_OPS	BIT(SCMI_CLK_FEATS_COUNT)
+
+struct scmi_clk {
+	u32 id;
+	struct device *dev;
+	struct clk_hw hw;
+	const struct scmi_clock_info *info;
+	const struct scmi_protocol_handle *ph;
+	struct clk_parent_data *parent_data;
+};
+
+#define to_scmi_clk(clk) container_of(clk, struct scmi_clk, hw)
+
+extern const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
+
+#endif

-- 
2.37.1

