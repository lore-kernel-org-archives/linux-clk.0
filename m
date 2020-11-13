Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C417C388F7
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 08:14:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F418822226
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 08:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="lDBWrlTv";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="X7escS6E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgKMIOJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Nov 2020 03:14:09 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:50156 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKMIOI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Nov 2020 03:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605255247; x=1636791247;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=7ppDu8TK42I/BL8uFsZLwQT5d0TJiclZm6vvSbwFDL8=;
  b=lDBWrlTvswxKRzO83laC7pg6cPa+XZto7up7eiYACBmKSFEwHGGEY9XT
   5LiqAnZJsgK3mGggIDRZQt2H1IyFjtr8zA0BPGz0IAbLy5DqhaQZWU2w5
   npAHfXZVOEOaAHv4BPBIF/900OM5st8Mj+ydVJFdE9fu3pR5CLscP/dWa
   WPU7SEQVcZeuLbBMkBPNr7pS6PFBXD4BjPS+wNweLTekNwOJGlFEwXhgF
   bkJxIuGfeAadG1Edt/PAtncfSEu8QAK4ojB8BH/o0oP0w10gkuLOwIpA6
   vHT8PdGJ/khC87PcvxxVdPNxrljHXWaDP4pgRLMYre+cWYKXRF9ca0IKv
   g==;
IronPort-SDR: meGXKhGi6b2bNicOdrls07Q0XTysk/9zmomcYLQ8PBylS/VUus6GkPTpfnXsWzeXRrXT57lZB7
 y82Qqzh0WrjCsYP9Sd5cI37GrBXQ4ADNg/bUY6JJ/K1JGr0fTaJrYvuR21JXpwwowye2ihBVdx
 JIf9pxG1Gd/WBqCwUkwbW2Jv8l1I2Kz0QWbfA5gbFyCIVLGC7P8U2jHfeZOUEzBSmNyYF2WUor
 efTu8UwWg8InNo7qm6ZHqOegzShdAA2lFGLnTBCMbKfavzGc07dZApwhP1etoFQDlH4C54Bt0z
 1Cs=
