Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A2BC43333
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EB9664F4C
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbhCLSR6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 13:17:58 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:62270 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232583AbhCLSRt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 13:17:49 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CIEgPP026793;
        Fri, 12 Mar 2021 13:17:41 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2051.outbound.protection.outlook.com [104.47.61.51])
        by mx0c-0054df01.pphosted.com with ESMTP id 375yymhk0x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 13:17:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyFkujc3ddahA5vWpDdXnBijpw2QcUkHmDVhWoyFmxSgJip8SHdSJkPMEkNmCiUcfSe5wSGDcXys/r8Esv0nQsd19l4ehsUFu0jhBs8iZQzTWAffZ0UCQzf/+Ph1FiLe6RTkpB56s7cGhaWenMNkkDiNMuUIpsGenXXthsjeLjgWuYdjHjr5DiZ9AZSEOI9jACoFRKLZwtxKDyHOx4JDMbfWYQZo0uk9/Q9Zdl5i8WFwOy8Qk6B844P1XdDa1g3K4tZyDOT9fi6tfuYclIAu/u7s4DDp1ik817AoyKLoXZjm67AGyky2+5gxUVyiprRz3T4HMptD27Pzid2lWedUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuS7sVRCIR5tqnza2FVYEyQGT7Pl7u2dhzx5bcXOhNM=;
 b=frqYUsAFdfIEV3+jjElO0v+5UP4PhDkDmrfMpwq1hoCTXYIkU3/yoAitE/c4JjgtnmZKf72mrYvOBI7NqWTxPNZRXEuosqZ1ibXtaB1p3dg5C/uChvmUKB/ay+KEsfC90LkHsJyUgEVzn5WUCYElOMZu+dHBxBFxC0Ng6jP4Buc1+ZpUu+BU1W+ZRsnd7olVMElOz6iimRGNxZv4WcZEZJwjNKiE+CGcXhV1mtKexHHe6WFl8063N8N9k2lbjyfsep4t68aLKBlkp01FaJ2ogp0tXX5ad3HOJqhOrQvxidahdLb84nfFnOy9imWEhrvzWCs22sRdaBCqPAMLwEuIXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuS7sVRCIR5tqnza2FVYEyQGT7Pl7u2dhzx5bcXOhNM=;
 b=JUZk1VvhE7CDKFh1Sp0Fez6CEukFxNVwv5p4sjgj5mXMmYcF6xRSIFLuN9XG1YDgyqNeh1qEoWwNlkSTN8qhXeNlc/q/mQdgrZgV7BNUeG+vCK+/ush+tSOQwZdS1X5BFLhIM+GWQjTaWfuQ0I9PzsOaWZGY8rimzPvDJK45XOw=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.2; Fri, 12 Mar
 2021 18:17:39 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 18:17:39 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 0/9] Si5341 driver updates
