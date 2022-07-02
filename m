Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B73CC433EF
	for <linux-clk@archiver.kernel.org>; Sat,  2 Jul 2022 01:29:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiGBB3P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Jul 2022 21:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbiGBB3P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jul 2022 21:29:15 -0400
Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 37C381D0CA
        for <linux-clk@vger.kernel.org>; Fri,  1 Jul 2022 18:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=01M95
        CR0qCwBVKxPtOSckGXCp4D0+4bjRI39B4ucJMo=; b=TlVjcPyra4OEfLZrpynTx
        u2dShN9f++kktMT9ktOnlzyGGAdMADvkA1yCbQI9vhpvLzhh+5ER3d1nt/od+rih
        0S3YkHMAHQ8iRsmlMOq16uPtfIv212gAjCtxYWhLGrkQc4yryDk97pMdp5acMRqi
        H4y6lXlFmkoAQ8mAn3bAPQ=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Sat, 2 Jul 2022 09:28:49 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Sat, 2 Jul 2022 09:28:49 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Orson Zhai" <orsonzhai@gmail.com>
Cc:     "Chunyan Zhang" <zhang.lyra@gmail.com>,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        "Baolin Wang" <baolin.wang7@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re:Re: Re: [PATCH v4] clk: sprd: Hold reference returned by
 of_get_parent()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CA+H2tpFhmYCbAX62Dta-Q7ER4Eh5cJwbc2uCQYQyzdVsM8Lvxg@mail.gmail.com>
