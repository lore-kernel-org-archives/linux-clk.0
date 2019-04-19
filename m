Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBFDC282DA
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 18:18:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0197C222EA
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 18:18:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ohrjGLe6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbfDSSSQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:18:16 -0400
Received: from mail-eopbgr80072.outbound.protection.outlook.com ([40.107.8.72]:22302
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726134AbfDSSSP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Apr 2019 14:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dab7rl0K1PE5IqieSuXh3lngJLk0Iala8CcmGYMNZg=;
 b=ohrjGLe6qsNTNKIRb2kLnCcMtJDfQLE7m32ylTxu/IU0NdjqOAk5t7z8CTrCVt47H4w3p3+PhbKPMOdAVYNIXMqudhaBLvzB8MBJHt26zPLgbvPUm8nYIbwVi43vehw1ZDFAU6kw8B/a96X6qowx4KErXS3b3noX3dQRvu50r2Q=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB5010.eurprd04.prod.outlook.com (20.176.215.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Fri, 19 Apr 2019 10:42:51 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e%2]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 10:42:51 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 1/1] Revert "clk: imx: use devm_platform_ioremap_resource() to
 simplify code"
Thread-Topic: [PATCH 1/1] Revert "clk: imx: use
 devm_platform_ioremap_resource() to simplify code"
