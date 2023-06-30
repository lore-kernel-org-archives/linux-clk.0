Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99022EB64D7
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jun 2023 06:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbjF3Gzt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Jun 2023 02:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbjF3Gzo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jun 2023 02:55:44 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC4E30C4;
        Thu, 29 Jun 2023 23:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBGvMKtR+WLEYZ6anOIMbocMYhNR2hnnGh29h797lvZP7WJ5Dif9gYwSvSxoB+URe3kdsRcNtQTgyFKNZ1W9MBcR16atxn8Q0koZyFsY1Zx5ufy444y97/xIUKznJXfh811TqjJg9zfzEBTzx9vpBxbsQcCGX1Co7OV1hZgCmlRCRZL/fx6iSnhy2alGx5OjmsxsTdCnD5RJVCA8Npm64vL/GQ4Nd5M5tt5+w7Hy8xZWSTnNCoxD4AhgPYZinYFCbS5/i/E2EYilnirAF7Dp5BjAcqiaxoxDcq+l0011d8svXPaMfHAcCyMf3eWa1UAhy8nfBGdFuHL+1y/PRUkpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAP/TKVciMAl9uZvwoIBGHWIDkq7oQStoSnPuPymOqU=;
 b=CzULqRYg7ywPnRcjCx1JcYY96G8eBEhXI9UcK3F5FcOGbzl5EkwYhOPevP8g3eYlrIluSozrtQGRTTQk3TCiK+vjU6jIhTLfpyrqb4706+Q3SReZjUq+nsAvSRdlSjRuScXWuFvD6xguac88xpAcymX6K11JA1dRI9gNneQ/b0D1WWYfSAQena//TED+61bYfXjytg1ZAoqBKQp8Ssqfekrvv/HKNCKE7RXYy/eJLvSggDkNUViLbn6+OqJD0pTSV6lRE09emVmFYn6TEB/78+po+u4ZiDzUETUBW8T8e5DdVmtJjLUg9sPA4ewxSviiL3Iot2rPcRBu1nU2dgzWPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAP/TKVciMAl9uZvwoIBGHWIDkq7oQStoSnPuPymOqU=;
 b=JqkMv+kQ0ymsjlO6RbkwDCCiH6r9Vd83jnJZ108ras2VW/RAE5lMQ5V1hojCkk1cLDjI/3J4bIkzFdLqikIBb69/7KDg5nVEDKMwkQyQMYCqn/WAxQ54uRGXztNV3EuL8AhLxS7Mn45tGf6u2vpDlZNR5p5UZ7jFLzDBX68GE9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 06:55:40 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::efff:43d6:6f46:eea]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::efff:43d6:6f46:eea%7]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 06:55:40 +0000
Message-ID: <927e1297-008a-acf0-8a1d-5ddd488fba87@oss.nxp.com>
Date:   Fri, 30 Jun 2023 14:55:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/3] clk: imx93: Add PDM IPG clk
To:     Jacky Bai <ping.bai@nxp.com>, abelvesa@kernel.org,
        peng.fan@nxp.com, sboyd@kernel.org, shawnguo@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20230628061724.2056520-1-ping.bai@nxp.com>
 <20230628061724.2056520-2-ping.bai@nxp.com>
