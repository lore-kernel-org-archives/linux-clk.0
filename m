Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C50DC47094
	for <linux-clk@archiver.kernel.org>; Mon,  7 Jun 2021 19:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 129C2608FE
	for <linux-clk@archiver.kernel.org>; Mon,  7 Jun 2021 19:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhFGTHu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Jun 2021 15:07:50 -0400
Received: from mail-db8eur05on2054.outbound.protection.outlook.com ([40.107.20.54]:39630
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230264AbhFGTHu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 7 Jun 2021 15:07:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcEnI7C01S4Wb7C/5iG8rlak92zDfm4nADhGO8r1JHzONX3QwFYgCnyPDTB9NCqm3a553g6ya47EedxLlKlFwiE/DwDOvagZ9NGBXXaiQqxxB+jqO1S/Ar6jrx5c8ERISj89ZuEYMY7hSs1fOnhbPqRwE/gzTFPQwnQ1PJMLRpZnAn1E2ywyrZJtPy2Q4YWSuY4rzNo4wjsLUHC8GKrHUeXjVOa+hx1McyEX9J4mTeSvPejBaVt3rhg5PDCVqzAR6eXSIDiDkGJYwsn3ZPm1EyFxE1DKuNgjlgbZR7cmvY7Oyp2K6yVZ50ulrYIhzdqTKFKT/rFgxQFxQc9ajtAfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkG2ZRt0kV2aoJYRo5BmzSnXNo6/QfmcF1PTapL6Hwg=;
 b=ZsZ+kwHecBdEll89dsAbVQNqpwQoS3f7c4m+tOmFJ6NJr2bX/1jJR1w5QYeCEeyxPmvc+xcPdU01oZNOteG8ArCTlA/e0ZL01EKaqdqJu4xD6izH7AYvIo534LFGkDC5/WSy0li+IvlehIBY96VSozRMfqZex72QnfoTgTGeCDycHGVXwdICN4eStZI3GPlylXSUfhzG95wOT0pKJpGvhoBxABRVl0VO5BLYC3sJ3EtfvM2SijB/wJgaQ7Q+rJNSRO4MbJgUEoVNN3dHdB0qisECKbJpGgMS881jo5eRHx8MDxtl+NXr8gGFVQJbX7+IVqf6OlbN0vMa+uGgXjuZtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkG2ZRt0kV2aoJYRo5BmzSnXNo6/QfmcF1PTapL6Hwg=;
 b=Xhg4MYjX55YrAbkVEPPRBrbGCQRwz13gG5yixgjbIn6OBBynh/X4mlc3WXVY+GHRMTPkqnISD6hRmDnXbeifALmEqUEHS1+Hv5EOLj9spwsGraPyobn1XCu5iOr/4aLE5e0k1cI9X9S7nEcAXgRncAbQX1VJRjiJc9L5fPTSnks=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB8PR03MB5676.eurprd03.prod.outlook.com (2603:10a6:10:10b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 19:05:57 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 19:05:57 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Cc:     linux-clk@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH] dt-bindings: clk: vc5: Fix example
Date:   Mon,  7 Jun 2021 15:05:46 -0400
Message-Id: <20210607190546.2616259-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: MN2PR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:208:236::33) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by MN2PR05CA0064.namprd05.prod.outlook.com (2603:10b6:208:236::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.11 via Frontend Transport; Mon, 7 Jun 2021 19:05:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e214aed0-890d-4b01-46b1-08d929e747c0
X-MS-TrafficTypeDiagnostic: DB8PR03MB5676:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR03MB567631617C2B17DEF5EFB68696389@DB8PR03MB5676.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DVZbarpsvupyA3zmLjOVVsd8Z6VCHyA6GmdJmKEt+uIoK4n5ZcCxKQF7WT4AaAsoMG9iMO28aPQHfbNTiTC9IZQI7aH6/g5dACIAkxdiWGQRgvSgpvhVlrTEYC5q/M2ojZtS02APKcKIcmL4RVYIyG62Bc4R+XfafC9a3UMnkcMunvcYr1OQr2Ts4pORbgfNfMd13z9tSejqW1KNvIZaamgr6JumwpxdOJn1CDiWokHcAVrituSt3NebJ1uK+mb0Wm19D6V+xW0lUeRW++IrmgExixnmO8EY2OJVpsPGANvDNV0SSSIe0Pyc2/I4fNoelUB2vWvFS3l47exheVp6qc6XNLemdwSe/BCyfciPPRHN7XDp5X8R2O+9iI7He+sXPp3pKExtmImhQZ30uoV7s0AP8v84PTLkKJWA+V34vO41825g+CZVwrOxkXYjnJtT/XM/RAyquLvFPp+enS43HBj2UkiXpaQA18uTQ8yEY89W+NJ6oA+EO/Clm2dclOZhKQ1hk2lpNKHK8e0avcnkmgkpzXNRMSxmo2yJShgEO14uafEoeVvWYv+1WnxX2Yb5Fb5KLQvbS+rdHaTNu6xStJre6RP/I04IJY8wTrU5gPnQ0IEQ6fa1HWG/nnTba9KN9p6fMc2TjuiaiROVR5WNCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(6506007)(52116002)(86362001)(498600001)(5660300002)(4326008)(186003)(2616005)(16526019)(26005)(956004)(44832011)(6512007)(6916009)(6666004)(83380400001)(107886003)(6486002)(38100700002)(38350700002)(2906002)(8676002)(8936002)(1076003)(66556008)(66476007)(66946007)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uDaKllxe75hwyQz6Gr5aozVzXnorq4aOY2Mcg2BRBX1tQnR5modqP25Uw3fL?=
 =?us-ascii?Q?MJMKkl9dneWVR/+xJ/hflhI/T9q1OIoutxAGN4xHo5T1aJHZSu2EJ1o3NQoP?=
 =?us-ascii?Q?p6g3x2k5kV10eKrqdDADQPTQJAOmWh629pymXdypioX6rUZx3Vuptt92SnQD?=
 =?us-ascii?Q?GquYRLiViHVHE9W5lQd8kWmjkhqtuMtxRZLANlSYKWPFSVWLPhzA0ocEE2np?=
 =?us-ascii?Q?BexMsl2E54ZZNIL9lxbi4Vkh8p+T/VKzwG710JrTf465ffu1R9IfNQvFKrSJ?=
 =?us-ascii?Q?XToA/to/DJo0/hJh5s9qsmyA0dHUWav7I53Wj/8CiLyARmd60xzTsXpO+U6x?=
 =?us-ascii?Q?bAZvRkNVCVG+ZA8oIBrPWZHRlTgXZUTN+lg/+JsdOezRQbjJ2lIen5BtZLTn?=
 =?us-ascii?Q?cl3SYPnfMUr9oStPB4sRQQ7JHiurfSIC6IMJSo/ow6GWtyS1oBgnk30lLhL3?=
 =?us-ascii?Q?9mSaHvidieCxyAcnEKaZ+wfG9aSzZe/fTa6YInGv/IKcDhOk+mcsrr6OpxTy?=
 =?us-ascii?Q?mniCpXIkiyWzbpUX3FtcwoRX6Tz+Fok3tsb1sfWr0mtpFqACxuRwbwTMKvze?=
 =?us-ascii?Q?DrX5LNuF4m7hL/AdbHRId4Cp4dub8otbnJLnRxcXWfLKc0EmQJtnkmLIaKKG?=
 =?us-ascii?Q?Ihl3HSGvY+b8pdZYeBCye/5UTRFox5HErVtYGcu8NpQkfbYxH1+ZWliIv7dK?=
 =?us-ascii?Q?KFZLuaQdYywFtmMd9s3seMZtlyChLGI0T41BuySkPdOCsMBUzJQZnsEfwUXN?=
 =?us-ascii?Q?DtZM/CUVzlrNmXVRNpWwVqTnoIuItVEDFt3cO/1KlvBARQrO3EhrSkVsdhbd?=
 =?us-ascii?Q?nvotkRqS5KsWKfWzVvUSAlfmh2QtB1JnjEaLEKdoLdtbIZqoH0oycJdP9KCt?=
 =?us-ascii?Q?L3ZgUyZt3e+a2onczIs0dnfUI5DGLo6BPgrFVNJsg+6VhgTJY7GBRyBw3o/+?=
 =?us-ascii?Q?snoEuwAHzrAOYSAgGfQDHE9nk71eZQ60olQ8mUesZBIkCjG0Jssx5BWrZCbP?=
 =?us-ascii?Q?MAzZ4zimm1jB8/2MnZomLVMrHNRtHpnREx9ZZ8TKiL1QNRbrYTnSpTdz3diQ?=
 =?us-ascii?Q?ZUydARsVYDYIdjVKoIYnfwD3QiNUkl0TcA8nBUzx0BKSdLbbRuaY1+Ojb5Qi?=
 =?us-ascii?Q?/uYp5G7VIaKYcOIA17h0sxA7f8t1Xh+D9Rrm6A0qyCrX9hKQrRlKL61/aanm?=
 =?us-ascii?Q?eGlcp/LgSy+um2lCcLoI2fzsa2T8hTcf1CN0nxj1wiY0yLnHqFzhs1hJSYiZ?=
 =?us-ascii?Q?zqXnXAgpHogXvePWptZOjl7IFowfUEwDh2yNRra2I2GY6XE1KgfgH/ZLgkMz?=
 =?us-ascii?Q?SH1VwbA3PHRgp+bDz6Ilrvsx?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e214aed0-890d-4b01-46b1-08d929e747c0
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 19:05:56.9422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QutQKxDUBS05fRsMgD91C0lav+8SD9508VOeSdNDsU482ca1R/zgC2pIsj1ASi8wXvIgmVnQBuMIbRX8OOuncQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB5676
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The example properties do not match the binding. Fix them, and prohibit
undocumented properties in clock nodes to prevent this from happening in
the future.

Fixes: 766e1b8608bf ("dt-bindings: clk: versaclock5: convert to yaml")
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 .../devicetree/bindings/clock/idt,versaclock5.yaml         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index 28675b0b80f1..26ed040bc717 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -84,6 +84,7 @@ patternProperties:
       idt,slew-percent:
         description: The Slew rate control for CMOS single-ended.
         enum: [ 80, 85, 90, 100 ]
+    additionalProperties: false
 
 required:
   - compatible
@@ -139,13 +140,13 @@ examples:
             clock-names = "xin";
 
             OUT1 {
-                idt,drive-mode = <VC5_CMOSD>;
-                idt,voltage-microvolts = <1800000>;
+                idt,mode = <VC5_CMOSD>;
+                idt,voltage-microvolt = <1800000>;
                 idt,slew-percent = <80>;
             };
 
             OUT4 {
-                idt,drive-mode = <VC5_LVDS>;
+                idt,mode = <VC5_LVDS>;
             };
         };
     };
-- 
2.25.1

