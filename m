Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEF9C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Jul 2022 21:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbiGAVYu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Jul 2022 17:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiGAVYu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jul 2022 17:24:50 -0400
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8C88443AE0
        for <linux-clk@vger.kernel.org>; Fri,  1 Jul 2022 14:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=l+R+6
        HUmYd7iUn97e3ELHqBZa4HLjwC8wQceYXA79z4=; b=D66tRIAuaeImvCZvVizvI
        3nUFs/OPHPWQOaYlM5uJ5qrDnsPs5Xf6CCl59LCCEzilt3rgp6zKt33TRLfSleG8
        mhmUViHWgpC9vsgNnP2HigCf8V/P3D+Imb/XiYF/PsDyonS4zn7il/FCQqDMfUoI
        eN5HxhgtsWMXOn3VEp+xO4=
Received: from windhl$126.com ( [123.112.71.157] ) by ajax-webmail-wmsvr50
 (Coremail) ; Sat, 2 Jul 2022 05:23:40 +0800 (CST)
X-Originating-IP: [123.112.71.157]
Date:   Sat, 2 Jul 2022 05:23:40 +0800 (CST)
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
Message-ID: <134bf586.c2.181bba5e539.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowAA3jPDdZb9ihMBBAA--.40300W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3AExF1pED14b6QACsE
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CgpBdCAyMDIyLTA3LTAyIDAxOjEyOjEwLCAiT3Jzb24gWmhhaSIgPG9yc29uemhhaUBnbWFpbC5j
b20+IHdyb3RlOgo+TGlhbmcsCj4KPk9uIEZyaSwgSnVsIDEsIDIwMjIgYXQgMjo1MCBQTSBMaWFu
ZyBIZSA8d2luZGhsQDEyNi5jb20+IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBBdCAyMDIyLTA3LTAxIDE0
OjM5OjUzLCAiQ2h1bnlhbiBaaGFuZyIgPHpoYW5nLmx5cmFAZ21haWwuY29tPiB3cm90ZToKPj4g
Pk9uIEZyaSwgMSBKdWwgMjAyMiBhdCAxMDo0NiwgTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPiB3
cm90ZToKPj4gPj4KPj4gPj4gV2Ugc2hvdWxkIGhvbGQgdGhlIHJlZmVyZW5jZSByZXR1cm5lZCBi
eSBvZl9nZXRfcGFyZW50KCkgYW5kIHVzZSBpdAo+PiA+PiB0byBjYWxsIG9mX25vZGVfcHV0KCkg
Zm9yIHJlZmNvdW50IGJhbGFuY2UuCj4+ID4+Cj4+ID4+IEZpeGVzOiBmOTVlOGM3OTIzZDEgKCJj
bGs6IHNwcmQ6IHN1cHBvcnQgdG8gZ2V0IHJlZ21hcCBmcm9tIHBhcmVudCBub2RlIikKPj4gPj4g
U2lnbmVkLW9mZi1ieTogTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPgo+PiA+PiAtLS0KPj4gPj4g
IGNoYW5nZWxvZzoKPj4gPj4KPj4gPj4gIHY0OiBmaXggYW5vdGhlciBidWcgaW4gdGhlIHNhbWUg
cGxhY2UsIG1pc3NpbmcgaW4gdjMKPj4gPj4gIHYzOiAoMSkga2VlcCBvcmlnaW5hbCAnaWYtZWxz
ZSBpZi1lbHNlJyBjb2Rpbmcgc3R5bGUgYWR2aWVzZCBieSBPcnNvbgo+PiA+PiAgICAgICgyKSBm
aXggdHlwbyBpbiBjb21taXQtbG9nOiBvZl9ub2RlX291dCAtLT4gb2Zfbm9kZV9wdXQKPj4gPj4g
IHYyOiBtaW5pbWl6ZSB0aGUgZWZmZWN0aXZlIHJhbmdlIG9mIG9mX2dldF9wYXJlbnQoKSBhZHZp
c2VkIGJ5IE9yc29uCj4+ID4+ICB2MTogaG9sZCByZWZlcmVuY2UgcmV0dXJuZWQgYnkgb2ZfZ2V0
X3BhcmVudCgpCj4+ID4+Cj4+ID4+Cj4+ID4+ICBkcml2ZXJzL2Nsay9zcHJkL2NvbW1vbi5jIHwg
OSArKysrKy0tLS0KPj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4+ID4+Cj4+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zcHJkL2NvbW1v
bi5jIGIvZHJpdmVycy9jbGsvc3ByZC9jb21tb24uYwo+PiA+PiBpbmRleCBkNjIwYmJiY2RmYzgu
LjFiOWMyYWEwODM2ZiAxMDA2NDQKPj4gPj4gLS0tIGEvZHJpdmVycy9jbGsvc3ByZC9jb21tb24u
Ywo+PiA+PiArKysgYi9kcml2ZXJzL2Nsay9zcHJkL2NvbW1vbi5jCj4+ID4+IEBAIC00MSw3ICs0
MSw3IEBAIGludCBzcHJkX2Nsa19yZWdtYXBfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2LAo+PiA+PiAgewo+PiA+PiAgICAgICAgIHZvaWQgX19pb21lbSAqYmFzZTsKPj4gPj4gICAg
ICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+PiA+PiAtICAgICAgIHN0cnVj
dCBkZXZpY2Vfbm9kZSAqbm9kZSA9IGRldi0+b2Zfbm9kZTsKPj4gPj4gKyAgICAgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5vZGUgPSBkZXYtPm9mX25vZGUsICpucDsKPj4gPj4gICAgICAgICBzdHJ1
Y3QgcmVnbWFwICpyZWdtYXA7Cj4+ID4+Cj4+ID4+ICAgICAgICAgaWYgKG9mX2ZpbmRfcHJvcGVy
dHkobm9kZSwgInNwcmQsc3lzY29uIiwgTlVMTCkpIHsKPj4gPj4gQEAgLTUwLDkgKzUwLDEwIEBA
IGludCBzcHJkX2Nsa19yZWdtYXBfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+
PiA+PiAgICAgICAgICAgICAgICAgICAgICAgICBwcl9lcnIoIiVzOiBmYWlsZWQgdG8gZ2V0IHN5
c2NvbiByZWdtYXBcbiIsIF9fZnVuY19fKTsKPj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIFBUUl9FUlIocmVnbWFwKTsKPj4gPj4gICAgICAgICAgICAgICAgIH0KPj4gPj4gLSAg
ICAgICB9IGVsc2UgaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG9mX2dldF9wYXJlbnQoZGV2
LT5vZl9ub2RlKSwKPj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgInN5c2NvbiIpKSB7
Cj4+ID4+IC0gICAgICAgICAgICAgICByZWdtYXAgPSBkZXZpY2Vfbm9kZV90b19yZWdtYXAob2Zf
Z2V0X3BhcmVudChkZXYtPm9mX25vZGUpKTsKPj4gPj4gKyAgICAgICB9IGVsc2UgaWYgKG9mX2Rl
dmljZV9pc19jb21wYXRpYmxlKG5wID0gb2ZfZ2V0X3BhcmVudChub2RlKSwgInN5c2NvbiIpCj4+
ID4+ICsgICAgICAgICAgICAgICB8fCAob2Zfbm9kZV9wdXQobnApLCAwKSkgewo+PiA+PiArICAg
ICAgICAgICAgICAgcmVnbWFwID0gZGV2aWNlX25vZGVfdG9fcmVnbWFwKG5wID0gb2ZfZ2V0X3Bh
cmVudChub2RlKSk7Cj4+ID4KPj4gPm9mX2dldF9wYXJlbnQoKSBvbmUgbW9yZSB0aW1lIHdvdWxk
IGNhdXNlIGFub3RoZXIgdW5iYWxhbmNlLCB3aHkgbm90Cj4+ID51c2UgJ25wJyBkaXJlY3RseSBo
ZXJlPwo+PiA+Cj4+ID5JIHdvdWxkIGFsc28gc3VnZ2VzdCB0byBjYyBMS01MIChsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnKQo+PiA+Cj4+ID5UaGFua3MsCj4+ID5DaHVueWFuCj4+ID4KPj4K
Pj4gSGksIENodW55YW4sCj4+Cj4+IFRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoaXMgcGF0Y2ggY29k
ZS4KPj4KPj4gSW4gZmFjdCwgdGhlICducCcgaGFzIGFscmVhZHkgIGJlZW4gfFBVVHwgaW4gdGhl
ICdlbHNlIGlmICggLi4ufHwgb2Zfbm9kZV9wdXQobnApLi4pJy4KPj4KPj4gQmFzZWQgb24gdGhl
IG9yaWdpbmFsIGNvZGUsIHRoZXJlIGFyZSB0d28gb2ZfZ2V0X3BhcmVudCgpLCBzbyB3ZSBuZWVk
IHRoZSBzZWNvbmQKPj4gb25lIHdpdGggdGhlIGZvbGxvd2luZyBzZWNvbmQgfFBVVHwuCj4KPlNv
cnJ5LCBJIG1pc3NlZCBpdC4gSSB0aGluayB3aGF0IENodW55YW4gc2FpZCBpcyByaWdodC4KPgo+
bnAgaXMgZGVjbGFyZWQgYXQgdGhlIGJlZ2lubmluZywgc28gaXQncyBvayB0byBiZSByZWZlcnJl
ZCB0byBpbiBhbGwKPnBsYWNlcyBpbiAgdGhpcyBmdW5jdGlvbgo+YWZ0ZXIgYmVpbmcgYXNzaWdu
ZWQuCj50aGUgZmlyc3Qgb2Zfbm9kZV9wdXQoKSB3aWxsIG5vdCBiZSBjYWxsZWQgaWYKPm9mX2Rl
dmljZV9pc19jb21wYXRpYmxlKCkgcmV0dXJucyBzdWNjZXNzLgo+U28gd2UgY2FuIHJlZmVyIHRv
IG5wIGRpcmVjdGx5IGhlcmUuCj4KPi1PcnNvbgo+CgpUaGFua3MsIE9yc29uIGFuZCBDaHVueWFu
LgoKSSBoYXZlIGxlYXJuZWQgYSBncmVhdCBsZXNzb24uCgpUaGlzIGlzIHdoYXQgSSBsZWFybmVk
OgoKaWYgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoKSByZXR1cm5zIHN1Y2Nlc3MsICB0aGUgZmly
c3Qgb2Zfbm9kZV9wdXQgYXMgdGhlICd8fCcgd2lsbCBub3QgCmJlIGNhbGxlZCwgdGhlbiB3ZSBk
aXJlY3RseSB1c2UgJ25wJyBpbiB0aGUgYnJhbmNoIGFuZCBhbHNvIHVzZSBpdCB0byBjYWxsIHRo
ZSBzZWNvbmQgb2Zfbm9kZV9wdXQoKS4KCklmIG9mX2RldmljZV9pc19jb21wYXRpYmxlKCkgcmV0
dXJucyBmYWxzZSwgdGhlIGJyYW5jaCB3aWxsIG5vdCBiZSBleGVjdXRlZCwgYnV0IHRoZSAKb2Zf
bm9kZV9wdXQoKSBpbiB0aGUgJ2Vsc2UgaWYnIGNvbmRpdGlvbiB3aWxsIGJlIGV4ZWN1dHVlZC4K
CklmIHRoaXMgaXMgdGhlIHRydXRoLCBJIHdpbGwgYmVnaW4gdG8gcHJlcGFyZSBteSBuZXcgdmVy
c2lvbiBwYXRjaC4KClRoYW5rcyBhZ2FpbiBmb3IgYm90aCBvZiB5b3UuCgpMaWFuZwoKPj4KPj4g
VGhhbmtzLAo+Pgo+PiBMaWFuZwo+Pgo+PiA+PiArICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQo
bnApOwo+PiA+PiAgICAgICAgICAgICAgICAgaWYgKElTX0VSUihyZWdtYXApKSB7Cj4+ID4+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGdldCByZWdtYXAg
ZnJvbSBpdHMgcGFyZW50LlxuIik7Cj4+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biBQVFJfRVJSKHJlZ21hcCk7Cj4+ID4+IC0tCj4+ID4+IDIuMjUuMQo+PiA+Pgo=
