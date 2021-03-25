Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957FAC433E1
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6828261A31
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 19:28:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhCYT2T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 15:28:19 -0400
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:3040 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230042AbhCYT15 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 15:27:57 -0400
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12PJQvEC022964;
        Thu, 25 Mar 2021 15:27:50 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2058.outbound.protection.outlook.com [104.47.60.58])
        by mx0c-0054df01.pphosted.com with ESMTP id 37dc5xbcgr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 15:27:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/V/JcdoNa3wRWySbxFDExw8OHCNaNsW6H1FeYhx3Seb2dRZfbISpcGzmak81VTmK/+L9sYdgWTbUQ2vv/uNx/0YbDI9V9JaqvQHDjGAt5VR96+cvmMdN7W6IM4a4k08WsDEkNbCQkI0Vm4OHp3a7JPMJW4ZQ36NX0IvnDFnq/BNlPZawloIA18rAm7qOeDsrgG+NP/cX4tgg5phhERVVfE0k8meBuv3480jOqxgG+pwJKzBf2cBaGdKodPIX00qE0V5B2Lqny1vWWdsM1YykgSABY3egui3TvQikPjS8P8B8nfQYC7tJdHQL5pvSnV/Qo7uZGLKDW+zk05YPAWx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSnS3iTjDT7ODu16W/203MvNtuUAajkM6WXHzUksHmA=;
 b=FinpXp0i0ZTC9nGTgaIdxbpw+GCqhYb3H+sEll1d+WL5Bu6DNTS9nVQPEdvpHE1QYMKCJAPnem98Lio9WNioLsBSmv9aDBBl9ZBciE39xA3DglsO8RswMoHXjmbi53IqXS+avsoLY3zBDmEJneFt0r6c7RFBtQE31MoGEVWKhG8/V88SicG5YNy55+uPerx9eCGwpmf1A665LsSAasCmzGNRlmg6svVNGCPYaCBw1RVI/u2Zpm+zFURK5KwNOfdmjWEZnZO2jA/d1kqV9MY+tjoi43KQnqD01H2XYzyo+cF/Nm44WQyJ+r+xXfcI7qgY09E2Kt3l/FqilqroJuDRXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSnS3iTjDT7ODu16W/203MvNtuUAajkM6WXHzUksHmA=;
 b=qoC1/1TruMAASC9JSV0BjarUc7LwOJmhFQeET6vFebl5SIGp8ezy9IibF62lUmI8xqgxud1Lj8WfrYGHPJOoOerGq+4RaQ63XKTIH9V6c+HYAoC2jVzBH6a17aW70WcCovE+WcCJFiVpXESFRRpWNmf+982CfyL+ylMb8KQC34k=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT2PR01MB4413.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:34::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Thu, 25 Mar
 2021 19:27:48 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 19:27:48 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 0/9] Si5341 driver updates
