Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2005FC10F03
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 08:10:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB06C217D7
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 08:10:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ewOfb03R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbfDYIKN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 04:10:13 -0400
Received: from mail-eopbgr80089.outbound.protection.outlook.com ([40.107.8.89]:33712
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726199AbfDYIKN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 04:10:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6zSDM/n8WMqxv8EtG3vLH9uJSpJgIM0bIQZa4TuNhM=;
 b=ewOfb03Re5BsKSGr7u4b6KKhYP+F7nxDbs2oIX8maP3CkBa3zk2iLQkDOsTDldHx807oXf9xsMbxfU/zZFc2VO18kUyr9qVpV72slk7SLgQG6vD9qs1RtfYTH5oEv7/hEIyV5Eik+7T2Mxxpt9fxUlSw01VHnUw+wNu0j94eaWU=
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com (52.134.4.24) by
 VI1PR0402MB3773.eurprd04.prod.outlook.com (52.134.15.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Thu, 25 Apr 2019 08:10:08 +0000
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::f830:3f53:72c1:b14f]) by VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::f830:3f53:72c1:b14f%3]) with mapi id 15.20.1813.017; Thu, 25 Apr 2019
 08:10:08 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: [PATCH] clk: imx: keep uart clock on during system boot
Thread-Topic: [PATCH] clk: imx: keep uart clock on during system boot
Thread-Index: AQHU+z5MWH+x1iWoqkyeLH/ALfYaYw==
Date:   Thu, 25 Apr 2019 08:10:08 +0000
Message-ID: <20190425081454.3210-1-ping.bai@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HK2PR04CA0084.apcprd04.prod.outlook.com
 (2603:1096:202:15::28) To VI1PR0402MB3519.eurprd04.prod.outlook.com
 (2603:10a6:803:8::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ping.bai@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f61e2496-84f9-41d4-d306-08d6c9556e69
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR0402MB3773;
x-ms-traffictypediagnostic: VI1PR0402MB3773:
x-microsoft-antispam-prvs: <VI1PR0402MB377324C1399720272B695B83873D0@VI1PR0402MB3773.eurprd04.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39860400002)(396003)(366004)(346002)(136003)(189003)(199004)(8936002)(54906003)(110136005)(99286004)(68736007)(14454004)(486006)(476003)(2906002)(3846002)(6116002)(478600001)(2616005)(2501003)(66066001)(71200400001)(66946007)(66446008)(64756008)(66556008)(73956011)(66476007)(1076003)(52116002)(71190400001)(5660300002)(386003)(6506007)(102836004)(256004)(6436002)(36756003)(2201001)(86362001)(6512007)(6486002)(97736004)(7736002)(316002)(305945005)(186003)(26005)(25786009)(4326008)(81166006)(53936002)(8676002)(81156014)(50226002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3773;H:VI1PR0402MB3519.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rLqzpi46BtkdDJdvI9AsJAuSmmxVQjc7Kd/s1mVdrIhALOdW127NegdJQlkyMSu3OANug5e2UImTKltq9cmAkJMBUwC0WpGzby/h9Tbd4E5ET/PSTE+JvIBx5a14iFUU11diyc1Z4/0uSLVwvQp4NMN5e5P8cl4Ljg9ClsrBR3x23EFk/JCi46i/ndEnPiTf1B1mvHrzHqu/0kgfu5TbwRkfp/xnlVnwWfoFSn5aNjPA1cIDHQgGM2oRdEsCDJadTsbR/jsWuh9/nZdfPXoNG7bluSPjKWnI3XoZcbLTL7wY+dManqvH4DQE7p1AfwN5psB9GfRmbotcwL+NIRylKnRYYN+ru4kazhFfXi1YRz9A/7Za6Vwhsmfr4MiAm9yUqHNxipdevBKT76uSJ2aF9pMvN4jyQaU3k6FYRIn3p5A=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61e2496-84f9-41d4-d306-08d6c9556e69
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 08:10:08.6139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3773
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

S2VlcCB1YXJ0IGNsb2NrcyBlbmFibGVkIHdoZW4gZWFybHlwcmludGsgb3INCmVhcmx5Y29uIGlz
IGFjdGl2ZS4NCg0KU2lnbmVkLW9mZi1ieTogSmFja3kgQmFpIDxwaW5nLmJhaUBueHAuY29tPg0K
LS0tDQogZHJpdmVycy9jbGsvaW14L2Nsay1pbXg2c2xsLmMgfCAxNiArKysrKysrKysrKysrKysr
DQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY2xrL2lteC9jbGstaW14NnNsbC5jIGIvZHJpdmVycy9jbGsvaW14L2Nsay1pbXg2c2xsLmMN
CmluZGV4IDNiZDIwNDRjZjI1Yy4uMzUyMTdjMmY5ZjYyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9j
bGsvaW14L2Nsay1pbXg2c2xsLmMNCisrKyBiL2RyaXZlcnMvY2xrL2lteC9jbGstaW14NnNsbC5j
DQpAQCAtNzYsNiArNzYsMjAgQEAgc3RhdGljIHUzMiBzaGFyZV9jb3VudF9zc2kxOw0KIHN0YXRp
YyB1MzIgc2hhcmVfY291bnRfc3NpMjsNCiBzdGF0aWMgdTMyIHNoYXJlX2NvdW50X3NzaTM7DQog
DQorc3RhdGljIHN0cnVjdCBjbGsgKiogY29uc3QgdWFydF9jbGtzW10gX19pbml0Y29uc3QgPSB7
DQorCSZjbGtzW0lNWDZTTExfQ0xLX1VBUlQxX0lQR10sDQorCSZjbGtzW0lNWDZTTExfQ0xLX1VB
UlQxX1NFUklBTF0sDQorCSZjbGtzW0lNWDZTTExfQ0xLX1VBUlQyX0lQR10sDQorCSZjbGtzW0lN
WDZTTExfQ0xLX1VBUlQyX1NFUklBTF0sDQorCSZjbGtzW0lNWDZTTExfQ0xLX1VBUlQzX0lQR10s
DQorCSZjbGtzW0lNWDZTTExfQ0xLX1VBUlQzX1NFUklBTF0sDQorCSZjbGtzW0lNWDZTTExfQ0xL
X1VBUlQ0X0lQR10sDQorCSZjbGtzW0lNWDZTTExfQ0xLX1VBUlQ0X1NFUklBTF0sDQorCSZjbGtz
W0lNWDZTTExfQ0xLX1VBUlQ1X0lQR10sDQorCSZjbGtzW0lNWDZTTExfQ0xLX1VBUlQ1X1NFUklB
TF0sDQorCU5VTEwNCit9Ow0KKw0KIHN0YXRpYyB2b2lkIF9faW5pdCBpbXg2c2xsX2Nsb2Nrc19p
bml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqY2NtX25vZGUpDQogew0KIAlzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wOw0KQEAgLTMzNCw2ICszNDgsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW14NnNsbF9j
bG9ja3NfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKmNjbV9ub2RlKQ0KIAljbGtfZGF0YS5jbGtf
bnVtID0gQVJSQVlfU0laRShjbGtzKTsNCiAJb2ZfY2xrX2FkZF9wcm92aWRlcihucCwgb2ZfY2xr
X3NyY19vbmVjZWxsX2dldCwgJmNsa19kYXRhKTsNCiANCisJaW14X3JlZ2lzdGVyX3VhcnRfY2xv
Y2tzKHVhcnRfY2xrcyk7DQorDQogCS8qIExvd2VyIHRoZSBBSEIgY2xvY2sgcmF0ZSBiZWZvcmUg
Y2hhbmdpbmcgdGhlIGNsb2NrIHNvdXJjZS4gKi8NCiAJY2xrX3NldF9yYXRlKGNsa3NbSU1YNlNM
TF9DTEtfQUhCXSwgOTkwMDAwMDApOw0KIA0KLS0gDQoyLjIxLjANCg0K
