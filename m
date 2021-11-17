Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE797C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 17 Nov 2021 07:26:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFDD96321B
	for <linux-clk@archiver.kernel.org>; Wed, 17 Nov 2021 07:26:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbhKQH32 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Nov 2021 02:29:28 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33206 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230013AbhKQH31 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Nov 2021 02:29:27 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH6c1BB002109;
        Wed, 17 Nov 2021 07:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=V7QjXsBk3obCISUV1AIjX1z1XBytOs1ascS9vbGJEbg=;
 b=MDHIfAZSmecyhakpFqdU2rZbp9OJ3RQ4rkYrQSR32cllHHAjrv4BjkPBEZCkv976U5wl
 MXJoPqzm5obCGM7fMreK/Lr2O9+7+Pc5MBCzidy88sdzxrg5x6T0LqfELP+tDjXss6W+
 CmfzM/Xmis0OOYb8ImSymCQM9HxgqDk81qZt/fCCep4s1877WoGjR/uKW2wOvG4He5A7
 wtG7NWnELtD50zieg0wok+wJ80HY1XazAIOZ3uQAwBMuNwY7cJcaGKGxWyORWgF9SMma
 cTughBwvlb9gjtDD2Q3MIfGfFG/6hyNsXvFgSygm2Z1vcXMXuSr8ehomael9pzNxhprK UA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cbhtvwcs5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 07:26:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AH7KRmf124735;
        Wed, 17 Nov 2021 07:26:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
        by aserp3030.oracle.com with ESMTP id 3ccccpqttx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 07:26:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0Hv4fcUqMxV3cZoqIZKwFah9lLQ9FVyt4dubUc96YKckSTjUhtvHItdYNvYO1rHU6u5hAKeJpMGNJVG0e0lj6RS5+pJcNG241nuHuTYfMXxH8zdQw/A2tqUxBO1C0AuNzjsYMXFPvEdbQXAsaJbISYs/OQn7NvYGcrRVRYdGk6nLW6tBnF/Duy20xDh2eRZrAJoI8wVIwVWOkya9p7zNK1vRMIFAcCBEC//lLLw1CkdYQSesSDvQOIo+okUCvQTp095QvJYLCGIpmzZgt/MUnZD1IRvqPOK0vqDwWkn7wG44mv0XTGsqkKoZ5zWOTksL3ftYO7chDLETpg4C1iIaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7QjXsBk3obCISUV1AIjX1z1XBytOs1ascS9vbGJEbg=;
 b=keFCDgmYw/tEaXjTbutHhBkpqpwqfy9TqRIg+byqYLWEGCdTdp2wBXoe8pKqyqTkIZWS3BrKbeaL+RPq68bU7gvcO6F9wb+YIBEoGDSlkzNKY1B8F3UGgbtnfiER1wPcB8COcSuyo98KZmbXVKLitJ/L6eWxDdn97cAFbqVpbMXcgInohnzPlrnUXWfhrPe1nqASL6XRvHPBnw5rZy1G5Vb5Lr0ZSaiOBtZgBk1BsjSmkVoWs94aL4L89A5tBrAenEr+v3CfQU8bCYfObDXcclrBghngYGE686pRnScZenNEMVE76kzL0TX8qNUy2Ru+L+GkOiJPBU7SyPOC/LPTcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7QjXsBk3obCISUV1AIjX1z1XBytOs1ascS9vbGJEbg=;
 b=w4EU7vyFR4IwkP9ZQWsbwD8cxiOsra5Ld7MDtoikUxC+jcrc7Hao69WLb3wv4D3tTKPJvionPQ/Wr1HNI/DXKKDhstHxnpJluBOuXdYNFJGFAzu05JsQobrnV5EBLoJXnWXjHHx8dXNanAS3gq1Fy2pBhaXC13rmoGas1pD+NiA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1950.namprd10.prod.outlook.com
 (2603:10b6:300:10d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Wed, 17 Nov
 2021 07:26:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Wed, 17 Nov 2021
 07:26:16 +0000
Date:   Wed, 17 Nov 2021 10:26:05 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: versatile: clk-icst: use after free on error path
Message-ID: <20211117072604.GC5237@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0079.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0079.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 07:26:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4b341f2-6444-4dbc-4e23-08d9a99b8a9d
X-MS-TrafficTypeDiagnostic: MWHPR10MB1950:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1950C65D130494A6C338C07B8E9A9@MWHPR10MB1950.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MN0fmwBY9XMP0O5Ma2REwNE4fGvPDyedj4T09/CIb6x3UET0DhAZO6W79iw4H9cukb73w2tRZku6nCLz3YjqeGihJMTrb9Yzp6Nv6x+tvErntM1MppPfiud4sDJ1xtf06HEmdfR9Zjlwy4+7N0HQSLUIPmoI7q8ZuwFKBuwC+DiBlpzIMaL8aWq6K9pHwB1r/tY1TapCR72lOZhJx1WkgllZt8Oc4wNW05VDtqYo961wZToqvTUjoeAA4POMsj7/LPRxkiMe1M1Eym8Ls7La0CwEdSLJ7QFHk0kYJ9KVyb4onJWc9eL+zv30mggBEdLQNQRwAGrxX63qrSlN8oqJIHKaBustcqg1panO/JqR3wNPTZ7EekAddtUYSfCfl4oHS2O191/+GEa3T1JyACsvBFEzsUx68NNRY2zR6AvFAT1Yg6yoJc+1sRHshoTqDN2OtS4s29EVOscqS+xEM3F9447yJyUIonBgBUjPCX01DgMEflnFAm/eVKXqIU9+Q9oNZxMEi5S1SPVFO3euaUoBmiUHT9KF0CZhnDuxW4wXUombtX2eWbZXjnqDBE23zGykwmuznW5hn2rqHFVfBD5BjVUZK826lfWHltxaM7krxSwB5gqrHtdVjINmU39YJ5Zgrkv1tWzZ6o8xocXrbXb9pl8JX+T56CXwveDLrlj+3AfggcTf9aNnuh7Z/owocgqNolI1MXvFxz7kY5u74KX1mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33716001)(86362001)(8676002)(54906003)(110136005)(186003)(316002)(9576002)(83380400001)(52116002)(66946007)(956004)(1076003)(508600001)(6496006)(55016002)(5660300002)(6666004)(38100700002)(33656002)(8936002)(38350700002)(9686003)(26005)(66476007)(2906002)(66556008)(4744005)(44832011)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SXDHaLvzSYGXsPxnZOgcqDjCYIDL/HcpFz51SgBRD5AITMvoirLSUy2vK/N2?=
 =?us-ascii?Q?enKZPIx4sW5VH2rUVENwlhUBk/oyapLPj/K8RMRKQUNPOZx5yNybj4tG3iV4?=
 =?us-ascii?Q?Lp1aP1lxCxs/GOeG2JCjY4rWvM3mrxpPKDo0nJ4wzdjqE/oBwC+vyLcTY8aE?=
 =?us-ascii?Q?MxANOb2n2n+qJTwcMe224VehCbJfI9M4mzmBr8V5n4CL/8lRqGHzZxOmWVAe?=
 =?us-ascii?Q?4yN7k7tgDp6pyFstvOjLRvXGrje0S+ieWPD73px3m9FcsO5pn/1lZ0Ffi2qZ?=
 =?us-ascii?Q?kfQ3sg0QbkMS86EV3JssRUwGQhPmdSCCGjgQtDJ/cistuzCZa3ySYIgmpZVH?=
 =?us-ascii?Q?HguJfLNsyxI+JyP/74cKDwtZKRQYdM0I34Jhq3sN3xRgV3Y5fIzP+JX/V8Vz?=
 =?us-ascii?Q?9ZZFHI7JteDZfH48LokAy5A8ETpXGZHQ98OlD7HSXZtFwnEnoPiJB25VFl3i?=
 =?us-ascii?Q?EXwRoYDZbZ/Hp1nXKywDgNiXG83E9et85I0DoZjlOu+wjmyG5aNRQGJQ8nDf?=
 =?us-ascii?Q?C/MSPzzb0orc65LLyLADbTos3AKNy9x/ixWInJIpIZtY+AN1KTl7R0oK5X+G?=
 =?us-ascii?Q?n9YgMRQmUPpCfOYG7DfiY1+CF6B8YELmw4Cd36cgIw53JmAsmflJlSCdLgu0?=
 =?us-ascii?Q?8L0V5fy0RAU6AwQYP5PxeV2rCMGjm9FPalveqyy+gyFnixSgwTwZ7cNJeLG8?=
 =?us-ascii?Q?WhzFGOmNDAS0nGGdaxOZQNiTKu3dukXs2E7uTdfsNvbRLyRza5wfUO2/GbcW?=
 =?us-ascii?Q?jVT+AbnA90UALbMlva9XngG+ujOD+qqitnLyFdIRXqflGE++5QYcsfLSZY+P?=
 =?us-ascii?Q?R4C+QrNGoWhJysorheBn+t0NJydwTdoYZT2a1b6uLTAOAyhvZRjstMVuFUAl?=
 =?us-ascii?Q?yuHtAx8v4KOEGQMZ7pr9gEgaCd11f7y5gVTiUjZFKm5rhhYDGdIQVSxu4A3I?=
 =?us-ascii?Q?nqoLb3cY/cLOGqMcEyvLxPNlB2mROTlXRDXYdlkCLaqWqGgXmFp/sFVR7W6Y?=
 =?us-ascii?Q?cKjo4YBKnlLFUbyoWiR9SRWxwDeWcbxSmPMqVubj8Ofwu60zZPQuo9nOS/4S?=
 =?us-ascii?Q?hlPO5GQ9wUY7fKQE+dIS+gQfJUdmFrTMkiAy2XkzBQ8C2otSKB0Tj8HNFEh7?=
 =?us-ascii?Q?phxPrHq6LD11OS2MWd8BdU4pojEW6vLDDkw4J7G1pHC4kFf0vC8bMWv9q3WB?=
 =?us-ascii?Q?1R8ylxt1dPiakKnOo3sANVSpdAmf0AIMJYjpvngfBlPO2xO5mlq+F9uhH6vm?=
 =?us-ascii?Q?6dM/o5bWZR+wfGHZusjJmH+eUBz7hor8KFNcYKFaplvEV8uSCAusj4fP5ZMs?=
 =?us-ascii?Q?Ac9s06r671P1XVs4hYk8838ZInh5yWAIWtCAIjqb2Pc/l+4cPmlQZWXPHgdX?=
 =?us-ascii?Q?2qvJMe+cYWCcQCPkS+FosF9CBzwPxbBWn6gZVASGg5i15s9bQijlbCRxlTQK?=
 =?us-ascii?Q?qFpUqkUs6Hosnhi1yjtCzr7nDGFf/Lk2MpJ5PRsSMjCKtc60G/aD8etjYrmK?=
 =?us-ascii?Q?WzP8Zzg9D5hfqnwHGpWuIReBwgDA6hXXU+P7PnCo8+VmiPoNBYhtJHO47W5q?=
 =?us-ascii?Q?f7kqilWcRAOTq1t0cB5qgmJ2mjggC6k9q/PFkv8NwiLuNEgaQ2QMKXIyRETq?=
 =?us-ascii?Q?wE3Adlw+ngw8iJiY+2Mpabpn58Z9uqXvfbvWxiPUVPJ2Z0/rg4k/Oeo6YT63?=
 =?us-ascii?Q?3lXz674RgvfCTANQOEnwQ85Zkiw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b341f2-6444-4dbc-4e23-08d9a99b8a9d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 07:26:16.2974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BtOlIHgxHpwSMdTm6UqZmqQVb0uGnfLKIupXfg3cXVGZC6QUlN7Uk9cZC5KHjwzYDQio/25HV1xemr1lzXD8nuku2/H5mea8vasre8TB58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1950
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10170 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111170034
X-Proofpoint-GUID: AnikpdN0Po0ayteJNU2Fa_zaitSh2Tcd
X-Proofpoint-ORIG-GUID: AnikpdN0Po0ayteJNU2Fa_zaitSh2Tcd
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This frees "name" and then tries to display in as part of the error
message on the next line.  Swap the order.

Fixes: 1b2189f3aa50 ("clk: versatile: clk-icst: Ensure clock names are unique")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/versatile/clk-icst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index d52f976dc875..d5cb372f0901 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -543,8 +543,8 @@ static void __init of_syscon_icst_setup(struct device_node *np)
 
 	regclk = icst_clk_setup(NULL, &icst_desc, name, parent_name, map, ctype);
 	if (IS_ERR(regclk)) {
-		kfree(name);
 		pr_err("error setting up syscon ICST clock %s\n", name);
+		kfree(name);
 		return;
 	}
 	of_clk_add_provider(np, of_clk_src_simple_get, regclk);
-- 
2.20.1

