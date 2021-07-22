Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA53C4338F
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jul 2021 19:09:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 896E560C41
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jul 2021 19:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhGVS3C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Jul 2021 14:29:02 -0400
Received: from mail-eopbgr10042.outbound.protection.outlook.com ([40.107.1.42]:30817
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229977AbhGVS3B (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Jul 2021 14:29:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kx5GcA2jN6nhpTTb8GniFYynB8x/CC3oxU2Rjfz7SNGnLPkjy7QbwRRK/aarUgOPK01Vb93QQs5dtv/jCnh3jJ5U/EqoaAtYIQ8YoGy1xwMW74DFInWI9Xo9JWh1Hmu8erSP891U5+Et8kx9U7V4FA4AzGKkl8dn5DlNcJfp2dfLox6edhLO2jWLLpQeOTEgmYAAM9XymEp5G0TDnOzksfQBPNV0k9OSk/LppTEXT1Y6ZQOjv8M8d7hQ+2iyS2lcGs/rHBvqxJO/0a96uHYMyWNFM5b3jaNecPeTM6hFVDX0tF5f8h7SpD2WU2rWGIhQNUiASffZvDjbEau8hW+Htw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezV0OIwdiZitwzs2/gT/9GCDkP+Fqnh5+zU4vCIxGDA=;
 b=MfRDMGoYsDQtwhSp3Gsm75cSK0bM9jotqOh8VAD3x3H1sRgp5LrnRut55769XQ7H/Nxpv0Cac8RhrHHGk2dUrg7cPc+yrXkeMgvOiEZWsZURwwajeUfIIv6UKVnQSpKBh2ObCAz2fQuBYnDyyq/idEPHBL5WAevTKyFlQyKhBBC58Au/14tPk2PrNNA4ZsuDpN7nrgk7rOZrWGXh3XBYNpVFvZbex+qAW0R4lP7Tq42E+6LwrVW4LBH6dqtzeSzAc3BsJll745UT2Shys+mgLbvUe6w4sr0oeng8cIlg4ljMiPPwTf1frnqxskoeW7umGg5F+6Im8ZChMGi+wztqkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezV0OIwdiZitwzs2/gT/9GCDkP+Fqnh5+zU4vCIxGDA=;
 b=1h6SZ1vAiNg3marVxTW2qjHQL4KgbazwkHLsDEzwaiUD8trrRfZc2Jy3LPEynn2HnDmN0bwfasdKRTYlTkYQ2oTcYY83DbcKMzic4/iV4iYdrH5YhGwNgEOKMvTzHh0VTAXsouE/MniPQQGHMSptCQ/uXbmCaCMuLsC1RUDu7AM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB3PR0302MB3387.eurprd03.prod.outlook.com (2603:10a6:8:c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Thu, 22 Jul
 2021 19:09:29 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1%7]) with mapi id 15.20.4352.025; Thu, 22 Jul 2021
 19:09:29 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Stephen Boyd <sboyd@kernel.org>, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: clk: vc5: Add properties for configuring the SD/OE pin
Date:   Thu, 22 Jul 2021 15:09:16 -0400
Message-Id: <20210722190918.95737-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:207:3d::37) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by BL0PR02CA0060.namprd02.prod.outlook.com (2603:10b6:207:3d::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 19:09:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6b411a3-1a2e-43c0-fe4e-08d94d443acd
X-MS-TrafficTypeDiagnostic: DB3PR0302MB3387:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0302MB3387C335A6CA1F8A80D8823096E49@DB3PR0302MB3387.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MyTa+THkfq3aKtZffMLvKryeiyLHpPohvcOWdzX38+fUJxJzB17Rg26Q5CXfH2YBv5EArlqll3cTndHE3yTh55IwVyX+OwQbiKTTFJbvX/HUEtyN21UpluiUhuEftXH8isjYeJR2g7+gFyEwLriQfgyoWCrL++mVs2eXftIMAn8AWLs0Cf1M/zTtxS1mQiklrdbsp5MQ3uS/2Vcfh0aVlCRyalBNvs37x/X/41I0V+ERCD0JtMNcV7csChAbj1qn7+QsP5sc+6gPhAFpA/nlxQe9eF+j6fWrJgCXF+8556EcOzdvmHnGwx4Cv0i1n85rV48UfIu+Q3QZdv4HlpQltIqgaQgs/vB7GJQLIjVoFC+32GqnAdpXslzcB+Rgq05QQK/rWkTkD9reHyLskJZMI5SngcXw+o1jIQeNxR6Y7NIfzk9ZP766xrh54tG1EIpSgHHGPHzI4IXfrIflplUSHgOo89DX/h4ab4zSMUwhHA7bZcpLH89ojkLrFwFeDReDlZc8IR/pbSMcl6Io9l91LbGbILL8uvM1ZG2U5ufkQel6hImTxGIPrk+xz+96y9Y9SkguCkK3HxplASQuwbRimZ7tPKVYu/Q8iyIfhlr2Ib9nh2IHZ5pxQlmibdyuEvDSYuQzFT8fLnPI2bz/S5ReKscH20Cn1du9x+vCjzavSUmHzZbv5veWu+DOaMmYy5dWGxXAAhLGX0UYmS2GJIv8wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(38350700002)(38100700002)(316002)(6512007)(5660300002)(66946007)(4326008)(956004)(36756003)(2906002)(6486002)(2616005)(52116002)(508600001)(44832011)(6506007)(6666004)(86362001)(26005)(186003)(1076003)(66476007)(6916009)(54906003)(8676002)(66556008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iosL/PkGrTMI5BMRIXoQdIW3RVX8Wpn/btlp4EytgUmWhGPgpIsVyNMVdhrB?=
 =?us-ascii?Q?Id/J6JhKhUAcgnGjipgX6vvqGs/KnyVsuMua3jl2IwoLO2uMktnCWmg2xBcT?=
 =?us-ascii?Q?5ktTamdfqyt15z3ldAc8j+JGwdIzQhKT9BoOe1jQ6NOKgFxnnKuEqvVXUn2M?=
 =?us-ascii?Q?WO72FgBiOfIClxyX5gntVl3Zfw0WGadalZFz+RtB/RQRSuY0ZBZvUIRubD+Q?=
 =?us-ascii?Q?XX7uE6vmnAbC5lxhSs1WOHG0QuH7qWVpTvJ2/NEgmRjOaxpY9bGEZEtKVJeQ?=
 =?us-ascii?Q?3stVw/6L1s6dirfVq/iH4x7FCiD05prCxi5HlkD9zePEc9qh90Qloat2/9Vu?=
 =?us-ascii?Q?hlyDwxrbAXZKmsYDK8hmREicZMZRzXv24YycZfXBam0hkrbIIULL5MmoM8ND?=
 =?us-ascii?Q?ZlFGfuk0eCYbzvJ1AGKHHlS0NdFWzutVrSll65VtxQ/7pIb2TS0VRpHLNPqE?=
 =?us-ascii?Q?bGGHNebf26pPie6M2dyuZOTLPND2p4YAvbjs5zRXoSC+ruLcbBZZQoWHLvAn?=
 =?us-ascii?Q?6RKM+xTxbaQdRpVXYmgLoRSZOWGUg8ZMw2ZP85JI8Om/oqb9VnVvO8UwJL3h?=
 =?us-ascii?Q?J3c+XnZhyheYcZ+smuf7wDhbyLrfwmXR+PBJnxYCR2NNzTtiKCtAD/jDhRsJ?=
 =?us-ascii?Q?7I4GtpUwjBe/UOMa9HOmcslRNu97tbES42gzZ/8Ut4MUSkLUbaDMxdaIHFmr?=
 =?us-ascii?Q?kBsgfFHaEr8L4Jo8KII3Lk6yQsE8//soEkcBZoKb5SD0Sw6oW5MoEbBwMt4K?=
 =?us-ascii?Q?hex8HslRC0rvOlEWJEX4riaswVLSlKMiBLlRjptSv+F8sdycF80bnKHAenMf?=
 =?us-ascii?Q?js7uFwLBN4iFHTyiN/nKkz2/0WWW5WeB1kRU+lSlKLpon/WqpIykFF5H40L6?=
 =?us-ascii?Q?fZGDDaxDgCCLh7i07+v5e49TVtSDvphjch7YKynlAKy1i5C2uZzSqnVu+JdG?=
 =?us-ascii?Q?cvjjBTsus5JY16r/ajrJf3nvZJBbehLEvNkeWGVTQbRDUfVOuvCQnK3lhP/k?=
 =?us-ascii?Q?0baF3jj5GzCwGNqFfIAp34B61BUpCyCGEer86sLjJVEcoz0/BfYEx3NxWNQA?=
 =?us-ascii?Q?JlAo+kEvekgtZnFDqUhS9foPieoNMZW7NJ/Yv1ay3bqjiqJe2s+gOBtA1KES?=
 =?us-ascii?Q?4O9KTy6KDeIhEg6N3WnIHn1GNE3RFHerBN210t4UJFUcLsdNN0PTE3eZExBK?=
 =?us-ascii?Q?4Z77P9G8Zxzlv5/a8TK4Ze83DzNuqVLgtxG8YkgXnDrS2rFPfExZFjP6tYOw?=
 =?us-ascii?Q?wlfgw9zAZoasmyhP+pIO6wEwuRW4Ufv/xBTMvWKPh/JzpI0TAFme1056pWU/?=
 =?us-ascii?Q?vcuKIK721DEjSP0Eoo6gQpc9?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b411a3-1a2e-43c0-fe4e-08d94d443acd
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 19:09:29.0238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKRPkCuXbY+aGmll1c3AU8tnFsAPcvDaA24pzl5NeRRSVQ60WmTvBVHayscKl40EtiHTGwcaq3FliHJlNg+gVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB3387
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These properties allow configuring the SD/OE pin as described in the
datasheet.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---
This patch requires the dt-schema commit 25b1b49 ("meta-schemas: Drop
restrictions on top level 'allOf'") to pass dt_binding_check.

Changes in v5:
- Don't use dummy if's for oneOfs under allOfs

Changes in v4:
- Specify that bindings should specify these properties, but don't make
  any guarantees about the driver's behavior when they are not present.
- Clarify description of idt,(en|dis)able-shutdown properties.
- Make opposing properties mutually exclusive.
- Add these properties to the example.

Changes in v3:
- Add idt,disable-shutdown and idt,output-enable-active-low to allow for
  a default of not changing the SP/SH bits at all.

Changes in v2:
- Rename idt,sd-active-high to idt,output-enable-active-high
- Add idt,enable-shutdown

 .../bindings/clock/idt,versaclock5.yaml       | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index 28675b0b80f1..1abf69e6b8e9 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -30,6 +30,21 @@ description: |
     3 -- OUT3
     4 -- OUT4
 
+  The idt,(en|dis)able-shutdown and idt,output-enable-active-(high|low)
+  properties control the SH (en_global_shutdown) and SP bits of the
+  Primary Source and Shutdown Register, respectively. Their behavior is
+  summarized by the following table:
+
+  SH SP Output when the SD/OE pin is Low/High
+  == == =====================================
+   0  0 Active/Inactive
+   0  1 Inactive/Active
+   1  0 Active/Shutdown
+   1  1 Inactive/Shutdown
+
+  One of idt,(en|dis)able-shutdown and one of
+  idt,output-enable-active-(high|low) should be specified.
+
 maintainers:
   - Luca Ceresoli <luca@lucaceresoli.net>
 
@@ -64,6 +79,34 @@ properties:
     maximum: 22760
     description: Optional load capacitor for XTAL1 and XTAL2
 
+  idt,enable-shutdown:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Enable the shutdown functionality. The chip will be shut down if
+      the SD/OE pin is driven high. This corresponds to setting the SH
+      bit of the Primary Source and Shutdown Register.
+
+  idt,disable-shutdown:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Disable the shutdown functionality. The chip will never be shut
+      down based on the value of the SD/OE pin. This corresponds to
+      clearing the SH bit of the Primary Source and Shutdown Register.
+
+  idt,output-enable-active-high:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      This enables output when the SD/OE pin is high, and disables
+      output when the SD/OE pin is low. This corresponds to setting the
+      SP bit of the Primary Source and Shutdown Register.
+
+  idt,output-enable-active-low:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      This disables output when the SD/OE pin is high, and enables
+      output when the SD/OE pin is low. This corresponds to clearing the
+      SP bit of the Primary Source and Shutdown Register.
+
 patternProperties:
   "^OUT[1-4]$":
     type: object
@@ -109,6 +152,16 @@ allOf:
       required:
         - clock-names
         - clocks
+  - oneOf:
+      - required:
+          - idt,enable-shutdown
+      - required:
+          - idt,disable-shutdown
+  - oneOf:
+      - required:
+          - idt,output-enable-active-high
+      - required:
+          - idt,output-enable-active-low
 
 additionalProperties: false
 
@@ -138,6 +191,10 @@ examples:
             clocks = <&ref25m>;
             clock-names = "xin";
 
+            /* Set the SD/OE pin's settings */
+            idt,disable-shutdown;
+            idt,output-enable-active-low;
+
             OUT1 {
                 idt,drive-mode = <VC5_CMOSD>;
                 idt,voltage-microvolts = <1800000>;
-- 
2.25.1

