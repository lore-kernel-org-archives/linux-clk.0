Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF73CCA47B
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 14:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237199AbiF3Ogs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 10:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236000AbiF3Og1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 10:36:27 -0400
Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 129B24881D
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=FsvOw
        zuijBc3Oe+UQUjFJ81+vRMPJDmmhu0q3wbLWKc=; b=Ef92fhDQWQA+ehm1arTt/
        R1p6a2APzmjyDvlL7iSn9Wna0ZynO6hgtXt7d7U3T/6h8CgcDk1pDPvNw9qvJDqa
        4k7L9bQvE14WtLWQgIDlyfJXWCC0YWpN7jqiLCUC4igd509eU1l8ukTh91i4+f3l
        ayB80B+ZTHwFX3HXOg/Fz0=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Thu, 30 Jun 2022 22:27:49 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Thu, 30 Jun 2022 22:27:49 +0800 (CST)
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
In-Reply-To: <11362da4-69d2-0ba0-594a-a1ce1025c572@microchip.com>
References: <20220628132256.164120-1-windhl@126.com>
 <6a78dca9-96d6-08c3-7cb2-6773b4bc3883@microchip.com>
 <1e2ee2fe.6513.181b3d6580c.Coremail.windhl@126.com>
 <b026e219-48f6-f12d-2c91-7b64372fc178@microchip.com>
 <2bd293a2.7c0d.181b4b15961.Coremail.windhl@126.com>
 <11362da4-69d2-0ba0-594a-a1ce1025c572@microchip.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <788d6c23.8053.181b502cf7b.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowAAnLyfmsr1iJSNAAA--.51307W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhIwF18RPaFs6QABst
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CgoKCkF0IDIwMjItMDYtMzAgMjI6MTk6NDUsIENsYXVkaXUuQmV6bmVhQG1pY3JvY2hpcC5jb20g
d3JvdGU6Cj5PbiAzMC4wNi4yMDIyIDE1OjU4LCBMaWFuZyBIZSB3cm90ZToKPj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4+IAo+PiBBdCAyMDIyLTA2LTMwIDE4OjIwOjM2LCBD
bGF1ZGl1LkJlem5lYUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+Pj4gT24gMzAuMDYuMjAyMiAxMTo1
OSwgTGlhbmcgSGUgd3JvdGU6Cj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZl
Cj4+Pj4KPj4+PiBIaSwgIENsYXVkaXUuQmV6bmVhLAo+Pj4+Cj4+Pj4gQXQgMjAyMi0wNi0zMCAx
NjozOToyNiwgQ2xhdWRpdS5CZXpuZWFAbWljcm9jaGlwLmNvbSB3cm90ZToKPj4+Pj4gT24gMjgu
MDYuMjAyMiAxNjoyMiwgTGlhbmcgSGUgd3JvdGU6Cj4+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBj
b250ZW50IGlzIHNhZmUKPj4+Pj4+IFsuLi5dCj4+Pj4+PiBAQCAtNjk0LDggKzczMiw4IEBAIG9m
X2F0OTFfY2xrX3Byb2dfc2V0dXAoc3RydWN0IGRldmljZV9ub2RlICpucCwKPj4+Pj4+ICAgICAg
ICAgdW5zaWduZWQgaW50IG51bV9wYXJlbnRzOwo+Pj4+Pj4gICAgICAgICBjb25zdCBjaGFyICpw
YXJlbnRfbmFtZXNbUFJPR19TT1VSQ0VfTUFYXTsKPj4+Pj4+ICAgICAgICAgY29uc3QgY2hhciAq
bmFtZTsKPj4+Pj4+IC0gICAgICAgc3RydWN0IGRldmljZV9ub2RlICpwcm9nY2xrbnA7Cj4+Pj4+
PiAgICAgICAgIHN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPj4+Pj4+ICsgICAgICAgc3RydWN0IGRl
dmljZV9ub2RlICpwcm9nY2xrbnAsICpwYXJlbnRfbnA7Cj4+Pj4+Cj4+Pj4+IElzIHRoZXJlIGEg
cmVhc29uIHlvdSBjaG9zZWQgdG8gbW92ZSB0aGlzIG9uIGEgbmV3IGxpbmU/Cj4+Pj4KPj4+Pj4K
Pj4+Pgo+Pj4+IEluIGZhY3QsIEkganVzdCB3YW50IHRvIGtlZXAgbG9uZyBkZWNsYXJhdGlvbiBv
biBib3R0b20uCj4+Pj4KPj4+PiBIb3dldmVyLCB0aGlzIG1vZGlmaWNhdGlvbiBtYXliZSB1c2Vs
ZXNzLgo+Pj4+Cj4+Pj4KPj4+Pj4+IFsuLi5dCj4+Pj4+PiAgICAgICAgIHN0cnVjdCBjbGtfaHcg
Kmh3Owo+Pj4+Pj4gICAgICAgICBjb25zdCBjaGFyICpuYW1lOwo+Pj4+Pj4gLSAgICAgICBzdHJ1
Y3QgZGV2aWNlX25vZGUgKnN5c2Nsa25wOwo+Pj4+Pj4gICAgICAgICBjb25zdCBjaGFyICpwYXJl
bnRfbmFtZTsKPj4+Pj4+ICAgICAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+Pj4+Pj4gKyAg
ICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnN5c2Nsa25wLCAqcGFyZW50X25wOwo+Pj4+Pgo+Pj4+
PiBTYW1lIGhlcmUuCj4+Pj4KPj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gU2FtZSByZWFzb24gYXMgYWJv
dmUuCj4+Pj4KPj4+Pj4+Cj4+Pj4+PiAgICAgICAgIG51bSA9IG9mX2dldF9jaGlsZF9jb3VudChu
cCk7Cj4+Pj4+PiAgICAgICAgIGlmIChudW0gPiAoU1lTVEVNX01BWF9JRCArIDEpKQo+Pj4+Cj4+
Pj4+PiBAQCAtODg1LDkgKzkzNiwxMCBAQCBDTEtfT0ZfREVDTEFSRShhdDkxc2FtOXg1X2Nsa191
c2IsICJhdG1lbCxhdDkxc2FtOXg1LWNsay11c2IiLAo+Pj4+Pj4gIHN0YXRpYyB2b2lkIF9faW5p
dCBvZl9hdDkxc2FtOW4xMl9jbGtfdXNiX3NldHVwKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4+
Pj4+PiAgewo+Pj4+Pj4gICAgICAgICBzdHJ1Y3QgY2xrX2h3ICpodzsKPj4+Pj4+ICsgICAgICAg
c3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+Pj4+Pj4gICAgICAgICBjb25zdCBjaGFyICpwYXJlbnRf
bmFtZTsKPj4+Pj4+ICAgICAgICAgY29uc3QgY2hhciAqbmFtZSA9IG5wLT5uYW1lOwo+Pj4+Pj4g
LSAgICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4+Pj4+PiArICAgICAgIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqcGFyZW50X25wOwo+Pj4+Pgo+Pj4+PiBZb3UgbW92ZWQgYXJvdW5kIHRoZSBkZWNs
YXJhdGlvbnMuCj4+Pj4KPj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gU29ycnksIEkgaGF2ZSBiZWVuIHRv
bGQgdG8ga2VlcCByZXZlcnNlIGNocmlzdG1hcyB0cmVlLgo+Pj4KPj4+IEkgdGhvdWdodCB0aGlz
IHJ1bGUgaXMgb25seSBmb3IgbmV0d29ya2luZyBzdWJzeXN0ZW0uCj4+Pgo+PiAKPj4gT0ssIHRo
YW5rcywgSSB3aWxsIGtlZXAgdGhlIHJ1bGUgb25seSB3aGVuIEkgZml4IGJ1Z3MgaW4gbmV0d29y
a2luZyBzdWJzeXN0ZW0uCj4+IAo+PiBTbyAgaXQgbmVlZHMgdG8gc2VuZCBhIHYzIHRvIHJlc3Rv
cmUgdGhlIG9yZGVyIG9mIHRoZSBkZWNsYXJhdGlvbnM/Cj4KPlllcywgcGxlYXNlLgoKT0ssIHNv
b24uCj4KPj4gCj4+IElmIHllcywgSSB3aWxsIHJlc2VuZCBpdCBzb29uLgo+PiAKPj4gVGhhbmtz
Lgo+PiAKPj4gTGlhbmcKPj4gCj4+IAo+Pj4+Cj4+Pj4KPj4+PiBTbyB0aGlzIGxvb2sgbGlrZSBh
IG5vcm1hbCBjaHJpc3RtYXMgdHJlZT8KPj4+Pgo+Pj4+Cj4+Pj4+Pj4+ICAgICAgICAgcGFyZW50
X25hbWUgPSBvZl9jbGtfZ2V0X3BhcmVudF9uYW1lKG5wLCAwKTsKPj4+PiBbLi4uXQo+Pj4+Pj4g
KyAgICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4+Pj4+PiAgICAgICAgIGNvbnN0IGNoYXIg
KnBhcmVudF9uYW1lOwo+Pj4+Pj4gICAgICAgICBjb25zdCBjaGFyICpuYW1lID0gbnAtPm5hbWU7
Cj4+Pj4+PiArICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50X25wOwo+Pj4+Pj4gICAg
ICAgICB1MzIgZGl2aXNvcnNbNF0gPSB7MCwgMCwgMCwgMH07Cj4+Pj4+PiAtICAgICAgIHN0cnVj
dCByZWdtYXAgKnJlZ21hcDsKPj4+Pj4KPj4+Pj4gU2FtZSBoZXJlLgo+Pj4+Cj4+Pj4+Cj4+Pj4K
Pj4+Pgo+Pj4+IFNhbWUgcmVhc29uIGFzIGFib3ZlLgo+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gICAgICAg
ICBwYXJlbnRfbmFtZSA9IG9mX2Nsa19nZXRfcGFyZW50X25hbWUobnAsIDApOwo+Pj4+Pj4gICAg
ICAgICBpZiAoIXBhcmVudF9uYW1lKQo+Pj4+Pj4gQEAgLTkyNiw3ICs5ODEsOSBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgb2ZfYXQ5MXJtOTIwMF9jbGtfdXNiX3NldHVwKHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbnApCj4+Pj4KPj4+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IElmIHRoZXNlIGRlY2xhcmF0aW9uIGNo
YWdlcyBhcmUgbm90IG5lZWRlZCwgSSBjYW4gcmVzZW5kIGEgbmV3IHBhdGNoIGtlZXBpbmcgdGhl
IG9yaWdpbmFsIG9yZGVyIG9mIGRlY2xhcmF0aW9ucy4KPj4+Pgo+Pj4+Cj4+Pj4gVGhhbmtzLgo+
Pj4+Cj4+Pj4KPj4+PiBMaWFuZwo+Pj4KPgo=
