Return-Path: <SRS0=Lp8A=MI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B97C43382
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 12:30:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4348C206B6
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 12:30:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="lcx2x/SQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4348C206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbeIZSnX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Sep 2018 14:43:23 -0400
Received: from relmlor4.renesas.com ([210.160.252.174]:14135 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727250AbeIZSnW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Sep 2018 14:43:22 -0400
Received: from unknown (HELO relmlir1.idc.renesas.com) ([10.200.68.151])
  by relmlie3.idc.renesas.com with ESMTP; 26 Sep 2018 21:30:34 +0900
Received: from relmlii2.idc.renesas.com (relmlii2.idc.renesas.com [10.200.68.66])
        by relmlir1.idc.renesas.com (Postfix) with ESMTP id 0EDAF7FC56;
        Wed, 26 Sep 2018 21:30:34 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,306,1534777200"; 
   d="scan'208";a="293547914"
Received: from mail-ty1jpn01lp0181.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([23.103.139.181])
  by relmlii2.idc.renesas.com with ESMTP/TLS/AES256-SHA256; 26 Sep 2018 21:30:33 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kuFmeBuSWmPuPI5i+lVIXA+GsIkb4D44lG1uSM4W08=;
 b=lcx2x/SQWN5c+61Th2DD3DwGXF9+U4idGhZgZPy8Ikc6HdR7FOHTVRtmJt3hHFMXfo4HuBFmhtrvJ+wumCzLeJWOs+sg9dPjlQB/QTZSakrjGYa8gD8OwA60/VDuBDJHl75P2SeHN+H2ftOQPq773Lv3d39eGX37v+z+J7y/nEc=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1822.jpnprd01.prod.outlook.com (52.133.168.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Wed, 26 Sep 2018 12:30:32 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::4c54:35d0:3b29:3ec2]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::4c54:35d0:3b29:3ec2%3]) with mapi id 15.20.1164.024; Wed, 26 Sep 2018
 12:30:32 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: RE: [PATCH v2 1/3] clk: renesas: cpg-mssr: Add early clock support
Thread-Topic: [PATCH v2 1/3] clk: renesas: cpg-mssr: Add early clock support
Thread-Index: AQHUVCarLC0V3HV2oUCyk4QRD7NsdKUCTPuAgAAyy+A=
Date:   Wed, 26 Sep 2018 12:30:32 +0000
Message-ID:
 <TYXPR01MB1568A8CBA69F00A42820BEA58A150@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20180924164937.36536-1-chris.brandt@renesas.com>
 <20180924164937.36536-2-chris.brandt@renesas.com>
 <CAMuHMdWhO0A6_wQR44QrB9TkOy6ka417cJN-9bkx8=_k=kfVAQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWhO0A6_wQR44QrB9TkOy6ka417cJN-9bkx8=_k=kfVAQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TYXPR01MB1822;20:PpspfC4XQwL2aSKP3mm+aRBw1YwIK8XEMlkz+47VOIC8fqbFSzbe4Qe9mrkTDMlhKnZ5MssfbwcFxVlY7Wz4ZxAHMzHXihfCRPvvrwLa0A6J5Br9mLinoFAsgDxuq78i/66LZYduCz71s2znJAuzMcTZmQ934VelmNeDajOBAGQ=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 37d7a717-4361-4d60-fd05-08d623abda14
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYXPR01MB1822;
x-ms-traffictypediagnostic: TYXPR01MB1822:
x-microsoft-antispam-prvs: <TYXPR01MB1822686A235E6A944B4BF6968A150@TYXPR01MB1822.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231355)(944501410)(52105095)(6055026)(149066)(150057)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(201708071742011)(7699051);SRVR:TYXPR01MB1822;BCL:0;PCL:0;RULEID:;SRVR:TYXPR01MB1822;
x-forefront-prvs: 08076ABC99
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(136003)(39860400002)(376002)(366004)(199004)(189003)(51914003)(105586002)(106356001)(316002)(478600001)(25786009)(72206003)(186003)(6246003)(34290500001)(102836004)(14454004)(26005)(4326008)(476003)(446003)(11346002)(486006)(66066001)(7696005)(76176011)(97736004)(6506007)(229853002)(99286004)(81166006)(81156014)(8936002)(8676002)(5250100002)(2906002)(68736007)(5660300001)(33656002)(2900100001)(55016002)(345774005)(256004)(71200400001)(53936002)(7736002)(71190400001)(305945005)(14444005)(9686003)(74316002)(86362001)(6916009)(54906003)(3846002)(6116002)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1822;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: OaUGftUGOIo3btUKI2BMxOsraw3zP6HXAfJDQGxOzva+88ip3I9AzQ/1VeRFsu3vfFI9+iAKt+VzcehIz/vb0Cdg0Rl6f4APHP5AhRzP17HeHlXvtvFMSM9kRTgGvD2OXPJ2sbShSaFCil8H/lwQ4ktkZjZJfCEFIV2LoW6IjRu1AOvMOLO0itcOrlr82NpGzPxOOW0oWZwBzTD5jKu1qgMorJRIgB3MzEnQSYLGOjRXbgOkgeRptSG07fdEpgwLziDTI9iyuFPYurQhNT6kfdrauAg+oecvRvpTjLNOLD0V79eQUNyOG57LuxA2qemAsw7IotygvQjV+Xzi2BOIEyXs2VgDcwTvmO0fM37pr6c=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d7a717-4361-4d60-fd05-08d623abda14
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2018 12:30:32.3129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1822
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180926123032.f8CxAtG-dJqX1HATcSUDqKFwlhmlYj09y9fyTyaQSQg@z>

