Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B51C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 06:48:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CEF164F7E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 06:48:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbhCLGsT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 01:48:19 -0500
Received: from mail-eopbgr80043.outbound.protection.outlook.com ([40.107.8.43]:1447
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231436AbhCLGsB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Mar 2021 01:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktH4NlVln/4l6Ri06J8mm1ijKagf+9MZAUMAhCdiQGo=;
 b=mGW03wUB0aW2L8ixBVH0RAzRizz+zpfN0rWmU5tkID6/3F+hPtoDl0hSGpMWFml7LM6xJRokoYQYXUJ9sQZxmxmaxM8NDOTmzZcziHEhI02ohrxMPctb7LPDW0l8Id3MKSCjc21dDTxaJaEfEoiDptPwCxZMpXBpoz4goZs4x2w=
Received: from AM6P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::37)
 by AM5PR0401MB2545.eurprd04.prod.outlook.com (2603:10a6:203:2e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Fri, 12 Mar
 2021 06:47:58 +0000
Received: from VE1EUR01FT035.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::e2) by AM6P195CA0024.outlook.office365.com
 (2603:10a6:209:81::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 06:47:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 VE1EUR01FT035.mail.protection.outlook.com (10.152.2.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 06:47:57 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (104.47.4.55) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 12 Mar 2021 06:47:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2AHpib679rDNPCcaMVYLZA36AsiyhURCPigFajFRNmIVOCxBrtG/jgjG1w29UpbCovIkxTbF6P1Glg0gZk7YASD6zVLqCkwrot5yfMffpQ/+zZJXR6vy2+TY7BjMWC1fQ4C+P3ymr79ncoygckfsWzYA7CrG3haoUjZ7DzmDXJfhdF6tTL2gXaxD1EM2wPVfMouCKCes0scxtTh2ZK0TVEvU1pdRtdOk90kKmjiQ4zmDLV9Zj10TGZ7kCskPzVMPrxbBDQzmq9dB9agyexIVmdDcqG7ioAOvmx5syHlZq/RpnSsZr58CfRyZ2mk51ltLkV2MBxqaNeUxKSsHi7uNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iN+/9haAxookgWUzamZBrkU/TLMwGOr6fMx3XLUjDF0=;
 b=lP0LbfNkk/Fa7JRCbcwQ4VMApi2SWv33owhHtqRqzY5uZQJw90qOYs1qh4c4dQTM+AipQb8hCRN3T4taHf1RHx01cU6cCdQWbuPpgzBoozbIBvULvNiuZLhWt0hweZSJDKnVrqyLHJgPOrg1zAingX547Rb3hPKGnDGtTUGLP5yrs7d+pZ4VtSu28oEGvb5r26PqP2vRU5K5rsnWK3erT3XXlCPb1yxSLYNiTFBcKmgMLJ1o5yrrzZlIw+ce5uFUWHyAFNwWMvl6qGAKEd2ZfMjdc3dMShnGhR+TJk/RsnYmJdmqQ0l36NGRmTMt3b2cHmsP2vNbds0VcGm0uJOQig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 06:47:54 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 06:47:54 +0000
Subject: Re: [PATCH 4/9] clk: si5341: Check for input clock presence and PLL
 lock on startup
To:     Robert Hancock <robert.hancock@calian.com>,
        mturquette@baylibre.com, sboyd@kernel.org
CC:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210311222436.3826800-1-robert.hancock@calian.com>
 <20210311222436.3826800-5-robert.hancock@calian.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.9334a909-9494-43d0-954a-ed0ddcbb7b5d@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.65c76637-8114-4fae-8c6a-53980ec7e70b@emailsignatures365.codetwo.com>
From:   Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <4e81437e-da75-bc76-2b5b-4b7c78ba927a@topic.nl>
Date:   Fri, 12 Mar 2021 07:47:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210311222436.3826800-5-robert.hancock@calian.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:208:122::22) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR04CA0009.eurprd04.prod.outlook.com (2603:10a6:208:122::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 06:47:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43e30558-1a73-4af1-da6c-08d8e522c58d
X-MS-TrafficTypeDiagnostic: DB8PR04MB6523:|AM5PR0401MB2545:
X-Microsoft-Antispam-PRVS: <AM5PR0401MB254593A467FE48D22593F658966F9@AM5PR0401MB2545.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: iY/XY8DbPamcml/ddN9J/lfFRXXmwPJm+eg/XjwOrce6CoVezR+GyhECvIP8pue2ttM8DyevFZR9l1DNqM6NCKxod8s7y5uz8oHLL1PxeLBmnQdN4FJx9GQ4jq9QBxdlNH37U+QPBike82gT9sAVBJm888yw8gCXlvjdQP55e6Y+s21eVWFb96GIY2vZaJ1FJ3Ich1ls8Iq/Jy00FXBLOyVe7OALMkkgI+pElg2sBI1VqCFJB0VdIsd1YIi8Nf8RGlsFTkist08q3pkzzxbm0q2bCDXX4SHp+AXYuIuljCEMF6ix505hHkwloV+tJk1/vA1QJZCM/9irVaHTupUpl5j3AAQ3ejxFKxLG4k7c0eYg9Ckpx5nYEMySTWionxLgWZS3a1BQse0HDmVvieo07qGAYSAMH1sEixLAMDgApaKdonqwDAcRkYBfbaXmUrsi0jX7aeDNstVKUH3shtiYgCWn+idnDCr2nCRcGthOZ1x36BR5o8AjKpxyfBuR/DsJWLEejnw1HF1XVS6gF2LB4KaUtDIVJNMMil8rBtVIB0E2p+LqXwnRMpR++IXZ80cISl3lU6smwv2SbR0cx3cuQyUmGH8lfMfmRBE3919C1ZVjmWsdPL2GDkkLLH05nHdMkqFHZtaMDQLzESN6KBPC0A==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(346002)(366004)(396003)(136003)(376002)(36916002)(52116002)(66946007)(66556008)(53546011)(83380400001)(66476007)(16526019)(186003)(956004)(31696002)(42882007)(316002)(8676002)(44832011)(4326008)(478600001)(5660300002)(16576012)(2616005)(6486002)(36756003)(31686004)(8936002)(83170400001)(26005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V3NtT1I0c3NJTDFzWEZFQzFGNkJieHNLUXlWUXcvRE1Ec2U4dXJmTytwbTUz?=
 =?utf-8?B?aDZJcG9KdkpoWSs3SnM1Z0pHcW4rNEtHd0pRWmRaZVhFSExHM1RrY0ZmYjMw?=
 =?utf-8?B?Y1NwakNvQTRZU01DMjlST1dlZS8ya1VvZ2txOUp3RnVQY1MxVTJacjFLR1Q3?=
 =?utf-8?B?dG1kTEVUQ0FUTGxCNnRZNFY3SHplWlloZm1Ua3lOWnZjVC9SZjcvbklTSity?=
 =?utf-8?B?cEY3UHZTZzMzVkQvV0YrZHJUY3BjSHFqakdHRXZUNGhneGl4WUdPOEpYcTFy?=
 =?utf-8?B?NElIRFdpQVJaaFRDUEtvOEJaSU95Sm43WHkxZGMyQklZdkRzdjI2bGZ5c0o5?=
 =?utf-8?B?cGdPSG1aeDhDbWg5eFQ0eDUyV0ZEeTYxZ0pWbGJsK3lXUkloRE1wUWF3KzNx?=
 =?utf-8?B?VWFvS2JrcllLYnFac1kyTlFLQmRRR0ZDZkdtSTk2dUJVN3podUVBTGNPelFX?=
 =?utf-8?B?R2pFNTZEakpDUEpVbHI4Rm4ybUphNkZTY2tFUVB2UWtJZzRid2tmZk41RjRJ?=
 =?utf-8?B?M0tRTjg5cVZ2UGdPbm5KRldDdnNPcmV2TEZZWTBvc3RONkJmNUs1aEdqbEVG?=
 =?utf-8?B?VDdpYjBmb0JxVTN2UVlUaE9ReWRreFZreTFacmhTckwyc2JOZzJ3VzlDNllu?=
 =?utf-8?B?TXV4SUV5ZVFyaWc4RUtKMDFaUjZaZGowc0hqbUhPZTVYTFZaTFU4WlRiUFpy?=
 =?utf-8?B?azZ0bDdqcThHNU55TE5KaVJhNGJYZ3FMM29MNWVLaUpwQzE2aHlKNXV2SGtY?=
 =?utf-8?B?d01yQklnTzArNFhRRUZMUk52ZHo3MjlBUTBueG5NcUZkTTZ1ZVdvVHBlUGl0?=
 =?utf-8?B?L0ZxZXVUSVFOZ3ZjZHhEbmJ2WW5LMFdiRXQrekpiMEVuUTR4QjYzQ01yYURm?=
 =?utf-8?B?OTM2MGRuZGdhT0s0SzFueHR6UDA1RlluYVgxaE9mZkhMSnpiNUxOWmxPZEZp?=
 =?utf-8?B?Ty8xY0ZUcEVMUE01K2ZtYlZXVDNzQld6bjNmSTRVK2dzYVV4aFFaMUZiTTZt?=
 =?utf-8?B?bFVrZEtSbXhYQjFNSjdPdEROTm1Sd3gwa05Oc2FvREZWcU5IM0dyUXNjMUEy?=
 =?utf-8?B?ZzRIM1ZsaDZNZXUxZkVrdFFYcjAzMXB1WUV1b2lZNHg4eW9wTm1YS3dXQk1R?=
 =?utf-8?B?RjVDSTliZkFwY2R1aHNSTFY3U2VrTm8xWEJWQm9WVmN6R3BwMnkvV05uUEZX?=
 =?utf-8?B?MjlRMGZnSlFsR3FIaDFOQlNnYkNUbjZ5ZDdTbmFGanNLbW5LTEJWVFRma1pE?=
 =?utf-8?B?TW5PMnd4c09RRGhPSlRDUHpYMzN5QVNBT0dmc0dEMjE4Ym8wZ0tJYnIvYjkz?=
 =?utf-8?B?dlkvaEtabytlbzBiak55bVBJOHc1V2YrYWdpRm9tR2xTczU1NGFScU80S1hq?=
 =?utf-8?B?VGdNeit2Mjd2UHFZektPMUlzdEZ4bXBLaUZ5OWovbzhldk9iVWZOcWZtc3Fq?=
 =?utf-8?B?Mk4zSnVzWW5ZVlNPNTFJY1BGL0NwSEwvcWIwdG5ZVENSdExWRndjRGdNTnkx?=
 =?utf-8?B?bVNEaEs0T1hQa0FoY2VUaGVscDl5L2FqSXdYQ1RxQVNaMjZtTEN0U1ZmT0Vw?=
 =?utf-8?B?Q205bU9zTGdqSDB0dVgreXdEaFgvbVFYajFteER2cElxOFRwenVRb0FUQytR?=
 =?utf-8?B?c3F6RTZCb2hRRGdyWlZiN1hNSnk5UFRaQm9MMVBNNjdFSXp3ZE9MWjZmYVhu?=
 =?utf-8?B?TmlyZW5rbHFrRHpNYWNaby83V0lZa2N4VEFpVlpnMU5rU3Q5YjZRZFlPdXc3?=
 =?utf-8?Q?LR69AhxSCdvmWMApfzEk/Jf2MvG13C2jbnvNv4a?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6523
X-CodeTwo-MessageID: 1b05c483-f50e-47e7-bf79-634fd4676d78.20210312064756@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR01FT035.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 516622d3-8a4b-4f9c-8c3d-08d8e522c3a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xaUW2XDvS0wRpO6N7hcOEF5ObD360IXtTsWXr/k2Q7B9wPxDCN+3KeKo4PaY7zT0rKljt87vCKmNb1cUA/qFGstgFeRppfYa6ARN2xL3CX9CG4E/9GnlGAGGkpZe22qevfDuO5s8CxL61ZqqkSHH9jBrgCc/epNHYpmq+BLhLKFXVzoRSoikrxgyUzBtk2f6EyWt+r56QwWytbpTheuC7crxYkbOyKQiyomWpXyHb8SDGEyllwmx/qkj6jMcxtAmUovaTrs2tEiXZh87Sx6tQncRw8NikwLy4puYc+xC/gqLQKpIz8AgMNLzZf7QF6WuQphyB5zfi74kDLuR5MJtqBATrl48UroOQcq9LWEWG6YPBCxFcONaFxYff4oH4QQ00YWCxS2Z5n7t8JdXisBiv2FZWp7XaGAafjAOLyZUOrVhIfK9qGAsVytKMBGlurZI1NO6M3ziKfPtvI3GCTSeCg/QRHn1RhslKZqLxHy0TOiw8I714KSD4lZZTE5e0kqzM3RN70jlCGD4LulfNc5XCzTmGE7eRSKaaoMXezjM62WDUlhcNFzPs9FzOAg4Moc2bZ7aXANCJBo/UbjOiSRFpbzPh7vhqngJLoEQQ0iE1RtcYOgLfFz/teFQXL2OjPUzhabo/DF4a/+FRC/EjEvqHWMDm+1O2IU1u6ASeX1hzqmoDEMmvZF3iyU3vRDLZEep3cqaegLFaHsfQC+KdvlwVrlePYqGd9OnwCSqKQe85fLjZZVRfh1KdEV0b8vpJ4TEaj81MXJsefLnB8a5gCNeZw==
X-Forefront-Antispam-Report: CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(39830400003)(136003)(346002)(376002)(396003)(36840700001)(46966006)(15974865002)(7636003)(478600001)(36916002)(2906002)(4326008)(5660300002)(356005)(82310400003)(83380400001)(7596003)(83170400001)(36860700001)(47076005)(31696002)(2616005)(8676002)(16526019)(6486002)(53546011)(26005)(956004)(186003)(36756003)(8936002)(44832011)(42882007)(316002)(336012)(31686004)(70206006)(70586007)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 06:47:57.7494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e30558-1a73-4af1-da6c-08d8e522c58d
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT035.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2545
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


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
> After initializing the device, allow sufficient time for the PLL to lock
> (if we reconfigured it) and verify that the input clock is present and th=
e
> PLL has locked before declaring success.
>
> Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>   drivers/clk/clk-si5341.c | 46 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
>
> diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
> index 2d69b2144acf..5221e431f6cb 100644
> --- a/drivers/clk/clk-si5341.c
> +++ b/drivers/clk/clk-si5341.c
> @@ -92,6 +92,9 @@ struct clk_si5341_output_config {
>   #define SI5341_PN_BASE		0x0002
>   #define SI5341_DEVICE_REV	0x0005
>   #define SI5341_STATUS		0x000C
> +#define SI5341_LOS		0x000D
> +#define SI5341_STATUS_STICKY	0x0011
> +#define SI5341_LOS_STICKY	0x0012
>   #define SI5341_SOFT_RST		0x001C
>   #define SI5341_IN_SEL		0x0021
>   #define SI5341_DEVICE_READY	0x00FE
> @@ -99,6 +102,12 @@ struct clk_si5341_output_config {
>   #define SI5341_IN_EN		0x0949
>   #define SI5341_INX_TO_PFD_EN	0x094A
>  =20
> +/* Status bits */
> +#define SI5341_STATUS_SYSINCAL	BIT(0)
> +#define SI5341_STATUS_LOSXAXB	BIT(1)
> +#define SI5341_STATUS_LOSREF	BIT(2)
> +#define SI5341_STATUS_LOL	BIT(3)
> +
>   /* Input selection */
>   #define SI5341_IN_SEL_MASK	0x06
>   #define SI5341_IN_SEL_SHIFT	1
> @@ -1403,6 +1412,29 @@ static int si5341_clk_select_active_input(struct c=
lk_si5341 *data)
>   	return res;
>   }
>  =20
> +static int si5341_check_healthy(struct clk_si5341 *data)
> +{
> +	u32 status;
> +	int res =3D regmap_read(data->regmap, SI5341_STATUS, &status);
> +
> +	if (res < 0) {
> +		dev_err(&data->i2c_client->dev, "failed to read status\n");
> +		return res;
> +	}
> +
> +	if ((status & SI5341_STATUS_LOSREF)) {
> +		dev_err(&data->i2c_client->dev, "input clock not present\n");
> +		return -EIO;
> +	}
> +
> +	if ((status & SI5341_STATUS_LOL)) {
> +		dev_err(&data->i2c_client->dev, "PLL not locked\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>   static int si5341_probe(struct i2c_client *client,
>   		const struct i2c_device_id *id)
>   {
> @@ -1580,6 +1612,20 @@ static int si5341_probe(struct i2c_client *client,
>   		err =3D si5341_finalize_defaults(data);
>   		if (err < 0)
>   			return err;
> +
> +		/* allow time for PLL to lock */
> +		msleep(250);

Can't this be a poll loop with timeout? Seems rather harsh to just sleep=20
here.

> +	}
> +
> +	err =3D si5341_check_healthy(data);
> +	if (err)
> +		return err;
> +
> +	/* clear sticky alarm bits from initialization */
> +	err =3D regmap_write(data->regmap, SI5341_STATUS_STICKY, 0);
> +	if (err) {
> +		dev_err(&client->dev, "unable to clear sticky status\n");
> +		return err;
>   	}
>  =20
>   	/* Free the names, clk framework makes copies */


--=20
Mike Looijmans

