Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7298F1A2C0B;
	Wed, 21 Jan 2026 18:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018683; cv=fail; b=XPBp7xqKtR/hAVwnlLZyiIUZBL3N52ZYJYgUcYmNM6PhMfpARrjyKuOSJgrs+QFbD7ZDyNfQwfL1NcVfUMpGZyBCUuEDt/MFsBbZD2WRQaVCgNQGdFOwMZkp07oP4yckmRxnBt1OABy8wbvfWbP130evwSv8iyKgOP5shkX8aBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018683; c=relaxed/simple;
	bh=OHn/mNUDumRTKotC6Wowua8c3sN7pKLBD/IFe0+J9aQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sQA7f1bzjgM1qTDrrjD5zLFyVmjZnnNalGI4bIe4tKGOaI19aC4NvydYiMn4i0ilXHgDfMN2nYWiX4IgIrEJOl9wI/qMbm7qShmdo//R02hPDLsBK+tf2NXt+9BXvT7DYEHlNiGPKiK3QzYVqeNl77SdUqFcSbBEMUGQ3JwDttY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CufX0BSC; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CufX0BSC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9GwM9CP9qWgpk8gTn4Q4rDGkEd2yWX1POTvpmNPaBPYlOvQKmbongywDKGuVzBuQ8jo1xYDjxjZYg7yrNj+MqcZRpZlDFi3GGHGFbT9FBu8JCuRDDprVYn6w9/nHZ6g/lZ+csybHEwYZNoleDB+s2ZTxf4acczDMbryfq9FYmobxunake/WGWpNDp7AGA0jEg4z6bMyhoIPEn4XoLd8BcSgBirdq0AGyLAgG4LgkYoQMuxj50yWvYFtBdPjq+PssNEm5+Ykz8Ht5FVhjZKw4rlOQOXcRNaj28AdGmjbitKLqBZeKVtBJPpJUTCIr8HREyiYScFF5ETAvs2Z2QjI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJA1UVV27WdMzUjWpY1O8K9aTpZWxPuaEQ9KRZB3+Dc=;
 b=WC4bSHr0W/Uouwi4Aa+b5w5891XHf75IicEx3vvMpaCmzMo0CXSSTsVEfTW6QRXFK83nsvPUAhLspW9kJl4wWPhej0u4flsVFZj79oxtLOSSN3PPeVws5Gzpa1spuAn6IbNG6+7C4CuZISgaXv0s84miZ1hIMSXOy8vwjqd7SPEUoBQGoRdprNa/gemsJO5XFTIzhrvXz7H6A64PagsnsjjLeAhS2wjS7WAc7fdWf6eVwBsj9A69Wc5AGgysQ7cEzivpYL5F/oYTNTyTZ+6v63BcMBtuFE5rj1f8i9VKWAwol+hODAKhnuEo7QN3vVj6stNmeFxYD4bverfAjNWJng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJA1UVV27WdMzUjWpY1O8K9aTpZWxPuaEQ9KRZB3+Dc=;
 b=CufX0BSCzBm9b5mrApOUiy2jRorTQ8QxIpZ4Q6Iv0kYiNglUBNGF837MSIDJOlQqzLyTB6kyKVGLwqyrGMcCRCRjQMeen165BybPzIlcP4K07YsjniVRzrYRwVZjca1sGxUj/cr1moDpHzhi44Le1YMqMTDq8CSAfyoR/NRPN/EVCstmKtBVfCoAJvPexc90wrLa2DtphlZKaM8S7hq8KKm6rsqQMVfluR6dYZqBv8Lqmu6ukxUVOEEV6DR4vzSUvfq6i0qNOeyfUUm8DxBn8dMbMQiErCa7Sdgqv2YqFm6MsHlSsuO5k34qK/u02ygNPhFzmWsC9Re4Ey0aU8H3iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB8202.eurprd04.prod.outlook.com (2603:10a6:10:24f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:04:33 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 18:04:33 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 21 Jan 2026 13:04:15 -0500
Subject: [PATCH v3 1/3] dt-bindings: clock: imx6q[ul]-clock: add optional
 clock enet[1]_ref_pad
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-ccm_dts-v3-1-820ce9b5fa38@nxp.com>
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
In-Reply-To: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769018664; l=2324;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=OHn/mNUDumRTKotC6Wowua8c3sN7pKLBD/IFe0+J9aQ=;
 b=SOYchIcAgJC7KtSAAHTS2vXdA1R4jbHeBfw37Q/hwMQcymBV4ItbkkkxUW4QE4kQxanxGaWD3
 WkPQWozJbWuA1Hcf5LfnEUk2rIZDQJCHuOZVw9JtFfenpyGGo6VOMfM
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::20) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6d1934-86a3-4638-b203-08de591787c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0wwTzRRbUU2Y1grVCtHcExQNi9RNDc3U3Y5d1RjOS9nczNpM2NYY0t0WjYv?=
 =?utf-8?B?Q042b050aG0wSnlqbkxJYkMxNlc2YldSRkRlNVY4R1hibUFWT3htQmxzR0tv?=
 =?utf-8?B?Y3BEOU41SFdTTVdiaWNKbmpNYXZGcTMyL0NnMGtneVA2NVowZ3lITS8xUERC?=
 =?utf-8?B?QnlDYkZSYlJDekZtdjlmWm5FWmtCdCt3L1VHS09jYk9CSzVTMHQ0S1NzbWFB?=
 =?utf-8?B?TXlmODFzS2wydzZqVlJQNFY0UUFyTExLRWMrWHZ6YlBCMmtmN1ZUOEF2dVBh?=
 =?utf-8?B?Q0loNi9pOGJxWnBnL242N0NTQ1JvMGRxOVN5Z3FpaWJ5ZkYveExoMlZDd2pk?=
 =?utf-8?B?OFVQRkpnV2hvOHI5enM3eWxqTjhZVDVPMGtkTmFyZS95UkJwWFhyQ1BiNkhT?=
 =?utf-8?B?MUxHQ0RrNDVzQzJTY3VrczlJbEdRaFRGS0RIc09aSzUrWndJbjNPVGhBaDEv?=
 =?utf-8?B?Unlhd1JPaTE4SUptYW1pVWVjUEJCL0tjb3pZeTdPQ3dHSEVCTWFpb04vb2hj?=
 =?utf-8?B?WjRvUFgzdVpTSzdQMW5reTBQa2JQOGdnL1FJd2I4Q3FqSlZCR3BOMHpqNjcw?=
 =?utf-8?B?L04zTnJFUDg2M2gyeHVzb0RDVUludGo3UEozdUZHQitrK1lUbVhzaFFSRVJs?=
 =?utf-8?B?NkUvdzQwdmhqc1RsVThlU05ybkdSTk9MMEQrQzVXalRMbmhFOU1mN2lSZUFR?=
 =?utf-8?B?c2QxL1djdkdkcFVsNjVmL1crQXVONkNhKzZXaC9sdm0ycHVza2VnL2pjaHFr?=
 =?utf-8?B?V2h2bHM1angvUVo5byttWmJ0Z1A0ektOQjQ2dnhDL1BkWEVLQ1NJMnM1UjJK?=
 =?utf-8?B?STdTSU0yZEtrT1k2cW9PS3NpTGIzK1ZyQlI1UzA1NnRPOGhSVmx0N2lXbXh1?=
 =?utf-8?B?YWVmaWlRYjhQZnlYOUJYVFZZR1hXclNEdzVaeWMwV3NVUlpYc2xnelVwbmsy?=
 =?utf-8?B?NzRZRkxXR1VsSVkvN1lCQ25JVFJlRStJWDRaVjFacVhQd3BxSjdmLzlNTmNv?=
 =?utf-8?B?cFdjdVJ4R01LcDJDYURYRzROT0xaa3JRTGVCN0tTT1N0VkZmWmF6dU9oYnBl?=
 =?utf-8?B?T0dneTNXMEVJRUJ2Y09mTnZMR2orRTFIeCt3aUdoeXpqRDJEVlpVUTBqYlRr?=
 =?utf-8?B?MGNEcGt5ZktWKzNMZFhmd2JramJENmxJTW5EcUllRUtEam9uZmp0SlgxUnF5?=
 =?utf-8?B?YnJVZUthbVhLYUN2dzRMT3lraFRIQUJ4OUZLVW13SUhaUzFDeGdQRGs2eStv?=
 =?utf-8?B?N0xGdE9hcDlDRWJNbWs5ZkNNdkFPN2VHYmNWVGJNVnJGWmVYTU1OLzA1N052?=
 =?utf-8?B?NWYyQTgySXYrdm9YVnBQS2w1d1BRYUFROXJjUEFya2ExZGxWN0NwSktMcGtO?=
 =?utf-8?B?L3F3MnpLWGNUS0Q4blhLVWVrMGpXR29yY3RBMytDU0JFZjByRDFWQnA3MVRX?=
 =?utf-8?B?ZS9EZzdyNkM3TkxXU2hoVTdhL2pQbVhtRnZxMEs4d1RWanIreENudjQ4RFNG?=
 =?utf-8?B?VkxoRDNUTkZ4MmpGSkU0dy9OUnpyRk9DS1VUWjgzTG5wK2oxWG85RHJMZmov?=
 =?utf-8?B?V3VpY295YmNkelhqMUlHVkJoT05MaVErU2YvdUJmVURxZkxVOGRSZTZyZGxO?=
 =?utf-8?B?OTFsZWVYbkc2NVh6SEd1MU9lUzA5L25DNzQwRFpKYjBpVTUvUmgrN2dFT2wr?=
 =?utf-8?B?TG9HWTI1WVp3a2ptY2pBYXZPU1lyQS9GNk4zaTJHc1dVcnJJZG1MZUFhekRB?=
 =?utf-8?B?UFB4VENqNlI2V0pOQ0NlL09qa1I0cTU0bjhUanpxNDFUVGt4WUQxWHFjOXdz?=
 =?utf-8?B?TEthdmpsNEZVSnBrLzdocy83akI2cUN4aUdSbmRrd3krSm8xellTSjBwVitz?=
 =?utf-8?B?MFBCYkpQUkVWNlFnWDhXNmMzTDQzOW5PcEk2di9LQllXaCtueDdIZlMwVkNp?=
 =?utf-8?B?c2ZQM1pFOVF2aDZNSlhRNFNRNmplaHBKTnFSYUh6dER0bEo4VHp6SlVDeEJu?=
 =?utf-8?B?WWhaT3d2QmEzTVhjOFFKeSsrSWJGcTh1dHdMY0pzcm05NlR2K1pTTG5EMU9r?=
 =?utf-8?B?M0EvZ1ZmN0cxeVQwd1YveWw2bVJoeCtobzVzaFhvR01vZ0w3aDBTa3N3WkRR?=
 =?utf-8?B?SG5sQkxMc2hpeE5XNlk5ZER1UU9YUDFPNEoyYmNaYUQ2WDlQWDhNRUk1NDcy?=
 =?utf-8?Q?vvuHBlTQ2TbtQJYm6BQ49wOEGRYLYaHrFGySIzmagqI2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkwrOTR4VlhFcXpEUnMyL0Z3Y0Raazk0TDExUFBOczd5ZW1aOWNETncyRXg3?=
 =?utf-8?B?SUFINmd5SHhrRlN6K0tNZTNiSzlwV0FJWXA2YSsrRUYzS3dPSFV0Yms3SGRw?=
 =?utf-8?B?MmJGODFkaFZEWFQ4ZTlNOVJ5RGdsK0hiQ0Vya283RklDc25FclJVK2ZwMjda?=
 =?utf-8?B?UTVuS2NMUFJhazVHOFVVV3hHVmtFaEliakdMcjNyUXAxa3RvMk1nWVg0ZjYr?=
 =?utf-8?B?dHA4aXIyTEFHcGY0VGJuRlh0L1FZOHhFU2xucVNGUzE3RjVnUDFDNVJPVzVF?=
 =?utf-8?B?dTh3bGpjczN3eThsTVhsR1BJVmYwVHFESWVNSlJTZ1JNZm5wZkdLaGw1enI5?=
 =?utf-8?B?VStzMWJ2bGVGT2w5WDVwRFVqTWwydXlNREU5d0FMQ3Joeit6ZEY4YzJhK0E0?=
 =?utf-8?B?b3VlVmRibWwrMytsaGZsOEN2cWVPTURLejM1TmpmSDdNRWczb2QzSU82azZ2?=
 =?utf-8?B?Z04xMVduMndQeGFZMGM5dW9vcE43ZjF1VGJRNXJGUStmOVMrN3VqMTg2b0Jj?=
 =?utf-8?B?WHhGYjBORHZRSXdjcmc4S2JOT0VyWWlQQnFTVklyRXoyZndCYm9YbnFrSFB4?=
 =?utf-8?B?SnJqb1NZVE5FYWtVaGZKSHd0U0FUemFCZWttQTF6QVpObTJsVU9jM21za1k1?=
 =?utf-8?B?ZXlXWmNQWG9jSmQ2T0NRcW5GdWw0bGxicE5EcGxOQ1pMcHphekpBa3I2cW0z?=
 =?utf-8?B?dk1HM3hFa0FRZWJJNmNVU09TejljUUNteFJhUEgwVHkwdzgrVnpmUFpPMERM?=
 =?utf-8?B?RzdiazJXeG9raFMzU3UyM2V4NFVvdUV3TnB1RmR4N1dBK2picllVS1NqTTN0?=
 =?utf-8?B?VDZxZ0lpSE4vK0Y3STUrWDlCdEk2QmhiWTBhVkRoNjdLNDFPSmh4SXBoc3VR?=
 =?utf-8?B?VnFSanhEZDlwNXoyeitGb3Q4SXpCbHNsVDlYWEV0N2tsOUxPdzc2TnR2ZWMx?=
 =?utf-8?B?bVM3dUtRRitNemdRYWJQeW04cXh6ZUtTc0d3RUxWVU1MV2MvTkQvUENsZ2RR?=
 =?utf-8?B?NFR4ZDFlWlVxd3RxZEdwM1Uxdk5jZjgwZ2N0LzBSVzNtb3RCSWYvb2F5ZDdP?=
 =?utf-8?B?MHhBZ3JDMHp0c1l0TFVTZVNtNDRQaHNvZXIwUnZ6QlVSbGlXY0VyVm0vUmpr?=
 =?utf-8?B?ZUxjZzdpUEdtZEhUMU16ZnJHbTR3OXZYcHphM1pYTG1FQmpUczFCZm8rUDE2?=
 =?utf-8?B?MXZFOVJmd1RHNDVWTENVc0ZqK21kbng3TlRjdm9jRS9zdkpoOXh2aWxJdU1x?=
 =?utf-8?B?UjNxS25OU1Y3TUlUWE5QL2lmUG1zMEJHU2xyMUdCTUJzOVowckVwOG9jZkdT?=
 =?utf-8?B?RUJSQnZYalNvRVVTc21Qa3VpTFI0TjJOSWdtK1BHeEFUQko1bU9JMk9uakpI?=
 =?utf-8?B?RE4xZTVaZzRpVEgrUkVKK0dEdEtQb2ZDTW54R2c2YUlieHA5Tk9IajNXM29Z?=
 =?utf-8?B?YllXRFdMejQ3dU5KYldRalJFUkw3eHcxU1VnbzhDVUowVEozKytqZlBucE5U?=
 =?utf-8?B?QjJocVRUU3pWTFpvM2htTHRGY3MxSkRBT2FNYVRLcUFHQ2Q3Z1VrcDJaVEdT?=
 =?utf-8?B?Y2VkcUErQmlGWWJpRUpwMnFqZGNGQUlOWmdiQnpJUUxhMXRvblQrMUEzb1VW?=
 =?utf-8?B?bjdyL0VHdjlqM3JJeDd4Vm9McjByZE95My8rNWRUNlB6YlFodnhZeGVvOXNj?=
 =?utf-8?B?OG5za0R0aUFCS2dSQnczc2VUS2FHaExPSURtRWZGcUViOFQrN3Jlei9vcVdl?=
 =?utf-8?B?dGYvTFZWSjFOdzVuRWRsbWx4ODlUQ0duQm9GUitERTVxUlpTWHQ5cDVocVQ1?=
 =?utf-8?B?K01tU3lPVWpsbEJuMVdUa2FBU0IxYUpMV0VtY0Z1MDYrUjhRTzJwaTBDc09W?=
 =?utf-8?B?WHExdUZ0N3ZRd0V0cDZHby9iU2RKTDdlTTg1Wkl6WnJKSHBad1NvSm42Zm9T?=
 =?utf-8?B?bVJUZmptSGpUY1ZtTWh5NzZhRncvbXd5UHFSUE0rNkxmWGVsc25UQm5ZWmJh?=
 =?utf-8?B?N3dFSTNWZEpkL25oVVA4QStRai9nd2tpMnR3d253dmpLa1VRSU5UZnNobVVr?=
 =?utf-8?B?NjN4RktBK2lSTTRlNy9KMnNyYm1oenZ0L05obG9pR3RiRjN6eWFqSms0OFE5?=
 =?utf-8?B?MXZBTmthV1JCeDF5SEpXODhrWi9xQW1Gdm15bjZObGNiS2ZzOXVYanNVTFpr?=
 =?utf-8?B?QmxQMFF4OG01cUxEQmdsRGRNQi9oUEtRdmRaanZycU9SWlBodlN3RWtxM0c5?=
 =?utf-8?B?d1dNck5PZ3JlRzNLK0RWWGhpMDQyL1FyNlhzUDdnSndUMzRENVFlKzFzK2ow?=
 =?utf-8?B?TE5tVEwxbFQyV2RTVERzMFNhUGl5OXQ2eFU4YUtZUnljSGRJN2dhQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6d1934-86a3-4638-b203-08de591787c7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:04:33.1260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzHw4Tk8J8rU76GcfyaBiyDmqTyakl3nnsCG+Y07Ffn5zpS58mtFx2Oh8XFdGp/b43H9pRPgD1mSqPRz/Nm+/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8202

Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad for imx6ul,
which input from ENET ref pad.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- fix miss set minItems to 4 for imx6q-clock.yaml, which should be 5.
---
 Documentation/devicetree/bindings/clock/imx6q-clock.yaml  | 4 ++++
 Documentation/devicetree/bindings/clock/imx6ul-clock.yaml | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
