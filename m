Return-Path: <SRS0=4m2Q=TA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA374C43219
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 17:35:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B013D2147A
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 17:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ldm9ZR8s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfD3Rf2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Apr 2019 13:35:28 -0400
Received: from mail-eopbgr00043.outbound.protection.outlook.com ([40.107.0.43]:40256
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725950AbfD3Rf2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 30 Apr 2019 13:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=408jCAjXoqXLUOrJsVVQLEpwt2PSYNkkcoApMrwjfgs=;
 b=Ldm9ZR8stLcKwdqQnEtDQk7wS7PfYbbAV29KrBVMs0g7U4NI6XxFq2vN9aW08wu7YWB+X6bVElruzICLrtiCsjqFXIM7QRwv7FLQ2FygVyCh28+Iys3r385QXCaq8rxjC1ByWoLi2SDb99Q5hZogKViThQmotrDZONUfPRq9He4=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4995.eurprd04.prod.outlook.com (20.176.215.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.18; Tue, 30 Apr 2019 17:35:24 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 17:35:24 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH V2 0/2] clk: imx: scu: add parsing clocks from device tree
 support
Thread-Topic: [PATCH V2 0/2] clk: imx: scu: add parsing clocks from device
 tree support
Thread-Index: AQHU/3sXAchBbqvng0+oy01651OLQg==
Date:   Tue, 30 Apr 2019 17:35:24 +0000
Message-ID: <1556645270-20648-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2P15301CA0007.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::17) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:5b::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 839da188-9cc3-40bc-679e-08d6cd923a09
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4995;
x-ms-traffictypediagnostic: AM0PR04MB4995:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR04MB4995435E90796BDA9DE92C1F803A0@AM0PR04MB4995.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(346002)(39860400002)(376002)(136003)(396003)(199004)(189003)(54534003)(6506007)(5660300002)(36756003)(386003)(102836004)(186003)(256004)(26005)(4326008)(68736007)(71190400001)(71200400001)(25786009)(2501003)(6486002)(6436002)(8936002)(6512007)(50226002)(8676002)(81166006)(81156014)(6306002)(53936002)(54906003)(66066001)(2906002)(110136005)(966005)(66556008)(99286004)(73956011)(66446008)(316002)(66946007)(66476007)(64756008)(52116002)(2616005)(44832011)(476003)(486006)(97736004)(7736002)(86362001)(478600001)(14454004)(6116002)(3846002)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4995;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r0CYGi4JtszwxgwXT6dCBmygfOAG+HwsO+PhUVfuYMtvaNsP+4U0oTV64smFLumK1X77gZNya/pDrYG54dQFVz/aZnZ+DWGg/tqSWwhpQkuq8HniQZEqOh+gZ++vVRNShRUae9Ye3zC+TBmNd3vbnX2+hOH7Rz90iQ2KfhysVu5tB0/Ua26qTDD4oakAubHylEWgpHCHBYaBiyz/8LaPFVZz+oCFK+SPxJ8zc0SAmHH51IgflzG8AReTOjbpTzWw/vbS71aF7vgwvQLByAZtXrfzTF/OthFMlILzDGAX9dMmzyETjuGjEAeEKJRKPzz/y1x0w7Ikd9dYD0ojhyHcI6j1Ux/APVunX3m1tNUvlG90ZJPWWkMHVpiIe03up7B1mJYV2dnrf/RicVm+2lq05+f+Ga/ezitrRYs2GdZWdww=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839da188-9cc3-40bc-679e-08d6cd923a09
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 17:35:24.5040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4995
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

