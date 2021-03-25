Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169C7C433FB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F38DA619E4
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhCYT2Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 15:28:24 -0400
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:43873 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230187AbhCYT2I (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 15:28:08 -0400
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12PJQTYa008186;
        Thu, 25 Mar 2021 15:28:02 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2057.outbound.protection.outlook.com [104.47.60.57])
        by mx0c-0054df01.pphosted.com with ESMTP id 37ddy6a5mu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 15:28:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h09jTiV+rD4TnjoQTOcN0ILuzuEIeda5THGDqZQc1qr41hzh0mc+sRrmnP5UW5ri3mRDgeUQ86a2ChhRZrVNFcm6rAqp21EhnAAVohNYqbd6Y/tslHIgWAahcTkEbDHO7rLjx6VGcjHUK3GIo6hTx3ORIwBfsASUBQyCcR3chaQKDqvLFjlc/316eBMm07XOt2XX+NXmRLZ+X/3FOFnpMpacIJj4ATWq/Fhu/QpgEwwQUzzglHdp9tuQJwsRswq1ZgXaV+nxt4Ajq1uQf5+PAzTJukO1MIX6zmOq8shQrD4GY5sB5sfkYzCSRsvDpwNhoYLt3AajhfIdNvL7ciKSgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+wZiGSh5qg/COXvGPS4DWFgp5zPALcLj2WELUomvko=;
 b=mED/N7QrKyz0XgJaPdid1BpKWnTWOxGN2uJZs9ZUvVBJKOasGitoihxG/K2DVfDct6+Ba2RZW5L2rUmG+zZh/bejTq3e7FLgmuXDGmG8dD48OiGGeFwkgDtmaTziw1HPJo7rR1zijP2XC8MFAYbpsPMxBTe0jMYne8WwU4n4ROg4zJSSuTNUxkrwRjo6W8VLmf8nQ0iuVfHr2X/KtUzoJI9X7hTUDIa9KlxbdmiaeP//gr0oqPiDodtsJrTOGt7EHbU2eKp8yjauab6NPByiT7TClbgx9p06wutianRqwwb3ujXI/6WgziFkGOPfrrQcqacoaeFTCkW7b5KIibLecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+wZiGSh5qg/COXvGPS4DWFgp5zPALcLj2WELUomvko=;
 b=uwkA5yu0WJlpcbHTQwjgoKTjo/xD1WaLlUgX6cpVcmkCHlTvHgeeiqxn0y3w7hL1EGSSNThm3MmcDzuWeVNAzxt9EhCY+BLDuai7ziO1Wt0jNLgfINUsvFNFoQ5ka1BhMQuxPid+x0jipot7kpfN+4TE2T/Q+dbTe/j1TDdBuAg=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB2793.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Thu, 25 Mar
 2021 19:28:01 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 19:28:01 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 9/9] clk: si5341: Add sysfs properties to allow checking/resetting device faults
