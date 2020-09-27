Return-Path: <SRS0=mS9l=DE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C4FC4346E
	for <linux-clk@archiver.kernel.org>; Sun, 27 Sep 2020 04:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2C8D2389F
	for <linux-clk@archiver.kernel.org>; Sun, 27 Sep 2020 04:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="W92lbSCU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730096AbgI0ENv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Sep 2020 00:13:51 -0400
Received: from mail-eopbgr20075.outbound.protection.outlook.com ([40.107.2.75]:40686
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729291AbgI0ENu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Sep 2020 00:13:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQiXshCgVjubnjRcvFkUbF9k6VYJm1Bh0DG22SLYD0Zxh1wTXQ7qtuJiuWEdEzh5RQIsirDcONokdEfleSF77E+UTO9MZWJSQRUP5XZoXjlGXYktKsMfwM0YJieK8QvsQXxihiKefgUUKsczV2UTZCjfSvW6pC37mOaEYToPaq1+nZ4tXt3jXpnWOjwkBB/ifUW79bIezNMHv607t5gL72ydqoxFajz8TnQ78yobhATkrd9WfoYwJiT5Bz/21aBWbuBEKJqlzpmBV7vZsHuN+63iK5gI3CmxHxvWhodevV98tReMW+abrd5AlZB70nOk4ot6GIpaWVyWdxwSMUDbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odH9BPtujI5658EO/wQXfRN/IjcBWEd741kDuHv+9LY=;
 b=ZA10rfSEmGvFsjjELW9EeF+qs0ADZueankMRgzZu+IVoXRQYjvLJH6aO8OT/4zW4BgD9ncVFJhhiWECl6aIYndnrQ6AaedncNBcRtICcVS9XeWQmKWU3Wm/RyH6EPMQfQxCuRQ9C+7gr4hS3FzAEpy5eXp7jTAvrIu5Os+6TsqIWrIj9MqR5e8xVphQCZU0Iejw2dIktBNhDzgsZSYH3M72U337zw58akiKk8+yFwiMc7C1LPCDE5ZfHrZAjZS8ICoTLq3rChAQtwgFDyU7Ye9uAcwuENHqSlj2WYyynamLqQLfafAguRugmdlUtQV6IlfobxfT/G5/WF5mUijACKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odH9BPtujI5658EO/wQXfRN/IjcBWEd741kDuHv+9LY=;
 b=W92lbSCUi4rlatuMVRuCDel43nMhPZuT372gRS5a0NY8jNtL88/ROvPif1tKQ3YyqkxPTuwJQymPgTadjIu8jx/J4jSA8JMVq5rlCpLAfuGsKLXgN6sZPhPTrnFqovSukELRr0mPk5TZtpYRtrAfORd3g2FLsXsxiyhQeq7I3NI=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM5PR04MB3251.eurprd04.prod.outlook.com (2603:10a6:206:10::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Sun, 27 Sep
 2020 04:13:45 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::546f:92f0:f3c5:a148]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::546f:92f0:f3c5:a148%7]) with mapi id 15.20.3412.026; Sun, 27 Sep 2020
 04:13:45 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Dong Aisheng <dongas86@gmail.com>, Stephen Boyd <sboyd@kernel.org>
CC:     linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
Subject: RE: [PATCH v7 00/11] clk: imx8: add new clock binding for better pm
 support
Thread-Topic: [PATCH v7 00/11] clk: imx8: add new clock binding for better pm
 support
Thread-Index: AQHWZX7pUKXGwsalOUC+aFB+aalqoqkeMrGAgB3WQICAGRKygIAnIjPw
Date:   Sun, 27 Sep 2020 04:13:44 +0000
Message-ID: <AM6PR04MB4966AC7FCFB47A51A97D5C2980340@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
 <CAA+hA=RjwtWLA1aSoNHakHDASrk0+EYy+ayPBw-7ninrYrWFJw@mail.gmail.com>
 <CAA+hA=Sa11AByUsKnsvhaH4HS_pdwfSv5P4192nnpRs_0vxk9w@mail.gmail.com>
 <CAA+hA=Qj5NV65N4pWJTCREkuxyw6GKKmSF8X4UXvr=Mmq9WpBA@mail.gmail.com>
