Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazolkn19011058.outbound.protection.outlook.com [52.103.14.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F91175A60;
	Sun, 26 Jul 2026 16:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082172; cv=fail; b=WCuL7MFiSOGfI941yqceTU+UlLB2d7ZNzdP5OeXrbi90AXLLaBDvsDp+6SD/H0kwY75pBSWdSuSootkASF7ymePSKPIk/qEQDQC4UK5ALn6eTc/96fjfCkSkwyJ3w41YemBEYIhGmDta4s6Aao1/puyNd68xvewlvtoxv2658b0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082172; c=relaxed/simple;
	bh=NW91+hru9Q58mG9xAAgSCn3uxpwzvA9yiJ2OAy+KqvQ=;
	h=Message-ID:In-Reply-To:References:From:To:Cc:Date:Subject:
	 Content-Type:MIME-Version; b=FW5QSFHQTRvTXmzdu+A9PvXsAI2AUVhaIgcsTHHnqQnnJv9a7EtC/BRgMG67xxUpjV++ezrWSA8RUMOMFD1aPegVBGx9OSg5wgedQHnNEuTK1I0M/DxswQs6CLUAdQvHDQGxg2PUZvKlECudI04MSUciy4//7Xp1+5MHBvH4pm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=GkeucUfd; arc=fail smtp.client-ip=52.103.14.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="GkeucUfd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivNHGZkqq+BMH0oViqoec3Yt60R7yRnPE+ml2kDqzk3QZLJ41zwQ+Dem5ow7VttcxfHLvyFLTh3SEvCjum7no7naxpKRHkPNBC8w1y/jv9h84E70vur6/VjYssx7RDz4x9jQ3/9m3x3hMNBCzmxkjUPoU/dj+APxXVtWxaTx1gIsPky+SH5s5Ccp8PmeAQVlOtsyYESMAOaYFqZMBAea7jkD317fwc+XttWeEOqUQ7mDxZyd3YZUsf4yvOJNfPeo8ND+avXPREtuuN4B/KK7GffjgNCpwPflDfH8kM1Kqtdm+Ie0n6fpq5V1CqvKk6+HV1SiKSuJQDICfccXB/JNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieaiLVok+W6Zy/rgpxTHugW0GaXEMswY6bfeth6uyjM=;
 b=ao+lLAlyiou6r5pkY1M5Upn53scRzfnHYHuLpgwdrvxdC6ROl0tsx9mxhMh42/TH1hLe4wZKFKS3nv05XTggv8BPdTR6/nmtan2823WANRg9AKR4n31xhzVw1C+pzzTVSFIHbKIvH46jQTQSYMgNibowkK11d1zsMD8CYVZM9Hdvabrn5Q8kf77oyyiIsVmS4YEsZ9BJXayw7r0P3KwzDxB2XaZD6Qk8wMN9amDJMvcY29Qw0kK0DCdeUmaDPm/PD8P+3vwyv9lZNaZS7H1tm8goKMe214xEhx1TFQ9gJWwnyy2XpVtIC6ofe1K3Rsitr+MaHlhd3vw+x/XFld/flQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieaiLVok+W6Zy/rgpxTHugW0GaXEMswY6bfeth6uyjM=;
 b=GkeucUfdKMnbufu5o/oeToNcT2ZyleZaMSjYndBxDdJmBioKjw9aEmMPw0UsA1kqjVlCEPFVrjwRQwq1ZNpgehmfIdYb+xCPaAIQhem9hGgkJyVT6SRAO9MVU9CZGjqSvrvuXP9KyRFuXXQkKGGmioaGzBIYpir+63GkS+7zzriLMSB9hi4ht5+FJVtHt1kl6BRLXJAexMyNc3Tfz4B+QboHnWuvN3/HUWycO3PoX59um2JvOxKkepLiDwm2ti14UKI7JgAfr7m1hhII+15TdpQ8RFG1NRqUve4LI5ZUGWUcFCH2Vhqyd5x74u+SzSkEYuQ0If86KyYU4aOdZ5x/CQ==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by SN7PR19MB4765.namprd19.prod.outlook.com (2603:10b6:806:100::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 16:09:28 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:09:28 +0000
Message-ID:
 <MN0PR19MB6091D631C39CED4FA19E2983ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <cover.1785080950.git.liucj1228@outlook.com>
References: <cover.1785080950.git.liucj1228@outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Lee Jones <lee@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mfd@lists.linux.dev
Date: Thu, 23 Jul 2026 23:48:46 +0800
Subject: [PATCH 2/9] dt-bindings: clock: stm32: add STM32H7RS RCC
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0008.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::9)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID:
 <c60570d8fb0dc020361b1fc368728658dc5e3ff4.1785080950.git.liucj1228@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|SN7PR19MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: a443713d-b4e3-483d-9fff-08deeb30451e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|24021099003|15080799012|23021999003|5072599009|25010399006|37011999003|19110799012|8060799015|3412199025|440099028|26104999009|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WjF9r+7qb21N+IngO52L1ksTNUG08b/yFKo5E5+S/i8genq5VZS8F4MMQ1+u?=
 =?us-ascii?Q?zYmUTf12QYFxYBf/5kRiTMKuc7Da1WIx5XfeXHmzCwlr77fddlE1rSyNRgR9?=
 =?us-ascii?Q?IKG3B1i3/HtDfmvFsyuMk3qKdqFKZEoMO/35mC2h4ctQGg/IFfLL6VOJmUJk?=
 =?us-ascii?Q?psYb7N7womqbRss4VhbuUM6wqNKoC2vklD6U0nDjyO+HXMaXPtBUeNmmgPdj?=
 =?us-ascii?Q?FtgXTZ9wiYuRbdntzKen1lc0/NDcsecB3dPGrCCBzF8A2MKzxriSCZnUOB4U?=
 =?us-ascii?Q?Etke/BmXT3azK60w2xQWezNcZNrQDCdGXD6kuHraLkDEesCV/HIdUL6K2wOJ?=
 =?us-ascii?Q?irvgwI0Kioqk/X1Hz5vhg1al6mYK6Wo4WmAN2iW8DzXccqfaogZELRM02wsn?=
 =?us-ascii?Q?flcBHb2vK6VDUhnYwuf7eCPv3lwTO3gWz+3nCgEsXC+4ekhZhptzBrZ5bRwp?=
 =?us-ascii?Q?tvWPAJENYiW/h3V+xKrOmMxcVU0JegEmEMrtG6DQ6ECBrBKAILO9lFTmcItd?=
 =?us-ascii?Q?PmMOChv8Jp7L7aF27nN7s6uj6wfQOVL2XVIDNcABhJOR4tLSHMlMJ4kM4nI1?=
 =?us-ascii?Q?cwEFxP9Ibmb3YalEEhP8UeATso7m46igIt2DITkZWdYmzQCYu7idMA55+Yu+?=
 =?us-ascii?Q?3WRAL9wEbRlzOHk1CVbPM2yxYSwJFsp8w21ufshNeOQ6zDqgMc5i6s4nJgU/?=
 =?us-ascii?Q?lxRu5bozke06gRhFmI2tZgfr92Zr07nAyYbg/fbiYgLHN/qBK7INkAP7jsB2?=
 =?us-ascii?Q?7D2pmvZpU42BPixtwvOvDTXSjH3OsgHIEF0zzKZBbBmNusT1M54tjZdPO8aZ?=
 =?us-ascii?Q?hmhR0uUY1C6ZRJl/ngYoiRAwxFHAJPXDf5B1WE6BUDFkOwcWcxcDLIwgDkQf?=
 =?us-ascii?Q?aJHDjfU8faGCeNmJRZlpSnm4Ge3hihPDjdWRR7m2NZO3QsIVUGNgn+yMrC+V?=
 =?us-ascii?Q?aloADAYm03oNSWqgmG/qBg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h1sqezq+1fH8+P5VC6XOt/oRr4qEmx7kaIyBhlRv1d2u0o9NVoLcOP5HNeEQ?=
 =?us-ascii?Q?c+3LhBUiPztDYGwbAE2UlOKdoFtSecMxzQ17FJS26t3aHzUuwYFdRycu5nAb?=
 =?us-ascii?Q?yje89sHstSOe00zsImQU6vRS8i1No1L6tWb4X4Wa86O9fKh9oCTFDqoY6FAi?=
 =?us-ascii?Q?IT8bfrVLA5QpsFYUK+iZst5RNGEaz5COXGVGPkU8DnOMsgWwvGgP88UcXMZa?=
 =?us-ascii?Q?YyfB0/CdFkg3fkCDCL0NFLPkPaDqsmbhR6poJBaEbrrDMhU+x94GU3ae3Z+s?=
 =?us-ascii?Q?TSi4buoXmdMIxvlrf1mlR26q7GczZOpD4g52fltEXy37JjcQn4iEWiz8GwVz?=
 =?us-ascii?Q?RDvFIR3oKLTCV45P7J3hpyIV7aXU84kKFrw5u+pZ0F5no9P1tTGZs4BBNCrv?=
 =?us-ascii?Q?k6BpIJ3QThykwkZt3sfg5f4Wbz0bBP8zD16ozZEgAKr4DLtP7xnfoDndP7ri?=
 =?us-ascii?Q?IStBB5YiT5WdYWN8hHw06nf+l19SYAwDvY2c+JIiRoY0uEq/3w0Ew0TrWlcw?=
 =?us-ascii?Q?SHr24MNy1msjkzObql6ppHwlyrGhjq5JD3P2LQcR+6CUiejBBzHRVFxkMi1G?=
 =?us-ascii?Q?z7zkdNH+nqI6HKqgXdKQ5i2B9WPrY4fC86QR6fZi0u0ty1Nre82QxBMCWOPA?=
 =?us-ascii?Q?/dFGRejzLXugnJkTHWiv2nv/M4mmlaxkbVrGBqFef7PuZpJryhH7UTDf3Q/s?=
 =?us-ascii?Q?5gXX3cTVdCUHUVWylUN9ucHXHMy+b02PVmYQ4TuhADcjByXjyKNq1z42nCYJ?=
 =?us-ascii?Q?y2XzTeLxKRayQFRmm4WTdfD4bjGaDTxxcpy14i9c1MDuI3OmTQZPtsfMWXHe?=
 =?us-ascii?Q?1zuMXo1Ks9cDdbpc2pW0lLWpMvAuRXRfvvqHAAgMqM6vv4Oi9mNrZWXhuHuq?=
 =?us-ascii?Q?TW6JIpHQC5GVjzySfX2t/Em/vlwCkvN2fqA0l5eIvF+Dru2flIKDnb9+n4M9?=
 =?us-ascii?Q?6u6tH2qYDC4FRsORlZxHZR8acpN5f/5jnvYlWe4L+4M4uTN4ETMXBT++iQCM?=
 =?us-ascii?Q?JHSl9nVWP7ex1JLadIp5/rr97nOawWsGeF0Gd+g2p418Gf8KnBCEtGim5VM2?=
 =?us-ascii?Q?oqIckwqJjimBnlUMP76MGyXqg6rk8Ml8w9ihzRfqpuPwOASUc85WBke7PO/r?=
 =?us-ascii?Q?bWkCmDos5F463XLbVhzw82FzrCUOrP1+ilyPpo1o9nsp7pBkvjWl1E8hHqti?=
 =?us-ascii?Q?D/xHKHMrhowdMonHn2BzQ9cyBR1o4OItVLiJgd0qBnD4aMhaaQ523XrwWgIl?=
 =?us-ascii?Q?ExyuQY1zjVNflEpbqTAI9YrLPDtCAI2QYrrNzDCj3mu/XuDkjX93X05LA/kI?=
 =?us-ascii?Q?7mmOBaLGBSUDxY9cS1UFHxCuf5vrNTWz4usiVDxHk4uJU2aFvDwE0ySgPjTv?=
 =?us-ascii?Q?B4z94r7H4579k9WVqliISYUvnjjttCEQA0PBrLmOHK6eb5WqYg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a443713d-b4e3-483d-9fff-08deeb30451e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:09:28.5767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB4765

Extend the STM32 RCC binding for STM32H7RS and add its clock and
reset IDs. First-stage firmware configures the clock tree for
external-memory execution, so Linux consumes the active tree and
controls peripheral gates and resets.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
 .../bindings/clock/st,stm32-rcc.yaml          | 73 +++++++++++++++----
 include/dt-bindings/clock/stm32h7rs-clks.h    | 32 ++++++++
 include/dt-bindings/mfd/stm32h7rs-rcc.h       | 11 +++
 3 files changed, 102 insertions(+), 14 deletions(-)
 create mode 100644 include/dt-bindings/clock/stm32h7rs-clks.h
 create mode 100644 include/dt-bindings/mfd/stm32h7rs-rcc.h

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
index f83a6120d..48a878c33 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
@@ -22,6 +22,7 @@ properties:
               - st,stm32f42xx-rcc
               - st,stm32f746-rcc
               - st,stm32h743-rcc
+              - st,stm32h7rs-rcc
           - const: st,stm32-rcc
       - items:
           - enum:
@@ -47,6 +48,10 @@ properties:
     minItems: 2
     maxItems: 3
 
+  clock-names:
+    minItems: 2
+    maxItems: 2
+
   st,syscfg:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -79,14 +84,13 @@ required:
   - '#reset-cells'
   - '#clock-cells'
   - clocks
-  - st,syscfg
 
 allOf:
   - if:
       properties:
         compatible:
           contains:
-            const: st,stm32h743-rcc
+            const: st,stm32h7rs-rcc
     then:
       properties:
         '#clock-cells':
@@ -97,23 +101,55 @@ allOf:
           items:
             - description: high speed external (HSE) clock input
             - description: low speed external (LSE) clock input
-            - description: Inter-IC sound (I2S) clock input
+        clock-names:
+          items:
+            - const: hse
+            - const: lse
+        st,syscfg: false
         st,ssc-modfreq-hz: false
         st,ssc-moddepth-permyriad: false
         st,ssc-modmethod: false
+      required:
+        - clock-names
 
     else:
-      properties:
-        '#clock-cells':
-          const: 2
-          description: |
-            - The first cell is the clock type, possible values are 0 for
-              gated clocks and 1 otherwise.
-            - The second cell is the clock index for the specified type.
-        clocks:
-          items:
-            - description: high speed external (HSE) clock input
-            - description: Inter-IC sound (I2S) clock input
+      required:
+        - st,syscfg
+      allOf:
+        - if:
+            properties:
+              compatible:
+                contains:
+                  const: st,stm32h743-rcc
+          then:
+            properties:
+              '#clock-cells':
+                const: 1
+                description: |
+                  The clock index for the specified type.
+              clocks:
+                items:
+                  - description: high speed external (HSE) clock input
+                  - description: low speed external (LSE) clock input
+                  - description: Inter-IC sound (I2S) clock input
+              clock-names: false
+              st,ssc-modfreq-hz: false
+              st,ssc-moddepth-permyriad: false
+              st,ssc-modmethod: false
+
+          else:
+            properties:
+              '#clock-cells':
+                const: 2
+                description: |
+                  - The first cell is the clock type, possible values are 0 for
+                    gated clocks and 1 otherwise.
+                  - The second cell is the clock index for the specified type.
+              clocks:
+                items:
+                  - description: high speed external (HSE) clock input
+                  - description: Inter-IC sound (I2S) clock input
+              clock-names: false
 
 additionalProperties: false
 
@@ -140,5 +176,14 @@ examples:
         clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s>;
         st,syscfg = <&pwrcfg>;
     };