Date:   Thu, 25 Mar 2021 13:26:43 -0600
Message-Id: <20210325192643.2190069-10-robert.hancock@calian.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210325192643.2190069-1-robert.hancock@calian.com>
References: <20210325192643.2190069-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [204.83.154.189]
X-ClientProxiedBy: MWHPR17CA0049.namprd17.prod.outlook.com
 (2603:10b6:300:93::11) To YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.83.154.189) by MWHPR17CA0049.namprd17.prod.outlook.com (2603:10b6:300:93::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Thu, 25 Mar 2021 19:27:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb4c511e-0ad7-4baa-19bb-08d8efc41a60
X-MS-TrafficTypeDiagnostic: YT1PR01MB2793:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB2793251CBD05A8A20A56A68CEC629@YT1PR01MB2793.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VfWQFIQgufPIOecXV3Dd7iaqFJQUH4gntEBV96mzWqb/0MiYrprk9FXtFZNy7m5gl1T07JMNbMfzhSh+3e/pzNu0cQoRQeOMhCuExAxirpVaxuENSxyyH40rayJfOamzg5/vu/asyAOtvAMfBbDlboy20RMiVYi9Ug8u8d93G0rx4D/aInVqHEJG/yeMNJvKdwA/MbSIqYcJe/rL39SlIezZXTf9cvSJT2uH2BmKkRHHYXsYvd04U/+uvGTyFmq5xQpX8luHv/JD8ed5aEEiSkdYt2QlngFhuwskEJwEa3Nq5n8D0iQJFyVEBv4o9vsIZb16aZKQVXRyKlE5c7tkUI62LZkxFAOR01SiIJsbGl8os+/zb07N13vUC/jbPZcGveT7dKfejrcMiW8efBlClTJjkYSd/HOOVYTRfLzhda3UWui7gEQWuCAynGJLttz6co0Z0z6twNd/xNzgTfED/tcU/FgsL2wk6l4e00+VU+e4Bp67x/rEGwa3nZ7PQGod/mO5a71FimRo04NxGs/seAacG8d39fS8b96kCJ4YsX0+9SZVoqEvucfgjbxivgsC2tdV0vEBkiEBXVLStsmTATI11XCchj7QB07g4iTLFQ1+7JLOzi22UcY8EF03WVr4ay6/W5Uu4yN/qTJ0VucWDrqz9pqpkXaAHnQVp4u60DoXzuGv7B3gBwpt0Nax6sUa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39850400004)(16526019)(1076003)(44832011)(2906002)(66946007)(6512007)(26005)(8676002)(66476007)(52116002)(316002)(6506007)(69590400012)(66556008)(186003)(2616005)(956004)(107886003)(86362001)(38100700001)(4326008)(478600001)(6666004)(5660300002)(6486002)(36756003)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LrBnFEZGPdpxEHtKiOhY5c9aVEv9H93DA3cwao3B6spjwNxwqt67n7tMTWPA?=
 =?us-ascii?Q?T/hfPZ4kw77xmtFlW5SEjXU0j31D7VZDgD/pszoQ8t11WBPNn0ElX6+1Jtqt?=
 =?us-ascii?Q?ZdW0Nq2cu8rIxlEe/qz7lhR7J2TVDXVeD7uyiEX1qd6BuMyHEqsfKiuiG8Sn?=
 =?us-ascii?Q?IUNwNkFrdL89efQ6L66F0l2YvFO5ed6z3SiJY1KCbe+laLL0WThJ0updcf+C?=
 =?us-ascii?Q?tIu/a0TipktYQs+qwWvWaver80jaJhQWqj7eG7dCnElQYxIysqa5kqYn2PX1?=
 =?us-ascii?Q?M+rFfmKN1TMIwMSUW2AVojHoBaAiEF6brBiuv0mRu3UvDy7cUB9J1CNjzSMc?=
 =?us-ascii?Q?cihHJnXycdzDw9XK+18xpTd+YkIFILjTa5QYZWxC2FMfiAYRS3W8XHfbOTPG?=
 =?us-ascii?Q?2Q82ayojqGqFJEn5unWkmPZwkWOrxH08WOwrNOYWJpPp/x6/bAFs71ZBBS8z?=
 =?us-ascii?Q?9so8n15vMwLZlvkUtRe+JZrzMzoPrK4f+TA1NBVbbveU0dJ7TlkBO0u2U+rg?=
 =?us-ascii?Q?aPgqW8qd0w8+pVeqIN1v47GcGfiD9pDOoQWNefH43Ghxj5mwYDF9cc2hMlH8?=
 =?us-ascii?Q?nGBw3WwiPO4y+4meMnPXU/tR8upCUJviXdXtpa8urd3LlsCgza6AFGfTcMtu?=
 =?us-ascii?Q?iZborccCTi7ZGIo4yG1YvHojKL5oNbmtstHwRtbtKsj34BKxqTi20usVQqRP?=
 =?us-ascii?Q?oN7l8HazkGKyoPlQ0zE4T+c/emjL3lD4HkaC04pIp9wsy3JGFWgj+yv/ZkdU?=
 =?us-ascii?Q?1nxETlEih0bSA2KI7zsi9AFoMvvGIKWtqcY8lOfPCBD0vEYgjUEJsDx9bcPb?=
 =?us-ascii?Q?GeCNgPy2UvN1+NhtqYjsfys1GluII4koxhhdFIfWLE1WOQ5tvWl3Nq2aA+jq?=
 =?us-ascii?Q?BLUJkJPMl1nUc6mhcvOIZ7iZTLU81O7D6FMWw7+AlQl9fd2WAHxppYWsc9ht?=
 =?us-ascii?Q?FPOm0xetZUF+KmBWj8mY0uymR9BXQ6mQosZ5hbkl0bcZacuncY4+cuniXR1X?=
 =?us-ascii?Q?eFbsw+ii3Yi/odal2cNWF58C+iiR2EyJoTPiFkiL074bZjZEtNQqvRoRl+Jv?=
 =?us-ascii?Q?CQJekYeUqP7zBh1lN4V908AsKmE5GIbciJoChGhFIqRmqAMEfRwonoiAj91x?=
 =?us-ascii?Q?kjlJbbiDU0WGD49JQHLZ+coYZOITWgoI4UGprJ6QlGJK7I4nrIgrwnSzsj26?=
 =?us-ascii?Q?7hFyuokC9MGN58RaQb7HID9Ez+Kn6PgJGZaopQ/u5qnX6ga42gslmHezAZHf?=
 =?us-ascii?Q?2EovpQpCUCNhU87SDRdhMgVtzs6iliiVdXSY0tyjqk3LZFhHrPYYaiisppyF?=
 =?us-ascii?Q?xpGIBZiNDwMAz3FHSdLi89yR?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4c511e-0ad7-4baa-19bb-08d8efc41a60
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 19:28:01.0208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oxs5IudqymnTizuUt36JgaZTyDS7zNIwqBs/8a/qwokwwCZI2Ph6DYpnF7zwIlUbckyADP9vhfcq0jww9Y8RsJBxP9OQN69PMkgwq3Tg+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB2793
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-25_07:2021-03-25,2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250142
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add sysfs property files to allow viewing the current and latched states of
the input present and PLL lock bits, and allow resetting the latched fault
state. This allows manual checks or automated userspace polling for faults
occurring after initialization.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 96 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index d4aa67a4dc66..57ae183982d8 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -1457,6 +1457,94 @@ static int si5341_clk_select_active_input(struct clk_si5341 *data)
 	return res;
 }
 
