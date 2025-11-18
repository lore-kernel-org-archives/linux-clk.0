Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53CB2FFF86;
	Tue, 18 Nov 2025 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763451621; cv=fail; b=aSUMkNBhEjuph3wGjIyidYUlz2iOwBQs9qHZkebtlV2fbqhV2qzm57ci7oFRgRN7Uq3v8VJYY65L4JX2L3lRMir8GRQw0WWN1iDDynDKR6dpSykG2eCFBa2KWZzL5Z0GFL/amVhDJee+ZnSUpCbt/moVuvRymqniajoxQJy24qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763451621; c=relaxed/simple;
	bh=tyXzk5iGEhLfhWMMcVWnRQB6b2z+4UPNlEGslF+OxG8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IzBLQVW7PH4TW6nljXKHyRTOuPosxDLpOS8szAVSNwq/ID4xUCJ4MpXP1i3mvu6QZKzoFWVLJ4zF3E80YJzQemdAFeMqMtWyg84tUH9Z1gcOksM4axu4UDPGY4EQb/MOkfFUBibfIBXBRS/4WDRlL5VElPYN6PA24mnbPwe0RRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O9I+eqGD; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O9I+eqGD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VI6i6OXbkc0NIm7F/etrz9UqVaFNI0FopFbUk9byXs6eui2OCXCqZ55ys+CWBVB7fCoZBA7KlFBchTpeStokqShE4C9trZD9aejsO54t9n7HiQ47swgORhv3C8VV5Pr+DTJDHsND8xkGlHHard8kYRxCsITEuQmgZgjZm/1m6PN3KtkeI2/vbDOm3NYsFsci0MuAb7HwX3ZBi2KSJOtnUIQyPcb9lcYvNDCxiRlmsiH++YVvmXr7enrbz9uP1aQg67ksYejBHMmP5lMZ4v4Am1wsUJ0pBXODfDr/0TowV3tRpIjeQuRXggnHT+tnDeaQS6umKgMy68lpLmzjYrEM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekAJ7t0CT22iXSkdJMz8ymONWzkvmjCeflYb/NzsnzQ=;
 b=OVxp+tvnbagwxjRsejsKJu/etr7qFVdEb//pPxvLkExbSERaEkY0vNJToBd9cBBSdatdnDoCvVSc655Dl3/tA39Mp41oodP1UA1evBpqZ5B4s+SA+sNoWWI4zhW6lydwrPynPlYGnHxNXUARLd/Hw/U1ROx4mOD/QhagfZUmy7f/sHdHDKd/xKGENLEFXd+G93kquEIyU9XC6atsu3KIohdV9PoSM6esJ6JqcUVNR+XNvMm6iaUUlXy7BCDJUhXe5zy7jzkUmXnkHcXqo1xzKIH7aZoEoWt8TibaV+lgtVF+qFPqusvWXCM5VNPAifC0/yp1nk4kMjom/Kh47bJUIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekAJ7t0CT22iXSkdJMz8ymONWzkvmjCeflYb/NzsnzQ=;
 b=O9I+eqGDk44Y+oetOUic2EMxZER2W6QDn1rgZQuGYSP2OzK/vJR/n8yEa5vj635wTGgb/7xgpbaR0Wl5BwVlp8nQFRPzJe2GLkS+Cgz9gCpih5dwjBNUCNCwmRF+Zs2b5CMiWyO1OgHAKFFZPQjkL9ovWSBAIqskYtC5Y6ULn9tZ1MBZw3WXBVDDwKQ7vy69clWzX8KbLYA5rKasJcLBKCoaNhJ/nrQsNBRnInWWWkKDGK0GDAnm4hHyh1Ox9wR/wILN/Z6yr4SVQYKlMzL1s+L+Gxe7xYJXBwAC3+Re/wuWtIRS0ZaeIqFwGED+nieMXV4atCG80U4CF0DPvUL/Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS8PR04MB7976.eurprd04.prod.outlook.com (2603:10a6:20b:2af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 07:40:15 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 07:40:15 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	Frank.Li@nxp.com,
	hongxing.zhu@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: clock: imx95: add PCIE and USB PHY clk
Date: Tue, 18 Nov 2025 15:40:52 +0800
Message-Id: <20251118074055.2523766-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::12) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS8PR04MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b76d92-70a5-4684-2afb-08de2675b678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MV1AuQcolvvHsFeLBec0XcjMiT4y61RcsdNRBku5tP18bMVil3R3s4YgLMFi?=
 =?us-ascii?Q?qrbXIZh6tMnrewWeowCcymbfVQRu4zdcRRLJw76/9N7KefxqVUhFwN1Oe2Tu?=
 =?us-ascii?Q?hNG+v0+TPUGzpwnC/2fFXpGv26MFNxTNDa0G/pejbQyn0JWZM95ZB5yVdziJ?=
 =?us-ascii?Q?qa2M1XAke+/qyBeqIiwiA2VhYenUgYUuO/IJWg973/vsqVi79fIxa9J9oWbH?=
 =?us-ascii?Q?mx5jLZrKX3s4V8kdhJ2bJIe5U6P6UaBWYkreiP9wxzt6JAluxtDpP8YTHAeE?=
 =?us-ascii?Q?xI5FZ5lGfHwqZb9oGSZNuHgPERPPHzCgoFaWBMTnfNxNcweWIenXNZB2CpU0?=
 =?us-ascii?Q?6nkMqH1lfn/tiYjmWLlPyjQNpsKRvuYce5HrqpKJJjQs3r2IveMUkHN5PfBE?=
 =?us-ascii?Q?IXSBnFbZIuyb1+aEq7JxGitbJXdOREoSISr44kEbz8KOIvRhkdW7JGpNXLgQ?=
 =?us-ascii?Q?/4GHzDpV99eBjkNitMBdrpsmestczzdJUHCnrAvrNTK8Gvw6QMLTgH136PmB?=
 =?us-ascii?Q?6VBA+51f7ZRzDi8o98Fxb30a+5YQOTxwg/iMJRLvAGNy8ddqbQmvqEcSdTVF?=
 =?us-ascii?Q?m3EKoXrvKONyXlRzWswUqE5RaMF7/+vJm1STNDn64sTP6QQ1hX/J3hThkP3e?=
 =?us-ascii?Q?ZXsNk32Vay/Cj35ycSSXgtG1uvCkvPcXiWpel0cRKmT6rSnZiQZYWCCiZyuI?=
 =?us-ascii?Q?ac0/FLWeYHmqv8aLhIXhhOUhJc6uBVtdwCUDTDwTlYQHEWpv+BJqJT4BMSGM?=
 =?us-ascii?Q?OWIOuzLJ5aGjq6/tBfzQLp4AuKPHvd9ZiX58na4z9qEMHCwjiF/q/7h6nire?=
 =?us-ascii?Q?NrmzY+Scf7qS8si0gio8vEwNLs4paClpUWMVRk2YfsgJFME20Ncs8gFu5wgp?=
 =?us-ascii?Q?kAbacpC6TXLcRiNTZDyCWZnXvPBmankF7BSBQgfIMPx4f/VyGYg4ZBS4b0xa?=
 =?us-ascii?Q?tLkEBrXoZRLzKXWQe+cz7HfCBFxzsJyM6Gwuy6cELDg2DLbet1vLyVbjMhbR?=
 =?us-ascii?Q?MpKK67QzbsdlXYJPnFBej6AzoFxsfhR+osolJS6uACd4HvAWg2YuiymYmjy/?=
 =?us-ascii?Q?9zHXVp5uu01k5Ncfrh24+K0igwLkbe1CoJ1Eh8H7Ge1gnDqLT3R64+exuKB5?=
 =?us-ascii?Q?WN66fhvBa5Ge1V4l4aEVcSfxBSe54A787evOvAD/+xA5RrbY2pwdBIsZuw52?=
 =?us-ascii?Q?22MAignC+bjW+88mD6QzsiGSvi7LG8URd+JN4t/IsjrkdmvtihugLhU9km13?=
 =?us-ascii?Q?uW1t0uvXfHZnv+KQoWAiwJlpdCAY/XOye4Gq10QymLHferKRODWlg9rMblPc?=
 =?us-ascii?Q?tva6a+6Jb+I9xNZREh8mM+qIcCsctHhximCJqICT4D5GbNWiftngK4843VOe?=
 =?us-ascii?Q?b7qsZWa3Y+qjjwOqfkYMcpRxXit3P7hOr3BfnUrok9ZN30rzYEt/rcNCPpU7?=
 =?us-ascii?Q?r4f7+nAnYGBxb05hK7BfRJfw4M3PKQfO12aLcPfeF4SPNq96JSDa9FOEwy9R?=
 =?us-ascii?Q?nEizwNSN/Qm7xm4jpfbFvj1WcLrqtNZivpdppArXpjZwWqAu7X33VnrbIg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LR8ihWv1pxNx8vgHNeQ7OPunGkD2PPK5LZw1+Bpaop996KKuRMLmE5364Hl9?=
 =?us-ascii?Q?LZv5+WoD0sCicNg2mQHbk7nUcSH+DAobig6ZeK+2hqqPXpYQ+5ulYwMGI2RP?=
 =?us-ascii?Q?QCcB6kwYkwupafMH+6AT//nJwvrkOkKuuNJJV4WtL3IAQQuZUxC/p3sHFmPX?=
 =?us-ascii?Q?ZeXZD9gqrgv4snIv99K3w0YzcJh64tXi5iJGVVHII5VEjEGpKoQl+1CccHDR?=
 =?us-ascii?Q?3p7vMnlexJA/0r5Mfg5HYzdEK3ParcRQ9tbZVCNgTzhWuMwXcN/BSQB5ibYY?=
 =?us-ascii?Q?vYvPJQYTRIj996Wjirwq3qSmbCniQLacVqttDPT5///6u+xPOTpuUvGnPmh5?=
 =?us-ascii?Q?1OOYqEKqO9aGTurjzR+hMdnilZANewxRrZasPCXmCCGmD8BvB3B6G5cqNXLv?=
 =?us-ascii?Q?zEgEUyfV+hO8YjnOJChettJuBnzwJ+27SyBMJXG3iJOCWSox9V3zjBsoCzCn?=
 =?us-ascii?Q?QuR0okWQSv4q9xCADc2BteOJs1kd89RLdNArKpJZKhWJfJ1ltlMas0QpCNX4?=
 =?us-ascii?Q?Ph9i98tKfNIJz8KX/kAvXfyrVPDVLE7xlA7Mlro0ID5gA90cXwzhsw8RHxTc?=
 =?us-ascii?Q?Dk31IM+nJctRauRu+DKF9InUQNonCB+7+BLm9KQRyKneY5rpTXF44qoAwaSa?=
 =?us-ascii?Q?K/Y7RDfApYD4PxP/IYrmKBe+1eogAugwVil35Uki4I+pvUtzCT/sN9AKzN1R?=
 =?us-ascii?Q?TmQD3brD63X5F/6zNFdsHYRbf/1wl9jPiUqdONz4sV1JK0NreuvJDVn+Cyvt?=
 =?us-ascii?Q?2GU2h/WWSAN81bTbNZW2TuaJ9zcdXBMc5nVYrGGm4qnM9NaEjGRF8D71RBfK?=
 =?us-ascii?Q?qScSTFQFXVB43BIK/rdLlGdvcsjiJW0p7dhp/3pLyihtNfRUj40Vx9EN/9tC?=
 =?us-ascii?Q?Zy1zVdgcCBY+M+MP9yujgrA8Pl6otCf/aWUEZu2mSg6/j9b6S2YrtOLlBujq?=
 =?us-ascii?Q?tknUZyI3vz4WeIIHp3AO76+UVHvvw963dKVKaRaiwVnQKJXMx2gCZu8dKljz?=
 =?us-ascii?Q?KdChIxNb2NH0JBmWR65fhHU6meH+UVPXqWilq2yvbqBhOmiz7aXqU5TyrCmd?=
 =?us-ascii?Q?lTmJ+C4YoeD6ksZEGhknxgEGwksWyGgA3YF3myaHLYqefXaZi5tvyn0Vq8Mf?=
 =?us-ascii?Q?PReTglYj4yq93dsns9gxB2myk+ATy9y3wK3Y1YmhtgKGxhSwYxLLp6BMvayj?=
 =?us-ascii?Q?YATz8HSo3gst+jgHYPu/a4CB93igwNnuiLykQeA8zL2Owd4NE3qRPPGSvExR?=
 =?us-ascii?Q?ZCl19sJtEI5cHiyjyEtv1ihOXNi/6OfXYXZC1D6a8+mpmkNI7kU1zAKK0m9N?=
 =?us-ascii?Q?+LTtuEt7D4vCMZxdaf4dPd9mXBygRKZbRV+fy7GevX186fGiIvFkUCFZUJIB?=
 =?us-ascii?Q?iO0T4Awmh5stIDgvUcEkN4rHRvMRji8UEZjuEboG1lzrexXnNyLmk2fygX9I?=
 =?us-ascii?Q?JDEYrckfseg1wffdJRH6BZFEuE6r3v4SZEJVrN9dAt//MVtrnRp1fjsmKc7B?=
 =?us-ascii?Q?qqMopxpcQA2eEI989DI7/IQhnzT8aPpoRn3i3KKWIrmdFYPKAbc6Kvs8qrOw?=
 =?us-ascii?Q?J6YHE31BiRZ3Bv+XKyFotaUFHk4osY75YM6s8b3w?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b76d92-70a5-4684-2afb-08de2675b678
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 07:40:15.1102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43nYIuNx5ZktAh94duUJVkMurCdFQDa/zC8pwfpfudown9qV9Pyge4Vsh/zyQvCxdZd5kzkUCXLuBV51aPab3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7976

Add two clock definition in HSIOMIX.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 include/dt-bindings/clock/nxp,imx95-clock.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/nxp,imx95-clock.h b/include/dt-bindings/clock/nxp,imx95-clock.h
index b7a713a9ac8c..a70a1473907d 100644
--- a/include/dt-bindings/clock/nxp,imx95-clock.h
+++ b/include/dt-bindings/clock/nxp,imx95-clock.h
@@ -28,4 +28,7 @@
 #define IMX95_CLK_NETCMIX_ENETC0_RMII		0
 #define IMX95_CLK_NETCMIX_ENETC1_RMII		1
 
+#define IMX95_CLK_HSIOMIX_PCIE_CLK_GATE		0
+#define IMX95_CLK_HSIOMIX_USB_PHY_CLK_SEL	1
+
 #endif	/* __DT_BINDINGS_CLOCK_IMX95_H */
-- 
2.34.1