In-Reply-To: <CAA+hA=Qj5NV65N4pWJTCREkuxyw6GKKmSF8X4UXvr=Mmq9WpBA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-Mentions: sboyd@kernel.org
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c4475aaf-2539-40bc-22ea-08d8629bb9eb
x-ms-traffictypediagnostic: AM5PR04MB3251:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB32511828B330B5D4C563F2C180340@AM5PR04MB3251.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C6l0u0uuim8T2SDP7gLyKZRpGIGmM4nNS3nzpG4CJabInqQ4h2o2xY3QWm3FV37ca1vq6qlogMzs+yFvzu9QiN1io7+JzgmS9rTjB9ZmTpr5/VmypjkYERfnK913ZXN0f+LX/o92ShtrSdgQC4490SWRsEYl9rosGXioYjtbykT5ssLXhyOC4o9c2INyOEYQlmnyoOxiZ+Ek9N3Gp20RLITRhUJoIyWdVZiCeIbnZkGokTOmK4798iYx/5X18TprET1SuCLxhv/+86sgK8uXcbmIsOvzyXgWsBxE6rB0gy8ldmbOXrrKn2N76OILKWPP6J6emWw4yaOCqFcl5aY5SY6G9TiBbkHzwsSlrorXSCeAZfb2q5Ix6DpRjxBtOxJw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(64756008)(66446008)(33656002)(316002)(54906003)(110136005)(478600001)(52536014)(76116006)(86362001)(2906002)(71200400001)(66946007)(8676002)(8936002)(66476007)(66556008)(4326008)(55016002)(5660300002)(83380400001)(9686003)(186003)(44832011)(7696005)(26005)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Z7XflaTRHdingMdiYGPgnSjurRi1IcEQ0w1xQCsAe5EyIj3Gz5gDj7KEmEWO6g8gFScvQ7GQKIRGjJcYlbdqt/2F9MJW3KUDNluH/qnX+mPF5GXURAnGIR+87ZMd5cJ01hHu7WorG7qELQwl5ezLrTu1JYlUoKtY6NxS7/4c/cIB9+D1Qmv9Hi709RtfSvyLL7ruPFTwN2lkrsI59Koomnb7X8THlhPV/38nRlkFzXFXCFwDetswHwzsloaN24P70tEmprvc/Ig3e2Y5quIYWt7uCr0+fJBn+x34u68vOu4qTCtglDMDZPjS/Q4+7fp1+36oPVaer55ItbcwpROeV9d4EqBGs46Z725z4B/3OOb4QWI4IVS3jVT6fagdj5R5S4fYPg4hFe0u1yxy4TNl6Kb52MfmFCuV5gHgJHvaGW3iaVsE7dMd+AuvENzWiyTH7wOlGDHYy2ZkphSa8ey05/dX54x7Xm+QZSHfI+vF5alys09XE7AsNtSUTUC2krFHdpvOQ8xGNOSgFO0h5HJos2NTSVgTzAA0xI2WBWS+TcABv2VaMr9DouHsWD74Csxrfnc3I8hTJU65tqJeaANVZ2myMKbPE9xlkQf3oJpr9OwtZvhyoGWchn+647B/5R2uN2ZYuxdVr76fIg4cGvi9ng==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4475aaf-2539-40bc-22ea-08d8629bb9eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 04:13:45.0033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wEpFjawcqcXKsGqXvZDETwcPlRPRkCrHNapdVOfZvcIj1X7H6m4LtzwLw2YOHfsAu7W3XIx+7N84N4ygNmLdCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3251
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

