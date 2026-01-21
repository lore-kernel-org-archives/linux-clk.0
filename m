Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5EE34679B;
	Wed, 21 Jan 2026 18:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018676; cv=fail; b=FTMR0YRw3U/RftAOqckYpIwzdUrd27ZnsSNHlPotCx9dlMgm2WWTkusG+rrArQcBbsvLkmplWStTUI5pCdWu4ThJL8TbAf6Wtcl6O/x56wGhmWmzADNy4wSISZrnbykRhUL89Pq4Nif5BGbgiy9iEufT5iAx27PwLFd2B0Q9Oso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018676; c=relaxed/simple;
	bh=0F/t5/jcci34/23IeAych0innhXpyCAOMVkUfTMjtm0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=W/uORufGGNqyQwRHhshdAboIEDvGFzi1mKCshQx8EOcdi4KMdTAeoXy3LHHjnp+0W9Jyu/txj5yGMg6+yBiKr80lQ8LG5bmrvJ2eeNCTQLgeVFvX3aWd7trm1Q4QhvpK2ef1odU1KULVI5fgek15eJ636DpZLUZr/UQ8EochxcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GfBJ+NaM; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GfBJ+NaM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmI571T3vtM1R2lxDTlUK3CVSIgGBU3gMaAlHgyJcmCBXc3sfP/Bv2bm2GT3IxYIIxQLH+ICU8zgJCktAuMvION+b+MhII40BV9kR7A7svhzQZ6a1yCWtwVOfJp0sYkHe68H5t8NT6w7imFBQCa5OQoWa6DPtVIknlxeXjIp3GSrkLfv9wkPeHuqOtVWsCpZDKtlPi4zNeaIDjokxbwVX89xM/junS7QSJVGhRTn0qhLTTK38OSO9eTadYXDIm8JfXJ7tSn70+JBFY0iPmfK3wGspEIXqiw1sqDfFUkSlc4Aa4tCftN/KhJquGBwn8dI0Bc4eEGWZ3b0kYj/rcTX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foasaG4Lk4p8MnSCXGHXXI1QOlNP26HrHk7CT5sZy7I=;
 b=mR0oYQlD/GN3KmWoNi/n0ZWn2naysKqrHYUYqSksyqzR4k80ti39IKncaMCy/Sat97M5EiH1+HRLMs1Qrk8vtdL1Hu4P4QCETHa5Pi4CetCxvAgvXbhG4G81dPpEE1g2EeKL7B71CETJKeP6/gQbQCimahExyrsOg2WTLcEJO1Weki0WUQeu+K3LOyprfmBE9qpxHZDJD9TBy3JCCxFd2cjABfJD7MMGM5rU1j4QEJClFdil0B28pvQQ6a0+pncVAnD3rXf+RowWBav9/4iS2M4skBArMA/yTE2vwvETEN1ukMYDvld/m0HIUTqcK+Fp4hiZ+eL8rZULotnOUscnHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foasaG4Lk4p8MnSCXGHXXI1QOlNP26HrHk7CT5sZy7I=;
 b=GfBJ+NaMDIfLdQ/SC279cxrTmj7AoSwmDVPJAQR2nlOgBrhXqJaVsF6OU6kM8EEGR2/yc9pla1wDv6vCTI1n/SYfPS8P4Xpfb/EsFyga8TTVdmt7/0CxgSU7+5QViapkOgEpzQIXKorSV66ZAc0/4NneD9PIzw0T+kxDC/ysiz+lpHlYRXjB4/QRW8MBMgnQfLWikS19hSTzrZKLc7Ud1cVFu8zKBXZ1/yWtjB59dmk+krW8iCYTdyG9LVCBzf5lTYGwiLt3plI2PaiG7CsmU34FtYGUvfBo57zH3eromsSzTe9KGCsohzMtQ+sZEBV3EowHMrkcLFRmotTumEfwYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB8202.eurprd04.prod.outlook.com (2603:10a6:10:24f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:04:29 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 18:04:28 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 0/3] ARM: dts: imx6: cleanup imx6/7 CCM related
 CHECK_DTBS warnings