VGhpcyBpcyBhIGZvbGxvdyB1cCBvZiB0aGUgcGF0Y2ggdGhyZWFkLg0KaHR0cHM6Ly93d3cuc3Bp
bmljcy5uZXQvbGlzdHMvZGV2aWNldHJlZS9tc2cyODM2NzUuaHRtbA0KDQpUaGlzIHBhdGNoIHNl
cmllcyBpcyBhIHByZXBhcmF0aW9uIGZvciB0aGUgTVg4IEFyY2hpdGVjdHVyZSBpbXByb3ZlbWVu
dC4NCkFzIGZvciBJTVggU0NVIGJhc2VkIHBsYXRmb3JtcyBsaWtlIE1YOFFNIGFuZCBNWDhRWFAs
IHRoZXkgYXJlIGNvbXByaXNlZA0Kb2YgYSBjb3VwbGUgb2YgU1MoU3Vic3lzdGVtcykgd2hpbGUg
bW9zdCBvZiB0aGVtIHdpdGhpbiB0aGUgc2FtZSBTUw0KY2FuIGJlIHNoYXJlZC4gZS5nLiBDbG9j
a3MsIERldmljZXMgYW5kIGV0Yy4NCg0KSG93ZXZlciwgY3VycmVudCBkZXZpY2UgdHJlZSBpcyBo
ZWF2aWx5IGRlcGVuZHMgb24gQ2xvY2tzIElEcyBkZWZpbmVkIHdoaWNoDQpjYXVzZSBzb21lIHRy
b3VibGVzIGluIHdyaXRpbmcgdGhlIGNvbW1vbiA8c29jPi1zcy14eC5kdHNpIGZpbGUuDQoNClRo
aXMgcGF0Y2ggc2VyaWVzIGFkZHMgYSBuZXcgYmluZGluZyB0byBzdXBwb3J0IHBhcnNpbmcgY2xv
Y2tzIGZyb20gZGV2aWNlIHRyZWUNCndoaWNoIGNhbiBmdWxseSBkZWNvdXBsZSB0aGUgZGVwZW5k
ZW5jeSBvZiBDbG9jayBJRHMgaW4gZGV2aWNlIHRyZWUgYW5kIG1ha2UNCnVzIGJlIGFibGUgdG8g
d3JpdGUgYSBmdWxseSBnZW5lcmljIGNsb2NrIGRyaXZlciBmb3IgU0NVIGJhc2VkIFNvQ3MuDQpB
bmQgaXQgY2FuIG1ha2UgdGhlIGRyaXZlciBtdWNoIGVhc2lseSB0byBiZSBtYWludGFpbmVkIGlu
IHRoZSBmdXR1cmUgYW5kDQphdm9pZCB3cml0aW5nIGEgbG90IG9mIGR1cGxpY2F0ZWQgY29kZXMu
DQoNCkNoYW5nZUxvZzoNCnYxLT52MjoNCiAqIFNDVSBjbG9jayBjaGFuZ2VkIHRvIG9uZSBjZWxs
IGNsb2NrIGJpbmRpbmcgaW5zcGlyZWQgYnkgYXJtLHNjcGkudHh0DQogICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxzY3BpLnR4dA0KICogQWRkIHJlcXVpcmVkIHBv
d2VyIGRvbWFpbiBwcm9wZXJ0eQ0KICogRHJvcHBlZCBQQVRDSCAzJjQgZmlyc3QsIHdpbGwgc2Vu
ZCB0aGUgdXBkYXRlZCB2ZXJzaW9uIGFjY29yZGluZ2x5DQogICBhZnRlciB0aGUgYmluZGluZyBp
cyBmaW5hbGx5IGRldGVybWluZWQsDQoNCkRvbmcgQWlzaGVuZyAoMik6DQogIGR0LWJpbmRpbmdz
OiBmaXJtd2FyZTogaW14LXNjdTogbmV3IGJpbmRpbmcgdG8gcGFyc2UgY2xvY2tzIGZyb20NCiAg
ICBkZXZpY2UgdHJlZQ0KICBkdC1iaW5kaW5nczogY2xvY2s6IGlteC1scGNnOiBhZGQgc3VwcG9y
dCB0byBwYXJzZSBjbG9ja3MgZnJvbSBkZXZpY2UNCiAgICB0cmVlDQoNCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0ICB8IDQ1ICsrKysrKysrKysrKysr
KysrKy0tLS0NCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9pbXg4cXhwLWxwY2cudHh0
ICAgICB8IDM0ICsrKysrKysrKysrKystLS0NCiBpbmNsdWRlL2R0LWJpbmRpbmdzL2Zpcm13YXJl
L2lteC9yc3JjLmggICAgICAgICAgICB8IDE3ICsrKysrKysrDQogMyBmaWxlcyBjaGFuZ2VkLCA4
MiBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjcuNA0KDQo=
