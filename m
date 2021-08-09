Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0507C4338F
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 22:38:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95D3A60EBD
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 22:38:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236805AbhHIWjC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Aug 2021 18:39:02 -0400
Received: from mail-eopbgr80059.outbound.protection.outlook.com ([40.107.8.59]:29414
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236227AbhHIWiz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Aug 2021 18:38:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeA6Zcy54ZOo9mWU10IlSUID+UClhTwxVXt2c976Jp/c6v+ywi8X7stBKmjD+KV4qOEPUeShKRjTuAqiZltNwtz9ZSy2OR+xnvbN1N8PMjAIiKcORicQhLvDRpYiuBSXU48IadweoL9aI8P4mC9ZquHiEcDYQ4hE+U1o3B9M1zPL+pOR62ncHwDWuoljZ/WBDYHZ0zM19ouI8y5gkLxhTZc6H/eu93622dEOKDO3mtpFS7NUBQXGtf1kx2F6BfDAWxaWe3E/uXJjIT8SmlVhCfjrihCvbjqki7748Vua9nt+DwHKsjkKsou4iMrf/Vhl82Wb7wdxNLsj5C78GE+naQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+nJmyFk36UuCk/1X0MI6uHACXVvXxr8/JiCWOXMhl4=;
 b=nuznV5biHcWqtWM0uR8hscaThdvCp5HYWlf9fNnR4U7uNPeobNjKd/rnrtcr/KLA8/GMnSigjqVB7bundK7K+oZE+sTQ9O43i+hUDpmHD5QBrPtJV5QNSSJtZcUWtwUfqQ7Gr7/1cvp/rSdUp624jyq9+j9mD+zPdoze6Qeqf4e4mx1oSazEft0yvWqpKsdARUqS6kcCfaMfqkhBMVbXM+I2FDgxmcCz8AU+gX7mhid+74jEpXKMQbOOI09FgfFXBAxoEyDUExmhw6bXx4/NV1e26LBDcq6PX9W/2C+Db4z51oBue6Fy/jD5Y3b3wtlS9GkgthaOG/PxF+wHtquEkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+nJmyFk36UuCk/1X0MI6uHACXVvXxr8/JiCWOXMhl4=;
 b=MKTclY9D145XQPXTJgscjiSaClUvHn7Yp/TRuHnzR4dHlwRcE4504dKtjoefA1WbEuV61kLg6DbPxz7IzTBeTl+VDyOQbi0ww1WYsR9VUms5d/SUu6NZzSOAXX3tgInGOoa552GuzDyMj+VRdCa6eYQ/CmFui4ww1Av0gy/azQM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DBAPR03MB6390.eurprd03.prod.outlook.com (2603:10a6:10:17f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Mon, 9 Aug
 2021 22:38:31 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1%7]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 22:38:31 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v7 1/3] dt-bindings: clk: vc5: Add properties for configuring the SD/OE pin
