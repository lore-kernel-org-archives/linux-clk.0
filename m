Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E0CC433FE
	for <linux-clk@archiver.kernel.org>; Sun,  9 Oct 2022 03:11:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiJIDLd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 8 Oct 2022 23:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiJIDLc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 8 Oct 2022 23:11:32 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00057.outbound.protection.outlook.com [40.107.0.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC0F275E8
        for <linux-clk@vger.kernel.org>; Sat,  8 Oct 2022 20:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hw26qXC4NrWv9jldKh87H0Q/LomtEzsH7jZCX7U6HZcRD/m0RDVaUqvS7S8/fGSmSWwVqOC1rj0S6kt9WjnhSzTcMRBhqdSddxORky6v0ZsqihoIn1KqboEJ9GnaMYPa6kG0NYlqxyn3KpBELjcJSB7a4FtngNI9b/vfoewA/w03xMocLeV3IyIsf4PfX9m2z0DkXYbSUaB8u5GHMoUlUKbAUnqke5EN3enSRrUIbmSyx/kVb5QH2Aa49TVjp1ad7hQnJeGAMXwUbvN+VvR6NBE8lW2qQoGRSiys+6iIGQUTHix8poOaVivPiW404Izc8xR4pRyLrJNFfXrmHjFNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaNddpdSTUrRt8tYw5QSRNDSZKeVcdFUME8Kr862Ggw=;
 b=YhtaLw8tF129VCUdgaLa/8WJ8LMyySlaUWzXpexIyb8iGied9I8Un+h45ZJmGv4T/Jo3yj2piFiOMBaJqHUbg4okFwnqi7rTwMMgSd8Ud0+IzIaNcStd34GfFZSt7pESEW/+xiRyme8RkSiP+5EKrfozLzfWFQTbHOeTQMbaIYrn/u+9cutvkwfoshUNgkYKBuyMP1rZxxo4Y/l7fBdiYqiDTb8Nom/wvFpHkFsDQWtfJqQZOBGeAi0miIAtTRD8XF5tS9yWTlLbUi3myeHMQpf30PO2AxWXACZC2msU3UqQm9SkBhfvcHrw+iNuS1N9FZZbapDPkwZOiY0w1NeAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaNddpdSTUrRt8tYw5QSRNDSZKeVcdFUME8Kr862Ggw=;
 b=h36r4iH3W5AwubonIjTkkMskr4QNtKmmVmbENAKJufk5a9OyRJ/XMunIJHX070ciIB/puWG3Rd4kA1Ya6D5FOWz/rKZR36BDZktOGq4x10w89DedbaIoudsjCwVFdQwLBKLDOB3xHHAcJSfRD8TcJNvyV3PA7qwsbu9p/qSxiIk=
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 PAXPR04MB9220.eurprd04.prod.outlook.com (2603:10a6:102:228::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.35; Sun, 9 Oct
 2022 03:11:27 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::4cee:c7ba:1bbf:1c27]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::4cee:c7ba:1bbf:1c27%3]) with mapi id 15.20.5709.015; Sun, 9 Oct 2022
 03:11:27 +0000
From:   Bough Chen <haibo.chen@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     "festevam@gmail.com" <festevam@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH] clk: imx93: correct the flexspi1 clock setting
Thread-Topic: [PATCH] clk: imx93: correct the flexspi1 clock setting
Thread-Index: AQHY1JTxS5k1eb0IK0SdMd2NcKyEUa34gLiAgAzu/oA=
Date:   Sun, 9 Oct 2022 03:11:27 +0000
Message-ID: <DB7PR04MB401095BED506CBC8C46BF36C90219@DB7PR04MB4010.eurprd04.prod.outlook.com>
References: <1664517759-19807-1-git-send-email-haibo.chen@nxp.com>
 <20220930213817.04366C433D6@smtp.kernel.org>
