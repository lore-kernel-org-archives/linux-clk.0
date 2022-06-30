Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E856C43334
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 09:02:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbiF3JCH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 05:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiF3JCH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 05:02:07 -0400
Received: from m1564.mail.126.com (m1564.mail.126.com [220.181.15.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BDB10F585
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 02:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=ijUlj
        kPQTHw4Sae0SPIyV5gHdh8w71Lmeu9ydOYOclc=; b=TzcghZjjfzdH4818hE9pw
        Qizm1UvAxHK5Ncr66Gej80M1cQc2jrLh54Ik9OXM2WFPNKcKGiK4j8VTzX0gEHcq
        V4POn5AgyrHBmpCFp9ZjWdcQrTs58HLEnTi7MC0WgV0iiUR7Lnj6+rplXcERHUno
        jBv28DOdRfkVVTjEuAGvyg=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr64
 (Coremail) ; Thu, 30 Jun 2022 16:59:37 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Thu, 30 Jun 2022 16:59:37 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     Claudiu.Beznea@microchip.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        linux-clk@vger.kernel.org
Subject: Re:Re: [PATCH v2] clk: at91: dt-compat: Hold reference returned by
 of_get_parent()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <6a78dca9-96d6-08c3-7cb2-6773b4bc3883@microchip.com>
References: <20220628132256.164120-1-windhl@126.com>
 <6a78dca9-96d6-08c3-7cb2-6773b4bc3883@microchip.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1e2ee2fe.6513.181b3d6580c.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowAAXJnL6Zb1iacxCAA--.44641W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QUwF1pEAT8ObgABsO
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CkhpLMKgIENsYXVkaXUuQmV6bmVhLAoKQXQgMjAyMi0wNi0zMCAxNjozOToyNiwgQ2xhdWRpdS5C
ZXpuZWFAbWljcm9jaGlwLmNvbSB3cm90ZToKPk9uIDI4LjA2LjIwMjIgMTY6MjIsIExpYW5nIEhl
IHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUKPj4gWy4uLl0KPj4g
QEAgLTY5NCw4ICs3MzIsOCBAQCBvZl9hdDkxX2Nsa19wcm9nX3NldHVwKHN0cnVjdCBkZXZpY2Vf
bm9kZSAqbnAsCj4+ICAgICAgICAgdW5zaWduZWQgaW50IG51bV9wYXJlbnRzOwo+PiAgICAgICAg
IGNvbnN0IGNoYXIgKnBhcmVudF9uYW1lc1tQUk9HX1NPVVJDRV9NQVhdOwo+PiAgICAgICAgIGNv
bnN0IGNoYXIgKm5hbWU7Cj4+IC0gICAgICAgc3RydWN0IGRldmljZV9ub2RlICpwcm9nY2xrbnA7
Cj4+ICAgICAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+PiArICAgICAgIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqcHJvZ2Nsa25wLCAqcGFyZW50X25wOwo+Cj5JcyB0aGVyZSBhIHJlYXNvbiB5b3Ug
Y2hvc2VkIHRvIG1vdmUgdGhpcyBvbiBhIG5ldyBsaW5lPwoKPgoKSW4gZmFjdCwgSSBqdXN0IHdh
bnQgdG8ga2VlcCBsb25nIGRlY2xhcmF0aW9uIG9uIGJvdHRvbS4KCkhvd2V2ZXIsIHRoaXMgbW9k
aWZpY2F0aW9uIG1heWJlIHVzZWxlc3MuIAoKCj4+IFsuLi5dCj4+ICAgICAgICAgc3RydWN0IGNs
a19odyAqaHc7Cj4+ICAgICAgICAgY29uc3QgY2hhciAqbmFtZTsKPj4gLSAgICAgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKnN5c2Nsa25wOwo+PiAgICAgICAgIGNvbnN0IGNoYXIgKnBhcmVudF9uYW1l
Owo+PiAgICAgICAgIHN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPj4gKyAgICAgICBzdHJ1Y3QgZGV2
aWNlX25vZGUgKnN5c2Nsa25wLCAqcGFyZW50X25wOwo+Cj5TYW1lIGhlcmUuCgo+CgoKU2FtZSBy
ZWFzb24gYXMgYWJvdmUuCgo+PiAKPj4gICAgICAgICBudW0gPSBvZl9nZXRfY2hpbGRfY291bnQo
bnApOwo+PiAgICAgICAgIGlmIChudW0gPiAoU1lTVEVNX01BWF9JRCArIDEpKQoKPj4gQEAgLTg4
NSw5ICs5MzYsMTAgQEAgQ0xLX09GX0RFQ0xBUkUoYXQ5MXNhbTl4NV9jbGtfdXNiLCAiYXRtZWws
YXQ5MXNhbTl4NS1jbGstdXNiIiwKPj4gIHN0YXRpYyB2b2lkIF9faW5pdCBvZl9hdDkxc2FtOW4x
Ml9jbGtfdXNiX3NldHVwKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4+ICB7Cj4+ICAgICAgICAg
c3RydWN0IGNsa19odyAqaHc7Cj4+ICsgICAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+PiAg
ICAgICAgIGNvbnN0IGNoYXIgKnBhcmVudF9uYW1lOwo+PiAgICAgICAgIGNvbnN0IGNoYXIgKm5h
bWUgPSBucC0+bmFtZTsKPj4gLSAgICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4+ICsgICAg
ICAgc3RydWN0IGRldmljZV9ub2RlICpwYXJlbnRfbnA7Cj4KPllvdSBtb3ZlZCBhcm91bmQgdGhl
IGRlY2xhcmF0aW9ucy4KCj4KCgpTb3JyeSwgSSBoYXZlIGJlZW4gdG9sZCB0byBrZWVwIHJldmVy
c2UgY2hyaXN0bWFzIHRyZWUuCgoKU28gdGhpcyBsb29rIGxpa2UgYSBub3JtYWwgY2hyaXN0bWFz
IHRyZWU/CgoKPj4gPj4gICAgICAgICBwYXJlbnRfbmFtZSA9IG9mX2Nsa19nZXRfcGFyZW50X25h
bWUobnAsIDApOwpbLi4uXQo+PiArICAgICAgIHN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPj4gICAg
ICAgICBjb25zdCBjaGFyICpwYXJlbnRfbmFtZTsKPj4gICAgICAgICBjb25zdCBjaGFyICpuYW1l
ID0gbnAtPm5hbWU7Cj4+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpwYXJlbnRfbnA7Cj4+
ICAgICAgICAgdTMyIGRpdmlzb3JzWzRdID0gezAsIDAsIDAsIDB9Owo+PiAtICAgICAgIHN0cnVj
dCByZWdtYXAgKnJlZ21hcDsKPgo+U2FtZSBoZXJlLgoKPgoKClNhbWUgcmVhc29uIGFzIGFib3Zl
LgoKPj4gCj4+ICAgICAgICAgcGFyZW50X25hbWUgPSBvZl9jbGtfZ2V0X3BhcmVudF9uYW1lKG5w
LCAwKTsKPj4gICAgICAgICBpZiAoIXBhcmVudF9uYW1lKQo+PiBAQCAtOTI2LDcgKzk4MSw5IEBA
IHN0YXRpYyB2b2lkIF9faW5pdCBvZl9hdDkxcm05MjAwX2Nsa191c2Jfc2V0dXAoc3RydWN0IGRl
dmljZV9ub2RlICpucCkKCj4+IAoKCklmIHRoZXNlIGRlY2xhcmF0aW9uIGNoYWdlcyBhcmUgbm90
IG5lZWRlZCwgSSBjYW4gcmVzZW5kIGEgbmV3IHBhdGNoIGtlZXBpbmcgdGhlIG9yaWdpbmFsIG9y
ZGVyIG9mIGRlY2xhcmF0aW9ucy4KCgpUaGFua3MuCgoKTGlhbmcg
