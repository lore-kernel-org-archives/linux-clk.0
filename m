Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5155FC43334
	for <linux-clk@archiver.kernel.org>; Sat, 25 Jun 2022 15:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbiFYPeG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 25 Jun 2022 11:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233065AbiFYPeF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 25 Jun 2022 11:34:05 -0400
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B419EDF23
        for <linux-clk@vger.kernel.org>; Sat, 25 Jun 2022 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=2d5rd
        DvClzm/4r+vCnQZz7JZfVM0S6UliOjy6AL3h/s=; b=Msjnbq2HP9X0SrPSxDd2c
        j+DfZrOj7zkZWOC2j1QuC1VttumLp12UZ48U6cuxOZrFjM1sB34+x8Yif7A22YEs
        TalWx9o1FSJq8c/nCHAyyzQlAZwRaq9O9ghNCG/0tQNZlAILPj1rq3QvXOpSaT4j
        EpObq5EGQCT86aR7YgioPA=
Received: from windhl$126.com ( [123.112.70.164] ) by ajax-webmail-wmsvr50
 (Coremail) ; Sat, 25 Jun 2022 23:32:42 +0800 (CST)
X-Originating-IP: [123.112.70.164]
Date:   Sat, 25 Jun 2022 23:32:42 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Orson Zhai" <orsonzhai@gmail.com>
Cc:     mturquette@baylibre.com, "Stephen Boyd" <sboyd@kernel.org>,
        "Baolin Wang" <baolin.wang7@gmail.com>,
        "Lyra Zhang" <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org
