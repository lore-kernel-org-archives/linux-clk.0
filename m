Return-Path: <SRS0=3VTX=3J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54275C2D0DB
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jan 2020 14:21:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3615C21D7E
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jan 2020 14:21:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbgATOV1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jan 2020 09:21:27 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:47332 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbgATOV0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jan 2020 09:21:26 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-bc-5e25b76587d0
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id E8.4B.08102.567B52E5; Mon, 20 Jan 2020 15:21:25 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 20 Jan 2020 15:21:12 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@ger.kernel.org" <linux-gpio@ger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Thread-Topic: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Thread-Index: AQHVz5cqdcXL24/7G02IFCD76W21L6fzgmcAgAAHbgA=
Date:   Mon, 20 Jan 2020 14:21:09 +0000
Message-ID: <70ac7b71d5d54d4b90ded032214c473569b9fae1.camel@fi.rohmeurope.com>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
         <20200120135446.GD6852@sirena.org.uk>
In-Reply-To: <20200120135446.GD6852@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <165D4BF62429F342A4150014AE63C5E3@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0gUURjFufPaWXXqtq7tzZ5OmFRUGmVjRQgFbVDSg6KE2sZ2cqV9yOwq
        mf9YJOVmppBhm4tl2YYV5WIPQym2DSyCNUoxs8LSTKW3FVpoc518/HXP/c459zcwH0vq8pho
        NsPukmS7aOWZMOrBlT81i6Q7sXvi+x7GCaUdnYzw9ucjIJz+6yOEb4VvaKG4MEgL5VWNlDDU
        UkMla4y+thrCWOd5rTH6qwsYY3tLPWP84Z+1mU4NX50murK3ZaTbl6zZG245Wx0iMgOGg+3d
        p8g80D/VDVgWwWXoWnCrG4SxOtgM0LPgOcYNtMqlEaDuosk4w8DVyP1Sg8d6uAiVDl5kcJ6E
        Dwj04msZgTORUEB9hdlqJgl5h2ppVa9EpU0NGhyhYCwauDwbjzmYgo5992pUkg19yi8biWvh
        UlRW2w6wBnAmKsj7TGBNQgPyf/g9kkEQokv1IVLVUajn/dD/OY8aBjoojCLhfHTj3hK1moyO
        D7+jVB2DTp/o0KifMAU9PttJFYOpngkEz3jbM6HtmdD2TGifB3Q1QDYxw5ouuqSExbKUtVh2
        WGzKsc9h8wP1j/bfBcOBDQFAsCAAprEEH8XpL8fu0U1Kc5hzLKLTYpKzrJIzABBL8nru/BHF
        48xiziFJdoxa01mKN3BxHSW7dRCzDkhSpiSPujNYlkfcjVqlOEWW0qWD+zOsrnGbYLX48bBo
        vVOymyVZzHJZTHg3TE5lObAVoXBTbmOuM1O0KVO1+gQsZIt7vJUkG/RWVZI6yu6wS9EGDuAo
        xFFLln0M1AsMLOAjuXjsRihrPfZOr4IgFETzCh4jXOK4FZ0HbK0VW9a+NC988iq/ZVNrU/+c
        N4eXX42sEtf3n+Gu5wpt157T2Rd+lezo3bI+MyZk2s7M+/YpVPSqfNXNirrEXV2RaU7/SW35
        x41HkwZFd+KcUGvj4B/Q0FZJ1/mym7rqwBe6ZJvh1ow4LmhNfZfb5eu5v26necMhutj+4mkp
        aJzLU06LmLCAlJ3iP7QP/wSTAwAA
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQpPbiBNb24sIDIwMjAtMDEtMjAgYXQgMTM6NTQgKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+
IE9uIE1vbiwgSmFuIDIwLCAyMDIwIGF0IDAzOjQwOjIwUE0gKzAyMDAsIE1hdHRpIFZhaXR0aW5l
biB3cm90ZToNCj4gPiBQYXRjaCBzZXJpZXMgaW50cm9kdWNpbmcgc3VwcG9ydCBmb3IgUk9ITSBC
RDcxODI4IFBNSUMNCj4gPiANCj4gPiBST0hNIEJENzE4MjggaXMgYSBwb3dlciBtYW5hZ2VtZW50
IElDIGNvbnRhaW5pbmcgNyBidWNrcyBhbmQgNw0KPiA+IExET3MuIEFsbA0KPiA+IHJlZ3VsYXRv
cnMgY2FuIGJlIGNvbnRyb2xsZWQgaW5kaXZpZHVhbGx5IHZpYSBJMkMuIEJ1Y2tzIDEsMiw2IGFu
ZA0KPiA+IDcgY2FuIGFsc28gYmUgYXNzaWduZWQgdG8gYSAicmVndWxhdG9yIGdyb3VwIiBjb250
cm9sbGVkIGJ5IHJ1bi0NCj4gPiBsZXZlbHMuDQo+IA0KPiBUaGlzIGlzIHRoZSAqdGhpcmQqIHZl
cnNpb24gb2YgdGhpcyB5b3UndmUgc2VudCB0b2RheSBhbG9uZS4gIFBsZWFzZQ0KPiBzdG9wIHNl
bmRpbmcgbWUgdGhpcyBzZXJpZXMgdW50aWwgdGhlIE1GRCBoYXMgYmVlbiBtZXJnZWQsIHBlcmhh
cHMNCj4ganVzdA0KPiBkcm9wIHRoZSBzdWJzeXN0ZW0gcGF0Y2hlcyB3aGlsZSB5b3UgcmVzb2x2
ZSB3aGF0ZXZlciB0aGUgcHJvYmxlbXMNCj4gYXJlDQo+IHRoYXQgcmVtYWluIHdpdGggdGhlIE1G
RD8gIEknbSBwcmV0dHkgbXVjaCBqdXN0IGRlbGV0aW5nIHRoZXNlDQo+IHBhdGNoZXMNCj4gd2l0
aG91dCBldmVuIGxvb2tpbmcgYXQgdGhlbSBhdCB0aGlzIHBvaW50LCBpdCdzIGEgbGFyZ2Ugc2Vy
aWVzLCBpdCdzDQo+IGdldHRpbmcgaHVnZSBudW1iZXJzIG9mIHJlc2VuZHMgYW5kIEkgZG9uJ3Qg
dGhpbmsgYW55IHZlcnNpb24gSSd2ZQ0KPiBoYWQgYQ0KPiBjaGFuY2UgdG8gbG9vayBhdCBiZWZv
cmUgaXQgZ290IHJlc2VudCBoYWQgYSBjaGFuZ2UgaW4gdGhlIG9uZQ0KPiByZWd1bGF0b3INCj4g
cGF0Y2ggdGhhdCdkIGNhdXNlIG1lIHRvIGhhdmUgdG8gcmUtcmV2aWV3IGl0Lg0KDQpTb3JyeSBN
YXJrIChhbmQgYWxsKS4gSSBndWVzcyB0aGlzIGlzIGFubm95aW5nLiBXaHkgSSBkbyByZXNlbmQg
d2hvbGUNCnNlcmllcyBpcyB0aGF0IGR1cmluZyB0aGUgYmQ3MTgzNyB3b3JrIExlZSBpbnN0cnVj
dGVkIG1lIHRvIGFsd2F5cw0KcmVzZW5kIHdob2xlIHNlcmllcyAtIG5vdCBqdXN0IHRoZSBjaGFu
Z2VkIHBhdGNoZXMuDQoNCkkgc3VyZSBjYW4gbGVhcm4gYW5kIGRyb3Agc29tZSBvZiB0aGUgcmVj
aXBpZW50cyBpbiB0aGUgZnV0dXJlIC0gYW5kDQphY3R1YWxseSBJIGRpZCBmb3IgdGhpcyBsYXN0
IHJlc2VuZC4gUmVhc29uIHdoeSB5b3UgYXJlIGluIHRoZQ0KcmVjaXBpZW50cyBpcyB0aGF0IExl
ZSBhc2tlZCBtZSB0byBnZXQgeW91ciBhY2sgZm9yIHBhdGNoIDMvMTEuIFNhbWUNCmdvZXMgd2l0
aCBTdGVwaGVuLg0KDQpMaW51cyBpcyBpbnZvbHZlZCBhcyBMZWUgYXNrZWQgbWUgdG8gZ2V0IGhp
cyBhY2sgZm9yIHBhdGNoIDExLg0KDQpCdXQgcmVzZW5kaW5nIHRoaXMgc2VyaWVzIDMgdGltZXMg
dG9kYXkgaXMgcmVhbGx5IG15IGZhdWx0LiAoV2VsbCwgb2YNCmNvdXJzZSwgSSBkaWQgc2VuZCB0
aGlzIGFuZCBubyBvbmUgZWxzZSkuIEkgbWVzc2VkIHVwIHRoZSBwcmV2aW91cw0Kc2VyaWVzLg0K
DQpJIHdhcyBob3BpbmcgdGhlIHJldmlzaW9uIGhpc3RvcnkgaW4gY292ZXIgbGV0dGVyIHdvdWxk
IGJlIGEgZmFzdCB3YXkNCnRvIGRldGVybWluZSBpZiBzb21ldGhpbmcgcmVsZXZhbnQgaGFzIGNo
YW5nZWQuIEFkZGl0aW9uYWxseSwgSSBkaWQgdHJ5DQp0byBpbmNsdWRlIHN0YXRlbWVudCB0aGF0
ICJubyBjaGFuZ2VzIiBpbiB0aGUgYmVnaW5uaW5nIG9mIGVhY2ggcGF0Y2hlcw0KZm9yIG1vc3Qg
b2YgdGhlIHZlcnNpb25zLiAoZm9yIHZlcnNpb25zIHVwLXRvIDExIC0gdGhpcyB3YXMgb21pdHRl
ZA0KZnJvbSB2MTIgYW5kIHYxMyB3aGljaCBvbmx5IGRpZCB2ZXJ5IHNwZWNpZmljIGNoYW5nZXMp
Lg0KDQpCdXQgc3VyZSwgSSBzaG91bGQgdHJ5IHRvIGJlIG1vcmUgY2FyZWZ1bCBzbyB0aGF0IEkg
ZG9uJ3QgbmVlZCB0byBkbyBzbw0KbWFueSByZXNlbmRzIC0gYW5kIEkgcmVhbGx5IGNvdWxkIGRy
b3AgbW9zdCBvZiB0aGUgcmVjaXBpZW50cyBlYXJsaWVyLg0KVGhhbmtzIGZvciBwb2ludGluZyBp
dCBvdXQuDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5lbg0K