Date: Wed, 21 Jan 2026 13:04:14 -0500
Message-Id: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB4VcWkC/02MwQ6CMBAFf4Xs2ZpupaCe/A9jTNm20gOUtKTBE
 P7dQqJ4nJc3M0M0wZkI12KGYJKLzvcZTocCqFX9yzCnM4PgQiLykhF1Tz1GJnlplOSY5wbyewj
 Gumkr3R+ZWxdHH95bOOG6fhvy10jIOKuU0qTtpabmfOun4Ui+g7WQxL9V7ZbIFgqrSpJotal3a
 1mWD0g7H7PSAAAA
X-Change-ID: 20251104-ccm_dts-504ea501251b
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769018664; l=1730;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=0F/t5/jcci34/23IeAych0innhXpyCAOMVkUfTMjtm0=;
 b=+IWHcmd1bZCEXtHihtnwb49M1dZRXyzd1b9lXlhcbXjn4VjAe3qrT8zmCkLCSO2CWBmN/kkpC
 44Pt4fBxtlKBuA0Iju3/1H2M0baQt984y4VHnixfYLpSPt3I88DJVUg
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
X-MS-Office365-Filtering-Correlation-Id: 48cdbace-50f9-4bc8-1986-08de59178540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0twU1FCYVlxZ1VxMlpMbEtYSFBXLzI2YTlqOWhCWEtKSGtTc0x4NjFVOWlp?=
 =?utf-8?B?bGVhRFMyclY1OW9xeTZwUWVJZmdqTUJESVdZeTlVZWNDTVNOUk4zaU13d0wr?=
 =?utf-8?B?cXlyVDV6ZjRGMitURCt3Qm1TbjRJK0FKcjVTM3RsY2oxTjIrOUVqUVY5WDhG?=
 =?utf-8?B?S2EyVE8wMWVKMG8vWWg3NnA1OGRBYmlaM01YT044YXVKZlI0dERmZjVnOHdT?=
 =?utf-8?B?MlE1VTNxL0xIbHZQcHVYOEVVcExCeGkrUzAzNUtkcy9kMXJJTERGZWtCb1FO?=
 =?utf-8?B?T1Zwd3Z2K0F3QndCZWJwRGFwQWhZU3RDRGpZSTNtZDJ4UWh2d2NtM2UzQmVi?=
 =?utf-8?B?Y0xweFY4WjQxK3FaMC9OSVErQ3dMTDNYazhGSlVkbm81dHZZZU1OUDFlZVk4?=
 =?utf-8?B?OTdnYllibXB0RnU4bGxuUlFCV2oyMkxNajJ0MFR0RXR0TENKYUJQZlFGRDdI?=
 =?utf-8?B?S09wN3V0WHBLOXVnWGwyMGF2OVh6WWZKRUFIQ2loMHV1ZDA4MHV3RzhKWFIz?=
 =?utf-8?B?NzlGd2MzWUpyRDZ6eUJvSitxM01XdGpCV1lTQUlUUVRrQ1hGNGNpK1Q2UG1G?=
 =?utf-8?B?cmkyNStVL01rMzhOZkV5Tm05OEV2TThZQ0wwVGhoenBxcW9OeHFGb2xNeXJr?=
 =?utf-8?B?QU5HSXYwY0hYK2FIYXpYNy9yV1FiS24vbDRJMDlmR0pIK3hZRHlhMGhKNGlw?=
 =?utf-8?B?VkZWTWFRbnlPbHE3aC90NlV4RHZMcTUzeko2WHJjV0VyKzVVT3BWdDE3T3NB?=
 =?utf-8?B?SU8zM3VxMVB5U2YvSnNTcUhjUlN5ektDallNUUVXS2lXamZmWEZJbDY5eXh0?=
 =?utf-8?B?ZGJZdmZZaUZOTWRJUXcwbi8rZFVRVnFrVG9OUUpmbVJKcTNZRS9qOUdBdHdG?=
 =?utf-8?B?Nno4aXZIZ3RUU1c2OVNjcjFiSW9Zbk1nN2kyTzk2TG5GNzN3aHBvdGwxZXpm?=
 =?utf-8?B?V1hmRlpmbnEzUnVjeXh0dFY4QVlOdlRyRUJwTm1xa2t0WU4wWmtVeVBRY0pj?=
 =?utf-8?B?akpwazQzRHI0ZlNFSWJRRklvdHZHbGJ5R1JkaVRJOStaclFZdHF1SExpem9o?=
 =?utf-8?B?YktrMit4R2xZVGVlZXpsZkpUdlgwUnNXdUNKajNEaElVdm1nTVh4VlVMbitt?=
 =?utf-8?B?bEhDQ1FzR2g5Yzh6VUdEZzM1aUw3eVR6NEtlY3JrOEJUQlUyK2R6Zk16MC9R?=
 =?utf-8?B?bVdZSzIvVCtLSkZ4OWJGeWtPNkpXbzdvaDJtT0tra3BULzVOUEhOeXIwSG9L?=
 =?utf-8?B?UFNIZzRNZno0YW5ZWW1sYjZVSjlWWUZkalZBbXcwa25lMU1TK0NVMzF1Sk5F?=
 =?utf-8?B?b21YSlZDN3E1aDNmVmQ0dFNqbWlEaVFhWVkrRUZGWEFpRnZaY0kwVTdPZzR2?=
 =?utf-8?B?VGVlWWFhV01Nd3kvTWZVYTNsZC9RZGd5azZyc1B5Mm1Xdk1ieDNkc0NpZVo3?=
 =?utf-8?B?ZjRLMUZ1WjB0eDlpcENxZG1rMXE1aXN1RExsV24xVnB1c0k2Ty96SlgvS0s2?=
 =?utf-8?B?YWF6cGpLZnBua0tOTElFcy8rNHJLUTZ0OTNqd3VzMHhXVjZ4ZjcyNUlnc08v?=
 =?utf-8?B?aFRPWm50aS9LbW5VckNjY01rWHlxcVU5VzJDNXhxc2Z3REgwRUd4bnlrRFMr?=
 =?utf-8?B?MzZCYXk4RnRQS1k5T1VrRWtmTVNyMTBzYlhrTVR3bk52a2VOZlBJVlVaUjQv?=
 =?utf-8?B?UStMdDBKQS9LUm1oL3VxWFY2UnRTNlZBSnowZit6TUtXdlI1UldqUFJieHFu?=
 =?utf-8?B?QldEODRsaHBzRDEvNlNxOVdYZHF4M3RWQS9mdWttRG8vRHVoUjgzVGluYzFW?=
 =?utf-8?B?T2RNTmY1ZTNGcm1RMGRHcmlDTExQaDRHOWZYcUdvYW9KSnZhQkxiM3E5N3BX?=
 =?utf-8?B?QXhZZDA1MU1Zei9xUmhsdW92TVhlMmhzY3FxVVhzTEN6S1JUbERzRjc3R09V?=
 =?utf-8?B?RHJoS0hxcEo3Y29tSmdMcjJkMGJlV1JKOWNFbHEyTzVOaEppK29CVUhwbWc1?=
 =?utf-8?B?V09LMTFLdTJFbEhHanZFS1BUN1JLZVp3cHorbjVqMUxKdzZnTjI4Y2JuSUVj?=
 =?utf-8?B?MkxjM3NMa3RpaS9wc2NyaXNMRjBoTmlqUGpZZlZ3VGU5eTlkMm84WHozakZm?=
 =?utf-8?B?WXJxeS95ZlBVczQ0YW5qN3o0VXVoWnN2OWZPQ2kycG9QbnV3VmJVYjd5NmNF?=
 =?utf-8?Q?NVh1GMIwPkUCiCSPOXRHyClU4FNZQr89KLIPzQFsT+tW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0FPNkFOWWFTemhRRWJ6ZXpwcCtzRVJnb0kwelVQRFhvNk9VQjlEb0ZPQU0w?=
 =?utf-8?B?eWpvZDB1MFI1R2hLdjlzMS9kNXVBelM3M3hkT0RVUDF2bUc4T1pFMmZKbjBm?=
 =?utf-8?B?VUErV2xsQjdpRGlna09wb042Yk9Sa0QrL3pRU0xkalUwUWhvdEVlNEdhcjd6?=
 =?utf-8?B?OXV1MStZVDM4RUZ5eCtlQUo0RE1QcWZtKzZvVUw4Uk1UeGc3KzlBejBhNmJC?=
 =?utf-8?B?ZlhRRCttNXdmOG41clBPODM2ZFUzNDM4Y0M2bThMaTVKU0tOVmJDa1l2VXdj?=
 =?utf-8?B?a0lwNVIzYWI5UlhpOGJ0bU9ZMERUenVkQW5UTExYMHVMaVo0SDN5UU9lMEll?=
 =?utf-8?B?Nno4M3EvZ3A1MldPTVZiRWU4ODNiU2wrZEllQ3RHYlJDazJGR3pUTzdhV2xN?=
 =?utf-8?B?RjJFVW9QaGdOMlZxa01PZ0VWcUN1WFFqRGpTY1dGWDZKQTBneWdndDNSZjJR?=
 =?utf-8?B?NUp1bHNxTWF5emllUElITzg2bmxWZjRzeWEvcmJOMXdZbVJvZytmZkJ5OC9H?=
 =?utf-8?B?ZnQ0ck1zRjNjQ1FadXhuaUhtZzBVQXRpSDFETWw2Zmt0SitQbUFZQm1sc3BB?=
 =?utf-8?B?d2tkVkNNQjdWdDVNZmJEdXQ1bzRYNUpjT3Y4MVZPUWJ1aEZwRkV5ZWdrbjd6?=
 =?utf-8?B?Ukh2MXFLQmtJYjFSQ01ReEpBNHpza0FnSUZwYm0rSnRNdzluNzFWZmxNNGxz?=
 =?utf-8?B?dnI2ZlJ2ZTh2L2VJdFp0Qk53RzVNd203a1lSN2YrQlA5a2k1clZONTJNMWho?=
 =?utf-8?B?ODcrSjF2WUd1a2hZakZqcER0K1I2LzJobjM0ZGdPMjVLYXIzMSs5Y1ZuNWhB?=
 =?utf-8?B?emtDakREWVhnbWIyZkgzbnZJa1BuUEQ2aHNuTk9USTJYZzdDVTB3ck1Sdys3?=
 =?utf-8?B?UnhrVzVRbVZNY0dlYVJvZXpTb1FxdUdHdWowaGtLdCttSTNoVUo3Zzh3VVJp?=
 =?utf-8?B?WGdUU2NseGNDS0NHdmpSa1Vpak5sYmlTT2FUSjJMaVpTY3BFcnJmdmIzNWFY?=
 =?utf-8?B?QklsVVh0bjJ1VEZJVE1VWS9JZTNhbmxlb1lTdWptRSs5cFo3Z3dPOVA5ZFZZ?=
 =?utf-8?B?eWtvUm0rbDRwa01lZHQrNmNOb0l3MmxxTG5xRXdGVUVReHpiVCtlZjVqMWFE?=
 =?utf-8?B?Mk1wbHIzcW9INnNLOVdnSGRiYURtVWRxNnpFWXM5aUxPUnlhT2NVcGU4c2J1?=
 =?utf-8?B?WnhndzhVWEVlNEgwYXlCL0d6blVnWGM4ZjJFQ2l4RjZ6WW1FaEh5YzFyY1A5?=
 =?utf-8?B?Y3djdGQ0N2tHMU1sNmY4NmhLb1hPeHY1VnlQN2t1ZW83MEVUeEk1UmxSYWps?=
 =?utf-8?B?VWlhMmFFWHJkRzRvMS9MMEp4Q3MraTQyeWFKK3hYWGNnMEc2azZ5ZFdxYXls?=
 =?utf-8?B?QWZJa2N3UWorbzB1bm16bE1PWEhxM2tLa0E0RWhhS010Nzk1dUlPSlNQRzFO?=
 =?utf-8?B?S0NtQ21kaXduU3JMdTFtSzE3WW40Wm45TDBxa1JQa04yL0l5VzhxOHA1VDdq?=
 =?utf-8?B?OEJKbHpHSWRMOHU1K1RQNlFVbmc0UmppcWdpV0JmdXRuNnV4UUR4UTlSZFoy?=
 =?utf-8?B?emMvMkRjWUhOZkUrdUQyTjRLVzlxRjJJTjRpa3F1bG1UL1hOMm0wcTJxOHVt?=
 =?utf-8?B?ZDlJN21mcURWUmlsekozNEQ5NlVpTXNWYkw5d2Y4TEhleko3SElERFlXNjMz?=
 =?utf-8?B?a1djQlo2QURNcXpTblE3WG1ocTZzYzZ0TzVDeERQbG1VLy8wVnFGWG81ckQr?=
 =?utf-8?B?RUNuVi9XSVdiNTYrQ25hMzRjOTNSSVdkbzVjUXl4Uml2WWgxdEhxeFR5TDVU?=
 =?utf-8?B?KzNCYTF4YWlCNndpbTNvTlV1QkJWWjhkbnRSVC9wNXdzUXcxbkJ4ZW1xbXJT?=
 =?utf-8?B?UTh4ZUlYK0pjOUlYcVh0YWRycE8yMXB4a0dOaGNVMUE1OURYQmczdXo4Tmxt?=
 =?utf-8?B?UnNQbDF4MDZNK0NEOEZSQUNneDQ5dGg4SEo2bDVuZGdwTkFjdm12bE1TcHdV?=
 =?utf-8?B?a3AzNHluZGxSQWtteGQ1cGdDR20yVTdvRDM5Vi92Q2JLTkxJaE1QNzgrb2l5?=
 =?utf-8?B?OXRYWG1MYWs5MHUyamxyc0tUbWpsdnJrbEpWOWZCSm10YjZmdGlqWjh0THVC?=
 =?utf-8?B?VmMzZncyMC9LcjAzYkZmVDVPWkM0dkdONGxqSWkrVkZRWGhDejBzY0U5bjRD?=
 =?utf-8?B?Q0diS2tqSjl5NXMzaVZkKzk0UVdSOUI5Y3lZMFdiS2xXSnJWVzJxNXE2VlJH?=
 =?utf-8?B?Qk0wYi93eHBxd0QrVnI0U1laRm44eVFDWWJsbHFqN3BiYzA5Q1VLVUVqYjd5?=
 =?utf-8?B?UUFuUlpORC8rYmVyT3hzUlBZdldYeUJ5Q0tQMEVqVzRmbXZCbUJaQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48cdbace-50f9-4bc8-1986-08de59178540
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:04:28.8834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvVGcjgILiGeUzc7jtmcaffmvlDruUSs8T811i4CRXl/htY4DDDqlcQnwT188p6uZGcn8zNlsKDitxsbXXfwQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8202

