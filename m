Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB811C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jan 2022 08:14:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235909AbiAKIO5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jan 2022 03:14:57 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16736 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235106AbiAKIO4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jan 2022 03:14:56 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20B3TL0t027060;
        Tue, 11 Jan 2022 08:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=z9BCsswueklZK7iywPsxmwzi7EfI7q+t0ZbUWXa6/7g=;
 b=ugVJ/RZykZBG18vOPJj8624ZyFfUoqccnO+dqdnAuzVU6v8QZ69fePCV6k4NSiYurY6d
 4rsc49+t5OMu5b43Ma5vLMXgp9mPrj2vJwi0/H+yLI8t7aTyoWKRFBsFtPfjev1NxEuD
 vT1/ZU7pX/gtRAGaJSaLB9vr/yq5kwB9a4tGYswZkpFr6cMPM5miIzske4rTVYDVtCFD
 BO5b9EF27sMWURWRrGnMryMsxwlWTXMTDm3sev5e9//dXg5R1wiRoN1jGrGG9H4FdhSJ
 l9uDwSezeYnc3ycfWqi6GfvcGZYmn83Url27c+cjpSH5QRWCYIxpaR+wW/ndQnBDXdzt wA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dgn74aagq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Jan 2022 08:14:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20B86Q40013691;
        Tue, 11 Jan 2022 08:14:53 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
        by aserp3030.oracle.com with ESMTP id 3df0ndqhsw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Jan 2022 08:14:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLO1z2HaRuzlY9qAcz/lhX+gsJURk9q1Z3J36Qssg0m718u1w4heXRr4pXuG8IGh475KwJ6c44n1p60GYWk6FilNjhyqRnYZcRj33vwnBdoQ9rN5KV98PLCwW6AFJvD5OCR92AO45F5vJhbh5wmNMaD25exEa0IxvhNWHYOpQB/OqChBkL6qokizKUFOuzcDcyFQKA3WR+FGsdDEdIEuKZ2Vxxb6HiyPHh9HsO2mmPBwuwZ4Qki6NLNgYArv45kMV/XDu0DMXmvsdaq831LAk5w1PIzyjs/FV5aQjOJXB/VwaNpfNfQgCKJfRKpkaNsHhVIyy2ICy9mnG2C4HHSQ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9BCsswueklZK7iywPsxmwzi7EfI7q+t0ZbUWXa6/7g=;
 b=SkZA7Ss50kf6c6OqIXdHFOV9w1fbIfbZe/9AbjYDM3yls1zWuffAJkNrY1FsecNqyIKHQxnn3xiwY54V2rA6fpRojbz0fg+ZhC7I99czz8xvmwg1N8hMpatFbey0gmiSD+0SsmVj7wAeyuMd/85Vdquy/D/Y1dF6toBrSL8jG7MHO0fNLPze+nyY/9LQCXBihQrQcesJg3+C1h2S+mik1S8LWmuB48kyuk3UlQl+/xXREqjdLJvCbAy4xvQBXH3IhreDikECvmqYHPJQWjmXSkhK1c6G3Y04CvbR7qcw5A5Bi07F6OkYw0LuJi9aisDoH7ss60KDtuSfV5V9pgFoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9BCsswueklZK7iywPsxmwzi7EfI7q+t0ZbUWXa6/7g=;
 b=zj6Vgze0GzL4KpamAynHs27P+zS75cDnbjm3R4zF/IDGYLWMKQUD/BtVnF5Z//O/U+E5bZnsSuZdn4N3ErpxxA0FkCBUT0kwLCQ2IaXNwJd49Wfg+PdGnILr1W8Eh37H/u1lCCsfn/7+fkxShGS2/wGLcSOhfyLnk0qe/8TdWeQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5677.namprd10.prod.outlook.com
 (2603:10b6:303:18b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 08:14:51 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8%4]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 08:14:51 +0000
