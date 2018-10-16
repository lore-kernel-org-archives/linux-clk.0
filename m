Return-Path: <SRS0=lNOc=M4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299E1C04EBD
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 06:17:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA32A20866
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 06:17:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="rsuxpqzK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA32A20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbeJPOGQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Oct 2018 10:06:16 -0400
Received: from mail-eopbgr00054.outbound.protection.outlook.com ([40.107.0.54]:62584
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726729AbeJPOGQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Oct 2018 10:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmLpy7U2+YuF1dN4fa92ulhdOZouC/xuCfwnec8ki5E=;
 b=rsuxpqzKOJbZ1mIT3+/rSXXx32hm22pxzVbYb4ZxvPRmcXjOOZxzabxmbkfvDEKSA2rjzL4OpYTnG2Jwc3c5Qy6v88BA1wjsjszDMkjPX9yA0/8KLFTocREV6k9we8t/p+dikPx35nbjtTqkeSGirnH5KRCbJtcRxbwqQ/ao7tc=
Received: from DB5PR0401MB2213.eurprd04.prod.outlook.com (10.166.173.8) by
 DB5PR0401MB1733.eurprd04.prod.outlook.com (10.165.5.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Tue, 16 Oct 2018 06:17:20 +0000
Received: from DB5PR0401MB2213.eurprd04.prod.outlook.com
 ([fe80::c0b5:26f1:bc9e:5a31]) by DB5PR0401MB2213.eurprd04.prod.outlook.com
 ([fe80::c0b5:26f1:bc9e:5a31%6]) with mapi id 15.20.1228.027; Tue, 16 Oct 2018
 06:17:18 +0000
From:   Andy Tang <andy.tang@nxp.com>
To:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "oss@buserror.net" <oss@buserror.net>
CC:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/3] clk: qoriq: add t1023 soc support
Thread-Topic: [PATCH 1/3] clk: qoriq: add t1023 soc support
Thread-Index: AQHUT+xXwE+pIxtpN025CWssqdGm96Uhj7tw
Date:   Tue, 16 Oct 2018 06:17:18 +0000
Message-ID: <DB5PR0401MB22134ACEF603C05F6B0D9980F3FE0@DB5PR0401MB2213.eurprd04.prod.outlook.com>
References: <20180919073906.34187-1-andy.tang@nxp.com>
In-Reply-To: <20180919073906.34187-1-andy.tang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andy.tang@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;DB5PR0401MB1733;6:dIYo6AI/Sw84lXhqteq8xmqMiJaiL60FOMepaHwZ/RdCcFNPYs1PNWUIc/0aSG+TCsNjSEu1et8YKS7fxz0a8Hku3zBFwL/LiaelL2yBv4pRQkQEIOD0ybSQxzVKb5dbtC5bwL+YsdO0a3gtTiJfk/gttQjADRX2pknomhBNtbxT15h7y+l93dV5w8pgtF0VUWpXrMFwTqbF+SbnvtobYqU8J99dqg6FMtGTHbIZnI+yawEDyE/qBVRmfCK5XCZAjtaDe30nE1H9emiNsFBZuec6ZI/QT/ud5x+NeirJEL4JzvYyZatBRpVuNQGfQu6/IqD8mfnk7L9YnqsVkQ+eAqEBorjE3p9TIlYLd9SS1bC+5hIfaAQ8+Xp9S8ebacoK4urHCqoCQ8TmnG2zXbjScaAWUwIaW5kJPD9XC91wgCIwv1bjKu5jv4OnT5NKG3ZEG4ySOtQXaU6csSUXzvCajg==;5:T371+Z3lTGENXtu3zmM8bZHHABAjs556XBYP1tQujl2C1ySXHYlV9PQdWJ5z/+jzF4k9k/8AqO6u9giJ+CGxUDK1Te++vAg7VCYPD52trpR2CexKmz1L8jbNV/bYqjNpyCu8G9ASZk/8z6M9rPdxWmc/4lxufMajQiLSKzGsOmA=;7:/2dC5+H30rZZhN6D5sXlN8W/d8QccEKEClgXA6Ka14+3CRIE2IznNSPzTxPVzhErZMUWaReVxfqBa3iqJ+aEMCoQX3Osd0vqYsdudvJYZb98ZdZ/XlyMzwHzyJiBKP6xgbAlSuyd09AZ2kW/VfbeDABOrDx3GbrH5lqL2qSmAcFpDN2voi9NpNss8ZXBG380FpHMWJ/iRpxtSfVxYBEOkYx7ug90jPq8Uy85D3AXSXq8tvKjxuypylIpd3bFsEj7
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 73506088-e5ed-4fad-94aa-08d6332f06b0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:DB5PR0401MB1733;
x-ms-traffictypediagnostic: DB5PR0401MB1733:
x-microsoft-antispam-prvs: <DB5PR0401MB1733B01629D798D748FEFB42F3FE0@DB5PR0401MB1733.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(180628864354917)(9452136761055);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231355)(944501410)(52105095)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051);SRVR:DB5PR0401MB1733;BCL:0;PCL:0;RULEID:;SRVR:DB5PR0401MB1733;
x-forefront-prvs: 0827D7ACB9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(366004)(346002)(396003)(39860400002)(13464003)(501624003)(189003)(199004)(97736004)(229853002)(26005)(14454004)(2501003)(7736002)(305945005)(74316002)(4326008)(478600001)(33656002)(256004)(5250100002)(106356001)(102836004)(6246003)(11346002)(105586002)(71200400001)(446003)(66066001)(53936002)(71190400001)(55016002)(68736007)(54906003)(81166006)(81156014)(8676002)(6436002)(486006)(186003)(5660300001)(44832011)(2906002)(99286004)(316002)(8936002)(76176011)(86362001)(25786009)(110136005)(53546011)(476003)(7696005)(3846002)(9686003)(6116002)(2900100001)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:DB5PR0401MB1733;H:DB5PR0401MB2213.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 3HaSNVqK9XeA+px9mhH9Q7Lh5y22DzGc0NsYJyhgMA34b4fsgY5MNYZXqkyztZMh7eaa4lxOObs0t76trqfS+kWdBKl+vXOZotjUUPYsV7fiXGWf67afIC8vLqFK71h8YTblYOQTboc6Tgajgs+8c4X0NC7EPkTueYiUJB+HB7MwBfT0cOW9xL1D693CIqkq+bcCr1oXL+KBBGdmdmnKPvBhrd63VOft0QBkB5hCDArs4dce/QwrVad8Oz7b1iqs4SCBaenuAMW8WJLYuD72xvwT9vD+RPhyS1WZDkjOD7G803RG8p0Cexo3YvAGmIfjc0obiMIzc/T9HRfzypdomriNCq/z79DCHE5OXeOKafc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73506088-e5ed-4fad-94aa-08d6332f06b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2018 06:17:18.3595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR0401MB1733
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGksDQoNCkFwcHJlY2lhdGUgaWYgeW91IGNhbiB0YWtlIGEgbG9vayBhdCB0aGlzIHBhdGNoIHNl
dC4NCg0KQlIsDQpBbmR5DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
YW5keS50YW5nQG54cC5jb20gPGFuZHkudGFuZ0BueHAuY29tPg0KPiBTZW50OiAyMDE4xOo51MIx
OcjVIDE1OjM5DQo+IFRvOiBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsgb3NzQGJ1c2Vycm9yLm5l
dA0KPiBDYzogc2JveWRAa2VybmVsLm9yZzsgcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxh
bmRAYXJtLmNvbTsNCj4gbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7IEFuZHkgVGFuZw0KPiA8YW5keS50YW5nQG54cC5jb20+DQo+IFN1YmplY3Q6
IFtQQVRDSCAxLzNdIGNsazogcW9yaXE6IGFkZCB0MTAyMyBzb2Mgc3VwcG9ydA0KPiANCj4gRnJv
bTogWXVhbnRpYW4gVGFuZyA8YW5keS50YW5nQG54cC5jb20+DQo+IA0KPiBBZGQgdDEwMjMgY2xv
Y2sgY29tcGF0aWJsZSBzdHJpbmcgdG8gdGhlIGJpbmRpbmdzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogVGFuZyBZdWFudGlhbiA8YW5keS50YW5nQG54cC5jb20+DQo+IC0tLQ0KPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2xvY2svcW9yaXEtY2xvY2sudHh0ICAgICAgfCAgICAxICsNCj4gIDEg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9xb3JpcS1j
bG9jay50eHQNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svcW9y
aXEtY2xvY2sudHh0DQo+IGluZGV4IDk3ZjQ2YWQuLjM0ZTE5MzMgMTAwNjQ0DQo+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9xb3JpcS1jbG9jay50eHQNCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3FvcmlxLWNsb2Nr
LnR4dA0KPiBAQCAtMzcsNiArMzcsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiAgCSogImZz
bCxsczEwNDZhLWNsb2NrZ2VuIg0KPiAgCSogImZzbCxsczEwODhhLWNsb2NrZ2VuIg0KPiAgCSog
ImZzbCxsczIwODBhLWNsb2NrZ2VuIg0KPiArCSogImZzbCx0MTAyMy1jbG9ja2dlbiINCj4gIAlD
aGFzc2lzLXZlcnNpb24gY2xvY2sgc3RyaW5ncyBpbmNsdWRlOg0KPiAgCSogImZzbCxxb3JpcS1j
bG9ja2dlbi0xLjAiOiBmb3IgY2hhc3NpcyAxLjAgY2xvY2tzDQo+ICAJKiAiZnNsLHFvcmlxLWNs
b2NrZ2VuLTIuMCI6IGZvciBjaGFzc2lzIDIuMCBjbG9ja3MNCj4gLS0NCj4gMS43LjENCg0K
