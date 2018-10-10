Return-Path: <SRS0=fkKI=MW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32777C43441
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 10:59:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE7512075C
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 10:59:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="leyoeaha"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE7512075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbeJJSUy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Oct 2018 14:20:54 -0400
Received: from relmlor3.renesas.com ([210.160.252.173]:24948 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726468AbeJJSUy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Oct 2018 14:20:54 -0400
Received: from unknown (HELO relmlir4.idc.renesas.com) ([10.200.68.154])
  by relmlie2.idc.renesas.com with ESMTP; 10 Oct 2018 19:59:15 +0900
Received: from relmlii2.idc.renesas.com (relmlii2.idc.renesas.com [10.200.68.66])
        by relmlir4.idc.renesas.com (Postfix) with ESMTP id 087127A692;
        Wed, 10 Oct 2018 19:59:15 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,364,1534777200"; 
   d="scan'208";a="294767087"
Received: from mail-os2jpn01lp0143.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([23.103.139.143])
  by relmlii2.idc.renesas.com with ESMTP/TLS/AES256-SHA256; 10 Oct 2018 19:59:14 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sptg6Om5Kg6AZWtzgBc5IaVyiCLmYTGuPhYdhO0hKrw=;
 b=leyoeahabjbkNLC41EbyQnCpNh/KW6LwDPPn44VlH5OoZjYzP1+cwgSmjMhslj3kMMif9ESiaXboOfjQKns6EdgJdzzMSvYT3AYp2GPZmSiOGTy5Klmm/FmleiqX7aWJWvcGWW6KJXawXfDu9w3jG3vWYKszd068soNud4jh4kQ=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB0159.jpnprd01.prod.outlook.com (10.161.134.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.21; Wed, 10 Oct 2018 10:59:11 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::1c53:5c22:c972:dfd4]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::1c53:5c22:c972:dfd4%5]) with mapi id 15.20.1207.029; Wed, 10 Oct 2018
 10:59:11 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
Thread-Topic: [PATCH 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
Thread-Index: AQHUXyNYMRXYUFSEpUaIOmWIUPHxXKUYK5qAgAAkcnA=
Date:   Wed, 10 Oct 2018 10:59:10 +0000
Message-ID: <TY1PR01MB15625FE2255DB4877C4F27068AE00@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20181008162349.42957-1-chris.brandt@renesas.com>
 <20181008162349.42957-3-chris.brandt@renesas.com>
 <CAMuHMdWNe2Z=q1tHO5_YLX1Q6+ef5BiQU=feBdcJfzcNvzo8HQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWNe2Z=q1tHO5_YLX1Q6+ef5BiQU=feBdcJfzcNvzo8HQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB0159;20:iwnmnCEi82STzoxr1ufklFQ3BQPKKn9g2hyM37BdcdQg50Rypnyj6b1ZmWAD5Ld665Zs65q8mcUQvkqbayLtjlIYYwKzhOGYUpsn0dolo80xgFq2sZU//y6vnhbYR7axLhSughy6nzNMxd+nwECQPd4UDPpt9Vskm/tu4dE2V74=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: f92d0407-5632-4841-01dc-08d62e9f68bc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB0159;
x-ms-traffictypediagnostic: TY1PR01MB0159:
x-microsoft-antispam-prvs: <TY1PR01MB01592E1C452AF747B1AF8D1F8AE00@TY1PR01MB0159.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(201708071742011)(7699051);SRVR:TY1PR01MB0159;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB0159;
x-forefront-prvs: 08213D42D3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(39860400002)(366004)(396003)(136003)(199004)(189003)(54906003)(5250100002)(68736007)(478600001)(25786009)(6246003)(7416002)(2906002)(2900100001)(14454004)(446003)(4326008)(11346002)(7736002)(305945005)(316002)(99286004)(486006)(476003)(72206003)(86362001)(74316002)(6436002)(53936002)(33656002)(97736004)(81166006)(81156014)(26005)(8936002)(7696005)(55016002)(6506007)(66066001)(102836004)(256004)(5660300001)(105586002)(76176011)(186003)(71200400001)(71190400001)(3846002)(6116002)(229853002)(6916009)(8676002)(9686003)(106356001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB0159;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: JefZ2LkWOxgEPHXgo2ju0H0eMzYCE7MZ5tR5yyC20HdvVmajlDSFxjsvnGKiczeU1v37mXtQ8ttApaT5y1Z7fVjSvQ5eDOH5n+k7M9YpC0ughpP/26TpobxGdNrKTkHaWcnMXLW6NrOzNYjzYU3NivHSOHrbS9mRMdkj3dH0B/72JphrMgqsN392kjaVj64yt6FX7bwzYtJsh1qSpVnBBoknJD2IouAeyzWGlkcAtr4k2xQUjjEciCzofUaUAyIwkFMASLxCpsXIeUrunwpAGzGAqicrVcW8CkZLbIhqLnq8nR+u/pra0NTFypIo8ZRxxgCuY5M/CDOFKxU87JC0OwnqopsMgsUwluot+s+goP8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f92d0407-5632-4841-01dc-08d62e9f68bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2018 10:59:10.9552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB0159
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFdlZG5lc2RheSwgT2N0b2JlciAxMCwgMjAxOCwgR2VlcnQgVXl0dGVy
aG9ldmVuIHdyb3RlOg0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQoNClRoYW5rcyBmb3IgeW91
ciByZXZpZXchDQoNCg0KPiA+ICsvKiBSWi9BMiBkb2VzIG5vdCBoYXZlIHRoaXMgYml0IChub3Qg
c2FmZSB0byBzZXQgaXQpICovDQo+IA0KPiBUaGlzIGNvbW1lbnQgY29uZnVzZWQgbWUsIGFzIFNE
SElfSU5URVJOQUxfRE1BQ19BRFJSX01PREVfRklYRUQgaXMNCj4gc2V0IGZvciBSWi9BMi4NCj4g
DQo+IHMvdGhpcyBiaXQvdGhlIEFERFJfTU9ERSBiaXQvPw0KDQpPSywgSSBzZWUgeW91ciBwb2lu
dC4NCg0KTWF5YmUgSSBqdXN0IGNoYW5nZSBpdCB0byB0aGlzOg0KDQogIC8qIFJaL0EyIGRvZXMg
bm90IGhhdmUgQURSUl9NT0RFIGJpdCAqLw0KDQpBcyB5b3UgY2FuIGltYWdpbmUsIGl0IGRvZXMg
aGF2ZSB0aGlzIGJpdC4gQW5kIGl0IHdvcmtlZCBmaW5lIGZyb20gbWUuIA0KQnV0IHRoZSBjaGlw
IGd1eXMgc2FpZCB0aGV5IGZvdW5kIHNvbWV0aGluZyBub3QgcmlnaHQgd2l0aCBpdCwgc28gdGhl
eSANCnJlbW92ZWQgaXQgZnJvbSB0aGUgdjEuMCBIYXJkd2FyZSBNYW51YWwuDQoNCg0KQ2hyaXMN
Cg0K
