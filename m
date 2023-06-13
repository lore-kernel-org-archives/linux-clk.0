Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4EAC7EE29
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 08:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233874AbjFMIGA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 04:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbjFMIF7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 04:05:59 -0400
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7329EE
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 01:05:57 -0700 (PDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-311-UA6G7ItlP1ewooZVyM1W0A-1; Tue, 13 Jun 2023 09:05:43 +0100
X-MC-Unique: UA6G7ItlP1ewooZVyM1W0A-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 13 Jun
 2023 09:05:27 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 13 Jun 2023 09:05:27 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Stephen Boyd' <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Christopher Obbard <chris.obbard@collabora.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: RE: [PATCH v2 2/2] clk: divider: Fix divisions
Thread-Topic: [PATCH v2 2/2] clk: divider: Fix divisions
Thread-Index: AQHZnY/ao7Gg3fNCxki9HY0rumOgxq+IX4vg
Date:   Tue, 13 Jun 2023 08:05:27 +0000
Message-ID: <919a361dd5f54e738d4824f8096d243c@AcuMS.aculab.com>
References: <20230526171057.66876-1-sebastian.reichel@collabora.com>
 <20230526171057.66876-3-sebastian.reichel@collabora.com>
 <5e9e776db6628d02d7081292b81ab102.sboyd@kernel.org>
In-Reply-To: <5e9e776db6628d02d7081292b81ab102.sboyd@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

RnJvbTogU3RlcGhlbiBCb3lkDQo+IFNlbnQ6IDEzIEp1bmUgMjAyMyAwMTo0Mg0KPiANCj4gUXVv
dGluZyBTZWJhc3RpYW4gUmVpY2hlbCAoMjAyMy0wNS0yNiAxMDoxMDo1NykNCj4gPiBUaGUgY2xv
Y2sgZnJhbWV3b3JrIGhhbmRsZXMgY2xvY2sgcmF0ZXMgYXMgInVuc2lnbmVkIGxvbmciLCBzbyB1
MzIgb24NCj4gPiAzMi1iaXQgYXJjaGl0ZWN0dXJlcyBhbmQgdTY0IG9uIDY0LWJpdCBhcmNoaXRl
Y3R1cmVzLg0KPiA+DQo+ID4gVGhlIGN1cnJlbnQgY29kZSBwb2ludGxlc3NseSBjYXN0cyB0aGUg
ZGl2aWRlbmQgdG8gdTY0IG9uIDMyLWJpdA0KPiA+IGFyY2hpdGVjdHVyZXMgYW5kIHRodXMgcG9p
bnRsZXNzbHkgcmVkdWNpbmcgdGhlIHBlcmZvcm1hbmNlLg0KPiANCj4gSXQgbG9va3MgbGlrZSB0
aGF0IHdhcyBkb25lIHRvIG1ha2UgdGhlIERJVl9ST1VORF9VUCgpIG1hY3JvIG5vdA0KPiBvdmVy
ZmxvdyB0aGUgZGl2aWRlbmQgb24gMzItYml0IG1hY2hpbmVzIChmcm9tIDk1NTZmOWRhZDhmNSk6
DQo+IA0KPiAgIERJVl9ST1VORF9VUCgzMDAwMDAwMDAwLCAxNTAwMDAwMDAwKSA9ICgzLjBHICsg
MS41RyAtIDEpIC8gMS41Rw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA9IE9WRVJGTE9XIC8gMS41Rw0KDQpNYXliZSBhZGQ6DQojZGVmaW5lIERJVl9ST1VORF9VUF9O
Wih4LCB5KSAoKCh4KSAtIDEpLyh5KSArIDEpDQp3aGljaCBkb2Vzbid0IG92ZXJmbG93IGJ1dCBy
ZXF1aXJlcyB4ICE9IDAuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNp
ZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsN
ClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

