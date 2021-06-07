Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CA1C47094
	for <linux-clk@archiver.kernel.org>; Mon,  7 Jun 2021 15:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C03EB61029
	for <linux-clk@archiver.kernel.org>; Mon,  7 Jun 2021 15:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbhFGPvj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Jun 2021 11:51:39 -0400
Received: from mail-eopbgr40081.outbound.protection.outlook.com ([40.107.4.81]:37445
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230440AbhFGPvi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 7 Jun 2021 11:51:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZ9+g40H/8bvuuQhyhGUtZq9HeAoks3cxsPKCO/ddhZ0d2RKJ6HYFIjY0h+JS2j19aWLOTmJv4eKQZF5NDfZL5tO6/XlWvsKUk10W/XdPpu1IP/mG2S4b2YQFv3Oh0x0Xyl+rbSGnvH1jKa4tKrnQ22l0JOWF2ipfgIccq5CmbUiSfRZN8HRcGZJFABikzTHznB+ujdc5EEpaUhpEpgqw/6q/1cA95l8n7WMbHr9ctGru9p51gHDIMoRDAUb29pj9VTJwPiNsioQKWf1cyzLfUpm8czbkQ9XJnKc+0j8U97H2LfonSPTK50URH3K3AtZV1WcBqJhDcoNG2VjQG5tGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3Gnz6y6kMDjeGge38hRKYZBLfTWpnnqxp4/5KXvULo=;
 b=JO0Z28Hp48PpbFdh2RUUHtLdoQ8JSO1rzETgkql3mVbGeD4klCNr3XHkzza6DUkTL2+iFmasLApLQeQZHoYVjsE9bhs9Jd24WTrkoc0OKMpk3bjsmdYht3QsAdtMlawrkeZWW2UmqxSvzv/o/6nq/DppnJAioc/xG6RXwTVLuzHl0UuLKcwpXlptVH4TYqC4TZWGhV5+Lr2qOn9PALLR+wDduBzqPpgMJ7h2pShjWAQiYmq9mh126Tn6DEWgqHYwzcns9wlOTbOXyWAKSJaN2SVFOY+SkDD0d1OZnwzpLw8MCmXA9ehzcMuSHgXuej46pye+cHNTYhKhQwkp9rt2fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3Gnz6y6kMDjeGge38hRKYZBLfTWpnnqxp4/5KXvULo=;
 b=QopKDEDwHyFeyEXyFNA42GQjVEGrh3E24RCqhgIo4xfAWj6d1UFluvOoSfPYCCma9CtRlnJmTPIoW9SzJ+3bZVJbky9BsRRS/L3uL3A0EN5a77gxDvQ9509WgaJNAK6JZnAaJewsbfRxQt5f3qz8t/rUNI7SVDqi6vrMsxOtYsc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB8PR03MB5673.eurprd03.prod.outlook.com (2603:10a6:10:105::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 15:49:44 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 15:49:44 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 2/2] clk: vc5: Add property to set SD/OE pin polarity
Date:   Mon,  7 Jun 2021 11:49:31 -0400
Message-Id: <20210607154931.2491499-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607154931.2491499-1-sean.anderson@seco.com>
References: <20210607154931.2491499-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: MN2PR16CA0060.namprd16.prod.outlook.com
 (2603:10b6:208:234::29) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by MN2PR16CA0060.namprd16.prod.outlook.com (2603:10b6:208:234::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend Transport; Mon, 7 Jun 2021 15:49:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4587ecb1-0101-4baa-e4b6-08d929cbdead
X-MS-TrafficTypeDiagnostic: DB8PR03MB5673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR03MB5673AD2C28157251BA57CB8996389@DB8PR03MB5673.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gO2i2saX3D+FXm0mKBp6dTjsISx8Re7Pl58qTgpBCSO0ouwc/Eb4DB+4GULrtIQrY1dTURgxbPe7GtG0Ly5fymw5+xm6ZAGb9Md4hGgMrLUmIctGWoXw3uPRS7V2YMOZoA3VxOr7AtLxJR6C2agkFHdtZuhgVtOD574uV53vbvQXh4jW3uY9bFWB7OY1C29M5rC7eQSlAq1QuMB9nsNLc8Oh4Ml0uZul0RzZsZxsqkbzHd1Ybe6xKwjmdLgjnUcIV1nU23Y/dVOgHZ0CwMsPys7aeCY3zOA3FdNhjbk50cg8ps3kGAZLFurUv8TN6qlEuOODLV0g+94mcrjDAOWwRMEq5YltHlCe8uiR5F6u+iFapZBicPfpIhaQeXkr+e9vXfs4Qpi/T8tyGSm5qmxCLvkwhN6Evx7pW6YRzsnLg/XBKI9XjMa7sFQZOO5TXJCEkDpAx6OJgTWyzFFRi6clT79cbGfwGIP3rUQDBYXcBZ0JCUWWJbVPUCHzCzooEh5twAEvUvMLYNcgzRPJv/olaelP6hBSs0wY6BdJ2xq4Mj2heEhLDnPaqb9gqKD86D7IzLw2Sh/GNwk8lLuLcMM5FdNuMwksxpea74NQS6FFWwl6t7Pt/iVKpR0OpnGB3vQia2+1b4W9j4mRtsSyKELyPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(52116002)(4326008)(5660300002)(54906003)(6486002)(6916009)(107886003)(6506007)(2906002)(6666004)(83380400001)(6512007)(186003)(26005)(44832011)(36756003)(1076003)(8676002)(956004)(2616005)(66946007)(8936002)(38350700002)(66556008)(66476007)(38100700002)(86362001)(16526019)(498600001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0HnExO49LCTj2RURerrPjhemD4N990lFgtv/Vxcddkp0AytrBk8vTkBjh4ti?=
 =?us-ascii?Q?ZVOLABPcTAFvYCIqiebLtqta2AUft7v7qobAlRxIfF8HlzbkXvIOZlS4g8sx?=
 =?us-ascii?Q?S2f8n+yPXLw6LQ71QKDr8VMfGhWHU0BL1PWCfOJLik3fUeWg9tvrrFAtN1eQ?=
 =?us-ascii?Q?NxY8Bdu88CNaQ4wWJlpM15mmUis17+iir0emhksTmhRhXQ93vf9b7RgVO68M?=
 =?us-ascii?Q?QW/LTw8spb28yoKjwxiVPvaj+4ArVPJho3k362rmtqf3WPEWMxKjPHKsyrq1?=
 =?us-ascii?Q?gwzlkZcQiKyCuYRN/cWRwXOAitg3mXv/H8HVQq868q8g44rJU8uYlJhGYAMf?=
 =?us-ascii?Q?LYXwsd4PmONrG2lFJ1HCJKaIsq77Far/hjobc6ZIJmxyOqzfH3ZlnlokHFqI?=
 =?us-ascii?Q?5tZ6jRpobVHLOZ1ZLo7LZS+0e9bYAyOLbiShld/B386tl+PciUi2ioefc0Bl?=
 =?us-ascii?Q?rtp2nJqRmtnGJhJLUTBtUjEFY97RB5znNAMu3fo/wshpSJISPGGk469Q54/r?=
 =?us-ascii?Q?aZ7KVKZuWP44LoB249tka/77ZaVpNkYGsMAqJxavA5rFrOG9LNP5V8koskrm?=
 =?us-ascii?Q?qk8j6jOVYBtxtwwcM+TR8CBHQX6Ak0WL/Od1e0Qwdb2Tcx7PM6M93IdxXv51?=
 =?us-ascii?Q?P1nAmQIRcw56hRwvGE+xh9xm5ohI4U4uahawCNWbYdpLPIdYuk2PUF3nk5Qs?=
 =?us-ascii?Q?gIIEkQC0c1K/9gRvASHWxYVyEfwGvEzBD5D7f3IRhdnOq/NBsKvjRaB3AHu/?=
 =?us-ascii?Q?E3gKhoSaw8HIX6mQGFogyOUoewEAO2B5gk6gjS343umnNC84TZAokjsdYJgB?=
 =?us-ascii?Q?X6XDHeQPJutbeF10YZdIKD8q0nkCjq6j+GNq55FJ2jvMHn2Ld8PRqaeg/BDx?=
 =?us-ascii?Q?mpFsQcEhYGU2pgQdMHDxQKTjEAlHSHm/B19937/yYuEaWyhqGP4Q3p7UfnW6?=
 =?us-ascii?Q?A6GblcxUIXbeqN2T7z21lnxqx1us5oH9VlREDqHy9Dt/DeaSU81qV6Alb0/5?=
 =?us-ascii?Q?+nKHCP1TOYkWZMLglmGKf6AqLw8pkeiO8VkVESr8qogPUyver1D0V3VhBlzR?=
 =?us-ascii?Q?nRhjWdX+WvXLJltSnBfw2CYZmhP1jEDb0b9/wquOs0CZW11CK1a43pK32n1w?=
 =?us-ascii?Q?EvTqDq5w15lGS024LnS2wCBsbkmp9ozjusXnf1TAzReB3v/bmHD4gedOBapY?=
 =?us-ascii?Q?9L1WkCZ1z2XIYRTe3J/dCqBuVIn9CbRdKy1Kpqx+Wb2uayqU6McNg51PE3kU?=
 =?us-ascii?Q?+DpW2Lb8mcP8O+MRbqWptcGAhzJ90z/IJR5QP6KG9oEOWRBACxudUoe01Mhj?=
 =?us-ascii?Q?jk/iTVTMNo4nFS0GIyin+idR?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4587ecb1-0101-4baa-e4b6-08d929cbdead
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 15:49:44.2722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGbFhTe2OfeEPyIE7IWdoU2C8vDI6hputkd750HgfqvCSoHFx8/I8J4qTvhm9r0sfSPmBhZA7rlv1SLpPnSreQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB5673
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This pin has configurable polarity, defaulting to active-low. Add a
prioperty to allow setting it to active-high. This may be necessary if the
pin is driven high and there is no GPIO allocated for it.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 drivers/clk/clk-versaclock5.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 344cd6c61188..4e2461cb3950 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -914,6 +914,10 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return PTR_ERR(vc5->regmap);
 	}
 
+	if (of_property_read_bool(client->dev.of_node, "idt,sd-active-high"))
+		regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN,
+				   VC5_PRIM_SRC_SHDN_SP, VC5_PRIM_SRC_SHDN_SP);
+
 	/* Register clock input mux */
 	memset(&init, 0, sizeof(init));
 
-- 
2.25.1