+  - |
+    reset-clock-controller@58024400 {
+        compatible = "st,stm32h7rs-rcc", "st,stm32-rcc";
+        reg = <0x58024400 0x400>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        clocks = <&clk_hse>, <&clk_lse>;
+        clock-names = "hse", "lse";
+    };
 
 ...
diff --git a/include/dt-bindings/clock/stm32h7rs-clks.h b/include/dt-bindings/clock/stm32h7rs-clks.h
new file mode 100644
index 000000000..e62e5d7e4
--- /dev/null
+++ b/include/dt-bindings/clock/stm32h7rs-clks.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+#ifndef _DT_BINDINGS_CLOCK_STM32H7RS_CLKS_H
+#define _DT_BINDINGS_CLOCK_STM32H7RS_CLKS_H
+
+#define STM32H7RS_SYS_CK	0
+#define STM32H7RS_HCLK		1
+#define STM32H7RS_PCLK1		2
+#define STM32H7RS_PCLK2		3
+#define STM32H7RS_PCLK4		4
+#define STM32H7RS_PCLK5		5
+
+#define STM32H7RS_TIM5_CK	6
+#define STM32H7RS_UART4_CK	7
+
+#define STM32H7RS_GPIOA_CK	8
+#define STM32H7RS_GPIOB_CK	9
+#define STM32H7RS_GPIOC_CK	10
+#define STM32H7RS_GPIOD_CK	11
+#define STM32H7RS_GPIOE_CK	12
+#define STM32H7RS_GPIOF_CK	13
+#define STM32H7RS_GPIOG_CK	14
+#define STM32H7RS_GPIOH_CK	15
+#define STM32H7RS_GPIOM_CK	16
+#define STM32H7RS_GPION_CK	17
+#define STM32H7RS_GPIOO_CK	18
+#define STM32H7RS_GPIOP_CK	19
+
+#define STM32H7RS_SDMMC1_CK	20
+
+#define STM32H7RS_MAX_CLKS	21
+
+#endif /* _DT_BINDINGS_CLOCK_STM32H7RS_CLKS_H */
diff --git a/include/dt-bindings/mfd/stm32h7rs-rcc.h b/include/dt-bindings/mfd/stm32h7rs-rcc.h
new file mode 100644
index 000000000..2302e0df1
--- /dev/null
+++ b/include/dt-bindings/mfd/stm32h7rs-rcc.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+#ifndef _DT_BINDINGS_MFD_STM32H7RS_RCC_H
+#define _DT_BINDINGS_MFD_STM32H7RS_RCC_H
+
+/* AHB5 */
+#define STM32H7RS_RCC_AHB5_SDMMC1	8
+
+#define STM32H7RS_AHB5_RESET(bit) \
+	(STM32H7RS_RCC_AHB5_##bit + (0x7c * 8))
+
+#endif /* _DT_BINDINGS_MFD_STM32H7RS_RCC_H */
-- 
2.55.0