Date:   Tue, 11 Jan 2022 11:14:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     nobuhiro1.iwamatsu@toshiba.co.jp
Cc:     linux-clk@vger.kernel.org
Subject: [bug report] clk: visconti: Add support common clock driver and
 reset driver
Message-ID: <20220111081435.GA19822@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0127.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45b325ef-8615-4aeb-e1bd-08d9d4da70e8
X-MS-TrafficTypeDiagnostic: MW4PR10MB5677:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB5677B4F241E2C109539884D28E519@MW4PR10MB5677.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RaqLgQINxFEvrjiJXhrNZs3kYFed7JG91rT0ZRMwqEhHck+h1LrH4OYw0Q3dYf5UJcJNuaZVSN8jKYg9IydcBLBCfvXQSjlhLA1Vhw8zp5+sa/cl1s8tNUgySC6qQLeNXyE12Ci1w1SfwIk8bD2rjALRGAUG/eycglLIg0qgpmiIQpkv3mL6dESoWeRe0D58VFytLdPKA04S85KRKeG0rH1am8yONiJ/cHoGDpC52dzJirRTpNimR2rEvPLLZ/S9HkiTd3Am5OloaOW65UrYq9sSUTQTYN3FKb2VqZfkXepV3K1KE0EhVqVUH+SPB84N1rKEgNsr103wOg3SFiQw75SAJGYDtcK9J6oiPMDbCphmCMG5898+aPC1vpXj0AGnralomSxqjOX8PgWKaRCiQHbvaYNqKAV94rFReixPqxbFY5t28ZK8bC26a+OxA+XcwDLX8fdNmFteedVSUn5KuAD8fppiHtEPRz0nIWzWJLftlKG1AsMSUiM+ny1WYE645aQg5dEjKk6hS+DPzv2iYtA1u7xo6QmG1u0UAnkxA5O5Hv6Sc6xLGlBXYRp0xLSsJl0U15LaFP4it8hpoSPhR0DpagZPt84R6raBG2n+r/+9oEDIshUI9wS/Hvcm08j6v1TfH/yTv86LIFBS4T08X+5qNWWlB6Fa74oUhF4hpYm4FlDJbqfDHgQ4/sz/HV/vlZuG26wFOb/hIGMnWoMqnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(52116002)(6486002)(8676002)(186003)(8936002)(9686003)(6512007)(1076003)(26005)(33716001)(2906002)(44832011)(5660300002)(508600001)(38100700002)(83380400001)(38350700002)(86362001)(6506007)(6666004)(66556008)(66946007)(66476007)(316002)(33656002)(6916009)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LECpal5351XdlG5FLg7djkVvm2P6elu/ZvaIQ9H9HM8XdXRGKhTzZ/UK2UyN?=
 =?us-ascii?Q?wQTO52YW2o1jD2joLdVISiDHY+YSWvT6faR5LYOETNaDGJkZizC3Njce/QhP?=
 =?us-ascii?Q?7GJX3PEs+XTpoA9Vn/TiSVifsMArP3RQ58jVCE5apCTE2zRH/W7Ssu6wcSFF?=
 =?us-ascii?Q?Cl79RD98cH/xQyQbeqA5/HsJg/cUhO/OM34oBu5vNsT1DIBgFxhXn+r+yGTk?=
 =?us-ascii?Q?hMfD6GT7wr6Iq6poV1e1ROfRpnzkEivx7A2omGnVRl7pNFt+lMB+1gDd4dVn?=
 =?us-ascii?Q?6yjcxCTKAxVaEDTmEDIzzsxDaogMDW74WD67OThWYHUTYyC0yHfl1YgnYa5s?=
 =?us-ascii?Q?0phxuoUtowGcegvd8XRhcjonbkt5YesxYpoHoqQMx6iyQRHBq44OKrIFBs6J?=
 =?us-ascii?Q?UYLI+wy3PvVBn/NBbPSpouV5kIgpDqlJUDoVglFjtZI5Y4TUAHCzvYBpnOXZ?=
 =?us-ascii?Q?W40hp7iPOOPHOzX6c9UG7mp7Bj1R2hQ3WLw/uSD48c52hf5SlqDLdX7XStEC?=
 =?us-ascii?Q?krXkIcCv+oMDeyAMrpvwI7M5l0PCy9rctSDbNVfw6SY837itspIW2MvbQdIl?=
 =?us-ascii?Q?Z84TADpsmVg5eNUteTx3jYw8meZ9sU6E1y8PzmoI3M6VMMD6O4KevWWfqzV4?=
 =?us-ascii?Q?2iMIHAFAVT3Q9DrKk7WpT+7q0qBJm0R3tyXBG3j/yHMtUeKOnVAObc8sPUUI?=
 =?us-ascii?Q?6/Tlwzb3ocV1aXbY3thF8UxEvt9ZKAqPDnzUXpjBLbNUIFUwsp6E0tgbORp3?=
 =?us-ascii?Q?SJEXLSCmmJGIFZEEu5UIlaXRT2J/RcKfxWJcfBbEzTXy5vKl6Fvq7fxBAmq4?=
 =?us-ascii?Q?8RS2KCyDoEQHA18wtCE4rXaM7/GUssHRiWe3TNYrrOtQ1YL9eGA9a6lXPhnt?=
 =?us-ascii?Q?ERYgC1d+ldlNbZRDxQx90JKa5u5tmrOifTq8YOEa5hKmc+yDqewWmbw8/sTM?=
 =?us-ascii?Q?VU7mxBoGOKg+bpuiviMoMX4Q6qejtepaeBEUbxwiwkvBw0xGf9vkUXRT0O36?=
 =?us-ascii?Q?pJYpKRkvWrphdeeRiqed9W3RAXc+Qft/qXeqFeh7Uy9mHyh/l+h9CmDznJTJ?=
 =?us-ascii?Q?1NVOJgkBa52svnXNEcepxRaYTm3WohkZ+EgyeqFKObwkP9Nwhi4vJTjycFxo?=
 =?us-ascii?Q?yQNEhJ3pXoblRVrxRqmQF/RBknmL3sVsAJWIz/E5EbJqZaswc78sQjtBxHnY?=
 =?us-ascii?Q?ro1RPDTOxnCZ2xu1oATE0EeKRpixXbqIP3VEWYsl8NtgAlHwSzhj07Tmag8i?=
 =?us-ascii?Q?/50U/aMttXsZ+KvXF5o68S7P30XPyO8WnmiPMWV6IfcAaaF3RiPt58GWbhuL?=
 =?us-ascii?Q?UPPEPPcRYO7wSQNAzwGaJCKXawXOt3AXPSCGDOZHWoMMDMKlxtQVpkecCvWe?=
 =?us-ascii?Q?YiEh6tZNP+hOIz9Lm3ALNA/GczVc6OohywYjwERXvYgnd2o1DIbHO8BIBeJy?=
 =?us-ascii?Q?XMDvj1bHnBvFp6wka4toL9aN/76vl2i/lHL86yIZPEh7iH4/Rdfs1iASNjt0?=
 =?us-ascii?Q?RJK9qkKr8CXzzKDD9gqf9JCY3OP76bq8coZrgp4JlHJD0x7blm+V5/Y+/GtS?=
 =?us-ascii?Q?0lo+9AG+Bdj/7UI1k6b5tNu36fSjehu9igRDT1k15QG/0DvwQhV9rJTlFNrY?=
 =?us-ascii?Q?W0jaR7zxf/T32geCTclKmwMWWg0CairBVi5ktDmH24LiBx1tnu8UDn43fBja?=
 =?us-ascii?Q?FERAjpe/V1i/x8L6oc3FkXWl0CE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b325ef-8615-4aeb-e1bd-08d9d4da70e8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 08:14:51.5029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOX2j7atvtC7mlxwuGxzLfliYYwe/Z40+HjSRjOHV3FbxbMp5iAk6y+6qEvoGu/eYu7TNBJYKxv2AEmFyT34kQbWGbLvI8o9xKo5wbFQJok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5677
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201110045
X-Proofpoint-ORIG-GUID: 5EKAdCCRDqI1XRoSV3k_jcxK0ca-KArK
X-Proofpoint-GUID: 5EKAdCCRDqI1XRoSV3k_jcxK0ca-KArK
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Nobuhiro Iwamatsu,

