Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CC1C4320A
	for <linux-clk@archiver.kernel.org>; Fri, 23 Jul 2021 23:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5177260E98
	for <linux-clk@archiver.kernel.org>; Fri, 23 Jul 2021 23:13:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbhGWWcv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jul 2021 18:32:51 -0400
Received: from mail-db8eur05on2083.outbound.protection.outlook.com ([40.107.20.83]:51072
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232550AbhGWWcu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Jul 2021 18:32:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhDyylJ4qPJ9NzjxqJuIzdTEI9vAGDgd3w1dWTvbwXtUF0P0ZNir/L3sYwENxtf4jak2MiQGqhuInlAj4fl5eSmm2JuYLC+p05HyJtQGwiQ6TgVAntAzLTUqlcBobcHMR702GBUQVjCIB/BMd1h0rQpYn86n22bhAT19QTse4tAjOHKCny4iZx2x2ZPCDR/t4mx8yyPMIuVeGOOAPJlat93DNBwMKQtVSbLWuL0mtoWgt8cYAec2NLqhRgSA3nGD9jfFDdATwmqgyt/wcnRpb8ed61wOljqlo6/jhRLakUk1nv3OooIOJ4u1bqK6r87ybAetr4qszx7lUc33Bpx2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khF1ZlA4537PL8GtuMAnV6DYFsV/OWpxEZqhlprbSEE=;
 b=eHvq3OtsgynlnR/zBCd2aDfx+sx6lMqVAvlM1u8GiviIskkAbpRfoXEtCjAg5+y8to7HDmvIrh4jfUgeeKTaf8jEK/19QXK0gKfpIP+GLhh2xdQZC0EnvPsI+NFRGnnO8pdPsSPwFLCSScLPXmSni8vv06UaOVC2U4824rvjaVPiebYW0f13cpxb4LDXKIzq9cUzWTfeSModpql1oS/DXskDmwcYrrFPPj8FZw8nG6iaLGR6khfQU4MoAJhoEA+eZjsS5S2ctCj8hzphDGs+4D60hJa1PRu0W3kwr81veQsMsk9O6QobcDQF42EaVaRrT95j3mSp07KclxhFXck3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khF1ZlA4537PL8GtuMAnV6DYFsV/OWpxEZqhlprbSEE=;
 b=lkL2kynzkEvfwvYGnY3OZo3Chv6GKxJvdth+rvfvxfo6ZMa/4baE7PHisJ6hXJSbV225nCSpwb0tjMnUJWRLxg1zUkiEA1NQC5G3mKGbrUV3oa94CNPsG0vv/gF8rLXYyTXGn0KxPOvuUQJwQrAytlPHD7KkQtELx0VEezvTSPY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DBBPR03MB5365.eurprd03.prod.outlook.com (2603:10a6:10:f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Fri, 23 Jul
 2021 23:13:19 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1%7]) with mapi id 15.20.4352.025; Fri, 23 Jul 2021
 23:13:18 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Stephen Boyd <sboyd@kernel.org>, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: clk: vc5: Add properties for configuring the SD/OE pin
