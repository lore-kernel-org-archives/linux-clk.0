Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010023.outbound.protection.outlook.com [52.101.69.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B582E19FA93;
	Tue, 25 Nov 2025 07:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764054993; cv=fail; b=UycMZG0z/E8CDdO7eu4QgU6ad4UD4MmaSHgBoJWlKzbLBcBJ2j01tr8nRePGr8wGtP+fOeI8tmAlFExwFH2hHqyvXWnmHbaq5ipv68iSEXxLEtlYjHZkWihxhdTsmFDpJVCLMYqA+iPETcgp5OwUlea2VIknjq0ljkhkTWFAqMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764054993; c=relaxed/simple;
	bh=+KlrT9HYm032G1E2XVTC6azmLkzbHe1BApEap5PROpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UUDo4gzvg5DGDmNq0iy8y8yKdAwavX2YsoUBf2SftwY5ZJ3+gSKeoCgBzBSR6shLHhVQdvFR1QSBGojXTmjA+KkMuwu2HcyCOkEgBKzz3hTfnno7wQRo8OzlCfDRXE3O1pr96SEEoISU1xF0d8IRqFnDi9OP5IP7vZYGiTApyHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=naNrIBsE; arc=fail smtp.client-ip=52.101.69.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="naNrIBsE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOJUNYGm8shhICgQFxkIt1ydOCS0ZDgwum8zTiJ5bXgCqDqwz+SSuLNfDO5LlbDcBMVQXHCRobFongV+/TkdmRNkrfrfw1CrezSzwptkt8bpn2hc6bjaXjLK+akdej5ys+l/r2NHaXeTxjBNf1ynjk/O0XNGMJX/t7EROCv+XDJ/53omu6DLfOV3HnfyUNzsVt1z/pwQSUr0cFcB1u0gVxySCSCOahFwnnSjdxsBCnk4RSPPqrxctpr2CbJe8U8J7GMbqSgv0Tp10zK3/XYapSaElp+AxWxy4uZeZhuzug7kbPN/CqFs57u+eVIEOJsTZvw9e8eyJcssN7rdGP4YXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjbunWD4miF8OLqWdsaSuxfWs2no4b8UwA6PTkStQwU=;
 b=CnLNsc0IIDIze9joFFz8tv1/Q0qGlKbQeGHx5PPTkr5UCGYrESY3JOFabPf1z1MQzYuhGZUznb99QKEj6VQeKROaRNTeL5AVT33EYHH1+ZvMGf1j7mNWh107Eatq03VpHuPAAvetNoSAbsSE16T9jNVda+FR8+cyphRHpnQ2Yx6A73ff5ARZEynn1Ih5CutR0hRqr8uj9JMWVTStwQWzHbNK73tWBzCsSeTmfLz5XoxERZfapPL7oZhLQcUv7hpP5ur3+TJxXkNt0+85KfLv0yLON5TpxLiPpWMLcdANAJFXFaphEDhWKy8yG/w2idUUrP0e0oWfjYzBVZiMq1kMfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjbunWD4miF8OLqWdsaSuxfWs2no4b8UwA6PTkStQwU=;
 b=naNrIBsEousszG+DoUoxznzi0khRkVhXCZV5DQp0jWjmfIDL06QFtlBvgI59lPninB/rjseghvfe2IhWCN/NG7E5CT82wMhuFB6g9jGyzUUJlbvtufm8iZoBBiu1Qsc6t4mMRTDWfHhgPkNApeRHBHMkDkp5pul8n9y+tWki2q3dIpuTZ/y3695/6+ePdMSt8qiI3zfM2fa8utdWr408xZdNjpE/XUiJ28gQkob7Jjh698f5p/vvJTsO5kXwa9KsRUx72QRUfHp1BThasndFPEyirSPT9e20tL/opVSANjz36kt1rGzco/QvsEAWtwHk9c8ALeWJfTedlRb73IVmKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by AM8PR04MB7841.eurprd04.prod.outlook.com (2603:10a6:20b:244::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 07:16:28 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::67fa:3e46:acd8:78d0]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::67fa:3e46:acd8:78d0%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 07:16:28 +0000
Date: Tue, 25 Nov 2025 15:09:42 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Frank.Li@nxp.com, abelvesa@kernel.org, conor+dt@kernel.org, 
	festevam@gmail.com, hongxing.zhu@nxp.com, kernel@pengutronix.de, krzk+dt@kernel.org, 
	mturquette@baylibre.com, peng.fan@nxp.com, robh@kernel.org, s.hauer@pengutronix.de, 
	shawnguo@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: imx95: add PCIE and USB PHY clk
Message-ID: <74w33wrmzqfmh2efcb65xwwlqvzblv2six6ht373v53hdop2nu@svwsauzhh7ja>
References: <20251118074055.2523766-1-xu.yang_2@nxp.com>
 <176357590754.11952.7874373646773229823@lazor>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176357590754.11952.7874373646773229823@lazor>
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|AM8PR04MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a269c5-ff0b-430e-cbdc-08de2bf28d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y9mTGqM2/p8i8mN0EvPZHwxR3RJ8DwA5xikDFA9b7yXhNSS7l395BK8szz7Y?=
 =?us-ascii?Q?yfNuRt3rNW6WdTOZyXUBkf2P4N3nXA+GvW+bqnapLbtDeIn1R/cs770z5Ldb?=
 =?us-ascii?Q?Z4tKNrdgX96PA3u8sa6seLvco+JMpCf+E8/S1z64Bs03gtI+pY82x7Kn7Oc9?=
 =?us-ascii?Q?XYa5+BQRewDe5i+qQ7N6gubCcR02ymUafakNvg1UFrbO5cJ5cVBNP7qwnFmE?=
 =?us-ascii?Q?lhA8OizjKJoXpGKYXjQuiNQabZth58RtCV4n0b/dArJtODyJlbBYirdBKvLn?=
 =?us-ascii?Q?45jUyVznPt500pOVHN72yKqa+GiA7TcIsly8t9nOq1nkUC8TS3yNj7z6CwzQ?=
 =?us-ascii?Q?+VX5bB0ZJX45Kpj2IYH9oP3t63W8eRovu8uDcXn0G9N7mJCCU5J/BBIj9XzL?=
 =?us-ascii?Q?PDJycniSGwN6i3BujNxvRzUbvqTdrH2CdJyqFe41beMTV1+svctuDM0YbmCk?=
 =?us-ascii?Q?JRPaIVUuS0fVsCWb932x8btU6l5ojHSEbIE9McnvjmcXO2uQKwJEuwbbbg3q?=
 =?us-ascii?Q?DhR5zHCEoMZ71Jc3GoSz7ENNcF0tRiGf0B7XnhG2kxU8gK1pOuOLAP15W1zn?=
 =?us-ascii?Q?AirNVJ5BZjj1vKj6fCbjbniykpwqRmBp7Mb58/6aA0P1G7QijGHpxDChX0E1?=
 =?us-ascii?Q?5EGpe7m61P/CNCI/aI24nIKnsn8Ldk4E//2sIpdxgr/8aOrpy6Zw0agAJA9j?=
 =?us-ascii?Q?+odHKx/2N6Su7wByjPpctrXKaT+40QbCmkJCwnYKH+5soOVh+RBOE3kB6EYb?=
 =?us-ascii?Q?VxmSnMJE73j3p6HJcC9fSviOrnIZqaRIEnf4761K/WiLPjPLaPtOCKOBMEUh?=
 =?us-ascii?Q?xgINonmq/yKoSgj8zeP7eG+OmXJZDZ9awasnHDd9js6GZKbDt8Soxdal5e0q?=
 =?us-ascii?Q?kski8C0KatRwwQL+/ML+KgjkIaq0R8QxJHDzVwzK5d84mw/eiDMYOnFbm4L1?=
 =?us-ascii?Q?FTROacl+8s35MNxISuY88Uf+QA9W983fAIsBdbH8+dAaP46ZDyG3FB88Dh/L?=
 =?us-ascii?Q?NgJEoMpl6QxcA/JP9DXpPR+9SOz0LIpEcvQAYOiS43egBxQERwAmvJdd3DgX?=
 =?us-ascii?Q?fwFon1R+DNFFHblODOM6L65nmEfHG3iVFpHE0Uvh0HrZDbkJMVahDfZhM5h0?=
 =?us-ascii?Q?HxMHdb+gl2W3Fj23zMfDuKxYnUQM0tQZhEAS8JgewWjUw7zDhHzxvBpKMRAM?=
 =?us-ascii?Q?Axcsp+YPp5Qzccn4scWolF0udL/G+9JtVWso8iyKZ/dBgtHgr5zRYQaO7ZA8?=
 =?us-ascii?Q?u3itOjJ69faJMbofMAjJklywMpLkgFH0ZUE1ZMAYikPFn11iDJiqgSMO/0ed?=
 =?us-ascii?Q?c8NjhwbiyF2rIg4W8ItLQjMsZ+v2V995sc5F+KQZ+ZI3Pl0ObHVd9jaXWDsM?=
 =?us-ascii?Q?m/z53cpXsdGUaDfXFf9YIOocSOUWL1zD78xHaN34bs46D9PP7Y5sn1WNfVUN?=
 =?us-ascii?Q?BQf3f767/eTCLkIn1OyrD727INsY4TxDISwFVBFwASSZZVaSJjP/rTgjDCLk?=
 =?us-ascii?Q?WsdPrYaAPKjKB9NUg/b9hE8gnR8drBhxRjJh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dxrvmFQ8TbUbCquohVLqqsGqXV/dPITEJdQY9sE/3uYaSndEpfrSFs4vD+uv?=
 =?us-ascii?Q?9GiIyGCjhjO0Y7X9KwudFFsHyZFkMJvNpzBeQouT5RjsT9XeLaAV5izpF4Qt?=
 =?us-ascii?Q?D1SjyR5VXpYSAR4QrWo+W/xH4fVud4ZgD1xDEKtPKsRJFKVWQ8akxulLQi0g?=
 =?us-ascii?Q?QoT2eis5H8A/4pHMZHl2dj1XnlgY6KxouRfEXigUQ3wfH4B0yJYzPmvBFiN5?=
 =?us-ascii?Q?pf5gM5hMe7bRVVRElBUBfPVwdvLy6lTy9gCZFE1bAcUXyujUqk/O3mgvUkyo?=
 =?us-ascii?Q?owLE9n/UctZvp6Jw6hsblksVd6GRolSv5plHlYoa+eaNIFsNU6Mi1j3fPIsS?=
 =?us-ascii?Q?zTrQ036rjgzZK3stV2zCPgBeYwnA5revVrxqZHhTUWGZXwIJwWva8Hbt/irT?=
 =?us-ascii?Q?0ZEMtoDEGZds/hTA+ZYumXdp74asM5VhjleJN0TuhCngvHy4ZITft8mLJ/br?=
 =?us-ascii?Q?Yo2IS34WIqUpnY7jOddXjeUtwZzeHAHs+DayN6ChmD2Ok822V+z5yvlt+TKF?=
 =?us-ascii?Q?X4T6fggqZjJ3zopJqjW3pBWI6kIoJf+Ja+ySK6xKKJMD3ZZHYJtnhME8XwYQ?=
 =?us-ascii?Q?5SCoVozG6Ss48v/4bmBi1M12Ny5ItCSKlweU/tmpGncBdnj7Dlrpy/vIx0v3?=
 =?us-ascii?Q?pZNM6wsINwYbQ6CtRUmlElS+0oAaqKQEWUzv/5snwPwz8MUx/4OA8Je8XTJS?=
 =?us-ascii?Q?jC1ymUqHlaoKIT5zZWbG5RyO7NYPxojayRzvqSv0ggx0G/QA7IacVWKFFsBz?=
 =?us-ascii?Q?Kw/iDqK9DWf5dYPchtX8Wy0YAFyFAayTywUQIiWJs4CJgrgdiackGWOgQpgL?=
 =?us-ascii?Q?vHfHre0bt7TKALmu99IxXhadsuTxiKUpPj14lG5a3Lh5jXYgzRPCCadaLBS8?=
 =?us-ascii?Q?5iU8sUSDyGk5bMxw6GicB0QqYPFflSYO0L43TvY1nAR6bUKdNlnlMx6/fRY4?=
 =?us-ascii?Q?nYFcMIei0bUf16ezhylN6+O4qLcDUm4nJ8dLC4Ibu01H5WXbjTNtxh/YHX/g?=
 =?us-ascii?Q?qTZ3xUif9jSgOhHFigdf+//iTPbbKUajP77mv8feZ+kgAkthTl8RbBxFy4lm?=
 =?us-ascii?Q?sn1FVW6iH1aUX82aURQRFhoeU+nGnU0PcH0PoZz/HJEmLCbVDTTSoHwNYwVx?=
 =?us-ascii?Q?97GfD38dV+BAbykX7IYAQn6vK05TfVbGqVRYCtoPvfshegI0LEVHVcSmEE+N?=
 =?us-ascii?Q?F3FxzolZrP34j5IKXAz/boxI1eZLJmXGu1z9slGhWhikc5matxfrDfXDZg/F?=
 =?us-ascii?Q?Zs8LRuOJmIGlyFpscjAWY8v167xdCHh3FfyApCdhUtFMLmausvCwGsUQDrWx?=
 =?us-ascii?Q?TuOnlgEwIklKIMjR9b9R7sSL+UMWc899LCpssEIslDS0a851qIFDleI4XZzE?=
 =?us-ascii?Q?Gcoj0/OdCskxyk8BSaTcGiltFcz2mW+WrCtqrzbUqt1FNOE6oyX0IDCAbn6p?=
 =?us-ascii?Q?r5P/oEIB6tGR6UM3gO3sSWSGWMEJ587yNkyBaW1t4yRAeHzuKRvZZghZVo69?=
 =?us-ascii?Q?L9XMq+/4fT2tSBHboWjnfYpE7XKi1/ZybJEvDXcljWUC83n88SGxQZoD8sJq?=
 =?us-ascii?Q?BQESgyuGBolsJxSXTwNJ9knzytl7XtFjtgwJpkYJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a269c5-ff0b-430e-cbdc-08de2bf28d37
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 07:16:28.6159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhtoGF0Ok8Hex6yyIUZcii01AJpIUS+p7ce1MMVgwcpvnl4xlL7qlUx+BrJ5AGfJsDe+YST0x/zCOKP+6+fexw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7841

On Wed, Nov 19, 2025 at 10:11:47AM -0800, Stephen Boyd wrote:
> Quoting Xu Yang (2025-11-17 23:40:52)
> > Add two clock definition in HSIOMIX.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> 
> Please send a cover letter next time that all the other patches are a
> reply to.

Will do. 

Thanks,
Xu Yang