The patch b4cbe606dc36: "clk: visconti: Add support common clock
driver and reset driver" from Oct 25, 2021, leads to the following
Smatch static checker warning:

	drivers/clk/visconti/clkc.c:150 visconti_clk_register_gates()
	warn: always true condition '(clks[i]->rs_id >= 0) => (0-255 >= 0)'

drivers/clk/visconti/clkc.c
    124 int visconti_clk_register_gates(struct visconti_clk_provider *ctx,
    125                                 const struct visconti_clk_gate_table *clks,
    126                                 int num_gate,
    127                                 const struct visconti_reset_data *reset,
    128                                 spinlock_t *lock)
    129 {
    130         struct device *dev = ctx->dev;
    131         int i;
    132 
    133         for (i = 0; i < num_gate; i++) {
    134                 const char *parent_div_name = clks[i].parent_data[0].name;
    135                 struct clk_parent_data *pdata;
    136                 u32 rson_offset, rsoff_offset;
    137                 struct clk_hw *gate_clk;
    138                 struct clk_hw *div_clk;
    139                 char *dev_name;
    140                 u8 rs_idx;
    141 
    142                 pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
    143                 if (!pdata)
    144                         return -ENOMEM;
    145 
    146                 dev_name = devm_kasprintf(dev, GFP_KERNEL, "%s_div", clks[i].name);
    147                 if (!dev_name)
    148                         return -ENOMEM;
    149 
--> 150                 if (clks[i].rs_id >= 0) {

This is a u8.  But it does get set to -1 for PISYSTEM in clkc-tmpv770x.c

> drivers/clk/visconti/clkc-tmpv770x.c
>   175                /* PISYSTEM */
>   176                { TMPV770X_CLK_WRCK, "wrck",
>   177                        clks_parent_data, ARRAY_SIZE(clks_parent_data),
>   178                        0, 0x68, 0x168, 9, 32,
>   179                        -1, }, /* No reset */

    151                         rson_offset = reset[clks[i].rs_id].rson_offset;
    152                         rsoff_offset = reset[clks[i].rs_id].rsoff_offset;
    153                         rs_idx = reset[clks[i].rs_id].rs_idx;
    154                 } else {
    155                         rson_offset = rsoff_offset = rs_idx = -1;

All these variables are unsigned but they're set to -1.  clks[i].rs_idx
is also unsigned.

    156                 }
    157 
    158                 div_clk = devm_clk_hw_register_fixed_factor(dev,
    159                                                             dev_name,
    160                                                             parent_div_name,
    161                                                             0, 1,
    162                                                             clks[i].div);
    163                 if (IS_ERR(div_clk))
    164                         return PTR_ERR(div_clk);
    165 
    166                 gate_clk = visconti_clk_register_gate(dev,
    167                                                       clks[i].name,
    168                                                       dev_name,
    169                                                       ctx->regmap,
    170                                                       &clks[i],
    171                                                       rson_offset,
    172                                                       rsoff_offset,
    173                                                       rs_idx,
    174                                                       lock);
    175                 if (IS_ERR(gate_clk)) {
    176                         dev_err(dev, "%s: failed to register clock %s\n",
    177                                 __func__, clks[i].name);
    178                         return PTR_ERR(gate_clk);
    179                 }
    180 
    181                 ctx->clk_data.hws[clks[i].id] = gate_clk;
    182         }
    183 
    184         return 0;
    185 }

regards,
dan carpenter
