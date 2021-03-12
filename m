Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB57BC433E0
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 06:45:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8CB464F80
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 06:45:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbhCLGpG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 01:45:06 -0500
Received: from mail-eopbgr60041.outbound.protection.outlook.com ([40.107.6.41]:49454
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231609AbhCLGog (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Mar 2021 01:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EProBeTwxqO89GRSGWdcpVUF7mkKvLwlvZ8C/iqjbzo=;
 b=WhcKTvyoumBSq39BqcnpyXFniqVMb2y7DUtVAcvHaU/2c7dFiMWGXxiCNSOOWBJ2N9MuVqI7puC8mlWSqMDiN07Ooa7seWMQqObbACu2SClDNgUfH5AicYaeRasc4mJuu1xpEm9vAlLS9TyZ85lv3hX+scAYq4rdImKm50HjdLk=
Received: from DU2PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:10:3b::10)
 by AM0PR04MB6275.eurprd04.prod.outlook.com (2603:10a6:208:147::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 06:44:33 +0000
Received: from DB5EUR01FT049.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::b4) by DU2PR04CA0005.outlook.office365.com
 (2603:10a6:10:3b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 06:44:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 DB5EUR01FT049.mail.protection.outlook.com (10.152.5.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 06:44:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.170) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 12 Mar 2021 06:44:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyFqSDxfkv1TtGuF99eqONlpsUpghDcmwm+87nH9YgJQs4vQMpsiUlCprIxcc9FTjalEq9r53b4fi3MT5+XFWpLbBZygH5F0sPWZNzP5AGnNAe5hgXC5QRccGSXLRMi7gfIlDCpKvTtPZKabnBaEQty2/x69bM8SyfrUU19B03pq1/9GPAJ7FrxwhAejFrysvQcHXY/2+l4QrYzWn6VAcwU/uGIpsczSfmn69Kc3mNVySCyi8ufqpyzU4PP2v2iRQ3hW71KvmyC7Jkc4gIleu38cyMJdTa7Fv0QVpbSgy2G9VnyvmJ+H1V8Ym65yh53aj1OhHInCs/6Z73UGwFiP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67I4YOVcEidrxYw3mVJt40F4toFHNm2nNyEEPn2BV40=;
 b=YIwpzTt2vtJJUfgkivGW3zxAdNSvlgTwTYUXxsdT6a/clszfFze3Q/eHfs0qjuXTD18oiNfz/ndHo+dQqQY1je6HpACXVYtktpVaf3+iPbAFIkcq0FyuAeD+luZyMazKavxy5ZgWdIu7kFEp2QdRrEtphWfBWJs40h7x+K3wlNzdAa4wvNHvdzlqiU6zVYkS7VYnTRAMEGehOE/ZjnTA+3Num/S8xGOJnPXTDSgPoXOo8zJdVdvI1lmOQ/kuri4c1xO+GVaS4+I3KVzb7WHYWlCvdZBCGpd21oaCWjBU0fMaqPritGias2A0zBC1s5RaBVIIcZcV2KUzyio+ZNdI3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DBAPR04MB7381.eurprd04.prod.outlook.com (2603:10a6:10:1a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 06:44:30 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 06:44:30 +0000
Subject: Re: [PATCH 8/9] clk: si5341: Add silabs,iovdd-33 property
To:     Robert Hancock <robert.hancock@calian.com>,
        mturquette@baylibre.com, sboyd@kernel.org
CC:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210311222436.3826800-1-robert.hancock@calian.com>
 <20210311222436.3826800-9-robert.hancock@calian.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.a5c64a18-101d-4705-9716-1c41c644d43a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.be185266-2f1c-4483-b746-841259f81420@emailsignatures365.codetwo.com>
From:   Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <81e8670c-d302-ff20-1767-4a6befe34a0e@topic.nl>
Date:   Fri, 12 Mar 2021 07:44:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210311222436.3826800-9-robert.hancock@calian.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR02CA0153.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::20) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR02CA0153.eurprd02.prod.outlook.com (2603:10a6:20b:28d::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 06:44:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8dbb443-6c9c-452f-cc71-08d8e5224b6b
X-MS-TrafficTypeDiagnostic: DBAPR04MB7381:|AM0PR04MB6275:
X-Microsoft-Antispam-PRVS: <AM0PR04MB627526DB4FAF5273DE77870F966F9@AM0PR04MB6275.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: hYVO+q+MEr0B3uWE8bf7tHIanId8REvz5nXNha+csymL/CW11Kb2eoTIQjkWACbwd3ubwqax+c95YWfNSF5l8NZcmzDI1on34IWLKl4X/bmvgr98ump+EYAtsRfNU5YfOAP13TEAr6LDZjzNhr7maBWMX4mHjghppxXLuGRAYLBn8YE7/UQBhWd51kwYCdjJeyzG6Z9GVl3Gm4oygzmKsymmmzLPIy2+eRJOqycpfD8FWPX38FxdhYYnaaJeqXrxMAOg05Rx5GDmsJjN8tDOy2fqHZflFMTO9Ier04WcgXvIO7smBQ0n2Yk9nhQ4POHQkud/dowHw31P52BH/Vzxf4T2r0JYuLriVorHtn/dF1c1HhTZE5FEm3ojrREL4D5WfwVu8OsI9cANgliO1hzZeFsiPgmssTYCYY2CgS79QiMbG1VUZ/j/JbgwrZXMm316/jkocqILV9bX5sRbiul2Rj5EAieuRsc5LzuMfoUbSo9Q++PFqgcVZUX0NJSNKPi2gVxCsCu9uq76LPMsjupBDSffX8guBMOMPD0H5NmiYw4ZdlpApm6qgB48f1KhQi3yOrip5LqpUKlgYNpGsCSYZcjs5sNqTl46rOmAJQKBf+s=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(396003)(136003)(366004)(376002)(346002)(8936002)(6486002)(2906002)(8676002)(478600001)(4326008)(2616005)(5660300002)(956004)(44832011)(36916002)(66556008)(186003)(26005)(53546011)(316002)(16526019)(66476007)(66946007)(31696002)(42882007)(52116002)(83170400001)(83380400001)(16576012)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MTJlaFVSVkNjN2hjbTc3S2RlYUhWNGdmcXF5ZGdZbXpPcGl0QXN5Ri9nQjgw?=
 =?utf-8?B?Q1FYeWZjMmJOMmY1TENIOHNkS0JNMXhleFpVUVBibXM2QTZHTGNjSzBzMkJ2?=
 =?utf-8?B?alFvekpYeU1sdzZaUjBNMzh2dEdwajNiMVUvVWJHRUJQUjJBaU8xaDBBRy9x?=
 =?utf-8?B?dUJ5OFdTUjlHRkdvV2xOM3JmWFl1MjA2UDJJZjdpbHk1WFA1VFJlL0ZYcUJT?=
 =?utf-8?B?RTFMK1NmdXB6UVdWT1JIR1NDSGVSbnhaa0xFQitFRUN2MjBIRGpkTzAxYks2?=
 =?utf-8?B?VWgrZWllTHluODV2alZ0aFVmbjRRQnRRVEJaYzl4Z3R0bXphYXBUZmlkc3hR?=
 =?utf-8?B?M04xRmp6TWk0ODFnaDByOEdmLzRuMFJNS2RkMXpmSmdmWG9ReGlaR1h0V2hP?=
 =?utf-8?B?akxPbjdibDBWR0FXeFhYWHZzRUhCTWk1T3Q1U25VQktBSUVnZktJSGpQU0ZQ?=
 =?utf-8?B?RU9uLzBJOHhYYmVkWSs2QkJzS3pzMWJQd3g5a3ZxZmhRL1hpRUdOOEc2SWpE?=
 =?utf-8?B?RFRjVklidXI4OTFGUVFTV3BZcEF1RndhMDBKTHlVWXE2V2M3SmNOVXhoK1RY?=
 =?utf-8?B?Nzg5SWwycE9LS3ZXY3UvSS81OXB0NDV4eCtKRlpoWkdJdjJBL3ZZMTYzNG94?=
 =?utf-8?B?UDd4b2dDSlJXTEMwaGk1eWRFMjdWVmw3UUIyS1ZTRzAveEQxa0ZORWxsb2dz?=
 =?utf-8?B?NmFFWlYveThsbGhPeDhnRGNMbS9vaW51NjdXWTI0MVlKLzdVTlo4TTkzNkRX?=
 =?utf-8?B?Rmt1aEt4Q3ZRUW1GcEVvQjRLVmlscHd2UEJTVTR4WTZxN2dscTNHa3NZVmNj?=
 =?utf-8?B?ejVxYkg1VXRSOTdUQ3lRdEt6TWdIZEhXSkYveUx5cGFEbk01cys2dFZjNlBQ?=
 =?utf-8?B?UE5sUVM0WmFYTHF2U3hTR2JaRmpxb2x5Uk9lN1NNRFdheGZtRzBWaHpoKytt?=
 =?utf-8?B?NnNUODJHZGVsQ0Q5dDlGRnQ2T0d5NU8zY0RHeDRYb0NtaVduUW8rM29XaU5z?=
 =?utf-8?B?QmQzL1ZNSGc0TkZiY3pFRTZrS2NIUnBsZWRxOTVtbHVPelJEaG9saktMaGR4?=
 =?utf-8?B?NkhibHYrSkNuMWNwa005ckcrNkFxWld5dGtEd0xzTjhlVEdja1QxOW5PaUhi?=
 =?utf-8?B?bGlBRHB4czE5MG53eEFVdUkzVjhLZ3VjZmtnNm1HcFFzTy9CMEhzYUU4Mk1l?=
 =?utf-8?B?a25mSStTN0Z4N0ZlUWZ2WTF2eWlNOTloWlFrZEl1UXJzU3V2ajBwSC9HV0Nm?=
 =?utf-8?B?UlU5Z1VmQXNMRkZNTDFzRjFKZVQ3eGV1RnAvN0Vrc3BIM2h2VEQ2V3BWQmo5?=
 =?utf-8?B?WnV1ZFBPT1JQTTNaL1NLNW5wa2M0VVYxeFFNZTFldXlSSFdUVmJFblRxU0Nx?=
 =?utf-8?B?VE1CNnpEbnJrWjU1cXZSTExnUjdMVjhhdktyVEI5cWJ3aGx3Z1JKcm00eTFp?=
 =?utf-8?B?Q2ppRnJVNkovS3crdkcrVlh5TFllVW15SUFhQk9QdytTVTk5RVhvUXRwMndR?=
 =?utf-8?B?V0RoNUN2NThBMnFNNXhxVVZjMTRxUDVTeElzSEZid05aaDRCRjVIMTk4ZWdy?=
 =?utf-8?B?dU9uQWdPR1RDMG4vT0Iva0VsK0YzNkg5c3lGdzE5UmhYRGh1ZEVLVkNHN0FQ?=
 =?utf-8?B?NmxIRFZwNnRGaDdlRmlGQXFYeis3N2ZDa0tBS0ttV3ZYSUp3Ulcrb2QvTEN2?=
 =?utf-8?B?SGViVkNpN2R5T2pRSytHbVMvUGYrbHE0U05BdS9GTDhjWG8yQ2g0YUlNZFV1?=
 =?utf-8?Q?mzQrrz22Opcg/w0+3jvq7NeldjynS3CKFxieCEK?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7381
X-CodeTwo-MessageID: f6cb98bd-b84b-4e03-bf26-bd3792608017.20210312064431@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR01FT049.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1d5cec86-d68b-4863-1f23-08d8e52249cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HlDeurT0al52iNhwJQOqOzyDnJrbSKpgP9E8TASoy76o/kCstW6SMT4OwdANGVFL9ewHkOpaznnsDm/h8bK6CZfnZkGibiwGW8+p+hDt5OsMKeT58KMvKKphPE2vT/RmXOFOmT6K3Ir2CMTfiCdUGEtMVtmGaB2UlSPmvw48pUF+mhpoKI9BGvqiz8dhWABYq2dV1nsd+BF9xXNKc3x2Qt4J5W8v3yngdHz4tpPVAODAIXUa1RlHrzRDYZkbqgAG9VAiwK31/4FgHpXcJT/hv8X3iOnDAhzgV7Mi70yh1iAj3Tt5LmOhpvolADfLm3UsJ9gIHF/IuQbhjnR+zi20QQVdUvUHeOXnNAbzHxB4Y5agyopcOowf0spDSv5MmZV8FMlbR13O7QIXm51dFDeZDVlJd1P064dsJw0G5xO/4f2zfDHvVb9Jb2JBKnOuwKX+9naWzwl1v2k5AEtbToW09GZoWXiIK7C5nQQf2R+uvckl8dSjCeKGcnVi+Ehlq+rnDew4MyivsqHwfBf0e93qTuUnnk1mJcSwu+B3uNpQaam6kWdtkRX8Q2RX1qlEWBknkfXi22nyV7ckO9N1DiL8UqNCrlewEcXLk5YNhAXvY3CNfH+IJrR5PxZcVtxLBzgeDDeVuHI8I5xKWAgD/HQRV9XJ68WUpO+Uizr4elLIJWphlL7zbOSdtIbb4yV1cwolk2faqmNTVHSYzqYBZUaplO/Jfw34lOqAiNYKt3wKcmZ0WL3YGTShK+EhH1C2/PSDBQkWHPsuN/B4QbP5DL/wGw==
X-Forefront-Antispam-Report: CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(39830400003)(396003)(376002)(136003)(346002)(46966006)(36840700001)(7636003)(7596003)(16526019)(336012)(2906002)(42882007)(70206006)(15974865002)(31696002)(5660300002)(70586007)(36860700001)(316002)(83380400001)(2616005)(31686004)(26005)(956004)(478600001)(8676002)(36756003)(186003)(36916002)(83170400001)(4326008)(356005)(8936002)(16576012)(6486002)(47076005)(82310400003)(44832011)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 06:44:32.8780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8dbb443-6c9c-452f-cc71-08d8e5224b6b
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT049.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6275
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
> Add a property to allow specifying that the external I2C IO pins are usin=
g
> 3.3V voltage thresholds rather than 1.8V.
>
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>   drivers/clk/clk-si5341.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
> index 11740855bcde..4cd80ef389d2 100644
> --- a/drivers/clk/clk-si5341.c
> +++ b/drivers/clk/clk-si5341.c
> @@ -81,6 +81,7 @@ struct clk_si5341 {
>   	u8 num_synth;
>   	u16 chip_id;
>   	bool xaxb_ext_clk;
> +	bool iovdd_33;
>   };
>   #define to_clk_si5341(_hw)	container_of(_hw, struct clk_si5341, hw)
>  =20
> @@ -103,6 +104,7 @@ struct clk_si5341_output_config {
>   #define SI5341_IN_SEL		0x0021
>   #define SI5341_DEVICE_READY	0x00FE
>   #define SI5341_XAXB_CFG		0x090E
> +#define SI5341_IO_VDD_SEL	0x0943
>   #define SI5341_IN_EN		0x0949
>   #define SI5341_INX_TO_PFD_EN	0x094A
>  =20
> @@ -351,7 +353,6 @@ static const struct si5341_reg_default si5341_reg_def=
aults[] =3D {
>   	{ 0x0804, 0x00 }, /* Not in datasheet */
>   	{ 0x090E, 0x02 }, /* XAXB_EXTCLK_EN=3D0 XAXB_PDNB=3D1 (use XTAL) */
>   	{ 0x091C, 0x04 }, /* ZDM_EN=3D4 (Normal mode) */
> -	{ 0x0943, 0x00 }, /* IO_VDD_SEL=3D0 (0=3D1v8, use 1=3D3v3) */
>   	{ 0x0949, 0x00 }, /* IN_EN (disable input clocks) */
>   	{ 0x094A, 0x00 }, /* INx_TO_PFD_EN (disabled) */
>   	{ 0x0A02, 0x00 }, /* Not in datasheet */
> @@ -1160,6 +1161,11 @@ static int si5341_finalize_defaults(struct clk_si5=
341 *data)
>   	int res;
>   	u32 revision;
>  =20
> +	res =3D regmap_write(data->regmap, SI5341_IO_VDD_SEL,
> +			   data->iovdd_33 ? 1 : 0);
> +	if (res < 0)
> +		return res;
> +
>   	res =3D regmap_read(data->regmap, SI5341_DEVICE_REV, &revision);
>   	if (res < 0)
>   		return res;
> @@ -1565,6 +1571,8 @@ static int si5341_probe(struct i2c_client *client,
>   	}
>   	data->xaxb_ext_clk =3D of_property_read_bool(client->dev.of_node,
>   						   "silabs,xaxb-ext-clk");
> +	data->iovdd_33 =3D of_property_read_bool(client->dev.of_node,
> +					       "silabs,iovdd-33");
>  =20

Seems a waste to me to store this in the 'data' object forever while it=20
is to be used only once during init and never again after that.


>   	if (initialization_required) {
>   		/* Populate the regmap cache in preparation for "cache only" */


--=20
Mike Looijmans

