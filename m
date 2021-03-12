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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848F0C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6127164F42
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbhCLSS3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 13:18:29 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:16853 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232840AbhCLSR6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 13:17:58 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CIBom5018929;
        Fri, 12 Mar 2021 13:17:52 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2051.outbound.protection.outlook.com [104.47.60.51])
        by mx0c-0054df01.pphosted.com with ESMTP id 376besa3kj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 13:17:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+8kDGCNTKOpDeXWTlFEHcw989tDJfV4ai/ThR63B41K+eaqNQ7VZH2M+sgOHNyT40LCQgxj3X4whe6eG/nGaXw61/L0YiUp6JOOLzfRV1/UpSBDd328kcQddbSUPMLcjN7FHXAHmyJ2TSiseWQ9lWOZdipk1JrJCjTk3f4WMrso5ChTXfyQHHznqBySQXBeI+v5thZY5QWiFL1CJOxX5x9B4GsGgFmVRJ2LPWV/902oANX5u0Z+qesyo1kNYi863FnWZKQuCFf7peZFULIjVCZgEyW3xFPuzZ/R+i9WT7hAc5WigDnTaC/A7ggG8t5G9N5xatJv4l8tJyK4HlnsiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hazm2SlZMXqGfnI4HmFT+uvzTfDzXjouX9zwL3vQ5d4=;
 b=eB8oJopJ50Z+dvexZDa8YokqfFxyiEKunGSgN9b20hA3o/nyHzRl2ZvT371gAPa+ii8FvSsl1vfAkXX1cSJdkQa18tSMpCfOn+MwPswASCrIAs9u+vEIT0tq854xCFLgbxnFHGm7GPFk4e/q3qCMg2OyRsRtvSRXuxuYYu1Jxa27rI//VYYmuH5cTnl2/QQ7JRoKx6fjnDrWoQx8cPmDl9vIIzxY4J/rYEzw3Vs0+TbF9893PFg5BkGu5oo+B0cUNTgRZt4OsbsZh9OJD5AeWrIrqn8s+fQeyj5ly/2WfVxrupHr9lW23doEuSUTzseZYrwHinPcfpCV93fjxdlndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hazm2SlZMXqGfnI4HmFT+uvzTfDzXjouX9zwL3vQ5d4=;
 b=Yo5xrxpx4jJOC91JOaVN3aZJayzJvjDmR6OGkFQwncmK9qn3d63v0Dfx46J7VbTl9RyBDJTvLuP5NFLrx66/RJ6ymE5wbivmU/n+jnGFQXHDV8TRUz//2Kzfsyq0jkZvVbaeRcPGgd/yzFjIFfGhSzTBUrxmoNGRhxyCgv5D5s4=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.2; Fri, 12 Mar
 2021 18:17:50 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 18:17:50 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 9/9] clk: si5341: Add sysfs properties to allow checking/resetting device faults
