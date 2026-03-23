Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2CD382F22;
	Mon, 23 Mar 2026 22:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306030; cv=fail; b=VqYvpCl1rH6xry5/5nKlFCrUgz08jPfTH98bKKXBWhnTyluDdzlY8DupulSCpz0YO3RZMApgwo3p0ONN0+qk1lPkn+O6tykz2qJHQp1rHZhPodwmgM8lC3xjG8SioIlnQOWt6RDW9whpzX9DN81+KcG5pbpqGT7CfCycD53F9sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306030; c=relaxed/simple;
	bh=d0klPy+EG0hWuwcd9csu1ewyF+4Y61sSt3WhYj1XV6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NHcDXRTZe9YIrkYZNUQvv91X8hsPy2q4joTFh6gbE1pdYfb4OqMX6BF4yS1kPLNbW6WPQakv2/3R3LrrSjjixPrRKjPyCe4b47nuhneCZ21lfsH1BtHUZ2d0QP3DZhV9kOBkReLaAyVr4HO7VfzT2NZksa5QBeJRP3jQ+hWCSvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HRMyXin1; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HRMyXin1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OA+VUJjvJdeyJiCeRpoBOm0n6XAoqe1E467bAi/UYoNVKyy8h9X22H5aWx/2VJIah/kjS3egCfQB4hlgAZHMyzHqimDIg0twm0GylhV4SEOxg85USaqffmzvgdf5ba+E046lRT7tjglhcVaXpbSv1v51BgkQtKBs/mYmtLJgxCruyERc38/+TPfAoOFWsrw73joNfriXam/a/TZ3KniOC0uXpuNNPA/FCSa72lFvXUY2D8U8490niRfLCz7NhMDJPsr79iIGz46DRTcsukujveUa1OJDfrbFYXexZNUloZQsFD5apJUAZyVYBwjWtvl/5f/UEsaLMK/vVyd88YvVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnBS5d8Af0kdj4K6dk1dnRPW2O5zdnxrbpuFLKgUYMA=;
 b=Iv9x+qCLJTz6FTn5l37NbYeZ2lPYzBh+I0z38V5CZEzZvqaI8bCTKxlXoqGWJyhpCo92DYQy3iEyj/M9fOb+khoNNJN9AuwPKSiwLWfidZnUTsrAtLt0BsrHebMJSkUVN2ap06oZODx4l6voFjR+vopI+67Aug9mNTC0vXaTejtkapw4Z9lrSO7Ygc0LnOE8i5vOSlDm1th0wAlhzsF72xQ9XOgeVbMCPOK/BXlEDRGHJjywiUHE6BCnazCkDrX7r8SKISf7g1fRepE+hSxb/hfqYWG3kYnZOH5NE4JnKqnoUFA7wvVlpPVJJoeZVDf27prP0zB84AaivnfDCiSvfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnBS5d8Af0kdj4K6dk1dnRPW2O5zdnxrbpuFLKgUYMA=;
 b=HRMyXin16YFN/IRof3gfUlm5iQOcEcp2T20fTtblnOsQRIUTnXUrh3CuBu/r76g6ec9/Q+G0N/eEeF0NgzwntMJlEa4Z2WDPt3A9SapCFu1tLYcdDHVLzO6KzS4D6wKAZY1qwvBosG1YgOphjwpBBRUB96ucFOvG+F1Q7Y+Z9ES/9sfh/lpU2U+cZnyOxKXIaiNkVu1pVchRwXNf2dWoz8UM9miPuQr3qX/8ietc8NHg2pXE6LUCbxG2hjaf+rwvf5Oha2nzg4UCAYweUZMnwkDFMsfCuWmAJNwKuCv1oZLTzfIu3Yt+FsSwKU9k3o6lRIYs6XRGWwYQp5pDhDMX1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB9392.eurprd04.prod.outlook.com (2603:10a6:102:2ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:47:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 22:46:57 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/6] TQMa91/TQMa93: display support on MBa91xxCA