Thread-Index: AQHU9pyjuGc/37hQDkmX93reiiRIug==
Date:   Fri, 19 Apr 2019 10:42:51 +0000
Message-ID: <1555670144-24220-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:203:52::16) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:5b::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffbbd93c-a1f2-4a30-027b-08d6c4b3c56a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM0PR04MB5010;
x-ms-traffictypediagnostic: AM0PR04MB5010:
x-microsoft-antispam-prvs: <AM0PR04MB501081032428FFB40980C7C780270@AM0PR04MB5010.eurprd04.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(136003)(346002)(376002)(396003)(31014005)(199004)(189003)(2501003)(14454004)(4326008)(52116002)(6916009)(8676002)(81166006)(66066001)(86362001)(53936002)(99286004)(5640700003)(486006)(5660300002)(8936002)(81156014)(2616005)(44832011)(68736007)(66556008)(6486002)(476003)(14444005)(54906003)(3846002)(50226002)(73956011)(25786009)(316002)(97736004)(2906002)(256004)(71200400001)(386003)(6506007)(36756003)(305945005)(71190400001)(26005)(6512007)(2351001)(186003)(7736002)(66446008)(66476007)(102836004)(478600001)(66946007)(6436002)(6116002)(64756008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5010;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CCANA33k2wwWifSLA7J2lClGC+HKcggBUOuz2cgNrJop80h2cTxw3Zev221NJnusP+pkmaiJaVowd2VbY72sOkFI2C4pYM9KdIvmB4AXDWpB/5qg3SghFguZBo1UCqENMTFAw5T4wJCc2KQtC9vgoPQrZJ3SFxlVlaGLG/yWJdCYlIwwPbF2ZS90IOb89cN5PIi6WVl0Oitjg/0YBzZjdRLlRBcX6ygGCU2+YO+Z+qX/3tKeg7w01iCPuwvCrWDdKvM4PrLactBF+ETjIzGgFrvgbbVQV1E7eQOd+Dlbw+4Iv60+W4FaY9bmc1uUMNwViG8nOWZO/VOpK2ihPPpZx90gGp0ZgPAsvPWepUyKdDlMXi3Za0lnvwXdpo0hBApArq2Fyj+oEXg58rEAdOPTd5aGEzMinS+3i2cBma/QlVc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbbd93c-a1f2-4a30-027b-08d6c4b3c56a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 10:42:51.3925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5010
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

VGhpcyByZXZlcnRzIGNvbW1pdCA2MTJkNWI2NTg5NGI1YjE2MDdhMDA0YmQ5YmM2MGQ1OTYzYjU4
ZWY2Lg0KDQpPcmlnaW5hbGx5IHdlIHVzZSBkZXZtX2lvcmVtYXAoKSBzcGVjaWZpY2FsbHkgYmVj
YXVzZSB3ZSB3YW50IHRvIGJ5cGFzcw0KdGhlIGRldm1fcmVxdWVzdF9tZW1fcmVnaW9uIGR1ZSB0
byBMUENHIGFkZHJlc3Mgc3BhY2UgYXJlIHNoYXJlZCB3aXRoDQpzb21lIG90aGVyIG1vZHVsZXMg
d2l0aGluIHRoZSBzYW1lIFNTIChzdWJzeXN0ZW0pLg0KDQpUaGUgcGF0Y2ggaW4gcXVlc3Rpb24g
b2NjYXNpb25hbGx5IGFkZGVkIHRoZSByZXF1ZXN0X21lX3JlZ2lvbiBiYWNrDQpieSBjYWxsaW5n
IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSB3aGljaCByZXN1bHRzIGluIGFsbCB0aGUg
ZGV2aWNlcw0Kd2l0aCBvdmVybGFwcGRlZCBJTyBzcGFjZSBmYWlsZWQgdG8gYmUgcHJvYmVkIGFz
IGZvbGxvd3M6DQoNClsgICAgMS4wNjI5OTZdIGZzbC1scHVhcnQgNWEwNjAwMDAuc2VyaWFsOiBj
YW4ndCByZXF1ZXN0IHJlZ2lvbiBmb3IgcmVzb3VyY2UgW21lbSAweDVhMDYwMDAwLTB4NWEwNjBm
ZmZdDQpbICAgIDEuMDcxOTIzXSBmc2wtbHB1YXJ0OiBwcm9iZSBvZiA1YTA2MDAwMC5zZXJpYWwg
ZmFpbGVkIHdpdGggZXJyb3IgLTE2DQoNCkNjOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhw
LmNvbT4NClNpZ25lZC1vZmYtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+
DQotLS0NClNoYXduLA0KDQpUaGlzIGlzIGEgbmV3IGlzc3VlIGFuZCBvbmx5IGV4aXN0IGluIGlt
eC9mb3ItbmV4dCBicmFuY2guDQpZb3UgY2FuIGRlY2lkZSB3aGV0aGVyIHRvIHJlbW92ZSBpdCBv
ciB0YWtlIHRoZSByZXZlcnQgcGF0Y2guDQotLS0NCiBkcml2ZXJzL2Nsay9pbXgvY2xrLWlteDhx
eHAtbHBjZy5jIHwgNiArKysrKy0NCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9pbXgvY2xrLWlteDhxeHAt
bHBjZy5jIGIvZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4cXhwLWxwY2cuYw0KaW5kZXggYzcxMTY1
NC4uZmI2ZWRmMSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvY2xrL2lteC9jbGstaW14OHF4cC1scGNn
LmMNCisrKyBiL2RyaXZlcnMvY2xrL2lteC9jbGstaW14OHF4cC1scGNnLmMNCkBAIC0xNTksNiAr
MTU5LDcgQEAgc3RhdGljIGludCBpbXg4cXhwX2xwY2dfY2xrX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQogCXN0cnVjdCBjbGtfaHdfb25lY2VsbF9kYXRhICpjbGtfZGF0YTsN
CiAJY29uc3Qgc3RydWN0IGlteDhxeHBfc3NfbHBjZyAqc3NfbHBjZzsNCiAJY29uc3Qgc3RydWN0
IGlteDhxeHBfbHBjZ19kYXRhICpscGNnOw0KKwlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCiAJc3Ry
dWN0IGNsa19odyAqKmNsa3M7DQogCXZvaWQgX19pb21lbSAqYmFzZTsNCiAJaW50IGk7DQpAQCAt
MTY3LDcgKzE2OCwxMCBAQCBzdGF0aWMgaW50IGlteDhxeHBfbHBjZ19jbGtfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJaWYgKCFzc19scGNnKQ0KIAkJcmV0dXJuIC1FTk9E
RVY7DQogDQotCWJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7
DQorCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7
DQorCWlmICghcmVzKQ0KKwkJcmV0dXJuIC1FSU5WQUw7DQorCWJhc2UgPSBkZXZtX2lvcmVtYXAo
ZGV2LCByZXMtPnN0YXJ0LCByZXNvdXJjZV9zaXplKHJlcykpOw0KIAlpZiAoIWJhc2UpDQogCQly
ZXR1cm4gLUVOT01FTTsNCiANCi0tIA0KMi43LjQNCg0K
