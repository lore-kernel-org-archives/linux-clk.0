Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8F4C43334
	for <linux-clk@archiver.kernel.org>; Fri,  1 Jul 2022 06:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbiGAGtw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Jul 2022 02:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiGAGtv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jul 2022 02:49:51 -0400
Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 85A8E48838
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 23:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=NlF5d
        b/2GZMtYXkGOReylu4rDDsOvmlaWP8UQTRNVbE=; b=IJ7sbZ3qmxN9m5iEqvodz
        OXgT0OqODT1Sliq46rYaiig4p9kRLxFUzBFa6cOmMIy8/7XTVaypA2LaZgAbCv9+
        2pt+B1gPLd/FlqGtC6hbQ26MMEGkkU5glSGnz5a4MGWNm1F4lmo+8hs5z4bNJEW3
        JdGa4bxL2cIuNLLVsuuAK0=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Fri, 1 Jul 2022 14:49:39 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Fri, 1 Jul 2022 14:49:39 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Chunyan Zhang" <zhang.lyra@gmail.com>
Cc:     "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        "Orson Zhai" <orsonzhai@gmail.com>,
        "Baolin Wang" <baolin.wang7@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re:Re: [PATCH v4] clk: sprd: Hold reference returned by
 of_get_parent()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAAfSe-vAuFK1qfCA9H_k3MDTa-7rP4FsfkMPMkR1+L60CU8iMg@mail.gmail.com>
