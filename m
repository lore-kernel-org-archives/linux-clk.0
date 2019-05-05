Return-Path: <SRS0=7zwf=TF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A6BC004C9
	for <linux-clk@archiver.kernel.org>; Sun,  5 May 2019 06:33:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00A8020651
	for <linux-clk@archiver.kernel.org>; Sun,  5 May 2019 06:33:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qg2GqaWG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfEEGdp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 May 2019 02:33:45 -0400
Received: from mail-eopbgr60064.outbound.protection.outlook.com ([40.107.6.64]:12870
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725792AbfEEGdp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 5 May 2019 02:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IJwA9pNE7iBdUzZh8vNlzdwioiFDHNY8pu6Jn7ctek=;
 b=Qg2GqaWGQ2CZECSRk8CFSBSfo0c3/lP2V79xAsGmbd1dbLkfB2tBNTHfU+h5fs1FZP1LKqZJmZmkNQdoY3dK/c2nlvqdALvv+xoH4k63z81kpivafgwf3zE8euqXW68jTsXVskNClml1r57+4UnoSCwxAvzktawPmobV4BJnPN4=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4196.eurprd04.prod.outlook.com (52.134.90.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Sun, 5 May 2019 06:33:42 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c415:3cab:a042:2e13]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c415:3cab:a042:2e13%6]) with mapi id 15.20.1856.012; Sun, 5 May 2019
 06:33:42 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: imx: keep the mmdc p1 ipg clock always on on
 6sx/ul/ull/sll
Thread-Topic: [PATCH] clk: imx: keep the mmdc p1 ipg clock always on on
 6sx/ul/ull/sll
Thread-Index: AQHVAwLVvUz2mQfvrEuvkoMSG1+V0KZcEsaQ
Date:   Sun, 5 May 2019 06:33:42 +0000
Message-ID: <AM0PR04MB42117950D90080E85433336280370@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190505052927.7313-1-ping.bai@nxp.com>
In-Reply-To: <20190505052927.7313-1-ping.bai@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecf3501c-b3e9-429c-7213-08d6d1239e41
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4196;
x-ms-traffictypediagnostic: AM0PR04MB4196:
x-microsoft-antispam-prvs: <AM0PR04MB4196319E379B18607F13518C80370@AM0PR04MB4196.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 00286C0CA6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(366004)(396003)(346002)(136003)(189003)(199004)(66066001)(6246003)(53936002)(14454004)(66556008)(4326008)(2501003)(44832011)(26005)(186003)(476003)(2201001)(7736002)(486006)(305945005)(316002)(81166006)(2906002)(76116006)(81156014)(66476007)(66446008)(73956011)(9686003)(8676002)(66946007)(8936002)(64756008)(5660300002)(6436002)(86362001)(55016002)(229853002)(52536014)(68736007)(71200400001)(71190400001)(6506007)(7696005)(76176011)(558084003)(256004)(102836004)(33656002)(99286004)(6116002)(446003)(3846002)(11346002)(54906003)(110136005)(478600001)(74316002)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4196;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kKPoLSdNhqjYB9HKmCJmR1MTsT5lrzPiYc4CkVmju9RmLDWughltQL0m7riaqVCNvBUgEM+OkgVDfxwYPKI98xQDAW/3+/2aXJcB3UDhwmutziYKj3MPEaULmyVIV8lkKdbZL5BhY8QditWskwIP9pf+yK6ThkwdZ8SGtGO1z66fSlNgO+4feVmBT+xoZj9IQy6nx0u7Y8jmD8AjLllx9HzDRJTOfB69+08BoPsEh8f62RzjIcYNBjZhEgfZhOdBJNx3O87eWRQRk9hY8lXGxRRECi+hcgtZCmPbWnbKdEXHQoJgxz+yCgI+bya/Fh0UrilMWlL8QFOSjjVY43vsYws4tT5V/prax6jP2tbmsaceSHJZ0vcY9+bAUa74MbpXCqm275cZXa4u5RYYquCzbfYgoB/pD0C6Oc1n25c0WSI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf3501c-b3e9-429c-7213-08d6d1239e41
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2019 06:33:42.7774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4196
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBKYWNreSBCYWkNCj4gU2VudDogU3VuZGF5LCBNYXkgNSwgMjAxOSAxOjI1IFBNDQo+
IA0KPiBUaGUgTU1EQ19QMV9JUEcgY2xvY2sgbmVlZCB0byBiZSBvbiBhbHdheXMgb24gdG8gbWFr
ZSBzdXJlIHRoZSBNTURDDQo+IHJlZ2lzdGVyIGNhbiBiZSBhY2Nlc3NlZCBzdWNjZXNzZnVsbHku
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYWNreSBCYWkgPHBpbmcuYmFpQG54cC5jb20+DQoNClJl
dmlld2VkLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KDQpSZWdhcmRz
DQpEb25nIEFpc2hlbmcNCg==
