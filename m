Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF632C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Jul 2022 02:00:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiGACAP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 22:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiGACAO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 22:00:14 -0400
Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 002BA25EA8
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 19:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=ZitSk
        vIc9NbZK/v8yO1Z1m7SUVXAsBwk/fRnjjEl2Rk=; b=S1SkIUMwSUUMnbtJf8Ezv
        W0wFK4ovHbBsIEDSrCi512dww1D/DDkcE0rOoOzofBEoH2YbQbxs58qjZiKeHT9W
        AhWyaxth6pma7TuQgkKaeh8vtSc46MgREIyCZq3+RmizF+slfqi3phc/mXQ2JPBW
        J6c/L1ezEUXqbLrsLEVyEo=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Fri, 1 Jul 2022 10:00:02 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Fri, 1 Jul 2022 10:00:02 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Orson Zhai" <orsonzhai@gmail.com>
Cc:     "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        "Baolin Wang" <baolin.wang7@gmail.com>,
        "Lyra Zhang" <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org
Subject: Re:Re: [PATCH v2] clk: sprd: Hold reference returned by
 of_get_parent()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CA+H2tpH1hN1AJ=6vVGQXw6bZ7xQDbzXdaEV_OqWMnw+UxQKCkg@mail.gmail.com>
References: <20220628135230.166601-1-windhl@126.com>
 <CA+H2tpH1hN1AJ=6vVGQXw6bZ7xQDbzXdaEV_OqWMnw+UxQKCkg@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <30d017ea.184b.181b77c8dfe.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowADX3ycjVb5iNVBAAA--.52687W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QswF1pEAUCrbQACsa
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CgoKCkF0IDIwMjItMDctMDEgMDg6MTU6MjMsICJPcnNvbiBaaGFpIiA8b3Jzb256aGFpQGdtYWls
LmNvbT4gd3JvdGU6Cj5IaSBMaWFuZywKPgo+T24gVHVlLCBKdW4gMjgsIDIwMjIgYXQgOTo1NCBQ
TSBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+IHdyb3RlOgo+Pgo+PiBXZSBzaG91bGQgaG9sZCB0
aGUgcmVmZXJlbmNlIHJldHVybmVkIGJ5IG9mX2dldF9wYXJlbnQoKSBhbmQgdXNlIGl0Cj4+IHRv
IGNhbGwgb2Zfbm9kZV9vdXQoKSBmb3IgcmVmY291bnQgYmFsYW5jZS4KPgo+dHlwby4gcy9vdXQv
cHV0Cj4KClRoYW5rcywgSSB3aWxsIGNvcnJlY3QgaXQgaW4gbmV4dCB2ZXJzaW9uLgoKPj4KPj4g
Rml4ZXM6IGY5NWU4Yzc5MjNkMSAoImNsazogc3ByZDogc3VwcG9ydCB0byBnZXQgcmVnbWFwIGZy
b20gcGFyZW50IG5vZGUiKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBIZSA8d2luZGhsQDEy
Ni5jb20+Cj4+IC0tLQo+PiAgY2hhbmdlbG9nOgo+Pgo+PiAgdjI6IG1pbmltaXplIHRoZSBlZmZl
Y3RpdmUgcmFuZ2Ugb2Ygb2ZfZ2V0X3BhcmVudCgpIGFkdmlzZWQgYnkgT3Jzb24KPj4gIHYxOiBo
b2xkIHJlZmVyZW5jZSByZXR1cm5lZCBieSBvZl9nZXRfcGFyZW50KCkKPj4KPj4gIHYxLWxpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDYyNDEwMzgwOS40MTY3NzUzLTEtd2lu
ZGhsQDEyNi5jb20vCj4+Cj4+ICBQYXRjaGVkIGZpbGUgaGFzIGJlZW4gY29tcGlsZWQgdGVzdCBp
biA1LjE5cmMyLgo+Pgo+PiAgZHJpdmVycy9jbGsvc3ByZC9jb21tb24uYyB8IDM3ICsrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNl
cnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xr
L3NwcmQvY29tbW9uLmMgYi9kcml2ZXJzL2Nsay9zcHJkL2NvbW1vbi5jCj4+IGluZGV4IGQ2MjBi
YmJjZGZjOC4uZDg1YmE4MGM1OTMxIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Nsay9zcHJkL2Nv
bW1vbi5jCj4+ICsrKyBiL2RyaXZlcnMvY2xrL3NwcmQvY29tbW9uLmMKPj4gQEAgLTUwLDIzICs1
MCwyOCBAQCBpbnQgc3ByZF9jbGtfcmVnbWFwX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCIlczogZmFpbGVkIHRvIGdl
dCBzeXNjb24gcmVnbWFwXG4iLCBfX2Z1bmNfXyk7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiBQVFJfRVJSKHJlZ21hcCk7Cj4+ICAgICAgICAgICAgICAgICB9Cj4+IC0gICAgICAg
fSBlbHNlIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShvZl9nZXRfcGFyZW50KGRldi0+b2Zf
bm9kZSksCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICJzeXNjb24iKSkgewo+PiAtICAg
ICAgICAgICAgICAgcmVnbWFwID0gZGV2aWNlX25vZGVfdG9fcmVnbWFwKG9mX2dldF9wYXJlbnQo
ZGV2LT5vZl9ub2RlKSk7Cj4+IC0gICAgICAgICAgICAgICBpZiAoSVNfRVJSKHJlZ21hcCkpIHsK
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0IHJl
Z21hcCBmcm9tIGl0cyBwYXJlbnQuXG4iKTsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIFBUUl9FUlIocmVnbWFwKTsKPj4gLSAgICAgICAgICAgICAgIH0KPj4gICAgICAgICB9IGVs
c2Ugewo+PiAtICAgICAgICAgICAgICAgYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZShwZGV2LCAwKTsKPj4gLSAgICAgICAgICAgICAgIGlmIChJU19FUlIoYmFzZSkpCj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGJhc2UpOwo+PiAtCj4+IC0gICAg
ICAgICAgICAgICByZWdtYXAgPSBkZXZtX3JlZ21hcF9pbml0X21taW8oJnBkZXYtPmRldiwgYmFz
ZSwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3By
ZGNsa19yZWdtYXBfY29uZmlnKTsKPj4gLSAgICAgICAgICAgICAgIGlmIChJU19FUlIocmVnbWFw
KSkgewo+PiAtICAgICAgICAgICAgICAgICAgICAgICBwcl9lcnIoImZhaWxlZCB0byBpbml0IHJl
Z21hcFxuIik7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHJlZ21h
cCk7Cj4+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gb2ZfZ2V0X3Bh
cmVudChkZXYtPm9mX25vZGUpOwo+Cj5tb3ZlIHRoZSBkZWNsYXJhdGlvbiBvZiAibnAiIHRvIHRo
ZSBiZWdpbm5pbmcgcGFydCB3aXRob3V0IGFzc2lnbmluZyBhbnkgdmFsdWUuCj4KCk9LLgoKPj4g
Kwo+PiArICAgICAgICAgICAgICAgaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAic3lz
Y29uIikpIHsKPgo+VGhlcmUgbWF5IGJlIG5vIG5lZWQgdG8gc3BsaXQgdGhlIG9yaWdpbiBzdHJ1
Y3R1cmUgb2YgImlmLi4uZWxzZSBpZi4uLmVsc2UiLgo+SG93IGFib3V0IHRoZSBmb2xsb3dpbmcg
bWV0aG9kPwo+Cj4gICAgICAgICAgICAgICAgICAgIGVsc2UgaWYgKG9mX2RldmljZV9pc19jb21w
YXRpYmxlKG5wID0KPm9mX2dldF9wYXJlbnQoZGV2LT5vZl9ub2RlKSwgInN5c2NvbiIpCj4gICAg
ICAgICAgICAgICAgICAgICAgICB8fCAob2Zfbm9kZV9wdXQobnApLCAwKSkgewo+ClRoYW5rcywg
SSB3aWxsIHRyeSBpdCBhbmQgY29tcGlsZSB0ZXN0IGl0IGJlZm9yZSBJIHNlbmQgbmV4dCB2ZXJz
aW9uLgoKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnbWFwID0gZGV2aWNlX25vZGVfdG9f
cmVnbWFwKG5wKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQobnApOwo+
PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoSVNfRVJSKHJlZ21hcCkpIHsKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgcmVn
bWFwIGZyb20gaXRzIHBhcmVudC5cbiIpOwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiBQVFJfRVJSKHJlZ21hcCk7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIH0K
Pj4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIG9m
X25vZGVfcHV0KG5wKTsKPgo+VGhpcyBsaW5lIHdvdWxkIG5vdCBiZSBuZWNlc3NhcnkgdGhlbi4K
Pgo+LU9yc29uCgpUaGFua3MsIEkgd2lsbCByZW1vdmUgdGhpcyBsaW5lLgoKTGlhbmcKCj4KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZShwZGV2LCAwKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKElTX0VSUihiYXNl
KSkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihiYXNl
KTsKPj4gKwo+PiArICAgICAgICAgICAgICAgICAgICAgICByZWdtYXAgPSBkZXZtX3JlZ21hcF9p
bml0X21taW8oJnBkZXYtPmRldiwgYmFzZSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3ByZGNsa19yZWdtYXBfY29uZmlnKTsK
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKElTX0VSUihyZWdtYXApKSB7Cj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCJmYWlsZWQgdG8gaW5pdCByZWdtYXBc
biIpOwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHJl
Z21hcCk7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIH0KPj4gICAgICAgICAgICAgICAgIH0K
Pj4gICAgICAgICB9Cj4+Cj4+IC0tCj4+IDIuMjUuMQo+Pgo=
