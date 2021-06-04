Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5221BC4708F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39D5561417
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhFDJNH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:13:07 -0400
Received: from mail-eopbgr140057.outbound.protection.outlook.com ([40.107.14.57]:36686
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229958AbhFDJNH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Jun 2021 05:13:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqALWv1GBJ6F4n3vklIR6qa92RnKKYf5SF+d97VEJ9LTicf3KcqLl8IGoRYwaJIwGblyUltwuwjJ5rQjziReMMg0aYSgTA9EqpqkJv6oMPe79uHpAa//U2ygR11cPubXS/YLYnWM594VX3j8Hlsem8oO7URerU2Y5CgQTEzeqqxaFhu0J0LKgzDOumLxNlLHz/OZ9dJvSaofcNpkUVTXciY7W9oAYTzhlJGfomLbmkRdjbnFiUUvRQBw3sZG2iIW4FsKYGXtMKOV9YLDQYLQKLxC772vFIp39eWuLvixMsTeA0vmv5IZdHmMg4vyqX98u1Qyx3myFNij3qYdqP8v+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cB4lZH7zi3HA8Mzoqsdjutlmv6DuIj7MRGsmwnejic=;
 b=kQSXXb8Pel685kM8HWpQ76DtwzdZR4Do06QiXTKvG3Zv0FXTN+XdVBmQIDhUzX/b74uMxObFMFGrtM4DtFkG0m0UGWuWXSWe+uQaqkmOjpZbftDnViwmkD8TBxnnp6TVY4N0ydnA7GuzomRE2M4ArFtIsC/pyWe/7lknOpq2jraV5fZ2LBN3k89/DnGygyUR90LuMSNWqB8q/YCBO8x/yedhzv/KMpmt5UtLqUUoguFu0SXVHtPZojHvwCU9AR+w5muHlU7yw1Q5MLM0IOZLtPIp7NDUIVWk2zZKECqvpnGW17JYtCjFNzS6ScEHgoiyoOkOexg510aOTcCytq0ehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cB4lZH7zi3HA8Mzoqsdjutlmv6DuIj7MRGsmwnejic=;
 b=rWRgraZqEpYrj6/4cRVFG1s6hkSJHe7pfR7bFH+zuSLgJPENkxZQkl3ubJXFoyFBc+Ez1PUDiLsoP+gvrf6Gbq1Hb2uahscwc/Gp5+RKzbvVNOhWwhWWcnwumLVr6zQrwkq5Jp6UjoEG0mBh8ls9p4gHuWFFns5w6kNAHCR2gc0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8502.eurprd04.prod.outlook.com (2603:10a6:10:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 09:11:20 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 09:11:20 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        dongas86@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de,
        abel.vesa@nxp.com, Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 09/10] clk: imx: scu: add parent save and restore
Date:   Fri,  4 Jun 2021 17:09:42 +0800
Message-Id: <20210604090943.3519350-10-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604090943.3519350-1-aisheng.dong@nxp.com>
References: <20210604090943.3519350-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20)
 To DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24 via Frontend Transport; Fri, 4 Jun 2021 09:11:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c248462-912a-49ba-b174-08d92738b75c
