Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5AAC432BE
	for <linux-clk@archiver.kernel.org>; Mon, 30 Aug 2021 05:55:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AD7260FBF
	for <linux-clk@archiver.kernel.org>; Mon, 30 Aug 2021 05:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbhH3F4M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Aug 2021 01:56:12 -0400
Received: from mail-eopbgr00040.outbound.protection.outlook.com ([40.107.0.40]:43374
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232316AbhH3F4M (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 30 Aug 2021 01:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajucqbQQKtKBuRd0EB3ELWJeri/CgnHZPQa+9AZoAf4=;
 b=UfvijbW20yZ0O55eKpwhrk5p/MbnoacC1MlsIBx2BWNcTUtELVN6Nt6NmIkhLARGhZtqvBJv1wYTifO+kLjop6p57S20B9P9uOKN/4oOcarcdbwr8j2u1A+YdlESLzS8zwaGZ3g4Sa+D45CHAU7ZMS22yQQZD0tOh6qpgH7yRZs=
Received: from AM6PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:20b:92::20)
 by VI1PR0402MB2941.eurprd04.prod.outlook.com (2603:10a6:800:b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 05:55:14 +0000
Received: from VE1EUR01FT031.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::21) by AM6PR04CA0007.outlook.office365.com
 (2603:10a6:20b:92::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Mon, 30 Aug 2021 05:55:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=topicproducts.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 13.81.10.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 VE1EUR01FT031.mail.protection.outlook.com (10.152.2.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 05:55:13 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (104.47.5.57) by westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 30 Aug 2021 05:55:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZT2q0PG2LMYBppZ7P016tewMvRC8EwD9y0L4l0IldaOKjBERBFCwtZ+KIMDKyqSxhhofDObf3d2t63WCJriAYGsD0AogoMu7brYv12iaqz57gwhWpmVwY2hae2jJ7q/p4JnpZRQU78klr06aauzTKwTnTKIEluxaGRC29z40F9xALEywhxqDKlEfW0S5faNI10JNUSnWkdZlUnkNXWJBX0zXyc/9bknevYzM0HLJjZaSS/U5oQDDNBsiONZshq53wPKgsH747LhXTFxPpb8gxku+7kd9bTCm4fenAt3ksFun7G3EI5JvCRtUNP1H8y92wnEeQh0/Cokqr39+1WXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK+9SxloORtsN5VO7zKC+vkOcI8m/rsL6AgEDVG9K7Y=;
 b=Gw7Dtu7cqZHoYB1eIl+V6wVKInhPlGUYIR4HEOTjdoa8MBKHLZjNEpsG+shy6COqLEsH7TJLcViw5Ue1GVmjKBpTUpKSX2l3PHaIVM471T+dJS1E2V6rrFrOF6TCZR+Eyw9ViDzyErSweq3Lp9v0PcRUEi/n2gGNQU0arRL+O2hnKr3aG8v7fNFj5KANJfbaWdbBr2tP+KftueiY9Y+V4JyUpgUnpzZM4mfec+H1WXud9mqPb7xDdjVUKRYRQrih2CI1xV0V3BtCylmQB9HbfNSKUsYnvFbAOp7xKq7JyQ6XJacKYjGdeOQxwYYerAWF9by/RTYNFojsYv9orc//gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB5673.eurprd04.prod.outlook.com (2603:10a6:10:a6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 30 Aug
 2021 05:55:08 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::b0fa:c0d8:101e:be49]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::b0fa:c0d8:101e:be49%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 05:55:08 +0000
Subject: Re: [PATCH] clk: clk-si5341: Fix output_clk_recalc_rate if
 RDIV_FORCE2 is set
To:     Pat Carr <pat@tuxengineering.com>, linux-clk@vger.kernel.org
CC:     Michael Turquette <mturquette@baylibre.com>
References: <9c7f1fcb-1934-2f4a-90b7-bbb108f8c6e0@tuxengineering.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.1a5597f4-c6ce-44a5-85ce-703181c3f3e1@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.eef9dd52-c56e-4969-b691-ed7a6bb1aa17@emailsignatures365.codetwo.com>
From:   Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <c7f8120d-0ab7-227e-f5b0-ddacc1c97114@topic.nl>
Date:   Mon, 30 Aug 2021 07:55:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <9c7f1fcb-1934-2f4a-90b7-bbb108f8c6e0@tuxengineering.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR06CA0089.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::30) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.80.121] (81.173.50.109) by AM0PR06CA0089.eurprd06.prod.outlook.com (2603:10a6:208:fa::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Mon, 30 Aug 2021 05:55:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e0c4877-9165-4bc0-e657-08d96b7abc09
X-MS-TrafficTypeDiagnostic: DB8PR04MB5673:|VI1PR0402MB2941:
X-Microsoft-Antispam-PRVS: <VI1PR0402MB29419AD1356AF04042ED0E4096CB9@VI1PR0402MB2941.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: tpFSgdLhmFDyRNlLm8i6DAdwNFL2fXgOrwZJiriJuF2FR0X4JiKcD+J9Z3PouJv6Dy+6AWWALuYwJwjKULAdNaMs+LX3TsoyppI2OuGnsdFrQzI8Tzc2qb/PXWwGacQXBL/MTouzJt6yFYwwiiv0WIBEKwuGcKYmhnmif1hA6jTCfNUb1yc8ABlu10X+Si7BTPscycdY9SWERCwTzfXvZYM7G+9SMbIn4FhKGZuvXxNR3Ntz0vEWbt6ZpMJ0CeePO2wdO5CYf4xEelro4+AZ2A1X9VaqLp/kGhD+HzXFcQzNKRbyXhkimsCaXIXdzQjUiSEY0Y/TLTKf89zrQzxkgY8DlRgBj59+9qjas9Gk3TXCdQcsmIJhZoYF/PfF7yLA8dUwqdhg5Osol47jv/4heZqpzP9y/Cbp23mCWNlEL88zeGm7nu2JSyMy0+0KdAd67tNpsiEODODWKz6aQ6LeKTXH9ttOSiGLh+n2Uigj4sgmXMcjXpuLi39wR+2LcCOoWyXFyjot6FjJUDTTwI9TwQUgCimpJzJKsfGwBtlcPh/FIkseC/VErcCcWT295teB0rcADMzcm8XjDAGkO1NGsbDEd5AlIfJR+T3Z9kp7A4JGKAy/ovMXqy6b4vEnJ2OP9PfF4GsCiRzUs3FXMMJ5o1OA9eHru+jA7HJPjg9DQeA4J3YUu0mNOmULACwPKCthgbeo/i2t2qsHjaS4mOb61X3cGDOPlJgc+fmwJCbAnEnYmMhMgUQwt+NfEwMVwuateug5IOB2mP1lVYaxhUPg7g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39830400003)(396003)(366004)(376002)(31686004)(4326008)(42882007)(52116002)(31696002)(478600001)(26005)(16576012)(8936002)(186003)(36756003)(38350700002)(38100700002)(36916002)(5660300002)(316002)(2906002)(66556008)(53546011)(83380400001)(6486002)(44832011)(956004)(2616005)(66476007)(66946007)(83170400001)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXpOaHhlMU5OSWtnTVE3Y054RURveTBXQmhXT0xadFo5aTV6VTk0dGdRbkJz?=
 =?utf-8?B?REVkNmZtNUM4bnRpeEl1ejhQNXVJUU0vVW0xN2lhMVcwSXFiV1pTMkZVMjVF?=
 =?utf-8?B?ZlJ5SnVnSmF1aDA2U0g1M2pTcGNwVHdSUkFsK2YvSS8wRGEwdEFQK05kdFlW?=
 =?utf-8?B?aXBST28zZGVTRTJrckVvR1ZBSWlWeW5GelFYekdBeVpqQnhHZ2FwcGdROGZR?=
 =?utf-8?B?a3E2eUpia3cyZzg5N3A5eGFvYVNqNWRkU0hzMFBFQW5nNXR3OGVLT3phM3ox?=
 =?utf-8?B?cWpVd0kxNDZlWk1acy9YNjB1UlNuTVVTZDhEamJKR0hOVXlDZ2JFeTV3Nnlp?=
 =?utf-8?B?WTN6elZjSWtvdzdwaGxOVFplVko5ZVVWcXNPeWZncEpVYUFLZXMxRmI3TDdU?=
 =?utf-8?B?SDJWNWNWVUU2b2V2bnByWlZuc1BWelBtYndBUkpwVmZmTUp1SEF4ZkszV2lR?=
 =?utf-8?B?Yk9rZkVieGNiaHlsMURpWVBneXZlV05NeUVSTlcvei9KdTJKdkN3WmhZRGhL?=
 =?utf-8?B?UzJFL28vKzBBVnV2YjhlS0dWK1RpZ25XMlM5S2pQamxzaGpqNWV3Vy92b1J4?=
 =?utf-8?B?UmV2ZWw4SlVYUGhReVJ3bFEwLzRRVGJMb1d0dEhLMjdPVTFYeXJ4alJ2WVho?=
 =?utf-8?B?cE5XMTlzTjV0UndDNGhtdEZGNzAveEpZQWNWWkVUVU9sbUt3NHdZSHdWTCtR?=
 =?utf-8?B?NWxidmpLcnFFZnI1dG1TemkwdXpUKy9XVXYxRzgrN0Z5Y3d2NXI0SUlVckRp?=
 =?utf-8?B?cjYxM1AzeEVkMUNBQTdTVTFtUit0bnNLQ2MxK0QvNktLbXVhK2ZYMldja3R0?=
 =?utf-8?B?ZldpaUlRM2drQklKbkRFamF5MjRaMHkrZWR5U3djL25yYnBjV01sUW1lTTJa?=
 =?utf-8?B?alcwU3BWWjVwdDhrREhmSFV3eXAwVGNkWDBWbkZDOG5uZFdSVzFaQnZ1cUhW?=
 =?utf-8?B?ejdxTXRSejJYekJWUzByTDNUQmhTZ1E0OFV4OTlyRGZIOHppcWcwaGxYamhh?=
 =?utf-8?B?ZlBFVHlEYmVsWXk2ZTVSWGZIcnR2RmE4MGRDZEVDYmpjZDlBZE9leHZtanZw?=
 =?utf-8?B?a096WEIxK1lRdlVqVGhiYVl5Yjd6bHpUU2hVU0pSa1N3RzJKTXhTV1EwcVBI?=
 =?utf-8?B?K0o1SUQ1RFdPa2JVdk43QVlPZi91Qmp6dXltTnY4aGZMK0k1RmZ3KzFuOXJQ?=
 =?utf-8?B?eEtOcjNJdnlqem5VSkhMaVFEdkhGYiszWXYrMjlrbFFnSlVFcXNicWw2VjY2?=
 =?utf-8?B?c2w1dXJ0SlJmeS91RXpaOG5MbzlKeUI4SGFQbmdET2o4V2NGTkM1VzdMVFo2?=
 =?utf-8?B?MzNXamtoT0JhVUJFMkVLNFo4QjF4dmxlY1VjdVVxMkttSk9rMHQ1R0M3SXpq?=
 =?utf-8?B?aEpGN0R3elpEekZla25TaXJPOStyOTNMTEUyMTFoMXMrT3o1K0dJMXVHN3Ur?=
 =?utf-8?B?Sm0rWjgxOEt6YkwzY0lQNU1WNjVyUUNSbkRxanBRbSsybjJoVVU1NjdyVHRC?=
 =?utf-8?B?YUZMTWlJWGdRMU1xUUpnUmxpdTlzYmpKUlgrZnpzbnprdU9uUmd5aVJrZ21Z?=
 =?utf-8?B?ZGpCT2VsVW9hTG5FblVmeklVc3g3SHRWaHJoNnFsMGZNNGd5T0F6UFV3MCt2?=
 =?utf-8?B?dkFwb1R3T2RXNk1Ld05sMjBjR3QrdTBqTjdGeVdVb2JaK3JCSVVaOEhuWXFw?=
 =?utf-8?B?Sll1L2FoY0NrL2RpQ2ExYUh3TlByTm5PZFpxZVJEUUF1Yis0Mkd5bk1JWXh5?=
 =?utf-8?Q?LTdOFsKGG+Zz03igeLKkaleqZ1yLTP3JN1u/Mza?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5673