In-Reply-To: <20220930213817.04366C433D6@smtp.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4010:EE_|PAXPR04MB9220:EE_
x-ms-office365-filtering-correlation-id: dc6fdc04-18bf-433e-4e36-08daa9a3f497
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3m+MQQND73mUvSzys3L57RVkA5tnEAGvF4GcoYvgA3MoFWMjLMWb85mMHOe8BDSfjKFx6awLn9ClYQvc8R2kX9XVaqIyu6JDitKLKK4OX3/yvRnbR8J2bP6KqzuY47S2+CvuKyjO/D2AAbrV5YnkeJHz4fUgaL82q4CkFdqMiEYX6LVDQVrcRSgzK8Ce5xEdoR3Q/f1Kk0g0Q8cx+DjvLW3wztK/iadwMhB51jrikcEdTtAV0CgjvoqbscnFH2ffrQPkcngiQow1iaLQWlLLb7eiaPxMem4aiYVJuPLc9C+s7PrW7k9BZqgge5hl7X/oN9GsSvPR4ctuSTXnXgoPryc1hcWDXZgUoBLj6lPid2Ac3CgMtoYo9ggjzvKG8GlILwku+xoNcmZtFGYb68fWGMKE0tn9ehVuNn4elNSdeUy/0b0P7KfHuDSsUCY+OOIPZ0QkJOYlhF34MlSlQ/3X2xDQqZivoT85SMHVw/BBByLva7O1/5fJFabdcV/nFuyFJ6S2S1lZ5bRUFg9KXOe83bRxf8fksd35mp1Q7akDs5Pco8XH/W88lGx8iC9Al1iasV3gG6RXg9UT90J42FXwPCHOPZnW+zL/PTNqt4eOSLcVTZA7clwGtpm9KlBAFJOXiFbPRcjsjHC3mJdHrIQBxBt7x5vJ8UvNtxuP9GgNx99iNjtqI/YszUOrNklGhGgAb/vOKO2ycdy0Ry2lUno3AbxxuC6Ttt4pXwT6cIV/d0+pwtdrqR3ogQk6NJXhFTJgp/kKaE3ScL0IR/0oJEZw2Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199015)(9686003)(53546011)(55016003)(7696005)(186003)(4744005)(52536014)(478600001)(2906002)(83380400001)(8936002)(66946007)(5660300002)(66556008)(76116006)(71200400001)(64756008)(316002)(8676002)(110136005)(66446008)(54906003)(66476007)(4326008)(6506007)(41300700001)(38070700005)(86362001)(26005)(38100700002)(122000001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXRZM2JDek1UNUJLUnRUenAyWm15Yk1SSU1QUDNtdHZSNUZZcDVQWW1TZ28z?=
 =?utf-8?B?bEtISjFPcTFJM28zeXd5UCtkS0ppZWZUVUhsTi9yWTRMcEJSVzFJOWtqaDdk?=
 =?utf-8?B?VWl1Vmozam1NaXkxTmpKaXFYMktPaDZsdzNmTWQremNMcFU1dlAwQTFEV2lj?=
 =?utf-8?B?cGZXNFgrQWRIWEMvYlB2c2pjai9pWDRUOTRDbC9XSVNndlQxcnBmaTJmVThW?=
 =?utf-8?B?TUZZODNPK2lwYlc2S3pKZU1tSHFsc0xXRGw4SkdDYUF5dmFaRjROcDRQMUtE?=
 =?utf-8?B?RGlSLzNNa3FlcTA4NVZsQzhFQk5iakN0K3JTaERKbEoxZWVFZ0UwZE5qREZv?=
 =?utf-8?B?WjFKMUJ1YjBmZmJjVVJIbGZlS3FMTnQzcjY1dU1xYkQrWkt4WWllSitaUkll?=
 =?utf-8?B?YUNnTGgzK2FhWDhWdjF6WVZyd25QdTZ1c1N6dmdFYjdxbGNjTTFkSDBhK05k?=
 =?utf-8?B?YVpzeHpRdEp3RzZiSnMvUzA5aHQwQjEwNFhtZC9xZVlkV3AyVzBNSjQ0REx0?=
 =?utf-8?B?U0dZcThDVUpCdWd3dERCSUZNVGhVZTF6TFFrVmxJalY0UnRsRTJrbHFOeUts?=
 =?utf-8?B?aEhIbE1XZUpMaDIrMEVGbXV0N0ZHam9TbkM0Uk01bTNyM095NFh0RlpxVERy?=
 =?utf-8?B?OXo2YXBSQlVpcHQwMUpBU0RwRCtRYisyWXFJRWluUHpYNVJSTGtzMU9sNHpC?=
 =?utf-8?B?eTQwRnZpWit0d202MUZ1SUQzcEluOGluZlFNWXJ2MURGL09TOS9WSldiL242?=
 =?utf-8?B?Y0taSU1xZ0wwc09oMGo4S2s1UFQ2YzBuNXVTdGlhclVWRFZnTUhEQU91M0h6?=
 =?utf-8?B?WWNORVQ0RTlTcHAxSC9XZzhRZ0F5amZURlBIRTA5ODdtbXN4Rkl3TndRVEF2?=
 =?utf-8?B?WFJlVHVjV1FQSFlhZ2dmNEFXYUFwVUY4V21mU1d6UlBLTFVSQVpPcFdEbWRa?=
 =?utf-8?B?Q1JZV21Yamh5Z3liQUUwODdRd3lzVGRpZ1M4YVFIYkc4WENjRHc5RnNlL1BH?=
 =?utf-8?B?a29SMjBaSkY1VlVKS0NhT1MwSGN6SndGOHkyQVRCNlFtVXl2ZmFVMFFLWi9t?=
 =?utf-8?B?MHRxNTNKUUh0Wngvb2UwbXRubXdZYmtpaUhtYlNmNlVjOVgvd3hyL0pCdDh2?=
 =?utf-8?B?OVl4SWhUTDhqcVRYb2hLVDBOcFJYbHRWSlBMbmk5WWh4OVdIL09WU0trODBB?=
 =?utf-8?B?aXpCUzhpMG1ra0JjcERDM0NobHhzYkczTkIzd3ZjNkZYcHlTdzl1cUVFak1h?=
 =?utf-8?B?RXVWNlVvV3ZWSmxUZzJaclREQTdudUEwcVdIUDhxc255RjIxNDBuVVNRYUhO?=
 =?utf-8?B?ZmNlcWFlRkNrZnI5MUdFdjIzdmtnNDBQVkRubFlCbXRaR09lalFzQThxVmtO?=
 =?utf-8?B?VXZ1aHhaOGExbXROZWR5N1R4MEJ1TDN0aTMrOGhlWUpyQ2lLL3JCQXN5ckdJ?=
 =?utf-8?B?RUxNTjArZlFmOFhIOTkySVh3YU4vdy9UZVFvL2RVKzBpV3AzYTZNMHFTTnJo?=
 =?utf-8?B?ZWhkZ0VNYURCRFo5dG1Ma3NBZmg5MkkvTXBLUTIvRi9aRTR3SmVYT2g2a0pQ?=
 =?utf-8?B?bW9NOVdMUkFId0kzeVBqK3pMaWJESUNadTFLcmRvYWVwZ1MvTW5Kemt6dWw3?=
 =?utf-8?B?RERibnp4T09sbEkyYVBDTDRvS3I0TjFjSS9wc2drbkJ0WFRuT0lzVVpMcklr?=
 =?utf-8?B?OHRtSjJjaXhKWWpTRDFoNkFWUkJ6RXB5WWZOaG1tTUMxUHM1MDV3bWdSdkJ5?=
 =?utf-8?B?YWptN0ZBVXpuM1hLdmtZbGJZZkRQVy9Ya2kxOTYxZmxKMDZOTElGcVhyUWV6?=
 =?utf-8?B?T0J6Vkk0TkNFQytkYTBXY095Q1YyYlRYdTg5WThNQng3TTJDRkp0bzNZT25p?=
 =?utf-8?B?N2RSNzM3K3FzWFE2UzJsd2lNQjlEUHF0N1prd1JrNlJOQkkwWkJ4TFVHTjY4?=
 =?utf-8?B?bHZtbTZ6MGpuQUxYRVV6eWhqeWwyQnRHUnVRU0lYckhXZnpYRFZqV0c1dmNF?=
 =?utf-8?B?YmFMekVrdWdsVGpnOGJmQlJsUHE5VHJDQjJhK1ZiaWNoSmNrbTlIaW15ZEh0?=
 =?utf-8?B?VlNDRWhHWk5VYW9Vb2dGZ2RvYkVJcGt5NlExMStBM01kS0tsSndEMmFmVzk2?=
 =?utf-8?Q?DyVPuj92HhKIbQ6SXQbY9enz1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6fdc04-18bf-433e-4e36-08daa9a3f497
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2022 03:11:27.4041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1dUX36rQ5etDjM0W5sHHDLRSzoiQweQulbycTxltmG86ldPqlzb+gg6uyRpdJW8hRNknZDVjBd1h1kbF2eVXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9220
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgPHNib3lk
QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjLlubQxMOaciDHml6UgNTozOA0KPiBUbzogYWJlbHZl
c2FAa2VybmVsLm9yZzsgQm91Z2ggQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPjsNCj4ga2VybmVs
QHBlbmd1dHJvbml4LmRlOyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsgcy5oYXVlckBwZW5ndXRy
b25peC5kZTsNCj4gc2hhd25ndW9Aa2VybmVsLm9yZw0KPiBDYzogZmVzdGV2YW1AZ21haWwuY29t
OyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXgNCj4gPGxpbnV4LWlteEBu
eHAuY29tPjsgQm91Z2ggQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPjsgUGVuZyBGYW4NCj4gPHBl
bmcuZmFuQG54cC5jb20+OyBKYWNreSBCYWkgPHBpbmcuYmFpQG54cC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGNsazogaW14OTM6IGNvcnJlY3QgdGhlIGZsZXhzcGkxIGNsb2NrIHNldHRp
bmcNCj4gDQo+IFF1b3RpbmcgaGFpYm8uY2hlbkBueHAuY29tICgyMDIyLTA5LTI5IDIzOjAyOjM5
KQ0KPiA+IEZyb206IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gPg0KPiA+IENv
cnJlY3QgSU1YOTNfQ0xLX0ZMRVhTUEkxX0dBVEUgQ0NHUiBzZXR0aW5nLiBPdGhlcndpc2UgdGhl
IGZsZXhzcGkNCj4gPiBhbHdheXMgY2FuJ3QgYmUgYXNzaWduZWQgdG8gYSBwYXJlbnQgY2xvY2sg
d2hlbiBkdW1wIHRoZSBjbG9jayB0cmVlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8g
Q2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiA+IC0tLQ0KPiANCj4gQW55IEZpeGVzIHRhZz8N
Cg0KT2gsIHNvcnJ5LiBUaGUgZml4ZXMgdGFnIHNob3VsZCBiZToNCkZpeGVzOiAyNGRlZmJlMTk0
YjYgKCJjbGs6IGlteDogYWRkIGkuTVg5MyBjbGsiKQ0KDQpTaG91bGQgSSBzZW5kIGEgdjIgcGF0
Y2ggd2l0aCB0aGlzIGZpeGVzIHRhZz8NCg0KQmVzdCBSZWdhcmRzDQpIYWlibyBDaGVuDQo=
