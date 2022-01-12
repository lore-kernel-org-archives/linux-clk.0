Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E87C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jan 2022 21:05:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbiALVFu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jan 2022 16:05:50 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:39677 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232122AbiALVFb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jan 2022 16:05:31 -0500
X-Greylist: delayed 1607 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Jan 2022 16:05:30 EST
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20CE6nTR020453;
        Wed, 12 Jan 2022 15:38:36 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2051.outbound.protection.outlook.com [104.47.60.51])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dj0fcg9km-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 12 Jan 2022 15:38:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oeyYAr3WaNq6N/AEagRabVa5hXK+TlPSL3ukQtkx1l1dIyMkJkhKIBmOJJXqz8TA/SJe1Ad05hWV2ALYQOEd2zr5JWz5ZC2vrxB1XhoezfOlFcjwIyTfVeOUovam5RIO0Nj6Ah5LBwiI08NVC+QSjmrHnFQY+pF+nlPr8WAoc42FDxEP4xRpTCVHGXhDM1HONCtC/kbdA8LCJNUi0zASqJc2k/0HnlfRoqTBF6v7lOVhbgMIRoei+GhJvTmNhxKX0b74Z6pkLr9SC3ZV+5EmiQMMBM+gfCGmt+hLC2XMSwgaw8a2wGk/F8fw6VbV/uAqUuP2lr5SNHI85E9G74Y0UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7tWbzEl4RK45Dp0GHDoI3UTPh9MsWn8R6fL9KaRdH4=;
 b=S1qPgcXAu5jhx3/A2pntSRoLKSK2ia/tERa5Ew7uWiGnB02yhv20SIAyyoXzf835vZqWaHCTYMtVfzeBAaqF7wN+JN1vGaFHVDYTR1cst0Twld3X1SU5SG+TqZcltnDvOcKKqbbPLdTtRwZPjUrk63ksUPPw8VNJ4CeuW2VLHsIC4uVC8mAh51g5nE2jQqLjohMwqV2AvusZUTRv7KlM/bplyGu+QJtaqkQN4FAp/uu9nxx4ObKn+xE87Qe2ssL7zIsLNFg2xlw/ByKjKLWbxFt5s1fSfVN3vSGP5WKIDIhlT7+uXljK0WTeMy7LwDmHsGexUntA5i7FzMWOniyNtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7tWbzEl4RK45Dp0GHDoI3UTPh9MsWn8R6fL9KaRdH4=;
 b=1tYXwkVc0LCNFhbKgi4aaBGtxk195anhf3xKy2FBvLTdkOYb3OfL6Kl6GP5oIkP0iDZco8NIBBtrYdfyqTr+EOC4u57AzQuNhyVBpaBhA5oHvcmQoiEmpgcMMaYMNNrZGkdD9BdBFHIMZfYg/086fabboirLRgWli23lkTyyoW4=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YTBPR01MB2414.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 20:38:34 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 20:38:33 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, mike.looijmans@topic.nl,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH] clk: si5341: Fix clock HW provider cleanup
Date:   Wed, 12 Jan 2022 14:38:16 -0600
Message-Id: <20220112203816.1784610-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0073.namprd04.prod.outlook.com
 (2603:10b6:610:74::18) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0327874-d9ab-4e56-b602-08d9d60b8076
