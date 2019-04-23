Return-Path: <SRS0=Ati7=SZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897E9C10F03
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 19:05:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AC9421773
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 19:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="xWw4qAqK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfDWTFN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Apr 2019 15:05:13 -0400
Received: from mail-eopbgr70072.outbound.protection.outlook.com ([40.107.7.72]:57710
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725956AbfDWTFM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Apr 2019 15:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bqik3bBGJTz6Xj/42Nec6WPTbjllryxhAXgERGLans=;
 b=xWw4qAqKVoRo59bw+lUuPZNKs2kuT2kMMTIYpeYIjc6vKnWgw11wujMfNybJrga1gwXvuCWBocAiNXVHbeC/a0T/QqP4uP8DFlh3L3AqWkV+wxBxfDQuZ1w/W5+pKbWKhShjuj61oZXxxXUhaXGQmSJiuKFkcgqUmETAvu0zYRg=
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com (20.179.252.215) by
 AM0PR04MB5587.eurprd04.prod.outlook.com (20.178.117.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Tue, 23 Apr 2019 19:05:08 +0000
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::a1d7:51b5:9893:dcee]) by AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::a1d7:51b5:9893:dcee%2]) with mapi id 15.20.1813.017; Tue, 23 Apr 2019
 19:05:08 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] clk: imx6sll: Fix mispelling uart4_serial as serail
