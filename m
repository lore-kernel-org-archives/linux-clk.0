Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013040.outbound.protection.outlook.com [40.107.162.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CC7175A95;
	Sat,  9 May 2026 02:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778294984; cv=fail; b=CiPmnqkuzxx3Z65xdiGr9ptcaw86lLBu1S5i3YRjVKEn/wtkADe2jRqNvOJ3XBPBKgktMdHsQurOprFj05vG29bKmhF4u81BEtDC5m9zIT2fFHCTVx5kdrCtMj8OhDlFl78BhY9PFN5h8uPRGJIOSJtk8XVUJHZoZ6lVrqt9Fi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778294984; c=relaxed/simple;
	bh=xe93mJkfZ9b62sf/IKheYPsC9M5lh1+JQ6snTCB5UIc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=p2xuW7VvYz9q8gVtb11EdSJ30UmVext/5YKRh3EkTWsd4pi4uIgONuQNMPVoU+Rqh0+w+QYTB9Q4LWiBJS/WVVVcOnmy0vYV1KNj1dKyWOZhbNCgUGj4FN5H4inDodsOlqZd2SfvgX0LJQtekKtfkZI93z/ogvlhHUaqEKpUYP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VtIgBbFe; arc=fail smtp.client-ip=40.107.162.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VtIgBbFe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbU0uLn/EwJfYQFKuFT2fvI33tsThEb7RD+mIlp4MVMYWxDatu0WWQFb2Fhg3gysdu6E2/HbJAFOPqSthegLijvJ5ipU/OY3VaBa+LLVkyMtvaOZeaaTbOa/TgRU8w188WJia07qiMu3iuYnOELs5QnmIklW26xmMRdRX2z3TQ/uC+T6C8Eizs5EIdZjEKnu403e0bcbmYkYjDQ6k0Lh17JZJ4uqpvogtkimtDOwijVENjrnd2yGPVTpInAqOPSc9mRKsRiI+VQOnDxAphe0EVZq8TQJmi49pGxxCptPQGQfr2IvGcnUDURsxlBapLxcCccYDUW8BRFlCvQlJ/YiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiQ04hCytCvwZvMgNweasyhII6kR/cmSENS+sE7sERQ=;
 b=OnqSZ1ZkcVrcivNr/eWUkQY+KfF7yvLf7bYCW0+ZSRDcn9ALhMegDgPMVR26VS3Ui3aXvLnLWknlw2iNEOjo37ylTeobmdSP3aeMnogaD8o0rbvvWLlqxxdH1yZOuhbPFxAzdZMFKYrr8ea9xX4WExESGT5s1WmrbT9YPn0t3yQkB/yZYT5R8CMFc+TD+c2IX8p0YrHdgAcYcbtXcgJUfAF/x7gfb3OLoZKjvCkVcnFFRPy+Ejq0OVZVnnVRDutsv5Jdjthib7Gzcf8+gRSBtza+FgGEOwkanbxU/4qs5Wv8RtLlIa1tzy882o4NtWD1hO/vJ4qhQGHKbHywj4nYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiQ04hCytCvwZvMgNweasyhII6kR/cmSENS+sE7sERQ=;
 b=VtIgBbFeMmL8EK6n1xHjnqlhn15aONf+SgRPCDxBpiJbl0/TARL+TYA0PuYqj6WQWqjZgOG0WORd5LUAk5y+tDNV57kE5tQdNA8Ux2dMAD8frkIdGInc9TLPvD15mHiY/OLgiiJEiTjPphE4kHDgZX8R9anFaUZM68k1EdJeJNJ2JE/eP9yJ4lPF9OrHhITca4HSI0V8H5+JJUJmVxr39n+WQxwmVMdit8T1D1hE9axwVyQmOGYbuqPE1oY7G0NzIDlstnTCCHJCCrU1vXVq88vA2qbqWDK2spOGvn7+RHiZZYDFJA7rOGTcgHYgrlpcKIa8ikCEzrbjSNKJBwgG1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by VI0PR04MB11989.eurprd04.prod.outlook.com (2603:10a6:800:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 02:49:38 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Sat, 9 May 2026
 02:49:38 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: freescale: Add IMX-AUD-IO daughter board support
Date: Sat,  9 May 2026 11:48:41 +0900
Message-ID: <20260509024846.2094049-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0106.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::21) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|VI0PR04MB11989:EE_
X-MS-Office365-Filtering-Correlation-Id: d11186ec-91a0-46bb-052a-08dead759c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	EfH2v+n1LzLJT1QttTC0cosNXnjVGViiRZHKd2UJmlN4ahH/97d4PEiLp05xGh5uc/IhJRXzwrYwmwI/rGiPconL0osjiTqxSa4n6Ove8g0PUs9fiL90T8FmyKnclMNiJHkh94aicf/++ZJ2YX2tqbzzT+kcLQUR5K01MEBrh7Yb89Od/nnKUbgWS1WYiMbU4yVVjSMU9fXxUwq63gXsxrMro5sy5ldIvzoTps6G2XNKN1OGFVsCi9UvxntKBbMtxw0+YVrAraB67E7vXV9LcwHKLtu69w1g0dx51PM0eRUJ6nBQAZHP63nGJTk1OFy0bGbZkTqiamrLpoYPcOKhDYgG8doPKJTfUCKbpQNoxifxdLQh8cWnZzXeAQdI+hg0oesWS2zsMqtruRj5Ubco2D2/e2tGgxJWrVO1c513YhbOg8LNge1NDfsXgPUmUGrRqqD88AQ+we8xliwFik6v6LYCG/qSibR0KWIZXQ41oDTFrvponBDOPvU1hRfGl2plresF+19oWOiSybjA9T0beiJfkImEY8igPPFRWjYpoHiZ5XG3doe9F9yhYWpjpgnzRa5VjdDiW5DIv1NS4Z7g5hbo0XVmgp0VNOy89qP8jvGMHgk1/dGG3rHaEArE5Kp3YGcuHUe5iqvQD5rwVr87ftxnNOEFiInA6ckAc9Mvmb24tjwh+68zk4w8Gd01FFTnq0zGacop1bqVJDZ6z8cuM4UeVVqprKkxXL5thZ6k9zY/ovGo5h8XZEka78rpCS19
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TJqQkEzNUkqkrTmh8xxhE/YC9XLbvgCkfrKkkiV16MgYv4q3KbT3RcMUxTt2?=
 =?us-ascii?Q?P5mY3niACb7vXARbkdPBhxJJDmG8zaOYwpziBlqrtrKqn4wlZMT0lcsu8D7A?=
 =?us-ascii?Q?abPLl02HlA6ha9r5tCC157ycJ68k69q9gBlmqvb+PrxPunTEgfc0o6LOuFvg?=
 =?us-ascii?Q?SfA89HqN4kl/ZRMIfWmY7lD6FuhmrKmO1e1IeQkF/kM486Fw9gVuV9XF8dNd?=
 =?us-ascii?Q?IpCIu3kC0cbjpdAhFbBOetmhxir4ZvAYOUU3bDonx1o06joy/hCQ2m0lRuTr?=
 =?us-ascii?Q?5ilbZZngzWcIR9JfdyAHqoeba8Q6P3D/9uz3nJfLIkc+E1AbFCH6sqdWejHz?=
 =?us-ascii?Q?ck4N0OJ/CW/3EfBth24brQGV7WiEMWxVv16ee84MTqQAKGfZTY7H8U0NEgia?=
 =?us-ascii?Q?1hRmMB4ne1Lxd0LAeolHHXXwSdm3ocdW/XasUsupCrJ/KXVOl4jG4DAuw1Y2?=
 =?us-ascii?Q?IVEZ37r/lUSJa9OCvIJ6MK2DPb36DxSo27OW5lijnSsTJgX9w3+P7lfXKZ5u?=
 =?us-ascii?Q?SCvitXM1QQwQVxTQbsxBtC34ZhJI01HDfiSeufqZCAsGH4pGZB11W5VmHY2Y?=
 =?us-ascii?Q?8j39oV7Y+dl6bkHVAztlh+EVCQLoT/EaIdtR2DkkXOSbJsx+3zTgJctqtxKL?=
 =?us-ascii?Q?KCM1KYkHbLlrbqLJ/OxdTx9WqfElQCKVbPBsd4kp2ixloEbOU4Msz40Z4v+8?=
 =?us-ascii?Q?2qlE3XVmdcZXgPAgu4ZCxDaeG+ZwqO6Mwc0qPztSCoRzG6/0AC2Te5cH6oTD?=
 =?us-ascii?Q?jQZCqI4rT3V5qZpGL+ft/hYDZ9KH2bNxFtZ4ua+FOUfKwog8D3fslQFpPiy3?=
 =?us-ascii?Q?FNDdX2+BXiGTp8WNfs8TVJdFK9/ZUi15fiBfuZ6fFlm+D2pJ+mLYX1HXDtcQ?=
 =?us-ascii?Q?FV14o/7g6h2QYd8+3ujuSFRKQjBDMomnjNYqu78L5ypG02OfQDTEBAIWBoUw?=
 =?us-ascii?Q?SMB0roGGpQB3N6dNZc/LUfpxRAnHSoc0goQv3WW3oMvIv3nzO73/+evoGC/h?=
 =?us-ascii?Q?2t0l3FmZg6S44VKc+3syKyyLL6IMYhQKctZI1Hf/un7ln9qkRDuS2XeJAQAD?=
 =?us-ascii?Q?BTnrrYZkao7bjcJGpCkWJBuhddyM92hlk9HceSpn/1iMNRFdf5Ih3APd+ojR?=
 =?us-ascii?Q?3IrxOetOWzRwdNYw8y6z9Kx9VSU7swYh5+ryWOx4fupFR9g6CNFrOm2VY+9a?=
 =?us-ascii?Q?g4J0xe2MdlybGb4mwQeTwGhFVRBtcpvS7zE7JWYGH4vTAan1AlYvn1tT6y3Y?=
 =?us-ascii?Q?5ely3Amtr419SMfpAlX7tFCY1dtR0JjrV0C1GXgF2mOAI8XMUSReOyFro/Ob?=
 =?us-ascii?Q?2SWpb03tzWJDMHJD5vKdz0T2DChWIhv6qA+Dk3MrytzsQSVK9XSJSrhSKvMz?=
 =?us-ascii?Q?GdrrXtBcDpS7WsZ14Lt9PTebeMBcgqdVHTuDmT4lTUaVdkwref29iQYvJyNI?=
 =?us-ascii?Q?nu4Zzt1E4OWkK6MkaaXLwEeLQfogAO9ciywwgTMxpZjP59ZDdHyaemiKKK64?=
 =?us-ascii?Q?ZaXpdrO1oXVidjkozDBu4xuAGSjIbvqyCmHkwBSgD/Tz4ohC8FJtvLKtbkMK?=
 =?us-ascii?Q?rdB1hPL7MObgfxet/IJntLuBiJIjFQsK+fx8YmoddF7nS4BwXvoBBKDliwuk?=
 =?us-ascii?Q?bpOJ/7dODkSsO4OqsSJy5M92IBedMkh9kGWxXw5yZH+SbJdbye9xyjNNehw5?=
 =?us-ascii?Q?AmVsC5GgzM8L6U6WzN6pdZa0k6Ro/jirW3WCPClflkCEfahM3czvbCBBbTDF?=
 =?us-ascii?Q?IGmnqTAB5w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d11186ec-91a0-46bb-052a-08dead759c90
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 02:49:38.4525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/CRCbBM3N1SkhabHmcUj9/PCZlBYwC9yNL+NlodWUwO/K0zWl2s2ukJ0WpcLqChwats2Ehhse1LFKg4Fo/O0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11989

This patch series adds support for the IMX-AUD-IO daughter board[1] on
the i.MX95 19x19 EVK and i.MX952 EVK platforms.

IMX-AUD-IO is an audio I/O expansion board that can be connected to the
base board through a physically present I/O connector. Add a new
fsl,io-connector Device Tree binding to describe such connector which
acts as a nexus that exposes a constrained subset of GPIO, clock, PWM
and interrupt resources to the daughter board via fixed electrical
wiring. All actual hardware providers remain on the base board.

Also update the EVK base Device Trees to describe the connector and
required board-level resources. Add a DTS overlay to enable the
IMX-AUD-IO board.

The approach used here is inspired by the discussion[2] where a
connector is described as a nexus mapping board-level resources. One
important difference in this case is that the IMX-AUD-IO daughter board
is not a hot-pluggable device. The board is connected to the connector
before boot and remains present for the lifetime of the system. As a
result, the connector is modeled to describe fixed, boot-time hardware
wiring rather than runtime attachment or hot.

[1]https://www.nxp.com/part/IMX-AUD-IO
[2]https://lore.kernel.org/linux-devicetree/20250902105710.00512c6d@booty/

Chancel Liu (5):
  clk: Add support for clock nexus dt bindings
  dt-bindings: connector: Add fsl,io-connector binding
  arm64: dts: freescale: imx95-19x19-evk: Add IMX-AUD-IO board support
  arm64: dts: freescale: imx952-evk: Add IMX-AUD-IO board support
  arm64: dts: freescale: Add common DTS overlay for IMX-AUD-IO daughter
    board

 .../bindings/connector/fsl,io-connector.yaml  | 94 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/Makefile        |  4 +
 arch/arm64/boot/dts/freescale/imx-aud-io.dtso | 58 ++++++++++++
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 53 ++++++++++-
 arch/arm64/boot/dts/freescale/imx952-evk.dts  | 68 +++++++++++++-
 drivers/clk/clk.c                             |  4 +-
 6 files changed, 275 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/connector/fsl,io-connector.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx-aud-io.dtso

--
2.50.1