X-IronPort-AV: E=Sophos;i="5.77,475,1596470400"; 
   d="scan'208";a="262577492"
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
  by ob1.hgst.iphmx.com with ESMTP; 13 Nov 2020 16:14:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6Oo3sS41YqUrN9Y6ls7O+vdytWsPvhaWHqMLpxqJ/tS/VltXdDu6OTgTt5t+F9YIQf5UScoWtoLg63ytExI05SU5mNCMkeWdECAOlCdhw3zQ7KQ/l47kURnxKIAbn3iMecLzRZ4tY8yhk6Emc7Z9OYbuSvbdQuI5EFVDI8UiAYJCIQ5wx6LusKqBH1kkbACokNn2bNjneXF76JTtHlR1ed+TCZ886eK0eN7iUiNEXmcUtpafl30vLDwdIVTTOHDwXhmknz9NTv84QQky9n45EkquW67fRtfzs4wZetR2kPW3yjHptIXOFBsPRuJhgaIy6ljtCd5qOpFpqeAhxOZ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ppDu8TK42I/BL8uFsZLwQT5d0TJiclZm6vvSbwFDL8=;
 b=kcSyouNMGj4ndnwNbVw48DbXrx947fBpWFdSystI3+wR9cDXjYqkY4frzzpuXPJmkXIhAQqR0IXhs5ijS0qa8bNLFgqmfx/xYnVrSvK2NM66cPHHPhgJ12sA1XvHCcsXP4LS03pkmGzt9oD6vh1k1Wj4h5bPfSY2yyUJa76w7xq63HmKzT4RusWWfNzm0OUctQzRs85HGJqjttZg6jZfaZSPAjaz90tzFfmayNP7mCwX8xH4p0IhdNPYh4avzPzOosQY8f1eifYwTT9NsORlqfLaFXkcDg6NsNnK8xBr+OYZx0I+bbwk/fmDEJVeCo5AkZeDChgWbFTR5EpevIIklQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ppDu8TK42I/BL8uFsZLwQT5d0TJiclZm6vvSbwFDL8=;
 b=X7escS6EQoviutd2BSZ75oDyQVdcBx+HmAE9/GNpSiIXuqZspcM0GiAkAD5iVMtdSV1X7Be/XZ3j966WVnx++a4dYXcxKO7sip0Zg2Hr/6sV8E45In8ynBPW44dDJIZHcqynuFubVWF1Hfv1uub7hwlOMiUTtnQvgHwgNV6HP9A=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6448.namprd04.prod.outlook.com (2603:10b6:208:1a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 13 Nov
 2020 08:14:05 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 08:14:04 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "seanga2@gmail.com" <seanga2@gmail.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [PATCH 18/32] riscv: Add Kendryte K210 SoC clock driver
Thread-Topic: [PATCH 18/32] riscv: Add Kendryte K210 SoC clock driver
Thread-Index: AQHWtN4jRai8B6CcmE25fi2yRyM25Km8r46AgAkQmoA=
Date:   Fri, 13 Nov 2020 08:14:04 +0000
Message-ID: <9143de0bcd1c938ebe8bbba07fcce3dd5cd04b89.camel@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
         <20201107081420.60325-19-damien.lemoal@wdc.com>
         <ebb57013-556a-ff84-c8ca-a8c125be1eef@gmail.com>
In-Reply-To: <ebb57013-556a-ff84-c8ca-a8c125be1eef@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3c03c558-b8af-490a-9575-08d887ac1626
x-ms-traffictypediagnostic: MN2PR04MB6448:
x-microsoft-antispam-prvs: <MN2PR04MB6448EFCCAEC5E3E8B79DE983E7E60@MN2PR04MB6448.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8grEqGf+ip3kXYFNWq6l5f15J6k+lvXsK5NQvNuRuZUGKoCVJHlAcQju8Sio14mX/aVp0gY11A5gT2HZJGUdgKRXthzIaOae3sd7nW/Avhn5jXPJMfgZtPPEPSKzicP64+1n+qvdTZtWOtUAJgTQjM6mGEbPnn/MEpBq2Qzb8WlY9CVUmHu6DY7T+vNc36Fcdd1KIO+5OQLS1/Ei/st9PM6L1S1gmzn+NdH/MFlauHP8hfx0Gl9TXcEUgAQGSr8LbpGZP2J+LY8shWAkdPQMHaWOM8VErcONno6fH76/WPt7H1HP4kIogEtBtGVlnnV9mV9bmA3BQ1UImg1Q3T4nQQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(6486002)(66556008)(64756008)(66446008)(36756003)(83380400001)(8676002)(478600001)(4744005)(6506007)(8936002)(2616005)(186003)(76116006)(71200400001)(5660300002)(6512007)(91956017)(316002)(2906002)(66476007)(86362001)(110136005)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Wu43j9Xv4ERtrriZe5ifgDXpMomvlETvTr1pAYhLQgLaEwdf+E8Dj2kEi+AJsjN6Z1c9p+usjxayOYQ9Z0RHKEZM2XxP3VwxXEWb+u6PGQLMm3ADkwuIMEj7DI/s1qdMTGK5mkMtaZf9XVzC5W2d0ptehMfIR9j2jY1vxwpftjOz3Vpa8xUjnV6tDnqpSTfT27GtaKrgjeWKhnioI17X220UJ16OjP2kH0o1GR7x6s2/13ns9mD+Dc4BIaBVdwmF/91ajARdLoohwGG6PAGP9WjoHqTYhO5SnA1d1HFanOcsl3cayIYgQinYg6qRF6+f6CYF3WRJ5IpSLFTGN62aYEDHo1CcGcKoPjqSuRqcWGyEkLr4ypcsnsmeKJKRsxfXQ+qCtuc/FnIXB6ux3R9En6Oy3Ky6xy/dhKlrBru601cSjX8tq3UiEYCtsUY9e/ew6OTV0WnY/GSvPua9wJFtIFGCZrvgMpjeBQPwQ2hl7/bTUt4qEKDFWRqe6Rt2TW86Zbzw0WLS5A/DnmUiIB8/5gR4Lv9gCtr1tN+nO0YpGUtYnPLaXYD2rBFJ8ZgfdiyJwVfVOpme1MRvdcBLoYur9PnN3BicDp5Ja03oVAkimAWFveQUeZFGGxdZIqy9B9YCJg56YCLHkhqe69Q5kZj4HIW3ypMeHwgz35DTszicWXG76FcvgCj7zV1PRnLDjY83UjYJ+fixxPEQbZiKjIuC+Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB9D031841AF7B4EA7495EC92BACB76C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c03c558-b8af-490a-9575-08d887ac1626
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 08:14:04.7786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Me3svoRmhzukFTkIhoPdHpMxFw64osPF2IRyT+GpNGfEgCcrg7fgBlrlQcNwd+/BPqUuQgsD+PS8WYKpzWpBFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6448
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gU2F0LCAyMDIwLTExLTA3IGF0IDA4OjQ4IC0wNTAwLCBTZWFuIEFuZGVyc29uIHdyb3RlOg0K
Wy4uLl0NCj4gPiArc3RhdGljIHZvaWQgazIxMF9wbGxfZGlzYWJsZV9odyhzdHJ1Y3QgazIxMF9w
bGwgKnBsbCkNCj4gPiArew0KPiA+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiArCXUzMiBy
ZWc7DQo+ID4gKw0KPiA+ICsJLyoNCj4gPiArCSAqIEJ5cGFzc2luZyBiZWZvcmUgcG93ZXJpbmcg
b2ZmIGlzIGltcG9ydGFudCBzbyBjaGlsZCBjbG9ja3MgZG9uJ3Qgc3RvcA0KPiA+ICsJICogd29y
a2luZy4gVGhpcyBpcyBlc3BlY2lhbGx5IGltcG9ydGFudCBmb3IgcGxsMCwgdGhlIGluZGlyZWN0
IHBhcmVudA0KPiA+ICsJICogb2YgdGhlIGNwdSBjbG9jay4NCj4gPiArCSAqLw0KPiANCj4gRGlk
IHlvdSBnZXQgdGhlIGJ5cGFzcyBiaXQgdG8gd29yaz8gSSdtIHN0aWxsIGhhdmluZyB0byBieXBh
c3MgdmlhDQo+IHJlLXBhcmVudGluZyBBQ0xLIGluIFUtYm9vdC4gUGVyaGFwcyBpdCBpcyBvbmx5
IG5lY2Vzc2FyeSBpZiB5b3UgY2hhbmdlDQo+IHRoZSByYXRlIGFzIHdlbGw/DQoNCk5vcGUuIE5v
IGx1Y2sgdGhlcmUuIFRoZSBLZW5kcnl0ZSBTREsgYWxzbyBkb2VzIGEgcmVwYXJlbnRpbmcgb2Yg
QUNMSyB0byBJTjANCndoZW4gY2hhbmdpbmcgdGhlIFBMTCByYXRlLiBTbyBJIGd1ZXNzIEkgc2hv
dWxkIHJlbW92ZSB0aGUgY29tbWVudCBtYXliZS4NCg0KSW4gYW55IGNhc2UsIHRoaXMgaXMgYWxs
IHJ1bm5pbmcgd2l0aCB0aGUgZGVmYXVsdCByYXRlcywgZXhjZXB0IGZvciBQTEwxIHJhdGUNCndo
aWNoIGlzIGNoYW5nZWQgaW4gZWFybHkgaW5pdCBjb2RlIHRvIGVuZCB1cCB3aXRoIG1hdGNoaW5n
IGZyZXF1ZW5jaWVzIGZvciBhbGwNClNSQU0gYmFua3MuIFNvIEkgZG8gbm90IHRoaW5rIHRoYXQg
dGhlIG5vdC1zby1lZmZlY3RpdmUgYnlwYXNzIGlzIGFuIGlzc3VlDQpoZXJlLg0KDQotLSANCkRh
bWllbiBMZSBNb2FsDQpXZXN0ZXJuIERpZ2l0YWwNCg==