Date:   Mon,  9 Aug 2021 18:38:11 -0400
Message-Id: <20210809223813.3766204-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:208:329::21) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by BLAPR03CA0076.namprd03.prod.outlook.com (2603:10b6:208:329::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend Transport; Mon, 9 Aug 2021 22:38:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4e799e8-97bb-439c-0dc6-08d95b866a4f
X-MS-TrafficTypeDiagnostic: DBAPR03MB6390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR03MB6390958B5DCFF4E54BBB5E3096F69@DBAPR03MB6390.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bHqp+xfEuQX5ZUEQSCxg4TyXvDHX/IiCKaR22EcplsLkwl7eOwm30jk8/NN0E1v1eaJ02hRlOh/GpF3kutzQD/UGhcUVkuGiG3WjPpNVrunyQMRKeNEsKfsDKhGGVZh3Sdwc7QVkVyBanVU54beeML54xninkj19wAsX55xaWmsMy1kgAttrJT5otFEiDOqc5XHmJZOC4zWeGHcsmdsqpelqhFUPw8mYbIaJv2e20nm3eO0tEA5Bz1BOiUktp+8J5V16Dr8Oz7AKbSkvzKmaK1lj0E+ssZu116ko8LQuDWL70RTQ+cIGsGjmgP8WqMhFy0TIFPleCtbPyrKEmO2kiy30sdJkuPIkcYBMwNukL9GcL7JkQcB332J7E9nxNo0Mvpq1n/m/M8KlvDHR5w3OajgdpO3CSl2CRRaWvGrXOfvQOg3kC5CO18Fu9z091G7mu9eKrEWuhCE9Ii8RAnkehvglMB2hknOJfFZv4HGRHJsPt3ICsvtVFyybXNJ6pDxxHaY3XphcTCB0Hhz98Vx0NgysrVv0gZ8qEOFLRc2qGR2IOSE0BkcVXDFqBNC5XJZjr614ZxentPM8WZEiJHN+If9yZn4yxSqejDFm8LUe7GfcKYyh4zxQzu2qouWHYApPPCr/28CU4WXw1EOgj7mKvSRLOYqMC8Rhj0P+hEx80a/4uQj2sOXn2qfV9U6NzZikoUGqC9zN+ejMtXzDTHlvog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(396003)(376002)(39830400003)(38100700002)(8676002)(38350700002)(1076003)(44832011)(66946007)(54906003)(316002)(66476007)(83380400001)(66556008)(26005)(5660300002)(8936002)(478600001)(6506007)(6512007)(6486002)(36756003)(52116002)(186003)(86362001)(6666004)(4326008)(956004)(2906002)(6916009)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D2Kj9W/apFowZrGOcY7eXZs53iOsCFnCz7eGNJkTzT4F3rt/CKf0++wmP1sE?=
 =?us-ascii?Q?1WK8YRwYbYqrWKiuyYlua7CJZHGjj/Sz+Y8zf3nm01PF3UTtgIxgt/vx10rj?=
 =?us-ascii?Q?t31jbI8elFKPi8NzanyIOE4pHsew2bxo92o1lYRvuoylrZIxtl+3wXw78FQA?=
 =?us-ascii?Q?zBexqpFO6ddOwSRTW96RQ8g9Gg+4/4iVGbsMGq1PWsHNx72fKPATWoud4nT7?=
 =?us-ascii?Q?OW/Ajb5vzJmVxLLo5ZVVcaX8bBiNxuLK0V3KFNaL99lvxX/JaE54G48sikge?=
 =?us-ascii?Q?2pGwTZ8XSQfyY3wnh2+m9FuRtMgVGN8wAP4e99jqMs6eEFq53yvr1K/MPvGX?=
 =?us-ascii?Q?uzwSbx5wvyrDALPtsd1v1ya2eXG7inicRBcphQAQMIY4+4T/UWohc25xU0VR?=
 =?us-ascii?Q?wf6LH9GAQPyElDvz7JATj5KiU59zGz8+gt+PPRW8dVs3bbZnG3zoEwHua8ld?=
 =?us-ascii?Q?8AdtruihvksIFfALVjMq+PG3GjKD94A6eK/nwjn6cGTg8qX3eCCXQOg11wAm?=
 =?us-ascii?Q?yURGPZeAGaY+q8C6CCknHeyYnIdWtj45SMzswfMA8onKyIRbFANRyW41X776?=
 =?us-ascii?Q?/vw5p3XfA2P762CBvL551iwCjuZHvGr9Q0GX8JK/jHhajGsdsdXBf/Uq6gBj?=
 =?us-ascii?Q?I+k/RI1rBn+aWYTpqwl8zsze/Hip3HdmrULctIi8zQrEvntBhiSl+JKde5CE?=
 =?us-ascii?Q?sT1DVQRvO3rds2fAsnQ0Jpc94V8V+DQg0vcldBoE3p2kl3iEzoqFXpy8jICC?=
 =?us-ascii?Q?P67R9HnLXhSk8CKwCmE0f57xRYf4ikph5yoKY/jKNueRNNSgJPU/t+PxYIXU?=
 =?us-ascii?Q?ZrIlfaObp4xPCIl3lsmRmZZuUYD3S/tmLHL8L40mHE+y9JFPB8jReI2WqCHj?=
 =?us-ascii?Q?bImF3+ok0/jcIGqOo94v+uC2uyNkIxhpAdr658VwYSvwe70XuhuXCgSXes5J?=
 =?us-ascii?Q?P4EJFYgLEj0xcDABkaJQnpY0xJj/CgVzchSNDUfRhx+dWUhxTa9rXeiH3STc?=
 =?us-ascii?Q?yL3ouOBO8QYZ/pPaEvOIo1Z4oEQz4DjCcE2wHvjR2hgdK7I8EtDdMyYPQxCI?=
 =?us-ascii?Q?m3Gr5lKjtE5F4bc7IkyF/+y1noxe2fqTCS4ZsiXYVlNrvB004UYw93S32ARe?=
 =?us-ascii?Q?ctBL4uxUI3Zd9xDKQ+tGLOYMaUuWPe2ZQ2RXA4MXD9LfJ+SIn6Sz265M5x2z?=
 =?us-ascii?Q?Dvkv04upOFmXWPc18Z1mZNPRkYtYuGuR3jk72qV8U4RuQ3Nfi/7S0q5iOhH2?=
 =?us-ascii?Q?wGX8/6Mixl+SxnbQME3oCCH/1vmm+iZKvVH8P9xwOixDyrTFq5/qBcnA3FTP?=
 =?us-ascii?Q?0XXgV0bmWqzKC95dse3B14Jq?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e799e8-97bb-439c-0dc6-08d95b866a4f
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 22:38:31.7946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gH8tZ7nRVGdZf1PSG3GxM7Hy3h4EORK6bb9EBVmjKAg2KpvxKYN+cgbw4SlBHI8SCayCY7ryAQ4henEo5ZiTsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6390
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These properties allow configuring the SD/OE pin as described in the
datasheet.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---

(no changes since v6)

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