Date: Mon, 23 Mar 2026 18:46:42 -0400
Message-ID: <177430593061.1453080.768758627598818290.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0026.namprd21.prod.outlook.com
 (2603:10b6:a03:114::36) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: deb7ab1b-9f2d-4cc4-92d4-08de892e1663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|7416014|376014|1800799024|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	2yLYKFW0J3GP7uWZaz12dBvBVfA1bkhK0He6syutoIStrPy5Fp+SlcEs0APA7zFE+ccjRxwvcdP8GdmAEGVYbFOBsHRC1pVDcXcu12CpTLy4SDFQ7NQyL9JfWBiyDV5hsqGIkblLkyzNx+7BNlq5+P1NE1W/b5k67st7IFtNWZZfI1+D+9XP3Du3i9PYPAkN0P2ma0g6or0zrfBjaY+B+MAfHP8j//XAKn7ssUxKXW+8LEEmPpGSqA00CeIRVQX3E8QMCPATy2SJKgFlcFlbYINIFCSSGKejtOPQhXnIqEHb15AFK/eq7XuvGH1uwLo+zfcimMfel8awMib8qqk+w5sNepYPbNEUVilU6Leoh+VNzn6z0Z9LRxspiJPYtHUYskrIFvGAtpbV4/CmHmA5QbHv1KVkcUmx8nlQqmUpY8cqkjvbvAwsviTel4k9pMkdlprYam4kZ3yoGfi9mKMcjjuRePsdvJZiTKCZCwhxfzKQ2zG8R8prlF+jfoP/uzklaJCK+FO9J+kcul72DdRk3xk+mTeozDu1JmRiTcVpLdGMTaOUVqZF8E/jcidRvJAfiuTuDFHkSbMs2libzdogVpZphK09haAYOcsQPjdU22QK0rl23Hre0rC0LQTrcVNJVXcBvrq9ySjB41F63qIYwGtXhtPLqbBqTKdPRTFs5vvJZEriB9jXEiNHweyQVFFHdHR3Jrv41xQa1GcE98WxWsdJQjDTr0Ev1z07NsSw/iFCRUJA0UM07PXJsrcvhFcL+6SiQnQgI+QEW3w4EY7kqc1FDZxQ26APnH7IIJlg4z4DnBACNljILAHfjxzpfRot
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDhncmt5WWFta1hpQkdtaTdwZ0dhRFY0WXVNdEhhYi8vU041dVpOQWx0R2lS?=
 =?utf-8?B?STh5bURsZHloaEVGUnFOd1ZhVHhyWGp2K0E4NlQ1MldMU3lCNGpCcytoRmsy?=
 =?utf-8?B?d0wvd1lmY3kvd1pIVWpWRlZvZzAvOExKRjB4ME9ZUFU4Y2pnMWF6THNwcm1h?=
 =?utf-8?B?Z3h4K3piQy9vNTNDM0RmNFI5eXR5TG9FbVp6bFpMY3I4SjhmWVk1MnY3Mm1a?=
 =?utf-8?B?L0FKY1B1YmllZHN2ME1Oa0ltN0w1UnJZZGFvQkpkcmFOZ1RHTTN2ZS9BajFh?=
 =?utf-8?B?MW4yT3pDYnNNdGVzcWF2R3JlVElwM25UWmo2NnVmZ0F2S01BbDEwYUVqWVkz?=
 =?utf-8?B?a241RHJFUENOYW44cU1OY2ZNdFlvU2R1Q0tzelFHNzJiVXJ0ZitiZWFKQ2dG?=
 =?utf-8?B?a25PeUkxRitlSlVTYnEvb1BZK0lvWTRIeXpZTE5vY3NVeFNKQzBabGlJRitu?=
 =?utf-8?B?VFRqZm15ejJackMyd2RaMUR0UzZ5VTNUQzAzeDdqOFVtL1lhY3BMdmdEN3Fk?=
 =?utf-8?B?aEFkbDE1Mys0aEFWZCsrazhURnNXcGFDc3h4Y3MwSytRY2N6UFgzVFpoOHBu?=
 =?utf-8?B?Q3U4aHBMNXQ4M2N1Y1NrdkMxamxPVkV5cENYbzNNZTNDeVJ2YnVPNVJwanVX?=
 =?utf-8?B?cE1qbUY2WUpFUTNodjFjYk0zYm1GdFR3czVxUlRJVURONmRpMU5qUXpUQWJO?=
 =?utf-8?B?NWdQcEoxRmZRT2d1ZjM3S0owN09seGt0Qmw1dyttdXBVM2ZGMjVNeDhKUHFZ?=
 =?utf-8?B?N21pb1gxcXBGczBJK0FTd2hLZlpNdVFmb053dzF1MENzcDRJWmMzMCtLUmxs?=
 =?utf-8?B?UUhGOCt5RXhMNmtUMTFIYldnemUvNVdLbHVBRmJRMlhZaVJKc3gwWmh4M0JU?=
 =?utf-8?B?REIrakNta0xwRUZneTJWVGYyblB2SVBmL0tuQ3p6azBOWE1JK0R4M0NqQUVP?=
 =?utf-8?B?ZGhwaUhab1dPNjdKTlpBSjR4VkpXZjQ2ODExYjZvU3lucEs3a2RMSzNxUWJV?=
 =?utf-8?B?TDNYRzMwZklSWlprc0RlblF4UkNISTh4UXhhb0xwWE0yZGtSNnY2Nm1MSWxP?=
 =?utf-8?B?dGZyNTRZL0NlOEtBSDcrclpzYWpUUkJ0R3YyMGZnS2hqRHV3c2grdGZhK0hS?=
 =?utf-8?B?czlDamZkSUVDMnZQc1ZrekljWnVJckNSL3E4WitIdUs1NFZlWGlsNkgxaE83?=
 =?utf-8?B?RFFLZDZ2M2FXeU11aUVzOGlLZFdoVk9COENqczFWUUhBN0VrbTJYQXMrclc5?=
 =?utf-8?B?eUhpMEFXL3RCVlVtaFlnRkQ5bk9BUzMwK3J5SlQyNGNqTmtCMy9LbUI4c1J6?=
 =?utf-8?B?UHZCOXE0UVY5OTF4SXV4ZFE0ZXJzalhtTmc4NXpOR2hvdHlQVzF3WFZqMUQv?=
 =?utf-8?B?UmpyWVBVWkdzL0ZMVER3bHRoUnRSSjI3K2h5bHA3MFdoMTN6L1hqaG9PdkdE?=
 =?utf-8?B?cEtpS3M3a3lFNnljQnBBUktrY016VFdhT3pvUmpURXpSOHgzeU4zR3A5NmY2?=
 =?utf-8?B?U3QxeUw0WlNhTXg4N3QxcmlXN2ExbzlVZVdZU3VXVzdLUk1SY1dhdUcwMXda?=
 =?utf-8?B?c3ZKMEVNeUJwNjBqVGxsbWN4bjlmdTRDT1kwWldnNHJEK05MRHZnMU9jZGFE?=
 =?utf-8?B?YnhHUC85OXo2YkpSOS9JaU0wUXp3MUtlWFliNnRlTFNraXlUVDBUTjVkUytl?=
 =?utf-8?B?cTZ4Wll3cy9TQXZJZVg2a2VHcmNTbXdHK0V4dlcrejZ3dXhBQUx5VU9qSlBk?=
 =?utf-8?B?MC9wM0t0S25KMVBVN1d1QmVJY0cxRWNHL29HUHF3bDVUZWs5NGhJQVp2OCtO?=
 =?utf-8?B?SU9MODU0ZERBb3EzaDZ1cDJEZUloTkMyZ2t6TmdFWmJIZmJyUGh3VHRjQ1dG?=
 =?utf-8?B?QTYrajB3WTM3WkpUWW5vV0VxNnR2QjBXeVpJQXkydmtRdldNZ0szUmZMMFA5?=
 =?utf-8?B?MHo0Mkpxc0ZUSVdVczVRR2kzN05DeldJWk9xQk4vTmdNd3ByMEdHTTVqNnhM?=
 =?utf-8?B?Q1FHQjFTTHc4RE9lL0FwVWhIdi95ZC9ycjBqeVp6QitkR0pjNmJwNFhKbExZ?=
 =?utf-8?B?ZHdHRnZNd0xJZkgrQ3BGUzJaeXJ4RnVqWlAzcENoY0tmbXZyR1NvRWF5VlJm?=
 =?utf-8?B?Nnhac3FLSjlnUk1YTVZyWHdBbXlSaW04dksrSVByaEwxdDlrVWVtbHdZM2th?=
 =?utf-8?B?YnFqWUttRFFLNjBXczc2SzZQbzZ1OXBvdTUzaHo1QWdRTUt1YjdSSTZSa1or?=
 =?utf-8?B?b2VZS3lzVjZqYXBaK296Nk9wMkFHYWhsZEZqYURTQ1hadHVoZlBZQUZ0eEVX?=
 =?utf-8?Q?JB6Z9LR122Zn/sKGVg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb7ab1b-9f2d-4cc4-92d4-08de892e1663
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 22:46:57.4263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1L+30n0fuDlOtj70/tGKjoKDjUTv+/ldkzSblCpWO5o7TaJBseTl8mQAFOeUZdvUf+70TDF3ay17heGMmxQkiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9392


