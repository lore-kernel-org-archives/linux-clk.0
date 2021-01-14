Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336E2C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 03:58:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E50DF238A1
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 03:58:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbhAND6i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jan 2021 22:58:38 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:26091 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbhAND6h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jan 2021 22:58:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1610596716; x=1642132716;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CzoAodEtzdWbw3eue++Aq08clwXKMWewOuFSRdQfnYw=;
  b=nDKrHTXwJEQiWxrQJ6eQrSKkEJAzc5fIMJ3QnQC62BHGMeag8Cpi47IX
   aK/F1E5RAXqBNKE9dvxJRKnr5ze788byXPQWfIsaKYeI1PbOee7ZfY+6C
   5s/lOZeT1Vhzptz1fdHz5hh1IvJASrY+qJCKNJZbF9TOp5wk5ojyEWdb/
   AIoNXFGbPKAZg1kts5uF2sId0N47wd6pzRpgKo5PgSibaMv99xWtg1AH6
   AVY5YEAS6iJFXshRpFImKDsAoCywYD74XP96K5XHxU4CJb2mg6/Q7w5Vt
   B2lH7pX68SC8nGiFmfZnR8pVfroFw0f+yZdaJ38z6bm0lZuSXzqy8GyGE
   g==;
IronPort-SDR: 6B6PnYxlUZ7Aga3tpSwrSonf6jpyUqT6/ezCrnueX/ld6Q2dgSKMm7b16UQ2hQLW8bK+YwT+F+
 wXV0yd27CxQMSW7UGi3IHgC2oFeFUemC2Y5V61g2A+knPbUjbl/B8Vz/Km8roLq8+D33SYFIh2
 4ARG7XXP+mCac2FmvvpBfmslPXKWKi5qTV8FkhOxSuHIAD5afDLMLsXWaF6X0kcKSo0eNT9iwM
 9DbURkg9gSUMPG5dB6LOZKJOA8d4TaRmKcygph6EFa+9sI1HmaeBxPSDX594Nm8Z6l5AMVjojs
 W5I=
