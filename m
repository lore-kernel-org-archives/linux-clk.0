Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9469C11F64
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 18:20:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF4E86141F
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 18:20:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbhGASXC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jul 2021 14:23:02 -0400
Received: from mail-eopbgr50044.outbound.protection.outlook.com ([40.107.5.44]:36422
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233194AbhGASXC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 1 Jul 2021 14:23:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqKMg3bYsdXQh6RaiEBhvIi3gZCIWqV2gnNejBpOAcqwQt57prX/3X0BhFNpETDNYaVZSfwtzi439Y/yfYte6vsQJVQP5+1cEGZW4F6WK06G+rDOKjpL/IyZ8YJcN/9DJfjOYqmf3ka6X6RQbXdDpEk+PgUN/VsChjehjoF0PXjl0SBCI5MKb37Zax09SYXeFN/xmGWSx0O3zkRPGr+bCoh+RE+vG5hYEdGwO4YURBqGPtinPVl32L79C4Was2r7kbaS93lNAc+VCvTjWLuhgsWtFZRQX0ay8hialldjRO9aaVGK29xvKxcJUAdTl8E8n5X/RP7Gg9HUKPPCUIXsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/fdGw+I48A3a5vXdIqYVwB7RdS7rs0RNhLyj+MStKQ=;
 b=FXpMmMODm2drFYM+ml1yGBka4ySc6TGLfpByM7g89CurtgO24Un4lZ00FlYbZfbH88fu7jx7a69oUALyYpjDPYR3mNEVwaHUKDlDYKfZP8XFB2/QvQVBYieb/ci0mKK8BpQsdEY2en1use6/W4eWUpPgy7cXMPZ8zFapYS39GPJ1UNrgftWp9GfbUDLlSBLRpoP031Daj0t/NyBPYnIy/g+StGqaU2eKVHtFxkx9Jfa2IWNOv8Qg7ObzPM4xTGCf20dCNTWTyqrKXqChQDuPntgeM+3ZX6ymosjI/4LXKXokAk78G/wTUUEkJdzU3XGPurOOsZrCswfhezu487G6wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/fdGw+I48A3a5vXdIqYVwB7RdS7rs0RNhLyj+MStKQ=;
 b=gEd9rhauq2YpYRNsdfi2y62D3wHrWpdmlAn3liXuwDykFvAXCL02mv55nNb+gMQi0qRniLzesWs5pQ8edHuNxQHtdbYQhyZ/Ws8SiQBRaGsedETxG1QYgMzoajmfWVJpxBzqZh+RdV0N32jITKPRhEMSKNZvNsO3uqenSFJ7MQI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB7PR03MB4618.eurprd03.prod.outlook.com (2603:10a6:10:18::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 18:20:28 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 18:20:28 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: clk: vc5: Add properties for configuring the SD/OE pin
Date:   Thu,  1 Jul 2021 14:20:10 -0400
Message-Id: <20210701182012.3421679-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: MN2PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:208:23b::23) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by MN2PR11CA0018.namprd11.prod.outlook.com (2603:10b6:208:23b::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend Transport; Thu, 1 Jul 2021 18:20:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 713928f4-959d-4018-e48b-08d93cbce750
X-MS-TrafficTypeDiagnostic: DB7PR03MB4618:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR03MB4618F0F344CAE7D51083A2D996009@DB7PR03MB4618.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tq0/3UVBXrSosXiECw4gi7ZGcSTlg8eW4fzP4qgGmRZ8xq82QaxjfxPD5beNqPU6oys14iNAvXH9uq7BjJUAFZ4WEEl31RuwzeCG+vFUDfLSP6DwP+Lq53SLGNdf0USr7RrIibJsmvC4vXjHa8CPdCU2ntfs3JiLioYpnflyjIE30nufK1fE/9RTTERMFcmOGU/4TiuMacM6IyOifGaFaa5voZgWiJMt9AeuxzbHdzzWQEN/MR4EJDdCp67MtAx+I+ilk3IYrLPpcMHkO8nAGhEaGlNWeZ2Ka0Fa2QOOgJaqU5nNoq//UVOD6cGux5HaEH7mSwWTBSUpqK3tfR7XKE3ZGbCklClawmhg4xOTFpYgYSwCcjgk3Ntk807Kam6/HzyFEQXx6aaxyqGeq22nSw1XAMyRlWBWVqwn1bc5f5oYFv6/rj18y21sjytjh4Qt4oXTHWVouE7rLWlJ782LB/T3j8qz53wAPuimObthfHXAp+XYHmpi7VbL2xQ5hpEoIu6+RLqKYULfGpSPv4nKAYTDHjzfIX/XAe7l5mdS1OhFZq307w0Oqic25qJ7ziTwCCxD+tEWRuKwI0zlTyR7nkVNJkost7bOtTzrA+7M/5c5E8PfOWjFon0pn5k84mW23DL6YLxkan87+vX8DxwczTEixCaHzG09JhPlBOWI+cjmqphBdchcDWL4CTdogcPftzMZV/sodIqpSLwiDevzxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39840400004)(136003)(366004)(396003)(376002)(54906003)(6486002)(6666004)(316002)(8676002)(66556008)(38350700002)(83380400001)(956004)(6506007)(66476007)(186003)(26005)(66946007)(16526019)(2616005)(478600001)(38100700002)(4326008)(86362001)(2906002)(8936002)(1076003)(6916009)(5660300002)(6512007)(44832011)(52116002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I4RAQqSogTJltsC4ergi5Yg/fozA0v/kN6RsYfCriJV5f/1Ah5MSXtvUwENh?=
 =?us-ascii?Q?ZKabU2FpbI8tnH5a1MZxSpwFecIa7T2uqtJCQpu5RoyYK+36Y7SfK4n250oY?=
 =?us-ascii?Q?Vg7SoM7GGr2zOWVK8k8hQDq+F03uwEQHToupM3LgLlj1pnv4gbYeZyXp2uyJ?=
 =?us-ascii?Q?sMI/P55On2K3C9k9r3lCLAVxNC2s/zdtE7u2H+pSIxttXHyvwFWdR2usREkN?=
 =?us-ascii?Q?wAOwTjPemTHhYp6ZkG3pMeIlHek9uNea0t6JjH1wuAIKV4GjtoDI3grhM6p5?=
 =?us-ascii?Q?kbtPAlEjjhDSJxOSe61mBxxmJGM8SFBA7ko4ZAJmDlEvc6XgPukbb3txcdP+?=
 =?us-ascii?Q?edpd9P6lHG5Duf9PehznajvjhtkziNDi6LaaH4ihjarxL3KOXdR6+VNNTiwC?=
 =?us-ascii?Q?0BpvUoQwMYLa8q0BjhtTAH1pFD+2VtuWvdVzmiCiggYdtcXFC/smCUnFQC78?=
 =?us-ascii?Q?6+SK+f2uy0dILu2s7F0G+2iiwJH0np5g6O6N8dZ3HrkMZkRCZrTvaHS3GN3T?=
 =?us-ascii?Q?uP71YMq/XRUDNsUZLPiDzSXMzCRBgoQoafhNQm2LveUOpULacLlJ/V7lopdh?=
 =?us-ascii?Q?2Y0U5y+rIL3iNOpmJqntaRSXbxG53nrBmpLEr+dt7UdFTQNSdB8Zr2rA6d3V?=
 =?us-ascii?Q?NN8YdiXrBXMrIO1VRTKClKS7eZdot6YUdBfkcQnXKdmYJXyr8cZWCezUlKF0?=
 =?us-ascii?Q?4TxG2Qso/V0XZwSemgF3E1rer0tZGgy7xnPhL5QLVK4oFwOZii2IzHFEEy6/?=
 =?us-ascii?Q?hPuUvBq/hKe+h7Ks6Eb0+h/idOqfySj08EFikXeUlxQE8d/n7uAXL3mN4fAT?=
 =?us-ascii?Q?zRZS1xVThRZLbMvzSsF0+UIAHwVhEOZe1j2NgGggkPrCq+T9qJGYru9YxpJe?=
 =?us-ascii?Q?XITEEo6US4lWrjcR8NDvVCbPCHPW6FNY7UBU3AKoYUgQ+nXNzGSb00Cattxc?=
 =?us-ascii?Q?lpA8pHkOdfVqsb6/ufCyx8X9SZVtqaFwI3A7ZqGAdr3mC0Opnih6QZF1mpzF?=
 =?us-ascii?Q?vxv0anaNVyxN09+VHxcNca0GewUZ/Lx/9nPDoiKrYRSa0fw1D80f2Rkk1PUu?=
 =?us-ascii?Q?i6XQfesgEWEDyS4sTaMhs2yhzIHuyswRi56uBjh/iMxV23Tfy6zIqsOEwPmn?=
 =?us-ascii?Q?atqXjGJejMCWtwCLQKJ/YJLMPz9S19S90uuNKFI/ufHVQ87mI8KTWQzKl7HG?=
 =?us-ascii?Q?kyuUQnnIIBc1xrmn4DGRehNGIMYu5mm/iZX3GzngEGazEzMbU6H0s3yhMhdx?=
 =?us-ascii?Q?6qgqTD4kRCwxcxlxYPnJkDFTKzHxqvh8yq0yeT2Api2yAByFVdLJHX9zk/AC?=
 =?us-ascii?Q?kzrVanMvYqU7NnsptTfPRUZu?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713928f4-959d-4018-e48b-08d93cbce750
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 18:20:28.3341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPDPg9g8JNdinI+2v3Q5dcLnd4DPG1mtp9gpaQOXp7UjP0+pRhfuU4H2qbJt1fZNduCOvWWDBsInZOqotWE+PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4618
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These properties allow configuring the SD/OE pin as described in the
datasheet.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

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

 .../bindings/clock/idt,versaclock5.yaml       | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index 28675b0b80f1..2631a175612b 100644
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
@@ -109,6 +152,22 @@ allOf:
       required:
         - clock-names
         - clocks
+  - if:
+      true
+    then:
+      oneOf:
+        - required:
+            - idt,enable-shutdown
+        - required:
+            - idt,disable-shutdown
+  - if:
+      true
+    then:
+      oneOf:
+        - required:
+            - idt,output-enable-active-high
+        - required:
+            - idt,output-enable-active-low
 
 additionalProperties: false
 
@@ -138,6 +197,10 @@ examples:
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

