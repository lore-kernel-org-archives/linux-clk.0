Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013069.outbound.protection.outlook.com [52.101.83.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D4C3B05AC;
	Tue,  1 Sep 2026 19:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291453; cv=fail; b=hPyJEhtmenNPjxZNQRfOfw6wUpA61ioKJ+fp4TSLxdX/8kbzzLuuxAgUvqNCwGVsKFL5nmezXNgvtjFtklXFbz/WK70yfGmWvEJ0G2/QlpQ9zywXF+IG9T8UsA74NVLTwBClq+wMI2t9qmR/NPcS1BJHBdsoByMQuckCizp70XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291453; c=relaxed/simple;
	bh=WVWZrcV7DRXEjbI1w2cjWa9SpH3nsbGpNIlBH3V5YFo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=S1mqIwbUOMdUsYovoJpbqDuuYgrVZJjKBFKyNjQuodW8q5756d202Ti1khfC4vcLdpHDg0TegP1bgfElNqk/45C6K64kGmDf3utC3392S9r4OUFszK91VhFO5yNXlUGuSrfoALjTtBsIyKS3ZuM/QsGUtlUhyDldpOqaURKOHjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X8smMWL+; arc=fail smtp.client-ip=52.101.83.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X8smMWL+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7FVtb4/93QXEqNcfj66G0NtOqoPOZaeiRSiO3MLkO16p60KwTc/XHr8jiXgDia0bRRttnl9oIIcV6ow0z2/Pc4cK6efD6l8M9Cabbd0qNnZWuuNRdqFoXcvU6vjMrGTippMJpSrGHIzPbgW1ceSHI44Mi7nDpcWSMXcVtnUwJkZFj8zSK4/JRcoX+uy7bqPu3XFGgv8SwY89y2Eu0LMlFBs3WWYJLM+QrMS8nwMI+7MooDgEB0s2CPVEYC5di6xsJi2WD9ePSpjUyjrxY6Vq0IuixnEOkke2Fe00DnoFvPw/TnSKSbo21EbOmKbd1GMnOjJUsGHnrBhtG2SEFRTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9coXQbrdFuQ0I2N64E5IpczSfJCiCpk2zHWVJBW3Ek=;
 b=MKWOk1m/QCt8w6gMBLEK+wQGWBgO1Z60j07Ols4mT0UspLgMAx+X59kHPGVzBv4rpVBZj6fdfv+ONqA2FtKE/RdIqDZU2gh0pe8ASN8BLINhT9yN4/kShqegm6piF6A18Do45Ft5Is3EwuyYYkjBfTxq27cZrGerouMx4YvgwmVFcii4hR7eAl4u7Ss51h3Lbm2WmHnOnwWleFn3nX/zzcj2Ai+pjFytK0xGFJtEXuHhFFd4HZlj3d+RuuLL5qIZONXjeY5OAJmfKnouR/qPJvOceCI8hsWLXmoRr7SIo22UpKzqeWJMRU8AI6PGOQKMAfGOiCzM0lS6w2qtLEQ+kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9coXQbrdFuQ0I2N64E5IpczSfJCiCpk2zHWVJBW3Ek=;
 b=X8smMWL+xImA9GHw/7uhFuXj2jqVSxw17VGqHTeXrGD3hvJRvQ255VB5C32zR39M4P+4+iNAM5rV29wg0gCfk/mrgfy2lVqYuZPtp1Xk4NjwLkJk80f9kggXNqhjSAgzRHfVMIX/Vx0+3sNUZ/rdWPHqy7QUk4d2gv8OI04vl6vmYmJsYXJOPyjJjpDPYppzzKStczkCMiTGjo5uzUa4EVRhv3nO3VK/ave7i4kuopSa2BiwvtOM685MtMyYFDCUtbRleRsKPMgdrGReNxWS/rJ5ecIR2rUuzcARYyP2yC/9v8b+p5Nuq74oxQ+5t4cLdaS+BwJFn9CYxJRmPCxQHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10596.eurprd04.prod.outlook.com (2603:10a6:800:278::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 19:37:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 19:37:27 +0000
From: Frank.Li@oss.nxp.com
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org (open list:NXP i.MX CLOCK DRIVERS),
	imx@lists.linux.dev (open list:NXP i.MX CLOCK DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: clock: imx5: add assigned-clock* properties
Date: Tue,  1 Sep 2026 15:37:19 -0400
Message-ID: <20260901193720.1066686-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR11CA0008.namprd11.prod.outlook.com
 (2603:10b6:930:8d::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10596:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4527cb-7813-4e58-737f-08df086074a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|7416014|366016|6133799003|921020|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ayCWuQJ5goLRGWTk2Ihocd08iOP8I0GMrj4JbKKQ124GtO3JkMvvJ50uUHmkhusEHAfU4Fx1UEo7UTUq4n5wk/tM2b9CHt+jLD1whJZi+hh0Z2egqtk5r8+7/W2/ZIuNL0GFkJ8fOXFGsDS9o/KYEuTKIB1gp7OUIFh++mvlPhOsiEHJ0RRXakBu1btprAdoA0CSWHdIEKvw1ng2Sz/lwnlHKDCCg/RZLLKrDAtj1sW3jRMxQOOgN4y7eZDSBW9KVmg2hwbYEh8Xs9b09DHiu5GzVlqbAbRDsYsG5nBhwUp045psm7nHlMRs+G6aLNd3la6hUGyzh+J+PNYYh6IEERRZzOLBfhZVZ6Fhq+K+Lj+mV855/xfc6BEDNDVCzuwuinRFuxgHDgc9v8fL4F+wMA+Nz8FArFZSBCp4MyEKR2orLi3nhshEtPNTNr/hltv9qJFuHoX25hDVM83bq0OclGfvtV7hL3lCYPI/tz2lB40VGOJkQxMsebf1ptEm/onM++pts4bH5CQzyo1+LaMrdh+vzlSyAaDSifCg+1duVLrNiYk0pXP0c7pYpFWSR5YZFo8L3ma22EuiHEEtfotzLcvP+qlaCDGCk7KPdZCw/NskDX64B5oqu+WCYzkJ4sz6pD7cWjsWfRhFhWH8R407pMoKx7C4xdvOC/AlXVzDFavPvVzE1qboU7jEXNV1VC9SK0k3EkltOJ0hUKOu2l5Jxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(7416014)(366016)(6133799003)(921020)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QVukq5h3Rw74uUSaSYiniB9mTnvR+Y4qoJJZLjjtKhDQPdjvyRAxzc5TYXaO?=
 =?us-ascii?Q?VSm8nOhwYFEWd5LIcTi5hLlo5ANdvwrvAkTHRArfsqHTMfYWtaRXnZabxKzb?=
 =?us-ascii?Q?8JtIHOOc/HOQy8daOFXjvL6XhzBeoXThtsPHyXda/am4Pc0QwHAWIUu4xA+l?=
 =?us-ascii?Q?ZMrcyDle2KU4bzJzLbCudhfG59nZMQNIaf0NmpPGtZ+XFOkWRQret1ifNIUJ?=
 =?us-ascii?Q?+0sHBrMT7debjPsH1v52fJGG2DV/JlYGguiyPOESyY1FJRn6UlmePPdmn26T?=
 =?us-ascii?Q?PvcEe6XAN01c4kRVoKIjvBqSy6mjtfqjB100iJKzEN2GIwZbJFkej+zAG22O?=
 =?us-ascii?Q?6rAGitLSuy0udckMAincXNShYCewR12/LDqDpMRddvWZtruwxqlSiOnYk6Ae?=
 =?us-ascii?Q?C6/oomyK9Wb2oFOifK8MqgwVNfPoW1tb3deYv9/O1+N1aCzXU6OPl8l0juLB?=
 =?us-ascii?Q?MOgfgv6Q0IH7bmQ9IwPGr1Vy9dLa0zygQjm+o6kxjOl4WUp0A1bShKZzDQyx?=
 =?us-ascii?Q?RPoBBs1SvuPJS3Vpi11kkGEUkxST1yKa8Msa24Dt5UVaMJovRegXzkgmf5Ez?=
 =?us-ascii?Q?FPKMyTT5RujlVosa7JB8OJp0lte1cMS9oBSspltW9bzROZZF0BVBmQL6zk8x?=
 =?us-ascii?Q?7vOqc71JrjzEJ4+/XEMPztEYGdLlhQ//leY2x6Shn+0Wc79VJeErgyN2JCML?=
 =?us-ascii?Q?EP2a2LcLjHCpdGMB6uyrK89sJaVNHP3dDVTCGPxu1neNgcxJq8vdeMCgESsR?=
 =?us-ascii?Q?fKRZlXyu7Nhe7i4XUfYL15AClrgqpM2cKr6rhoU9MBHBCHZWd5oOyXXgMqak?=
 =?us-ascii?Q?DBfb4R6K6QoHgPcjnhXMzPks36A3Uzln+dn3lzirV4CrCSQmFZRPRwdTC4Xo?=
 =?us-ascii?Q?mBpsZvEdFmy5c+QMeR/TPEMlyn9mlJPLusNUAkclhTm1ZiouNvJw2OzTfARG?=
 =?us-ascii?Q?TQGvwdmZh5zOWMY2TUYM24gmkzeki3JfU8PT94mEOG44ZmrjFVC8cwgnN7Cv?=
 =?us-ascii?Q?5RBsYUQ179yn9hElCtI/yRiT/Vp2GAxK2f55CREsl9gc0TKlpEOc6cSOx2YD?=
 =?us-ascii?Q?ZtdWrlBWVCDrjTv8uisicuIAAq71eMM8oQrbWxQdrEZHdQPIxOo4l3a3r4Sl?=
 =?us-ascii?Q?XWY6QDLHqkSYniCn7/2t1woxvBTWlaVpWcojNS4bck6Ki1YfKBbUuPhLoeVW?=
 =?us-ascii?Q?QYuUHegLH3Fe9b9OxOe5g+drSY0TsVWaQMwkQfWRwsw9CPldhyuvHwC4qP63?=
 =?us-ascii?Q?1r5pwhpvIJPfmdzPpDhL9Iz2rcEpuxrwMtSnlGJr28KtFjw5SlEIXO+R5DbZ?=
 =?us-ascii?Q?6tNmXT/MPOaNxfVrboRgMFJ41DmtJcZOn6XQwraT3sUbdmg+QqDxuDSufi4D?=
 =?us-ascii?Q?Z0jmPJEDKFVfUGvY35OabLTMOZx3a1dyUqj+6q1m94hX4XTh5PU03WwbV2tU?=
 =?us-ascii?Q?3pHlv//0R12HxBnmr8ONy7jpGZW5H9tKas6kAhKy8fLCtrHYxt05KI/CiZD9?=
 =?us-ascii?Q?1J7fIfShNWIJ2y+EypV7HTk9z0f5hdAdxif9MU4d0G64qehQJkd4f43MtkDI?=
 =?us-ascii?Q?Cim5xlwIH2bUUjDfZ4K0D96zjJMvGV0QPycyTFHvh4ijFRC5n4PxphzTDzZY?=
 =?us-ascii?Q?Ulvt03mjkOX8syDNBO53RFSkIwuYQBPUbvh5j4QvdbB4J1R8fWpjUcOGpq+g?=
 =?us-ascii?Q?c+3yN80pgvyKSKt8IRZAHlnawqm/iIgkIqWF2pjqPNWikg4wyPYFEWDng7MV?=
 =?us-ascii?Q?EvjV/THFghoxrt+mkb3AwacATghDixhrzj+toXXpmiD9YgXdQ1lh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4527cb-7813-4e58-737f-08df086074a2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 19:37:27.8127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZDn6xbAYQzSxCTIp37aVoRCuITvF6gAQf0HIua9/S+cxwqUQq1xjQ+B/7J+X6EgrecP5cVD6X8Sv2C2Dv5iTYLvxkuD4mJj7f+iy+4yjPuCD1nay5nohrlZlUlgrMhF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10596

From: Frank Li <Frank.Li@nxp.com>

The i.MX5 CCM is a pure clock provider with no 'clocks' consumer
property in its binding. The dtschema framework only merges the
clocks.yaml meta-schema properties (which include assigned-clocks,
assigned-clock-parents, and assigned-clock-rates) into a binding
when the binding itself declares 'clocks:'.

For example, imx53-m53menlo.dts configures the CKO1 output clock
by setting assigned-clocks on the &clks node:

  &clks {
    assigned-clocks = <&clks IMX5_CLK_CKO1_SEL>, ...;
    assigned-clock-parents = <&clks IMX5_CLK_AHB>;
    assigned-clock-rates = <133333334>, <33333334>, <33333334>;
  };

Without explicit declarations this triggers a dtbs_check error:
  arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dtb: ccm@53fd4000 (fsl,imx53-ccm): 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/clock/imx5-clock.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx5-clock.yaml b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
index 423c0142c1d33..7be1d36f41707 100644
--- a/Documentation/devicetree/bindings/clock/imx5-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
@@ -35,6 +35,18 @@ properties:
   '#clock-cells':
     const: 1
 
+  assigned-clocks:
+    minItems: 1
+    maxItems: 64
+
+  assigned-clock-parents:
+    minItems: 1
+    maxItems: 64
+
+  assigned-clock-rates:
+    minItems: 1
+    maxItems: 64
+
 required:
   - compatible
   - reg
-- 
2.43.0

