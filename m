Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8D4EB64D7
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jun 2023 06:55:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbjF3Gzg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Jun 2023 02:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjF3Gzd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jun 2023 02:55:33 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D7A2D4A;
        Thu, 29 Jun 2023 23:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORigkP1V9D0esoVZ7dNQWEhMy7qHXeJ6bN4zxdp6qy03ic+20lSBl7Zyrd6r0vd0BQxH++YmZK0juRhq7RIz8ONNAFTU0kryfim3bU4YDI5vCfOOKseURd1ckSmZgz7dCuluqnMgbP4zvgtqXloRGy0dtP2Ip+ByvO08PvwM1io7emNWB93l4VVwvVxJ1Kye3006794QPymtje3W3261FAS7mI2CfyQiU45bI+I7GKWlWWT0d8g2MfzYoieqPIDyxpTuSrdVcw5WYirln75Bzh9BowUNFOp2NXFjLUtxXNbkV5zj7EJ1ccluWMtTQBkgbnwRPk3LjhMthcvgQPp9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzGs6efsDfaBc9mOV5pSbPHLHlWfAs2AIh1VFFK8QFs=;
 b=E4x1+oJeEr0v+spQbbB65xXGt1aImhUvNjyJXYSq3t/HKrYjJFC083ELYYM7qbF9Vp120vTR3LUmwm/BSwfBEY6jm4dXS2/5K/fX5dltt0o1+KcTMA5WR/FJbfldFHi8ahSkzVn7Rjl+dVZguWCddqHbCkVzFmgcO0xTNRbZa/J/2Y3oNEApeWeRdGIQYQpgp9l9g1NfUWVLx32OcIBwn4g23NuAQ4425UuFItMOeIrKSX33eHN8vbMm9OdaoWremPGwx4ZJUo8RVBvJ8Ti8exhQLHNRPHNzVsBg1/PuTXV2M0DVE6YXJn9nryw3aeQmOZA3NBfcjpm5YE/X7NSX7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzGs6efsDfaBc9mOV5pSbPHLHlWfAs2AIh1VFFK8QFs=;
 b=A2mncdZu3HZRnQAOrk2eLYpCmQrTYsWTpzhQxGTZWSxtd+os9/bOnSxbQjtXVrd7Upn6NCUWtuxueTiu6NGUkTf//aIHxRKPwx06olPvWvt7qW80R/V9Mdz1AcppjkFkPCmmOY1Nclik6GrxqFki7bg4AalkuhPKhJow7qjxWI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 06:55:28 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::efff:43d6:6f46:eea]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::efff:43d6:6f46:eea%7]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 06:55:28 +0000
Message-ID: <fb93caec-e7d7-9d8a-f6d3-b8bf84bfc3d8@oss.nxp.com>
Date:   Fri, 30 Jun 2023 14:55:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] dt-bindings: clock: imx93: Add PDM IPG clk
To:     Jacky Bai <ping.bai@nxp.com>, abelvesa@kernel.org,
        peng.fan@nxp.com, sboyd@kernel.org, shawnguo@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20230628061724.2056520-1-ping.bai@nxp.com>