On Fri, 13 Mar 2026 08:07:30 +0100, Alexander Stein wrote:
> this series adds support for parallel and LVDS displays on MBa91xxCA, both for
> TQMa91 and TQMa93. The parallel display is attached directly, while the LVDS
> uses an LVDS-Encoder. To actually work it needs the pdfc driver from [1].
>
> The first two patches add required (Video) PLL configurations to achieve the
> necessary pixel clocks for both displays.
> The last 4 patches add the overlays for TQMa91 and TQMa93, although the
> overlays for TQMa91 use the same overlay for TQMa93.
>
> [...]

Applied, thanks!

[3/6] arm64: dts: imx93-tqma9352-mba91xxca: Add parallel display overlay
      commit: 57e546efd0948d9b580cb7b8824ea62b16af4cb7
[4/6] arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS display overlay
      commit: d6b12b4c49a11baed9b4de98f333f731aab6bf9d
[5/6] arm64: dts: imx91-tqma9131-mba91xxca: Add parallel display overlay
      commit: d99156ff8bcb5607c7688dde5a55315ea818b150
[6/6] arm64: dts: imx91-tqma9131-mba91xxca: Add LVDS display overlay
      commit: 10d12c22336cc7477142fddbe0b17111797fc68c

Update commit message by change "This adds" => Add ...

Best regards,
--
Frank Li <Frank.Li@nxp.com>