R2VudGx5IHBpbmcgYWdhaW4uLi4NCg0KQFN0ZXBoZW4gQm95ZA0KQ291bGQgeW91IGtpbmRseSBw
cm92aWRlIHNvbWUgZmVlZGJhY2sgaG93IHdlIGNhbiBwcm9jZWVkIHRoaXM/DQoNClJlZ2FyZHMN
CkFpc2hlbmcNCg0KPiBGcm9tOiBEb25nIEFpc2hlbmcgPGRvbmdhczg2QGdtYWlsLmNvbT4NCj4g
U2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMiwgMjAyMCAyOjM2IFBNDQo+IA0KPiBIaSBTdGVw
aGVuLA0KPiANCj4gV291bGQgeW91IGhlbHAgbG9vayBhdCB0aGlzPw0KPiBOb3cgb25seSBvbmUg
cGF0Y2ggbGVmdCB0aGF0IHN0aWxsIGRvZXMgbm90IGhhdmUgYSBSLWIgdGFnIGFuZCBuZWVkcyB5
b3VyIHJldmlldy4NCj4gW1BBVENIIHY3IDAzLzExXSBjbGs6IGlteDogc2N1OiBhZGQgdHdvIGNl
bGxzIGJpbmRpbmcgc3VwcG9ydCBBbGwgb3RoZXIgcGF0Y2hlcw0KPiBhbHJlYWR5IGdldCBSLWIg
dGFncy4NCj4gDQo+IFJlZ2FyZHMNCj4gQWlzaGVuZw0KPiANCj4gT24gTW9uLCBBdWcgMTcsIDIw
MjAgYXQgMzo0MiBQTSBEb25nIEFpc2hlbmcgPGRvbmdhczg2QGdtYWlsLmNvbT4NCj4gd3JvdGU6
DQo+ID4NCj4gPiBHZW50bHkgcGluZy4uLg0KPiA+DQo+ID4gT24gV2VkLCBKdWwgMjksIDIwMjAg
YXQgNDowNCBQTSBEb25nIEFpc2hlbmcgPGRvbmdhczg2QGdtYWlsLmNvbT4NCj4gd3JvdGU6DQo+
ID4gPg0KPiA+ID4gSGkgU3RlcGhlbiwNCj4gPiA+DQo+ID4gPiBUaGlzIHBhdGNoc2V0IGFkZHJl
c3NlZCBhbGwgeW91ciBuZXcgY29tbWVudHMuDQo+ID4gPiBSaWdodCBub3cgb25seSBQYXRjaCAy
LzMgc3RpbGwgaGF2ZW4ndCBnb3QgYW55IFItYiBvciBBLWIgdGFncy4gU28NCj4gPiA+IHN0aWxs
IG5lZWQgeW91ciBoZWxwIHRvIHJldmlldy4NCj4gPiA+IEFsbCBvdGhlciBwYXRjaGVzIGFscmVh
ZHkgZ290IHRoZSBSLWIgdGFncy4NCj4gPiA+DQo+ID4gPiBCVFcsIGZvciBbUEFUQ0ggdjcgMDIv
MTFdIGR0LWJpbmRpbmdzOiBjbG9jazogaW14LWxwY2c6IGFkZCBzdXBwb3J0DQo+ID4gPiB0byBw
YXJzZSAgY2xvY2tzIGZyb20gZGV2aWNlIHRyZWUuDQo+ID4gPiBJdCB3YXMgcmV2aWV3ZWQgYnkg
Um9iL1NoYXduIGFuZCB5b3UgYmVmb3JlLCBob3dldmVyLCBkdWUgdG8gdGhlDQo+ID4gPiBsZWdh
Y3kgYmluZGluZyBmaWxlIGhhcyBiZWVuIHJlbW92ZWQgYW5kIGNoYW5nZWQgdG8ganNvbiBmb3Jt
YXQuDQo+ID4gPiBTbyB0aGlzIHBhdGNoIGFsc28gdXBkYXRlZCB0byBqc29uIGZvcm1hdCBhY2Nv
cmRpbmdseSBiYXNlZCBvbiB0aGUNCj4gPiA+IGZvcm1lciByZXZpZXdlZCBwYXRjaCBhbmQgbmVl
ZCBhIHJlLXJldmlldy4NCj4gPiA+DQo+ID4gPiBSZWdhcmRzDQo+ID4gPiBBaXNoZW5nDQo+ID4g
Pg0KPiA+ID4gT24gV2VkLCBKdWwgMjksIDIwMjAgYXQgNDowNCBQTSBEb25nIEFpc2hlbmcgPGFp
c2hlbmcuZG9uZ0BueHAuY29tPg0KPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBwYXRj
aCBzZXJpZXMgaXMgYSBwcmVwYXJhdGlvbiBmb3IgdGhlIE1YOCBBcmNoaXRlY3R1cmUgaW1wcm92
ZW1lbnQuDQo+ID4gPiA+IEFzIGZvciBJTVggU0NVIGJhc2VkIHBsYXRmb3JtcyBsaWtlIE1YOFFN
IGFuZCBNWDhRWFAsIHRoZXkgYXJlDQo+ID4gPiA+IGNvbXByaXNlZCBvZiBhIGNvdXBsZSBvZiBT
UyhTdWJzeXN0ZW1zKSB3aGlsZSBtb3N0IG9mIHRoZW0gd2l0aGluDQo+ID4gPiA+IHRoZSBzYW1l
IFNTIGNhbiBiZSBzaGFyZWQuIGUuZy4gQ2xvY2tzLCBEZXZpY2VzIGFuZCBldGMuDQo+ID4gPiA+
DQo+ID4gPiA+IEhvd2V2ZXIsIGN1cnJlbnQgY2xvY2sgYmluZGluZyBpcyB1c2luZyBTVyBJRHMg
Zm9yIGRldmljZSB0cmVlIHRvDQo+ID4gPiA+IHVzZSB3aGljaCBjYW4gY2F1c2UgdHJvdWJsZXMg
aW4gd3JpdGluZyB0aGUgY29tbW9uDQo+ID4gPiA+IDxzb2M+LXNzLXh4LmR0c2kgZmlsZSBmb3Ig
ZGlmZmVyZW50IFNvQ3MuDQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFpbXMg
dG8gaW50cm9kdWNlIGEgbmV3IGJpbmRpbmcgd2hpY2ggaXMgbW9yZQ0KPiA+ID4gPiBjbG9zZSB0
byBoYXJkd2FyZSBhbmQgcGxhdGZvcm0gaW5kZXBlbmRlbnQgYW5kIGNhbiBtYWtlcyB1cyB3cml0
ZQ0KPiA+ID4gPiBhIG1vcmUgZ2VuZXJhbCBkcml2ZXJzIGZvciBkaWZmZXJlbnQgU0NVIGJhc2Vk
IFNvQ3MuDQo+ID4gPiA+DQo+ID4gPiA+IEFub3RoZXIgaW1wb3J0YW50IHRoaW5nIGlzIHRoYXQg
b24gTVg4LCBlYWNoIENsb2NrIHJlc291cmNlIGlzDQo+ID4gPiA+IGFzc29jaWF0ZWQgd2l0aCBh
IHBvd2VyIGRvbWFpbi4gU28gd2UgaGF2ZSB0byBhdHRhY2ggdGhhdCBjbG9jaw0KPiA+ID4gPiBk
ZXZpY2UgdG8gdGhlIHBvd2VyIGRvbWFpbiBpbiBvcmRlciB0byBtYWtlIGl0IHdvcmsgcHJvcGVy
bHkuDQo+ID4gPiA+IEZ1cnRoZXIgbW9yZSwgdGhlIGNsb2NrIHN0YXRlIHdpbGwgYmUgbG9zdCB3
aGVuIGl0cyBwb3dlciBkb21haW4NCj4gPiA+ID4gaXMgY29tcGxldGVseSBvZmYgZHVyaW5nIHN1
c3BlbmQvcmVzdW1lLCBzbyB3ZSBhbHNvIGludHJvZHVjZSB0aGUgY2xvY2sNCj4gc3RhdGUgc2F2
ZSZyZXN0b3JlIG1lY2hhbmlzbS4NCj4gPiA+ID4NCj4gPiA+ID4gSXQncyBiYXNlZCBvbiBsYXRl
c3Qgc2hhbncvZm9yLW5leHQgYnJhbmNoLg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgdG9wIGNvbW1p
dCBpczoNCj4gPiA+ID4gM2MxYTQxZGFiN2I4IE1lcmdlIGJyYW5jaCAnaW14L2RlZmNvbmZpZycg
aW50byBmb3ItbmV4dA0KPiA+ID4gPg0KPiA+ID4gPiBDaGFuZ2VMb2c6DQo+ID4gPiA+IHY2LT52
NzoNCj4gPiA+ID4gICogYWRkcmVzc2VkIGFsbCBjb21tZW50cyBmcm9tIFN0ZXBoZW4NCj4gPiA+
ID4gICogcmViYXNlZCB0byBsYXRlc3Qgc2hhd24vZm9yLW5leHQNCj4gPiA+ID4gdjUtPnY2Og0K
PiA+ID4gPiAgKiBhZGQgc2N1IGNsayB1bnJlZ2lzdGVyIGlmIGFkZCBwcm92aWRlciBmYWlsZWQN
Cj4gPiA+ID4gdjQtPnY1Og0KPiA+ID4gPiAgKiBBZGRyZXNzIGFsbCBjb21tZW50cyBmcm9tIFN0
ZXBoZW4NCj4gPiA+ID4gdjMtPnY0Og0KPiA+ID4gPiAgKiB1c2UgY2xrLWluZGljZXMgZm9yIExQ
Q0cgdG8gZmV0Y2ggZWFjaCBjbGtzIG9mZnNldCBmcm9tIGR0DQo+ID4gPiA+IHYyLT52MzoNCj4g
PiA+ID4gICogY2hhbmdlIHNjdSBjbGsgaW50byB0d28gY2VsbHMgYmluZGluZw0KPiA+ID4gPiAg
KiBhZGQgY2xrIHBtIHBhdGNoZXMgdG8gZWFzZSB0aGUgdW5kZXJzdGFuZCBvZiB0aGUgY2hhbmdl
cw0KPiA+ID4gPiB2MS0+djI6DQo+ID4gPiA+ICAqIFNDVSBjbG9jayBjaGFuZ2VkIHRvIG9uZSBj
ZWxsIGNsb2NrIGJpbmRpbmcgaW5zcGlyZWQgYnkgYXJtLHNjcGkudHh0DQo+ID4gPiA+ICAgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLHNjcGkudHh0DQo+ID4gPiA+
ICAqIEFkZCByZXF1aXJlZCBwb3dlciBkb21haW4gcHJvcGVydHkNCj4gPiA+ID4gICogRHJvcHBl
ZCBQQVRDSCAzJjQgZmlyc3QsIHdpbGwgc2VuZCB0aGUgdXBkYXRlZCB2ZXJzaW9uIGFjY29yZGlu
Z2x5DQo+ID4gPiA+ICAgIGFmdGVyIHRoZSBiaW5kaW5nIGlzIGZpbmFsbHkgZGV0ZXJtaW5lZCwN
Cj4gPiA+ID4NCj4gPiA+ID4gRG9uZyBBaXNoZW5nICgxMSk6DQo+ID4gPiA+ICAgZHQtYmluZGlu
Z3M6IGZpcm13YXJlOiBpbXgtc2N1OiBuZXcgYmluZGluZyB0byBwYXJzZSBjbG9ja3MgZnJvbQ0K
PiA+ID4gPiAgICAgZGV2aWNlIHRyZWUNCj4gPiA+ID4gICBkdC1iaW5kaW5nczogY2xvY2s6IGlt
eC1scGNnOiBhZGQgc3VwcG9ydCB0byBwYXJzZSBjbG9ja3MgZnJvbSBkZXZpY2UNCj4gPiA+ID4g
ICAgIHRyZWUNCj4gPiA+ID4gICBjbGs6IGlteDogc2N1OiBhZGQgdHdvIGNlbGxzIGJpbmRpbmcg
c3VwcG9ydA0KPiA+ID4gPiAgIGNsazogaW14OiBzY3U6IGJ5cGFzcyBjcHUgcG93ZXIgZG9tYWlu
cw0KPiA+ID4gPiAgIGNsazogaW14OiBzY3U6IGFsbG93IHNjdSBjbGsgdG8gdGFrZSBkZXZpY2Ug
cG9pbnRlcg0KPiA+ID4gPiAgIGNsazogaW14OiBzY3U6IGFkZCBydW50aW1lIHBtIHN1cHBvcnQN
Cj4gPiA+ID4gICBjbGs6IGlteDogc2N1OiBhZGQgc3VzcGVuZC9yZXN1bWUgc3VwcG9ydA0KPiA+
ID4gPiAgIGNsazogaW14OiBpbXg4cXhwLWxwY2c6IGFkZCBwYXJzaW5nIGNsb2NrcyBmcm9tIGRl
dmljZSB0cmVlDQo+ID4gPiA+ICAgY2xrOiBpbXg6IGxwY2c6IGFsbG93IGxwY2cgY2xrIHRvIHRh
a2UgZGV2aWNlIHBvaW50ZXINCj4gPiA+ID4gICBjbGs6IGlteDogY2xrLWlteDhxeHAtbHBjZzog
YWRkIHJ1bnRpbWUgcG0gc3VwcG9ydA0KPiA+ID4gPiAgIGNsazogaW14OiBscGNnOiBhZGQgc3Vz
cGVuZC9yZXN1bWUgc3VwcG9ydA0KPiA+ID4gPg0KPiA+ID4gPiAgLi4uL2JpbmRpbmdzL2FybS9m
cmVlc2NhbGUvZnNsLHNjdS50eHQgICAgICAgIHwgIDEyICstDQo+ID4gPiA+ICAuLi4vYmluZGlu
Z3MvY2xvY2svaW14OHF4cC1scGNnLnlhbWwgICAgICAgICAgfCAgNzkgKysrKy0tDQo+ID4gPiA+
ICBkcml2ZXJzL2Nsay9pbXgvY2xrLWlteDhxeHAtbHBjZy5jICAgICAgICAgICAgfCAxMzkgKysr
KysrKysrKysNCj4gPiA+ID4gIGRyaXZlcnMvY2xrL2lteC9jbGstaW14OHF4cC5jICAgICAgICAg
ICAgICAgICB8IDEzNiArKysrKy0tLS0tDQo+ID4gPiA+ICBkcml2ZXJzL2Nsay9pbXgvY2xrLWxw
Y2ctc2N1LmMgICAgICAgICAgICAgICAgfCAgNTMgKysrLQ0KPiA+ID4gPiAgZHJpdmVycy9jbGsv
aW14L2Nsay1zY3UuYyAgICAgICAgICAgICAgICAgICAgIHwgMjM0DQo+ICsrKysrKysrKysrKysr
KysrLQ0KPiA+ID4gPiAgZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuaCAgICAgICAgICAgICAgICAg
ICAgIHwgIDU2ICsrKystDQo+ID4gPiA+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2lteDgt
bHBjZy5oICAgICAgICAgfCAgMTQgKysNCj4gPiA+ID4gIDggZmlsZXMgY2hhbmdlZCwgNjIwIGlu
c2VydGlvbnMoKyksIDEwMyBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlDQo+ID4gPiA+IDEwMDY0
NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2lteDgtbHBjZy5oDQo+ID4gPiA+DQo+ID4gPiA+
IC0tDQo+ID4gPiA+IDIuMjMuMA0KPiA+ID4gPg0K
