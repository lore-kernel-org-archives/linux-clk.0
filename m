Return-Path: <SRS0=3pyO=3L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B184C32771
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 06:28:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6631D2465B
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 06:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgAVG2m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Jan 2020 01:28:42 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:64164 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgAVG2m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Jan 2020 01:28:42 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-26-5e27eb98ec80
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id BC.18.08102.89BE72E5; Wed, 22 Jan 2020 07:28:40 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 22 Jan 2020 07:28:36 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@ger.kernel.org" <linux-gpio@ger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Thread-Topic: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Thread-Index: AQHVz5cqdcXL24/7G02IFCD76W21L6fzgmcAgAE5igCAAIAHAIAA7myA
Date:   Wed, 22 Jan 2020 06:28:35 +0000
Message-ID: <4d79e93ab4bd92d5a25a961350efe8ad821a11e9.camel@fi.rohmeurope.com>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
         <20200120135446.GD6852@sirena.org.uk> <20200121083658.GH15507@dell>
         <20200121161512.GC4656@sirena.org.uk>
In-Reply-To: <20200121161512.GC4656@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB129D1C8AAE06449CBB811452E04F1B@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0gUURiGOTOz4/EyMq5rnszCBlTK8hJWW0n4I2qDiMg/IqmNObmLe5HZ
        XbNIEqPSzcjCStcL5h0JzG27amSrgWUoUmplFySRXCkqKytza05T6q/zne99n+89cD5IKo/T
        IVBntAiikddztA/V1TLrWFs+FZkW+20kSH1hbJxWv/n6AKjLfjUT6k8lrxXq0pIehbqqsZdS
        e4bbqUQvTfOLdkJz2/7KS+NoLaY1L4c7ac20Y8UeRYpvQgZvyU3SZRljtu731U62tJM5tf55
        BR3lRAH4yNiAN0RsPBo641bYgA9UskMAtbr6gXzpBeh7e72kQEizCcj23AsDKjYNFV+6RGIP
        yZ4lkNPTCLAnkFWjqZJc2bMJVXucf1EVux19rsnGbYoNRzPT9/+OYdjdaLCwz0uOcgJ0cmRU
        gQVvdh16VlNF4xqwy1FxwQcC1yQbjBwTMwr50Sxq6Bwg5ToITb71/Otz6O6PMQrnkuwq1HYn
        RkYT0dy9TlquV6Ky02P/3hCAHlaMU6VgiX1Rgn2Bti+i7Yto+yK6FihaATLwOn0WbxHiokXB
        Gi2atAbpOGAyOID8qV9ugd+unS5AQOACSyHBBTFNvZFpSv8MU+ZhLW/WpotWvWB2AQRJTsXU
        FoanKZlM/vARQTT9l5ZBigtmIsfOpSpZnJUtCDmC+F8NhZBDTKxbGhogCllC3kGd3rIgE9Ab
        D/cJUZkFY6Yg8laLNh2vR7pZ2g8s+Um5OzDOmHN4g9SV0UcgCpZOVteRsKe6sY5UUkaTUQgJ
        ZvqwlcVWrdU4H+QGwRBwgUwNVv2kzZ6f45YiCCni0JoIHGHhF6SQAhDxZNji101/2TDxzjmp
        77I9LRvd6B+af0JzMzZ9X+9eT8nBzmOz65sSzlTeMNR3l6ckOq1wS5R784OWhpaP1/o3ZF3v
        DhvIu0I/Tq1MfDx4fk9YW8L75IrktvAO3fjlUnjVnl9xkSgqSvm5It6mv/w+u2iudlfS0W1h
        oTk61Sluuo+jzFo+bjUpmvk/3LYrR5YDAAA=
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQpPbiBUdWUsIDIwMjAtMDEtMjEgYXQgMTY6MTUgKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+
IE9uIFR1ZSwgSmFuIDIxLCAyMDIwIGF0IDA4OjM2OjU4QU0gKzAwMDAsIExlZSBKb25lcyB3cm90
ZToNCj4gDQo+ID4gUGxlYXNlIHJldmlldyBQYXRjaCAzLCBvciB5b3Ugd2lsbCBibG9jayB0aGUg
c3VibWlzc2lvbi4NCj4gDQo+IFRoYXQncyB0aGUgcGF0Y2gNCj4gDQo+ICAgIG1mZDogcm9obSBQ
TUlDcyAtIHVzZSBwbGF0Zm9ybV9kZXZpY2VfaWQgdG8gbWF0Y2ggTUZEIHN1Yi1kZXZpY2VzDQo+
IA0KPiB3aGljaCBnaXZlbiB0aGUgdGl0bGUgaGFkbid0IHJlYWxseSByZWdpc3RlcmVkIGFzIG5l
ZWRpbmcgYW55DQo+IGF0dGVudGlvbi4uLg0KDQpOYW1pbmcgaXMgaGFyZCA6KSBJIHRoaW5rIHRo
ZSB0aXRsZSAtIGFzIGEgY29tbWl0IHRpdGxlIC0gZGVzY3JpYmVzDQp0aGlzIHNwZWNpZmljIGNo
YW5nZSBwcmV0dHkgd2VsbC4gKFdlbGwsIGtub3dpbmcgdGhlIGF1dGhvciB0aGlzDQpvcGluaW9u
IG1heSBiZSBiaWFzZWQpLiBCdXQgSSByZWNvbiB0aGlzIG1pZ2h0IG5vdCB0cmlnZ2VyIHJldmll
dyBmb3INCnJlZ3VsYXRvcnMgb3IgY2xvY2tzIC0gYW55IHN1Z2dlc3Rpb25zIGZvciBtZSBob3cg
dG8gY2F0Y2ggY29ycmVjdA0KcGVvcGxlIGF0dGVudGlvbiBieSB0aXRsZT8gSSB1bmRlcnN0YW5k
IHRoYXQgd2l0aCB0aGUgY3VycmVudCB2b2x1bWUgb2YNCmVtYWlscyBvbmUganVzdCBjYW4ndCBf
cmVhZF8gdGhyb3VnaCBhbGwgbWFpbHMgYnV0IGp1c3QgdGhlIG9uZXMgd2l0aA0KcHJvcGVyIHRp
dGxlLg0KDQpBbmQgbm93IHdoZW4gSSBhbSB0YWxraW5nIGFib3V0IHRoaXMgLSBJIHN0aWxsIG5l
ZWQgTWFyaydzIGFjayBmb3IgdGhlDQpEVCBiaW5kaW5nIGNvbnZlcnNpb24gcGF0Y2ggKHRoZSBC
RDcxOHg3IFBNSUMgYmluZGluZ3MsIG5vdCB0aGlzDQpzZXJpZXMgDQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzIwMjAwMTE1MDYyOTIxLkdBOTk0NEBsb2NhbGhvc3QubG9jYWxkb21haW4v
DQopIC0gd2hpY2ggSSByZXNlbnQgbGFzdCB3ZWVrIGp1c3QgZm9yIGF0dGVudGlvbiAtIGJ1dCBJ
IGd1ZXNzIHBhdGNoDQpuYW1pbmcgaXMgZmFpbGluZyB0aGVyZSB0b28uDQoNCk1hcmssIGRvIHlv
dSBoYXZlIGFueSBlbWFpbCBob29rIGZvciBDYzogdGFnIGluIHBhdGNoZXM/IFNob3VsZCBJIHVz
ZQ0KaXQgZm9yIHBhdGNoZXMgd2hpY2ggSSBob3BlIHlvdSB0byBjaGVjaz8gKEkganVzdCBsZWFy
bmVkIHRoZSBDYzogdGFnDQpyZWNlbnRseSkuIE1heWJlIHRoYXQgY291bGQgaGVscD8NCg0KQnIs
DQoJTWF0dGkgVmFpdHRpbmVuDQo=