X-IronPort-AV: E=Sophos;i="5.79,346,1602518400"; 
   d="scan'208";a="161827100"
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
  by ob1.hgst.iphmx.com with ESMTP; 14 Jan 2021 11:57:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDkGwngjg1Ttijg04o63b61gpLx6M4gW0lHRxrOgbUdquiZzoK6SUhZ1T+uF2SVDWKNKB7nQLfoG1Ob1A8u0yafzZcDJC942OuGR+fC8qVckoGDcK9kZRtrLBsmsMd0wznRi4/7RsEn0blJgTCQalCmozDM2DjYWlSojQFlDIG/hx11OoRIygnmu57IymdAJMIwcGLhK9jPnIywix7a3BX3ueAZ2g/QyjGIjJMnMV4YVj4jaPRrLATPZ0R/NSOeG35ADGn/tCUpv7dHb+WY85t0h5dvY1xHAWNoCysmstNCkjEx26L1bFOlPxjBxdv0xqa1HUcrAKD9Cd0mqR87eeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzoAodEtzdWbw3eue++Aq08clwXKMWewOuFSRdQfnYw=;
 b=YDJ4Y7NTbCdNymXuxjfg6ssjex6nIX6PEinz0W+9LkN83MgbjCodaYKefnD6qXEnIl9gSvVfpy4cYJCHPicIJ7eFhIyScA7ZI0curcI9RQDswvnHTvxI6rTymQT8totbraVvW2vL1pLNA5BUSg6uoFyzashiAbv0zcLBwA47kBc+D/wLoGD9WlMehZ0+x+ztmX+ve/U4m21Egs5FvleJf4arPwDEs68d2rfG/f2kBCMfp/0RG/s+UvTdRBp647G4XHdbxq/G1lBtxu/hIkS8feJMq9aIfUSXYj4O4AtJygZ8Wk7dU7/ENA0sNdv4Zc5J3MmyiUHdu/anng/CFUqc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzoAodEtzdWbw3eue++Aq08clwXKMWewOuFSRdQfnYw=;
 b=cJ/pqWPypWyseskArsXOKTdt7lc0wetbtXSKnxVuCW++FHgBjB/Yav6d/kmAsdmV+6HgEPpE+2k1LeKjqALgj/WMvMBzGwWwgwrRYfc7wAI4wT13+9mowuaehMklqpY9Vv6FhZ5DGszJEE+JgEZica9zrcv2eTg1VNoYVtkU5dE=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6350.namprd04.prod.outlook.com (2603:10b6:208:1a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 03:57:28 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 03:57:28 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "seanga2@gmail.com" <seanga2@gmail.com>
Subject: Re: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW6H6jBxZahSfnlkqtd1vCx2d056olOk4AgAAzcACAAJ1mgIAASGmAgAAJ9gCAABifgIAAC5+A
Date:   Thu, 14 Jan 2021 03:57:28 +0000
Message-ID: <adea5413d896f04d9bf9c213a85246f44b6b477a.camel@wdc.com>
References: <20210112010238.200241-1-damien.lemoal@wdc.com>
         <161052632885.3661239.353622418812249041@swboyd.mtv.corp.google.com>
         <14eb3ad4c736b30a790169854878aeec019f9004.camel@wdc.com>
         <161057117528.3661239.31662832878817559@swboyd.mtv.corp.google.com>
         <be5eabd7ae8cd86c467b08dc5e457248551e5372.camel@wdc.com>
         <161058886422.3661239.2411294438387885286@swboyd.mtv.corp.google.com>
         <05dcea7f1d40676b4e2742f3bd2ef5e5a8a6e2c3.camel@wdc.com>
In-Reply-To: <05dcea7f1d40676b4e2742f3bd2ef5e5a8a6e2c3.camel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3 (3.38.3-1.fc33) 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 16451d2a-9671-4c99-3150-08d8b8408303
x-ms-traffictypediagnostic: MN2PR04MB6350:
x-microsoft-antispam-prvs: <MN2PR04MB63505453F20FF1648B466708E7A80@MN2PR04MB6350.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L97pNNkJOW91Cmkix/ermtdbAup6CCBRQTpL6t0Jql1TB1F8iuAEfpWZ6K4PWdhu+rXEgyswt09ia/ILX93V4RgseAqwCgIxCZnMnQOTFUJ3tsJx/gbIE4fPc/pLqNo9UxRLfATVUoVLgi/qNANycK47E1fQ4kEoX+spDXLaA2xY1XzD2M2jVQCi4gEHMYphvXZcqfnNpSwzeiQ3TKUSfFh1j8pkAzTDsUbpiRapettIke/h4DUqeUdc6I+pylcF2YV6LtesaR/PTT4oDYv72ZAAMdWCEwrC8gGvvmZjIJnSxErGawhi+njEsSwUkm/D2afQ4IIo8usCK+bZqxpGogDtm5P9STkvrA8CZHyd9hBoxiQuxsWJFeG00C7KAC+nesuyAd864jsWVeLqs4DKsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(36756003)(76116006)(6506007)(66476007)(71200400001)(110136005)(316002)(4326008)(2616005)(478600001)(66556008)(91956017)(86362001)(5660300002)(8676002)(6486002)(6512007)(66946007)(2906002)(186003)(83380400001)(8936002)(64756008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aThXT3RMa2dzQ2NtbU1HZEJYZlhpRkFFdDRnMHQ4QmVEUENtMUpZazl0djg5?=
 =?utf-8?B?MVV2dXFGa3l0ZkprSnhTUS9teVdDNnBPNHI4aGNveUlUbitiNTViS29tcWJG?=
 =?utf-8?B?eSszTGgxR0JsRjAra2I5bS9HdnB0Z1pobGtOd3gwelFFMWtVNmxTYW1MOUhi?=
 =?utf-8?B?M1hiOEhvbUk0a0RZRGRYOXhsVUMrYTM2dCt1TnZYREZTZzRYdzJLWmpZZlF1?=
 =?utf-8?B?bTRWR0ZrZWxxNUdBRktua0NCSWxhU2xsenVYeWw2MEhrRzJkaWI3M1JnVFA1?=
 =?utf-8?B?UHgvL0o4RCtMbDNMMFJPT3JpQjdqS0ZCd0IrRktvTnV4dHNiMUlwMHh2VXZh?=
 =?utf-8?B?WnRUK0syVzRNQ0V1T0RrclFpRU5wZEt5cGQySlZoUEZLVlVHMkJyTzlYclB5?=
 =?utf-8?B?WTVTenkvRXRDWFByZFYzem5hdU52V0dIdnIwb3RhbFo3dUJpSTdqTCtieDZk?=
 =?utf-8?B?cmxxd043VWxlNGRJNnU5dG9wMUJNcVpmRURhUHBYbDhtYmtFRHlwUmN5NFM2?=
 =?utf-8?B?aGJuTlZVNFhaRk5URVlYeDVWOThDd0JJVjBPV3huUWU5N1lONGJwdzZQRFUw?=
 =?utf-8?B?VU5pWnR5blh2N1RTTE1RNytwNFZWQTFaRFNpZzVlVU9TazlQV0VlZkhrTXdJ?=
 =?utf-8?B?NC9aSGI0NThCeTVpM3VLQ0FYdG1hSm1TQ0p6b2E2YU5qRENWN1g4NnhKUVJp?=
 =?utf-8?B?OHdFZDR3K0JFY1JzY2RUYU9PbXJvZkNjRFhUTnZwRzNqNzl3ZXFBTWRhN1Vk?=
 =?utf-8?B?OVhyMlZhNjN4WUlFdVdta2tFQjM3Y29yL01Kc1ozN3VRV2J6b2VNcy96bkdV?=
 =?utf-8?B?LzZuVWd3QXlPclFhTThhQXdWb3RFQ2paSmpVMEs5dmp0Zk13ckdVZjRGcWZl?=
 =?utf-8?B?MWZ0SW1VR1BtNjAwa3RyNS9HZDZacWk0QUlWTm53dzdsdlFhNGJEejhmZStH?=
 =?utf-8?B?MU1sZW9aNzh2UlA2VEFTeWZnMWkvWDlpbEFobVpUbDFua3VLRWRwSldraFNI?=
 =?utf-8?B?R3M4R3FyeG4vb1lDTnZBQ0JyN3prVzVUeWlGTTJWUUtpVElDa21QTDl0SzN5?=
 =?utf-8?B?ZlUxRE5rNWx5OGRPV3Vsb3EyaStjeUc0cGRkeGtkUFhXNndYeUEzUGl4OUNM?=
 =?utf-8?B?R3UweUJibGU0cFpHRzVFdW45NWhvVWliVjY2QlZKbGRJTzhuY1VJTTdpZ0t1?=
 =?utf-8?B?R0RSemZYaUdTaXpOMG1kUlFqN3FNSzlmbTE1RUFmb1pWbVRFNFBkK2tzTENV?=
 =?utf-8?B?T3AybklqV3ZDYWlDNTZyN2lEODF3QVAwdW0zd2xRZ0svakFhVU5ZY1M1eXd3?=
 =?utf-8?B?WExqUjczcll6VFh4QlJUbFRmL05HQlNodUtYM1d6WFVNdUgweCtOY2tKdUU4?=
 =?utf-8?B?M0ZUK0ZrT3NReWp1R1Q4SVZaaXMzY3pTU3dOSUxCUGxjNXlnT2M4MVgxaEtP?=
 =?utf-8?Q?5EpjpGPp?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6E7BEFF179A4444B897EDCA40D0A3F8@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16451d2a-9671-4c99-3150-08d8b8408303
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 03:57:28.7899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /DRuZF0Ew4pkUO92CXt6K9oCx4U4KYhTkFOwxsQFPV8Ib1iB9M9wKwrgtLOVQRi5JUceXs0H4tg8VTk0LVShqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6350
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gVGh1LCAyMDIxLTAxLTE0IGF0IDEyOjE1ICswOTAwLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToN
Cj4gT24gV2VkLCAyMDIxLTAxLTEzIGF0IDE3OjQ3IC0wODAwLCBTdGVwaGVuIEJveWQgd3JvdGU6
DQo+ID4gUXVvdGluZyBEYW1pZW4gTGUgTW9hbCAoMjAyMS0wMS0xMyAxNzoxMjowNikNCj4gPiA+
IE9uIFdlZCwgMjAyMS0wMS0xMyBhdCAxMjo1MiAtMDgwMCwgU3RlcGhlbiBCb3lkIHdyb3RlOg0K
PiA+ID4gPiBRdW90aW5nIERhbWllbiBMZSBNb2FsICgyMDIxLTAxLTEzIDAzOjI5OjM2KQ0KPiA+
ID4gPiA+IE9uIFdlZCwgMjAyMS0wMS0xMyBhdCAwMDoyNSAtMDgwMCwgU3RlcGhlbiBCb3lkIHdy
b3RlOg0KPiA+ID4gPiA+ID4gUXVvdGluZyBEYW1pZW4gTGUgTW9hbCAoMjAyMS0wMS0xMSAxNzow
MjozOCkNCj4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiArICAgICAgIC8qIEdldCB0aGUg
c3lzdGVtIGJhc2UgZml4ZWQtcmF0ZSAyNk1IeiBvc2NpbGxhdG9yIGNsb2NrICovDQo+ID4gPiA+
ID4gPiA+ICsgICAgICAgaW4wID0gb2ZfY2xrX2dldChucCwgMCk7DQo+ID4gPiA+ID4gPiA+ICsg
ICAgICAgaWYgKElTX0VSUihpbjApKSB7DQo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBw
cl9lcnIoIiVwT0ZQOiBmYWlsZWQgdG8gZ2V0IGJhc2UgZml4ZWQtcmF0ZSBvc2NpbGxhdG9yXG4i
LCBucCk7DQo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm47DQo+ID4gPiA+ID4g
PiA+ICsgICAgICAgfQ0KPiA+ID4gPiA+ID4gPiArICAgICAgIGtjbC0+cGFyZW50c1tLMjEwX1BB
UkVOVF9JTjBdID0gX19jbGtfZ2V0X2h3KGluMCk7DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
IFRoaXMgc2hvdWxkbid0IGJlIG5lY2Vzc2FyeS4gU3BlY2lmeSB0aGUgRFQgbm9kZSBpbmRleCBp
biB0aGUNCj4gPiA+ID4gPiA+IHBhcmVudF9kYXRhIHN0cnVjdHVyZSBpbnN0ZWFkLg0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IE9LLiBJIHVuZGVyc3Rvb2Qgd2hhdCB5b3UgbWVhbiBoZXJlLiBIb3dl
dmVyLCBJTjAgaXMgbm90IGNyZWF0ZWQgYnkgdGhpcw0KPiA+ID4gPiA+IGRyaXZlci4gSXQgaGFz
IGl0cyBvd24gZml4ZWQtb3NjaWxsYXRvciBEVCBub2RlIHRoYXQgY3JlYXRlcyB0aGUgY2xvY2su
IFNvIGENCj4gPiA+ID4gPiBkaWZmZXJlbnQgcHJvdmlkZXIuIEhlbmNlIEkgdGhpbmsgd2UgY2Fu
bm90IHVzZSBhbiBpbmRleCBpbnRvIGNsa19kYXRhLT5od3MsDQo+ID4gPiA+ID4gdW5sZXNzIEkg
YW0gbm90IHVuZGVyc3RhbmRpbmcgc29tZXRoaW5nLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiANCj4g
PiA+ID4gQ2FuIHlvdSB1c2UgY2xrX3BhcmVudF9kYXRhOjppbmRleD8NCj4gPiA+IA0KPiA+ID4g
Tm90IGZvciB0aGUgYmFzZSBvc2NpbGxhdG9yICJpbjAiIGFzIHRoYXQgY2xvY2sgaXMgY3JlYXRl
ZCB0aHJvdWdoIHRoZSBkZXZpY2UNCj4gPiA+IHRyZWUgKGl0IGhhcyBpdHMgb3duIGZpeGVkLWNs
b2NrIG5vZGUpIGFuZCBzbyBpcyBub3QgcHJvdmlkZWQgYnkgdGhpcyBkcml2ZXIuwqANCj4gPiA+
IA0KPiA+ID4gQnV0IEkgY2FuIHVzZSBwYXJlbnRfZGF0YTo6aHcuIFRoYXQgd29ya3MuDQo+ID4g
PiBTbyBJIGVuZGVkIHVwIHJld3JpdGluZyBhbGwgcGFyZW50cyBzZXR1cCB1c2luZyB0aGUgY2xr
X3BhcmVudF9kYXRhIHN0cnVjdCB0bw0KPiA+ID4gZGVmaW5lIGFsbCBjbG9ja3MgcGFyZW50cyB1
c2luZyB0aGUgcGFyZW50X2RhdGE6Omh3IGZpZWxkLiBUaGF0IHJlbW92ZXMgdGhlDQo+ID4gPiBu
ZWVkIGZvciB0aGUgcGFyZW50cyBhcnJheSB0aGF0IEkgaGFkLg0KPiA+IA0KPiA+IFRoZSBkcml2
ZXIgc2hvdWxkIG5vdCBiZSBjYWxsaW5nIG9mX2Nsa19nZXQoKS4gSXQgc2hvdWxkIHJlZ2lzdGVy
IGNsa3MNCj4gPiB3aXRoIGEgZGV2aWNlIG5vZGUgb3IgYSBkZXZpY2UgdGhhdCBoYXMgYSBEVCBi
aW5kaW5nIHdpdGggYSBjbG9ja3MNCj4gPiBwcm9wZXJ0eSBhbmQgdGhlbiB0aGUgaW5kZXggYW5k
L29yIGZ3X25hbWUgY2FuIGluZGljYXRlIHdoYXQgdGhhdCBmaXhlZA0KPiA+IGNsb2NrIG5vZGUg
aXMuDQo+ID4gDQo+ID4gSW4gRFQ6DQo+ID4gDQo+ID4gCXRoaXNfZmlsZXNfYXNzb2NpYXRlZF9k
ZXZpY2Vfbm9kZSB7DQo+ID4gCQljbG9ja3MgPSA8JnBoYW5kbGVfdG9fZml4ZWRfY2xvY2tfbm9k
ZT47DQo+ID4gCX07DQo+ID4gDQo+ID4gQW5kIHRoZW4gY2xrX3BhcmVudF9kYXRhOjppbmRleCA9
PSAwIHRvIGluZGljYXRlIHRoYXQgaXQgc2hvdWxkIHVzZSB0aGF0DQo+ID4gY2xrLiBJZiB0aGUg
Y2xrX2h3IGlzIHJlZ2lzdGVyZWQgYnkgdGhpcyBkcml2ZXIgdGhlbiB1c2luZyBjbGtfaHcgaXMN
Cj4gPiBhcHByb3ByaWF0ZSwgYnV0IG90aGVyd2lzZSB3ZSBzaG91bGRuJ3QgbmVlZCB0byBnZXQg
dGhlIGh3IHBvaW50ZXIgZm9yDQo+ID4gYW55IGNsayB0aGF0IGlzIGNyZWF0ZWQgb3V0c2lkZSBv
ZiB0aGlzIGZpbGUuDQo+IA0KPiBJIGNhbm5vdCBnZXQgdGhpcyB0byB3b3JrLiBUaGUgc3lzY2xr
IG5vZGUgaGFzICJjbG9ja3MgPSA8JmluMD47IiBoYXMgdGhlIHNvbGUNCj4gaW5wdXQvcGFyZW50
IGNsb2NrLiBCdXQgdXNpbmcgY2xrX3BhcmVudF9kYXRhOjppbmRleCA9IDAgdG8gc3BlY2lmeSBp
bjAgYXMgYQ0KPiBwYXJlbnQgY2xvY2sgZm9yIHRoZSBjbG9ja3MgcmVnaXN0ZXJlZCBieSB0aGUg
azIxMC1jbGsgZHJpdmVyIGRvZXMgbm90IHdvcmsgKG5vDQo+IGJvb3QpLiBIb3dldmVyLCBpZiBJ
IHVzZQ0KPiANCj4gY2xrX3BhcmVudF9kYXRhOjpuYW1lID0gIG9mX2Nsa19nZXRfcGFyZW50X25h
bWUobnAsIDApDQo+IA0KPiB3aGVyZSBucCBpcyB0aGUgZGV2aWNlIG5vZGUgZm9yIHRoZSBzeXNj
bGsgZHJpdmVyLCB0aGluZ3Mgd29yay4NCj4gDQo+IExvb2tpbmcgYXQgY2xrX2NvcmVfZmlsbF9w
YXJlbnRfaW5kZXgoKSBhbmQgY2xrX2NvcmVfZ2V0KCksIHVzaW5nIGluZGV4IHNob3VsZA0KPiB3
b3JrLiBOb3Qgc3VyZSB3aGF0IEkgYW0gZG9pbmcgd3JvbmcgaGVyZS4gRGlnZ2luZy4uLg0KDQpB
ZnRlciBtb3JlIGNvZGUgcmVhZGluZywgSSB0aGluayB0aGF0IHRoZSBjbGtfcGFyZW50X2RhdGE6
OmluZGV4IG1ldGhvZCBmb3INCnNwZWNpZnlpbmcgYSBjbG9jayBwYXJlbnQgd29ya3Mgb25seSBm
b3Igbm9kZXMgdGhhdCBkbyBub3QgaGF2ZSBhICNjbG9jay1jZWxscw0KcHJvcGVydHkuIFNpbmNl
IHRoaXMgZHJpdmVyIGhhcyBvbmUsIGl0IGxvb2tzIGxpa2UgdGhlIGNsa19wYXJlbnRfZGF0YTo6
bmFtZQ0KZm9yIHRoZSBleHRlcm5hbCBpbjAgY2xvY2sgYW5kIGNsa19wYXJlbnRfZGF0YTo6aHcg
Zm9yIGludGVybmFsbHkgcmVnaXN0ZXJlZA0KY2xvY2tzIHdvdWxkIGJlIHRoZSBiZXN0IG1ldGhv
ZCB0byBzcGVjaWZ5IHBhcmVudHMuIENhbiB5b3UgY29uZmlybSBwbGVhc2UgPw0KDQoNCg0KLS0g
DQpEYW1pZW4gTGUgTW9hbA0KV2VzdGVybiBEaWdpdGFsDQo=
