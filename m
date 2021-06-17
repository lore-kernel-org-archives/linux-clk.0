Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCE5C2B9F4
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 14:46:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0309D613B9
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 14:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbhFQOsb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jun 2021 10:48:31 -0400
Received: from mail-eopbgr00061.outbound.protection.outlook.com ([40.107.0.61]:3797
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231434AbhFQOsa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Jun 2021 10:48:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOLIrP79KugU6yDapwt2TGpIup4tqdNcEjXuJTOsQoHWacIeO2/qkE8+4k36tA83Ey4QqyKqR9z8hT3DEZ16Z5kJBA3AKcJsE/MX9PzSlu3oKIGR4uTjc9fBQaExg70T6JbK8t64qUPEDKSkM2W9W4KJ03/lexQFT6Rzrg9lIO0XPN8BV9qW4IwalrOJ6yhPpbDh1c8e+kWGUq9QYNfLGQfCWO+STo4iO/1PF3zLlktWzzYYKtFrhiRxmUWErjQLjqXec0fIVMOKRlrrm+fWMzYRRKZld9UBKhzAr9JGz6k1PMJnkkJH3rU99i5ahke0ejctxWs8WWxC3MkLb/HTiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBbhza2BQAv4hgbeAG/uOv2VE7PaseLfRRQWswAZXIs=;
 b=RThNl+m/l3NFOp5IifA2sPCOjbytzyjPG0CN4Rx3j1SqzqayKCN6Kvwvk8EXhSG5m9B9naMA6rlz0YuESOuqGrkdEpQ9NBcT8IRsNHJpW7aIzV+uW3UATzhxoSjrUATjItmHdP1qS6rYKPHXQ9BToTpflqJQ1+EEv2aqRKHyBy5Abs4Yb0VUZboX3csKlLIBsDeP/YsMO5ffftVoHNkjKmeC2fK+KfNLolmDDmhvrpDzGp7y70m6Mbt00kc9gBUw3kanaxAFg/VIMCEIpj8VgiHYR/WrOHS13fVsx9Weud/Z2jgw+proUA25bJBZQ5wXmcTUhbn5sl24LxRHIyVY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBbhza2BQAv4hgbeAG/uOv2VE7PaseLfRRQWswAZXIs=;
 b=oo3IcAuRBtPnwWdRrYnz+z7j1XjWLpDy7oHE69pWCiKrQk5MUGuFq5zWwivm7xqKQf/BNPRb9h2ThaOEZW2lEMMQPPNkWp+IK6kCk6hzwvUHPhuYDeQ+x165Zh6xRW0R8/JaU14oYPedjieifDlbWfBnc2UoFMapR14ypaPvpTw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DBBPR03MB7132.eurprd03.prod.outlook.com (2603:10a6:10:20f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 14:46:21 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 14:46:21 +0000
Subject: Re: [PATCH v2 2/2] clk: vc5: Add properties for configuring SD/OE
 behavior
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>
References: <20210614155437.3979771-1-sean.anderson@seco.com>
 <20210614155437.3979771-2-sean.anderson@seco.com>
 <47b37414-6587-0792-201b-e255feeee9c9@lucaceresoli.net>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <3174eed5-1078-68c4-4d98-95c448cd0940@seco.com>
Date:   Thu, 17 Jun 2021 10:46:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <47b37414-6587-0792-201b-e255feeee9c9@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BL1PR13CA0119.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::34) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by BL1PR13CA0119.namprd13.prod.outlook.com (2603:10b6:208:2b9::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend Transport; Thu, 17 Jun 2021 14:46:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e93e6aae-7f06-497c-30a1-08d9319eabf0
X-MS-TrafficTypeDiagnostic: DBBPR03MB7132:
X-Microsoft-Antispam-PRVS: <DBBPR03MB7132F528BDFDCD1610F27B51960E9@DBBPR03MB7132.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9oHGzQ6C8B3SUWH9sdj4Unm4rwgUbgHP8tNS7ijBSBshiB0MNwImPkjeaAgGQEFf0nnxuP5zjjyiqQtLRdQtRlJf/1b1N1BJZfnr74U4jrxu3nF+9sfGFgTJLUM/5cytGULXf3HLVbZUxIPQwJA2dosMtSZYCJddDcWCsi+b0KgeIGxsy8mjMmQzgKY3kzfthd0cqukJe2flkwhA/WQTQVOPyKdpogYWMwq/XigW44sfh0XpsISv8uYgyIYTjsyuGR81OCUBVOcSJsPX0OiL9dGk4s3Ib7sK5SuxX69LZ8QieSmqk7VjTM0lPVMg7W/Ma994ZwX/wI9YVHHH0Go2SEV/VDzoG6SYReBzWntEmoeWQ19NgiVtvs2Zsf9gSlDH7jeBIH6nGEBHYKusblUO62oZFIIuz/CKlwpgaIhBs3CElxl4+8BfW/AwPW0vdoeOfPERsNWbF/RcJj9d7s5Tb18KsPCaBDt1b1RHCoJKIq3ZzrG51ojPWasodgErHHJtSaFZgLJ53VtKrUWD4DK3Z8vbtzq0Zy95Q5wxMA8HqEaQcDc6E0Fk1lhEeTdPTdjIjmnXayBz+BjQ6CyTjupIOQc81iirGFXjMRhQFiFteyeMNFurzmwADHXH8HQGZXcqARHqD59NNtUUQZGXeQQGpdSJRsBFKMc4+PKxEx8/FMDsEj++2AfQU/Di6ODrxIMZYU/iRSajGafr8q1ZViUZwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(136003)(39840400004)(376002)(16576012)(186003)(52116002)(4326008)(5660300002)(83380400001)(86362001)(2906002)(66476007)(54906003)(16526019)(8936002)(316002)(31696002)(6666004)(53546011)(66556008)(66946007)(38350700002)(38100700002)(44832011)(478600001)(956004)(2616005)(36756003)(26005)(31686004)(6486002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1FBMjZCajl1TDdQRG5CMHZRTC9SV2xLS3FPMGFKQXVEa0ZuNmFNZnFSYmFN?=
 =?utf-8?B?Q1UvMy9RRUZNMzhRNFNTNjhFa1ZIQjZFOElBeHZ4bjJWa2RmaEZsdUlMNDFT?=
 =?utf-8?B?N0ZUUGNyRzFwNUdpYkMyTG9JTFJmanZuWEpkdDdUeGhlMEtFTXFRdm1Da013?=
 =?utf-8?B?RGRHaTVuUks3UXBBa0tLcHlMV0V5eWpmSEkwY0tqNE0xcXpvL011Y0sxMnB5?=
 =?utf-8?B?UzVuVTNGUzBvczg4d1Zrang1YVp4am1QVnF2ZXhwZTlsNzVPVnlNZVlXVUs1?=
 =?utf-8?B?Ym53cE9UL0xQSVZoRVF2aWNVYUt6V0VXNnhLWFREOWdCQnNsWVpJdGlRNHBC?=
 =?utf-8?B?SlB2TmJsai81ejZ3WlF3dFIzcW5oZk5sUWdPTEg4NURUVTgyY0lSS0Q0eWlP?=
 =?utf-8?B?T1pyVGpIUVcweTRXOE53UEpDQXp5NmtIczc2TVR6M3V5UjVxWitITE0vOU9Q?=
 =?utf-8?B?Q2dxVjNOR2lMUytLaG5PakNraXFKSW9jb1NXS3V1RVF6dmNiZkNrNkorTmxw?=
 =?utf-8?B?b0lhM2tzT2E4SjdraS9LTGl3TzNaS3pFa21FQmJCY0FPNWJSZTAwczZxVWFs?=
 =?utf-8?B?ZW9sYXpGOHNCWmpJeGtncFl3TW4zaDBlU0dhQjNFazV2V05wM1lINCtaVzI0?=
 =?utf-8?B?RzQwNGdqSVYrancwd3ROT1NjWVRWTkhGV1RXaGtXZ1B0YURLMnJBK3k4OWN0?=
 =?utf-8?B?aktLMkk3MlFxUzhMckt1N0dYZFFUY0VBdzNVdGZqeitJdGJ0N1VKaFJlQjUw?=
 =?utf-8?B?dEFZSk03eUdLeVZMNFlXSzN3VXFkVzE4OHY5eVNYRGFvZ0dHMlBOdk5aTENh?=
 =?utf-8?B?bmsvMzhaeGgxdk9UdWxhNDNBU2FucnhMbXh6MDg4ZTREWmdvc3ZneWFFOGhW?=
 =?utf-8?B?TkFxa011Y3dBSHZHNlJjV0lWSkQ1dTQ3cUZkcUxiUU5nall4dXh5dEZCaHk3?=
 =?utf-8?B?M1NDVWx0cHMwdHhGZWtRQkc1ZEV3WkNDZlJRUGg5TEdmSXdtdTVSUW5IUHlk?=
 =?utf-8?B?NFVHODlLVTVqajJyelB4eHM0ZGJBL2UwS0pPMVJyN0tYMms0K0liVHZyV21K?=
 =?utf-8?B?SUNLS3huMjU4dkh6VHA0UjZ1OGVWSkd0TmpxUUZhVzlKR1Y4SUdmT0VoZkhD?=
 =?utf-8?B?cnlNNU1vMVltRjFjcGx3ZktiVWZyNVpWK1FLSmRETkVES3lFaStqcXZjK2dz?=
 =?utf-8?B?T1dWSzJScUtOdTZZTEhKWXFySThZOXN3cWNpeTZ3Z0RWcDEwWmd4NmM3UDRZ?=
 =?utf-8?B?RXBoSDEwdEkzRE1HZCtldHFSemdkcmg2QlIzOEtIWGh1WUh0KytxR2lmck9W?=
 =?utf-8?B?VHJ1WDVaY3Y4V1RjMEI0Z2JmdjVUVkRUWkFWc2hPdGlrZzRSby9zd0lCU29h?=
 =?utf-8?B?clBBVlFkdkJXRk1SNkRTa1o1clRFcG5kRUFQQ09oSmtrcFBuMk9Jc1ltYWNO?=
 =?utf-8?B?bTJtQ0NxUG8rMEx6MGxRTVJLWFdWcytDcWJrTFJmSlFQWEU1U0VSN2hTQjB4?=
 =?utf-8?B?cndWSjJYRWNqV0Rva1ZBQ0NuUnZBLzNNdzM5RklpU0krL2lWMmpuNVhKZzJ1?=
 =?utf-8?B?Y3pqYzMxMStyVnloYVFqa0UyRHJPMm5RcmhaOVpaU1RlV21KY0UzYkJmNmlp?=
 =?utf-8?B?c1dlcGo3WmgrMXFtOXhIbVpjWmo1Yjdid25PM0JtQktJTXhYY3JJOWhKZnlB?=
 =?utf-8?B?OTVETWsyNmJEVnZxdTVMT2Zld1duZDJwcERndW80WGF3SW5VMnBjNlRsTVZm?=
 =?utf-8?Q?DMjoh2tpD7w+kaR6BWPIksyu7HTdwbRTgi0m9Jx?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93e6aae-7f06-497c-30a1-08d9319eabf0
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 14:46:20.9804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4TuKCjkRe4G1L3aSucEYDBL8A0w0+tWCsJ3zhC4e278qMIS7ULb+jAGu9FmKRTRGIxy1wdwJMryG0f4j6aLPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7132
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6/16/21 11:41 AM, Luca Ceresoli wrote:
 > Hi Sean,
 >
 > On 14/06/21 17:54, Sean Anderson wrote:
 >> The SD/OE pin may be configured to enable output when high or low, and
 >> to shutdown the device when high. This behavior is controller by the SH
 >> and SP bits of the Primary Source and Shutdown Register (and to a lesser
 >> extent the OS and OE bits). By default, both bits are 0, but they may
 >> need to be configured differently, depending on the external circuitry
 >> controlling the SD/OE pin.
 >>
 >> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
 >
 > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
 >
 >> @@ -914,6 +915,15 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
 >>   		return PTR_ERR(vc5->regmap);
 >>   	}
 >>
 >> +	oe_polarity = of_property_read_bool(client->dev.of_node,
 >> +					    "idt,output-enable-active-high");
 >> +	sd_enable = of_property_read_bool(client->dev.of_node,
 >> +					  "idt,enable-shutdown");
 >> +	regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN,
 >> +			   VC5_PRIM_SRC_SHDN_SP | VC5_PRIM_SRC_SHDN_EN_GBL_SHDN,
 >> +			   (oe_polarity ? VC5_PRIM_SRC_SHDN_SP : 0)
 >> +			   | (sd_enable ? VC5_PRIM_SRC_SHDN_EN_GBL_SHDN : 0));
 >> +
 >
 > Did you test all combinations?

No. I only tested "idt,output-enable-active-high". Though I also in
effect tested the default case (both zero) as well.

One potential impact of this patch could be that systems which enabled
the SP and SH bits via OTP could end up inadvertently disabling them
because they need to add the appropriate property. Maintaining full
backwards compatibility would require a tri-state property of some kind.

--Sean