References: <20220701024606.223438-1-windhl@126.com>
 <CAAfSe-vAuFK1qfCA9H_k3MDTa-7rP4FsfkMPMkR1+L60CU8iMg@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <5bb0d0ea.455b.181b885b569.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowADXOEQEmb5idJJAAA--.53672W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3AExF1pED1sE+QACsO
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CgpBdCAyMDIyLTA3LTAxIDE0OjM5OjUzLCAiQ2h1bnlhbiBaaGFuZyIgPHpoYW5nLmx5cmFAZ21h
aWwuY29tPiB3cm90ZToKPk9uIEZyaSwgMSBKdWwgMjAyMiBhdCAxMDo0NiwgTGlhbmcgSGUgPHdp
bmRobEAxMjYuY29tPiB3cm90ZToKPj4KPj4gV2Ugc2hvdWxkIGhvbGQgdGhlIHJlZmVyZW5jZSBy
ZXR1cm5lZCBieSBvZl9nZXRfcGFyZW50KCkgYW5kIHVzZSBpdAo+PiB0byBjYWxsIG9mX25vZGVf
cHV0KCkgZm9yIHJlZmNvdW50IGJhbGFuY2UuCj4+Cj4+IEZpeGVzOiBmOTVlOGM3OTIzZDEgKCJj
bGs6IHNwcmQ6IHN1cHBvcnQgdG8gZ2V0IHJlZ21hcCBmcm9tIHBhcmVudCBub2RlIikKPj4gU2ln
bmVkLW9mZi1ieTogTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPgo+PiAtLS0KPj4gIGNoYW5nZWxv
ZzoKPj4KPj4gIHY0OiBmaXggYW5vdGhlciBidWcgaW4gdGhlIHNhbWUgcGxhY2UsIG1pc3Npbmcg
aW4gdjMKPj4gIHYzOiAoMSkga2VlcCBvcmlnaW5hbCAnaWYtZWxzZSBpZi1lbHNlJyBjb2Rpbmcg
c3R5bGUgYWR2aWVzZCBieSBPcnNvbgo+PiAgICAgICgyKSBmaXggdHlwbyBpbiBjb21taXQtbG9n
OiBvZl9ub2RlX291dCAtLT4gb2Zfbm9kZV9wdXQKPj4gIHYyOiBtaW5pbWl6ZSB0aGUgZWZmZWN0
aXZlIHJhbmdlIG9mIG9mX2dldF9wYXJlbnQoKSBhZHZpc2VkIGJ5IE9yc29uCj4+ICB2MTogaG9s
ZCByZWZlcmVuY2UgcmV0dXJuZWQgYnkgb2ZfZ2V0X3BhcmVudCgpCj4+Cj4+Cj4+ICBkcml2ZXJz
L2Nsay9zcHJkL2NvbW1vbi5jIHwgOSArKysrKy0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9zcHJkL2NvbW1vbi5jIGIvZHJpdmVycy9jbGsvc3ByZC9jb21tb24uYwo+PiBpbmRleCBkNjIw
YmJiY2RmYzguLjFiOWMyYWEwODM2ZiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9jbGsvc3ByZC9j
b21tb24uYwo+PiArKysgYi9kcml2ZXJzL2Nsay9zcHJkL2NvbW1vbi5jCj4+IEBAIC00MSw3ICs0
MSw3IEBAIGludCBzcHJkX2Nsa19yZWdtYXBfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2LAo+PiAgewo+PiAgICAgICAgIHZvaWQgX19pb21lbSAqYmFzZTsKPj4gICAgICAgICBzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+PiAtICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbm9kZSA9IGRldi0+b2Zfbm9kZTsKPj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5v
ZGUgPSBkZXYtPm9mX25vZGUsICpucDsKPj4gICAgICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7
Cj4+Cj4+ICAgICAgICAgaWYgKG9mX2ZpbmRfcHJvcGVydHkobm9kZSwgInNwcmQsc3lzY29uIiwg
TlVMTCkpIHsKPj4gQEAgLTUwLDkgKzUwLDEwIEBAIGludCBzcHJkX2Nsa19yZWdtYXBfaW5pdChz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+PiAgICAgICAgICAgICAgICAgICAgICAgICBw
cl9lcnIoIiVzOiBmYWlsZWQgdG8gZ2V0IHN5c2NvbiByZWdtYXBcbiIsIF9fZnVuY19fKTsKPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocmVnbWFwKTsKPj4gICAgICAg
ICAgICAgICAgIH0KPj4gLSAgICAgICB9IGVsc2UgaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxl
KG9mX2dldF9wYXJlbnQoZGV2LT5vZl9ub2RlKSwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgInN5c2NvbiIpKSB7Cj4+IC0gICAgICAgICAgICAgICByZWdtYXAgPSBkZXZpY2Vfbm9kZV90
b19yZWdtYXAob2ZfZ2V0X3BhcmVudChkZXYtPm9mX25vZGUpKTsKPj4gKyAgICAgICB9IGVsc2Ug
aWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wID0gb2ZfZ2V0X3BhcmVudChub2RlKSwgInN5
c2NvbiIpCj4+ICsgICAgICAgICAgICAgICB8fCAob2Zfbm9kZV9wdXQobnApLCAwKSkgewo+PiAr
ICAgICAgICAgICAgICAgcmVnbWFwID0gZGV2aWNlX25vZGVfdG9fcmVnbWFwKG5wID0gb2ZfZ2V0
X3BhcmVudChub2RlKSk7Cj4KPm9mX2dldF9wYXJlbnQoKSBvbmUgbW9yZSB0aW1lIHdvdWxkIGNh
dXNlIGFub3RoZXIgdW5iYWxhbmNlLCB3aHkgbm90Cj51c2UgJ25wJyBkaXJlY3RseSBoZXJlPwo+
Cj5JIHdvdWxkIGFsc28gc3VnZ2VzdCB0byBjYyBMS01MIChsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnKQo+Cj5UaGFua3MsCj5DaHVueWFuCj4KCkhpLCBDaHVueWFuLAoKVGhhbmtzIGZvciBy
ZXZpZXdpbmcgdGhpcyBwYXRjaCBjb2RlLgoKSW4gZmFjdCwgdGhlICducCcgaGFzIGFscmVhZHkg
IGJlZW4gfFBVVHwgaW4gdGhlICdlbHNlIGlmICggLi4ufHwgb2Zfbm9kZV9wdXQobnApLi4pJy4K
CkJhc2VkIG9uIHRoZSBvcmlnaW5hbCBjb2RlLCB0aGVyZSBhcmUgdHdvIG9mX2dldF9wYXJlbnQo
KSwgc28gd2UgbmVlZCB0aGUgc2Vjb25kCm9uZSB3aXRoIHRoZSBmb2xsb3dpbmcgc2Vjb25kIHxQ
VVR8LgoKVGhhbmtzLAoKTGlhbmcKCj4+ICsgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChucCk7
Cj4+ICAgICAgICAgICAgICAgICBpZiAoSVNfRVJSKHJlZ21hcCkpIHsKPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0IHJlZ21hcCBmcm9tIGl0cyBw
YXJlbnQuXG4iKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocmVn
bWFwKTsKPj4gLS0KPj4gMi4yNS4xCj4+Cg==
