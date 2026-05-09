Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013055.outbound.protection.outlook.com [40.107.162.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BED037AA88;
	Sat,  9 May 2026 02:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778294992; cv=fail; b=e2B1JVWw7JqgQrhv6g0SbALM8/rv17E3uv7B15nsHDyeWIv9EG2jjux7+IfG3NkjoL1ljRz8xhiR43fl2hOciAzEirJEE9s08wvtc6B/h+hZMQNtWJ3BYOiuwo2TAVXK9Y/7pzWRea0UByY+4Pu0bFPXkFn5cGm4vpr2Dv/6Gxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778294992; c=relaxed/simple;
	bh=pOesN93Hm5EVBS6lw8JfXhJrP+hC1ZFb67Aw7ZF/r48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X6RXQbJC2/nVq9a9PxECOU584vNoawXpMDjo37jpbzf/MoxOJ2pIxLlgQfTp7GxOy9eS9M2TFUKc2vuoZv//AJOrY3JjQM+uQ78lfdBY3bO4E9/q0wI/PxjOG7pJtPhtufM+tTXD+8wwjm5NAj3EC14iMBLQssq2Jwz6Puw537Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RLmQcWz2; arc=fail smtp.client-ip=40.107.162.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RLmQcWz2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liG7c2DZJE8nWIQUlKNhDLkWFlI3UgwddyJuns4kX35beiM9ZKbRuAMITZe6ewD36oXymEnOm9P6gFVJsuBOwToKwxcLOgQa/YCtVxmU6hcCbcoh+m5nHAN+n0xoR09OfldLHjNeDhwR4rYZFgCmKaVeWWoiMv2tS14brZ8fV1VjWtFMsnu3uhnl2hyPONPBN9RuD5aMiobquQOuycP0DbsKedPatcoWX3YVuoqPSrQxyL92Scteu3JJqZfuDisrLwGYzDEQHC4H0hBwyqDhGTH0OTpzlDSoMNNp7WeXTvpwOzZQGd8aL1Hzp+WdeHHIL/M9wPFiieSM57b49uoZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JM4YAof4lJVoTz+20bsCfSxxB/kl26+IsYSyXYktCFE=;
 b=FmzCIn42Kw3H8Mspqeu0ghvXXPaMLNYyeLecmiWDX/PAAUKkp0zg1+13Sm8DfbCS8LPV3P7oGnRv2QprgIsEOUuKaBcIKyLhTbW64MZWa4FN738+r2snpyJmRvt8viw2WlHrTf2Vwb+jXmBDGp1sbXvDUk3QVPh0CO5agE98ZQ8yQS+HZyhpAU6l5NFQE8NlLn0tUpOruEYfLTgBRshWvykCJ47zDzYYLEVpCMPT7TOCzvhshR1iHofJlLswDToHCmGf+tkcatKgHjMUrp54V86myZlQst1+0UkZ+9XO2wrkBjR3J0Yx7VSeuqUHh2ApnxrATd9rfBGbggcHGk0ibQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JM4YAof4lJVoTz+20bsCfSxxB/kl26+IsYSyXYktCFE=;
 b=RLmQcWz2oiGFRiy25mFlkL1PRPzMMNVMNhmCVe1VKWA9I0L2Vw/ZhzXfyaOCWd//ikpLbUnCK9XU1PFGCEdtbRFnRfMqJpldWz3U46jV8F243h46QannKuxHxcvHoEpR/HA2/jnjAsXsZUhkG0zLCWVkCImat4HPGEIzyYIW1cx5ZY75TjZtMTMIUsaqZie4AOL+PNfUY8/MFqwlLW5OZXzN6chycIA+SjnuDxuKByiWp61Y5xEeZ8p3RYMvYoqyUNtiDH9aO6z0y5K6NVpw0YN7LhZn3/k0Syy4BInMSQAswZtGZ+CuhKG0nlErvbbo3c02NXES/EvWENmzR2hWqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by VI0PR04MB11989.eurprd04.prod.outlook.com (2603:10a6:800:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 02:49:47 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Sat, 9 May 2026
 02:49:47 +0000
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
Subject: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector binding
Date: Sat,  9 May 2026 11:48:43 +0900
Message-ID: <20260509024846.2094049-3-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5891718e-f960-4d12-fa27-08dead75a22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|18002099003|22082099003|38350700014|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	VDyXHKPzUtw+OeqzOAEy98LSoKUbN+q5ct7/QcZMw6wFxRMwEv9KAKMgt6WzfX1UWFVkBYn2dfuzjllvNSFs+rtcj0kTJ602Cujg+6Zs6Jd4N0A0loYBzBoFXuJFzzR7mKOg+mFlwg9rUvmsEBWxWCqAwNtqKMrEEQb5/Mu4fsQAzQeqExgd1v8iagKJUVU8plHxHJLpwQtsfDi4rqvVRCxW8ZF+fs66UR9AnmgauorPJ1GvcczP8gjaagStuJ7zpV1w7Xy7JGMhBajINnlPTR2wC6eRLL/1dj4eSqSzXx08zVrzWI3soQv+a5HR2iV4v9O49UBz1B8bc993I7An8gkh5fHabYBprX2R4mX75dHcEh2cvrA0SSui3M81aWxV0t6Fg2JZZ1x5nckV7Y8bfg3V582nD3V3rQB0G2R5Lt65W3UZVXbFUkgJRps2g0Zyxld9FiCLrOtAYjQvFLtvu8tPtOUySRiUWvYs+47tP2M7YoD1xXVlkgG0/RkfmEhNzhrZm/gG808SfnGDtqAT0Ks1AB64tBHQK6/Bg8JyBQhPc5d1zGpSpRXjdTYN1Xt4+qeqoqPORiyBBL+CQsxN0IA6GCuZ70HVKvdBY9NVnDZQI5A1JPhP68GNUp4W5eOuxnmpIO6yFtyifoJiBG9j4Vfq7ssK7TJEju5Be1OApndY1xiLdNzEJlwFCjayBOI5Ey4s7rfO1ZbCU9pEqWpRpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(18002099003)(22082099003)(38350700014)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZS1evOnMgGoh4ZsjMx3+EZxWI13o+PrPF0lzycOzxGK1atdBBaECQGlAgXE9?=
 =?us-ascii?Q?nfM0v3Q3D2CCCCnqA/rU7pA7KxFiuGTq57uM/mkMXC2mDiZcVtEtD8ccZ2hM?=
 =?us-ascii?Q?Eyoyd+9FyWMwX044Z4fz1uebnKJvZ9W0xEtOnaMt8AdRdv0UnUQtW7lHI4Ti?=
 =?us-ascii?Q?inpSHRLOu+A3A/9VmI/qbDdO999zXKda6bPtcGYyjpoocHFhra3WMSUVD7nT?=
 =?us-ascii?Q?fcgyWppjAnK08qkYwTRiB6E1Uh/KTqOOwEQo1ncZJ0o4rP67R+1i3Sqzq2sc?=
 =?us-ascii?Q?YtqLBXyx7sHD2OgJTr55wQzz9+fFoH7s0mbTTrpi97ACdwlYyEdDvXUu5g+W?=
 =?us-ascii?Q?klhFQi64E28KmOMyqwm44b5EBQ/h3fJCMLr2Eo9xXORhwZ00Uji7GqkS4e+F?=
 =?us-ascii?Q?9lY41/QsjVw8wKxkoQWkixirSGTqCOadxQ1pE5ty11S3F4K2cD2GsaKFD+r7?=
 =?us-ascii?Q?9tRGZIWFtaTf+hDQiYlRpeQlUHH01BjuPilaBmwX4jd3Zhb4lkGjduLvs2m2?=
 =?us-ascii?Q?jUKStw458RqizZgKiLIpe5g3IuRBLjo7nfUafh6W0nZfZOSPgAdfdXzRhlrZ?=
 =?us-ascii?Q?BozMJEONlySJ+B0pD4cqB3IC04DOb3NU6MfVy1FgiHiq4oZUmvlgaA67LM0l?=
 =?us-ascii?Q?HsWnU5IY6w0+Y2ethvXrsaThIes6Ney4nFPoxWqxBg+4IJnmhertwuq4RY7D?=
 =?us-ascii?Q?8lnonmRR+BrTPP4ircVlTM2zkHhHbGcElWYd212tV23dXDWrWVMLaNrDIhwH?=
 =?us-ascii?Q?xglkd0u6+UP1r0jq8UnpB1f9HdirdGQVJnPzRRKfpy0mVlT0mjRwOVIpd6wd?=
 =?us-ascii?Q?gUOoiy6t2wuXKetRDwhTj2Ko0vpJpmcktrlCtgtkbsx8YyeJFaWUFYUT2KrX?=
 =?us-ascii?Q?b7UPNN/O+RJXgKzI6Q1WX2eC8i7Z5YpxcjVvdsMCMuWoILjdCHsyHLWitQ++?=
 =?us-ascii?Q?VPOwQu2gqQgxd1g/UjxnxsqB2hfSTGaPe4wdM6gCWGPiMZ/4uI6/82i++Kkb?=
 =?us-ascii?Q?HcYGLXiI7s9n3t2OkL30fQtkP0BZIrc7XYWU6ReAD445cjRbqIKNtGFPowdT?=
 =?us-ascii?Q?9lj/2RXpq3vfcmA5mYdqpv4g9k8UQka/eM+B+j5kgbWSiExYZuRRZhGORi5i?=
 =?us-ascii?Q?iWM5fQnP192xgXxPvRZ+jgP8HTZ4WdKDikVqX1daBWtFyvPpTlPf7QdK+i6R?=
 =?us-ascii?Q?F/ewffr0KpwxfEP3zPUYmJJTyfXFxXHRi35zbcVaZZzj+8paPQPoyWnmYL+Q?=
 =?us-ascii?Q?yWsHrgkf8ozZtYU2Ob30Ss3VmYBouiGwrmT21MbkFOxkgYBDlbLITwHsjE5i?=
 =?us-ascii?Q?neKYm7VmklvGDR0uNNcZ+NcPQ0kSq2z90Za9GZ4sPki4aHfi4kYPIa9MecJp?=
 =?us-ascii?Q?hi0IKXacfzVyRH30KI7r8IKLmza0OeHxU2TvJlPFqua9zPqUMNbV7gc09e9V?=
 =?us-ascii?Q?g7AhXxAdBsZqYq8gu0o8r60Ma1jMa6tFICMtXWHhS00E5oppGwIQdYcSm3yV?=
 =?us-ascii?Q?j2HBDJpd92YOluy9wJCHrUUM0/b2hwFHjm9z7M4l8UdBI3jX37ti+UWfTAAz?=
 =?us-ascii?Q?urtYDOpkjrnbOkFVAb5PH6MEGwa5bGVcHcs7O1Dhz8pxIT04lPg08PeOfliC?=
 =?us-ascii?Q?TRd1W6fLYPDHJ1m76kQ7zwN6tCnnGUUgwaxSjqn5Ke4JDw9LIFNuWRZ4QjaX?=
 =?us-ascii?Q?HXvHn53RJH9ISCZ2hJkbJvg9rtJCN3jK5GPF2bCfqxGMQBGfK/vodo3f49Kg?=
 =?us-ascii?Q?TmdrT7cn+w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5891718e-f960-4d12-fa27-08dead75a22d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 02:49:47.7776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXHsshYHESUy/CLyLC2PvAn9wvAJ503S9a1Vc0fNwxcaQZKNLuM8G+sTMdoC5eP3pgteLxC5EVrvpkS/7Hpr2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11989

The NXP I/O connector represents a physically present I/O connector on
the base board. It acts as a nexus that exposes a constrained set of
I/O resources, such as GPIOs, clocks, PWMs and interrupts, through
fixed electrical wiring. All actual hardware providers reside on the
base board. The connector node only defines index-based mappings to
those providers.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../bindings/connector/fsl,io-connector.yaml  | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/connector/fsl,io-connector.yaml

diff --git a/Documentation/devicetree/bindings/connector/fsl,io-connector.yaml b/Documentation/devicetree/bindings/connector/fsl,io-connector.yaml
new file mode 100644
index 000000000000..8b5038a2332e
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/fsl,io-connector.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/fsl,io-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP I/O Connector
+
+maintainers:
+  - Frank Li <Frank.li@nxp.com>
+  - Chancel Liu <chancel.liu@nxp.com>
+
+description:
+  The NXP I/O connector represents a physically present I/O connector on the
+  base board. It acts as a nexus that exposes a constrained set of I/O
+  resources, such as GPIOs, clocks, PWMs and interrupts, through fixed
+  electrical wiring. All actual hardware providers reside on the base board.
+  The connector node only defines index-based mappings to those providers.
+
+properties:
+  compatible:
+    const: fsl,io-connector
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+
+  gpio-map-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  gpio-map-pass-thru:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  '#clock-cells':
+    const: 1
+
+  clock-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+
+  clock-map-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  clock-map-pass-thru:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  pwm-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+
+  pwm-map-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  pwm-map-pass-thru:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  '#address-cells':
+    const: 0
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupt-map: true
+
+  interrupt-map-mask: true
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    connector {
+        compatible = "fsl,io-connector";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-map = <0 0 &gpio1 8 1>;
+        gpio-map-mask = <0xff 0x0>;
+        gpio-map-pass-thru = <0x0 0x1>;
+        #clock-cells = <1>;
+        clock-map = <0 &clk 1>;
+        #address-cells = <0>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-map-mask = <0xff 0x0>;
+        interrupt-map = <0 0 &gpio2 27 IRQ_TYPE_LEVEL_LOW>;
+    };
-- 
2.50.1

