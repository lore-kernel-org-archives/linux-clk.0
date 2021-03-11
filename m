Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695C0C433E6
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2988664F92
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbhCKWtR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Mar 2021 17:49:17 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:63790 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230478AbhCKWsu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 17:48:50 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BMKoit020131;
        Thu, 11 Mar 2021 17:25:22 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2051.outbound.protection.outlook.com [104.47.61.51])
        by mx0c-0054df01.pphosted.com with ESMTP id 375yymh9dc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 17:25:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuxvK9VoEcijS/BHzqRgoXSEt8SHEUiNd2spVKjErVvedxAbDjlrB6ixSLXKo16dQcIWcRfh4k4NwcicJS21ffcQG3NIHu5CdPSGHdHurgs1CEULhv3rL85u/TTZmagjjLuSZyWOJnM4ViA8BprMV7ZiVyPR8srAzVEHqQrJzAqwidiHE8JcL62cCvnFeklKk4a+p/iK266snFkxs3N4OkGMpdNuYyps6Ae3ZRozisM1a3wIZqIulgvESKOKvDzS6mZVX5whlfZ6GcERb6RKRuVbF9u7UxaiQQc61kL0reQKoM3tphihyIaQdO+Scv5Cqs5Oujhj3crBI68FpkF5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTM8UCu3cwnJzL7a+5I4KnGxKsQPxYaBMZb32Tuad00=;
 b=fsiPn+EyP6aCQbjIJER+ISLpxDOdCD0JkmmSbFIRc//wkc7fg4eDDSD4H9q2do6hCclOtTtFm4rTIqCi9lkIkE/TjDkZKA1GQe4M73uZrzDZ6rTTOWdzo+UKJQRTmR6kAfnPVnlg0ZeF/pKxst74ZL47RzSTxbmGj2uo7DtEqKiYGjsqqX/sD96hJY7P6FQBNAfu3uXNNOnvfHyNXWJNIAiSTnpJHFHLoc6/8h7qSo1hSVaQ86p81RUAoc5H0+DiXLJW29WAnG5FnW/PT1kIHmo/rmBxbkaTgLORhF2/DXUAvl28KtBHpQisAoPSkFESia/NHD6gGEJfctbMOIx/LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTM8UCu3cwnJzL7a+5I4KnGxKsQPxYaBMZb32Tuad00=;
 b=AuGM+u2/0Upr9oFQfrpx4UsJyR/XQThKruEzZHFkotI7z2yox6Z9VwS4qBEf47jfltbQyxVBHRMNdA9QM7cVFNEeu4sxBdU8wFFYSDolU0fY0H/g2atIJGiX1Ic+w+oWDUXwyUDuXsTwfdAtE3PrWlNOYlGgu0CYs6t7u+ahgWw=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTOPR0101MB0971.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Thu, 11 Mar
 2021 22:25:20 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.027; Thu, 11 Mar 2021
 22:25:20 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 9/9] clk: si5341: Add sysfs properties to allow checking/resetting device faults
