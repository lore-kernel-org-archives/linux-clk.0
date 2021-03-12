Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CB0C433E6
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 06:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4018664F89
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 06:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhCLGkR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 01:40:17 -0500
Received: from mail-eopbgr60051.outbound.protection.outlook.com ([40.107.6.51]:47360
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231130AbhCLGjp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Mar 2021 01:39:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmTIX5hypqLqfCn401l0tizTcgh1ef2I00dgRHQPnBM=;
 b=OsREVHnvsOYfknLGKeCv/J8Tu7CZtCwZWlFpk0fHGQOWT++CztE4vrvWsaXuH3EkpRo4Ox1upaeKwTQwa6ieEq6LGSRFjdmchp20WDJ2nY8LQCRaQJBkH+J2BDe3AQeMsIEW131XwfWCiYsyqYo0VZtFYvEkdFC/6E8G7LeVmWk=
Received: from AM5PR0101CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::30) by VI1PR0401MB2270.eurprd04.prod.outlook.com
 (2603:10a6:800:28::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 06:39:40 +0000
Received: from HE1EUR01FT005.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::cd) by AM5PR0101CA0017.outlook.office365.com
 (2603:10a6:206:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 06:39:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 HE1EUR01FT005.mail.protection.outlook.com (10.152.1.229) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 06:39:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.105) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 12 Mar 2021 06:39:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVGjO/SpxAmGfv1HA7v8mykwebv2epRaQ6PdWwhc3VQ7AgFgNSuRfnsf9Kg33X2ROW80lvjM3cVv6AU3tbjBVCx3qK1YgtPdgIx1Uxe/agn3dA2FrgUoJZlV3K84K9lMd5lR7MKBQoNZ5w+8IPQ0ILugHImqyoEXTihfMxZPquTGh6b7jeSqEW07FKuIAo/mzns2xmGinU+7DYHwxYJt2EZrZKYSO6BQ9uh8VZtlmFlL1NNPxJjbuoBgeST/Ec0oHVwklwojKtV+x3RFgHL0BCjfxKZExMXEpYDwRafeghEr3rfsrhsldudcbd2KttmfKZMT7sycCsMbWoiyXfcJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geQwxFk0wCBd4xZCb1HtD7QyAczG4xiIgOq8CYrfOY8=;
 b=a8ULWUMQQLlZYeF8w4V1cs+a5gDo72MFdh9n6l2O6Vzt7yQjSrVH7p5oRwBCeNgKwbSqzFojRwneheKCA9scLikfoFmGVLtA7aNNj98zUnGjvV/d2kEBULAgYp/AVei1rHwB2t2zqaYFdLdQtGaqB1wJBWebwAoi2vs+rFw88+pwvSUg0xdeG5A1BYo0bH9zTYTUnFc1tVWKYG5It9yu4vE7/Zm3ufpoMCRnMYDY4S3VZyXWjdaqKx2YLnrP0klPnNV74k/YqYooyhXXAh0GRRmzypE3s3136m8wx+nFLan79DLJd4bD0kQ+socx1sqDupZ/knYaId8BI+cJkJ9Pvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB3PR0402MB3721.eurprd04.prod.outlook.com (2603:10a6:8:7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Fri, 12 Mar
 2021 06:39:37 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 06:39:37 +0000
Subject: Re: [PATCH 2/9] clk: si5341: Wait for DEVICE_READY on startup
To:     Robert Hancock <robert.hancock@calian.com>,
        mturquette@baylibre.com, sboyd@kernel.org
CC:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210311222436.3826800-1-robert.hancock@calian.com>
 <20210311222436.3826800-3-robert.hancock@calian.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.b1dc66c0-d7df-44f1-9f1a-e729e77f49c2@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.b83fe2f2-a0e4-4df3-9cc5-fc8594d38aac@emailsignatures365.codetwo.com>
From:   Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <6ac7a45b-4e68-0c96-92a0-52ecdf2c97fc@topic.nl>
Date:   Fri, 12 Mar 2021 07:39:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210311222436.3826800-3-robert.hancock@calian.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM3PR05CA0101.eurprd05.prod.outlook.com
 (2603:10a6:207:1::27) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM3PR05CA0101.eurprd05.prod.outlook.com (2603:10a6:207:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18 via Frontend Transport; Fri, 12 Mar 2021 06:39:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3361ae63-27cc-4f11-3630-08d8e5219cd0
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3721:|VI1PR0401MB2270:
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2270755D0FFC492717F89F5A966F9@VI1PR0401MB2270.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ojER5D9mHzN2zNxREeSXJQ0AHBZw99GgQy1HDJ4ekNbW2cU/Jiz3PBTq0Zq8cZqW06F+BihMw5NXAELvF7snjSLmRkzN5Tk7cZHaiqKh+1mHg/B+ZC8djErCN5+zOSx7Vz/OAVBWyYJe6d/MIgFcbBlTtxE1pbSjcgS1e+WIgpPeIPQ0Sl4MSOvUZxEn+irpv+raWOv+SDtM7zMwuGJbEPzILUcPaBbsdG08oww1DAKElW1FCtZBIFiN0PLFtaIQJ3Ern49fBTZFMKiwyyc+XQXsiLvVRcBqsgZ8ttK4SYXPHa5Htx2eU+mcrdzh0uE25asaYThEt7R81UV+5tr7XSbIc1TegCklxW7TYx+0dJKspJFr46zgxi0yTMsc48tGITfHqK8Om5lIkKet9GEFBNglEgpb0At0t8+PPoiC0JFY8XKZAJVLHZso/6h5qcd2bMwjRoyNm9TvWBxDta6IJOj81CnMZ/MMeMciajl5oQXP3Sc1kinWHmXiVaGv5SdAf6A2TqlyA9TcywFnMrKsKfEV2qf7iXnS3zY5WKXzXIa5ouhUaufIFxS/cXvRbuYdeRA7QQv/a8Eyz1gfSS8K//od7snPydUXZdgjed95uBo=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(136003)(366004)(396003)(39830400003)(36756003)(31696002)(5660300002)(16576012)(2906002)(8676002)(52116002)(53546011)(4326008)(316002)(36916002)(42882007)(83380400001)(16526019)(31686004)(66476007)(66946007)(44832011)(8936002)(956004)(66556008)(6486002)(478600001)(83170400001)(2616005)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V0oybndocUxxNW92a2lhcmpCZ2IyQURqZWhvYUdaZFVUUXpXald5dmZaNENL?=
 =?utf-8?B?VFUxSEovTzZjcHpkU0VTdFlVRnRRd1pwWW5mT0s4ZDQwVnJoN3k1bkFGTGsv?=
 =?utf-8?B?aDFyWWlPOTZwNmRaQXRBUzFuWFBIT2o3dHJxektWU2ZUNkFhb212THFSbUJG?=
 =?utf-8?B?bll0OVk5bnRyOU1EeVJNaWd3NkNkU2J5SHgxTzdCNkRQRlRmdWhDUU5FamVj?=
 =?utf-8?B?dHJ4WHdDVS9maTRNQW1sTEVXRlBETm1xTmo3WkY1aWt1N2lqemxpRjdmNzFY?=
 =?utf-8?B?VThxRHJsRWprbmc1NG9HZVU4RVVadmhRWkJjdkdKYmxHT2lhSDkyd0lSTEdI?=
 =?utf-8?B?OHBybW1OUzN3Tm0vZ0FLRnNURHFOR2pQMkQxaTdhVHpGbWVPbFp0WEFkRHI3?=
 =?utf-8?B?RnJUOWhOY2IyOW5DK1F3RjJMdWx3eGs5ZTJsSU9jSU9EYXFzYXFNLzFGV3JC?=
 =?utf-8?B?V3ozVUQwU0hIVXlzY3JUOHNscFVydm93RnR3cFlmLzBHVnZiUGdDYVpBTXZp?=
 =?utf-8?B?ZW14YXY2RjZJTEpXeWdZak1zVFBxZUh2WXVuNWVWOXlvb2hST2ZHNHN1TzFx?=
 =?utf-8?B?Q1JvWEVzTElMQVhPN2phT0RjQkxjc3huSnQrNXY5RUhGTkl5NkVSQjJoUzFN?=
 =?utf-8?B?MGovVndua296ZllheWpqSkVyZTd4L3RhNWg0V2NoMVdQdFR5VWdRL2lTMDdJ?=
 =?utf-8?B?TzVJRkNZcktZQ29tR0hSellJRTZUb2cyZ2NWWGRqaFFqUG1VVWhEQURINldL?=
 =?utf-8?B?enRnUEVadWFjSmcrbnh2em90TGpqQ0YxZmNIcFpGb2xQb0NBUlgxRHQ2RlVz?=
 =?utf-8?B?ay9EK3JOVGk0Nk9tV05JTmFkSHpoUE14OGc1T3BrZklzZ1l6L01UQjloNXpX?=
 =?utf-8?B?dXRKZklZMnBJYjdMK1JqY2ZWRCthbHlRMDYwTHV3R3p4em96T1EwOXlmcmd5?=
 =?utf-8?B?ZHA4SllGeXVpRHk5NXBLYmx5WU9NRW5UWW1oaE5RZldWV1AycW9rNHlheUp1?=
 =?utf-8?B?S3Q5K3ZKOS91bitMbERhdHNkQkVPUmNCUDFlaS9MRndEaEMzaEF3RTZlcDdR?=
 =?utf-8?B?YmpyazVWYlYwaUo0N3R2cE9VK3ZLLzJlZlViZ3g1VW1CWmlmTGl6M2xjYUZI?=
 =?utf-8?B?Z1pRT0V2dnRidnhFbUtKa2tMb2JzRHpRY0g5YUd0bmtLUmg2dys2ZDFhazlt?=
 =?utf-8?B?WlF2Yi9RK3duWUtseEZWMWMyZGpMTmhVajdXcTluK1c4YjE5VktvUDBJclEy?=
 =?utf-8?B?RXZtVUYvUURMN0JYY0krdGNzd042ckkxcTBrRmp3VURpMUx1anNoQzhESUV3?=
 =?utf-8?B?S0Z6ZGlvQ2padEZZSm9Jb3VzbHZtd3phb2FIMldKeXZWaGtLTUZsdzV5M3RJ?=
 =?utf-8?B?U2Vvci96eVd5eG53R1h5NFN1QVpWTVkwTTRmZkRkN2ZKRmhEbDA4eFpHUEZ1?=
 =?utf-8?B?V1VpdWdPMEoxN3VGYVJDeEpnMW5wSWYrOGdYb2prcGk3dGxhSitvNW90aUxN?=
 =?utf-8?B?RitXbVlnNnFDM1IyM3d6aFgvT1BrZE85ZVNEZ2UyUHcwV2lSa3JLdFlBVXRr?=
 =?utf-8?B?c1BSQVJDM0pBS29MQXZqWXkvVW9PUVQxY2VTTHd5eXZHKzJvczV4UG94R1Fl?=
 =?utf-8?B?MmpDTEFLanp5aWI2c25YSkJWeUFnSCtDVVE2NDRSTVNNVGtRSkM1YVk2Qk5S?=
 =?utf-8?B?dUcxSDdRUjFCM05OUmVYaTJYNkNwZDM4Vng3RE5yMmFhcWxOMnN4MXFoanRj?=
 =?utf-8?Q?ATWdODEuBN6rPkhQ2+XNHJ8WW+PsVCv2W74izni?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3721
X-CodeTwo-MessageID: f72b9efa-39e3-455d-b774-a61ba7a8c56d.20210312063938@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR01FT005.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 453d7344-edb4-4baf-5159-08d8e5219b47
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rw2+naVc3Jjj9g8LTcfmSITlc8XZVNPf29zFR5afcWfPbtvmUAvjDZhzXBNaDP5KjKz2fuuinNB8NCZbJdigTXTTGf/RBE1VxAHFJd8Tel2nrA9rTznnoihZ218qvKqGt5cehu8E8KVT2xweds9+ZJyiAOJJPrqzPbTtgxsyBGqGBg+uTZWkimdZyskkIBGqZXvyFI998p2GRRSah7HiX8f/xckl6oH1LvKs0SlSkd3OcIWDRsLJI4Onbq72qh3xOKXio65bIGgADfn3q0n27EY3/b87HqB17uCNnn8TcuX5pi/grBywpAIx/BuOJlttaR9YGKfRk4QHXpWXDSYkDCpwf52Y1fu4dZH/nrBaRoVJE8X7V9A3L1dbAbDZhqMTr2UEIor79xEar1WQA3Xbv1cHUlCU34PtQLzgYrFGwJjKutivRGkXZTQWWtxfRkRsHlKd6Gsphi2Hxaq55hQTMSCBmwvK8hpk9CBKXH1H6/0rHyRMhysbx0njA0MkdFfgdrvOOj0uNsxtbqcKKxud3GXiHW1Sxz8l6YDrz1dz8iTWSylwDl3izp+XIB8kCPjNO7b0K4ihib1kU57bx2E9jJrS6fxc1OaO+ujRg/C0azF7bjApVK+PYHTaon03nKV4Z9R76jnvR2HQVna3GDl0SmX3gnDy4ethH4RfX9SBwxewfvBM/Nf/ByjDlVe3Yl51dEVPaF6LW8vKvQ2thtcgIAo8S+lWejIvdWp3aBt8HCPdwQDTJidKTjW7aMj6M7grpAO2I3dxaAN2yvtg3DLCaA==
X-Forefront-Antispam-Report: CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(39830400003)(346002)(136003)(396003)(376002)(46966006)(36840700001)(8676002)(8936002)(4326008)(15974865002)(44832011)(26005)(16576012)(356005)(42882007)(5660300002)(478600001)(47076005)(83380400001)(36916002)(83170400001)(336012)(186003)(82310400003)(31686004)(316002)(36860700001)(53546011)(956004)(6486002)(31696002)(70586007)(2616005)(7596003)(70206006)(2906002)(7636003)(36756003)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 06:39:39.8785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3361ae63-27cc-4f11-3630-08d8e5219cd0
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT005.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2270
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

One remark below.


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
W: www.topicproducts.com=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 11-03-2021 23:24, Robert Hancock wrote:
> The Si5341 datasheet warns that before accessing any other registers,
> including the PAGE register, we need to wait for the DEVICE_READY registe=
r
> to indicate the device is ready, or the process of the device loading its
> state from NVM can be corrupted. Wait for DEVICE_READY on startup before
> continuing initialization. This is done using a raw I2C register read
> prior to setting up regmap to avoid any potential unwanted automatic PAGE
> register accesses from regmap at this stage.
>
> Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>   drivers/clk/clk-si5341.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
> index e0446e66fa64..f210860fb96e 100644
> --- a/drivers/clk/clk-si5341.c
> +++ b/drivers/clk/clk-si5341.c
> @@ -94,6 +94,7 @@ struct clk_si5341_output_config {
>   #define SI5341_STATUS		0x000C
>   #define SI5341_SOFT_RST		0x001C
>   #define SI5341_IN_SEL		0x0021
> +#define SI5341_DEVICE_READY	0x00FE
>   #define SI5341_XAXB_CFG		0x090E
>   #define SI5341_IN_EN		0x0949
>   #define SI5341_INX_TO_PFD_EN	0x094A
> @@ -1189,6 +1190,31 @@ static const struct regmap_range_cfg si5341_regmap=
_ranges[] =3D {
>   	},
>   };
>  =20
> +static int si5341_wait_device_ready(struct i2c_client *client)
> +{
> +	int count;
> +
> +	/* Datasheet warns: Any attempt to read or write any register other
> +	 * than DEVICE_READY before DEVICE_READY reads as 0x0F may corrupt the
> +	 * NVM programming and may corrupt the register contents, as they are
> +	 * read from NVM. Note that this includes accesses to the PAGE register=
.
> +	 * Also: DEVICE_READY is available on every register page, so no page
> +	 * change is needed to read it.
> +	 * Do this outside regmap to avoid automatic PAGE register access.
> +	 */
> +	for (count =3D 0; count < 10; ++count) {
> +		s32 result =3D i2c_smbus_read_byte_data(client,
> +						      SI5341_DEVICE_READY);
> +		if (result < 0)
> +			return result;
> +		if (result =3D=3D 0x0F)
> +			return 0;
> +		usleep_range(1000, 20000);
> +	}
> +	dev_err(&client->dev, "timeout waiting for DEVICE_READY\n");

The "timeout" here is random between 10 and 200 milliseconds.

The datasheet says that the device may take 300ms to initialize, so I=20
guess 300 milliseconds would be a good timeout.

I'm also pretty sure there's a built-in kernel function to poll a=20
register with timeout that you should use here.


> +	return -EIO;
> +}
> +
>   static const struct regmap_config si5341_regmap_config =3D {
>   	.reg_bits =3D 8,
>   	.val_bits =3D 8,
> @@ -1385,6 +1411,11 @@ static int si5341_probe(struct i2c_client *client,
>  =20
>   	data->i2c_client =3D client;
>  =20
> +	/* Must be done before otherwise touching hardware */
> +	err =3D si5341_wait_device_ready(client);
> +	if (err)
> +		return err;
> +
>   	for (i =3D 0; i < SI5341_NUM_INPUTS; ++i) {
>   		input =3D devm_clk_get(&client->dev, si5341_input_clock_names[i]);
>   		if (IS_ERR(input)) {


--=20
Mike Looijmans