cleanup imx6/7 CCM related CHECK_DTBS warnings

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- fix wrong set minItem to 4 at binding doc.
- Link to v2: https://lore.kernel.org/r/20251106-ccm_dts-v2-0-12fa4c51fde7@nxp.com

Changes in v2:
- rename enet_ref_pad from enet1_ref_pad (only 6ul use this name).
- Link to v1: https://lore.kernel.org/r/20251105-ccm_dts-v1-0-6aadcdf97cb8@nxp.com

---
Frank Li (3):
      dt-bindings: clock: imx6q[ul]-clock: add optional clock enet[1]_ref_pad
      ARM: dts: imx6qdl: add label for system clocks
      ARM: dts: imx: add required clocks and clock-names for ccm

 .../devicetree/bindings/clock/imx6q-clock.yaml         |  4 ++++
 .../devicetree/bindings/clock/imx6ul-clock.yaml        |  4 ++++
 arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts            |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts  |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts            |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts            |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts            |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts            |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi             |  5 +++--
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts            |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts             |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi        |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi                 | 18 +++++++++++++++---
 13 files changed, 44 insertions(+), 23 deletions(-)
---
base-commit: d1d799fccb5002df8cd355c0a849cf4efcda4ac1
change-id: 20251104-ccm_dts-504ea501251b

Best regards,
--
Frank Li <Frank.Li@nxp.com>

