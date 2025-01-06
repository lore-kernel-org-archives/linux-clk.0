Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3530D1B6CE6;
	Mon,  6 Jan 2025 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736150312; cv=fail; b=D9y5gjB9kowp2lCXQVnmfBXbopw7VD+adujD6LHdcsPQddpYsIipcquAG700gvuYVPV3r4ViHivcqpWJ2pmcB3Tp1c24I9erTpDXkrZaAIG+3ra5qp+Wk1zC140rEQPGI+wb/JWpbTq//zU9a41yhnhlXWxYCJBfHpax48DToNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736150312; c=relaxed/simple;
	bh=L2jqLCnn4hlEu95I5egDdDAQiUQ1RIvHF6AekuqgkDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qvU2+Ya2mulc1tSuw5AcpJrqkCrrX7Bpovn7DSrcJ774zNkd+jA0hbdJ3z8ohHmcwwj7NnaPmHOF4yP34alnFdi5OZf3A6XaG2A4umROKoPp9TnxAL9gB8JTTcb/x/68CgKCza4BoBe85CTPaNar6L7BEsiayaUPRz7TMA/yqCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hxp6u2rj; arc=fail smtp.client-ip=40.107.21.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hxp6u2rj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFfxPPcOihRlLN3uzqZ/yLMd/+S5SHH5uk8HjT2nN1DEXRiba1N3ANDWCdwMopVJe84JIsD93N4nxuSNbVmsNh7t+dpOuDz68pGWJhl3jN30pdmUYDOy0Ty0EJ6tGcM+1zeDsovzeiWEXC+XQ8g2WKYEIsebsbKX6zQB2tNMq5vv59jLjtC0C/3H4d4aZchkQgkGl9L9QN4/CeeB8uOK8he1lO6JRPoD5KddYDx9tu7g597PvL+moTkEi9p9vrUvSWsycpq6yt4RBEKL4OrIbf4tNi4muOrCXWeLswYIkHYYMi6O/LHRT05pOijahjCMuIUklfDWljidQp0W1ggq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2jqLCnn4hlEu95I5egDdDAQiUQ1RIvHF6AekuqgkDk=;
 b=C3+D++47wvOEjRh0wtt61/cz+b3mY7ZA6Q3vGbDIby+6WzWy480QWyZZhDaisE43C6mn5pvN7aEE97hUvw7unaAAApAyc7Ig8iggrA8D8PYPiq4bFBVHObbfLvQ56j0dOwHkqxppD9IK7bbDgs+o2FDXEcBnSrF3o8kVQUqDmUJ5+Oju3FrTodQwYv11Fonz0pL52A6SLUwz+yJBsRoCQybSKv836Nbqns16jhgMmAult2yfwqvkv+ayaX3qwOt4xljeR9nW+qBr0LuBK8TN4yKOOwr5IUtmDWB3jO8s/LCsm8XO+yUYbgLFA1YFweKUTvVpC2dIOOfVmVGiZrUXJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2jqLCnn4hlEu95I5egDdDAQiUQ1RIvHF6AekuqgkDk=;
 b=hxp6u2rjyzI2/qXihR9fFajiTXh4A4j6/KGeijGm3mnIdI6cZCRZennH/E1OHps1PBC1hv8G/LPulx4ljSJjX+9Z+wg+H0p8AbHRBtVEiN8R6JkxKf1OmIDNZK33ZV8rDWM8QtrvKTsztIelWH1O+OYIHMXLWYkPRDBne7e5HnJA4Pvs/S7iai3Jl2s96U9MGkLMvxC8je+Cuj7SIzBDVD8NiWk8UGaH0r8RNRwClt/v1oheqEsfsosqb1MR05+XEZHSvKac/1063uxloTktP/O4jsvRKFUidvjVlsR2Pct833l3TSm5aDUbW1NmJiikQN6WP3KOy18tzMsB5MLoTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Mon, 6 Jan
 2025 07:58:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 07:58:22 +0000
