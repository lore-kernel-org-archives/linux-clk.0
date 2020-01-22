Return-Path: <SRS0=3pyO=3L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552FEC32771
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 06:15:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22FEA2465A
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 06:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgAVGPp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Jan 2020 01:15:45 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:63654 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgAVGPp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Jan 2020 01:15:45 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-fb-5e27e88f0d7e
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id E7.08.08102.F88E72E5; Wed, 22 Jan 2020 07:15:43 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 22 Jan 2020 07:15:39 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@ger.kernel.org" <linux-gpio@ger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v13 03/11] mfd: rohm PMICs - use platform_device_id to
 match MFD sub-devices
Thread-Topic: [PATCH v13 03/11] mfd: rohm PMICs - use platform_device_id to
 match MFD sub-devices
Thread-Index: AQHVz5d8MFFmc8BR0UaMUG6QhONxDaf1QveAgADj0wA=
Date:   Wed, 22 Jan 2020 06:15:37 +0000
Message-ID: <f6d2b9b22bd9b9022ef24e2a2ef516da11d0cdbd.camel@fi.rohmeurope.com>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
         <fc886259870ee2a67302b22a76c4347feff461ff.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
         <20200121164015.GF4656@sirena.org.uk>
In-Reply-To: <20200121164015.GF4656@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7EA19C4391A4E547AE6C6DEEA8EC07DF@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTURzv3Ht3d51evU5tp9lzYMtKTfHDKgmJsPVFgj4lNL3q1c3cg7v5
        KiqNlJzzkSjUdJDP2ZBk60NpBmJKSwSRSkrMWompwVIsQg3r3q6vT+d3/r/XgfMnUOkdXE7o
        DBaGNdD5ClyCDXStuWNq55SaE+4nCapG3wyu+vRrGKga/jgR1ZJtWqSqsw2JVM0dXky1PuHG
        ksVq56QbUffaP4rVHlclrp6a6MfVy579F0VpgUmZtKXwki7XEHcmI1B7t8GPm1rxYo+1HCkF
        NtwKAghIJcI55zhiBRJCSr0DsKa+FxUuXgDbn9aKrYAgcCoJWj+IeUM4FQMbV9twXoNSAwh8
        u3gf4YkwKhOuV0xtiLLg0OMvG/gUbPV4AY8xKgquOr6jPCapVNgwN4YJZaMA2kbtCF8WQCVA
        90oSrwHUPlhZ6v+fj1Iy6Jn9LRJeTcH2/jFUwBFw/uv6xlwBX6z4MD4GpaJhT1+cYE2Grqou
        TMCHYEOVTyw8IRS+fjCD1YHd9h0N9m23fYfbvsNt3+F+CEQuAPW0Lj+XtjDxsSxTEMsatXru
        yDLqPUD41Z/PwN/BC4MAIcAg2EMgigiy06vUSIMzjdklWtqsTWcL8hnzIIAEqggnH96O0kjJ
        bLrkGsMaN6lIAlPISKXv3hUpxXddZRgTw26yewlCAUnlLBcayjK5THGOLt+yTSNEAB8ukYeb
        GUM2w9IFFm06vx/pZm5BeCqI6zXydtJsovXcVLCOgGNE3byjFSWGHB2tqBQzGA2MXEbu+sZJ
        KV6qLTBsFS0AGQEUYeQYHxTErfZWzgJXgXAVRccP8xUWepuSl4KOpUeXxQuZOSk/wMS0JCXj
        zcG8shupzTLaManSqJ/fUpbNVN9MCIwO9rTYvBXv21r0y0fqmxznyx2x3eHOxc7CWJc/Ly29
        aO3sqNnUc/J0ZPd1S9WyJS+kbDxkbMQpelkdbDrX9Hk4gtGkBa+29R0oqwlbWXpFxYT0Jfqx
        /gwFZtbS8UdR1kz/A1Ry+3qXAwAA
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQpPbiBUdWUsIDIwMjAtMDEtMjEgYXQgMTY6NDAgKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+
IE9uIE1vbiwgSmFuIDIwLCAyMDIwIGF0IDAzOjQyOjM4UE0gKzAyMDAsIE1hdHRpIFZhaXR0aW5l
biB3cm90ZToNCj4gPiBUaGFua3MgdG8gU3RlcGhlbiBCb3lkIEkgdG9kYXkgbGVhcm5lZCB3ZSBj
YW4gdXNlDQo+ID4gcGxhdGZvcm1fZGV2aWNlX2lkDQo+ID4gdG8gZG8gZGV2aWNlIGFuZCBtb2R1
bGUgbWF0Y2hpbmcgZm9yIE1GRCBzdWItZGV2aWNlcyENCj4gPiANCj4gPiBEbyBkZXZpY2UgbWF0
Y2hpbmcgdXNpbmcgdGhlIHBsYXRmb3JtX2RldmljZV9pZCBpbnN0ZWFkIG9mIHVzaW5nDQo+ID4g
ZXhwbGljaXQgbW9kdWxlX2FsaWFzZXMgdG8gbG9hZCBtb2R1bGVzIGFuZCBjdXN0b20gcGFyZW50
LWRhdGENCj4gPiBmaWVsZA0KPiA+IHRvIGRvIG1vZHVsZSBsb2FkaW5nIGFuZCBzdWItZGV2aWNl
IG1hdGNoaW5nLg0KPiANCj4gQWNrZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9y
Zz4NCg0KVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rIGF0IHRoaXMuIEFwcHJlY2lhdGVkISA6KQ0K
DQpCciwNCglNYXR0aQ0K