+static ssize_t input_present_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	struct clk_si5341 *data = dev_get_drvdata(dev);
+	u32 status;
+	int res = regmap_read(data->regmap, SI5341_STATUS, &status);
+
+	if (res < 0)
+		return res;
+	res = !(status & SI5341_STATUS_LOSREF);
+	return snprintf(buf, PAGE_SIZE, "%d\n", res);
+}
+static DEVICE_ATTR_RO(input_present);
+
+static ssize_t input_present_sticky_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct clk_si5341 *data = dev_get_drvdata(dev);
+	u32 status;
+	int res = regmap_read(data->regmap, SI5341_STATUS_STICKY, &status);
+
+	if (res < 0)
+		return res;
+	res = !(status & SI5341_STATUS_LOSREF);
+	return snprintf(buf, PAGE_SIZE, "%d\n", res);
+}
+static DEVICE_ATTR_RO(input_present_sticky);
+
+static ssize_t pll_locked_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct clk_si5341 *data = dev_get_drvdata(dev);
+	u32 status;
+	int res = regmap_read(data->regmap, SI5341_STATUS, &status);
+
+	if (res < 0)
+		return res;
+	res = !(status & SI5341_STATUS_LOL);
+	return snprintf(buf, PAGE_SIZE, "%d\n", res);
+}
+static DEVICE_ATTR_RO(pll_locked);
+
+static ssize_t pll_locked_sticky_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct clk_si5341 *data = dev_get_drvdata(dev);
+	u32 status;
+	int res = regmap_read(data->regmap, SI5341_STATUS_STICKY, &status);
+
+	if (res < 0)
+		return res;
+	res = !(status & SI5341_STATUS_LOL);
+	return snprintf(buf, PAGE_SIZE, "%d\n", res);
+}
+static DEVICE_ATTR_RO(pll_locked_sticky);
+
+static ssize_t clear_sticky_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct clk_si5341 *data = dev_get_drvdata(dev);
+	long val;
+
+	if (kstrtol(buf, 10, &val))
+		return -EINVAL;
+	if (val) {
+		int res = regmap_write(data->regmap, SI5341_STATUS_STICKY, 0);
+
+		if (res < 0)
+			return res;
+	}
+	return count;
+}
+static DEVICE_ATTR_WO(clear_sticky);
+
+static const struct attribute *si5341_attributes[] = {
+	&dev_attr_input_present.attr,
+	&dev_attr_input_present_sticky.attr,
+	&dev_attr_pll_locked.attr,
+	&dev_attr_pll_locked_sticky.attr,
+	&dev_attr_clear_sticky.attr,
+	NULL
+};
+
 static int si5341_probe(struct i2c_client *client,
 		const struct i2c_device_id *id)
 {
@@ -1687,6 +1775,12 @@ static int si5341_probe(struct i2c_client *client,
 		goto cleanup;
 	}
 
+	err = sysfs_create_files(&client->dev.kobj, si5341_attributes);
+	if (err) {
+		dev_err(&client->dev, "unable to create sysfs files\n");
+		goto cleanup;
+	}
+
 	/* Free the names, clk framework makes copies */
 	for (i = 0; i < data->num_synth; ++i)
 		 devm_kfree(&client->dev, (void *)synth_clock_names[i]);
@@ -1706,6 +1800,8 @@ static int si5341_remove(struct i2c_client *client)
 	struct clk_si5341 *data = i2c_get_clientdata(client);
 	int i;
 
+	sysfs_remove_files(&client->dev.kobj, si5341_attributes);
+
 	for (i = 0; i < SI5341_MAX_NUM_OUTPUTS; ++i) {
 		if (data->clk[i].vddo_reg)
 			regulator_disable(data->clk[i].vddo_reg);
-- 
2.27.0