Date:   Thu, 25 Mar 2021 13:26:34 -0600
Message-Id: <20210325192643.2190069-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [204.83.154.189]
X-ClientProxiedBy: MWHPR17CA0049.namprd17.prod.outlook.com
 (2603:10b6:300:93::11) To YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.83.154.189) by MWHPR17CA0049.namprd17.prod.outlook.com (2603:10b6:300:93::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Thu, 25 Mar 2021 19:27:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb5619fd-0675-491d-8832-08d8efc412c2
X-MS-TrafficTypeDiagnostic: YT2PR01MB4413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT2PR01MB4413ABB438D71182277BFDBFEC629@YT2PR01MB4413.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DUXLIESEy2VQIezBFqb6VorYfirHDDF6y64n50y1GmnaoDhe4Kbx9yElztiftaTzbJrdSqlEeEIv2e+XvpFu7ShfUYTtZVs9tGOIYBFIAg/eIdiFp7AIEOLUMVarjIzjcQ0gmzTnncEtAZr6c3+zftC2YVxHqp06IOD2jD89XRrQdjFBhJE2TVPjuMGqKVGzKnz/IhUoqqC5VR10++XfsxxmVOOA2TAClEIAZzkOosWGmDSdl1V42m0NfKVKSoa27E7YDUTvrUg+HOqnHmIQyLBfJyjAxX5eX585T4f9Ojt/8/EDRQLuUbUezdI0fMnfqYlgGTzJ5FX/zV7Jrj4bixVmbY6X9vzBifKjFkZHvmenxrE8KWvwgLgbZS6hPM4JFBdmuPJ283kiEI//Qn6kRQ12bhUjHIT+iZDbluD8n5fG2GNzGDTBTd1WaiPRQ7BheKLmPGWRtmQJwFhmaCw/tYFA/4F+W0ltDGaYBSLOf/UBL8lFC8zfiMYVap9/KQlbI0AVeZ8GLCctcdW0qFO/INvCyEsepjDlH7eMbpLbQbhlnrLr4nFNnaaXHNKokpWpb+FfYgpujI4jQY12Qz0zcnMrxjRz4rcMSr5BTHCUztgUVNAcZeEsWXUWiXW5scjnSDOpD0pcddJ6IFn+DA8NZLEjfjQskxi4inFaalhPkrOTnQK/9d4dL3G1Qet600N2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(1076003)(44832011)(4744005)(38100700001)(86362001)(6512007)(2616005)(6666004)(5660300002)(66476007)(478600001)(66946007)(2906002)(956004)(316002)(66556008)(15650500001)(83380400001)(6486002)(6506007)(26005)(107886003)(186003)(69590400012)(36756003)(4326008)(16526019)(52116002)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ToPR3OS/vdCmCOhMDOQsg3gLhFmkxY4flfFOYiaQZByOeJJOb+nIXjENnCej?=
 =?us-ascii?Q?tYnd8J6iS82naPKeuIfoYFM4VisBEp8p3W6LR1MHlgNWms8yM15dpb7XrgFo?=
 =?us-ascii?Q?yzsPiXEjowouz/nlYmWcE6uQvt23ph3GZ8CuwMZxian/ytcDNc5ZwD683WI6?=
 =?us-ascii?Q?iZBfCJf2xUM0dhmpUMnVfilu6TJhmCBioDWc4o2rTi1Tp8HaFEx/GFkOuhDb?=
 =?us-ascii?Q?VCKcc9zJdxhoCynx8h6y0pZGbUW3cD6If6px+XtfAHDMT7g4PA/C2FWGDlVt?=
 =?us-ascii?Q?N1/lwWwatK8VuaB5DDul0UdqogF594dGiA0u9oxxAW96re6Vh/iqGXJsu2dP?=
 =?us-ascii?Q?HShHAe8tDnIBV0AtsmQj7LsAzA7ixkxBV+6f0m5/k/c9gA0youPUULZ9h6U9?=
 =?us-ascii?Q?nHDoORqYfYWQeveByX182i0pU3wGFgddkHkncgTs9D/sHkCAa3v6/JDchgPR?=
 =?us-ascii?Q?nbB5pVnHbAaZ+i1Ye4OZlaIiN8uImIsWamcEO53G6Ptr3oIiOuUilDXtjEh4?=
 =?us-ascii?Q?z6bXoezkgKQlpwDC4RZMLP0eDCJY/gNcVz+nDauIEezxZOYegrjK0vA31gfe?=
 =?us-ascii?Q?4XYrPBE704lB6d/KJnDfXcal7pzV7ijKxMbXHl7I/g3RyXJg3O00JcQTcJl6?=
 =?us-ascii?Q?Rqj2/NoMGbR0T4fCAPFlLWGPGYLX3hI+LNk6NG7yWGRIWM4DG4n6kIS3J4+O?=
 =?us-ascii?Q?wgD7Yu7sD+tapeSCc/GP+tQxWUhw0Xbjz7ySV0NaRv9BvjsRtp7ik/GhgV9D?=
 =?us-ascii?Q?q52DPwvNYIE561rjUcdfY2ZzG1ddBqQQL4PClTZODMORn6W7rLHliCC4/Kev?=
 =?us-ascii?Q?2hnlIQGjbclJYFbDHNzlc64dg6j7RCerlsxQOTaTmH84fsaN2lIsr5d9Wocb?=
 =?us-ascii?Q?mgq6rMth6RFVaTDdrL50junMOg668HAdMgBwDOH99/UgOvYEhFT5zdA7Xbxt?=
 =?us-ascii?Q?/2vYAJo3df9hD9n/EwtIrmO3CoAUZ0YDEqdhlAIUECaDWGJ4+dOOFnfqe260?=
 =?us-ascii?Q?2hp/lT2122cKSQLw1G51hDlzsB2w3saXmjeDkxTg3T6/wKHaOwMSA2MvZGYG?=
 =?us-ascii?Q?MsDTNwii21XRmxiR7MsFyeZTj6gYDXgkLjFV2bncAknni4lyAttFaYI6/rOB?=
 =?us-ascii?Q?cNLKM1FWFky4eY/PBjdCxeJ7nQwTt9YeqP7xjOu0xxp9F1udrK9ckvEw1Hru?=
 =?us-ascii?Q?8fTOocyjAY1tZiT8xhb+vNaxYwe1zFkUwHE27EtIIOQG4dT5muHkiVZnxf4A?=
 =?us-ascii?Q?5ziygvEvmu2RTH9i+ftNzcCfiEKHwzg2SRe+8g4ejCARhv/ZItjpmEZIbubE?=
 =?us-ascii?Q?ICXSbWLc2ZRgb+b19NwbpjpZ?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5619fd-0675-491d-8832-08d8efc412c2
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 19:27:48.2391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyTHpQucTuLzPvAKecDjw8DNrRp2toWKZrqFdZOSfC5ENxnpWFuXe2FUm+INf4EFMOAXqiiNRIGMtPahIDwHJmyBWBuePcXdvYW+g0oBcUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB4413
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-25_07:2021-03-25,2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 mlxlogscore=960 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250142
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Various fixes and enhancements to the Si5341 driver.

Changed since v2:
-changed regulator reference for output supply from vdd to vddo to match
data sheet

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