SGkgR2VlcnQNCg0KT24gV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjYsIDIwMTgsIEdlZXJ0IFV5dHRl
cmhvZXZlbiB3cm90ZToNCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiBXb3JrcyBmaW5lIG9u
IFItQ2FyIEdlbjIgYW5kIEdlbjMuDQoNClRoYW5rIHlvdSBmb3IgY2hlY2tpbmchDQoNCg0KPiA+
ICAgICAgICAgc3RydWN0IGNsayAqKmNsa3M7DQo+IA0KPiBJbiB2MSwgeW91IGluaXRpYWxpemVk
IGNsa3MgdG8gTlVMTCwgd2hpY2ggd2FzIG5lZWRlZCAuLi4NCn5+fg0KPiA+ICsgICAgICAgcHJp
di0+YmFzZSA9IG9mX2lvbWFwKG5wLCAwKTsNCj4gPiArICAgICAgIGlmICghcHJpdi0+YmFzZSkg
ew0KPiA+ICsgICAgICAgICAgICAgICBlcnJvciA9IC1FTk9NRU07DQo+ID4gKyAgICAgICAgICAg
ICAgIGdvdG8gb3V0X2VycjsNCj4gDQo+IC4uLiBiZWNhdXNlIGVsc2UgaXQncyBzdGlsbCB1bmlu
aXRpYWxpemVkIGhlcmUgLi4uDQp+fn4NCj4gPiArb3V0X2VycjoNCj4gPiArICAgICAgIGtmcmVl
KGNsa3MpOw0KPiANCj4gLi4uIGFuZCBmcmVlZCBoZXJlLg0KDQpEYW1uISBJIGNvdWxkIG5vdCBy
ZW1lbWJlciB3aHkgSSBzZXQgaXQgdG8gTlVMTC4gQW5kIEkgbW92ZWQgc28gbXVjaCANCmNvZGUg
YXJvdW5kIEkgdGhvdWdodCBpdCB3YXMgYSBtaXN0YWtlLCBzbyBJIHRvb2sgaXQgb3V0Lg0KDQoN
Cg0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4NCj4gaS5lLiB3aWxsIHF1ZXVlIGluIGNsay1yZW5lc2FzLWZvci12NC4yMCwgd2l0aCB0
aGUgYWJvdmUgZml4ZWQuDQoNCk9LLCBJJ2xsIHNlbmQgYSBuZXcgdmVyc2lvbiBvdXQgc2hvcnRs
eS4NCg0KQ2hyaXMNCg0K
