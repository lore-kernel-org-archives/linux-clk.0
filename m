Return-Path: <SRS0=1mk2=2X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38134C2D0DD
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jan 2020 08:26:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0044C21655
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jan 2020 08:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="qpnJOBgq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgABI0D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Jan 2020 03:26:03 -0500
Received: from mail-eopbgr60083.outbound.protection.outlook.com ([40.107.6.83]:6590
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727707AbgABI0D (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 2 Jan 2020 03:26:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoKHwfI+f16Nt9MQpZXNrGLuOOqaACsrTPM815nMyspVK6zrnISocE2dkwlOsZeYyA4D7vY+JCJ40p0C3/XCrB0vaUkZGOV+8akcBY1Q+VVyN0RBc67f265V1ATsDW+ymJW323niC6NhFVHHm0ho/NNNdwwcLhdaM7+BjXBwp/pFWujbKTQxx9mAly/ySgjLLGHbFra+o4AqiehgypfWpRM9dcXLIADYjKaekn5Z1jqJ4D3D1AtvVQVx4i2iiMNK0rr/zX8+rM2TqG906eGenh4lXyffz9+j1EPXqnX3xkLQep+0MUg0iI0VYJmDGuDhEY0zvJNecihWfkAtgab2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSJMzro42Dt4jZBptFxx+TKhBDY6zCDd3SMZJ2U29BI=;
 b=IlpiZvGh11kHMh9q0Dj5f53sipMENWIt7uWRVwOH5sMeQdmEhv1IsVw3zyJuxortltHmoUV0H/OFFsg463zLSYyVqyoQP1JusiYcO9onTAJW5hiX83XAAZWg6OLVRz13OGYsD0cR8r5PL0rN2x53JvzaBEyqPMgQGlsF/osATHYPLUuK0ILSAcgnVd9eY9ZrtlnjJL/JRidezPNj+Q8bdYCMHzecabKGa2RJiEgUoCNaCTzx9Ue/vv/rKDpXA3WWATvPFdsWMRttblMVV96tuBynWTvutRuX7ADtzohtmZ7K1ckfLNJbOjJwZq/O5E9gxpWmcAVnVLDUVwUfLfav2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSJMzro42Dt4jZBptFxx+TKhBDY6zCDd3SMZJ2U29BI=;
 b=qpnJOBgqze44/YXE707JQOmGSANgKFCIEXi2kIT43pySip7sdjvr4IutFk0SEzfGwm8kDuGtqkVyYfriMigL6Atpi7IZtYSs+1gj7Xa8dB3RfFAADo7YGi0QQEmz+pXw+ZJ/IvS/MQFsrxKfJoVJvHo3cfwBevCG8RbcIb8danI=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB6418.eurprd04.prod.outlook.com (20.179.252.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Thu, 2 Jan 2020 08:26:00 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::b9bd:470c:5f9c:1bfd]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::b9bd:470c:5f9c:1bfd%7]) with mapi id 15.20.2602.010; Thu, 2 Jan 2020
 08:26:00 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH RESEND V5 00/11] clk: imx8: add new clock binding for
 better pm support
Thread-Topic: [PATCH RESEND V5 00/11] clk: imx8: add new clock binding for
 better pm support
Thread-Index: AQHVnUJfJlMJ/jCUUkSe2HX97baBSqe0uPgAgCKYlZA=
Date:   Thu, 2 Jan 2020 08:25:59 +0000
Message-ID: <AM0PR04MB42111A436D719D321ADB479380200@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
 <20191211080525.GS15858@dragon>