Subject: Re:Re: [PATCH] clk/sprd: Hold reference returned by of_get_parent()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CA+H2tpEZ6GNYjZ669w4yxK7EPm8bk_uRdq+6-5Z95FpPy4S8nA@mail.gmail.com>
References: <20220624103809.4167753-1-windhl@126.com>
 <CA+H2tpEZ6GNYjZ669w4yxK7EPm8bk_uRdq+6-5Z95FpPy4S8nA@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <7cb414e.2aa5.1819b7e699f.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowABnvfGbKrdiy4c9AA--.16681W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGhQrF1-HZYNKHAACsY
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CkF0IDIwMjItMDYtMjUgMTY6MzY6MDQsICJPcnNvbiBaaGFpIiA8b3Jzb256aGFpQGdtYWlsLmNv
bT4gd3JvdGU6Cj5IaSBMaWFuZywKPgo+T24gRnJpLCBKdW4gMjQsIDIwMjIgYXQgNjozOSBQTSBM
aWFuZyBIZSA8d2luZGhsQDEyNi5jb20+IHdyb3RlOgo+Pgo+PiBXZSBzaG91bGQgaG9sZCB0aGUg
cmVmZXJlbmNlIHJldHVybmVkIGJ5IG9mX2dldF9wYXJlbnQoKSBhbmQgdXNlIGl0Cj4+IHRvIGNh
bGwgb2Zfbm9kZV9vdXQoKSBmb3IgcmVmY291bnQgYmFsYW5jZS4KPj4KPj4gRml4ZXM6IGY5NWU4
Yzc5MjNkMSAoImNsazogc3ByZDogc3VwcG9ydCB0byBnZXQgcmVnbWFwIGZyb20gcGFyZW50IG5v
ZGUiKQo+PiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+Cj4+IC0tLQo+
PiAgdGhlc2UgYnVncyBhcmUgZm91bmQgaW4gNS4xOXJjMgo+PiAgdGhlc2UgYnVncyBhcmUgY29u
ZmlybWVkIG5vdCBmaXhlZCBieSBsb3JlLmtlcm5lbC5vcmcKPj4gIHRoZXNlIGJ1Z3MgYXJlIGNv
bXBpbGVkIHRlc3RlZCBpbiA1LjE5cmMyIHdpdGggYXQ5MV9kdF9kZWZjb25maWcKPj4KPj4gIGRy
aXZlcnMvY2xrL3NwcmQvY29tbW9uLmMgfCAxNiArKysrKysrKysrKy0tLS0tCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvY2xrL3NwcmQvY29tbW9uLmMgYi9kcml2ZXJzL2Nsay9zcHJkL2NvbW1vbi5j
Cj4+IGluZGV4IGQ2MjBiYmJjZGZjOC4uMDhjMWQ3YTllYzhiIDEwMDY0NAo+PiAtLS0gYS9kcml2
ZXJzL2Nsay9zcHJkL2NvbW1vbi5jCj4+ICsrKyBiL2RyaXZlcnMvY2xrL3NwcmQvY29tbW9uLmMK
Pj4gQEAgLTQxLDM1ICs0MSw0MSBAQCBpbnQgc3ByZF9jbGtfcmVnbWFwX2luaXQoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldiwKPj4gIHsKPj4gICAgICAgICB2b2lkIF9faW9tZW0gKmJhc2U7
Cj4+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPj4gLSAgICAgICBz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBkZXYtPm9mX25vZGU7Cj4+ICsgICAgICAgc3RydWN0
IGRldmljZV9ub2RlICpub2RlID0gZGV2LT5vZl9ub2RlLCAqbnA7Cj4+ICAgICAgICAgc3RydWN0
IHJlZ21hcCAqcmVnbWFwOwo+Pgo+PiArICAgICAgIG5wID0gb2ZfZ2V0X3BhcmVudChkZXYtPm9m
X25vZGUpOwo+PiAgICAgICAgIGlmIChvZl9maW5kX3Byb3BlcnR5KG5vZGUsICJzcHJkLHN5c2Nv
biIsIE5VTEwpKSB7Cj4+ICAgICAgICAgICAgICAgICByZWdtYXAgPSBzeXNjb25fcmVnbWFwX2xv
b2t1cF9ieV9waGFuZGxlKG5vZGUsICJzcHJkLHN5c2NvbiIpOwo+Cj5XaHkgbm90IHRvIGNhbGwg
b2Zfbm9kZV9wdXQoKSBpbiB0aGlzIGZ1bmN0aW9uPwo+SGUgcmV0dXJucyBhbiBlcnJvciBhbmQg
aXQgaXMgaGlzIHJlc3BvbnNpYmlsaXR5IHRvIGNsZWFuIHVwCj5ldmVyeXRoaW5nIGhlIHVzZWQs
IHJpZ2h0Pwo+Cj4tT3Jzb24KPgpIaSwgT3Jzb24sCgpJIG9ubHkga25vdyB3ZSBzaG91bGQgdXNl
IHRoZSBwYWlyIG9mIGZ1bmN0aW9ucyAob2ZfZ2V0X3BhcmVudCgpLCBvZl9ub2RlX3B1dCkKdG8g
a2VlcCByZWZjb3VudCBiYWxhbmNlLgoKSG93ZXZlciwgYXMgSSBkbyBub3QgcmVhbGx5IGtub3cg
dGhlIHNlbWFudGljIG9mIG90aGVyIGZ1bmN0aW9ucywgc28gSSBjYW5ub3QKZ2l2ZSBvdGhlciBr
aW5kcyBvZiBwYXRjaC4KCkJ5IHRoZSB3YXksIGlmIHdlIGNob3NlIHRvIHB1dCBvZl9ub2RlX3B1
dCgpIGluIHRoaXMgZnVuY3Rpb24sIEkgdGhpbmsgaXQgYWxzbyBuZWVkIAp0byBwdXQgb2Zfbm9k
ZV9wdXQoKSBpbnRvICdkZXZpY2Vfbm9kZV90b19yZWdtYXAnIGFzIGl0IGFsc28gcmV0dXJuIGVy
cm9yIGNvZGUgaW4KZm9sbG93aW5nIHBhdGguCgpBbnl3YXksIHRoYW5rcyB2ZXJ5IG11Y2ggZm9y
IHlvdXIgcmVwbHkgYW5kIHJldmlldyBvbiBteSBwYXRjaCBjb2RlLgoKTGlhbmcKCgo+PiAgICAg
ICAgICAgICAgICAgaWYgKElTX0VSUihyZWdtYXApKSB7Cj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHByX2VycigiJXM6IGZhaWxlZCB0byBnZXQgc3lzY29uIHJlZ21hcFxuIiwgX19mdW5jX18p
Owo+PiArICAgICAgICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChucCk7Cj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHJlZ21hcCk7Cj4+ICAgICAgICAgICAgICAg
ICB9Cj4+IC0gICAgICAgfSBlbHNlIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShvZl9nZXRf
cGFyZW50KGRldi0+b2Zfbm9kZSksCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICJzeXNj
b24iKSkgewo+PiAtICAgICAgICAgICAgICAgcmVnbWFwID0gZGV2aWNlX25vZGVfdG9fcmVnbWFw
KG9mX2dldF9wYXJlbnQoZGV2LT5vZl9ub2RlKSk7Cj4+ICsgICAgICAgfSBlbHNlIGlmIChvZl9k
ZXZpY2VfaXNfY29tcGF0aWJsZShucCwgInN5c2NvbiIpKSB7Cj4+ICsgICAgICAgICAgICAgICBy
ZWdtYXAgPSBkZXZpY2Vfbm9kZV90b19yZWdtYXAobnApOwo+PiAgICAgICAgICAgICAgICAgaWYg
KElTX0VSUihyZWdtYXApKSB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0
KG5wKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8g
Z2V0IHJlZ21hcCBmcm9tIGl0cyBwYXJlbnQuXG4iKTsKPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIFBUUl9FUlIocmVnbWFwKTsKPj4gICAgICAgICAgICAgICAgIH0KPj4gICAgICAg
ICB9IGVsc2Ugewo+PiAgICAgICAgICAgICAgICAgYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1h
cF9yZXNvdXJjZShwZGV2LCAwKTsKPj4gLSAgICAgICAgICAgICAgIGlmIChJU19FUlIoYmFzZSkp
Cj4+ICsgICAgICAgICAgICAgICBpZiAoSVNfRVJSKGJhc2UpKSB7Cj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgIG9mX25vZGVfcHV0KG5wKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIFBUUl9FUlIoYmFzZSk7Cj4+ICsgICAgICAgICAgICAgICB9Cj4+Cj4+ICAgICAgICAgICAg
ICAgICByZWdtYXAgPSBkZXZtX3JlZ21hcF9pbml0X21taW8oJnBkZXYtPmRldiwgYmFzZSwKPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3ByZGNsa19y
ZWdtYXBfY29uZmlnKTsKPj4gICAgICAgICAgICAgICAgIGlmIChJU19FUlIocmVnbWFwKSkgewo+
PiArICAgICAgICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChucCk7Cj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHByX2VycigiZmFpbGVkIHRvIGluaXQgcmVnbWFwXG4iKTsKPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocmVnbWFwKTsKPj4gICAgICAgICAgICAg
ICAgIH0KPj4gICAgICAgICB9Cj4+Cj4+ICsgICAgICAgb2Zfbm9kZV9wdXQobnApOwo+PiAgICAg
ICAgIHNwcmRfY2xrX3NldF9yZWdtYXAoZGVzYywgcmVnbWFwKTsKPj4KPj4gICAgICAgICByZXR1
cm4gMDsKPj4gLS0KPj4gMi4yNS4xCj4+Cg==