References: <20220701024606.223438-1-windhl@126.com>
 <CAAfSe-vAuFK1qfCA9H_k3MDTa-7rP4FsfkMPMkR1+L60CU8iMg@mail.gmail.com>
 <5bb0d0ea.455b.181b885b569.Coremail.windhl@126.com>
 <CA+H2tpFhmYCbAX62Dta-Q7ER4Eh5cJwbc2uCQYQyzdVsM8Lvxg@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <30a4141c.68c.181bc86547d.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowAAXJiZSn79icQBBAA--.38728W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgsxF1-HZa5C+gACse
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CgoKCkF0IDIwMjItMDctMDIgMDE6MTI6MTAsICJPcnNvbiBaaGFpIiA8b3Jzb256aGFpQGdtYWls
LmNvbT4gd3JvdGU6Cj5MaWFuZywKPgo+T24gRnJpLCBKdWwgMSwgMjAyMiBhdCAyOjUwIFBNIExp
YW5nIEhlIDx3aW5kaGxAMTI2LmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+Cj4+IEF0IDIwMjItMDctMDEg
MTQ6Mzk6NTMsICJDaHVueWFuIFpoYW5nIiA8emhhbmcubHlyYUBnbWFpbC5jb20+IHdyb3RlOgo+
PiA+T24gRnJpLCAxIEp1bCAyMDIyIGF0IDEwOjQ2LCBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+
IHdyb3RlOgo+PiA+Pgo+PiA+PiBXZSBzaG91bGQgaG9sZCB0aGUgcmVmZXJlbmNlIHJldHVybmVk
IGJ5IG9mX2dldF9wYXJlbnQoKSBhbmQgdXNlIGl0Cj4+ID4+IHRvIGNhbGwgb2Zfbm9kZV9wdXQo
KSBmb3IgcmVmY291bnQgYmFsYW5jZS4KPj4gPj4KPj4gPj4gRml4ZXM6IGY5NWU4Yzc5MjNkMSAo
ImNsazogc3ByZDogc3VwcG9ydCB0byBnZXQgcmVnbWFwIGZyb20gcGFyZW50IG5vZGUiKQo+PiA+
PiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+Cj4+ID4+IC0tLQo+PiA+
PiAgY2hhbmdlbG9nOgo+PiA+Pgo+PiA+PiAgdjQ6IGZpeCBhbm90aGVyIGJ1ZyBpbiB0aGUgc2Ft
ZSBwbGFjZSwgbWlzc2luZyBpbiB2Mwo+PiA+PiAgdjM6ICgxKSBrZWVwIG9yaWdpbmFsICdpZi1l
bHNlIGlmLWVsc2UnIGNvZGluZyBzdHlsZSBhZHZpZXNkIGJ5IE9yc29uCj4+ID4+ICAgICAgKDIp
IGZpeCB0eXBvIGluIGNvbW1pdC1sb2c6IG9mX25vZGVfb3V0IC0tPiBvZl9ub2RlX3B1dAo+PiA+
PiAgdjI6IG1pbmltaXplIHRoZSBlZmZlY3RpdmUgcmFuZ2Ugb2Ygb2ZfZ2V0X3BhcmVudCgpIGFk
dmlzZWQgYnkgT3Jzb24KPj4gPj4gIHYxOiBob2xkIHJlZmVyZW5jZSByZXR1cm5lZCBieSBvZl9n
ZXRfcGFyZW50KCkKPj4gPj4KPj4gPj4KPj4gPj4gIGRyaXZlcnMvY2xrL3NwcmQvY29tbW9uLmMg
fCA5ICsrKysrLS0tLQo+PiA+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPj4gPj4KPj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3NwcmQvY29t
bW9uLmMgYi9kcml2ZXJzL2Nsay9zcHJkL2NvbW1vbi5jCj4+ID4+IGluZGV4IGQ2MjBiYmJjZGZj
OC4uMWI5YzJhYTA4MzZmIDEwMDY0NAo+PiA+PiAtLS0gYS9kcml2ZXJzL2Nsay9zcHJkL2NvbW1v
bi5jCj4+ID4+ICsrKyBiL2RyaXZlcnMvY2xrL3NwcmQvY29tbW9uLmMKPj4gPj4gQEAgLTQxLDcg
KzQxLDcgQEAgaW50IHNwcmRfY2xrX3JlZ21hcF9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYsCj4+ID4+ICB7Cj4+ID4+ICAgICAgICAgdm9pZCBfX2lvbWVtICpiYXNlOwo+PiA+PiAg
ICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4+ID4+IC0gICAgICAgc3Ry
dWN0IGRldmljZV9ub2RlICpub2RlID0gZGV2LT5vZl9ub2RlOwo+PiA+PiArICAgICAgIHN0cnVj
dCBkZXZpY2Vfbm9kZSAqbm9kZSA9IGRldi0+b2Zfbm9kZSwgKm5wOwo+PiA+PiAgICAgICAgIHN0
cnVjdCByZWdtYXAgKnJlZ21hcDsKPj4gPj4KPj4gPj4gICAgICAgICBpZiAob2ZfZmluZF9wcm9w
ZXJ0eShub2RlLCAic3ByZCxzeXNjb24iLCBOVUxMKSkgewo+PiA+PiBAQCAtNTAsOSArNTAsMTAg
QEAgaW50IHNwcmRfY2xrX3JlZ21hcF9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYs
Cj4+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgIHByX2VycigiJXM6IGZhaWxlZCB0byBnZXQg
c3lzY29uIHJlZ21hcFxuIiwgX19mdW5jX18pOwo+PiA+PiAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gUFRSX0VSUihyZWdtYXApOwo+PiA+PiAgICAgICAgICAgICAgICAgfQo+PiA+PiAt
ICAgICAgIH0gZWxzZSBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUob2ZfZ2V0X3BhcmVudChk
ZXYtPm9mX25vZGUpLAo+PiA+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAic3lzY29uIikp
IHsKPj4gPj4gLSAgICAgICAgICAgICAgIHJlZ21hcCA9IGRldmljZV9ub2RlX3RvX3JlZ21hcChv
Zl9nZXRfcGFyZW50KGRldi0+b2Zfbm9kZSkpOwo+PiA+PiArICAgICAgIH0gZWxzZSBpZiAob2Zf
ZGV2aWNlX2lzX2NvbXBhdGlibGUobnAgPSBvZl9nZXRfcGFyZW50KG5vZGUpLCAic3lzY29uIikK
Pj4gPj4gKyAgICAgICAgICAgICAgIHx8IChvZl9ub2RlX3B1dChucCksIDApKSB7Cj4+ID4+ICsg
ICAgICAgICAgICAgICByZWdtYXAgPSBkZXZpY2Vfbm9kZV90b19yZWdtYXAobnAgPSBvZl9nZXRf
cGFyZW50KG5vZGUpKTsKPj4gPgo+PiA+b2ZfZ2V0X3BhcmVudCgpIG9uZSBtb3JlIHRpbWUgd291
bGQgY2F1c2UgYW5vdGhlciB1bmJhbGFuY2UsIHdoeSBub3QKPj4gPnVzZSAnbnAnIGRpcmVjdGx5
IGhlcmU/Cj4+ID4KPj4gPkkgd291bGQgYWxzbyBzdWdnZXN0IHRvIGNjIExLTUwgKGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcpCj4+ID4KPj4gPlRoYW5rcywKPj4gPkNodW55YW4KPj4gPgo+
Pgo+PiBIaSwgQ2h1bnlhbiwKPj4KPj4gVGhhbmtzIGZvciByZXZpZXdpbmcgdGhpcyBwYXRjaCBj
b2RlLgo+Pgo+PiBJbiBmYWN0LCB0aGUgJ25wJyBoYXMgYWxyZWFkeSAgYmVlbiB8UFVUfCBpbiB0
aGUgJ2Vsc2UgaWYgKCAuLi58fCBvZl9ub2RlX3B1dChucCkuLiknLgo+Pgo+PiBCYXNlZCBvbiB0
aGUgb3JpZ2luYWwgY29kZSwgdGhlcmUgYXJlIHR3byBvZl9nZXRfcGFyZW50KCksIHNvIHdlIG5l
ZWQgdGhlIHNlY29uZAo+PiBvbmUgd2l0aCB0aGUgZm9sbG93aW5nIHNlY29uZCB8UFVUfC4KPgo+
U29ycnksIEkgbWlzc2VkIGl0LiBJIHRoaW5rIHdoYXQgQ2h1bnlhbiBzYWlkIGlzIHJpZ2h0Lgo+
Cj5ucCBpcyBkZWNsYXJlZCBhdCB0aGUgYmVnaW5uaW5nLCBzbyBpdCdzIG9rIHRvIGJlIHJlZmVy
cmVkIHRvIGluIGFsbAo+cGxhY2VzIGluICB0aGlzIGZ1bmN0aW9uCj5hZnRlciBiZWluZyBhc3Np
Z25lZC4KPnRoZSBmaXJzdCBvZl9ub2RlX3B1dCgpIHdpbGwgbm90IGJlIGNhbGxlZCBpZgo+b2Zf
ZGV2aWNlX2lzX2NvbXBhdGlibGUoKSByZXR1cm5zIHN1Y2Nlc3MuCgpIaSwgT3Jzb24sCgpOb3cs
IEkgdGhpbmsgdGhpcyB0b3RhbGx5IGRlcGVuZHMgb24gdGhlIGltcGxlbWVudGF0aW9uIG9mIGNv
bXBpbGVycy4KClNvLCB3ZSBzaG91bGQgaW50cm9kdWNlIHRoaXMgcG9zc2libGUgcmlzayBvciB1
c2UgbW9yZSBjb25zZXJ2YXRpdmUgd2F5IEkgdXNlIGJlZm9yZT8KCmRvIG5vdCBwdXQgfFBVVHwg
aW4gY29uZGl0aW9uIGFuZCBtb3ZlIGl0IHRvIHRoZSAnZWxzZScgYnJhbmNoPwoKVGhhbmtzLAoK
TGlhbmcKCgo+U28gd2UgY2FuIHJlZmVyIHRvIG5wIGRpcmVjdGx5IGhlcmUuCj4KPi1PcnNvbgo+
Cj4+Cj4+IFRoYW5rcywKPj4KPj4gTGlhbmcKPj4KPj4gPj4gKyAgICAgICAgICAgICAgIG9mX25v
ZGVfcHV0KG5wKTsKPj4gPj4gICAgICAgICAgICAgICAgIGlmIChJU19FUlIocmVnbWFwKSkgewo+
PiA+PiAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQg
cmVnbWFwIGZyb20gaXRzIHBhcmVudC5cbiIpOwo+PiA+PiAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gUFRSX0VSUihyZWdtYXApOwo+PiA+PiAtLQo+PiA+PiAyLjI1LjEKPj4gPj4K
