Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451761CCEF8;
	Mon,  6 Jan 2025 08:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736151364; cv=fail; b=LqZ3eOuUe/G0IKTsrojpDxBjGrhP4lLTYiAjXNwSPueB3+LGT55U/XtI+6S4nE7J3RBj6/efO4jHzXSbgV5HKEMMAQNk0bTyLgH/ZaoQVVUga3bGr0cQe2LiMpEU/xo3qug/xzkBSJFmBmUC8Swv8Jeo2edYbp1MjdwmUPNRPFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736151364; c=relaxed/simple;
	bh=kMRw9Y3DAvLC39pC0jjoTqEQDhg/IYwuNHFziPNqNqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XmvMN++d71zgV5zH+rdXIjHxCDNFr5Orb5Jw0hN8/L+qMfLpsj6wMyIyiWvsG6H44Sr1UBXQsim9nGWOTr+NITXE4AEanWymDFSzoC7NRFvTCgiS4hdnAqOjhV3mMTkXSVUu5pV5KjbXXdQCy8q333jGIjPl2L7fysjGtQc5BeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IPk7l4jW; arc=fail smtp.client-ip=40.107.21.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IPk7l4jW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyLHB3ZA6i+oCplFiGPzl6ZKzMWjya3KbX6F0L2cdy6D50fHIsVzsNjoQe6fobZC9uV+/S+PU+7NCaKrtSs4xpVIgXBpM+wJyunvLAiZfSmINb8nK/yqZq8HJorqWQ11QiF3e1tdlsC/4L/GFkw4sHehsyly4G9cb5vKT9UJDRdPhk15NWOtXqljE8PR0mPwK7pg2baQmQEXMMsGk+XpRIZtkcOqtbU8aTOL++WdJ/7YA+0UsgN9q9BWp9Pg2BXLePDzPnlgKVH7SGqNMVO73Jn/rmswNrHW/daUKvZkYpepns4+M+4xbxEWCIKVj5jnIC7d3A4dlqjcZxb0LFm3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMRw9Y3DAvLC39pC0jjoTqEQDhg/IYwuNHFziPNqNqk=;
 b=LOz0KmreuUsQN/9KdLnLK6MA1Ee2Wjp6iLZZ04H7EpITb8e6J7PkO3BUQ3uKONVE+sxvaRh253JCjNYHnbP/4j0IqwORwN5Cwct9HbtsEA5eR0Gj2iS8y2Xna3W240SEpMkdhq/1arTt4MIqcZXFZv3O8RTM3KrW4vu2JP/jXUbENbb0tImk6Auu/ZGSXa+xbKMYkT4kb3Qe7Wy5ViQrki5MpYrepmNAYfN9dTRLY8fDkbpnrFm+fSu9yBuadA37E02PcCbLXXIi9jJSJ96Kcdm2UyNkV+svVPCAPPK9l9AgUWpjK8E4XIAFsZbl22ONQUXAWi9sI8CKzoYbsza01Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMRw9Y3DAvLC39pC0jjoTqEQDhg/IYwuNHFziPNqNqk=;
 b=IPk7l4jWLSicV5RlUPSEiDTeW5PoOLHTxIg7ku57vYFrQS1LJ4IWRcqedCuTZ8wizCP8kI6ewAQKk234h7Y6EyNXeek2loAzFR6R1kY8nPLJykNTF2oVnWDKoBOxT32Nof0edxsFt2IMiGFsMMqFHzR7RlgdNRiAnBEhg21Ibe/HTcM9hMmFw6NJsVg0H8SXlZH0vQep8s+6D7UAvJlv6ol439fYoC/n7zCaYmoe3QgKKi89w3tlx22O+R4OoYFXRUx337KhZlRhgYPUFhpHMWhrMOdrOXBkTBXoCEY2VoISTsizOWKKDX1EAM31BwWAzKG3tD9KVufclknDBFuthw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8249.eurprd04.prod.outlook.com (2603:10a6:10:25c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 08:15:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 08:15:52 +0000
Date: Mon, 6 Jan 2025 17:21:51 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: imx8mp: Add optional nominal drive mode
 DTSI
Message-ID: <20250106092151.GE19598@localhost.localdomain>
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
 <20241219-imx8m-clk-v1-2-cfaffa087da6@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-imx8m-clk-v1-2-cfaffa087da6@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0342f6-9495-4b1e-00c5-08dd2e2a5605
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ohjD1VmIdT/TNm7gIGdormTz01HfE/fW8PGaUO9OiUbBi0B/vgMPSzd6Nu+W?=
 =?us-ascii?Q?sl30V/1MeC59pCkTtnwwS/1UnvP+in1tsdMBnbtHlL1qHdCJaKeNGmTbYFas?=
 =?us-ascii?Q?FG6G6/NbyEcEVlljG+19eCu09g4Dh/ydsZxror+sgkb4J7aAp5IRrM7TfYHD?=
 =?us-ascii?Q?EZkbnTY53UTC987ubFZaMRjp9cTuWcG1ZXuCPVar9v3IaJ06dTgWUNL6gfo1?=
 =?us-ascii?Q?DqKyjOVTA7vjn9KVm7ZGnJ6SuOgcuw9prTIUu5YlYQpB8lP5XNxMmH71pnGL?=
 =?us-ascii?Q?oGoPPqAUKOGMhS4OgMFPzduiBcmse66QaG7OnxshsuZSIUEIGg8XnFImwbaI?=
 =?us-ascii?Q?XsxRprXCmnjBtHQqqSWnxDTcvl0OyGzQU6FOszaymd1dNozzDjRj97R/VUWG?=
 =?us-ascii?Q?w47ctqYREURfNAaUzjg6F9hNkWKjVrgX8FB2a7ThIPeYdxj+GY8nUhWcrwHD?=
 =?us-ascii?Q?ugSKKCG7a3iuTDKF3SIcIaas/joMtx5oi46IJ5c7HBXTTUGEEPoShboYEbZS?=
 =?us-ascii?Q?p3qzh1OspC/HGrxvv4MNXCZxRFXdfZBNiJWr+hOi1gaGRv1dFjbVHp2mty/p?=
 =?us-ascii?Q?3k+SWLTM5/IwbybBeYnUXKqZuFjOA894R81qIKb285Gj5TvOoy9bEy1USN2b?=
 =?us-ascii?Q?xaf6qIWrjxonOMBl07nCxPHXBZb/eOBfnFLlSShSrfQp5vNmhrzkJNlYW4pp?=
 =?us-ascii?Q?vGAfQiLrN+SPxCDHTXBIzGSbMp+3OWf3LITRTioaNGObqoQrKKIsCUzmgxce?=
 =?us-ascii?Q?drzKQS/mw0iSoII+5//u8qJnKDm98ch7G3HaN6A1ijuAkGH5i1zJ///s709z?=
 =?us-ascii?Q?kCr28rhtk3ZsmcyOdFd2pW+wpT3udwX3VEc5QC/VzcP5pOk1e6nkqNmVFrRN?=
 =?us-ascii?Q?r9c5+/cZQ22qj9lYaSMUtzzVLgiHTUJIDSeKfGmeO4HViAj1VBEEmQBAugRi?=
 =?us-ascii?Q?Uh5Y63iekKbIRQqv/eMjOUpVdE1uySnPaAM3NVxglJiWqoLKC/dD/Jg+vpl1?=
 =?us-ascii?Q?1nxSZIbqzHi9TTcNVlgJ+YSQ2ZrKTzPqliXJjjHT8IxBFvRTIaZudH4392je?=
 =?us-ascii?Q?91IcE2LNyDHTZVdBti5asKAiY0qz8w/s8xFRUK2ldXlkFeB7DKRuv/W9Rr5m?=
 =?us-ascii?Q?RBKGy7cnWcNu8D9AkyJ8mxi6dmgD+QLNnXkR/HBYbXVIzJq1Dvzs6yddCGBo?=
 =?us-ascii?Q?9mq3m/lSxyZ+oQpBYzSuQ8C6K3S/JYEh9j2FrxFzZXaRR6fuRkSXLiXR5Tow?=
 =?us-ascii?Q?XuVyhveN1BJH0YQpS+5yzB3n1HM5UBQv8hlEtKZuqe5PLA9Eeh1c+92Euk/n?=
 =?us-ascii?Q?2tHHEfgI3EO+gaS3/qQKHreAAlwsh+NppmR06kRFKC4rlsKpvEjwxaX2JsvU?=
 =?us-ascii?Q?CMJ61qbHnm1UoRtZTF6MTVNiNJXLH3lEH7yqS1C+WHfnHFrCcY2W+Eo2n83T?=
 =?us-ascii?Q?8O0v3+h3LaC1kznbcCeJHpJocO7IBVge?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z8Rju9STNxz30C2QqnngxPOXBRc3ehk/QZzcQh0IuCmMsu4/NHBIUvCzoyI0?=
 =?us-ascii?Q?ur2on+F2nnA2eRrnimfCEpUm5Qcamo1dScEqc+phT1Uze7F3n64Eqcmrmnn+?=
 =?us-ascii?Q?Z84pHY95FF9k8kFGvyS/G4rqRxch2pEl6NbZrBZd+lPCaCWfGL449mMjFxXz?=
 =?us-ascii?Q?skKlezkV3gRavym2bjlDCB0rqZrKP6gPVY0VxDnPGVQxyCcu4AIak5K27eKq?=
 =?us-ascii?Q?8dsI/OcoxErSFCOyAadXsGUgi3H9HFHAUcdlKs+VPYd8lTu6KUcu5JX/z0kc?=
 =?us-ascii?Q?eX+sNfKqG8lUfuSKEwyWbQF2rdpAC/rHK4I59a0XtHI3xf0vHLi5gij/SJ8+?=
 =?us-ascii?Q?/DZsNVuYG02Dw0LlwYmwpVGYUFBlFyYCUCnu8Y/rPPNnGKvZ8jyuvuqLvrhO?=
 =?us-ascii?Q?6+ofjgjoshonIwKrIRMnZ1EDw27AF4tygRC3AJIGjgssEw/3wVOH55qsA3bX?=
 =?us-ascii?Q?BbhjyQhEu6a2OL3jiAhZ/+PEnW6Gu9BLISFUzN4mly6+dESoOCjbevBMkFRw?=
 =?us-ascii?Q?LzwfxVKvUlouKKT17ET8gjq7ENfMToI/sksbO3BzXEF9mMqCZVTqhJj0nl7T?=
 =?us-ascii?Q?9aVBnNoUsYLC0caIAnE0Je5zV7/1jIIwaR6JuqWCj3Y/GcoO7pt768jSAxb8?=
 =?us-ascii?Q?XJVJbNYlW5abqIa8Tm//iKxB7eRl4goAw532VL2TeDjqWSTg3kQuCVW/8wKr?=
 =?us-ascii?Q?99OgUX98JH1+Cbn4MiV9ivbbzct7l3SwNlXSvQb0SRJrFePzIVjjWfPWerXp?=
 =?us-ascii?Q?JXHQ9oOrwSLHW0EYAB6hlf9bq9DW5ZPNtcvwTbip4m4BBOoQKVZBs4kjs54H?=
 =?us-ascii?Q?AAM5tRDTDKNvvud0LzBpA/zJrC4JvjooHpdHXfWz1fK0akUKqQ8lUR5BqeGb?=
 =?us-ascii?Q?nVbpv+Wb1fOim1091DqdNn/oVCFrnfdPn7/rvMeVxMPnoNQ+1HIgmIajHpgJ?=
 =?us-ascii?Q?xx+skriX1Z1RzR3O2oWLRLxTEnHhlAqkaB2vcXf9b4VvgYODLAlOqQfA8fV1?=
 =?us-ascii?Q?K3O32I5w6jC8ylMtabllkaOZEBa709FiRruZCnkqBw+WxbfzmewVWwJlulES?=
 =?us-ascii?Q?lrQV6fXrGFT5Ac0qsYjp5bnxqV2IftWkUD5GHqhNWt0DPVwuG/fbeYg6MQQQ?=
 =?us-ascii?Q?BGIs6fcnLmsTLYhzUQ1aImoII6ST2pfhkLDErbKkx1Fl1GYhaTjxFZNqFt/f?=
 =?us-ascii?Q?Fm8DaI2g0JPJVnNiq/r7vF8EvcXY7f8WTdNQ9kh0ctGD/UqgN2QcOkX/ShcQ?=
 =?us-ascii?Q?BlYJr6MK6FSnCa0GvuQ1cjR7TIvqh7QLLmyv5dpeVXLn/J2+Z7k92hYuFtwk?=
 =?us-ascii?Q?LaFeS7RFRNHZoFL1LNdssRAvkeZPuF3Y797tmZiZvBOOvAguBQX/mi3SX0FC?=
 =?us-ascii?Q?wICLlsCovXf5OvM0JdTCPLACHm8fEhea4q/EgZ/4vxsHWa0RYrvfCYEwVIDU?=
 =?us-ascii?Q?NMqRd9ScQrJNRExUQYCZNS1ytPn159Xrk0EqEpV83FuDh/uNYN5Hz1Q6WxeR?=
 =?us-ascii?Q?C93aPFpXgH64GrB9b2xC7OnwZIDG1NE7UzSSIHwARNsaBmxl8DgF+gpsk9xQ?=
 =?us-ascii?Q?1QxdKpbd6VbfZDXAH3Nn9qxK3jBMGHL6IBksxVbb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0342f6-9495-4b1e-00c5-08dd2e2a5605
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 08:15:52.4616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQwWaotbLSq68aIfB4jSU8Fbppk8gAFIDK2cypJ0Blwv4SAa/5JOds1m3BPdvhYzcctN8kGHIIL2gEqYP33Teg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8249

On Thu, Dec 19, 2024 at 08:27:33AM +0100, Ahmad Fatoum wrote:
>Unlike the i.MX8MM and i.MX8MN SoCs added earlier, the device tree for
>the i.MX8MP configures some clocks at frequencies that are only validated
>for overdrive mode, i.e. when VDD_SOC is 950 mV.
>
>Boards may want to run their SoC at the lower voltage of 850 mV though
>to reduce heat generation and power usage. For this to work, clock rates
>need to adhere to the limits of the nominal drive mode.
>
>Add an optional DTSI file which can be included by various boards to run
>in this mode.
>
>Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
