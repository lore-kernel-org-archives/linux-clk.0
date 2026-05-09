Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDEB37AA8B;
	Sat,  9 May 2026 02:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778294987; cv=fail; b=qG3zCfY7zkevBIUt/A0duaromqIOYufoP/DQkSnIIdCyV+XEya6lvnYwNjWB/UJUaIuFzbky6iXBwDaRe22NAtn+uwEBguqFnopyXJ80n/oEiit0iifjKQDHz9Yyg9j4uw6WXozp/JaBdG9fYHQWX6NH/LA75pxifSjALmG9AMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778294987; c=relaxed/simple;
	bh=IIzDsiwJxFCSiUdVM+dBUanPnd0dYxbzcsrmJiEBGgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TjxY8Uu/5kXLbFyrFK2RKwjXBuQUv6j8s3thTvzsozm6E28wT0SL8hBVa7evRZ3cQmnmnS9pJvfYaD5rKopQZcMxAZFl/pGeYnGhPD9LS4Xt6gcAf+QyEW4YdlVmWiEoLkZPFA7eqKkcuy7Ml8ncpu1mB17RPx/OVfBPPpD1XiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CmW6AojW; arc=fail smtp.client-ip=40.107.162.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CmW6AojW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjCX0GkdbZsrwAJPQNrwT/WzHebRmqXldDI1JIkWwgCTpiqD+jjFMiUNnqEeMTKWtdmOWMQbX5wq0jHyi3VR9VtqN5mGZiuVmo+dhmKEWRUW6sn+W65XNH6vMaeh/ZSMRu6NirOaUzZYIdCJ08YrCsMR9v6YdfzYYGhR9fEoOY97Mc6tswPNbk9fwgOWU4gDfTJAdt0lj6WIuMSeOJpJn4ueCueR+OJJZ664370JH6hUoe08RJCyeTtgbMHdHLnKy6qWqq1q9X4RipJsdhxVwfokY+1aY2a0FtsnNK3X0bEQZHerG7kp1PQHsUsrAbgiERLmW6kz/vLcR1VbMkFlXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrzCrSB0As+fJcYdZHqouJWVEDqltTWXylJnDS2+c8Q=;
 b=GYLYDktnFvBFgZCJFb2uevEZsZgyiOyyO4+gmS1h6euVMyUh2MFCxEneY3YN7ZpR9EmGX9ZAs4aECFxuF14tD28TB+wrvIq5EDaAgscoF4yusZMK8776+1yWu4zkCWjVXKgxz8qLXX1vfJ2wo5JThTzvAo0KnninOzSdTUgmf/QMukfo0qEIE2wHE6MC6kbEPUT22HM2lDnj74DKfWB8wOKQA8EXH9cv2VljDKE+HyieEPRgZovgOlxmgvL66lntHA9yGzYcqG2AhxjaAAfOP8AK5wUPclFFr43RUDVpTfmg8SUWYAbS2mZQfM1cgo36bVSKOuahiMHrGzkm+UWmqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrzCrSB0As+fJcYdZHqouJWVEDqltTWXylJnDS2+c8Q=;
 b=CmW6AojWcb+8Hl18arn5kF6fmbMpieGqHQvHTQypokWxgF99otZrV2E1TBUrlfR0O7cqo1e5MIDOk2ukYwJdB0Wq3bObLQpXzu5oHdPoSBBi+RMZ2ycGDxstEktdr/Nzax2AsgxTIa1GfiQ3EZ8ydmslBH4frSvnWcnEmMjksVhtcdyguH9q0RQPw8ivCfP7Kk1Ke+G4kSGCLrbUC2eYf1qOWI+eSu7Kzk5EgAiQyBmY3oM21aNMjEWCTeoS0p0fr2vsyencGVlWPeQQPrm79H8JeNpSZO5NzzFbaZCTbUCrdaeUxbFSU5KJea5a+Gu/7z5YduTFmPLbtbKDBpYV1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by VI0PR04MB11989.eurprd04.prod.outlook.com (2603:10a6:800:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 02:49:43 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Sat, 9 May 2026
 02:49:43 +0000
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
Subject: [PATCH 1/5] clk: Add support for clock nexus dt bindings
Date: Sat,  9 May 2026 11:48:42 +0900
Message-ID: <20260509024846.2094049-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260509024846.2094049-1-chancel.liu@nxp.com>
References: <20260509024846.2094049-1-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 46d3de9c-6d6b-42cf-fb90-08dead759f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|18002099003|22082099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	Z8xkytCU7ujbIm+v6xzJnwlJp/Q3wZONHuxv5WYnNjKJsYTf5jsu94T+q5bEUBeSZfl+Jm+/8seNGhd90fECsKG289ak7Rzuk+n2iaxzY5SeNTor9MtGIlNh3KG2QbG60maZZLO74DStLrDwKB3h76r6ITFWmKM8+SZgDQS9X8vxK5gRzSopf/X7urFnR9iKRrIbZQshWuQr3lmRtstEBZ8wF3QaFiwdrGz9Jxorh7VFV1hjm/WQ5pkO3mHeUf75oDzccLpFM/4abTjId3s6jHHMA478M1TESUTrgHpfy71lkmDpKzxBeAkM3VePcNWhJX1ga3vPNTy3K6gygce5Mg4Lc7iExvf1A9qAAw6PuaD5oTZ0bIIy+vAcjUluirTNEg07hwPPXZEbhre3IX+cYALVjmwBK/DFBxa7SNZpt+nnXPAwm7jU+ebXSqd+jvBmYPt24CnKybYywOwmaf2erXNMKN8ybj+udo3+OasNqVC8MN9u8l0lqVlXzcrmcyQ/h5mQQ9yNe7K7YPQYomCllZZx/NiwvaYq0q8MfcSvCwbbEy7d3oAgf1xDjEJxlCPzWXmfUJExPFbuU561quSj6s6b/JRhTOfYV9I4FSj1SO0fCS+pUIMgJT25eP9IuO+34zSxtElx7d+1nArsZE/TOEgETOFetcivPNmiAulPcj+7ypcFFZ+FJ3rwFNGOJaN64anBNDWVXCq9bqh6w43T3BcSMSUOui3TrQS21iKkX5YopWO5ovFZxLW/5NHZox4l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(18002099003)(22082099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dE0iHiW/HusBNfDehmfQcXzNWX1b2M6J3LKQLWOj8ZbZ2SAFH34Zl8bpMPiW?=
 =?us-ascii?Q?Y9auHpziIuk0ZdG+QFRQ+C30UBRrwv3CKh+41PGbxX6UDtfwpEPowLGerH75?=
 =?us-ascii?Q?8XCE0magoVI/Gs4rHw2/9WgIYqowjeyG8bB/1ZMSHJKm6HFnpB6BUeAgLgmb?=
 =?us-ascii?Q?Ja9V04JxlItjfTfGgl2OazYNn/Y3xuDUJPMFz/RxoaIeLDqj0pfxkuk4YVjc?=
 =?us-ascii?Q?KcqpVvQcnvAnpRoWQoMP9yZvMsffqFtBNPrvDA7aAkXzyxDkem3zplQrj11d?=
 =?us-ascii?Q?E6jigKnIridkWhC4GbPt2ZP5WW4ZQ5UZL4YXQjDIv/i1od/nQM3Fdixm2Abe?=
 =?us-ascii?Q?scs+5Bfe2nhEC/F3mu94gyQ71rO2ytJoHdi/sw9HxrLNQen8xKaYXS1GJ4EQ?=
 =?us-ascii?Q?oU1c88xmULbAbRGe3QG3TbOKHbCF88hOTpISDV9O9GZLnElNJ6d7KqXuYoXD?=
 =?us-ascii?Q?GIuXZBhrEzfOrE0CvdLYUF7QXoCWT0abMGX4kb9/eRiF7AdodwtJkaqd/K7F?=
 =?us-ascii?Q?h+P0xvTPt3naMEH9JneVB5fGk4lCmJyP9JZfYK4wqQJth3LEqt6Dh+Dke0qT?=
 =?us-ascii?Q?r5Tx9LmED2OLTvPs381XmDEDX6rfR/ZmDoCbKBczdFIYx3HtfwvE+ACnpj88?=
 =?us-ascii?Q?SfixoEIaflcJQwnkKGCtXkuLImULRGRZDYNRO70QBuw1T/Uo0cK+Lfz6cV6i?=
 =?us-ascii?Q?cD48XDzEbP8szZZ0bocbmNVLChw5xmTmZRpxq9CqrPN2BXWzZI+SfQRAZ3HF?=
 =?us-ascii?Q?KS7vmZG/Blk9FG9LIfbdwFVnUYvynRHYvCjdkYAq4wfOTfa9NiaxL/67e7rg?=
 =?us-ascii?Q?RkRHkBe4l2LBTm0mtQ3vu9dtlLh6Q2UIQQDmKQD/4MwoNex49jKLA+8QpM7y?=
 =?us-ascii?Q?M22k0UtwPkHWW23Nz2d22QwSlhfIdjoJbgYGWJExndA337W3IazQFcEivtt9?=
 =?us-ascii?Q?/QPFPIbbnF5gqLkDIiybBI7IhfmrhgXV7oBJJq4zZKYY6SMt78zWBrfUc7gu?=
 =?us-ascii?Q?rgY17QANv0kQIzAg9ELcRac9HNEQ0W+RHxjobdAW0zcORsO2PGsz4KTabg2y?=
 =?us-ascii?Q?JJjraGJcgu38/weWAwrTabKKH962AlkYK9lZnKDoUSQc/v+TCYajovbeaII2?=
 =?us-ascii?Q?2OhgTdRXD3a2QgyKclrUMF13CMgryoSEzYBOsaVACBXmcqZO8fDRLgwkZ1Jk?=
 =?us-ascii?Q?jJfACJNkPVVeeQjozfhc2rdvv7LNfIaoqntK8LYN+2BVzrBOclMNamtKZDNp?=
 =?us-ascii?Q?gFwyVBTWQ4wjsJCHctN4ojy/5/+gL8N98/1QGK64M0NYKFQgaxTomXtgg6Pq?=
 =?us-ascii?Q?Pq633u5Lf4IWnzX6ECPVSLyp6rxHct9suIp5qRpY0vy09ZfG/bRzqnJ4AodY?=
 =?us-ascii?Q?ycUy5w7DKRAer2bjO+IvdopE5pevCaTUdS72T5b2nyP5vnAoDAmJ32LNOfiY?=
 =?us-ascii?Q?7DXGw16LaIejMP6w8l3/i0jBEsyuREnkNZDL12C0UM2N7fMuY+HITD1SJWBw?=
 =?us-ascii?Q?U7+NEohdlcDR0e2P03HeTBbwPpyHsYlXP9IR9GLm/wiiApX60EY8h/wbQvR2?=
 =?us-ascii?Q?Z6w9MgPm0jOt024FLqsHEa1Kw5pVrVDA4puCUur5r1iWI03h1tKTZLMC5xwz?=
 =?us-ascii?Q?6mfjyKTGDYVsLdEMyz+8ddG32++yjfyDhEviS8bMDSdIclxgZIH1m4I8zKdy?=
 =?us-ascii?Q?MzhwryOTGC8m0MoCyqkGBbYwBN8TSMcinc8YUrG7whoFzoCiBXqMY11xZo2N?=
 =?us-ascii?Q?laA5nk7q1A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d3de9c-6d6b-42cf-fb90-08dead759f63
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 02:49:43.1275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Maghu7ViyI23OOPssAMQNH2d51xwBweyJuUTJ6hKL2VwEZTU+4wMJgwHul2XYIiPtxzqlG5wl2x/XjWhTHquMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11989

Platforms can have a standardized connector/expansion slot that exposes
signals like clocks to expansion boards in an SoC agnostic way.

The support for nexus node has been added to handle those cases in
commit bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through
a nexus node"). This commit introduced of_parse_phandle_with_args_map()
to handle nexus nodes in a generic way. Currently the gpio subsystem
adopted the support in commit c11e6f0f04db ("gpio: Support gpio nexus dt
bindings") and pwm subsystem adopted the support in commit e71e46a6f19c4
("pwm: Add support for pwm nexus dt bindings").

Change the function call to use of_parse_phandle_with_args_map() that
parses the phandle lists of clocks to use the nexus variant. This
allows remapping phandles and their arguments through any number of
nexus nodes and end up with the actual clock provider being used.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 drivers/clk/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 048adfa86a5d..4240f059bec2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5206,8 +5206,8 @@ static int of_parse_clkspec(const struct device_node *np, int index,
 		 */
 		if (name)
 			index = of_property_match_string(np, "clock-names", name);
-		ret = of_parse_phandle_with_args(np, "clocks", "#clock-cells",
-						 index, out_args);
+		ret = of_parse_phandle_with_args_map(np, "clocks", "clock",
+						     index, out_args);
 		if (!ret)
 			break;
 		if (name && index >= 0)
-- 
2.50.1