Date:   Fri, 23 Jul 2021 19:13:04 -0400
Message-Id: <20210723231306.674310-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by BL0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:91::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend Transport; Fri, 23 Jul 2021 23:13:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e270a8d-153c-4e3c-6c48-08d94e2f7532
X-MS-TrafficTypeDiagnostic: DBBPR03MB5365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR03MB53657D6D4B8B71A37BAD31DE96E59@DBBPR03MB5365.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jZYg75qINcReX7Ufalrf0IFgJd8dxxp/0HoBaPEIJtDcFAEUNiAMRihddUttYJoilJHWrPJXMtTUwsoSE00AUCPOidcTdLleIrnbVEwDO6juZxdYP5uRKvffeZTLf0Tl5PPUED6KISrE1wublA06PyiDczAxbVm3N/Bnq2Xic0xQFA42d3MnUfekDiIHwxvGqyUabnELQO1OK8MQNC/M43M4jDrWAJMNOEph8wnVLTC2+gswhRgP5adXJm8RBJgViQ6deRYroT8MmMRSMWEdVTjF3BTa+YHVvYAu3/5HiXz49mWWVa0LeAl8IxJVcGMbHb/0ABO0MzYg0nPamay93NGEnVZH6irouh8ESqsR3mPjHEoduDwMkBE/ADKpdHfmpmvfRKFNRynNYMO1Ds0b1eOoDloDykpPP9D1b6rCp4+hkBPBPIcrK4ySf2FIT13eE+qbP8IqtuM7TeLuHJfkbWVQFNB6C9Vaxmo2nqbO1hMNO10cZeQqkUGcJDJ36jdQXUhXVm5WsvMfF6fqkZGQZmSZy3DaPeUHmisiZHlKjLP+N7NVhH6NS47JQ8p20fYKH0j+jtWfeHrrYo/Ilv2nfYBvLImbXVUizL/aeXKGBgoOkximzZBDJmqazNR0yjNKvy8YKHtR0I1+YAe8XeR/SovfyNPwRWkDA6xRK8ihc5jqfzQsQeSwy8lFC7kh/s71B/0mlsph1wpUJQ+Dy7doEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(39840400004)(396003)(376002)(66556008)(66476007)(66946007)(38100700002)(38350700002)(52116002)(36756003)(5660300002)(956004)(54906003)(6506007)(44832011)(26005)(6916009)(316002)(2616005)(4326008)(6486002)(478600001)(186003)(8936002)(8676002)(86362001)(6666004)(2906002)(6512007)(83380400001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+SIilGN3GLxMdUoVgBFQqLzRrxVTin4JYl5iDDVPztURVpoMHYPMvDegkO2z?=
 =?us-ascii?Q?7xOhimfCUgPjqq4S3q+CdcmAgkzBsTK3fpuir2Y5EkXTs07kVqNyZKn9L4qH?=
 =?us-ascii?Q?1Vx1UhiMZMaHe3Mzd/sfS7cD8xhDdhWGkZDGAIv0RvedBhaeU5p9BPOn6y8x?=
 =?us-ascii?Q?255dCjKG1hmf2zN8rk86uoL8DreQnu95vyoNRch14IjRqBSMif9knjxtsfqt?=
 =?us-ascii?Q?ALABCHauTR8VE8YN1i9fsaKeabDuOK5ESiZfkRb2iLbFM0tl2+Dvd8jMYaCt?=
 =?us-ascii?Q?qhUkc2PiFQQb/XiZt5fZP+k4j4TTrgQjiaB+mkc0UHr9G4wV4Eq9W2f9bNOL?=
 =?us-ascii?Q?diiKue5qIr96E4lNca4/woFX5skBjvYFmhSCdsVQ3oKH9x5UhewU4GvdDkiQ?=
 =?us-ascii?Q?eBWfedWGTjEX+yyO+g8D7/9IEECeFMx1y17PZ7K9qCd6DdrlJahaKCfQMwSH?=
 =?us-ascii?Q?BKK1psKqJpycPard4hUefGOaKcu7077JwomApzppZlUHSdOieD82vokbCPC5?=
 =?us-ascii?Q?dmJ4+lvfRN+bxgRuQ8JJn+vyYlrOXfi4wgwVziOAz94KPZM8+pLVwOuZNZu3?=
 =?us-ascii?Q?11vLP4gOxtVxgCR0DbqTbkDZzKcWTwQl7dJYZFN64kiuwrgJCOr9mFO8MIuv?=
 =?us-ascii?Q?P/sxSb8v/resJfQXqDds0tciDDkMUhU0W8BylzC+HVPayA9e4z9CoQRKypXH?=
 =?us-ascii?Q?QsO70NDYMWoRIqqork0C9u72KdY6Y8jMcnykiS7I09kfiHPtI2GT7Ua4NHv+?=
 =?us-ascii?Q?jSuH+cfr1ji9SfooBXaasjbDaTHo27yrzZrFS8k7LioFmbgji/jGqVeY6Rh9?=
 =?us-ascii?Q?pQ+yygiiRLCUlRXoslQU8v1MUpRdaPLnqHRm/53RwqdIiu5+Rllmv3MA1BCl?=
 =?us-ascii?Q?8RXGpSKDLF5RhSkA7ZM0AoQAMfkhnNQJ3cHaZKPNycoipRRZkN6r6WYqk6i8?=
 =?us-ascii?Q?pRsUVg2bTRL5qwkiDGk9r0alLlQmD2mHGekqWKEaNwQ5ay40DqYQN8SpK0ni?=
 =?us-ascii?Q?G0K8p2ddq++cc4aH+dRnNLRXJ22GjnOwXNcK1gNKRRDuZaKymyf4B36QqFTv?=
 =?us-ascii?Q?nD1OOVmROkRMn1aERGKE4y+1xtg7t30MBgiyfZQ8BTvEN8RIBCfFEa96BnrT?=
 =?us-ascii?Q?AQZemdZyGOOHoUuFXv87e7T6eDqNalerRg3Q0FYbHa7U4xERMEBrf8pSvEW+?=
 =?us-ascii?Q?cnYTvFfCFHKyyEhB3Z3rEdO817i7cZWCzbnwMHVez3bjSTrvVy/RGGn7WFcw?=
 =?us-ascii?Q?nBSL68U4UTPHE+a5Et7rqi3FNiDgycRtfmPfbv2gohpIkt5W7VMZ1htkvVf9?=
 =?us-ascii?Q?jNurAoN5Gc6dFcc2jSOzvCLL?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e270a8d-153c-4e3c-6c48-08d94e2f7532
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 23:13:18.7923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3QZnOCxAiDWHDo65Tmua/LeIK9xrk1Srtkri9h+xmFwplSOR/x7Ekmb4kvc0mu00qNPXLQtfJORk7NjVbddAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB5365
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These properties allow configuring the SD/OE pin as described in the
datasheet.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v6:
- Use tri-state properties

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

 .../bindings/clock/idt,versaclock5.yaml       | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index 28675b0b80f1..e9fc781a21b5 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -30,6 +30,20 @@ description: |
     3 -- OUT3
     4 -- OUT4
 
+  The idt,shutdown and idt,output-enable-active properties control the
+  SH (en_global_shutdown) and SP bits of the Primary Source and Shutdown
+  Register, respectively. Their behavior is summarized by the following
+  table:
+
+  SH SP Output when the SD/OE pin is Low/High
+  == == =====================================
+   0  0 Active/Inactive
+   0  1 Inactive/Active
+   1  0 Active/Shutdown
+   1  1 Inactive/Shutdown
+
+  The case where SH and SP are both 1 is likely not very interesting.
+
 maintainers:
   - Luca Ceresoli <luca@lucaceresoli.net>
 
@@ -64,6 +78,26 @@ properties:
     maximum: 22760
     description: Optional load capacitor for XTAL1 and XTAL2
 
+  idt,shutdown:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: |
+      If 1, this enables the shutdown functionality: the chip will be
+      shut down if the SD/OE pin is driven high. If 0, this disables the
+      shutdown functionality: the chip will never be shut down based on
+      the value of the SD/OE pin. This property corresponds to the SH
+      bit of the Primary Source and Shutdown Register.
+
+  idt,output-enable-active:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: |
+      If 1, this enables output when the SD/OE pin is high, and disables
+      output when the SD/OE pin is low. If 0, this disables output when
+      the SD/OE pin is high, and enables output when the SD/OE pin is
+      low. This corresponds to the SP bit of the Primary Source and
+      Shutdown Register.
+
 patternProperties:
   "^OUT[1-4]$":
     type: object
@@ -89,6 +123,8 @@ required:
   - compatible
   - reg
   - '#clock-cells'
+  - idt,shutdown
+  - idt,output-enable-active
 
 allOf:
   - if:
@@ -138,6 +174,10 @@ examples:
             clocks = <&ref25m>;
             clock-names = "xin";
 
+            /* Set the SD/OE pin's settings */
+            idt,shutdown = <0>;
+            idt,output-enable-active = <0>;
+
             OUT1 {
                 idt,drive-mode = <VC5_CMOSD>;
                 idt,voltage-microvolts = <1800000>;
-- 
2.25.1

