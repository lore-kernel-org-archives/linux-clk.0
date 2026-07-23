Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazolkn19012052.outbound.protection.outlook.com [52.103.20.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515DB175A60;
	Sun, 26 Jul 2026 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082422; cv=fail; b=n4HJ5Ar/AkFE42luGgX0oqsTYMD62rbqEPh44dep0aY9IeU5c+rMYXsNqIQ5i6j6OvHBCdLj2bL7sKVEEiWMcBJysIdTScfo1lWpGFRGXwJpGA8xdzDkCe0HRFPVofoisVlHueQo0DI7vEKTtBiw7vePZOFB0ZReTZ0kMDSKgyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082422; c=relaxed/simple;
	bh=NW91+hru9Q58mG9xAAgSCn3uxpwzvA9yiJ2OAy+KqvQ=;
	h=Message-ID:In-Reply-To:References:From:To:Cc:Date:Subject:
	 Content-Type:MIME-Version; b=oATxvBa7KxSEStGZz79xhC9YxtQ4KvpkId7uLa6G2HgS7SmwHcS5dTA07z0NRSH/6oqufHM5COdYs5f+m5s3eP0yuFnZGEt0F2rNl/pu9rts4pxhcQC345BxP9swovayim8+mHYxt4R7gLL0UJF6TuViElkbrxQfK5QXrljWdzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qxIjUf3k; arc=fail smtp.client-ip=52.103.20.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="qxIjUf3k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+XWf1dtGZn/lTuyU9TwdzLu6Le8vsql6G15znflPOgILdgRYSja4Jm9Wf2u9FrrQSOA4kw1eYupZe0o+bIgLngM6BMXwQrRABbjkVNHkJse/TICiNmslBMhkFHXWTMSG9qeDhHDDJWtt36Z/JHntWoq2pH0/L7NJu8d6NxojRzEYPYW7nx0abmwpJOUJ8QAZ+i7IfQsmcpT7hUA55iPZMUYjxtvDanKfsGu0fetNQatLEd1LeGXbnQcmXAi3z/rizB5+82Dje+ZkqVuNJ+wYDIkiTDRkTkkuCtxcZb94nMUMT/AU5itwb8cRda8vI2OUfoCXE5MGR0VZcK5IPpzYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieaiLVok+W6Zy/rgpxTHugW0GaXEMswY6bfeth6uyjM=;
 b=T6tr1mFhVniO0DIH0rZrcJY4s18diuWuzWWueJzU+XAStdCv3nQ8JCHEHiS3mNy53M5c5Wth/pJ1TkNmJiooGoIP1g4aMu/rETjqQHLT8C+mmNDiTalVZTJMhNZWyurIrjdUyZj3WlJQD8Fvs4rKTakQFzCih8MvF71RK5h8f50WfaodM1PVe56tWKmZ7LtPC2yvW4uv3gfDHrEbq3/t5YGEQqmu3xFC6TU99SRQPe3/Gu2syDFEo9z+2/sqLrcYgeF5XuU5pYAR2DrvLXTgkBgQ8HhrLekU3KKUaxZJFKgFwbYdlbvfwfRz5gKhFRxt0OJ1gwP3hIYYm4YWPUAOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieaiLVok+W6Zy/rgpxTHugW0GaXEMswY6bfeth6uyjM=;
 b=qxIjUf3kx8gTJOX6iYJTlRC8F1zgcSXWszj48U7JiLKSodftgN2A1l9yCM8ovrqozbgygwWobKaQbypfnVihqtK/4gh032j6SUivtIcpiuThjBTV6JGwIP7wJrmfDde/Vaye1E7DjNkHgEF/TPxj7nVAzXOILa/uTHRxgSJr58L8t2/BlVvqhaNHf20/P6o8A144KR+UNDIOU3FW6wplHRSwOcYmGmJcY6KkbYN3ySpMAFepyKoToJuG+nC7wDAPu9iwpBT9VDjhOOYfI5qW8lNNODb8Kn7ow+CxaHIJaeGSIoEGKuGt1H60Xflft5kj6Zn7OrcULqio8nMVhTMXsA==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by PH7PR19MB6807.namprd19.prod.outlook.com (2603:10b6:510:1b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sun, 26 Jul
 2026 16:13:38 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:13:38 +0000
Message-ID:
 <MN0PR19MB6091D3516E29F0A63299FEF7ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
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
Subject: [PATCH RESEND 2/9] dt-bindings: clock: stm32: add STM32H7RS RCC
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID:
 <178508243876.28466.15214797385370350512.artpi2-resend-2@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|PH7PR19MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 32904623-649e-49c5-0a37-08deeb30d9f4
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|2604032031799003|704163111799003|8060799015|19110799012|37011999003|23021999003|15080799012|51005399006|24021099003|16051099003|25010399006|5072599009|40105399003|440099028|3412199025|26104999009;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mcZH+0rc4404ky4JdTLpBjo9wlrD58qN4hc50MxTRhhC47MdumbdPdPsnAyc?=
 =?us-ascii?Q?0avjgOs4mE4blJLF6Y4yB7zGTQXJtLjHsl72sQ8qNAP5/tZrZxtOg84TTtIL?=
 =?us-ascii?Q?S2Swk1osHxV+P60ylyGZZrSOnrUgR2rpysPK/RmnTOt9BZyKqrez4Fd3//FP?=
 =?us-ascii?Q?R+xVveI961Jce2HtwXYKzxAQvaVMt2de0aYXYgv8V+vo4EKLmizT7yr/IXt+?=
 =?us-ascii?Q?JNw+FXkg6SEQ9l7NCZJXM7c7Z8eMzjQwtgC4Jh9fDDBiS13SsNnEBwM98P8O?=
 =?us-ascii?Q?7jpF1qLxlbIopDuAOw1Dn8612MlQuqf1K9gMi/4Ldh/CWMc1V8oMKFkZYK3D?=
 =?us-ascii?Q?NPjlLVD/J3P/B8ueeqxdkfdxzsbA5mbfKw+CMiIPhciNt+OAqsG5p0QkvO1c?=
 =?us-ascii?Q?8oNHA+n1xi/ny8SCu2+NzpVdk/75A5W66Ic4mYq5cMucFgtLUJcg27VphJsF?=
 =?us-ascii?Q?wFPnfYHjfDADUeYB3KYfQVgJo1Yk0bDTKgUslJDinxRbx52ti1+7j3psun2Q?=
 =?us-ascii?Q?NZfiuIgJQx0aj52i/BxiJvgEd+T7SIRxGT3oTF+cqzWbtuZZ06/8ODdc5Qj4?=
 =?us-ascii?Q?5IGCzo29vjjWLG78aLZYyM9vK4AaUO2F8/zbAHbu1SIYFn0HlvcRrBBjtKKM?=
 =?us-ascii?Q?EYb1djDmIYor/09VsvCMe9wcfY7DNZ7wm9KLBdkDl34BTdvFOznzmyMN3Rnr?=
 =?us-ascii?Q?JLXiZ/Y5KtLztRTatGPLWDwf9jZ4w5PQu6csnGaEaooy7X51O4OJODh9L6mE?=
 =?us-ascii?Q?TZOTQ6gLXbQzbJZNluM1pmrFnq5WeKCx9Mi3CAIgtGBJqneN0qmTQH4Rto99?=
 =?us-ascii?Q?tqB4JNd+kFsyfq/xhXmIdv3+aTsth0f2uFtLaqRO03aoX0sUTTyuuyGws+4h?=
 =?us-ascii?Q?qdyKeUvnnVoF6Bo5RyT8ds5/E1LyL0VS6m46olUEbEGSPpT7BQHbel1KlYBj?=
 =?us-ascii?Q?KYqkS4vmWqstCuA/ZPWqcpmOOyGtc298LwWkz0Tt201TvZKwQh/gw/IXUiqt?=
 =?us-ascii?Q?uiz7J2MQ0WmHXyFntBIkaEx5s27TvQA15TbqiqWQyp6chNO71DZFb68RQ0DL?=
 =?us-ascii?Q?/puOGXhd0pbYfkq2f85ZWmKVdKQUUA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MK4dOyJnwIp2PVEF/asqwc1rY48iEWMIr4MgSGaCAq5XUiMAoIFvm96JcSKL?=
 =?us-ascii?Q?9JnAu9sLK/0QAaO5DVnpx1d85If6skGh6LMGxeIMQ9Tl6+TPCDKBIOE9M9Cm?=
 =?us-ascii?Q?AfFuUWEpzZ0kPHCMkjdZqkS/9g87kiIgFDO965t0PTQRNeCyfcJiSCvdxLZ+?=
 =?us-ascii?Q?NMtUpLAVLOHWIfOlBq1tFPP2WTQZEcDDCJ//QTirOdFV/gDhHjtuO3QIXvdG?=
 =?us-ascii?Q?rEv+XPdWiK4Cl+ywTBlKwgR9tbCHKyjeMnV85s8Ijps+UZpTW2srM/yRC7bV?=
 =?us-ascii?Q?DK5gZnkFz5ww92MyETh3CXvlk1C7vZbOsZyFLjgr8O45+RZlqU1o8nQhcGYI?=
 =?us-ascii?Q?c1nnYHVOVFO/2OvrrVl8p+XsVZ4nRapID7d55guLNYWHfz1UXptK/E9UoJxV?=
 =?us-ascii?Q?9CMirFBznjZGBbqEIy1ljUkpLJDiFLWjPgAvnVxmdz9F6VyUs1JXgwC9jG4o?=
 =?us-ascii?Q?yfc4WlTUL8tSjmqe2F8SugulCpKkayXna86wnv/AX1BFXxo/+9tRUy2bh3wA?=
 =?us-ascii?Q?5el23B+0Dk2aL0I00VRF2rbWoaG76MGlaOPjCGYOYhbXWcavJFJhKCy3L7gu?=
 =?us-ascii?Q?5wDiD1Z9aQ38aoqmxIreRkp9ScehJdQd9d9lm9KonpCWO/9BPb1V6WSHg7Me?=
 =?us-ascii?Q?1uNWVsfHQnyLoD6E6JbUOSkx3VD1zI3o0x4vFeLeyinmzrf2MY9npEGwYqcz?=
 =?us-ascii?Q?OLZVTBniKtUlSqkSlq0IjST01odZiNpRAhYM47EeZou3l1adrEQSaxxoSrhJ?=
 =?us-ascii?Q?pDxmJ/LAg4Z57QdWLsopxaJWNlBT6+ou84ozdwFyQ7uJryatJZlMXR9/fq/B?=
 =?us-ascii?Q?pl5K4mgoFNk/eGHauxGYaNe4H3HBqalKhdHoKTfNwqAAzBD7VzpHY/zfurLD?=
 =?us-ascii?Q?cRK8G80c8Bpp26yZfanWEEjTMhbIVFgMij7H/a2LFtk4mM4kQikmv8bzBGBh?=
 =?us-ascii?Q?cjcEs8NUFJDmPfUehu7wDsQVC+TC2/uCb9uA2KGIM/67I3+rCfktGYWfIIw5?=
 =?us-ascii?Q?89g+YGjov9OMiwfxAVVgO0/R/IkXgyaMad2AeBh8adfw0ikY9zF2WuIBK9pi?=
 =?us-ascii?Q?Q010fozV4IsT1JAXZScxEuWTuybVv2wWyUWTye2nOliXMkdfceYW5XbLZXSo?=
 =?us-ascii?Q?KBf2NRwOOUcdHkui9R8YFO64KcBwLgInj8bm1TGfVHnL1UVGvhSwpCkgYDAG?=
 =?us-ascii?Q?1Fz3IJt0io2+jAsROfpkpOjV3J5AiFPwUXKubmFhhWfmG0WP46gqXby3mOa2?=
 =?us-ascii?Q?JA1R/DKLJZO9K+yb8sphbTuA+sg5DunfW3D8pPWiQHKd11S9uLaa267Nlw17?=
 =?us-ascii?Q?Z4S4VS75LIZa1VAcLweYcR6bLpvml4p79HbBL5VuFBO3j0GO/iPCu0rlPYuk?=
 =?us-ascii?Q?BxOCnfvdy6qnGSAysZ1QoL6hWCsIdDAPAhl0Nfh006zAkWI7WA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32904623-649e-49c5-0a37-08deeb30d9f4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:13:38.3679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6807

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