Date:   Fri, 12 Mar 2021 12:17:01 -0600
Message-Id: <20210312181710.3998978-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [204.83.154.189]
X-ClientProxiedBy: MW3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:303:2b::17) To YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.83.154.189) by MW3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:303:2b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend Transport; Fri, 12 Mar 2021 18:17:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa70f18c-6d8a-41bd-16f1-08d8e5831eb1
X-MS-TrafficTypeDiagnostic: YT1PR01MB4439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB44391DEA5829C5B08DA5B960EC6F9@YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 65RPfCDp2ZY/ES3oFKocxJv1MjRCHM8goHVuNkzDLcid2rLkTCZtZlyXN2vMADsxDcncsSRAC55UrCbM9G4Q/aucbHXuWTovZPJD5vm4RyXESyonUIbx3/URzD5TU/1x27XVtRPlB8bMC6lAVhnxH7H8opHnHLlvh7UDou7PnV6/ex4sOhkNnegN2v42SAP93Rqh9YTHmhNgIl7RKjviz8miotdiQUa4Cc6MyEEwMrVyDxbb4zNvUvzfQdtbsxgXfhbiL3nILgbCOSa0iLEbVKg5UtkDzlT9i1tHx3tQk5setn8mDnGQC6o2FLakFX3TMPhJQkGZeb0MsDAymWCks+1pTzZEhuNIChDomnoVVCvVnnDZJk2pq6YTGgzJ2T/exrhyR/Wt2Uf2AFK0dQcks2wnd21TGWd1fKtGTnrA2d/vUfavErRcFflRFPY1pgNPf47zZ55durbjDgPeB49aSU13sevIc005uwQHVqi/rqPVgnMOE6RbGPYWoFQ9hqz2n0OBk+s60IttW1XMmk9ayOCzbiVV92JB6eX69VpgHpI3QiM+Al4wDBct93tUBDwgOUcIzfbb7HMsm93il8dqzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(2616005)(8936002)(44832011)(8676002)(69590400012)(4744005)(956004)(26005)(107886003)(16526019)(4326008)(36756003)(186003)(6486002)(2906002)(6666004)(83380400001)(86362001)(316002)(5660300002)(6506007)(478600001)(15650500001)(6512007)(66946007)(66556008)(66476007)(52116002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ROnF19Jm4Zd0NTNUWS1B0nTzXj2Lvcm5RvTr7dzO0DEqtXSMOu6acyrL1Xxs?=
 =?us-ascii?Q?u30CR0o8InY5CMg9q9h1YSx1idqFbAz7zddZrY94B0s8FpY7kTEjdpwDje05?=
 =?us-ascii?Q?H+01xsms7KmT02aZnplUFzPWvkGUPwL7NvNwzeFSnpOC0haYrJWEB0AtlhfK?=
 =?us-ascii?Q?l32IpAp6EN0lUBuXb6trkPzbWB6SiAK0owkErp/ycYK1tJ4iDTLqqEjIQnXM?=
 =?us-ascii?Q?6odnIdn6c7DIr+F5wZg/ZtMlrZac1g0MfLc23UUZpFZ5f43mD6mqL1kgMGwg?=
 =?us-ascii?Q?WTOtc0Hq7cv+mMvpzkqe5MlUNu4gX9V62W4D6FJ8tinoFVLwzJkUri4CxO2j?=
 =?us-ascii?Q?BA7pF9dZGsKegzz06z4IYL9OtNHbH8uG5yXEYxJjjWQjfbzCe5XlPEaRE4GV?=
 =?us-ascii?Q?qfmjkZn49HGheE8RwnCwQhRrX75giDFqbskQQaI1+ekV79A8ywVHoKIs+Ejp?=
 =?us-ascii?Q?f1Ofb24fo2UcD1/sZREa7b+BjbweC8tU8Ie9/HU4KLBd5RN+xA5jfTmk/jbs?=
 =?us-ascii?Q?OozSamV/bBneiboK3aR1bg3jQINYVjDPXl29UA48qJeVdzBZX/BqteX1Boqg?=
 =?us-ascii?Q?OXSWb24xZvTYjs0sXEuO993POvHWTX2/7kvoHZ+fPNWLZ5l2RMbjmM/mAjwj?=
 =?us-ascii?Q?4cGCbcd807M8msUa6Aw/x1Sx3rat/t3nQnjittwELeDw2ehVpGGuBVVx642Y?=
 =?us-ascii?Q?N1CLRUxqMlA2otVc0N5ElNae+vmhe6q9s9NkF3dYHmyL2sBy89Jx4aL5zrdt?=
 =?us-ascii?Q?LXbSbhf7DGBBAm8V5TgDOaiS3s6WF2Ij0gkxjDv667M9Y+vEGCMn26biisHh?=
 =?us-ascii?Q?aORg1HL7wyTlALFHqoKtxbBOmZzHNfzrokD89D2EwWORNM4LOAQ7NON+i8/V?=
 =?us-ascii?Q?fgw36gYYSbPBuXckcWZOl9x6ETAM53j+2D9SxjC1+ZdOncbLQbc95PgolprX?=
 =?us-ascii?Q?KL3YdJnKUUehpq3UCn0qy8ua6uctDECP9hWhYi9tlPjMabN0m+kh32oBeqP4?=
 =?us-ascii?Q?LCwumOvbO5kYo5QZEDtiNDXF8b52CMPe18PLcAL68cesiD+8z8dh7H75fXQv?=
 =?us-ascii?Q?2IFSFA3/BMVv26aYVYMb6ZHeY/Xm5bOA7byzJHVTevV5YV7c+64VXZ+0yFXM?=
 =?us-ascii?Q?c4o/fk5YZaijgqy6PjxcMLICU41W7fQKUvhe4fUZTvRrpzhzW6a3MybS8v+t?=
 =?us-ascii?Q?YeXG48mBJ8KBD56L38bsoyKjATJBVulvKHahB890KW9ayRg/99B/wwu4zub/?=
 =?us-ascii?Q?oqo363AwQxs22A9wK+kQyaH8wUgRlGFPXGinliJbL7spQv6uUenXY11r8TSU?=
 =?us-ascii?Q?UE+NQzo2Byj/fi9YC7bzuqpP?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa70f18c-6d8a-41bd-16f1-08d8e5831eb1
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:17:39.3522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntw/uXTNMfdyckiOMREAfHGjReytejfrYsgJAKSwvf19uVg8B7Fch6m66gearj8hqE9BjPMz91mvYimOwoZShZLYBpup+YwmzsVmzFXdSNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4439
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-12_09:2021-03-12,2021-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=951 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103120134
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Various fixes and enhancements to the Si5341 driver.

Changed since v1:
-wait up to 300ms for DEVICE_READY
-use regmap_read_poll_timeout rather than fixed wait when waiting for PLL
lock and input presence
-make si5341_remove static

Robert Hancock (9):
  dt-bindings: clock: clk-si5341: Add new attributes
  clk: si5341: Wait for DEVICE_READY on startup
  clk: si5341: Avoid divide errors due to bogus register contents
  clk: si5341: Check for input clock presence and PLL lock on startup
  clk: si5341: Update initialization magic
  clk: si5341: Allow different output VDD_SEL values
  clk: si5341: Add silabs,xaxb-ext-clk property
  clk: si5341: Add silabs,iovdd-33 property
  clk: si5341: Add sysfs properties to allow checking/resetting device
    faults

 .../bindings/clock/silabs,si5341.txt          |  16 +-
 drivers/clk/clk-si5341.c                      | 324 ++++++++++++++++--
 2 files changed, 304 insertions(+), 36 deletions(-)

-- 
2.27.0

