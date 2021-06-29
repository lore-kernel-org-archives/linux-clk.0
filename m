Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA66C11F68
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 15:48:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0624A61D74
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 15:48:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbhF2PvP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 11:51:15 -0400
Received: from mail-eopbgr00063.outbound.protection.outlook.com ([40.107.0.63]:37315
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233801AbhF2PvO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jun 2021 11:51:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHqse8xE0r2959d/KlOH3lDh01sKmq1KtKYO4c2WR2Cf5cwCJCP3JPuMKUXaDBeIrgl9UGh1BUTEbkwL1VMDSF9Eu1Id5+gXBpB9otHyYKb6zwgpUDbtgkWFzPn7ujKxiXStYgi6YaE3mpTQqghdSkETd8t+XahOqc7hmD9dZlizg1wBPeEbDuandvAscwBrt246zDmide42XgX8fmIoXdaPvg++4wySls41jmjrnnZqfCijY+B12ulHuPGfdspez185v1Q3SDT5V0KYuSztJHN+ed4uHLsltKbZvJp1BoJTd/XqtoZlQpSeX1RzxhVkL3rW+dBVfMlpKkTUc0ZErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NH0r3BLiaADEUOi5eBRnpxkkKPcLfm0gdqU6FjnpMNw=;
 b=K7ldHOqqBXJr3lp7DC+Q94hWa422bYTVYJA0AoZ0I+Zgik47ABsCEpZhq4j3Zbbk49YQj95L2RlHD7LtMrPppaNeGGbf8/aCTc424LHF/boMeKF7scfhe29vXxgCmITSOdMlxTiCvikqSP2cyMg//EIKNvLQ5tKNvoFbWf1ZRlSiksFA90q0pDR5dlO8vbROJ0UJTtgcTsdo6XP8zic0GoqeNtYUbnpB44Fb1RotOsp/IcZ1fmKdOqns8XzcR7eZdaVoHaW33AAz0OTu7/yEQ6n9miz6ici90E7GjKVH/N2CEfkh3+pYrZxkrJ2nmoo4adYpaLnOsWCOFqJvEeOyDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NH0r3BLiaADEUOi5eBRnpxkkKPcLfm0gdqU6FjnpMNw=;
 b=l9L4tOLtoxazYg0S6MAvTYJL+JDJs+YzkEchFcRjtngdO3qRm/PN9w0Cx8iZmpVO8n2xfqffzBCoZUnUO6eYorolD5pH4VPX0fqGa3D2Ik1XH8xWiCj+slZirzputEcpvs6Vl3GVVJte8w8ZuVxiGeyDS2/ucHioMs8qgUw/PSk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB8PR03MB6028.eurprd03.prod.outlook.com (2603:10a6:10:ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 15:48:40 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 15:48:40 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v3 2/2] clk: vc5: Add properties for configuring SD/OE behavior
Date:   Tue, 29 Jun 2021 11:47:40 -0400
Message-Id: <20210629154740.3091884-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629154740.3091884-1-sean.anderson@seco.com>
References: <20210629154740.3091884-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BL1PR13CA0334.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::9) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by BL1PR13CA0334.namprd13.prod.outlook.com (2603:10b6:208:2c6::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.12 via Frontend Transport; Tue, 29 Jun 2021 15:48:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7903a22d-9a88-4a7a-9dd8-08d93b155dbc
X-MS-TrafficTypeDiagnostic: DB8PR03MB6028:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR03MB602826F1C9591478DDACBEB296029@DB8PR03MB6028.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIduAJV7Dk7/k/ki4PtAQRQfgs/3bKuNGyLxWdCCRZ7pMIYH9BkyvrspL0kumBchevz8UQ3dKHie3SEJMeenyNLHZbCpWDPZcaW5oCOyU58G9KPj5XxttKvg5mr691zovsSuyvHvXOO5Cbr+yuXbzptfqMjSn2mUzeYSrkcu0H219BiLVYXUfAJRmgD61OrnE41d0cLO9SkuriNdixKqJy2ZdGkgsK81yqsF5CaY6izYgfu20yFIdRKOlGLUqJHo0CWX3EKdmzQvVnDaLl9NbJEBuMNmlBk0Y5wNrcyILVNZ26H1ofE/C8ijJCiCPQi4XsK5z4MNatSqRY4dEwEZI25wWX4VlovkTnbydZ+X+4HNdoYj50v2z+e9PiDgBcScaJVfw/AdqdX1LUGk69r2PH5B1rd/sF0BxDq8GWZ/JTltSBixwk7xZqfKhcocrrMxNNNt1hPkjkVEq7ngwZfnKuI8dLMn0XkKpe0/5HvKh1Y31UOxFFTAzFnOrxNcMlKWF4yh+Hhvim8v+9m08+3GS6N5Ik42mgAjW/ONKzx1HjwHPJE5n7m7tUNU1ayl7SNbkwWNJTw0rRNRW920567DPor56xICIeMiYhrfBFBgnHpINEnqsHuigPBUkeHxijuULyAQZndePjsHCqMEOMNRIxE7PF85ZBWXfRW4ZKzyzwsqZSJR/WEStoIHkPKwPeEN8jsY0MxQI0+oPddyW5BA3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(346002)(396003)(136003)(366004)(376002)(86362001)(83380400001)(478600001)(16526019)(4326008)(26005)(2906002)(107886003)(52116002)(6666004)(186003)(38100700002)(38350700002)(6506007)(6916009)(956004)(44832011)(1076003)(36756003)(6512007)(54906003)(6486002)(2616005)(66556008)(66476007)(66946007)(8936002)(316002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5m1GgZCB/fmemhybKqEa8QDa95nvp8FDOMi2Z7gGzEf9Tgzk9IaWR65TZjA/?=
 =?us-ascii?Q?qouts0Aiy2k2krYfkzk9B+YHO4QJfy2BNn1c0E+QDaS5R/RtxDZDDb9lo7JL?=
 =?us-ascii?Q?tqeluTUGlyg1t7/WtV6hm2lu3BTYgQAWMoX0J7tleO9Rjqd1WcY8cipAybqI?=
 =?us-ascii?Q?FVTNrPu8oUtjZGe0Zkf8U6HYZAzTVtLXvlESULdPueirqCx0E29UuW9Rma4i?=
 =?us-ascii?Q?0SgGWQbQx4HGabsrgpn/OFb4QNPt3bW0DEEBEeNQtYC0ouZ07vg1E70/PSQM?=
 =?us-ascii?Q?rWU/8+dtT71U51cXAsCWdxywrN1mNbIy8+CPjrYbZzDlrm68cp6bfDwjVRV5?=
 =?us-ascii?Q?Oo6cLS9STurXCZGUWZCfGzrNpunU9/df8BvNk9tL/P7Pj4WmFwHB1Lw3xIXF?=
 =?us-ascii?Q?08kytdqnUIG1p+GQMo2ltCMkkehuud0dIcwHChIx6Kq/K6KundhYMSIzpIgb?=
 =?us-ascii?Q?QQMuWcTmxQfiJlZzDkXqnKUca0B5+OPtx9kShC4Bup0tqX2AIqZbTELIRio9?=
 =?us-ascii?Q?URPdcLMzhvN4/+Y+TCLl/2pt80F+H+8Galj3uLlokNN1OQy4XA7RvHfxbiir?=
 =?us-ascii?Q?z9EzG3hVU3fiPmgVrMttDWlkRPM27ybsZbSviX8Vj/d1XKPXbeIngDhbY6fP?=
 =?us-ascii?Q?I1G7LRPS0Hagh7/PbD7Lsr7o93xIul9HfRJje4WiBORQ3QlDN5vqs4TGcquj?=
 =?us-ascii?Q?sesrjrI/6QpqVL3W7+tVT58BxQUnY0iFIYjAn1sVOuG1e+hCpK1rytqciXTP?=
 =?us-ascii?Q?C/rwN7UPp5Y/Q13yfha+o33WeZ2t8QUOP/8moP31TFs9n9pvYxCJfYCcDkPV?=
 =?us-ascii?Q?ggkWaJvvpuhH1vsubD/ybZvbm/QvZR2jMXruCn0O6CmAezvf0GOuDMhofeKY?=
 =?us-ascii?Q?Iq3s9ID7nyx+HUaV/H5VGzRveNRflWvg7ePbUVbbgaCf8CBXttkWrfZSDvdF?=
 =?us-ascii?Q?kbxWXvSq2NLFD1uG4wEqeVa/ZtkfUaMYBA+hQpZ7NY///TjgzwoD5dpGheuZ?=
 =?us-ascii?Q?+RG2Sf3/oSTeOKERdQgh20NQSOc8tesa2A7398qOkDTgLaKvpdgYJMjUbdzv?=
 =?us-ascii?Q?nURypoUZ/Xfg7h/keos3sjRT3AMGa5LAGvmTxeOBh3bVkK9LijSaWGKoFZTr?=
 =?us-ascii?Q?8qyh1Qivg9i2ny188e08Ee4J+rqDj3biGkGhbQAWmNMeiLYGYXEQoJKm+eyS?=
 =?us-ascii?Q?75T0RZ1b2/f8AcHXTedey8LdW3uN9hRvZNXghYsJ/BrUUXprT6kTJRrGdBEl?=
 =?us-ascii?Q?5a2q1J5lgOv3T4fLeEnAmeHr0/wB4+NLxsUFpiX92yZGiAQk4Cla+eYviAH8?=
 =?us-ascii?Q?lvci9hHwinUgsvTe1PrdTcTn?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7903a22d-9a88-4a7a-9dd8-08d93b155dbc
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 15:48:40.4249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dW1scpa0G5OVs79vmCYE/INJmyAaJVaepOWG4q1xBY7oCe53wvxKxA0AlKgKQwzZXzZP4T3+AV7TbSSBmhixkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6028
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SD/OE pin may be configured to enable output when high or low, and
to shutdown the device when high. This behavior is controller by the SH
and SP bits of the Primary Source and Shutdown Register (and to a lesser
extent the OS and OE bits). By default, both bits are 0 (unless set by
OTP memory), but they may need to be configured differently, depending
on the external circuitry controlling the SD/OE pin.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v3:
- Default to not changing SH or SP unless there is a property affecting
  them.

Changes in v2:
- Set SH as well as SP

 drivers/clk/clk-versaclock5.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 344cd6c61188..b5f6f5708c77 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -886,10 +886,11 @@ static const struct of_device_id clk_vc5_of_match[];
 
 static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
+	bool oe_high, oe_low, sh_enable, sh_disable;
 	struct vc5_driver_data *vc5;
 	struct clk_init_data init;
 	const char *parent_names[2];
-	unsigned int n, idx = 0;
+	unsigned int sp_mask, sh_mask, sp_val, sh_val, n, idx = 0;
 	int ret;
 
 	vc5 = devm_kzalloc(&client->dev, sizeof(*vc5), GFP_KERNEL);
@@ -914,6 +915,26 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return PTR_ERR(vc5->regmap);
 	}
 
+	oe_high = of_property_read_bool(client->dev.of_node,
+					"idt,output-enable-active-high");
+	oe_low = of_property_read_bool(client->dev.of_node,
+					"idt,output-enable-active-low");
+	sh_enable = of_property_read_bool(client->dev.of_node,
+					  "idt,enable-shutdown");
+	sh_disable = of_property_read_bool(client->dev.of_node,
+					   "idt,disable-shutdown");
+	if ((oe_high && oe_low) || (sh_enable && sh_disable)) {
+		dev_err(&client->dev, "conflicting properties for SD/OE pin\n");
+		return -EINVAL;
+	}
+
+	sp_mask = (oe_high || oe_low) ? VC5_PRIM_SRC_SHDN_SP : 0;
+	sh_mask = (sh_enable || sh_disable) ? VC5_PRIM_SRC_SHDN_EN_GBL_SHDN : 0;
+	sp_val = oe_high ? VC5_PRIM_SRC_SHDN_SP : 0;
+	sh_val = sh_enable ? VC5_PRIM_SRC_SHDN_EN_GBL_SHDN : 0;
+	regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, sp_mask | sh_mask,
+			   sp_val | sh_val);
+
 	/* Register clock input mux */
 	memset(&init, 0, sizeof(init));
 
-- 
2.25.1