X-MS-TrafficTypeDiagnostic: YTBPR01MB2414:EE_
X-Microsoft-Antispam-PRVS: <YTBPR01MB241492DB485342909C1795E4EC529@YTBPR01MB2414.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mUWtkdvlrLbWp8I/jGy13+AJjt/k4v3wp9tEUMyvc95NE7Vp/atGL1zgssc/m8bQAi3RyBjf5GqREMPHfQSg0FmaAH+FarasHgFwkWNUHgpMbhi3939aTqJjUEpXtnzPfule4Khq6HA5++EroqIx8ZkePKPI7Of5H2xKllNp55l2qPPKgPSI9uTbAkpjXP46cuJyo4TSjs0UUAOyn/rYsgnuLPcIJjv5pilA5rUO7f6YCB34Aoe/+NXKwIb3eM+f21g7EW8Qdtj52QbjpUsDNH9nO8VNhx/U0bGFmdtzf6deNXs/F/sDmFM2DSH71gd3T5Zxm4qfxlxxTOSmrORk8OEMmX9mR55Q4o9u9PkAJqjrc7NeeUtvpmlYB7nxwEexAn6Lobx6qsD33Lm2g8iJqEAWA9bVIlsW7ipDHoDiUaQ9WYfrnkGcw0xHRyqCE22x8VaGs/EajXuiDgn3fnVLo4dOPSiE8L6yjdk77ZUSmugrqMqRlAxuCrbMpCOVwhErRAz73Ilw5chKlptzE/zjQiwWwnSb2ohek4TWToiXm8F/MjzlpjTSq77+2wb78UZXk7x6ZU7Xy6nmhO+Pcj4y8AmjcFUfr9HX/5YcmkmL8IlPW1kg7ngYXgbJLCZYh7wTo8RE95e5FsFS4spMYtXbZP+FhW5ublheX95FyFyDWF3rFdzuvPd5Yq5ecadAfcWY7UR02LooTj+3Dbcar5RnLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(6512007)(2906002)(4744005)(8676002)(36756003)(1076003)(6666004)(5660300002)(6916009)(316002)(38100700002)(2616005)(6506007)(6486002)(26005)(66476007)(66946007)(186003)(508600001)(66556008)(83380400001)(52116002)(38350700002)(44832011)(86362001)(107886003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wkpa8dCliZn/3Ezd6lwsgYHKrKc+ERmphR0NRVI1LY00UyrRnnxw2MmsA0Ah?=
 =?us-ascii?Q?IXbI1jcdqZuoOkdg2MavzJ1DwklWmdvnn3/XyxwZf7WTMZfxp/DKwbHqxj/o?=
 =?us-ascii?Q?hPRiJIS072i6t4ZS0KPkhA+2uMjlcFhLUuIGK2FQWCdb5iRpzcMB811MB2ga?=
 =?us-ascii?Q?bQsosiUp1dzgRSTMNJKsQ5ZQDJPz3cm5j82IYG4HPrbFFqw5atv55azY6yL3?=
 =?us-ascii?Q?ztuomL3uFZ9GNlntLkW3ezI75HqjFEpijo83ptNE183fIroyClJlyecoU0of?=
 =?us-ascii?Q?AZsaj9S/PLq0VpJLEDEhMzhESo65GEBtbzo5opkeMaCRCzzxPxAqex+Rc4WV?=
 =?us-ascii?Q?5vDTgQK4vF9QwLV2IDj+urFAqrJ87jmCLApIzevmuNmoZOGgasUkBo+dAVQb?=
 =?us-ascii?Q?4QzuuONwUNhh2o+jl1dYEAE5On2PjIaQdjFI5szdZ3OYWzpwF1ve7WZO41aK?=
 =?us-ascii?Q?YMieUlrfdB9x4V4fV1e/Flmc5xg90HaFEhlRzkm2MBvLVmp0+m4C3OdyuR52?=
 =?us-ascii?Q?NVn290T8pJpcl2P0DNA63BOZI5WH3zFEHP3iSzuTDkI1QWPejCYtkkBqlf/4?=
 =?us-ascii?Q?GFYomn6ruZjLZ/WE8MQ5e5q/U/CmvQd4v1RFRAjBT82CiHhy5Q5z5OFuR94H?=
 =?us-ascii?Q?YRnFG/puePuCnG+zR6AvqYmIig/30g3z56MQ7hzSyAcOSLG6qr1pzFRovJ0v?=
 =?us-ascii?Q?FWnBLIBU92kGtC39tfADalZLVtQWeDUai0KxJSXvaO9xweNPm28MP5Dn1Rfy?=
 =?us-ascii?Q?sSv2HQdHw35jQOWAiPb7jfvLDONpu1M8IACPdcyeL9wqr1FtqUS10o4Zn0bx?=
 =?us-ascii?Q?bRg9Q4XtvS/QlkvCFmCRqGE57UILRc5N7Bh/dhx3OcqU3UhganTfT6H3iGF8?=
 =?us-ascii?Q?JlO7iSxCZBiaAg+HRJms/MJvRH5huSp7tfRCXbEVbEHoGIj455z6+0V/KNaU?=
 =?us-ascii?Q?ZG28ItyTuPT4G4ETnWdp7JMF8Ux/1akdmAE0ct9PeBzFrdEsqJlxObCGKnue?=
 =?us-ascii?Q?ByuwKKVVjscQwHUyWn7gTqCTM287kEZyDdl9wI9ovAOsPy2n280X6/gKXYiA?=
 =?us-ascii?Q?ajwyRYC6LRwlsHmiZLCjDv/jF+lnzA2yb8cEw/KHcwODdYlkzTeH5fCZO+ME?=
 =?us-ascii?Q?AftHQiTH8TENjoJNOpKxNmv3BvpbraFgnBObdoMhxgr6U/gaunWiOHymNGAB?=
 =?us-ascii?Q?1t2Y/hlymM5Is8YXt/s14VG0JJ0LwB5KCu0G3mSfI+KfK+YIqtMQaWJ3UC3q?=
 =?us-ascii?Q?xsO9L+/MKAUaWdtm+skzBUhgYOYn0rnL19Qv35dRe1vZqjhr1WciMywFSJmq?=
 =?us-ascii?Q?fX9bAmW9FBSIFJZL6H2WAKMdw3EVUFMBARIyDbaQst/vrOHJepCuA+D3yUdG?=
 =?us-ascii?Q?mSQuTOPBjKD7hlDH1xWoXTk9fQqZSIrfTY78mjJmSFq83G6IXgsvVVVRZ6n+?=
 =?us-ascii?Q?uf4WhEdRyp7JZuDlZL56iygQC4+yUB1Wy/HqgMh1QlQZ9n8TVwXecXB56xx4?=
 =?us-ascii?Q?fF5w64QWSIQz03URE0SRs5qltd7tvHGP9pXzjaPWq/lznL1/IlWYaC3eLR/i?=
 =?us-ascii?Q?Bt4sBR4YZ6uLSO/DGAzMxMOwvXkZNdvISkZc0n7x3wNkh4t5qy+y5xNPX/Qm?=
 =?us-ascii?Q?El55Q/Xm9zkynxWOKZ7062AtBq/LSXeqVj+mTfm9FXs9SSDrdOjDSNG20V7v?=
 =?us-ascii?Q?M5XCrHAeSpn42/pqfN0FH2WV/uY=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0327874-d9ab-4e56-b602-08d9d60b8076
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 20:38:33.9602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5ese9Ky5E26J6vmdGqx5mNH0ghPMk+nS86tTEhWL20gLbzkNqGHmSZNg+cl21Rre9OvTlXTeQcZnD+fFgLaE5AY/ZT9TY10rlS8e12oH6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTBPR01MB2414
X-Proofpoint-GUID: K5iylwAv6zpNI4lR8I6Tt59gzIpWHT-B
X-Proofpoint-ORIG-GUID: K5iylwAv6zpNI4lR8I6Tt59gzIpWHT-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_05,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=776 spamscore=0
 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120120
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The call to of_clk_add_hw_provider was not undone on remove or on probe
failure, which could cause an oops on a subsequent attempt to retrieve
clocks for the removed device. Switch to the devm version of the
function to avoid this issue.

Fixes: 3044a860fd09 ("clk: Add Si5341/Si5340 driver")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 57ae183982d8..f7b41366666e 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -1740,7 +1740,7 @@ static int si5341_probe(struct i2c_client *client,
 			clk_prepare(data->clk[i].hw.clk);
 	}
 
-	err = of_clk_add_hw_provider(client->dev.of_node, of_clk_si5341_get,
+	err = devm_of_clk_add_hw_provider(&client->dev, of_clk_si5341_get,
 			data);
 	if (err) {
 		dev_err(&client->dev, "unable to add clk provider\n");
-- 
2.31.1