Date: Mon, 6 Jan 2025 17:04:19 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 10/18] clk: imx: add hw API imx_anatop_get_clk_hw
Message-ID: <20250106090419.GA19598@localhost.localdomain>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
 <20241229145027.3984542-11-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229145027.3984542-11-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SGBP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::27)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 818ed2d8-c909-4c22-4cab-08dd2e27e406
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n4ufZ/ccLnPphuxMw10gEyQ0YCbnNIIIftj72ygDj5kjycBnaUsShKvn1omv?=
 =?us-ascii?Q?4NiKO3hMI/qm1KpbT/XQpfGt22DsZ7/3Sd31rLb8/LmrnZFb9t5H8KPpNsNW?=
 =?us-ascii?Q?nbOtDUTqh/nbbBDWdtbWWFl/28M39YKSRJiKuXhwgqSTApfHN5q93aAToxF7?=
 =?us-ascii?Q?+mcQljys8NVqRx+puNMl4m/WPOM3gAUAcEC5naVSnLwpI0Npq8ggsYMhQEvi?=
 =?us-ascii?Q?EKNiAXxWWTDb0Eu5WbKljj7R51DUqZxz7y6iZy4PozB3kfk+JjQucb2G6ync?=
 =?us-ascii?Q?Jo9wT1oGJM37Px+ojj957Zb4T6aMi7wUcDLIIqBmzLrhJTPfU8IV3bHTWU91?=
 =?us-ascii?Q?yMABV9WwMIdOkRLYEXL5NBfxUzLYFtcaGxVIYPhQDgZ13TVMmeh4bi/533LA?=
 =?us-ascii?Q?uMO+tQqp93bLg9zCwSM8BCjcnqbGMT0f8OdHXAETiEvSh602n99FVBPp2ONS?=
 =?us-ascii?Q?eby8PJhFGw558W5WGlZVH6HJb3GC6ofUd9BD9Wlhrsgu5el9yr5HR0sWeVMZ?=
 =?us-ascii?Q?fDMqOXbvzpvTzKYImo3BRmrtPf09UKdscViNWNSjZxLiA8p3wt8BPzYXeMS+?=
 =?us-ascii?Q?p4od3WeHj4vi1ne+oIWY17jl3ddrEVH9r9jhpNvHHcjaAZ4P8qM0wwzrnmGp?=
 =?us-ascii?Q?gTNFsa3E5knCBycVt56yfZpr/U+DjGbqDQEu5eGBw/FeP9vs213fl93/ct+/?=
 =?us-ascii?Q?0yL/E/goBOYCozosXdaVopaEUK5356CCVSYWcIvm6zofejRDizGxulo722Dm?=
 =?us-ascii?Q?djvx/Wcp8sJUa+F9WTfsa50IGVlFSCCudi1MG8Jovw3O2G38/1Wa4THLXN1A?=
 =?us-ascii?Q?oO1dV8j1oOimAsr3OCkwWCmYOb8+NtiejupgtDlbqhS90Ku5LMxNYqaB/cFX?=
 =?us-ascii?Q?X4L+u8uHmZraD/TUuSPkFUmRNVWj4JMZmCR/zq2MNjQqsA4z5ar9LBmZTBEX?=
 =?us-ascii?Q?Rp9sysAApeq8E0dt5wtI/ye2TdoX8TG6ub8P/ZhFD7uQ9aAzXfpzOxJCEB0N?=
 =?us-ascii?Q?sOACSkvWaixk5M54IAEcTxycKTCV8LzoDqtpDP/nNEOH4ehPKhcHGVr6+3Ld?=
 =?us-ascii?Q?7lQxm+gN1sBoDWJv917i/zv92oAdClyLNtU/dWcSajHJvCBfL0za4ozWC51k?=
 =?us-ascii?Q?uJTjLvaLZcZt+kjqWmOMjA8fVE3/qDkya33DidyD6zlg4acv3BefBPxSuTxk?=
 =?us-ascii?Q?YqQ2PUuviioNQGzKPfHFOCPqu90SpUeqVVGhkBEMBABVQb4rFhJk4RZsnTOZ?=
 =?us-ascii?Q?JEx5c6jeIuk4kzD2bJ0EVplkJGEDVINdFssP7BMedVODZcb45kuRjmCKewwC?=
 =?us-ascii?Q?QDL6oOUV9N7Eo7XlzHdw9wwvvciyuvB//Ggc7AEqoxGP8BIghfoXiM9G9HPE?=
 =?us-ascii?Q?BYO1SCQE8ONxyb3PLejIw9Iz1GOqMmIZbT3aaqjqaMScXJBbDZaTLIlggkVO?=
 =?us-ascii?Q?/PYLwEuE0UYjdzIbPfpviLrils9NtkqY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zWMJep5oGNEXioJ98Buq3KDFCnejJi9F+1NW3HcURDQKEbxzWjEiyR5oAE0W?=
 =?us-ascii?Q?k43AoqS1/DS4Km1E6vpDcVuwkEoXeVjbXENkdSA9gI7e2cQgdjhXI5i4QDxE?=
 =?us-ascii?Q?32E5umdK6TCd3u493X+WYEmJaGhquGUQI1fksRzRj3uOSMTav8vbHLWeZiMy?=
 =?us-ascii?Q?XQ1nUuPbBuzUydXaX1i0vuGAS3ycOccYZFrYkAyDlcFPMO0EcvTCFT6GP7EF?=
 =?us-ascii?Q?kSU9yPvF8EZn5BPaeRyACCBMy7rnpXG+bIly+pG1BCxZOfKl9RKa7zei7tVO?=
 =?us-ascii?Q?8w39HlE7L2E3MTTLOUwxc+BqYi/K2F+BxPh7liqHXqFxxNDrJTsCtdDCWFRy?=
 =?us-ascii?Q?VcLY8TTA9JRt909Q+VrmYETs4k+EJGjP3a/IoIPbciGcpwdRwfrgFuHBEadw?=
 =?us-ascii?Q?+AX8Fqt0S6FB7bsX6BXw5X872/9P54Hrjuut0achzIw0nLPxMSu1sMdErO55?=
 =?us-ascii?Q?8ue501dG2CH0ztnG/x8XrUrIcBlE+ISj8YP9baqujt3NboBWUoZoWRndubrh?=
 =?us-ascii?Q?PjKpCGFr+XVPROiBhO85isIebuIOx0PSMMlPAGEbjOg2aOfNf1HwsI/Gz62s?=
 =?us-ascii?Q?OquFOh/TIMaTpcnBhy6GTIlEU+CHE6+BZSlmADvypwy9eeCRoklcToKEmGWD?=
 =?us-ascii?Q?yhhJxIg/C3Zq0vXCHNMrLfMgcqNm2Djz5w33gkkFjH2EKoXpbDeAtrhxsSod?=
 =?us-ascii?Q?3HsE27K12adffApnE3RNWGU+wx2e9yR/KUc2La3gjkRGFjp49b7iNteGHuRK?=
 =?us-ascii?Q?TePOGu3tXoNqjDa45+CIXcmK5h8pIvN/0JoJ3w6E4XIPzg+M8TXHIm+U25bW?=
 =?us-ascii?Q?fbqot0pgoceMS+ukYp1Qr2gJ+qcLFGdh2Mxta3Ha4rHq3udCITaKxTJnbXVu?=
 =?us-ascii?Q?D2OaV3SeoAo3JgsxScTu6n9oSZUMhDSogi+HAPksT3SZYlqHgFBJbHnaCajg?=
 =?us-ascii?Q?ZzBzuVdysZAcjTFrnf3jCLXrMuEqKxjJhu8mh377ZL83AtIYhsD0RSqHBMsc?=
 =?us-ascii?Q?CcKrZhh52eiSXUbcnfMDKZmLctNzNr/1gNLXLMSr0UDCMRTE/ng3YkqzQRyS?=
 =?us-ascii?Q?k2Re84c937nasZhYbyOEBoVdlIQWBB1gzktjgGu2Lm+hTqCV5acLvh0AMeaz?=
 =?us-ascii?Q?K1EeKK/gFFZksqKPB7izLE7SrCuOVdrG4LXVeF1pZ3OWdHYDbW4k8NHkM/EX?=
 =?us-ascii?Q?mZqEH1BZfIUrgG/qywhYPv4qvF+hF8kOaMoqUJ6OQuf8Jd0OfLy0WcnGAp6K?=
 =?us-ascii?Q?wlc4x3PHdKSsF4+FvsPWfX9yHKWRbuqUbliM6377hN39iOKAwp5JXe3f9CeU?=
 =?us-ascii?Q?BK42FYQdDiHQ97fW8muv20GmZyK4NEiiDPFOefGDm58FDjGg04F+wCNJmH17?=
 =?us-ascii?Q?3CctlBgrA9IY/JGwm0lw4onjCMiOKeMo6JQt9H8rKF0354zZuMocUFIdn4xo?=
 =?us-ascii?Q?QVLjmGsxonPd5NtKrgyL5cq4PvSC9rdiJHAgJTPwGaHCxPnM0sOGXV7hMzgK?=
 =?us-ascii?Q?eJ7o9W01r+Hix4lR0NIPb1mUUEvU/JW+2aT0ZYZERw2a1JvSUtSrOlTpNOU2?=
 =?us-ascii?Q?ATMa/46x3gNpxtCHHh9JMTwTWylnat2b5eoe+ORJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818ed2d8-c909-4c22-4cab-08dd2e27e406
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 07:58:22.2846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qh4zKJSiJML7LzwzaSBk2PdRhVSyIH+n2+ITyAwkZ+aDaVRJ89SZ2ADDdGdhFGBYFKeLfeJEmAOZZuZvIosUDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500

On Sun, Dec 29, 2024 at 03:49:34PM +0100, Dario Binacchi wrote:
>Get the hw of a clock registered by the anatop module. This function is
>preparatory for future developments.
>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