Thread-Topic: [PATCH] clk: imx6sll: Fix mispelling uart4_serial as serail
Thread-Index: AQHU+gd4bZ/epWmoAkeke37nJmrlQA==
Date:   Tue, 23 Apr 2019 19:05:08 +0000
Message-ID: <8776296d079b3b4d67d4421656238757a8ad373d.1556046082.git.leonard.crestez@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.146.100.6]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: VI1PR06CA0103.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::32) To AM0PR04MB6434.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a33711f-96a2-44ea-37a3-08d6c81e9a6b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB5587;
x-ms-traffictypediagnostic: AM0PR04MB5587:
x-microsoft-antispam-prvs: <AM0PR04MB5587FF7A8733AE6D0B88C3C6EE230@AM0PR04MB5587.eurprd04.prod.outlook.com>
x-forefront-prvs: 0016DEFF96
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(346002)(39860400002)(396003)(376002)(189003)(199004)(3846002)(53936002)(6116002)(2616005)(50226002)(99286004)(476003)(44832011)(81156014)(110136005)(6436002)(8936002)(66066001)(102836004)(81166006)(97736004)(8676002)(36756003)(68736007)(6512007)(54906003)(7736002)(305945005)(52116002)(186003)(316002)(6486002)(26005)(486006)(14444005)(2906002)(86362001)(256004)(4326008)(71190400001)(478600001)(71200400001)(14454004)(386003)(118296001)(66476007)(66946007)(64756008)(66446008)(66556008)(25786009)(6506007)(73956011)(5660300002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5587;H:AM0PR04MB6434.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jsley2JV3jJZaJMgg77g+os7d3YO2gTGt8yIFKGDa2FkEjuPECJqe/ynwATGFdDl4E8ozKxT/MLexMvqIJ0jhN8ECykV/LiI5ykOiUv3l+zzUfxIJSg1ZGacYzrR8VGJmKi6JJFaPuv718W2iJ2N8HWljcgV5a4L+t+q1gZ474q07jzJO6x/5jgOEN99OfDUCpcDdPh6hgQq4HDYjMhfxwofIpT3EYeRtIcGRMjT05888x34hKv37V8M1pustsaJkTn8K7B/fFAEcwsdVRM640HiTV+ZaOuNFDWmYdB4J1UE2ciEdp3bG10KKw2FfQ8FnpvFMdsphEQ4cla56ejTDcmqwsBsCz7kt+0SmIKAv9bmujWhsZE00iqq/z+Hmvi/NewGBh1y4y2fFHJoLuiA/THfDAR0o8XEnA38u883krw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a33711f-96a2-44ea-37a3-08d6c81e9a6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2019 19:05:08.8028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5587
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

VGhpcyBsb29rcyBsaWtlIGEgY29weS1wYXN0ZSBlcnJvci4gVGhpcyBzdHJpbmcgaXMgbm90IHJl
ZmVyZW5jZWQNCmFueXdoZXJlIHNvIGl0J3Mgc2FmZSB0byByZW5hbWUgaXQuDQoNClNpZ25lZC1v
ZmYtYnk6IExlb25hcmQgQ3Jlc3RleiA8bGVvbmFyZC5jcmVzdGV6QG54cC5jb20+DQotLS0NCiBk
cml2ZXJzL2Nsay9pbXgvY2xrLWlteDZzbGwuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2lt
eC9jbGstaW14NnNsbC5jIGIvZHJpdmVycy9jbGsvaW14L2Nsay1pbXg2c2xsLmMNCmluZGV4IDNi
ZDIwNDRjZjI1Yy4uOWRlZjc2ZGYwODc5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9jbGsvaW14L2Ns
ay1pbXg2c2xsLmMNCisrKyBiL2RyaXZlcnMvY2xrL2lteC9jbGstaW14NnNsbC5jDQpAQCAtMjY2
LDExICsyNjYsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IGlteDZzbGxfY2xvY2tzX2luaXQoc3Ry
dWN0IGRldmljZV9ub2RlICpjY21fbm9kZSkNCiAJY2xrc1tJTVg2U0xMX0NMS19FUElUMV0JCT0g
aW14X2Nsa19nYXRlMigiZXBpdDEiLAkicGVyY2xrIiwgYmFzZSArIDB4NmMsIDEyKTsNCiAJY2xr
c1tJTVg2U0xMX0NMS19FUElUMl0JCT0gaW14X2Nsa19nYXRlMigiZXBpdDIiLAkicGVyY2xrIiwg
YmFzZSArIDB4NmMsIDE0KTsNCiAJY2xrc1tJTVg2U0xMX0NMS19HUFRfQlVTXQk9IGlteF9jbGtf
Z2F0ZTIoImdwdDFfYnVzIiwJInBlcmNsayIsIGJhc2UgKyAweDZjLCAyMCk7DQogCWNsa3NbSU1Y
NlNMTF9DTEtfR1BUX1NFUklBTF0JPSBpbXhfY2xrX2dhdGUyKCJncHQxX3NlcmlhbCIsCSJwZXJj
bGsiLCBiYXNlICsgMHg2YywgMjIpOw0KIAljbGtzW0lNWDZTTExfQ0xLX1VBUlQ0X0lQR10JPSBp
bXhfY2xrX2dhdGUyKCJ1YXJ0NF9pcGciLAkiaXBnIiwgYmFzZSArIDB4NmMsIDI0KTsNCi0JY2xr
c1tJTVg2U0xMX0NMS19VQVJUNF9TRVJJQUxdCT0gaW14X2Nsa19nYXRlMigidWFydDRfc2VyYWls
IiwJInVhcnRfcG9kZiIsIGJhc2UgKyAweDZjLCAyNCk7DQorCWNsa3NbSU1YNlNMTF9DTEtfVUFS
VDRfU0VSSUFMXQk9IGlteF9jbGtfZ2F0ZTIoInVhcnQ0X3NlcmlhbCIsCSJ1YXJ0X3BvZGYiLCBi
YXNlICsgMHg2YywgMjQpOw0KIAljbGtzW0lNWDZTTExfQ0xLX0dQSU8xXQkJPSBpbXhfY2xrX2dh
dGUyKCJncGlvMSIsCSJpcGciLCBiYXNlICsgMHg2YywgMjYpOw0KIAljbGtzW0lNWDZTTExfQ0xL
X0dQSU81XQkJPSBpbXhfY2xrX2dhdGUyKCJncGlvNSIsCSJpcGciLCBiYXNlICsgMHg2YywgMzAp
Ow0KIA0KIAkvKiBDQ0dSMiAqLw0KIAljbGtzW0lNWDZTTExfQ0xLX0dQSU82XQkJPSBpbXhfY2xr
X2dhdGUyKCJncGlvNiIsCSJpcGciLCAgICBiYXNlICsgMHg3MCwgMCk7DQotLSANCjIuMTcuMQ0K
DQo=