index cd3c04c883df4ab02af29582369757df36269cb6..0e6febe1c8750235d0c63b49cd178b8169b48c0f 100644
--- a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
@@ -29,20 +29,24 @@ properties:
     const: 1
 
   clocks:
+    minItems: 5
     items:
       - description: 24m osc
       - description: 32k osc
       - description: ckih1 clock input
       - description: anaclk1 clock input
       - description: anaclk2 clock input
+      - description: clock input from enet ref pad
 
   clock-names:
+    minItems: 5
     items:
       - const: osc
       - const: ckil
       - const: ckih1
       - const: anaclk1
       - const: anaclk2
+      - const: enet_ref_pad
 
   fsl,pmic-stby-poweroff:
     $ref: /schemas/types.yaml#/definitions/flag
diff --git a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
index d57e18a210cc1d8a836b50058613dfb0308fbf11..035002721a3b3b65fe67734e13b686b91539f328 100644
--- a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
@@ -29,18 +29,22 @@ properties:
     const: 1
 
   clocks:
+    minItems: 4
     items:
       - description: 32k osc
       - description: 24m osc
       - description: ipp_di0 clock input
       - description: ipp_di1 clock input
+      - description: clock input from enet1 ref pad
 
   clock-names:
+    minItems: 4
     items:
       - const: ckil
       - const: osc
       - const: ipp_di0
       - const: ipp_di1
+      - const: enet1_ref_pad
 
 required:
   - compatible

-- 
2.34.1