X-MS-TrafficTypeDiagnostic: DU2PR04MB8502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8502D5F533995AFF0E10022B803B9@DU2PR04MB8502.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:52;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U4+CgQCTMRTzKTsvUgAyfzMt+HgAhs/5jl8ZfZx/KICNQQwfPm3KjCYNUrczhaxBEKy7eW/m9wjEj5CGT9yWjGcFYvhIFi3tnt242+drLl6OqzJxS4eitka9gubsin2ogXvtRjMlJP9HcGZToGhvcP3qQ8yMTgqHoYGFLe3QXmNRSYincGHOs0JRxKmrUY8epfLrwCGZJ+OOFvzKDJfyVQGpsuuQUPGdIGc4s5SlsJEsH1Ew6ep0/VddUCCETdyjtPwdrsH3+PimjD0j6MJGjIsGMNEeyJDT/jafiJeOsgcQLSsV7r+w3xy1Nm6n/BVWVNnYrIvPLF4lGkEwVsnZed4xIfI+ZeApKxFVUnJGYS9Uv1ug7qdgLMglG3kAhAlYpPkOPMF7amVlIKHJGmmtzBA1l+2oOC7TdgNILbZIEW9cIc9kmi1ZnmKBZ9XZp65UYGjSUqTtTOSlouObcVjkDjVK4+JmIqvxof5DmwPNJXVysvU6NrdB2RMRqGs74WJDAqCBa04YLUFU5uSb3q6PA5wUksrYdfvMJ7Zy2nKx6mgjUHpCPi0RfnQnCQrblTBd6ZaxxcB47Pi6YA8qOU4O8ttLqATxG0V+5zvn9Rq1f1DpbDROM4TCEag4JPtwKJ3W4gefIkbsJkLQSXmHSKYMERB7d177gELGfS4SnjnJcSwtSY5iHjyzcxFV23kMOtY+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(52116002)(6916009)(6506007)(478600001)(83380400001)(4326008)(38350700002)(1076003)(5660300002)(6666004)(38100700002)(2906002)(36756003)(16526019)(186003)(26005)(316002)(66556008)(66946007)(66476007)(2616005)(956004)(8676002)(86362001)(6512007)(6486002)(8936002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9iYrVhAZnOHtLr3b3Qws/EcuKT5tU2lRVHpDTSrXR5gBYjDDUB6eCxjiFhQL?=
 =?us-ascii?Q?cQNJiEFmyZ7CZqtVvqjUXskQVC3rGsOmwijqCDowFDZOjQ+KLqsTooWy2VMY?=
 =?us-ascii?Q?4Pdv6ikp+zLYt1V863ZFqldBkSbZSYg/ag2Nnpp8Ntk8VeleuMDk2lg3iWsr?=
 =?us-ascii?Q?IZs3mlggjU/QhYMC0dOBMVKNIfUfekMnUuP+6VWWsOpPptVSNY+utnCBv4Vk?=
 =?us-ascii?Q?G0Bltw+aDpbr/+vvoe8GXMOPcyTo2VGLoEcKEoXaDEj5UpG1E6NDvRm/8sEE?=
 =?us-ascii?Q?1rvYnbGt15Ej8lEKOdDR0aq+juTHQnGLCXTzAgCGtKBTcSZTgldF4KZIZbby?=
 =?us-ascii?Q?TbCQEblzfffLdLu8UiMGhJW4NHAw90fzRZ872IdEO9lRjd1BV66zMH8Pwv/z?=
 =?us-ascii?Q?mj2frcpZmWbGQNueS/4u+FtGOr3P5zYONZljP2ABROv7JTtxwbiYH55m/rqU?=
 =?us-ascii?Q?5IQVBL8iN59mCqz13bI8dKNAUOy9N/yDY7knfNMsn7vQHrE5eY1GAqqAZTxj?=
 =?us-ascii?Q?Dnkal2Hd0sedCM7GrC4nI1W/wz/xDECH7rkwabcBF3RyEv0rw9P4WSgj8ReO?=
 =?us-ascii?Q?fbgCH/6GJ0RyGqMg2v9D0hpxrLWMDgPJ+JLQvbgbmnDP8u4KtNL/DL933wtg?=
 =?us-ascii?Q?emMtLO9JA66u6FIY/eQ4cswcBebju3mxN/NpTDUyJd9D9/i5ktxhZncWa31I?=
 =?us-ascii?Q?7+YtYfbY0TuT815SsN5m7Y91ICmYguSdMzgqMLCHzBw3JxF8YZfaDas+32Gp?=
 =?us-ascii?Q?BxXxRTaqi155vnkYwnou3UiF+4JZp2p+I3s6B85S2mw0hUc68nlv7+i6ntz0?=
 =?us-ascii?Q?N5TLs5da6YqZvxfjUCxyyzHj2vvV4T32SNHtUOxgqFkeuB51+q2e9Xf90mAY?=
 =?us-ascii?Q?GFULRBzCRmSyV++ZOs0ENuGAhfBjA7FsEi7XcAqIzMzoWBZ1WuFqPIsSltZU?=
 =?us-ascii?Q?i8gB3JBjo0mPk6HpnhyJcacuWmdoKHpUyCAa4lOicxk+SWxUtlFExKLYnhi1?=
 =?us-ascii?Q?BgmCaa6Cgh8XNrv/qGdTx9pqA/ixWtHGS9JBT9qYrbfRMawtAT8H7hY6LNBK?=
 =?us-ascii?Q?kuIUK2dUQbfX6/FbyO91EuGwmHv8SyUgpH6lwI/r6KihHzB53e9Mm37X0S4B?=
 =?us-ascii?Q?8nPG66gYj4irOL/8XLFyRPE7x9M7wAWEB3BTRGeXnGYGW/tUqUZWq1t7oU2d?=
 =?us-ascii?Q?XTJaq4EBaZZoFY1+YYc6mC8MF6B09LXx4RI1rqf1M+uY4/VjqUEDU4DHWcV+?=
 =?us-ascii?Q?RxbRUjN6HGUZ8JpJURB+0RiAnsIoaGvkwSwHU85DeG9i9cqLYDkEXCJeHKsn?=
 =?us-ascii?Q?VQ3TCQW477lVVdiDMaBj+sRz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c248462-912a-49ba-b174-08d92738b75c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 09:11:19.9365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93iTVriAcg8VyQjpjCn0DOqFSN8y0aij8sZ+oVF0GOqy1hPcC66bmzlBWB7EAROnBX2x5+jIGgzT/XD+d4IgCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8502
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clock parent save and restore.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-scu.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 37919ffc46a2..597cd2754370 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -50,6 +50,8 @@ struct clk_scu {
 	u8 clk_type;
 
 	/* for state save&restore */
+	struct clk_hw *parent;
+	u8 parent_index;
 	bool is_enabled;
 	u32 rate;
 };
@@ -337,6 +339,8 @@ static u8 clk_scu_get_parent(struct clk_hw *hw)
 		return 0;
 	}
 
