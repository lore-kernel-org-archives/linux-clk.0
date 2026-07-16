Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011056.outbound.protection.outlook.com [40.107.130.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B15938D3EA;
	Thu, 16 Jul 2026 07:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784185840; cv=fail; b=EsiT00Ndq5BNwnhFeHZ+Q/gTFJKbmgWmz/Y4OnILZBEBoCeU5OE3jlfTNIWhKF2Qp/4WkQJnL61WTPRMsPyqvjQ8I7K8qEJ+lDLi4v5N+t5+ViBpIu+DyXXMeT7Ou5LgzVqVqACi5teCxp0Ys63L+oSzxlFjNYrskWedQO12Wu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784185840; c=relaxed/simple;
	bh=KhKEAEfpKZXqexByodWE2M75M6evfUvASfxOszN7oWc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=h8HHbe8xQggDdoyu9jlDVKOfHFUmB2vyTtt5HDselpmG/iNlFGgqQqI3Y6lIYzNCbOU5mB0ft039K9fjumAFtrsZc4rHGROlEoOdppspbnflvac6wzoHLghAitmJ2zFOjhFGFImu7Lrx3aFQ8pCOOSqIbA+SwivorStFdK5yPnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J7by1vAc; arc=fail smtp.client-ip=40.107.130.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J7by1vAc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRhnqQfow+dCKaxJ6i0c6uZ1ZqTAJtLrmGZHOx+a55oQQiw1DV3J+QNmvMfayHVjLv3wB2kGCdCmuoqHPIfjISscApxhqVhrSXFbvhOI4gIACA1Wp196R4BkIX4xKM3pTSrKiZcFnbe/lDhliZkNIhsnei7ojPSgvXRyYpE4MYtJruCbXMzD0QucJGn1k3j8bYKsUW29NXy367YLaC3b2vLkfTJEMVzPH1nRDdDhqh7r1ANV3agbj1PV6lr7wFj31OyTX1pxgjtzWeyr2aC4aWC4l/Q3Fnf3R6TZYjEiSrrIMB+AhtxJOXHHWFlfIhWitjZHFxnHhKgrle5Gv2HpiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdbbm2LnTC8YT7Pg2LMW4drbgfoknWRJhg/Lmqb/5lU=;
 b=jVmFdWRHtEabKe+K3vDJjbdqYbhvH6eQ0ogo9I2uCdzP08U/jcYiOdQ4k55DeLqfdoOjWtkkXMNseX2UCUjY1ZfjjAws+3xOpscU0kGp/tuaOEJI6yHCnJQQ7olNdmoMp2tSEISzPYYBE6vibiZPh+VE++sBnQuzWeWHSb3/eQHs0QFOqld6lpoDkSMMsru0srQgzbxXG1BTsy/1OFccuixUwhTy0kIfpKFWY+ucXoIoquL8fqkPx99OzokhTwddyljUa0krcoQDu7ghyyH7peaPAG2FZhSNRGxDA7LX2NdMuFm4r/6QVvfSRStLOE3A80SoO9o7EqO9XGioTBY5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdbbm2LnTC8YT7Pg2LMW4drbgfoknWRJhg/Lmqb/5lU=;
 b=J7by1vAcjQgIV2YTPQCodsM9e90i4gPdzUY8yQ9hcLALGwE5Z1h+kPO9GXu7yOxSp7sitWONnpcNQ5wza3N/tlRhyuy4Ia+Gy87TQmzWTI1y/5i3jT/QYzZq/aTTRORoBt2U8+OuYpjaaJH30aV6/CPr3BnQWSAgUpRwSfSiggwu3m5ixGHTxNYNmCOqdu1wwEy6L6qwH1YYXVeLsiCU3+jbgGatTqsqNkj2ebJ7xbrkaBiR2ahqPkGxfjn5zia0i8DinTsagaGBRDWvDVCItsuodSprqNXkXexCGwTlAEiKVyX7f3xA44nKL8Jmpfd+DZo2NkKok44odmA6DrtBjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by GV2PR04MB11398.eurprd04.prod.outlook.com (2603:10a6:150:2ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 07:10:33 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 07:10:33 +0000
From: guoniu.zhou@oss.nxp.com
Date: Thu, 16 Jul 2026 15:13:50 +0800
Subject: [PATCH v12 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-csi_formatter-v12-2-2601d17fc4af@oss.nxp.com>
References: <20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com>
In-Reply-To: <20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784186031; l=3297;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=2IicYciJwrNT52Q0Jg6EWkmd2zhKmeGNte3MMfvZS40=;
 b=60KK9YIWKgnzy1hXPM4YzvMaVTlczyU/coSxihjM6aKDAdovXVNCpxN3paGvMYRALGorQt3JJ
 gKUiJld1C0DCveCYxdFotdNROeIs0yNiFWb0HCbpqYfOR6CSLAIbcVu
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0045.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::11) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|GV2PR04MB11398:EE_
X-MS-Office365-Filtering-Correlation-Id: 56cf9cd7-41d5-4bde-74e0-08dee309538e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
 4KqsUq+/XEiU0cJlCTLf45E34itxxeq/+TZZy+3C8uogrSnki/vJ1jnWEzSIUsCjrJPjGTYOd078S6rVNeQ/jjIrCsTB8IO9jXPmh8+442FW7SOME1IiIg94pEplbfVu3ukl3y/yoHMxaXhewhVpCP4VHqciiotV7AmKtcFfVqINjdmAO1M/43+UNUAwOQ0x9d5G9Hjyp2dhJqhP7g3bstv35bq4W3g+L99ujGdzIWHvakgZpsgjFEDtvEZIzkKqlE1nlTxjXHINlmq+IOCiF7I5iMl/xn5/ezbn8tHMBGTMBZqiUF800jZvlbggKu3cWJ6GVcSKFXHNWc2agZDNiXS0CjcOFxSBlrpTDLbAQveNh3ltoZ52QHuYProzHEWs7GwyJ+wP338lljn/3n2UWieJFKwH1uZWyrE80G5o7KzUHPOA/kjYMpklnGHQEgRSk7NkSoeANwjSLCdR2wUfpmvM3RNWDiUrl75qIR0ZJcMLaQJDJnF3Mc/6PKzPp+ydMJZmXOhxjG/lM+HG/SxWOGSrj26mdyDYRn9xpBcq64bTanFTw+UjygYf448sTwZ843LO9Ugci/ONrIho2EppV3Ke/Upm9oMq7zukEi5nYKxhs5TO4i3+0T7131q/rAwI+f6gT8oaOXbpW6hGv2MVrI/bejZmA95F9FLF0EE0JEOsH1wLeYus8b72aoE5PUX/npdzopfVRnhff6tjCQW+Lw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WW85YjBNc0pSYndvMFdaZnF5S0UxR1NuZjBPZ0xSK0VLRllKbzlpSDA0V1dR?=
 =?utf-8?B?MFh6dTVsbXdGU3pFOWJnT1RBWlE2eGZLMTBPZnBKSENXREkrWW5WNHpPS1Ru?=
 =?utf-8?B?Q1hyRGl1Uityd2NzR3FSVmFFZlFXREthRE9uSWdGdHhPeHBFajErVzY4RVo4?=
 =?utf-8?B?VTZQT29ETVhrSUR6Wm5FSUJmYWxPYzkwZFRNNXppamRBU216R1dtVmRTUE5Y?=
 =?utf-8?B?R0hBNW5ybWxubG5jQ3UwbEtJSWpNQ2pGbHRSbXFVV0E0VFlIVXFWaWtUakNE?=
 =?utf-8?B?VkVqdks3V2dxUUhGUEQrK3h6STRoWU51eGFJbjRtMnF0Q1FxWTBzdmp2d1Fz?=
 =?utf-8?B?NVgzSjRPMDhXNnJyeEp4cTF6ZjE0ZTJQOFE0WmZRTXhyWkV3cVc3R3U2bkxU?=
 =?utf-8?B?OXJtNlIrTC95V0xTa3NUYTVxa2V5YjNkbHRTVzYxbXBiK3hFT1JNeWhpR05i?=
 =?utf-8?B?aGhFTVpxaVJBZmt3dGVWU2pVajdxeThUUmlYZm42SXNNK2tIVmtlbEt5MElY?=
 =?utf-8?B?eUFCZUJuS21QbGw2VnNyTXNybUNZVzBuNDlWQnc3S0MrdDRJNkFwbmRJOERk?=
 =?utf-8?B?WVkrWjBVTzdua200L2lRNWg5ZkRaR0RMZEdPTVRubnRjc2VCRGZ0cDJuQU9i?=
 =?utf-8?B?MjhmSWkwMHZsNkJHb0FjWXBINEZ3YmZqWktlZkZEMVhUMXNlUEJ4OGcxaGN6?=
 =?utf-8?B?RS84TnJmMFp6dnlvYWQ0OFhobitINE1IZnhHTVZWdVFIejFhdmJWbU5vMnFk?=
 =?utf-8?B?QnBCNmJnRGlTREdHeXVBUnJuV0ZENllqcHpmZjZWL2t3ekplNEdYQktKR3lK?=
 =?utf-8?B?UERDbkNLa1BpRHlUakF3SjREZXA4alRpdFIzZEFYbmZuME8yR0l3VXBJbGc1?=
 =?utf-8?B?RG9UaTRzUGQweFIzMkJWVVJBUkd6czVjUFFNMFRBRjdoUE9vVitmWGNYMS9M?=
 =?utf-8?B?WnF2cHlJUkd1TzhVM3hFcVBUWjNQMmpVdWlOTnVhbnZtbXI2VzFkaVlBUHFj?=
 =?utf-8?B?VU92bjhhOUhzMDd6UmUzQmtvT0ZzMGxieGpvNDgvWVNacTBqcUZoczNYSGpn?=
 =?utf-8?B?S3gvTXZUbVZFTjVjaTZIdHBkNGxSRm8xS3hpSUxnZXF4dFY2ZldNdlZVU1lJ?=
 =?utf-8?B?U3F0MVlCYVd6S28wbENpK2ZkR2hoMnpvMXR2YlplSVZVbnhBV2dFRTFWTnVU?=
 =?utf-8?B?RE9zb3BYT1dCbWN1cW15UUJDQVF6b3czNUk3N0N0R3pZZVpWUHpmbEpud1Fy?=
 =?utf-8?B?SEcyYjE2dEF5N1pzNFJnWXNsMGVsUlRMSEdWbzdpRFdaeUpqOU82c0NEWkNP?=
 =?utf-8?B?YkNNSzRnUnlMaC9uUkptUXhDWmRtSzFUKzNhSlk4LytJNmJCeWVQWWhXUFRU?=
 =?utf-8?B?TU00WVNZRjc4RlhwUzlJMjhCK1RaMmJBVnU1SHRJRENIRW9Wc2VJclIzclhk?=
 =?utf-8?B?bVJabmM3S25xYnNjTDZKeENreEg3cnpkRE55dFJLbWlPV0crUStHK3I5ZGhT?=
 =?utf-8?B?aXQ0SXJ2S3EyZlJDZVlEdENTcUpTMndYRHdZK2pBUDlVNjlHSVBhZ1ZhV1Mz?=
 =?utf-8?B?L2ZxbG5Jb0tUSGkrZnlUdmpjeU9aUDNIdlBOM1d5azM0bFg1cUhlV1pSMFcw?=
 =?utf-8?B?cEdoTUxpa29ORU5Rbk5OR25kT1Y1YXdnWU1zbkxhdnkyTzRtTlBHSzVSSUZ3?=
 =?utf-8?B?Zjc5YWtwaGg5cm83emROdHcvUmNheHZHOS9yZ29YRFRNNll4Mi9xRUNKVTYw?=
 =?utf-8?B?cnc0WFZVQ2xRbXArNnhMSG9xQVl0MXJ1YXpnN2VtOGdWdlpVU0dTNnJjeWtq?=
 =?utf-8?B?a1JJam8wcUlhL2U1WmV0Q1JIaW4vOUZjTllJSENjWnh0ajc4M0lNdWd0Z0RI?=
 =?utf-8?B?Q1AyWC9tRHpPWkVjR1dRNVNiWk9qblA3VGpmd2FURXZHQTB6L2lxY2pnYWt1?=
 =?utf-8?B?OTgvMjh4VjhHTGZuM2ErTENMYi8xMWhLYktVeGVMSE9PUWp5dThDMUNzNnJh?=
 =?utf-8?B?dXhnSThIMTEzZ3EyRHFaUXFjdFV2ZHhwZ3NBM3JucnFqZkd5ZXNvOGVrdGVy?=
 =?utf-8?B?T2VGZjBmSUhydTJ4RVJsZWNyUWc1VGNqdTM3SUR5YlJIemJDZGlZN05DYlY4?=
 =?utf-8?B?b29FcEV5K1U5ckF0Q3FVK2N2NGVBUFNRWk9xSjFLbHFKeFovQjFROFhVMlc0?=
 =?utf-8?B?SnA5Ty9MUytnQ3hpcHpLMDZFMDBka0REOXRrMk5vOUQ4TnRPdWF2V3lTTSs3?=
 =?utf-8?B?L0ZuUklIQ1JBU1Q0REZXajE4ejk3UDYyVmEzZkhoaWRVUndlTzZrejJRRHBz?=
 =?utf-8?B?YnpLTVk1ejE2aXJlRXR1Ny9HS0dFMitPckV0NGo0V0xzK0tVVnByWXJyWlhC?=
 =?utf-8?Q?WlFVyq01Mic7m3AK23LPiX/epag9asJr5pQ6S?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cf9cd7-41d5-4bde-74e0-08dee309538e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:10:33.1367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HuONmvB9rxugMnnqvWhGi2BFrIbjwFREHo8Pd4jWakfXr6p6QLDTONsKStYd67C0NMXEXXwtumoBanRL6bol1L8rh8od3O5Amv4GvLnnVkZiUwww8y9hM0Or27jLGB8D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11398

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The Camera CSR contains control registers for multiple CSI formatter IPs
at different register offsets. Each formatter is an independent hardware
block with its own clock input and media pipeline connection.

Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
with 'reg' property specifying the formatter's register offset within the
CSR address space.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v11:
- Move properties to top-level and use if:then:else (Krzysztof/Frank)

Changes in v10:
- Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
- Add formatter subnode binding and camera-csr syscon example
- Update commit title and message

Changes in v9:
- New patch to address the issue of formatter acting as a child node of syscon
---
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index 27403b4c52d6..fbbf1b3f1790 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -39,6 +39,18 @@ properties:
       ID in its "clocks" phandle cell. See
       include/dt-bindings/clock/nxp,imx95-clock.h
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+patternProperties:
+  '^formatter@[0-9a-f]+$':
+    type: object
+    $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -46,6 +58,23 @@ required:
   - power-domains
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,imx95-camera-csr
+    then:
+      required:
+        - '#address-cells'
+        - '#size-cells'
+    else:
+      properties:
+        '#address-cells': false
+        '#size-cells': false
+      patternProperties:
+        '^formatter@[0-9a-f]+$': false
+
 additionalProperties: false
 
 examples:
@@ -57,4 +86,46 @@ examples:
       clocks = <&scmi_clk 114>;
       power-domains = <&scmi_devpd 21>;
     };
+
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    syscon@4ac10000 {
+      compatible = "nxp,imx95-camera-csr", "syscon";
+      reg = <0x4ac10000 0x10000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #clock-cells = <1>;
+      clocks = <&scmi_clk 62>;
+      power-domains = <&scmi_devpd 3>;
+
+      formatter@20 {
+        compatible = "fsl,imx95-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            endpoint {
+              remote-endpoint = <&mipi_csi_0_out>;
+            };
+
+          };
+
+          port@1 {
+            reg = <1>;
+
+            endpoint {
+              remote-endpoint = <&isi_in_2>;
+            };
+          };
+        };
+      };
+    };
 ...

-- 
2.34.1

