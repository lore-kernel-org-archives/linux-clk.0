Return-Path: <SRS0=aDlN=Q5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E87C43381
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 12:03:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C116D20818
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 12:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="uje0uU8n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbfBVMDu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Feb 2019 07:03:50 -0500
Received: from mail-eopbgr1410134.outbound.protection.outlook.com ([40.107.141.134]:50579
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725926AbfBVMDt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Feb 2019 07:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48r25pzypnQA09yzlPFmFOz/zBmi9Mw/h+e0n3N8JIo=;
 b=uje0uU8n39oEjVz83AzDr7oewSteNTNfSlNiogTOhCJjPsUe54Y+eEWbiOV8VxjfiPLohbUI7uAv4FcIXmwea+FNXDS+uSHA578p/Xtsk78b7+Ac7CImzeWOaRi0I1CGXVYP+JFXznTnYeE1RJ5nnyMNXni7uDcNlzUHE/LeGAI=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1467.jpnprd01.prod.outlook.com (52.133.160.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Fri, 22 Feb 2019 12:03:43 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1643.014; Fri, 22 Feb 2019
 12:03:43 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: r8a774c0: Fix LAST_DT_CORE_CLK
Thread-Topic: [PATCH] clk: renesas: r8a774c0: Fix LAST_DT_CORE_CLK
Thread-Index: AQHUyTar0aJjInAke0Kex+QMbpAYUqXqlYMAgAEEwMCAAB/y0A==
Date:   Fri, 22 Feb 2019 12:03:43 +0000
Message-ID: <TY1PR01MB17704A0F818A4A01A6D82D90C07F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1550678960-1264-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdU=qGGi0jgaN=uvsPPK1XkJChLAdwKZJ+cf4_rJt+gNYQ@mail.gmail.com>
 <TY1PR01MB177050F5C00ED7DE89FB4318C07F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB177050F5C00ED7DE89FB4318C07F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90101c7d-1805-437b-44a6-08d698bdca91
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1467;
x-ms-traffictypediagnostic: TY1PR01MB1467:
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1467;20:zw1nfEdwFpDVF9BtAbKl7DhxUbqt+KGfs4/yZNSCbUDp5TYzLXnJo4q/hO3BwD36l0ihFT6vKIyll+M+VtOZBbWgfb9SS79Srp3HdCWOHvZmbridLqknEi7of5qB8LA+T5vxqPLGkbipICUgbriaM5QnFBhOSVjnizuyU5E8iBw=
x-microsoft-antispam-prvs: <TY1PR01MB1467F93A78E60141F77C8DAAC07F0@TY1PR01MB1467.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09565527D6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(366004)(396003)(346002)(376002)(136003)(199004)(189003)(229853002)(8936002)(7736002)(81156014)(6436002)(6916009)(106356001)(2906002)(81166006)(68736007)(316002)(256004)(8676002)(186003)(14444005)(71190400001)(25786009)(478600001)(93156006)(71200400001)(86362001)(9686003)(74316002)(7696005)(476003)(99286004)(44832011)(6506007)(53546011)(6116002)(54906003)(76176011)(107886003)(11346002)(105586002)(14454004)(26005)(446003)(97736004)(66066001)(3846002)(486006)(2940100002)(53936002)(4326008)(33656002)(102836004)(5660300002)(6246003)(305945005)(55016002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1467;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cUG/DVtTgXvwN6XqE5yL0UPaeJqChdjsfTrTRxRai5bWQoNmjccjiO1VsbvoLT8KLRpk6M1AuaOgcaUsErQu/i612m5aq807VhZUQ4qU8YYTfSP62m0GSBGNCL88t/DYgHIGXAYmJfH8ezvKsjSQuh5b6/hKbQeDUi3l2Y76u2w/6HG4aSOVi450bptiFSLfGBS8THsFEXJf1Dwh4YTIjB8vyki8KtUhCOW0+jPdxFlCz/xbtXB0mEPXbHFUIHXSnvrfJyu3yEz59+NitlhaTlWiyFqnxK4OYFBwHuPKO3sTjeqcQqBuN1UVradIdcbqizb5bGGiaanOisl2ul46mLI+3T26wJ1Vst7EV3IDyFM/TJTXH7YARDZif3yZtbU0NN1PRBMt1pvJqxanjCR28TQ0ZHAdRjpmzw1ZKGNfDWU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90101c7d-1805-437b-44a6-08d698bdca91
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2019 12:03:43.2761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1467
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNCj4gRnJvbTogbGludXgtcmVuZXNhcy1zb2Mtb3duZXJAdmdlci5rZXJu
ZWwub3JnIDxsaW51eC1yZW5lc2FzLXNvYy1vd25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uIEJlaGFs
ZiBPZiBGYWJyaXppbyBDYXN0cm8NCj4gU2VudDogMjIgRmVicnVhcnkgMjAxOSAxMDoxMg0KPiBT
dWJqZWN0OiBSRTogW1BBVENIXSBjbGs6IHJlbmVzYXM6IHI4YTc3NGMwOiBGaXggTEFTVF9EVF9D
T1JFX0NMSw0KPiANCj4gSGVsbG8gR2VlcnQsDQo+IA0KPiA+IEZyb206IGxpbnV4LXJlbmVzYXMt
c29jLW93bmVyQHZnZXIua2VybmVsLm9yZyA8bGludXgtcmVuZXNhcy1zb2Mtb3duZXJAdmdlci5r
ZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgR2VlcnQgVXl0dGVyaG9ldmVuDQo+ID4gU2VudDogMjEg
RmVicnVhcnkgMjAxOSAxODozNA0KPiA+IFRvOiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNh
c3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBjbGs6IHJlbmVz
YXM6IHI4YTc3NGMwOiBGaXggTEFTVF9EVF9DT1JFX0NMSw0KPiA+DQo+ID4gT24gV2VkLCBGZWIg
MjAsIDIwMTkgYXQgNTowOSBQTSBGYWJyaXppbyBDYXN0cm8NCj4gPiA8ZmFicml6aW8uY2FzdHJv
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEVudW0gTEFTVF9EVF9DT1JFX0NMSyBuZWVk
cyB1cGRhdGluZyBhcyBSOEE3NzRDMF9DTEtfQ0FORkQNCj4gPiA+IHdhcyByZWNlbnRseSBhZGRl
ZCBhbmQgaXQncyB0aGUgY29yZSBjbG9jayB3aXRoIHRoZSBoaWdoZXN0DQo+ID4gPiBpbmRleC4N
Cj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNh
c3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IE5pY2UgY2F0Y2ghDQo+ID4gWW91IG9ubHkg
bm90aWNlIHRoaXMga2luZCBvZiBidWcgd2hlbiB5b3Ugc3RhcnQgcmVmZXJlbmNpbmcgdGhlIGNs
b2NrDQo+ID4gZnJvbSBEVCwgcmlnaHQ/IEF0IHJlZ2lzdHJhdGlvbiB0aW1lLCB0aGUgY2xvY2sg
bnVtYmVyIHNwYWNlIGlzIHNoYXJlZCB3aXRoDQo+ID4gaW50ZXJuYWwgY29yZSBjbG9ja3MsIHNv
IG5vIGVycm9yIGlzIGRldGVjdGVkLg0KPiA+IENhbiB3ZSBpbXByb3ZlIHRoYXQ/DQo+IA0KPiBJ
IGNhbiBsb29rIGludG8gaXQNCg0KQWN0dWFsbHksIGl0IHNlZW1zIGxpa2UgSSBhbSBhIGJpdCB0
aWdodCBvbiB0aW1lLCBub3Qgc3VyZSBJIGFtIGdvaW5nIHRvIGhhdmUgdGhlIGNoYW5jZSB0byBs
b29rIGludG8gdGhpcywgc29ycnkgR2VlcnQNCg0KVGhhbmtzLA0KRmFiDQoNCj4gDQo+ID4NCj4g
PiBGaXhlczogMmE2ZWZiYzZkYTVkMjQ4YyAoImNsazogcmVuZXNhczogcjhhNzc0YzA6IEFkZCBt
aXNzaW5nIENBTkZEIGNsb2NrIikNCj4gDQo+IENvbW1pdCAyYTZlZmJjNmRhNWQyNDhjIGlzIG5v
dCBpbiBhIHJlbGVhc2Ugb3IgaW4gYSByYywgaXMgaXQgb2sgdG8gcmVmZXIgdG8gaXQgd2l0aCBh
IGZpeGVzIHRhZz8NCj4gDQo+ID4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4NCj4gPiBNaWtlL1N0ZXBoZW46IGNhbiB5b3UgcGxl
YXNlIHRha2UgdGhpcyBvbmUgZGlyZWN0bHksIGFzIGl0IGlzIGEgZml4IGZvcg0KPiA+IGNsay1u
ZXh0Pw0KPiA+DQo+ID4gRmFicml6aW86IExvb2tzIGxpa2UgUjhBNzc0QTEgaGFzIHRoZSBzYW1l
IGJ1Zy4gQ2FyZSB0byBmaXggdGhhdCBhcyB3ZWxsPw0KPiANCj4gV2lsbCBkbw0KPiANCj4gVGhh
bmtzLA0KPiBGYWINCj4gDQo+ID4NCj4gPiBUaGFua3MhDQo+ID4NCj4gPiBHcntvZXRqZSxlZXRp
bmd9cywNCj4gPg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+ID4NCj4gPiAt
LQ0KPiA+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gPg0KPiA+IEluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQNCj4gPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dy
YW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
