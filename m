Return-Path: <SRS0=Dsg5=MG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA787ECE560
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 16:33:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 598172087A
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 16:33:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="TyvlG4o+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 598172087A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728731AbeIXWgo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Sep 2018 18:36:44 -0400
Received: from relmlor3.renesas.com ([210.160.252.173]:45239 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728006AbeIXWgo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 18:36:44 -0400
Received: from unknown (HELO relmlir2.idc.renesas.com) ([10.200.68.152])
  by relmlie2.idc.renesas.com with ESMTP; 25 Sep 2018 01:33:44 +0900
Received: from relmlii1.idc.renesas.com (relmlii1.idc.renesas.com [10.200.68.65])
        by relmlir2.idc.renesas.com (Postfix) with ESMTP id 1419841CB0;
        Tue, 25 Sep 2018 01:33:44 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,298,1534777200"; 
   d="scan'208";a="291769941"
Received: from mail-os2jpn01lp0144.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([23.103.139.144])
  by relmlii1.idc.renesas.com with ESMTP/TLS/AES256-SHA256; 25 Sep 2018 01:33:43 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bGBwo5tpWQ8zjnINfT0eOhzmtV7fmY0aP+0OYFIGhs=;
 b=TyvlG4o+DdwMAjl16otr3sGMVFZWdUTY4hB6OO7H80H+zv26jhm8KB1VfF3u/TAyGqmuI7RD7hlMUydvAvKFtnQRymS6T34WCF7jkKQPhJ9Oh4FowWMfuKAWe8WdJ0I+ei3wvyesM+KPJcan4PfP6nfPxOV68P+HXuy4Aa09gbQ=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB1801.jpnprd01.prod.outlook.com (52.133.164.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1143.17; Mon, 24 Sep 2018 16:33:42 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::ddef:a4c2:976a:66d1]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::ddef:a4c2:976a:66d1%2]) with mapi id 15.20.1164.024; Mon, 24 Sep 2018
 16:33:42 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: RE: [PATCH 1/2] clk: renesas: cpg-mssr: Add early clock support
Thread-Topic: [PATCH 1/2] clk: renesas: cpg-mssr: Add early clock support
Thread-Index: AQHUUb68Hdk61d2nPEGv1I3hQX/iS6T/KAoAgAB6CUA=
Date:   Mon, 24 Sep 2018 16:33:42 +0000
Message-ID:
 <TY1PR01MB15626143507C7AB078EB2B9D8A170@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180921152054.117774-1-chris.brandt@renesas.com>
 <20180921152054.117774-2-chris.brandt@renesas.com>
 <CAMuHMdUWFp9nBR8EQtADHePPqGQZ-3bHrANQULz-QnXJLQy2fA@mail.gmail.com>
In-Reply-To: <CAMuHMdUWFp9nBR8EQtADHePPqGQZ-3bHrANQULz-QnXJLQy2fA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1801;20:Z5NEouvsuzGYPqjAq0YVbP0zNrcwvNez7JH+bRgzF0D5NcX7VBNoSdXJFAm0exFPJMqicWo0wz8tn4KuUHDjeQqjFQpLI+GxkTPCmo7Lge9HAyIABMtu6pvWM411rGXx5ef3FLeIpLa+H6PDMqUCRMZYUPg7Kt3AzAPKWPP2Fs4=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: fd131d36-1566-4f9f-56ae-08d6223b7d75
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1801;
x-ms-traffictypediagnostic: TY1PR01MB1801:
x-microsoft-antispam-prvs: <TY1PR01MB1801237BCFD0153C426ED8658A170@TY1PR01MB1801.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231355)(944501410)(52105095)(6055026)(149066)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(201708071742011)(7699051);SRVR:TY1PR01MB1801;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB1801;
x-forefront-prvs: 0805EC9467
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39850400004)(136003)(346002)(396003)(376002)(199004)(189003)(102836004)(106356001)(316002)(305945005)(229853002)(86362001)(4326008)(486006)(6436002)(74316002)(7696005)(54906003)(99286004)(105586002)(76176011)(6916009)(9686003)(2906002)(256004)(7736002)(26005)(53936002)(71190400001)(55016002)(68736007)(71200400001)(81166006)(81156014)(8936002)(66066001)(11346002)(446003)(2900100001)(5250100002)(186003)(33656002)(8676002)(6506007)(14454004)(478600001)(5660300001)(97736004)(6246003)(72206003)(476003)(3846002)(25786009)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1801;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: aqS7wJsCeWMKMoTG/4MD0XAScE6nncYJCI0tphrVHkLtBgKjftOEUVM7O/8YaawbrYTnWxyGwNGV/5xOkiur1aYBOR5U2Jbd3g5Lt26zdLnMt20v8l78hf9lsWAnYLvxUiwim13YQ50plvZ1mAxnNPRs/4q3B9okCmyO+eGFqrYs1xeL+ol8oxtIlWEUiLqnyZqm5L5VfH84aiGaPaotmYecn1I/ge4IIo10kBqZ1gLlu/y98nr/VawsOZSFUqr7W0SLD7MCoKBAkTwgJyPB5ctBBp6dhSmADtFi609zAEeBCGU7rDdnID09xqhTf/WeQ1OTLcEsiDrWaoE71twF9So3aFklc12aYQEP0WCmcoM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd131d36-1566-4f9f-56ae-08d6223b7d75
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2018 16:33:42.2340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1801
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180924163342.fNwhSJ-rBpoxRpa4Z5zNHnoB12kAsh62-aJ1YRrlwOo@z>