X-CodeTwo-MessageID: e83c8d4e-30f9-47d7-ad04-eb90ba79a150.20210830055512@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR01FT031.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 913ae383-01d0-4b40-d055-08d96b7ab913
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rG3AofZDSJnxf8lByYKAaAr3ZL9tdDB25XaBZw16QawzXbbC49HNdMegs3ehZaK86+b9LYu28/BC879jyZBusi2hHn1LpySal3lcxR4n3dTiGmjzV4NJ7pIdUX0izGNxpEjoIIs+IrIwef1u+drppBLI6I1wzLtykJpEOj0fUTFInl88+oZPVj8Z6i7ANglYcic8HhlHsJMcg4jAT104wxaCaACPQ7pKDOvHceF98OE1E5GIS+bDAy8f05bskGNU1dmDG0vYFGitWVr49cjWaRRFjzJk6pxh3BDEPxWvWDLARkuX6LXbMnFYZXYIFII/cJ5kw/tenVtBekkmAzPKg7fxuW6M+xMliyY5dZPPquqiKaDSC4s2LOgn/Dt5lFkXM3fMNAa/5bXM18WNQgTau2fVREwbK7PmJmiEUrdvOQ8b2us6g0GuZHl9IfvtpU5La7sFGZxU+TknxjDdieGpsYBKgT7eIw7g2uikoU3lpZXwEb7+zxrWvzAQbGApkRRF8NBb8EuXu/ORVijUOJAoEohsB8TidHCQpgVRQPvyohHAaMjE0Kt3jTQT4UPtqH2Gsi79vqL/LeBB361yoQ+0PSTzRQNAJXW7P3xE9FrF+WjSL4QaXBoi0GSaYh4J//sKnYxL+Ud3PNANTooRRWMh7ZaewNGFpGqgyq4W4i5BP1ySOklESY4sDqq/EQK0hNCGtoJrapR0g87uF8djwPwT7GfT9bi2Zi0v3K1UII2E9z2rL9C7qWVkCpr1yGLt+20v7fyaTws+bWN2lBRxten78PjCGzYv13Pp5Y1+K3lA/zA1ZuzeqjRT1NVghBl88XYT
X-Forefront-Antispam-Report: CIP:13.81.10.179;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu13-emailsignatures-cloud.codetwo.com;PTR:westeu13-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(4636009)(136003)(39830400003)(376002)(346002)(396003)(36840700001)(46966006)(956004)(16576012)(316002)(82310400003)(53546011)(2906002)(4326008)(5660300002)(2616005)(36756003)(8936002)(31686004)(47076005)(478600001)(7636003)(42882007)(8676002)(186003)(336012)(36860700001)(83170400001)(36916002)(6486002)(31696002)(7596003)(356005)(26005)(15974865002)(83380400001)(70206006)(70586007)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 05:55:13.3623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0c4877-9165-4bc0-e657-08d96b7abc09
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.81.10.179];Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT031.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2941
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

