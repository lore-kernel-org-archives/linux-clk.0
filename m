Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D05C4320E
	for <linux-clk@archiver.kernel.org>; Fri, 23 Jul 2021 23:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D178960F25
	for <linux-clk@archiver.kernel.org>; Fri, 23 Jul 2021 23:13:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbhGWWcw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jul 2021 18:32:52 -0400
Received: from mail-db8eur05on2083.outbound.protection.outlook.com ([40.107.20.83]:51072
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231954AbhGWWcv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Jul 2021 18:32:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2zMeaNrNkpVTDzwojOY7m5WRttfeLHaO/lzBI83iJT/PV2+oDZnk2FeA227wVArrhcGFmFTwIgX8NPyKPk4SrVXpl+59Rf1eVEY5VYtJdYCGRq7Ysts5/E5c23vo0LbUN4h8pMu//wyKUYyBywv7+bfUBGJVgUZWpd2Kg8Y19y87db09Hf8TA+qdo3DadwOPIAUL8VcLURCBYWzI6uCZjNL+BWg3/RHYzWdA3OAYBybjMGRqlhIVdtu2kTTTJgkgH4Z9ricUmqH3Tp5/6I9sLYcWYynhoRtTAw/GK8DK1wZeMClCIucfewEBiC5VJXZW3uuXbE+yaVY00wil035qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOgcilSTjHtyPlkjL8gxghwLC4k0fQWLE+30vwjPoWs=;
 b=kX7Gk7kTRkyI9hJVtJLO6eYfuAPl1FvSt55sLBm92dvYF1J2VGhuf6+sR9lG16TVdVpyFyvrj+Kr25YdCB7toSHELkQO96j+fv8TeztaP4z4MLFwd7cW9ndpTC3DInUHHkJ5Jnf0IES4HKZNpQ/Dn2+oxSrbHU51jHUamUtzGZH9/dC3jeMrkLSauvMEibufeEYKgPqY1gi6qgQ/uVbBKplm2YZ3dIv2C3jTuMuMbtUbFXQEAaSo1ezC6/xhMl1IbfaxplD6052Riotl59no8lbYO9OhGFpfA7iC70MQ2KpgDEgxTOR2w3+C0AQDgXuscImT2Q8IHX75oUhAaeeVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOgcilSTjHtyPlkjL8gxghwLC4k0fQWLE+30vwjPoWs=;
 b=RPlTUaS9XybU8NyHy4Zm3bd0+nwYDP8/HWSmViOKU4dQ3a8cmHsw1p6DfjYRk0wVxBIEJAeFDrEkUH0niJMQXahxmBEbSCB2xEYkWfY93fjQPTTXdxxp1pT4ygAcawo07QSTZoA8sSK2KxcO02+mZFs3eUULCKTkBdbYY5Z4yaw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DBBPR03MB5365.eurprd03.prod.outlook.com (2603:10a6:10:f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Fri, 23 Jul
 2021 23:13:21 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::dc6c:815b:2062:d1f1%7]) with mapi id 15.20.4352.025; Fri, 23 Jul 2021
 23:13:21 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Stephen Boyd <sboyd@kernel.org>, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v6 3/3] clk: vc5: Add properties for configuring SD/OE behavior
