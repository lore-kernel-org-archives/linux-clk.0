Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08E1C4743C
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 15:54:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9D5261356
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 15:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbhFNP46 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 11:56:58 -0400
Received: from mail-eopbgr80084.outbound.protection.outlook.com ([40.107.8.84]:2119
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233222AbhFNP46 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Jun 2021 11:56:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVkVMCilX8wVz1GeeR6znZv1YgOsxb0GtkLuM7fxjfuPz8j7v4vOF/6bm2tIHFSCssnriJh30SyE+6oheDJh6+jfTHccKNJJj0f0xfoKRwMS2XhQlnZ6Hq0tbN3bcGBAOdjhjn/fimFYcLF1sACIcXWbmkvtHHqP80Y04Am3nvYMk7xNS/GgIq3UjyQ8gml2+FKdHUGq6gR9Hn/l9bkRjjJKV4621Q5Vuwo8KkI3vDta5pvOQ9UaFP4b3R/GU9mkw/CBHUJERr0OCfOCoWoWK+wLmrgXhgnksaCVEGzU1uHxfHUt+29pgMY0O8V89hmLVgJUDlYI8ZDq3vGICi5y4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlXrnSjwNVhsVtk9otnu5uMFPyKq4VtGS36t0SDOsJI=;
 b=NMwj49jFMMOy7Z9jGVl6tVtJaaGCp7uLi6mXalHoIka5z2Ghy9+biFMwbskhnX0Xe0XldkUvCANUD5UIcbTpPiGv7mVJ7hwA0Mu9UGWX1RYR4QBqS+Xl7VVkiICViVSaFYX0C94mM2jJN/5fxFd2liTiPlDgYFH7UsmO+H6U6XhMe8sN5WCZVa8F2SJbjEmpP+IGgKEPrALlbtPHHut6Dg5oEKW9xUtlJzNJSJ72hvx5t6L0g/K4ai7HE95nQ5k/lPvwH5As4PhtpRqObXCa+z1eBOz2V70+EfgbguhvdK50wdGNsiLvDRGQ5Dgjkic38lx7qQGyu0XIg5qQNrNgQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlXrnSjwNVhsVtk9otnu5uMFPyKq4VtGS36t0SDOsJI=;
 b=FF4lmOn0n70lu8oY7JCdx/pUxhV5UZ3iyVYf+JNCcVJscqGRXRuCcOTkKktVk617HMerNQk2fOvAyMD4tOM8tRDnTK9Z4GA8uG9IdZfUbz7ygxt6DeGUHvLnVu0RjRW1QeZco4rUhzKGDckZoK+94Qd92Y8cYHeMuONzu9dhtVA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB8PR03MB6201.eurprd03.prod.outlook.com (2603:10a6:10:13f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 15:54:52 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 15:54:52 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clk: vc5: Add properties for configuring the SD/OE pin
Date:   Mon, 14 Jun 2021 11:54:36 -0400
Message-Id: <20210614155437.3979771-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BL1PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::17) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by BL1PR13CA0102.namprd13.prod.outlook.com (2603:10b6:208:2b9::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Mon, 14 Jun 2021 15:54:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a57497b-eba8-4e4f-6cbd-08d92f4cbf26
X-MS-TrafficTypeDiagnostic: DB8PR03MB6201:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR03MB62015E3E3D8B114B2CC0E3EA96319@DB8PR03MB6201.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QYaiDfnGUIFyLvyp3b4P3gvbhztuZK3uAPbzq77npVuVtFMT/+WozavH7UPwenfciZBvnJ7CoLlOwYbGmiMqEzecLbKD+vguj+E/KkYlRp7/HkWM+So53iaxG9pG6XaNAWh50RgIqO5xWUNJG5emcLoliTNSVkDpCZKGGsE7n//woxLSaSxvLHb0xFL498LfEynDpnrFIlSMYPuKlI7z5kSdv07qqDW9RO2NulkFyUcqTUtxOcJErjdLownipJN3IrsYjvPHlxuNwXddb2hfuOt8c73/m7+W2IqcdwQtaU/dgFnHDI7/d4Gchj1NtaGxaDOceEKBr4FR2gm/1OGLGtJLNDwHPrYkpb43AS1WNUcGSp0pDdYCH6lRWnDNUfyIPYwh/zZ6LAEC+qkfz8PFIJr03y6vUwKSA2FRvwHaL/tWEfbjCx+i0iAdRidTx/fumZtnrYmLF4L7VI8So+iwvfmzzQccVUfTahaUQYlAJkNas4gZJBX3KlcNeiW5YwVKWE+1CpmKmZNIVj77Le0imaXtu+mLFyPPxHtIlFJEv9hcbZoBSsUNBiTclP8fJ3nF7eHZSkjHgVxSx3R+a3ihk2tONsqSLTmEbgwcJxwW6u4vfZ1MqPcAlT+ckPdv27s42kpRFSmwODtxe36RlgIJzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(498600001)(4326008)(83380400001)(36756003)(6916009)(6512007)(6486002)(956004)(44832011)(2616005)(8676002)(8936002)(2906002)(186003)(38100700002)(52116002)(6506007)(5660300002)(1076003)(54906003)(6666004)(86362001)(38350700002)(16526019)(26005)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uBxRoAE1BxwW46V47C37Ai48SDLIO12VBteokpg+weOnK4jvz1sniL+aGJgD?=
 =?us-ascii?Q?+h3Y44UWBRRwPzou6E+Z0dSQRg7py4mXQrEoSG5c4FtnZrnpZX5fs7dH67sK?=
 =?us-ascii?Q?zbbR9KGQm4ImzbcvDqkt4uanklkFbyD2oiXYmIulmCgCxKgkq9SfWFFk5SDW?=
 =?us-ascii?Q?McH/q1+fPnBGVwDVl48eWXwI+u1+kdykbPSyJcgGyhNREINeHzH1ypT3Pe5X?=
 =?us-ascii?Q?1eqQDOuYRHX7rf2B8PBdRzVbQJL8F4fNm6CH+5Aw6Eagr8XfjO9SXNP9OPdx?=
 =?us-ascii?Q?eVZew3121cEW6TxVgrNk3O8s+WR9S5qnkTTAPrvbeuEwtEqtxTG0bRR/1a6b?=
 =?us-ascii?Q?ZGBkHy82RUZnBgTLa+ZbS9VtXt8jXy2FuP3yDv43YdHbTVY6l7bBHVhOBrxF?=
 =?us-ascii?Q?gkV0JZsfFx6CJcVikhygkBanPy4WCdvk7dwp7rxyZEOsbTFjFuxYAmqnNFMT?=
 =?us-ascii?Q?VmHuMNz3r+jhzijuY5hLmLD3VZD+PjJnlTMVZhxewleLOFb+h8Pk28v06uzA?=
 =?us-ascii?Q?LaHgiAutnQ5MXdZGJlL9tdgB94/un3zmDCP7kjNXbraG0gQbXReve/HvQc2M?=
 =?us-ascii?Q?sfXKRrIwMjbCyI72JW686lXtKa+1qCPFe9Tryu0eN4vapOhArE8yUF1gDDWi?=
 =?us-ascii?Q?elULv5EobSN6wi0TDW+lpavJ7YEpZvOQ4niq2zKNVM+Hro+wc8YcGH+dCI8Z?=
 =?us-ascii?Q?IqmYlfbb+hlYB/i9tfs2TvNE8DFVEkCSqDDYkP4imCdF5UE5An1pnr7B8mbt?=
 =?us-ascii?Q?55K0uPAfK5ZoVwRA9TiBCpXxFTW+txFabf8XMgp8LWP6uA0I61MmlR3P6ZBd?=
 =?us-ascii?Q?mFnXJxOiYGuqhGcpVvDuedJSYZNTu92ScbydcS2fekfIUURkCv5XHDTaiorV?=
 =?us-ascii?Q?X+2S3r8m6pU7siAlC639oZ2ShM/T8lwfVGbl8yQ9RM2jd7zEKeEyfYUpT0Ey?=
 =?us-ascii?Q?amwV7DzfjQZWbmODMn3WIPeTvXm/TTSt5D8HRcZjNjyB+3Vok65AG1dWRpEG?=
 =?us-ascii?Q?WcqHQ+eq6gVq705N+QjJVYqACtkX0PwqUr0QKYtGrl0qxpuZWQWZSuQXKkjl?=
 =?us-ascii?Q?66OuJgptQr1r1OEE+NNeJoLrTz9rGxjHfbEpR8NzvwxoIqxJVWb9a+lWeld6?=
 =?us-ascii?Q?HbfHFQsajfDjFnMq8qOEIYBj58Zpj5xhnqpRlRQYnKCVU6SUSHyTRRCBSI6S?=
 =?us-ascii?Q?ra3EYpeSZ3Hjw9uGYgcjSLPhniwmS+YJdb458wpXTEVh2/KvE8Ra36YdJRKR?=
 =?us-ascii?Q?/jfijbnbrzpc0fv8FipWRwBweVzyQjyjBb7wcVnPNBWC3jXev0QRFxf97KoF?=
 =?us-ascii?Q?zSE9JV3mDXDSWnWNrppOUEUZ?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a57497b-eba8-4e4f-6cbd-08d92f4cbf26
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 15:54:52.2021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LgbbY9L+JuV/B16xbLbyk3QOjPI7ZCtEemXRdEBbERHdfFIGjzD6IVgoebQWq0Ke5h7LB8a5rsAChET5E6aSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6201
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These properties allow configuring the SD/OE pin as described in the
datasheet.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v2:
- Rename idt,sd-active-high to idt,output-enable-active-high
- Add idt,enable-shutdown

 .../bindings/clock/idt,versaclock5.yaml       | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index 28675b0b80f1..79d67fad5284 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -30,6 +30,22 @@ description: |
     3 -- OUT3
     4 -- OUT4
 
+  The idt,enable-shutdown and idt,output-enable-active-high properties
+  correspond to the SH and SP bits of the Primary Source and Shutdown
+  Register, respectively. Their behavior is summarized by the following
+  table:
+
+  SH SP SD/OE Output
+  == == ===== ========
+   0  0 Low   Active
+   0  0 High  Inactive
+   0  1 Low   Inactive
+   0  1 High  Active
+   1  0 Low   Active
+   1  0 High  Shutdown
+   1  1 Low   Inactive
+   1  1 High  Shutdown
+
 maintainers:
   - Luca Ceresoli <luca@lucaceresoli.net>
 
@@ -64,6 +80,23 @@ properties:
     maximum: 22760
     description: Optional load capacitor for XTAL1 and XTAL2
 
+  idt,enable-shutdown:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Enable the shutdown function when the SD/OE pin is high. This
+      corresponds to setting the SH bit of the Primary Source and
+      Shutdown Register. If this property is set, it takes precedence
+      over the usual enable/disable semantics of the SD/OE pin.
+
+  idt,output-enable-active-high:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      This enables output when the SD/OE pin is high, and disables
+      output when the SD/OE pin is low. This corresponds to setting the
+      SP bit of the Primary Source and Shutdown Register. If this
+      property is not present, then the SD/OE pin has the opposite
+      polarity (enabled when low, disabled when high).
+
 patternProperties:
   "^OUT[1-4]$":
     type: object
-- 
2.25.1