See below


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=

=0A=
Read here our special anniversary magazine! <https://topic.nl/en/25th-anniv=
ersary-topic>=0A=
On 20-08-2021 01:04, Pat Carr wrote:
> Hello Mike Looijmans et al,
>=20
>    The attached patch fixes the output clocks in the case when R divider
> is zero, but the flag SI5341_OUT_CFG_RDIV_FORCE2 is set. The flag in
> this case should take precedence and return parent_rate / 2. Otherwise,
> the return value would incorrectly be zero affecting the downstream
> output clock rates. This table shows this failing case before the patch:

Yeah, this was reported before on my todo list once but somehow escaped my=
=20
attention.

It might be helpful to add that this only occurs with pre-programmed chips,=
=20
the driver will never set the divider to 0 as I've observed that on some=20
devices a value of "0" will disable the divider completely.


>=20
>                           enable  prepare protect                    ...
>    clock                   count    count   count   rate        accuracy
> -----------------------------------------------------------------------
> vcxo_clk                      0        0       0   124999999          0
> ref48M                        1        1       0    48000000          0
>     clock-generator            0        0       0    13200000          0
>        clock-generator.N3      0        0       0           0          0
>        clock-generator.N2      0        0       0           0          0
>        clock-generator.N1      0        0       0           0          0
>        clock-generator.N0      0        0       0   200000000          0
>           clock-generator.N3   0        0       0           0          0
>           clock-generator.N2   0        0       0           0 ?        0
>           clock-generator.N1   0        0       0           0 ?        0
>           clock-generator.N0   0        0       0           0 ?        0
>=20
>    The '?' marks show the zeroed out output clock rates in case the
> output divider should've been set to divide-by-2. After the patch, the
> output clock rates are shown below:
> <...>
>           clock-generator.N3   0        0       0           0          0
>           clock-generator.N2   0        0       0   100000000          0
>           clock-generator.N1   0        0       0   100000000          0
>           clock-generator.N0   0        0       0   100000000          0
>=20
> Regards,
> -Pat Carr
>=20
>=20
>=20
>=20
>  From f60f24c9ee88442b888723bae2584863c90dc5cf Mon Sep 17 00:00:00 2001
> From: Pat Carr <pat@tuxengineering.com>
> Date: Thu, 19 Aug 2021 14:30:21 -0700
> Subject: [PATCH] clk: clk-si5341: Fix output_clk_recalc_rate if
> RDIV_FORCE2 is
>   set
>=20
> The si5341_output_clk_recalc_rate function returns 0 too early based sole=
ly
> on the value of r_divider, without checking if SI5341_OUT_CFG_RDIV_FORCE2
> is set. If set, the returned value is simply the parent rate divided by 2=
,
> regardless of the value in SI5341_OUT_R_REG.
>=20
> Signed-off-by: Pat Carr <pat@tuxengineering.com>
> ---
>   drivers/clk/clk-si5341.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
> index 57ae183982d8..bf29a2c9bf87 100644
> --- a/drivers/clk/clk-si5341.c
> +++ b/drivers/clk/clk-si5341.c
> @@ -798,6 +798,14 @@ static unsigned long
> si5341_output_clk_recalc_rate(struct clk_hw *hw,
>   	u32 r_divider;
>   	u8 r[3];
>=20
> +	err =3D regmap_read(output->data->regmap,
> +			SI5341_OUT_CONFIG(output), &val);
> +	if (err < 0)
> +		return err;
> +
> +	if (val & SI5341_OUT_CFG_RDIV_FORCE2)
> +		return parent_rate / 2;
> +
>   	err =3D regmap_bulk_read(output->data->regmap,
>   			SI5341_OUT_R_REG(output), r, 3);
>   	if (err < 0)
> @@ -814,14 +822,6 @@ static unsigned long
> si5341_output_clk_recalc_rate(struct clk_hw *hw,
>   	r_divider +=3D 1;
>   	r_divider <<=3D 1;
>=20
> -	err =3D regmap_read(output->data->regmap,
> -			SI5341_OUT_CONFIG(output), &val);
> -	if (err < 0)
> -		return err;
> -
> -	if (val & SI5341_OUT_CFG_RDIV_FORCE2)
> -		r_divider =3D 2;
> -
>   	return parent_rate / r_divider;
>   }
>=20

