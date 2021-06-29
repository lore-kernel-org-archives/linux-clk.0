Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50382C11F67
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 15:48:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30C2761D72
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 15:48:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233814AbhF2PvO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 11:51:14 -0400
Received: from mail-eopbgr00063.outbound.protection.outlook.com ([40.107.0.63]:37315
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232428AbhF2PvN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jun 2021 11:51:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLTpbibtQVL0E5yknTwbynnr426QCotxCaFXX2FfdFFqu3FsVdxfp4N8cc0uVTWsXUO7CvOvCyXLgFI384KumI/nUd8AC2VrKGb/LNSpCrMm0AG3n48zyALdEMfurCvK0sMfVg8SgzPzniZ4ihm1miDtvE21AGrUlEkHluRoC5OWTCc+JkmoRJKAE3ThHKDginn1Wva7AkMpLiFMOTZp/rNBgyyQyKf3vPqRygGcu68UU0017+3ZJ7LK+3bZw6G+fQzEYiVkIb9vbuULgqt5L9bJJNl3jbXKNBBDDx/kqs0euwGsUpxKnga7VQCVCBQeTcX0QFj2UCBKoHUoU1DbpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sreuYVVbQ85q6pxSBEaAlVJZ9zA3jqVMLexO0/qOIY4=;
 b=TSiXitfR8R+pIMTi6bkfJ/7dphMczzKBo8F0v88kkHwlBm4S1J1XvM+SIHHEyHGXdmCiT5I/h0X6tReeo11bVgpPORUvKtfLF67VO4L5DY7ksW1kB6YVXd8hfEK2toam66vjC8W9NwtV6HGdnAd97xMmde3c5LDWf5BUoOSxfv9VMehVenYYspxakN189FeYRa+IBqj8tYpuGDnwRmuSo51j18N9W62LoHGVuI/KPakaTDaqOIigrkQsY6rhda4mTpU7CAGaaeo/P92/4gBnHnfC0p+UdkXw1StDM2Tg0XdBWREVFIq61tlgDTAx76DBv+0ljF94Rn62Z1rIPkyI9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sreuYVVbQ85q6pxSBEaAlVJZ9zA3jqVMLexO0/qOIY4=;
 b=Tfc23QzjJ56wb2vyBrA2SxUZfo8/TPfee0vnmLPCZj7+ZTcCdwMk6NKce42rljwwKGD14O8v1wGrsW0+MxusR+pQmFZDtahWf4R4KilGC6IFsGGTGmYqQN0TNuZ6MkNNJGbS3zaxfl+d0GjMxiheybMmMFcA6U1Ojx7TBcuGS98=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB8PR03MB6028.eurprd03.prod.outlook.com (2603:10a6:10:ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 15:48:39 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 15:48:39 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: clk: vc5: Add properties for configuring the SD/OE pin
Date:   Tue, 29 Jun 2021 11:47:39 -0400
Message-Id: <20210629154740.3091884-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BL1PR13CA0334.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::9) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by BL1PR13CA0334.namprd13.prod.outlook.com (2603:10b6:208:2c6::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.12 via Frontend Transport; Tue, 29 Jun 2021 15:48:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4891c730-8b55-4fd5-4afa-08d93b155cfe
X-MS-TrafficTypeDiagnostic: DB8PR03MB6028:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR03MB602815A34BA6D5C59542063596029@DB8PR03MB6028.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2zo7PspAxGDcV+dDrUYepjB8gMUxw2REljSOlDXk6yTxef2OMA+r11cfB0q+En0dr8rud8zZ4BRrwo3cIBFfUdXtgfae3icmbXNBoWLbohJL0flDfwj/QumR7SCjaC0pAt0UHW9nzh7sn7TuvrfkC364RTrWx2Q/tAcNCJQ1oIdzUU3FHDjxS3y5vO4JZShWz05qv3SKp9RdwZykCrHcQQVuJ5U4HRefD5BEC4NxbwxPekq3Zd+kH9BWYIH3gfXnCu7fwHYBvn2lnb0ITM7NBj9zzqtzeR7k3T9QkLOS8O7fVGgrr5FyK1IdX/I8LvyEz8ZMEKKUEiICAu7kVjeRQziS/pwS3fdxTpgajE+TKyiX8W6WIw0KwqL96z9FjMylRWn9VZfJw35R5PMibcLRjhsWDEE/Q7VrAV4xuhd/iIZVFofMzAEvx/b4d/L8v3xnrms9R5aID8E7R5Ajte/Vgh1VskivWXjPzgmG2OrEAO/ZvEu4SyQp9GgiWTpJSyxLcO+9q88mTunglxTRID+B0TnvdFQ9QbUdCpNtZYIv90qBcQhMwArXm0uvmsawpygEGNDnAATHOzJEeexk2Rwh168DGYVafGyqbmF1X6Hke1qkiptZ0G0dUlM4c/SReimjdOh4gyryPsv76x2FEKlbeDvOqAiQCiJYYH4sEp1Wt6dVBV9cT1eyqrMx0nXtacomuUmVw6ca6aeYNVB4gIDhHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(346002)(396003)(136003)(366004)(376002)(86362001)(83380400001)(478600001)(16526019)(4326008)(26005)(2906002)(52116002)(186003)(38100700002)(38350700002)(6506007)(6916009)(956004)(44832011)(1076003)(36756003)(6512007)(54906003)(6486002)(2616005)(66556008)(66476007)(66946007)(8936002)(316002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oe6zFkiMa9lzpaP0OGRk3FR0VIcWnNEJefTjRTeT5R3d42jkJYBIx0l6o/jb?=
 =?us-ascii?Q?tZayfpj3TFduaD1noGzHlFFJHlOvepM7cBA7N3yV6KJSaPsUPPl/YNVzO8bG?=
 =?us-ascii?Q?Vf3U24t3cyl+I9WV3vhAAUwcLdrp1ABzBGCC8TdkMQCOSvT2gQnfrBFjJYWa?=
 =?us-ascii?Q?PaB6WojvPT5GXxdn3wA2HNfVv+C+sXc2sEy63+cwEkD5KVZEMRWmJPPi2fBx?=
 =?us-ascii?Q?qbkHfknjRnJC+P9QlaCDXqoy4rKcLmtSnXp9c4pTUG0eYaZ2Yc7CTLhzenLk?=
 =?us-ascii?Q?SjFKMcG1hcUugBIRbe9nLdvokVWfWO3CkXCu5bmwuqzGa1GhXRPZli8SWu3W?=
 =?us-ascii?Q?NHhguIton+xDSocfS0M9X8wViO/+OKcDZ2ffTiD/YZkVfL7+93WTwihis4a5?=
 =?us-ascii?Q?U6JuErPYDuobl4EXMoSqJgPndGu3sqVxxXUkSAHKpWEZKLhwSjAtDB+DXzX9?=
 =?us-ascii?Q?Ukfbey+1qLIaiDAyNpnWNpBqSA7hbW9BjMaKPXrr7uQfMlUeYMeatXPRx0V8?=
 =?us-ascii?Q?L8JSvJ+OpW0T/NFB6ZpXuSLefduxlSc+bpvWiaQLi29qEKLFBUc+DXvCxs7y?=
 =?us-ascii?Q?pUzrrSqaQxWvWTLUJkoIVj+abI0G0d7Y8ePp2W8WyRHz0X22EYrn37oPf5gx?=
 =?us-ascii?Q?6wj46IFNcTFmvrzkNS5ylf/8wk207gKcW+ABYeXFrGR/Q6QihAJGXp10DYpO?=
 =?us-ascii?Q?B/td6pySkGstUzoPQsH7ZGVYjLSP4n1XYiDFThpFriuchCMHXOunHdGDKfll?=
 =?us-ascii?Q?dQtSRpeoHYCu6tceUzv2bBBUFt7MmfCAM5mjx6CyIzInz2XZAXs9v2u6bUgW?=
 =?us-ascii?Q?JJo0VAWlYMFwr3Se5JJTy+hxIYdiGsiPzVSajB7lWZrO+9KZDpkxw7q2XRHV?=
 =?us-ascii?Q?Yc4RWbLfZVusvUL9PrnxPGwHNMzDDxW3xxAbA+JqAElfYrRP55CMrpjfwTVy?=
 =?us-ascii?Q?dA77kt2kNZpl5EQLNKREM+373i0xdA0hdamDdpeMhJySiOFWatjSSWM3JGlv?=
 =?us-ascii?Q?EKaFb6dIFuwbLofEetxIHBcbDTfb/Pv0R0whPrTGDP7a1sbAKGN26HRVghj/?=
 =?us-ascii?Q?0y4DLWEgr6K2/ngL6xwkq9hQsrXfXHCO2+aINz44B0l30gbIE5S5HALy5viH?=
 =?us-ascii?Q?l4Fnth+YtDZF4eIsMiP5VlnCVuSfFVgiwRgYpaH+gZYMQabkVIKrCPSuMlFq?=
 =?us-ascii?Q?IdFKHEyhomoanM4MJrFsytMts6ZA5f+w6l8RC8ccQn38+nnOMWwPIWG7F1+n?=
 =?us-ascii?Q?Y/CdcvtDyjy2W1MOn+WZ4TQAhGoclFaDRC5JXRBsLmgE8Th6289AiSYDROen?=
 =?us-ascii?Q?STIiq0CiYnbMWaR3ZTM2xiJ5?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4891c730-8b55-4fd5-4afa-08d93b155cfe
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 15:48:39.1456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKr8gNX3SpMS3BuPi+7TL/DI7al9Pugou05FAplJF+UTmUuf1MBCWTDMM4EpDeHJNBc1HGY98a2XShLO4C3cKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6028
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These properties allow configuring the SD/OE pin as described in the
datasheet.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v3:
- Add idt,disable-shutdown and idt,output-enable-active-low to allow for
  a default of not changing the SP/SH bits at all.

Changes in v2:
- Rename idt,sd-active-high to idt,output-enable-active-high
- Add idt,enable-shutdown

 .../bindings/clock/idt,versaclock5.yaml       | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index 28675b0b80f1..51f0f78cc3f4 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -30,6 +30,22 @@ description: |
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
+  If no properties related to these bits are specified, then they will
+  be left in their default state. This may be useful if the SH and SP
+  bits are set to a default value using the OTP memory.
+
 maintainers:
   - Luca Ceresoli <luca@lucaceresoli.net>
 
@@ -64,6 +80,34 @@ properties:
     maximum: 22760
     description: Optional load capacitor for XTAL1 and XTAL2
 
+  idt,enable-shutdown:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Enable the shutdown function when the SD/OE pin is high. This
+      corresponds to setting the SH bit of the Primary Source and
+      Shutdown Register.
+
+  idt,disable-shutdown:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Disable the shutdown function for the SD/OE pin. This corresponds
+      to clearing the SH bit of the Primary Source and Shutdown
+      Register.
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
-- 
2.25.1