From:   Peng Fan <peng.fan@oss.nxp.com>
In-Reply-To: <20230628061724.2056520-1-ping.bai@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::31)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 8688ecda-dedd-4539-793d-08db7936fcda
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l5RP2DtA5wxHyOP5FWnzGzEqv8rbCAxdqo73gsXXTOmoae7OhMaKZzOWl2e+CZUmdqS/WQDpREJP7NasuS5qHC+Rv+7xIH9VAZz7xZLfs+ujpq14We2OlFYzsDmNLiI3xs9WRHRPPRrNe6j/JRP+kW9WSkbhgeUGG5Q5UAiwLXWX0Bam7iqe81cRctw/AM4Ms/ksKzP9MGNplzVZYKcct5vdAi04wepfqXFaWUxJs6VSwEgCl7I0jvMKXYMwR7qdzomTuksMulvVD+mPwBaqThV/XncooEtu3BKIop1QkbnnHu6Jt75jbhcbG76QfsznBKapWxlLk3Ns4GT9xpTgq3EBY1tadf7wgf2JVycecemeM3VxM7WI1fAymc0qGzlBlLRvz02pWgU/YcsEsrNhFdq3tqhQf7h+HNrVbHot1VVToS8WRzECTdfKN/KEKIIrwsb0MxeuLcvG5O5GELfMfE2+lrso4ilWN9DJOCg1HaiWC+AyuiZQxlM0X88Dy2D5VbMwFfVgr88b8HbsL1NQEOPQ0ptUHdY+pRMVD6jiYCmrmMfb5SE3bd7mtJqXFsmguOh+r9yGteU9zb1R1TAC+XYkVByE/miqDdbHk431zVHiVKPzTZp0BsaGq9zVrd/5da1Y2TONSZvebbbKN7GCQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(31686004)(6666004)(8676002)(8936002)(5660300002)(478600001)(6486002)(66946007)(66476007)(66556008)(4326008)(316002)(6512007)(41300700001)(38100700002)(186003)(44832011)(2616005)(6506007)(26005)(31696002)(86362001)(53546011)(558084003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bi9LbUlLZWVVY0ZsbVJCcGRvaGN6bDBNYXBjUTFsdzdWQ0lQQUdQTEtEQXZv?=
 =?utf-8?B?Y216SWVza3A0Tmh2dkNPQmh5alZQVjJLSTAvM0Y3aHZYY0NPN1Z3VVpCZGRp?=
 =?utf-8?B?S2RHYitvR2xEdlNJVTdVL2tGWEQrYnZVcDVlaklXRk5YRTFaaTFlNUpNeGRL?=
 =?utf-8?B?VzBKTnhKUVlJV0ZvTTBPYVB3TDJiTDYzSFptYnBKR1g4NFduQUovSk42anJ5?=
 =?utf-8?B?MnhKeWRhQXV4WmU5enBvWndOQm5EbXVUZGhqM1dFdGxaMG1XQVRtQi83WnBy?=
 =?utf-8?B?dFRyQy96Qy9DcVNjaTEyR1Zvd293enBvWEpDSjVDT1NqUGx2bTdpeVBXeGtt?=
 =?utf-8?B?STlIUmNrbWJBcmVQWWNrT0JFZTFML3FqTVlMQ0NyNmlpbithclhmSDUvZmxq?=
 =?utf-8?B?ZE01dkJJZUhlUS93aXJPM0tsdE82VUQ5Y1JEcFJLTmhEU1pxK2p6VWR1M0NU?=
 =?utf-8?B?QU45U3hVK0VlZ1NWcjhzS1BScW8rMkdYU2pvUkRqTi9NMzFkRkhCNHI3L1Bv?=
 =?utf-8?B?bm5tSG95eW5yeDAwT1dEemIyc2ovMkc1enpQOFNmL0syN3gwaTRQSFdWQ1FI?=
 =?utf-8?B?Rlk2clVSQlcxQlpkWkNLbVgwZlNiNGpMd0tUOFFCWEtwQVVFS2VTWC82bWtR?=
 =?utf-8?B?N1NHc0VoODF3K1lUZk9OcVdJLzczMnI2MXF1YnFHdjVHVFhlREMyWlRlOVNH?=
 =?utf-8?B?bWtFZ2RvdS9pTjdISUszT1Z2SGJrdVlpWVZKZUxka3M0MG84VHY2SFFEY0Zw?=
 =?utf-8?B?RWdwYUVZUDF5SWhQUCtDdU4zUnM2ZGJTVXBoMUFBUmg1VnNIMk5scVZFZjR1?=
 =?utf-8?B?WkVEdE9IYjU1N1Nsa1Q2Mlk4TVR4MXlyTmwwTTZwdGNVZUUwRjFwanBnRk9M?=
 =?utf-8?B?SUpaaXJSUW94VThKSThjQmNSc2Z0TUVjTkc1S240QVVqMlJlcENOWW5FMVpE?=
 =?utf-8?B?eTBWMFVKSDl3ZUtTSGlQSDRFNkNYem1YbXpaUnRXbWRIV2pCWXlydjN2UVhz?=
 =?utf-8?B?Z0pMNDZQTFBrL3BjMjAvTWlDUXV5RnJpaUNHVTF6M0tBOTZIelQ3S2E0eDZ4?=
 =?utf-8?B?NjNaZWVrYUFDanpqT0xtcFVTUVJuajZ2NDllbGRybXE5Y2FuTmt2UTJOTkJ4?=
 =?utf-8?B?blZwWnJHWWFweTNSNmpsMmNQSytmNmRyMXhiM2FRWjE3OTk1dUZZaUpJdHo4?=
 =?utf-8?B?VEVzUnM2RDE0U3J1MFNFZkpmNlhLUXhvOXVlRUFiL3hYbk1kcDYrZEV4dzh0?=
 =?utf-8?B?cHRyU3pLZk1XOUhKQlBvamJIMnhieStQWTMvVzF6SC9rMzk4MTBVWUNNWFVQ?=
 =?utf-8?B?TWJwM3JIUW11VFFKV1RDczVubENTbFI4SDg0YnlNdlIySUZxMjV5RGdITmFt?=
 =?utf-8?B?SmZIbXVsbFdUcXI0Q1lHVVRtck5iUkFxUEhCcVJRdFB6aXhaVTdHWC9IbkFu?=
 =?utf-8?B?Sm04Ym5pSFQ2dFhndEJoTlJiOUpldSsrY09FY2VaTmJBZ3Vac3V2eCtXbHJ3?=
 =?utf-8?B?NXhqb3hZY2dnQS9tSDdlaXc0L0wxbUpzeHA4cko5VjVZM2NvMURmM3kwRjRx?=
 =?utf-8?B?VDFsRFBwdkpKVmdTeUxPM3RicDNLaGRDWDlhSXcwT3dyMGlySk1kd0YzbURz?=
 =?utf-8?B?NGk4d3A2VkpMekNuNUxCK2FtWVkxQkFaWGpIRStYV0p5Y2t3YTBSVG9iZ3Ju?=
 =?utf-8?B?RkcwbWFialMvTDdRQk5QMXNHeW1XN0J3MXpRTENJMnFHN3BPR3RKR2p2UDl5?=
 =?utf-8?B?d0JsMGUxRUwzS0JkcFFaREFKTy9id3l1VW5zZDhSck45WllnM1JncFFEOTdy?=
 =?utf-8?B?bmxWaTYzNU1tWVJTVFdIT2NEcmlxVXhOOTh6WHBkSzhrQ29weFIzdHI4YXht?=
 =?utf-8?B?NGlaTE1DdnkzR1NxemdLWlRaRGJETHd6Ui9rand6Uk1BOTI4ZTFrVUtza2No?=
 =?utf-8?B?bURLR2dvNjEzemN2NHowL25WTUdhNkUvVkRZRlVYL3I2am83eVZ3MGRoZGpV?=
 =?utf-8?B?V0sxRFRJSlBhV1ZJRkdVMklQZlNxbzdIN3d0TDZkNUJValpaSklyaWNRLzJ5?=
 =?utf-8?B?d01qOHo1STV2WGFkazk0UEVQdjJtQ2hkajJabVR1Y1JMNVI4L0RNZDdVU0I0?=
 =?utf-8?Q?J8UnX0NlCHSCB2cLV4NEBCMde?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8688ecda-dedd-4539-793d-08db7936fcda
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 06:55:28.5046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtNJ729njIzKmD8MQZr/4iGI6iaiaMRFxpNl0X09yyyHZmugEo9yAGk66q1jZdsjdceIHFZcl6ly/J6PG7h8gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9510
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6/28/2023 2:17 PM, Jacky Bai wrote:
> From: Chancel Liu<chancel.liu@nxp.com>
> 
> Add PDM IPG clk.
> 
> Reviewed-by: Shengjiu Wang<shengjiu.wang@nxp.com>
> Signed-off-by: Chancel Liu<chancel.liu@nxp.com>
> Signed-off-by: Jacky Bai<ping.bai@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