Date:   Fri, 23 Jul 2021 19:13:06 -0400
Message-Id: <20210723231306.674310-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723231306.674310-1-sean.anderson@seco.com>
References: <20210723231306.674310-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by BL0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:91::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend Transport; Fri, 23 Jul 2021 23:13:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66d16ad2-6cec-4475-56c3-08d94e2f76aa
X-MS-TrafficTypeDiagnostic: DBBPR03MB5365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR03MB5365E7077ACA8B65B69258E196E59@DBBPR03MB5365.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jnIRLt9yg2aljcNTvlCZO5GHAj+LxC7DJs0ZnAyI7Wjiht9bI6mWzXN94bDtBbKsVUo7ZD4qHhVp1i2dNwoyjkVz7inRiml0rVGD2ntImc0ZYF0vhtljxr+M7bi18RZcvs9fr5JYvlK95keJblPRKADiLlmEfmVxYyW5U9XbFE66fVcd5wLPRPGzlbqCDp6gu+VHmZYI2OTw6wOXDB02YTPt3tfTH+4gu5VdeCc4XlwGCAWA8fvY8w+e5Nn3xXXAq43c9Ciug3M/UlyyRagHpD/p9JRLxSIl84cGcf1mWB7Cnrf22BRhtQYKuvsFk9EgUEMCbzx1cLyrWD96DxoLdTmn0fjp0fJaH0PkdRSyYftgSijB7XhBjoLG6QzCVCfTCDiZ6OIxUJEUNL/qmFJCs3eYlh+jVI+DXJ5Cl34mvWh3/gBOXOkKycNlwTQvvdhdIk945vWvFCwKdnV2yv5djZD+agzfeEhQPhYb+VsGAtAXSaDYxLCT8DVOSBXJtqEnFgzGjPjzKBbpz0iSnLteHqO/8tO6Rhhys3DAfyEjD3THGxx+SvTZKyWfGbQHwSTDonOZre8WU6KqVOryLrh5JJjSoaevZ03TiEXmSuUrfEaU4whY/BcUTvBTNNDF6Kn8QPKWfZt26oFlKgKHzcXWZxJsEnn13WFsqAPPh3CH2D8uEQ2u2qjKGriCGCFWsEDPLjfwsuEi9lf9XSwwniqNbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(39840400004)(396003)(376002)(66556008)(66476007)(66946007)(107886003)(38100700002)(38350700002)(52116002)(36756003)(5660300002)(956004)(54906003)(6506007)(44832011)(26005)(6916009)(316002)(2616005)(4326008)(6486002)(478600001)(186003)(8936002)(8676002)(86362001)(6666004)(2906002)(6512007)(83380400001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zSrj+eMbnTcDPvlBF0c5rqOKaicEV0mnvL8tk1Sw9gRKnqCrlbJWGau7jnL/?=
 =?us-ascii?Q?exJiW8yFRCKAxqLVUM53Xd/FmtZDjkiPu14qHwwuJrgiwm9BzleyiPH+y8sQ?=
 =?us-ascii?Q?CQzOFUEqkVWiEFkJxhBtzN1wFy3mu4ljBngnrPj14+E+k95AKkOOPV7DB82Y?=
 =?us-ascii?Q?//+RRLLbiySPXNDHkVfTzwNPKnl5IFYMT0WKpRkMFBs0VN98wvxaPiTGQAPo?=
 =?us-ascii?Q?n4sQ+XKBX23mrj0WSxOv4+w4SuXhHHlexz2riXXc9Ft1tT+GjIojKExknnKr?=
 =?us-ascii?Q?0n54YSjK6Bg8Ml6644A3K0/3mx9nR8QsemSsBjNeXSwaJSZp0h7TFyuI2nU/?=
 =?us-ascii?Q?Qc+qYB0PwoggROBtkn9xubV65CODYScOtHl7ByYRaf7IytfZBvs9e2sjKBLB?=
 =?us-ascii?Q?rv0aM5zRR9CyN/rKQ6gCAvPaT7pmi2u9Spf/ZSgCw3VtZYt/2mksoO3vgoMq?=
 =?us-ascii?Q?gztTl2b7Fi+YXtF7RJ/esBP1Z8SoZKZOPSYBLJRkT7bxhKMnUCuuXd/J+HEC?=
 =?us-ascii?Q?DBzGzTVxHZy4/SE3NXwvtgwd0TyoUHq+6Ks/Nv75wTyBQpwo6ks7odFrErQX?=
 =?us-ascii?Q?lWIIUNiEu3TpN/ABvU2wwhRZizMYVnLrtMqivJsGNpwQKjEbav/0rB3E9cBZ?=
 =?us-ascii?Q?zt7OhFPXBsbRjYSdMXjwPeEUsVwOy/1tHpGYgLj307WwYHWGm38t6naTWXBz?=
 =?us-ascii?Q?oXpclgMggzO+do5zoDJuNx8NHDPDWfKPxvKwGlc0pFZsgHBCJC/eyN00TAYP?=
 =?us-ascii?Q?RaKUtUfJUEtmUg3Tr1wwyb7TPENPMTsqbLHMC7JY6ECDBDo51HWAFF3e0iue?=
 =?us-ascii?Q?gUhPJX0oa0qQYCrR+zwAu08MCRaDose6iEgO79EADAZ0bu1zgYbpkyTXd+Nh?=
 =?us-ascii?Q?NkcFxvC0ag21N9Q2gsCsLWDsVTKUgnBprg7KhJFbCBRwnCaypYkphU91PqW4?=
 =?us-ascii?Q?doyNZOD3DfEVjyMFtFmxWogrz9be3uTrOC6C6ueqWhs4MLz6bTMxODKk2lMk?=
 =?us-ascii?Q?0Bpi1c3F5Se4oqiIqXHG3qpVP0vfomMJB6BEgOV8WWJIIag2uh0f7o+QmWoP?=
 =?us-ascii?Q?M0+mOHDZegXKYsT4yHYQLYmHvOjtPveTdRuSUgqZhf3WSkOv9mcLcKdyOlP7?=
 =?us-ascii?Q?JrQLbhHpzzU83DD1blHUk1Pm4o1CUmfcXVD8jHSel+GE4dp7Sgw9pwSVPALI?=
 =?us-ascii?Q?0jGEJ1dWtFYGryRsQYUNHTdBcDQLKm4mR/GUoemtVmzQVrr6Pta8hNMbYFzQ?=
 =?us-ascii?Q?RO2fJ+3MjDQ8iQkQQjg8Bpc0EXJhc8PeBDAic+yAzfpbjcyPiVT07/hpHz2F?=
 =?us-ascii?Q?FlMfCZiFKv4Cgm1pSaENXVu6?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d16ad2-6cec-4475-56c3-08d94e2f76aa
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 23:13:21.2059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWgafiVv6twJh5BLi58T+ZCPchkWoAL0ayrYSjcbuIrJqP1+v/EELSkpclRymnbFIvyqt0JUw8qKT2NoIUhQ8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB5365
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

Changes in v6:
- Use tri-state properties
- Drop Reviewed-bys

Changes in v5:
- Use if (...) mask |= ...; instead of mask = ... ? ... : 0;

Changes in v4:
- Use dev_err_probe over dev_err
- Put new variables on their own line

Changes in v3:
- Default to not changing SH or SP unless there is a property affecting
  them.

Changes in v2:
- Set SH as well as SP

 drivers/clk/clk-versaclock5.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index bfbb51191c8d..5b986894bd3b 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -886,6 +886,7 @@ static const struct of_device_id clk_vc5_of_match[];
 
 static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
+	unsigned int oe, sd, src_mask = 0, src_val = 0;
 	struct vc5_driver_data *vc5;
 	struct clk_init_data init;
 	const char *parent_names[2];
@@ -913,6 +914,29 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return dev_err_probe(&client->dev, PTR_ERR(vc5->regmap),
 				     "failed to allocate register map\n");
 
+	ret = of_property_read_u32(client->dev.of_node, "idt,shutdown", &sd);
+	if (ret > 0) {
+		src_mask |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
+		if (sd)
+			src_val |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
+	} else if (ret != -EINVAL) {
+		return dev_err_probe(&client->dev, ret,
+				     "could not read idt,shutdown\n");
+	}
+
+	ret = of_property_read_u32(client->dev.of_node,
+				   "idt,output-enable-active", &oe);
+	if (ret > 0) {
+		src_mask |= VC5_PRIM_SRC_SHDN_SP;
+		if (oe)
+			src_val |= VC5_PRIM_SRC_SHDN_SP;
+	} else if (ret != -EINVAL) {
+		return dev_err_probe(&client->dev, ret,
+				     "could not read idt,output-enable-active\n");
+	}
+
+	regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, src_mask, src_val);
+
 	/* Register clock input mux */
 	memset(&init, 0, sizeof(init));
 
-- 
2.25.1