In-Reply-To: <20191211080525.GS15858@dragon>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b0b0d60b-4ebc-42a0-ce7e-08d78f5d65df
x-ms-traffictypediagnostic: AM0PR04MB6418:|AM0PR04MB6418:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB6418A257862DDD96BA341B7F80200@AM0PR04MB6418.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0270ED2845
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(199004)(189003)(54534003)(66556008)(66476007)(33656002)(478600001)(76116006)(44832011)(86362001)(4326008)(7696005)(71200400001)(66446008)(6506007)(66946007)(64756008)(110136005)(81156014)(26005)(8936002)(52536014)(186003)(316002)(55016002)(9686003)(81166006)(8676002)(54906003)(2906002)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6418;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9VIiaHJVgqdYEbHoNIZniTno8xCawKJj9jShKpjazoDWaYze1VO/C8ON2Aa8GgoAo8Z8ovtzdspRZ/Yt0G0PD0uXL4Yijy3x71igI/1N0de0RGkP9A5FlQ0mlamk+7mSKNBDQ9+bhbxDz10DmqxyymP/m7EdkCVfh3iixaBb+QgZNeOWxhRAmtICx3BslqJq8FqHGmMLv26hxtFyt1wq1fNO6g1cdJpPfdn/qKUGehoHlg1GKPpWeq356VuFrw0MeQFqgi+jXVINRJ+66Egbh3mzEOX5GiYPcZTIzvezrzkZtkmT4akR+wxpR+42hAdbiGl98wfKIM8E33Dnr+cD8DycfWcS2T78q3UGJYZatRo2Lcy3zxpyHIlE+FxOMElLO8SGERYKeQL15y+p1WxL4k7qbwErQZfuD8PVvV0pFtIieEUW0Hl98Pz7MwhsO20J+wxPu9WgkZIv0mnI15MT/Wf13Puix1WmR7wU3VxUrRb9TmPFFmVfb/Y8QDGTZ4+/
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b0d60b-4ebc-42a0-ce7e-08d78f5d65df
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2020 08:25:59.9161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7P/lZ/pJojatBEd0YseI8Tz0xK9QxtRmZlCvzXGuSl4sWO45q4DzkFKLVT9SHVzaeZ9qPgADKdGhAJC6kqY3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6418
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KQ291bGQgeW91IHRha2UgYSBsb29rIGF0IHRoaXM/DQoNClJlZ2FyZHMN
CkFpc2hlbmcNCg0KPiBGcm9tOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQo+IFNl
bnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMTEsIDIwMTkgNDowNSBQTQ0KPiANCj4gT24gU3VuLCBO
b3YgMTcsIDIwMTkgYXQgMDg6MjU6MDhQTSArMDgwMCwgRG9uZyBBaXNoZW5nIHdyb3RlOg0KPiA+
IFRoaXMgaXMgYSBmb2xsb3cgdXAgb2YgdGhpcyBwYXRjaCBzZXJpZXMuDQo+ID4gW1YyLDAvMl0g
Y2xrOiBpbXg6IHNjdTogYWRkIHBhcnNpbmcgY2xvY2tzIGZyb20gZGV2aWNlIHRyZWUgc3VwcG9y
dA0KPiA+DQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgYSBwcmVwYXJhdGlvbiBmb3IgdGhlIE1Y
OCBBcmNoaXRlY3R1cmUgaW1wcm92ZW1lbnQuDQo+ID4gQXMgZm9yIElNWCBTQ1UgYmFzZWQgcGxh
dGZvcm1zIGxpa2UgTVg4UU0gYW5kIE1YOFFYUCwgdGhleSBhcmUNCj4gPiBjb21wcmlzZWQgb2Yg
YSBjb3VwbGUgb2YgU1MoU3Vic3lzdGVtcykgd2hpbGUgbW9zdCBvZiB0aGVtIHdpdGhpbiB0aGUN
Cj4gPiBzYW1lIFNTIGNhbiBiZSBzaGFyZWQuIGUuZy4gQ2xvY2tzLCBEZXZpY2VzIGFuZCBldGMu
DQo+ID4NCj4gPiBIb3dldmVyLCBjdXJyZW50IGNsb2NrIGJpbmRpbmcgaXMgdXNpbmcgU1cgSURz
IGZvciBkZXZpY2UgdHJlZSB0byB1c2UNCj4gPiB3aGljaCBjYW4gY2F1c2UgdHJvdWJsZXMgaW4g
d3JpdGluZyB0aGUgY29tbW9uIDxzb2M+LXNzLXh4LmR0c2kgZmlsZQ0KPiA+IGZvciBkaWZmZXJl
bnQgU29Dcy4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFpbXMgdG8gaW50cm9kdWNlIGEg
bmV3IGJpbmRpbmcgd2hpY2ggaXMgbW9yZSBjbG9zZQ0KPiA+IHRvIGhhcmR3YXJlIGFuZCBwbGF0
Zm9ybSBpbmRlcGVuZGVudCBhbmQgY2FuIG1ha2VzIHVzIHdyaXRlIGEgbW9yZQ0KPiA+IGdlbmVy
YWwgZHJpdmVycyBmb3IgZGlmZmVyZW50IFNDVSBiYXNlZCBTb0NzLg0KPiA+DQo+ID4gQW5vdGhl
ciBpbXBvcnRhbnQgdGhpbmcgaXMgdGhhdCBvbiBNWDgsIGVhY2ggQ2xvY2sgcmVzb3VyY2UgaXMN
Cj4gPiBhc3NvY2lhdGVkIHdpdGggYSBwb3dlciBkb21haW4uIFNvIHdlIGhhdmUgdG8gYXR0YWNo
IHRoYXQgY2xvY2sgZGV2aWNlDQo+ID4gdG8gdGhlIHBvd2VyIGRvbWFpbiBpbiBvcmRlciB0byBt
YWtlIGl0IHdvcmsgcHJvcGVybHkuIEZ1cnRoZXIgbW9yZSwNCj4gPiB0aGUgY2xvY2sgc3RhdGUg
d2lsbCBiZSBsb3N0IHdoZW4gaXRzIHBvd2VyIGRvbWFpbiBpcyBjb21wbGV0ZWx5IG9mZg0KPiA+
IGR1cmluZyBzdXNwZW5kL3Jlc3VtZSwgc28gd2UgYWxzbyBpbnRyb2R1Y2UgdGhlIGNsb2NrIHN0
YXRlIHNhdmUmcmVzdG9yZQ0KPiBtZWNoYW5pc20uDQo+ID4NCj4gPiBDaGFuZ2VMb2c6DQo+ID4g
djQtPnY1Og0KPiA+ICAqIEFkZHJlc3MgYWxsIGNvbW1lbnRzIGZyb20gU3RlcGhlbg0KPiANCj4g
SGkgU3RlcGhlbiwNCj4gDQo+IEFyZSB5b3UgZmluZSB3aXRoIHRoaXMgdmVyc2lvbj8NCj4gDQo+
IFNoYXduDQo=
