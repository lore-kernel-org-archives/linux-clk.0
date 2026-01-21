Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5877A352935;
	Wed, 21 Jan 2026 18:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018692; cv=fail; b=tj5nDTDCAQGFKQjbvNZVuAKuCBKCF5Z5sepX0g/9gMWwJ/V+tfR4AVSWnxcCJ/4rY21XNw3XJuT8l/eSkAfQt37pTEn3JvN+VHexzhTCLJ0sqi0W0kh+pBRSb5R8vDkqsE5u6yB259VCzbYDNQbe54t/VXIPPu2PAFqHyD2ymVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018692; c=relaxed/simple;
	bh=lhT2vXtUAbuVxSdVz4i2QyO+V8jXLBnb3vIumD0rNXo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DKbCZA1G6GSlHrgucecFo8JUYub9QF7vwU9o89hIIzfCIctqTxDkGPXXEOsmVmOkDgLJmGKcEOKWRLmI0XxfAES4GkQvjUTzLx3GW8/Q6ZN4nsb/OYk2K143yq1HXi6UPj7M0napTp/QxVhf2B9I2zHmvT/G+0ICLMOUUhZUUSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CTRRg7ck; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CTRRg7ck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdRz7H56vkxjmeP86RIYTf5LsdNYsvk0mX2pbfRf2l+6XfXJbRiOknJ1691YBaIcGfKD99X0KzilQKOekKuH9n7ukeih7Svkcw/8CV1Icw6lo65MLOA3MmO8U3AY0TEt3cyFjXxKnL+8XjpbSGOfaFlZcOCRpvyy5ko9fJwHlJH0vZi3J+IggJVA7XlAAJIgreMOKF1YMtO3sEiFTXfOE3rqFsiEAXfYiG9d3+SPTPVQxmrc0pEMxD/QFJL6UAN+j6q6gfyaDRHucnnSS55VmjIarwVAIHXa3qOgPhocp6eFaDmVYCqsfKp75RWIAv/HJZ+ZcO+WcMTyZtFjnzc2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKeNxEDgcn69qsIh/uHBhQolHnILVbREU+zLwKOtvL8=;
 b=mp84gIPWp8jXxVW8qZKfFe8+K9uCnb/SmBh3dJQ659F62JksUmwmGxegHSycvkgrI168BlM71e8JZu2AP+Of8g1Y9FpW7hp5dsFawyHZn5IG4fDJ7OsjWXxXPTFTxW9t+5yOGP2zQClZohICh4fQBbmAvqi2OIzxc2e61oZrs8VZVlaVRy9CP3xbfnV6Z5AT8zObUpRmyl/np4D5SLGO8UP2t3XaGAt5OdrJzKRPpQ72SzUGUnrTz/mO85WbUbC8AUdtUstGdqr1uwkW4dUfF4MebJb5eDKD7eCnIlJxQwqkiQbtHzeTPpoCY7Yiy/9C8wSmsxH0pRYPGPMXe1yQ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKeNxEDgcn69qsIh/uHBhQolHnILVbREU+zLwKOtvL8=;
 b=CTRRg7ckxeLGDsxC3XKFNab1ZTiaQpeAnpIzpw4CkwN9AaEbNWoH/uZi0rju61TrkEm6wAQsC99F0yNUl1C9nkLiR/L3K08r1xACeHMBQk6A9wA+FxW6a59GSySwhqen/9ZYttDyS7t4W5kkTqY4YuxYR9Kkuj8YEfTNT1gwnXsuNwJDML3/CDuCKffXD6Aeu3L7BO/RhHkljknuOh9emZiK/YeDGCEcBpR9D0urCfM6Ejc6SOhjxXkSIwNqbEvvcEvtieRM8oAzk7CBOF01g3Zhklwaziuj5bVVfJPrHlbqUIQp9T90xy6kSIHaNn2q7gwitcRqFIsIgmqMqz3ZRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB8202.eurprd04.prod.outlook.com (2603:10a6:10:24f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:04:41 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 18:04:41 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 21 Jan 2026 13:04:17 -0500
Subject: [PATCH v3 3/3] ARM: dts: imx: add required clocks and clock-names
 for ccm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-ccm_dts-v3-3-820ce9b5fa38@nxp.com>
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
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769018664; l=8065;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=lhT2vXtUAbuVxSdVz4i2QyO+V8jXLBnb3vIumD0rNXo=;
 b=desrajjQpDCF/a31ujMVtfLsfDjhoz08FPGcicyeNsE7lChFU3EijPXj/YjkKhamSxP4Bn7+/
 ZONdFmB0iFgCLrQi77O9qWRt8ncnVIzvwivvf8XOzj7H/gOGgmCwkF9
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
X-MS-Office365-Filtering-Correlation-Id: 292fd94f-7e5a-4866-46d3-08de59178ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFM5VjNzSFpUWDhBUmN6VzlnZ1RCMzV5aFdFVDJMTllWQVJEMG9UU0RhaHpq?=
 =?utf-8?B?eDZMajd6KzAxTFEzbEZqTTh6bGNKMVVraGVWQkxTSzBhdXBzSWRoQUtLSG9m?=
 =?utf-8?B?OHdJZHJEbFhjY3F6czREMHhHZEhVZjJubUhudmZBcnBHWUhQbjJ1aGoydm1K?=
 =?utf-8?B?SXk0UmMrdXFYakVOVTh0WFU3N3o2ZS9yR3FZVVBjUjJaZEIvN1kxNDR3MmNo?=
 =?utf-8?B?R2IrVy8rbTFXSWZTUVJLQTVXMy9RQkZiUVI1NWxrQmV2VzBWakgyTll3ZWMz?=
 =?utf-8?B?cGZSYnUvVHBMeFU3cjVXbkVPWE56RHlXWHpzK0hVU1kxZ1hDZ3BrdEZtd2N1?=
 =?utf-8?B?WDM0RGo1UFZNYWtRTGl1R0FHYnBEeVhnaFhVcW50OVFmanhzNUVQdlRBVlQx?=
 =?utf-8?B?aWJvRVh2Yk5xVmJZdWJjdTNETFk2OWIycmYybHUyTTJCanVCenBCS3ZaNHZ1?=
 =?utf-8?B?bndGZkl6eGJjUnpRV21Zc2MyMnltYTQ0bncwUEpKZjBxcEpCMVZOWWVUdHVT?=
 =?utf-8?B?VWRqVzZ3TWVhQlp4WlNkOVhVRjJmN0lyWnNnTXdXd3dKWjQ2NGdEUTd5UHhr?=
 =?utf-8?B?a0VGQTNQR0luQ0MyQ0YwTHp6RmZnU1g4b1U3Z3JaRnpaUTlJQmdpL1pzOFJj?=
 =?utf-8?B?dmU1MncvLzY5NnNqUDU3cm9pTE0vTnFZZUFxVGVYMSsxNC9HcWFXWFVwbTFn?=
 =?utf-8?B?Sk5yMCtZSTRKcmt4eS9zNEYwWDZ0TTVuejFJTVFMdStyS0VpdEhjZ2VpcGRF?=
 =?utf-8?B?MUtCUHBmL3hwaUxqSlZyd1pFMHFuekJHcU9Ja0Fmbjc2QkhNVXYvZjRaQmFV?=
 =?utf-8?B?bXZ1Z2tmbFg4SldENFhtNXo1eklBaFJndmRiREFJZ3g5QXJGWEc1NXNxUmNR?=
 =?utf-8?B?c0pIVGhpZURFRlR4QWJtNUs2TGdWK0Rmelc5ejdhR0hyQitHTFZYTWsxQkZv?=
 =?utf-8?B?TWtseGlReEhzaGtkdXVvWWxCSWVCMjBvWTU3elZKbXBmUlNlOFo3V2ZEalNy?=
 =?utf-8?B?ak1TUUp0UnVvYlhxbEdYcXFIblF1ZzY2OEFqYmNINk9FSTNBeDhyNzJVSWFN?=
 =?utf-8?B?Sy92OWgvNWpmL2lNZDJnMGlmaUdlVFN3Zkg3MyttT2NzNThtUnFCRWQ4cng0?=
 =?utf-8?B?S0tFSnVRS1laV05BbE9peWlWU24wLzJueldxdGlqQTY2MEx4eDh5dG1wd1JB?=
 =?utf-8?B?V1pCb1V1bzFBRW9DSGNkRUlLSGV3Z3JjMUZLOUw2TVJMUEd0YnZIcjZOQzhN?=
 =?utf-8?B?aTFnWDIwSXh1MFh4RVJqUEFSdm9lV0VFUStDZVd3YzViYy9IaW1OWlRydmNC?=
 =?utf-8?B?aW9WZnhpckE0TFcrdjN4YUFiN1JmZk1IUXVWVkwvckFJU2FPMFlrb3JNcGlH?=
 =?utf-8?B?UHQ1ZllxK1N4eURkY2tETVhldTlHYUFuT0pBSDZFeVk0L00ySkVPSStCenVY?=
 =?utf-8?B?VVJtdENLbUZtNmI3ZTBHSHdCWStBTjZkN3hYM01ZejBYRTErMVEzTUI3SzZz?=
 =?utf-8?B?OGFhOGMzU0VNL25HWUZySHBvSTk2QUdhNW02WHVXaEJpUVpIUEVrcU5GUXBM?=
 =?utf-8?B?VHU5dU5zK21NQmtDMW5kZWVjbWpQR2ZkWEd3Ti9vM2ZUVGhZanlaQ2QzdU9W?=
 =?utf-8?B?MmFUalFvSEFzY08rMGkvM0gvbzVvZmxIWGRKc25sSkZlTXVqTERlL3FhblRv?=
 =?utf-8?B?N2ErSHB0UTNScnd0TFQ0dlhHd0FTV1dmME94RWJVSmxoazZXWFhPTDZjZTNu?=
 =?utf-8?B?Ykk0N01rWmxzYnhpakFMSlJmdVJtejdhVktXcGJHc2VHRGNueW1RZlF6SlN6?=
 =?utf-8?B?VmFObG4xc2hXUjlhck9IUEk5ZnVIandWUzdXMUloSTAwYmY1dFVCSGxZeWtO?=
 =?utf-8?B?MmpkRjE0T21FQThzNGU5Q3orUWxSWTMrbXV0bGZKL0J6SEg5U2RYcndsR252?=
 =?utf-8?B?OFhLTVR0VDF4WW5WaHU2TGxZZm5BbmNIbnpWV1Z1ODRTWjJCdE1Sd3ppT2Fs?=
 =?utf-8?B?YnlCWThzWkozT082b3BaUkQwMW9UZlRVcExHdDBGQkdOT2tCc0RCWEVOay81?=
 =?utf-8?B?SUF1aCtEdnB4bk9iTTBrWWNMZzBUajFjQ0xVOE9vcVJlUjFpVElEYjJMUkE4?=
 =?utf-8?Q?Y/7sNbRUrTpTN7lbrxroWrG7W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em1qNVJ0SzR1YVdxTnJRQU9FWFNlWWNlcll4RmJDSlNCMnE1c3Jqc0p6bE5X?=
 =?utf-8?B?K0dNM0pLb2U4UnlmQlVpSFh1RDkzdW5YdjlLdGNHZ0V5OTBOVWsvZUU0SHI4?=
 =?utf-8?B?NG42bjdDZEcvOS8zV2Y2Mm0rZmhDeG1pSDdCcUNyRllMN2l4R1FGUkdSRThG?=
 =?utf-8?B?WnJRQWM4UjlkQyttZWdCYktyU2xZS0RMQmVVN2cxY2pHTVNYYXpVNnNabUR0?=
 =?utf-8?B?Mmp6SUhpdWNVRllkNlgrQk9zMVBBckFzeHVWMEYzb2xzWHRjRUlCUXdaS3JZ?=
 =?utf-8?B?S215K0JzZ1NuL1NjUm0yaytUZG1XVHViZGEwYlVLRjQzOHlZN01ValMva3ds?=
 =?utf-8?B?UTZsb09kQ0VjVmM0enNuUk9FaUpLRWJ2V0ZuTCt6dVZHU3ZVUGx3cWRXTUhi?=
 =?utf-8?B?SExCVWczU080ekQ5VFRxWHhkdnd4RkRQZXFZb1Q5blltOFFNbUhPcHlxS0Q4?=
 =?utf-8?B?emxPaEwrd1FwYmZFclRHSXBpSUZZVmdNTmZGZ0k2SXJDZlV2YkVXRnRhWUxK?=
 =?utf-8?B?ajVYL1BzRVJVOGdsb2NGWkJzMkQ2SkRtUGJpbzdVeThLSk13VU1qTVNndXJ6?=
 =?utf-8?B?MjFDTWFNMm5UY2RXem9sdUt1RmxDUng1ZTNSUXpnMEZzT1VWYTVqN2RyNUpM?=
 =?utf-8?B?T2I5RW5rYk9aSzhRS3JyVHcwUloyVnVCQUpUdU1CMXNxRkkvV1NzcVpnWGxR?=
 =?utf-8?B?azVGa2ZZVGZJaWxuckV4K1lDZm9QUy9Gb2UzaW1EdjlLOVNwMko2dGUySUZ4?=
 =?utf-8?B?Tks0Tzc0c3J4SmxsR0RSUUtPdEtVMVdnbTM2bUl0WFRMZFpMb2k3eS9GeDVa?=
 =?utf-8?B?M3NsWklXU3k3S1B1TmVlMnZtWUt2cHltVGNiQ0NlTFI3aVdpZGNJWGZxcmEx?=
 =?utf-8?B?S2tvaG5EMDI4Qm9YTVZqYlRacStQNHJuODAyeHhJc0JDNWpQdUVRZWQ5RUhL?=
 =?utf-8?B?dnoyTW95UGJCYjVxajh6YUJoczZpbGZUbUNUenBDYzJBQ2F6NEsvTDA0YWha?=
 =?utf-8?B?cENuVVNlVUdDdURWci9NdzVHaXdoMWNBOWdncGpBS0Z5clJIa1NNWjBCdTlK?=
 =?utf-8?B?YWFueXNYc2xndzYwblZiZGtTNVFCRUFzanFmSUVqZjJlR1BNNnU5aDlRMDNj?=
 =?utf-8?B?NktLdVJLY0JKREFHSG1QdTdZTy9zSjJSVGthR1lyRVhuLzFlS2k2SFJ1Ym1a?=
 =?utf-8?B?azEweVVKK2lNRDVESmxmUlZqcGJpM1RZa3F0Y0JsQXJYbERrUlRIMnY5R3p4?=
 =?utf-8?B?MVJtZ2thZ0NidkVSM2dsbWNnK1JWS1Z3TktHYmgwTWVKWjgxcUJKQTNVcTZY?=
 =?utf-8?B?SW40blFaYkdGVW5hcmRhYkJic3M5VTQvT0tKYkVCemUvWnVGUGpVNU90VlZ4?=
 =?utf-8?B?MFZOUVFpT2xWYUYwcDlRbDZlYVk5RDVza1djWlJtZTRBTUZnVE4yS3BTR0hs?=
 =?utf-8?B?RFNaVTVIeXVLQUhuWDhvM3drWkxwTHhIQ3FXOHdaZUhRejhZU1l1NTMyajVX?=
 =?utf-8?B?Uml6Q3FkU3VyNGJnZWcxcTExL0prM2tYeStwWjhrLzFNMnhEU2NkcU11Zkxx?=
 =?utf-8?B?UUdRZ2E4bkdxWU9xVmw5NE9OUVFlZVhDWUVqRzBGaTB4b2RpcXhYWUNOejgv?=
 =?utf-8?B?dDR4S3RZZkl6QngydUdJQzhraTBVQUttL2VYK3Vtc3ZXa3pqYWxza1VrVVlu?=
 =?utf-8?B?Y0k1ZFpRcG9Gc1hpVU9FYjVnbTZ5ZFl3eU5ERFl1ZXd5Nzg3ZW5wcmh4Z2xU?=
 =?utf-8?B?QXJlOUMyb3EvbWZETWUxdkthdjVMWDBNS0p6TkFlK0RqRTV5dDhhak8zUDIv?=
 =?utf-8?B?NXd2S2d0c250azlhVmw3YmY0UU0yMFZUeXdhV3VwY2tiNEFaME5DTURCUUNS?=
 =?utf-8?B?dUlQRXp5Q1U1L051cERVSTdwK1h4S3l2Rld2UlY0VFhVYmRYZGxLaW52bFdH?=
 =?utf-8?B?ZE12NHZVYzZZNUdQampYNkxHYVB0V2hXa2hlTk9EK1BRNWNxdmZ3aXRqRmJy?=
 =?utf-8?B?M1hqa0NTclorZHJLdkRMdHhOc0dyeldpVndSYnZlb3VLdTVYQjRqcmJGamJv?=
 =?utf-8?B?bk1rY3lBRW1OMDFvU24vMkRtcG1VTmQ2SHFPK25JMC9GU0VXb0U2d1g0c1Fx?=
 =?utf-8?B?QTBCR0FJZnVycWpORlJVRGoraTNiak9qN2xPTHZLdHhvT2dIZGlvZmVYdEJt?=
 =?utf-8?B?eXQvZytrdXF1TmFPNUQ0UlF1M3NNdjZ1anpnZHlKLzU2b1NmSk5MS0V3Nm1P?=
 =?utf-8?B?L016NkF5UDYyUTcvb3p1WUllRkpiWUZYbktmZEt5WWZwRjh0ODFXRUtDWTFL?=
 =?utf-8?B?QTNaNVAyMURFT3VoQ0J6OTRnY3l0dEFwR3VOY0FvdjlVOVo3aDc4Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292fd94f-7e5a-4866-46d3-08de59178ca8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:04:41.3632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TioE7CwUxHq+ljIQB/LeLyjQJQ9za+NHAMInF6VLNRAwfbe0Vt/RV3fErl6w+pKQGXErGz9yBDPb8pVxOCgNwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8202

Add required clocks and clock-names for ccm to fix below CHECK_DTBS
warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names:0: 'osc' was expected
        from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- use enet_ref_pad instead of enet1_ref_pad (only use at 6ul).
---
 arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi            | 5 +++--
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts            | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi       | 4 ++--
 10 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts
index 9bb36db131c21956a33f0a5a013c5bb4cffe1890..aed4fb7843e2f2a5bc57499aafd3431b582437dd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts
@@ -193,8 +193,8 @@ &can1 {
 };
 
 &clks {
-	clocks = <&clock_ksz8081>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clock_ksz8081>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clock_ksz8081>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
index 5ed55f74b398f24a69245dbf88f5c93ee0d347d8..5f61eeb9fad0c590e778d82d42d201fc2b0a7c3f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
@@ -66,8 +66,8 @@ &can2 {
 };
 
 &clks {
-	clocks = <&rmii_clk>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&rmii_clk>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&rmii_clk>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts
index 47a6d63c8e04cf28795310aafcdd3b2b05740830..9bde6546255825ed871aaee592347e23da4d4141 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts
@@ -119,8 +119,8 @@ &can2 {
 };
 
 &clks {
-	clocks = <&clock_ksz8081>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clock_ksz8081>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clock_ksz8081>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts
index 84f34da06267ebd477fbe71b465a44ffe5b4c098..69e790ba56624ee8ee8611ddac5ae3c9585a5c2b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts
@@ -101,8 +101,8 @@ &can2 {
 };
 
 &clks {
-	clocks = <&clk50m_phy>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clk50m_phy>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clk50m_phy>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
index 0ef24a07dedf986efdf4ce8ad4032814752e7271..fbff77944ce327f390abcabde638f4162d45eadf 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
@@ -199,8 +199,8 @@ &can1 {
 };
 
 &clks {
-	clocks = <&clk50m_phy>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clk50m_phy>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clk50m_phy>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
index 2160b71778355623a9f124975e2cd4dfba4be900..dcd5a4099c602d03704c35860f4d6f0beed1862d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
@@ -294,8 +294,8 @@ &can2 {
 };
 
 &clks {
-	clocks = <&clk50m_phy>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clk50m_phy>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>, <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>, <&clk50m_phy>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
index d5baec5e7a7824c05ca64c36a1839efff0bd7f71..fb674ac2c2485a818ae593c63388bcec548a100e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
@@ -71,8 +71,9 @@ IMX_AUDMUX_V2_PDCR_RXDSEL(MX51_AUDMUX_PORT1_SSI0)
 };
 
 &clks {
-	clocks = <&rtc_sqw>;
-	clock-names = "ckil";
+	clocks = <&osc>, <&rtc_sqw>, <&ckih1>, <&anaclk1>, <&anaclk2>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2";
+
 	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
 			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
 	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL2_PFD0_352M>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
index 76b0007d20ad22eee738ab40ed126435a8fd17fd..18019a6bb3af07c43730ef60f884fefd810553bd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
@@ -160,8 +160,8 @@ vdiv_hitch_pos: voltage-divider-hitch-pos {
 };
 
 &clks {
-	clocks = <&clk50m_phy>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clk50m_phy>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clk50m_phy>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts
index 0e02e448db1085e7f508e55cd55d4441d2f51a54..5ef1ce80869914f8866cf71e79dc1b3d54d56f5f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts
@@ -57,8 +57,8 @@ &can1 {
 };
 
 &clks {
-	clocks = <&clk50m_phy>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clk50m_phy>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clk50m_phy>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
index 131a3428ddb86796ed843b46cbae12f5d095b2f4..894e5c28b2ac036cc29a2d23d4c6451f0da9dff4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
@@ -238,8 +238,8 @@ adc: adc@0 {
 };
 
 &clks {
-	clocks = <&clk50m_phy>;
-	clock-names = "enet_ref_pad";
+	clocks = <&osc>, <&ckil>, <&ckih1>, <&anaclk1>, <&anaclk2>, <&clk50m_phy>;
+	clock-names = "osc", "ckil", "ckih1", "anaclk1", "anaclk2", "enet_ref_pad";
 	assigned-clocks = <&clks IMX6QDL_CLK_ENET_REF_SEL>;
 	assigned-clock-parents = <&clk50m_phy>;
 };

-- 
2.34.1