SGkgR2VlcnQsDQoNCk9uIE1vbmRheSwgU2VwdGVtYmVyIDI0LCAyMDE4LCBHZWVydCBVeXR0ZXJo
b2V2ZW4gd3JvdGU6DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCg0KVGhhbmtzIGZvciB5b3Vy
IHJldmlldyENCg0KPiA+ICtzdHJ1Y3QgY3BnX21zc3JfcHJpdiAqZWFybHlfcHJpdjsNCj4gDQo+
IHN0YXRpYw0KPiANCj4gSnVzdCBjYWxsIHRoZSBwb2ludGVyIGNwZ19tc3NyX3ByaXYsIGFzIHlv
dSdyZSBnb25uYSBuZWVkIGl0IGluIGJvdGgNCj4gY2FzZXMNCj4gKHNlZSBiZWxvdyk/DQoNClNl
ZW1zIHN0cmFuZ2UgdG8gaGF2ZSBhIHZhcmlhYmxlIHdpdGggdGhlIHNhbWUgbmFtZSBvZiB0aGUg
c3RydWN0IHR5cGUgDQp0aGF0IGl0IGlzLi4uLmJ1dCBJIGNoYW5nZWQgYXMgeW91IHN1Z2dlc3Rl
ZC4NCg0KDQpJIGFsc28gbWFkZSBhbGwgdGhlIG90aGVyIGNoYW5nZXMgeW91IHN1Z2dlc3RlZCBm
b3IgYm90aCBwYXRjaGVzIGFuZCANCnJldGVzdGVkLg0KDQoNCj4gPiArICAgICAgIGlmIChlYXJs
eV9wcml2KSB7DQo+ID4gKyAgICAgICAgICAgICAgIHByaXYgPSBlYXJseV9wcml2Ow0KPiA+ICsg
ICAgICAgICAgICAgICBwcml2LT5kZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICsgICAgICAgfSBlbHNl
IHsNCj4gPiArICAgICAgICAgICAgICAgZXJyb3IgPSBjcGdfbXNzcl9jb21tb25faW5pdChkZXYs
IGRldi0+b2Zfbm9kZSwgaW5mbyk7DQo+IA0KPiBPb3BzLCBwcml2IGlzIG5vdCBzZXQgPT4gQk9P
TS4NCj4gSSBndWVzcyB5b3UgaGF2ZSBubyBvdGhlciBoYXJkd2FyZSB1c2luZyB0aGUgcmVuZXNh
cy1jcGctbXNzciBkcml2ZXI/DQo+IFlvdSBjYW4gcHJvYmFibHkgc3RpbGwgdGVzdCB0aGlzIGNh
c2Ugb24gUlovQTIgd2l0aG91dCBwYXRjaCAyIChvciB3aXRoDQo+IHRoZQ0KPiBPRl9DTEtfREVD
TEFSRV9EUklWRVIoKSBsaW5lIGNvbW1lbnRlZCBvdXQpLCBhbmQgd2l0aCB0aGUgT1NUTSB0aW1l
cg0KPiBoYWNrDQo+IHlvdSBwb3N0ZWQgYmVmb3JlLg0KDQpXZWxsLi4uSSBoYXZlIGEgUlovRzEg
Ym9hcmQgaW4gYSBib3ggc29tZXdoZXJlLi4uDQoNCkJ1dCBpbnN0ZWFkLCBsaWtlIHlvdSBzdWdn
ZXN0ZWQsIEkgYXBwbGllZCB0aGUgT1NUTSBzdWJzeXNfaW5pdGNhbGwgaGFjaw0KYmFjayBpbiBh
bmQgY2hhbmdlZCByN3M5MjEwLWNwZy1tc3NyLmMgdG8gYmUgbm9uLWVhcmx5IGxpa2UgdGhlIG90
aGVyIA0KUi1DYXIgU29Dcy4NCkFuZCBub3csIG5vIGNyYXNoLiBTbyBJIHRoaW5rIEknbSBnb29k
IHRoaXMgdGltZS4NCg0KVGhhbmtzIQ0KDQpDaHJpcw0KDQo=