From:   Peng Fan <peng.fan@oss.nxp.com>
In-Reply-To: <20230628061724.2056520-2-ping.bai@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::26)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: feb4a127-413c-4d88-0d87-08db793703db
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DhR6iE8MTYAOz5HzQBP3mDgNLpVeyhO+nV4xjQ0Bs7ULtqMicxIeRU+IYWzvD7hmoV1CK2oVWwNu8vbVCisgPbhH61Nef5wtxW5JEfcyVjTLbqcJEg2tnWT89HCvB3Shzyz2OJx2WV3MIXda8RoR/ydJWg33X9M1jUQ5sQOdpPFyeTwqwsn50WXL0xB9GsxAVSFKQ9jtfoS8tnt3tlxobOeR0o/gU1QVqm5QH9W/5L3/Ws/RmTC/vopJEKxGXmgp2bhvr7KiwAmRM6bVtvUQtFCUaOIEaF6itubBjpEJPrjwK7t4S53ddU2pULnF6AKCjv0VVMU4W/QciEcxDQm27q++A2vjiY4CcLCzwnlCqGlFdvPfBb1tMtkDpr/yIAN1LzDyicRbzAfcBTAl5Qg2uI/93o0B6datYYe20nKMmWNPFm9jVR6QXNwQvolW56wQVb1E2aCkLVNYmxIB0ctZFF5C6l+Z92RLpejaPP1evzlT2gNUcDkWpegksnZcfuCgpDqp7I9TuQ9+nwoWk0tJhl4QsFhgWCdi4CE9y/JKVQHgViEJfsPzYcUkXQPw80QNJ1dST2WmnU9yrM1wYFFd6mCnQJ0oxvR0j+uWJrkPWzgZeOm2mnq+WvX54DgbDF3UuRt0V/THlTtuI+jnPStkYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(31686004)(6666004)(8676002)(8936002)(5660300002)(478600001)(6486002)(66946007)(66476007)(66556008)(4326008)(316002)(6512007)(41300700001)(38100700002)(186003)(44832011)(4744005)(2616005)(6506007)(26005)(31696002)(86362001)(53546011)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWd4R3RwTHBHVmNpMWQwU0RaakJMTGRselVtZjEzdm9CWnkrRGhVejBsMkxh?=
 =?utf-8?B?VFpDcytGRzZjYmlZY2FUa1Bid0pNdC9VL3RJVW5HTVM0MmtEY1c3MlUvR0Jr?=
 =?utf-8?B?blhrNjJzZjBLcDVyMUFmQU9pb3JlUHd3R04zQWtkN0krbWtkclM0WnVFR3h4?=
 =?utf-8?B?UTYzYkJxU1VETXFyN3M2Sm9VcTRaMVJiZHNZa2taekthOTN1Y0hDVjNVT2hj?=
 =?utf-8?B?aXpMaFFmSGl5ZEIxVUdza2Jydld3NjF6a0V2aDBRSDlpVElkdmRYTVN6UGRn?=
 =?utf-8?B?azJWZjJLMURKQi90MFgvNjJGazNWUkZOUXRDTlZYL0xCcFgwWEVaN2ZrZXFW?=
 =?utf-8?B?OVArR0QvOFM2a2lZMFJ1cXVieHlKclNkUkFzRzc4ZGxrQzZUR082WUdKcFM2?=
 =?utf-8?B?YXhUTkVObUJjUGZNTDBPMHJ0S05IMytNTDYrbWZoUkU5ZzE3QVAyOUVoSWxo?=
 =?utf-8?B?aytVNnliSjBiTk5QOEE0cW9hTTVsakd6aXBJZVZ6cHlyamNTRTVHQkNJM3FX?=
 =?utf-8?B?K2dnTFFkbk9MQUNYSXVrbWc1Z1NpaVc5cVFJM0N1UkpNSVMyVTZRYS84a2s3?=
 =?utf-8?B?bUdvZzIzWEVybDVzVlQvdjdmbjIrYUczb0pyVGFscHQxWlg3MU0wY3cwZmNG?=
 =?utf-8?B?MEgyaDg2dlAwYmpLZ20xcEY3VldraG9rTzlpcEptanc2UTlOamNFN09UQU44?=
 =?utf-8?B?cXloZHBIaUtZU2szM08rbUdqOVVseXJhZHNjZHhyeDEzYTdCcE5vYUIxRWEy?=
 =?utf-8?B?Z0V1MStUWlhTMXJOWCtScVFTaFpjK0pwSGdhcU9MRXZwWldTTUU5MTlYVWw2?=
 =?utf-8?B?YTZuTVdJRmJ6dXZqWml1Ump5TFFpWkF2Uzk5dzYwUVpuZ2R0QjZMMjJ5RC9R?=
 =?utf-8?B?U2ZWYnVkZUltck1nZHhIL3g5TTBXNDRwb0QyMm16cjNYZ25vUm4zclBjeHRl?=
 =?utf-8?B?bitzSjNKbDBvMTN3eFNqQmxDQS9KWEgrRGZEYnZIeWlnQ1MzMWgwd0c0ZHZW?=
 =?utf-8?B?V3FrNEI1NTQ1bUlxTlVmMzVISUMranAreXhRTUJxZkNqdGtpcGhrMDRXUXE5?=
 =?utf-8?B?R1Q0N0E1OXZqUUJXZXdoYjk3TjZhbzV4ZDNZeDcwMm0vMjhSVWFaYklucHFH?=
 =?utf-8?B?VjYzWGl1ZGlENi9Ec0NkdlhmZTk0SmF6Z3YvUVVmMUJDTTFJOXlXZEF1QXlN?=
 =?utf-8?B?bzFPclFTWk1RMVJVL0t0QXQ4QnNIWFBoQmc0OFBySGJIa3VkTDBnYkFEdkFw?=
 =?utf-8?B?V1RiZ3hsYnlueTB5THRQeFFOL3JSVGlGblBWZXpYbXJOUmx5YzJXdlg2Y0Jl?=
 =?utf-8?B?NFVRWFlRdTZpMHl2aWIwb3VZcUxkWE44UjBHVUdrR05ub3Jkb3puMlpteXlv?=
 =?utf-8?B?RWMvM1ZSb3lBZldKRTBtemRseUQxblJEbVRFWG1rVStEbWd3elNxY28wZy9O?=
 =?utf-8?B?ekFobTdPenA4ZmJVMlR3a1Y0b0h3bXQ2clZLNTdsQkJ1ZTZ5Z1YxYUp0OXN4?=
 =?utf-8?B?ODdrODh4UHBWd244U29vbFZaMnlTWmMwdDhGYTZnY2xtd2VQY0F1SFlnRW0w?=
 =?utf-8?B?WjZzR3BHOW80dmM1Q3VLbkI4cm1IdHByZlZ4Yjg2YVIyWHVESmdKTmRiMGgv?=
 =?utf-8?B?TjZpMFU3dko0T0pwQ0hManUwYmp6Z09LWE5LNlhZeEFmMUtIbnNoOEV3ZzIx?=
 =?utf-8?B?Q0ZiSUVjUGl6V3dpK216OGVRSllsSkVEdkpzREM1NmpZYXYybVRMOTAvTFBP?=
 =?utf-8?B?cFNhMnk5YUZWRGptUjBpanBteGVWZFA3ZjkxZkVHSTNYcnhreWFwRFBSWmxM?=
 =?utf-8?B?KzRHdzdMK3hWNGo3RDdKeUlMUGwzTFc5a2p4UHVuT3ppL3R3ZmRSMHJJdm9C?=
 =?utf-8?B?SHdlV2puTWdHMWhaU3JvbGV5V2QvTnZWTkZlVllJYzVTNC8rSDNqZ0JidG1K?=
 =?utf-8?B?NlhPNzVCZStLTGtCc3dERjRVditQT1lKemRyeEU4TFZaTytDSWdTMVNEOThK?=
 =?utf-8?B?clppUlA1ZTZneTJQZVJIMzU2alpWNFo0cW1QRDNlYkk1SHF6ZWNmejlXdGFr?=
 =?utf-8?B?cWM1bjVZaHd3Tm9VS0xzZml2ZjFnbElHTXYxd3F5Zk5lbk1NblB3U2xnMEVt?=
 =?utf-8?Q?/TOovGftdVJsp76Obh0bJuJ0g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb4a127-413c-4d88-0d87-08db793703db
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 06:55:40.3500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXxU1jAi3K98Zw0vdmnv9DOstfZT8YHe1rt7A+8uIdzTFLlC4zMfz7AtJJp2ym8j97OHNAX8Tl53jD7x26SiVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9510
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6/28/2023 2:17 PM, Jacky Bai wrote:
> From: Chancel Liu<chancel.liu@nxp.com>
> 
> The IPG clk and MCLK of PDM share the same control gate.
> 
> Reviewed-by: Shengjiu Wang<shengjiu.wang@nxp.com>
> Signed-off-by: Chancel Liu<chancel.liu@nxp.com>
> Signed-off-by: Jacky Bai<ping.bai@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
