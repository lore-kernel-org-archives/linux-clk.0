Return-Path: <SRS0=PuqA=TY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ACCC072B5
	for <linux-clk@archiver.kernel.org>; Fri, 24 May 2019 08:25:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A93382175B
	for <linux-clk@archiver.kernel.org>; Fri, 24 May 2019 08:25:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="AEMZwWDb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389340AbfEXIZa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 May 2019 04:25:30 -0400
Received: from mail-eopbgr30051.outbound.protection.outlook.com ([40.107.3.51]:54338
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389046AbfEXIZ3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 24 May 2019 04:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qO04GVUiYW8ZRvxE4PN6PeP3iZM71PYkLJ6x72Ypsx4=;
 b=AEMZwWDbTK0Ag7by++zMUYTCf/OgMJ9v5Uz3x0sIdZlR51fT6CS0RN0ou0JvvzmJhAA5C+/PwnO7yXmSB2s6DkAABXLC/ABOdDHgPDbgusmqjRZx9UNyPxbsWio02C6Cm+C56o28aM5GLfK+24/+onMQS/3Vm7DvsC6BZZtagfM=
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com (20.179.252.215) by
 AM0PR04MB4516.eurprd04.prod.outlook.com (52.135.147.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 24 May 2019 08:25:25 +0000
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::19be:75a:9fe:7cec]) by AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::19be:75a:9fe:7cec%7]) with mapi id 15.20.1922.016; Fri, 24 May 2019
 08:25:25 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] clk: Add clk_parent entry in debugfs
Thread-Topic: [PATCH] clk: Add clk_parent entry in debugfs
Thread-Index: AQHVEgo8VzXmpj/WDkGGgiXI1N3a1Q==
Date:   Fri, 24 May 2019 08:25:25 +0000
Message-ID: <057720844e78e615e46de34a73b16ffaf7dbfc10.1558686047.git.leonard.crestez@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.37.124.34]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: LO2P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::29) To AM0PR04MB6434.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb47d393-aa12-4f5d-302b-08d6e0215f3e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4516;
x-ms-traffictypediagnostic: AM0PR04MB4516:
x-microsoft-antispam-prvs: <AM0PR04MB45167920C851BCACD4E67AE0EE020@AM0PR04MB4516.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:525;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(366004)(39860400002)(346002)(189003)(199004)(2906002)(316002)(305945005)(6116002)(3846002)(7736002)(53936002)(50226002)(478600001)(66946007)(64756008)(8936002)(5660300002)(66446008)(66556008)(14454004)(6916009)(66476007)(73956011)(36756003)(8676002)(81166006)(118296001)(25786009)(81156014)(4326008)(68736007)(99286004)(86362001)(6506007)(386003)(6512007)(52116002)(44832011)(66066001)(186003)(54906003)(6436002)(256004)(6486002)(71190400001)(71200400001)(102836004)(476003)(2616005)(26005)(486006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4516;H:AM0PR04MB6434.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZGAI3oO0gTsUsSmogd5K2jAxAt/bg2rwLTLeoOizhIpaB9iU4xcuh9+opXJqzdWVnsv1v6WMGqvFpqYyumkmwPZmXvncjOISvdLFD3WJpemn5qSH/WqIGXep1g+l4hRvRuHduH2pjgl28SwTs14tKHj/JaNgkBF9rpS4eD3TzF91wY0JOFkPMCHlh3kbXzi9HRGtExgjdUSjYfV10SBt62GcNuifn0sM04Rx4viRuQ5PUTBmu+BdMbh2HW1VOZjj7srETP7cWuDVdX1vkUDYafnORKxJ4Bc3Jk4+E0YCJ4IVDEdxdJY4WKGo9cG2NKMsVtf2AgEYxYz9W3zF2aqZUSGddg/VgS3flxaBZ/0KT2NGrLC1QvKaEJgLAdWhSmku237bIduvGi+02hs/huvfTkkr4tsdzQ0BEL+ILGcn4hA=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D3AFC28DAB4ECC4E90C4BAA7DED00158@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb47d393-aa12-4f5d-302b-08d6e0215f3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 08:25:25.8456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4516
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This allows to easily determine the parent in shell scripts without
parsing more complex files.

Add the clk_parent file unconditionally because this information is
useful for more than just muxes.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/clk.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index aa51756fd4d6..94a93b07dd37 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3009,10 +3009,21 @@ static int possible_parents_show(struct seq_file *s=
, void *data)
=20
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(possible_parents);
=20
+static int current_parent_show(struct seq_file *s, void *data)
+{
+	struct clk_core *core =3D s->private;
+
+	if (core->parent)
+		seq_printf(s, "%s\n", core->parent->name);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(current_parent);
+
 static int clk_duty_cycle_show(struct seq_file *s, void *data)
 {
 	struct clk_core *core =3D s->private;
 	struct clk_duty *duty =3D &core->duty;
=20
@@ -3040,10 +3051,11 @@ static void clk_debug_create_one(struct clk_core *c=
ore, struct dentry *pdentry)
 	debugfs_create_u32("clk_enable_count", 0444, root, &core->enable_count);
 	debugfs_create_u32("clk_protect_count", 0444, root, &core->protect_count)=
;
 	debugfs_create_u32("clk_notifier_count", 0444, root, &core->notifier_coun=
t);
 	debugfs_create_file("clk_duty_cycle", 0444, root, core,
 			    &clk_duty_cycle_fops);
+	debugfs_create_file("clk_parent", 0444, root, core, &current_parent_fops)=
;
=20
 	if (core->num_parents > 1)
 		debugfs_create_file("clk_possible_parents", 0444, root, core,
 				    &possible_parents_fops);
=20
--=20
2.17.1