+	clk->parent_index = msg.data.resp.parent;
+
 	return msg.data.resp.parent;
 }
 
@@ -345,6 +349,7 @@ static int clk_scu_set_parent(struct clk_hw *hw, u8 index)
 	struct clk_scu *clk = to_clk_scu(hw);
 	struct imx_sc_msg_set_clock_parent msg;
 	struct imx_sc_rpc_msg *hdr = &msg.hdr;
+	int ret;
 
 	hdr->ver = IMX_SC_RPC_VERSION;
 	hdr->svc = IMX_SC_RPC_SVC_PM;
@@ -355,7 +360,16 @@ static int clk_scu_set_parent(struct clk_hw *hw, u8 index)
 	msg.clk = clk->clk_type;
 	msg.parent = index;
 
-	return imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	ret = imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret) {
+		pr_err("%s: failed to set clock parent %d\n",
+		       clk_hw_get_name(hw), ret);
+		return ret;
+	}
+
+	clk->parent_index = index;
+
+	return 0;
 }
 
 static int sc_pm_clock_enable(struct imx_sc_ipc *ipc, u16 resource,
@@ -547,6 +561,8 @@ static int __maybe_unused imx_clk_scu_suspend(struct device *dev)
 	    (rsrc_id == IMX_SC_R_A72))
 		return 0;
 
+	clk->parent = clk_hw_get_parent(&clk->hw);
+
 	/* DC SS needs to handle bypass clock using non-cached clock rate */
 	if (clk->rsrc_id == IMX_SC_R_DC_0_VIDEO0 ||
 		clk->rsrc_id == IMX_SC_R_DC_0_VIDEO1 ||
@@ -557,6 +573,10 @@ static int __maybe_unused imx_clk_scu_suspend(struct device *dev)
 		clk->rate = clk_hw_get_rate(&clk->hw);
 	clk->is_enabled = clk_hw_is_enabled(&clk->hw);
 
+	if (clk->parent)
+		dev_dbg(dev, "save parent %s idx %u\n", clk_hw_get_name(clk->parent),
+			clk->parent_index);
+
 	if (clk->rate)
 		dev_dbg(dev, "save rate %d\n", clk->rate);
 
@@ -576,6 +596,13 @@ static int __maybe_unused imx_clk_scu_resume(struct device *dev)
 	    (rsrc_id == IMX_SC_R_A72))
 		return 0;
 
+	if (clk->parent) {
+		ret = clk_scu_set_parent(&clk->hw, clk->parent_index);
+		dev_dbg(dev, "restore parent %s idx %u %s\n",
+			clk_hw_get_name(clk->parent),
+			clk->parent_index, !ret ? "success" : "failed");
+	}
+
 	if (clk->rate) {
 		ret = clk_scu_set_rate(&clk->hw, clk->rate, 0);
 		dev_dbg(dev, "restore rate %d %s\n", clk->rate,
-- 
2.25.1