Date:   Fri, 12 Mar 2021 12:17:10 -0600
Message-Id: <20210312181710.3998978-10-robert.hancock@calian.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312181710.3998978-1-robert.hancock@calian.com>
References: <20210312181710.3998978-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [204.83.154.189]
X-ClientProxiedBy: MW3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:303:2b::17) To YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.83.154.189) by MW3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:303:2b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend Transport; Fri, 12 Mar 2021 18:17:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e58ebc75-3990-4e87-bc17-08d8e583252e
X-MS-TrafficTypeDiagnostic: YT1PR01MB4439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB443949184F2B690BBA16866FEC6F9@YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smOnHbB4T7BUxB/CjHy5hf70/+uk9ZS3aoJXWAQkDhyLWA/lwd19vaqkqbQhXEz9BwfeVP2dcGXlLXX2I2yDo04ANLktJYClqSu4xHx+r6hprZY9+DkviknzOaYIa26Hbd8bNWASwkbU8OQMRxlQOPKibK3j6gmhTqekub6BnVMcqq4pGdL+IXJiw63gylN9D627MFxZs/roEaGQT4PLFhhEk7TIsCSx7Y+4thjfsLiCeLRKjte6VbHKXjJEf/fX83+Zsn14oXTieo2Jpr03s1SrYP3cpKzYpv7fj7jqQhfJzpbU/7wb1MLebO/jDw7mQ5SX0n1wK7NBU18mxEEStdhdSWN+Fs8gqcAN44Nu1Ju+gvZ4ctRylYmyodPj9FhvCUkFPBqx19GLwKcIQWfufgjh7N4IGLk5VoFNwUGXoNs/JC/WKtZyUU5czdv+Ogm96nX9F0SmPzoYjDQIn5n34uzdYz0KjPqzYqqh9Wqb7nBgiMHtWgZr+Tb15xl+1cRqcQsCSDsJNi8TkGc01Nv+yaR+xNTvk0OYwwQUfdAc4iSw/OFfm5NuNsgbJBmdvaCYtXa2an8lkfSNKUBWwxs5cA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(2616005)(8936002)(44832011)(8676002)(69590400012)(956004)(26005)(107886003)(16526019)(4326008)(36756003)(186003)(6486002)(2906002)(6666004)(83380400001)(86362001)(316002)(5660300002)(6506007)(478600001)(6512007)(66946007)(66556008)(66476007)(52116002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3oGAo2BXN6Zfw9prUAwoGpGNk0k/HDaaw0goZ30Pwg1q/NiRmwrFrQDAj8E7?=
 =?us-ascii?Q?MXBMSxH7toiU19FXTvOrHExLpol18uuhgW93vvjm7zCqUKFG7Zyd27lgiscb?=
 =?us-ascii?Q?0/PD3yPLFXE28Tx4BnpQsg3kYpsjdfuU1LxtB4JhSa+MnvEQDDjvSm5PsOy9?=
 =?us-ascii?Q?2kqcNyTZYUbD4ybkPx70M0PHOyKCdFS1BOtPjsk1XcxeaPdB7CfOt/g5k7+C?=
 =?us-ascii?Q?WJ9hGxfD0Ez51nsm9SOyX/OgcfdAuZdo9+IBs7nQDU/+UsweaHlv7L4WtMny?=
 =?us-ascii?Q?q3POSftqm6VL86/zG+MzKXoetc747tcqNC1QRprHr1hua1ry8j6udu6Q6JJc?=
 =?us-ascii?Q?o14xzWeRZnqLdHnvd2fCVa2VZhi+DJfiabIhAsPd7dXWgAxbvAVmnaFjMSwX?=
 =?us-ascii?Q?0Qwe33cehEzRJ2tZo5yVhEw2NJEKk1LN9IpchtcMmHnOureVgha7lSvz9yHI?=
 =?us-ascii?Q?370692nXX3mg1FAVRPNzpm3VjBrx9uBuTk+NBkMbpyew8ZaKjFgg/3ymQTno?=
 =?us-ascii?Q?kiE86nBO+kjPj2pRYtjd/dNk2DFuxV4pk7hK/zB6JCdULGUsCcfzq+BXmfAG?=
 =?us-ascii?Q?5uOtajUSNOeR/e5S7b8eMppb/L6Wlbo0eTDssZ07KH7ET5WPeEgY14Nb6xB3?=
 =?us-ascii?Q?tq6H8l0TXNhvks0Vtl4xlHsXhVGUzGjLnqrOieeDZGjKNoembkkcvAaS/IuS?=
 =?us-ascii?Q?zmtPcFKoPorkbWVTz9VMaXi4/kMdNKMsCqPLdtO5YtEXPisdgWIERi8GEquF?=
 =?us-ascii?Q?YW0rHscOS3MJYdcny62wESoDIGmv6r5BapJH4oORVV0ItUcLTzOQb4u0CfG9?=
 =?us-ascii?Q?sjDqEMUhxEpjwpgIWEF1xRkjKgktzBU3+FKuHhbLwm/PCl4bF/Rn0tAtKOeM?=
 =?us-ascii?Q?QFnpFbe1OJP5L35gIzS7Ld50mSGh68a1mQwwb7afYzXP7k+lrQv97ToQqF/t?=
 =?us-ascii?Q?Ad+q4SQ5HC9+jfl7gxBpkRwaRmdyaV3I19tulsL5yctFw2LAeh1teV3VKujZ?=
 =?us-ascii?Q?zxuEnwte5QgAFsfEhPWNUf+0YfhbbFeic71HiCcsEQnMVh1Q7FnEkwxZxMPJ?=
 =?us-ascii?Q?+WhN4xzeno+CvASlDMdKyOgDWsH/k7wSwK7kQ0qwi/YEWDFneRkD7noZYzei?=
 =?us-ascii?Q?BbYoaiKMYccL+1KjciqnN7n4B1ECQWdTiDCF/g4/IYilNE8x+d5pVUz6l1+e?=
 =?us-ascii?Q?b6WX+As0ShjbF0KT1BTc8BPKTMfcMc1OEGM27tnElnP2o2ZeX5YEDl2T3gV0?=
 =?us-ascii?Q?E9zy0WAQaVLgwukP5JU1y83hhz0QtdCMQb5XBDlFryaVJTNf0LTLqVb9BEDr?=
 =?us-ascii?Q?aly+5ijnW0CIblh+iAhGHJgw?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58ebc75-3990-4e87-bc17-08d8e583252e
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:17:50.5168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PogkkPzBrrQQgvc0BD5VkUkFZGNdmXrKtpXMZ5SUD4vLPNoxcorJcfV30HTUGXScSUIGt6wA4paNidzgBJyN5brv53jg8FlF6P/Bh9vhW08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4439
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-12_09:2021-03-12,2021-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103120134
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
index 966b034a318f..7099f597616c 100644
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
 		if (data->clk[i].vdd_reg)
 			regulator_disable(data->clk[i].vdd_reg);
-- 
2.27.0

