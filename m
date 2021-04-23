Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA069C433B4
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 03:34:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9262361452
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 03:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237143AbhDWDfa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Apr 2021 23:35:30 -0400
Received: from mail-eopbgr140075.outbound.protection.outlook.com ([40.107.14.75]:46965
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231552AbhDWDfa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Apr 2021 23:35:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvLOIHkWAwYN6l3s4FiF52NIqF28UiAed4i/akTzEQNt+2DQS6rlWgqao7BXtkB4icoY/3H3NVjy5eR0dISQkaeoLj9c9XFqyGh3kyb6TnwYWY0r1mSF+w1IEuw2W9g1zEAN5epM6hwtZnU5kj7hr3sANcTF7LYYSzE9jgNyLV94rd1TsSp0py+jNDv1elpPPjBg+sbYifdRV01nXr6Z63eiKQP6Xc3mutsd5G8zafcUzygjeyK2rDCZwqVLXiqqRwf69OZWAv3j2MeLzuWwOBfvSR4ewvlrF3x/89ury2msP1hYWJ1Z99shyLmUMeLorXkyzreotV18qXZUylInCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5EEABu03Y+JfIQRMhC6WcLAGpbqLoMVpvzZKT/xP2E=;
 b=ebRRF0hujWtVIpN9kqQdHUbYN4V+bkP/XOX1joOwO/npL91eqGZ8l3A014cnfGWFe/n4f4F5dgrQ9G1mams5bvdCiS6pyncjgGgFL1H4HXvXdj2FR9U3I1pVHW2zBlS/JNInEaeYrzAytG3CYXuDUIDtQ6BF2xy/ilS2ZabzyvHlk/Is+/906jYDBm4y/eGPoz19qfFHIgxbilh+zcIvmoLpEOSiptdHutJieGQ1mUi0s4rMLk07xfUEPoEmMqttf2HIeF8HPPcYSCmsEKckh+c4G4g4doZXb1Kffqmdg7fIr5DVeOeNrYkYXt0M7FjyOYcwuxS9/JHBKwPh4rqalQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5EEABu03Y+JfIQRMhC6WcLAGpbqLoMVpvzZKT/xP2E=;
 b=Qy/SVHRWNDmOxANzW7tZ2uqNMoHdKJD4PfSm3YlD0yk4lYyW2flcCz5dwhjpMxBDQ1ukbr4CvsZjYMnYJZBgrEijxPuAA8giBRKfG222droj7kfIJ8DBMnjnDjEnn5cPS39RCoaJ5QP5zetLEC7azlQYvp+2ONDIsOaWiEEDQGk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5079.eurprd04.prod.outlook.com (2603:10a6:20b:4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 03:34:50 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 03:34:50 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com, abel.vesa@nxp.com, sboyd@kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 4/6] clk: imx: scu: add gpr clocks support
Date:   Fri, 23 Apr 2021 11:33:32 +0800
Message-Id: <20210423033334.3317992-4-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423033334.3317992-1-aisheng.dong@nxp.com>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::27) To AM6PR04MB4966.eurprd04.prod.outlook.com
 (2603:10a6:20b:2::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.10 via Frontend Transport; Fri, 23 Apr 2021 03:34:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 132cb94f-4485-498d-1e49-08d90608c006
X-MS-TrafficTypeDiagnostic: AM6PR04MB5079:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB50796269EE687FBE6476854180459@AM6PR04MB5079.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aoGCgpMNbk03ch9nkFqR+EbUJXdunmabxXVB4oX4n61PbAqYMzPlC3ff/USjgehebukfMrwY6q7GNwzAu/3JYYOo9Hp/C7TePNF35iz6KUEasPid+UweXWKpoob8urCckL6lu+o4S4jxNcafxoO87R79ykeSWTw1/eAc1W/JSgrRnkZoMEMfsRHbWdGHATr986ucMdKKCG2jt4/YZ7pibbjSh0cwJYQCdnAoIL7jeJ2QWrA7lAIqWymW/f9ITTYjc6lGvDNowfQZRXzPu4cfCm/ntyiolS3JR38+iCOG3wbzTh1t/q+LWBcL6mYDy3dkRKKepYChZ/E5oJl/ZVasJUbr9Hu8pG0mECa0tf0GHKNdJ0yXBhtVNIYC4kH1CMa0mkoGr8cvn+nSYGxmYZ8QRjpyUUd1l0MLB1+18Er+3fqxkDJvYtebsH0FFJpuUCGU/EgMVO3mieGU3khjDleo3U3XqBgMvkyKJdLocbR9qNI2fURsgdb+J8ug16UrhBA9b/8kG82ltFkCkorXwb2jFoWIAGvb/7VPQdBKorsP2k/KLRboPSaXaEgDpWxZx3TFB3Av2AShVxtwhY/QZpvfxTJ7DX4IikvrnCPMtUfSM8d78MPPKNplsqlme3J7sA8t87olILKAyjA255DMb1qA74NB4UJBxwlFx9WcHM06tRc71ALjGBbJVb21ZJGSc2AD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(16526019)(2906002)(8936002)(6512007)(316002)(38350700002)(8676002)(52116002)(38100700002)(4326008)(66556008)(26005)(86362001)(66946007)(478600001)(36756003)(1076003)(2616005)(956004)(6666004)(5660300002)(6486002)(6506007)(186003)(66476007)(83380400001)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yoJeUXQmH+MsHCPOoMO4VjqiICzUwRLrGxWwY0iB7iZ740LAsjZ6HjkYp012?=
 =?us-ascii?Q?/Zx8OiVllO0P2BKhfiKn4WPt+9u+V4MQUUo9+S/sikkGhrrtiOXnViqt4zAi?=
 =?us-ascii?Q?LhlHgek2UD9HyeiNhpUhDKyJlz70UWJW8bMLTLrDCng57TgCABw/w0avbAL2?=
 =?us-ascii?Q?2Uhln485cQNA8a7DECySz49yy1XsXBJiAx/9Bl/0sEeW1zR4GwOw7X0J/fU+?=
 =?us-ascii?Q?9VG6SK5iLR0/XE/CDt7TsNdzRukRvE8IatY9dUUki2uqqQ2uLSzY+4AWqWWu?=
 =?us-ascii?Q?VJAHhuQ5k6Xva4qvzYHrB9hXb6DrXjXmX22DTtSSXuEUo73hsKzUCTTwr8J1?=
 =?us-ascii?Q?MuTAZT48Ajr0JfVs5YRPYlHGpDoxrRJaCBJZ6UjTRjUjWa8d663BowX0Z2Wo?=
 =?us-ascii?Q?xCWQgLWUg4giFa2r1rpt6xPa61tsjpWYd1VjcwrGZgqNnw3hci1l3/EKUbPy?=
 =?us-ascii?Q?UKp7LXuifud44MIhFu/C41v2MKjyvKghnV7pJyzQX2u8eXdrh46mTK//kYDn?=
 =?us-ascii?Q?Ucv/4Yq2FT+Fr1IquR2gdNqPeCda7KlnOkEuj3s8jfuptmi2PkLxHFHQoLVr?=
 =?us-ascii?Q?0Y6/PGlZjCSsOQHK4ABitntn1cDW/MGxV6H9tNjL9iHHrCIYSTGA2nHlPP17?=
 =?us-ascii?Q?RG95XFlKKMc5G+9px9naKNJ/U0NVOTdUsg/cAwVuNw/8cUAauRHSwqu11XMM?=
 =?us-ascii?Q?fXC+P37SxLggWk0eqv3HVVRfxNot11gaTapGZ9QiASqxhqbpjgpww6jvdiJ/?=
 =?us-ascii?Q?/+tQ+3Q1+giRvYGhh4GP8cfUJwBaHowuign50B4gy6S0XeAe1PP06UpImubK?=
 =?us-ascii?Q?tOcfX0hygwL5y66s0SucZ78uBqdwp/0RA77rhJ2Cwj7j+7yPZF+juHv2Lwtc?=
 =?us-ascii?Q?xWTYurmp0WHNcEBXKvorxcv04rZrr/LUCOmR2ki9jwHudBBIaCidp9Oplp/+?=
 =?us-ascii?Q?QZJMiqd/Byxlmp3whmWE09/7t9QRSpGTVX/0F7YaNujfH2SnKRHmIbxyeq2j?=
 =?us-ascii?Q?azVbBt13xX3zt/oFjTJA280AXe3lx06c+iBNA2dFmntqtLQNJ+uLZyhN0VpL?=
 =?us-ascii?Q?REloNlWj/8ZTDpstyWgIRYih/BwDv/mKjjBkxyFi9R2gbdE+W8OaBTYvpdJx?=
 =?us-ascii?Q?dWwdeZI4fg+rrt2jmhbBLOtnFc4Wm6hzD8YwJ83p693dAk2uPD1huwb+dNnT?=
 =?us-ascii?Q?sormMSbo7PT+s73uQU5bbzgWEMegasyxEEzbSQ1zFYZtZXTr8ApcCyS/1i/d?=
 =?us-ascii?Q?Qo/3zTxBwBLs4mIJJH9/hiDRGB5WD5Gm2ZmSv/OaOUsOB4QB7i/9dp1oKCsY?=
 =?us-ascii?Q?SJ9j0eKV4aVDobMqlPXD+0lI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132cb94f-4485-498d-1e49-08d90608c006
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 03:34:50.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hcmsM0+tvU3fCu1AouQpMFUl2yksGsAijjycftnh4oQjdffKyBNWmgEBHlY0DUV7U5z8vBx04Hl7Lw4jeCFxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5079
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SCU clock protocol supports a few clocks based on GPR controller
registers including mux/divider/gate.
And a general clock register API to support them all.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-scu.c | 186 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk-scu.h |  29 ++++++
 2 files changed, 215 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 1f5518b7ab39..cff0e1bd7030 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -52,6 +52,22 @@ struct clk_scu {
 	u32 rate;
 };
 
+/*
+ * struct clk_gpr_scu - Description of one SCU GPR clock
+ * @hw: the common clk_hw
+ * @rsrc_id: resource ID of this SCU clock
+ * @gpr_id: GPR ID index to control the divider
+ */
+struct clk_gpr_scu {
+	struct clk_hw hw;
+	u16 rsrc_id;
+	u8 gpr_id;
+	u8 flags;
+	bool gate_invert;
+};
+
+#define to_clk_gpr_scu(_hw) container_of(_hw, struct clk_gpr_scu, hw)
+
 /*
  * struct imx_sc_msg_req_set_clock_rate - clock set rate protocol
  * @hdr: SCU protocol header
@@ -604,3 +620,173 @@ void imx_clk_scu_unregister(void)
 		}
 	}
 }
+
+static unsigned long clk_gpr_div_scu_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
+	unsigned long rate = 0;
+	u32 val;
+	int err;
+
+	err = imx_sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
+				      clk->gpr_id, &val);
+
+	rate  = val ? parent_rate / 2 : parent_rate;
+
+	return err ? 0 : rate;
+}
+
+static long clk_gpr_div_scu_round_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long *prate)
+{
+	if (rate < *prate)
+		rate = *prate / 2;
+	else
+		rate = *prate;
+
+	return rate;
+}
+
+static int clk_gpr_div_scu_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
+	uint32_t val;
+	int err;
+
+	val = (rate < parent_rate) ? 1 : 0;
+	err = imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
+				      clk->gpr_id, val);
+
+	return err ? -EINVAL : 0;
+}
+
+static const struct clk_ops clk_gpr_div_scu_ops = {
+	.recalc_rate = clk_gpr_div_scu_recalc_rate,
+	.round_rate = clk_gpr_div_scu_round_rate,
+	.set_rate = clk_gpr_div_scu_set_rate,
+};
+
+static u8 clk_gpr_mux_scu_get_parent(struct clk_hw *hw)
+{
+	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
+	u32 val = 0;
+
+	imx_sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
+				clk->gpr_id, &val);
+
+	return (u8)val;
+}
+
+static int clk_gpr_mux_scu_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
+
+	return imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
+				       clk->gpr_id, index);
+}
+
+static const struct clk_ops clk_gpr_mux_scu_ops = {
+	.get_parent = clk_gpr_mux_scu_get_parent,
+	.set_parent = clk_gpr_mux_scu_set_parent,
+};
+
+static int clk_gpr_gate_scu_prepare(struct clk_hw *hw)
+{
+	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
+
+	return imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
+				       clk->gpr_id, !clk->gate_invert);
+}
+
+static void clk_gpr_gate_scu_unprepare(struct clk_hw *hw)
+{
+	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
+	int ret;
+
+	ret = imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
+				      clk->gpr_id, clk->gate_invert);
+	if (ret)
+		pr_err("%s: clk unprepare failed %d\n", clk_hw_get_name(hw),
+		       ret);
+}
+
+static int clk_gpr_gate_scu_is_prepared(struct clk_hw *hw)
+{
+	struct clk_gpr_scu *clk = to_clk_gpr_scu(hw);
+	int ret;
+	u32 val;
+
+	ret = imx_sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
+				      clk->gpr_id, &val);
+	if (ret)
+		return ret;
+
+	return clk->gate_invert ? !val : val;
+}
+
+static const struct clk_ops clk_gpr_gate_scu_ops = {
+	.prepare = clk_gpr_gate_scu_prepare,
+	.unprepare = clk_gpr_gate_scu_unprepare,
+	.is_prepared = clk_gpr_gate_scu_is_prepared,
+};
+
+struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_name,
+				 int num_parents, u32 rsrc_id, u8 gpr_id, u8 flags,
+				 bool invert)
+{
+	struct imx_scu_clk_node *clk_node;
+	struct clk_gpr_scu *clk;
+	struct clk_hw *hw;
+	struct clk_init_data init;
+	int ret;
+
+	if (rsrc_id >= IMX_SC_R_LAST || gpr_id >= IMX_SC_C_LAST)
+		return ERR_PTR(-EINVAL);
+
+	clk_node = kzalloc(sizeof(*clk_node), GFP_KERNEL);
+	if (!clk_node)
+		return ERR_PTR(-ENOMEM);
+
+	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
+	if (!clk) {
+		kfree(clk_node);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	clk->rsrc_id = rsrc_id;
+	clk->gpr_id = gpr_id;
+	clk->flags = flags;
+	clk->gate_invert = invert;
+
+	if (flags & IMX_SCU_GPR_CLK_GATE)
+		init.ops = &clk_gpr_gate_scu_ops;
+
+	if (flags & IMX_SCU_GPR_CLK_DIV)
+		init.ops = &clk_gpr_div_scu_ops;
+
+	if (flags & IMX_SCU_GPR_CLK_MUX)
+		init.ops = &clk_gpr_mux_scu_ops;
+
+	init.flags = 0;
+	init.name = name;
+	init.parent_names = parent_name;
+	init.num_parents = num_parents;
+
+	clk->hw.init = &init;
+
+	hw = &clk->hw;
+	ret = clk_hw_register(NULL, hw);
+	if (ret) {
+		kfree(clk);
+		kfree(clk_node);
+		hw = ERR_PTR(ret);
+	} else {
+		clk_node->hw = hw;
+		clk_node->clk_type = gpr_id;
+		list_add_tail(&clk_node->node, &imx_scu_clks[rsrc_id]);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index a6c6d3103e94..8ebee0cb0fe6 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -10,6 +10,10 @@
 #include <linux/firmware/imx/sci.h>
 #include <linux/of.h>
 
+#define IMX_SCU_GPR_CLK_GATE	BIT(0)
+#define IMX_SCU_GPR_CLK_DIV	BIT(1)
+#define IMX_SCU_GPR_CLK_MUX	BIT(2)
+
 extern struct list_head imx_scu_clks[];
 extern const struct dev_pm_ops imx_clk_lpcg_scu_pm_ops;
 
@@ -31,6 +35,10 @@ struct clk_hw *__imx_clk_lpcg_scu(struct device *dev, const char *name,
 				  void __iomem *reg, u8 bit_idx, bool hw_gate);
 void imx_clk_lpcg_scu_unregister(struct clk_hw *hw);
 
+struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_name,
+				 int num_parents, u32 rsrc_id, u8 gpr_id, u8 flags,
+				 bool invert);
+
 static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
 					 u8 clk_type)
 {
@@ -58,4 +66,25 @@ static inline struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *pare
 	return __imx_clk_lpcg_scu(NULL, name, parent_name, flags, reg,
 				  bit_idx, hw_gate);
 }
+
+static inline struct clk_hw *imx_clk_gate_gpr_scu(const char *name, const char *parent_name,
+						  u32 rsrc_id, u8 gpr_id, bool invert)
+{
+	return __imx_clk_gpr_scu(name, &parent_name, 1, rsrc_id, gpr_id,
+				 IMX_SCU_GPR_CLK_GATE, invert);
+}
+
+static inline struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *parent_name,
+						     u32 rsrc_id, u8 gpr_id)
+{
+	return __imx_clk_gpr_scu(name, &parent_name, 1, rsrc_id, gpr_id,
+				 IMX_SCU_GPR_CLK_DIV, 0);
+}
+
+static inline struct clk_hw *imx_clk_mux_gpr_scu(const char *name, const char * const *parent_names,
+						 int num_parents, u32 rsrc_id, u8 gpr_id)
+{
+	return __imx_clk_gpr_scu(name, parent_names, num_parents, rsrc_id,
+				 gpr_id, IMX_SCU_GPR_CLK_MUX, 0);
+}
 #endif
-- 
2.25.1