Date:   Thu, 11 Mar 2021 16:24:36 -0600
Message-Id: <20210311222436.3826800-10-robert.hancock@calian.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311222436.3826800-1-robert.hancock@calian.com>
References: <20210311222436.3826800-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [204.83.154.189]
X-ClientProxiedBy: MWHPR12CA0055.namprd12.prod.outlook.com
 (2603:10b6:300:103::17) To YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.83.154.189) by MWHPR12CA0055.namprd12.prod.outlook.com (2603:10b6:300:103::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 22:25:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 643a62b4-b3f7-454d-7b22-08d8e4dc8e64
X-MS-TrafficTypeDiagnostic: YTOPR0101MB0971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YTOPR0101MB09717AA3351395EF8E6D7399EC909@YTOPR0101MB0971.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ssXbRhr2Cx8tgFxRMU+UJ0XcHYejMeMnOeZsW/8OHD9wd2VGpVmpcu7JKfcWQE/TbB4AkxJ5ARP4x5w8EKOHFx5NZn/SqQ7uZlNsMkDQbnyjEfwI2rS9n6LlYhkOJovcm7q/8dpwwEDPKcuPbKm4bYcrNvT0UZbykoTXdBhWyhGb6Tqwcwtqeru19H9Gtl7fl57qzoNccFNZ7AqC3/64Jm2EjfleTCy+YoZKrtrwp0ub3Db+b6t8wo7aDYcL6+8RMfXpGJ7y8HszJ2HVFxa6HwiZZ/XxSyt6lMDpp1yCZN4H6lFv8dv/50PtvBPouZ1wibq8A3+/wfyNXHTQCBBVcKtfRRnYUdfDINqwPfN959+PhW84Zbzlgv8TQaq5EztMFEfsz+jPwwuYavdbIdr0zGW02dr89/C40isHasuJyuaXY0Nnm2sg5Cd39haHet8IXvk/mK8RpUH1WXho32IKSE42Jnnsa4y1lWFEYZ1OrckeqyHlafSKdObo1Lb/ytDHbsGoYWZguHuhhnXfKUm5gYWiOEm7ziXvgb6spgu/BFweSaR4UPvo50fBvDfMLgooB3nCy1dEK2zCuJnHCmTbOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(346002)(396003)(136003)(66946007)(8936002)(66476007)(4326008)(69590400012)(83380400001)(316002)(2616005)(6506007)(8676002)(66556008)(107886003)(956004)(44832011)(86362001)(6666004)(5660300002)(6512007)(26005)(1076003)(6486002)(186003)(52116002)(478600001)(2906002)(16526019)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6br420pLVPhGaB5JEl9kFjDF7AyX+LZAbiACbYMxr/Jz2w3LYjRjPZZWIZr2?=
 =?us-ascii?Q?6LHvE/zWTK99bnSt/R+8mUdt54BQQ8C9AjU5PEDxXw+Jm192dGVcY1LUdQsG?=
 =?us-ascii?Q?9sBMFfoPJ1uOJcShY5ehgGCW+Y2bd7JiFUfJhO0kMw8AItTj8FaC+OQhCnuv?=
 =?us-ascii?Q?LrbtKi6JwFCmgsQTo9n0mJOITBfvXnUlUh+ZpH98tZ9R6G8xgytYQHo33ojw?=
 =?us-ascii?Q?N9dI3ekNDOKmAEJJllWrpuqK1TrkwBK/9Rw9V9UvOcrkIVEkg9NUNRlXp3tY?=
 =?us-ascii?Q?57lCkNSrs6bnfcI55DbgO6tB/3wa9D6f0RbF9c434rxnUFFIk6rkdtG8QCJt?=
 =?us-ascii?Q?R4CUyZkEVBKwwmIvJ3m5t3abD9oOlvBVAljvEoSfBw96OaXvvsnk977lxc2Y?=
 =?us-ascii?Q?yY1cMQ/waj7oVeB5vax0UScr+TJEsRWOogtaTKh5NSNgnsCVgEnAP/3jPRxY?=
 =?us-ascii?Q?smojWfR1kilZpaFj6DnLt+s6cwYN3DwWpyObEffa8hjXVSNY6+VHw8L4pyMi?=
 =?us-ascii?Q?3Saw1OaMLE8DOQP8G8tluuI1O02lD3MKAyICDAYyRgNU0XJFs4r+MKdhosOY?=
 =?us-ascii?Q?Ah+JQ1Br62rddmYvjx1lI2gc5jT8Bkb8WzNdarahJI1IkvmWkY8lQCqoaERr?=
 =?us-ascii?Q?fCnR0ddd46U/xIgWnELrcmhSxm2wa3203LwosZcgsR8Ik46wZ5lsc0c8XZIQ?=
 =?us-ascii?Q?7il5MJ+vECiJzLdJi3qS/hGjyhNelBm+BpXWFeGX7+QMOuPE+ed0nr6gJTaN?=
 =?us-ascii?Q?Ol0HwDX0RJqVK+SNNoWXwqfeWXGFfjHr/oHc6LYsMNrvwwTC7OUBbixPHESQ?=
 =?us-ascii?Q?ySaZKzBW0kPJoaNmvO9zgPjgtj1eovub+XiCrJQpOKdIjuDnSiDAFKlzmhla?=
 =?us-ascii?Q?fuVjGmfS+UGFrx7eg5kF5yDq9PKFaW209711AgKI0O2DN/xIAOVFQbFz1g+E?=
 =?us-ascii?Q?kZ4b8HiXBHzAmpVmswsmZRCjJEbwN426WQupuxCR7m8dGGkUzQ7v9nCjXcL4?=
 =?us-ascii?Q?IcUawvOtIbYxuGBGgG6vZlVXuX8nVlrBNFJlJ3l7R96ZkeW8HUs67dGwqDrT?=
 =?us-ascii?Q?ZadOldfBzv1E6faTzk/GdcfGPbx0TpwkJkhx+qInaRfXOHzQ+p6sOxnyPcUL?=
 =?us-ascii?Q?kmZZUTyopnrGL8QEfaBIyI3vKjxz4r4IfOh+igl4T37dQ+ls1fTF1zykSsCL?=
 =?us-ascii?Q?svwchLX/ZC+BLk1t+F2TFrSc74L4m9JPQEKV1f9822ImJ2A0NRQddWXDTzOP?=
 =?us-ascii?Q?qSq8OJ4JnUL0zYkL7t2SceIKt470odM4ige9HLygfkreWrv70SQOvV+tGFCA?=
 =?us-ascii?Q?YLE3uUwBJlzIX3R0B2Xsyahw?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643a62b4-b3f7-454d-7b22-08d8e4dc8e64
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 22:25:20.7452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeltL2m/6GvTBXHKvxz7J1pPURlOWf/KJ+VNaUQKfYtg5DnjpuefsZ20NpYreFTqukmCcCR1kG9G7HOWu35qiq+ZJ6P0n29Ye8Xoqebxsq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTOPR0101MB0971
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_12:2021-03-10,2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110117
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
index 4cd80ef389d2..f2bcaedf1c71 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -1479,6 +1479,94 @@ static int si5341_check_healthy(struct clk_si5341 *data)
 	return 0;
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
@@ -1706,6 +1794,12 @@ static int si5341_probe(struct i2c_client *client,
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
@@ -1725,6 +1819,8 @@ int si5341_remove(struct i2c_client *client)
 	struct clk_si5341 *data = i2c_get_clientdata(client);
 	int i;
 
+	sysfs_remove_files(&client->dev.kobj, si5341_attributes);
+
 	for (i = 0; i < SI5341_MAX_NUM_OUTPUTS; ++i) {
 		if (data->clk[i].vdd_reg)
 			regulator_disable(data->clk[i].vdd_reg);
-- 
2.27.0

