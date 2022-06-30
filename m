Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B39C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 12:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232808AbiF3M7c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 08:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232428AbiF3M7c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 08:59:32 -0400
Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1520540A15
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=4Z2Ek
        oklmlMOrmSYiPEv9gtvfh9G3Y8xYklTTEO07l0=; b=FR+RJetym+ugFsYIak2W4
        TVfw/DU3FCWavBFcn/R0j6xd95xP3Gcl9SccDiXH5YDLMp1RfjvVixfLO8QYqIkZ
        WQ4BO4htpD5w5RGtQBTfJC2DteeEl8amQkl8Fat3mgXHC5THaLrqht+vlJPb0YeW
        D0VseOrabtnKrNIlPX/Fxc=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Thu, 30 Jun 2022 20:58:50 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Thu, 30 Jun 2022 20:58:50 +0800 (CST)
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
In-Reply-To: <b026e219-48f6-f12d-2c91-7b64372fc178@microchip.com>
References: <20220628132256.164120-1-windhl@126.com>
 <6a78dca9-96d6-08c3-7cb2-6773b4bc3883@microchip.com>
 <1e2ee2fe.6513.181b3d6580c.Coremail.windhl@126.com>
 <b026e219-48f6-f12d-2c91-7b64372fc178@microchip.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <2bd293a2.7c0d.181b4b15961.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowAD3_iYLnr1iJB1AAA--.49270W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QAwF1pEAUAjTQACs5
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CgoKCgpBdCAyMDIyLTA2LTMwIDE4OjIwOjM2LCBDbGF1ZGl1LkJlem5lYUBtaWNyb2NoaXAuY29t
IHdyb3RlOgo+T24gMzAuMDYuMjAyMiAxMTo1OSwgTGlhbmcgSGUgd3JvdGU6Cj4+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+PiAKPj4gSGksICBDbGF1ZGl1LkJlem5lYSwKPj4g
Cj4+IEF0IDIwMjItMDYtMzAgMTY6Mzk6MjYsIENsYXVkaXUuQmV6bmVhQG1pY3JvY2hpcC5jb20g
d3JvdGU6Cj4+PiBPbiAyOC4wNi4yMDIyIDE2OjIyLCBMaWFuZyBIZSB3cm90ZToKPj4+PiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUKPj4+PiBbLi4uXQo+Pj4+IEBAIC02OTQsOCAr
NzMyLDggQEAgb2ZfYXQ5MV9jbGtfcHJvZ19zZXR1cChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+
Pj4+ICAgICAgICAgdW5zaWduZWQgaW50IG51bV9wYXJlbnRzOwo+Pj4+ICAgICAgICAgY29uc3Qg
Y2hhciAqcGFyZW50X25hbWVzW1BST0dfU09VUkNFX01BWF07Cj4+Pj4gICAgICAgICBjb25zdCBj
aGFyICpuYW1lOwo+Pj4+IC0gICAgICAgc3RydWN0IGRldmljZV9ub2RlICpwcm9nY2xrbnA7Cj4+
Pj4gICAgICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4+Pj4gKyAgICAgICBzdHJ1Y3QgZGV2
aWNlX25vZGUgKnByb2djbGtucCwgKnBhcmVudF9ucDsKPj4+Cj4+PiBJcyB0aGVyZSBhIHJlYXNv
biB5b3UgY2hvc2VkIHRvIG1vdmUgdGhpcyBvbiBhIG5ldyBsaW5lPwo+PiAKPj4+Cj4+IAo+PiBJ
biBmYWN0LCBJIGp1c3Qgd2FudCB0byBrZWVwIGxvbmcgZGVjbGFyYXRpb24gb24gYm90dG9tLgo+
PiAKPj4gSG93ZXZlciwgdGhpcyBtb2RpZmljYXRpb24gbWF5YmUgdXNlbGVzcy4KPj4gCj4+IAo+
Pj4+IFsuLi5dCj4+Pj4gICAgICAgICBzdHJ1Y3QgY2xrX2h3ICpodzsKPj4+PiAgICAgICAgIGNv
bnN0IGNoYXIgKm5hbWU7Cj4+Pj4gLSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnN5c2Nsa25w
Owo+Pj4+ICAgICAgICAgY29uc3QgY2hhciAqcGFyZW50X25hbWU7Cj4+Pj4gICAgICAgICBzdHJ1
Y3QgcmVnbWFwICpyZWdtYXA7Cj4+Pj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnN5c2Ns
a25wLCAqcGFyZW50X25wOwo+Pj4KPj4+IFNhbWUgaGVyZS4KPj4gCj4+Pgo+PiAKPj4gCj4+IFNh
bWUgcmVhc29uIGFzIGFib3ZlLgo+PiAKPj4+Pgo+Pj4+ICAgICAgICAgbnVtID0gb2ZfZ2V0X2No
aWxkX2NvdW50KG5wKTsKPj4+PiAgICAgICAgIGlmIChudW0gPiAoU1lTVEVNX01BWF9JRCArIDEp
KQo+PiAKPj4+PiBAQCAtODg1LDkgKzkzNiwxMCBAQCBDTEtfT0ZfREVDTEFSRShhdDkxc2FtOXg1
X2Nsa191c2IsICJhdG1lbCxhdDkxc2FtOXg1LWNsay11c2IiLAo+Pj4+ICBzdGF0aWMgdm9pZCBf
X2luaXQgb2ZfYXQ5MXNhbTluMTJfY2xrX3VzYl9zZXR1cChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
KQo+Pj4+ICB7Cj4+Pj4gICAgICAgICBzdHJ1Y3QgY2xrX2h3ICpodzsKPj4+PiArICAgICAgIHN0
cnVjdCByZWdtYXAgKnJlZ21hcDsKPj4+PiAgICAgICAgIGNvbnN0IGNoYXIgKnBhcmVudF9uYW1l
Owo+Pj4+ICAgICAgICAgY29uc3QgY2hhciAqbmFtZSA9IG5wLT5uYW1lOwo+Pj4+IC0gICAgICAg
c3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+Pj4+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpw
YXJlbnRfbnA7Cj4+Pgo+Pj4gWW91IG1vdmVkIGFyb3VuZCB0aGUgZGVjbGFyYXRpb25zLgo+PiAK
Pj4+Cj4+IAo+PiAKPj4gU29ycnksIEkgaGF2ZSBiZWVuIHRvbGQgdG8ga2VlcCByZXZlcnNlIGNo
cmlzdG1hcyB0cmVlLgo+Cj5JIHRob3VnaHQgdGhpcyBydWxlIGlzIG9ubHkgZm9yIG5ldHdvcmtp
bmcgc3Vic3lzdGVtLgo+CgpPSywgdGhhbmtzLCBJIHdpbGwga2VlcCB0aGUgcnVsZSBvbmx5IHdo
ZW4gSSBmaXggYnVncyBpbiBuZXR3b3JraW5nIHN1YnN5c3RlbS4KClNvICBpdCBuZWVkcyB0byBz
ZW5kIGEgdjMgdG8gcmVzdG9yZSB0aGUgb3JkZXIgb2YgdGhlIGRlY2xhcmF0aW9ucz8KCklmIHll
cywgSSB3aWxsIHJlc2VuZCBpdCBzb29uLiAKClRoYW5rcy4KCkxpYW5nCgoKPj4gCj4+IAo+PiBT
byB0aGlzIGxvb2sgbGlrZSBhIG5vcm1hbCBjaHJpc3RtYXMgdHJlZT8KPj4gCj4+IAo+Pj4+Pj4g
ICAgICAgICBwYXJlbnRfbmFtZSA9IG9mX2Nsa19nZXRfcGFyZW50X25hbWUobnAsIDApOwo+PiBb
Li4uXQo+Pj4+ICsgICAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+Pj4+ICAgICAgICAgY29u
c3QgY2hhciAqcGFyZW50X25hbWU7Cj4+Pj4gICAgICAgICBjb25zdCBjaGFyICpuYW1lID0gbnAt
Pm5hbWU7Cj4+Pj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcmVudF9ucDsKPj4+PiAg
ICAgICAgIHUzMiBkaXZpc29yc1s0XSA9IHswLCAwLCAwLCAwfTsKPj4+PiAtICAgICAgIHN0cnVj
dCByZWdtYXAgKnJlZ21hcDsKPj4+Cj4+PiBTYW1lIGhlcmUuCj4+IAo+Pj4KPj4gCj4+IAo+PiBT
YW1lIHJlYXNvbiBhcyBhYm92ZS4KPj4gCj4+Pj4KPj4+PiAgICAgICAgIHBhcmVudF9uYW1lID0g
b2ZfY2xrX2dldF9wYXJlbnRfbmFtZShucCwgMCk7Cj4+Pj4gICAgICAgICBpZiAoIXBhcmVudF9u
YW1lKQo+Pj4+IEBAIC05MjYsNyArOTgxLDkgQEAgc3RhdGljIHZvaWQgX19pbml0IG9mX2F0OTFy
bTkyMDBfY2xrX3VzYl9zZXR1cChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+PiAKPj4+Pgo+PiAK
Pj4gCj4+IElmIHRoZXNlIGRlY2xhcmF0aW9uIGNoYWdlcyBhcmUgbm90IG5lZWRlZCwgSSBjYW4g
cmVzZW5kIGEgbmV3IHBhdGNoIGtlZXBpbmcgdGhlIG9yaWdpbmFsIG9yZGVyIG9mIGRlY2xhcmF0
aW9ucy4KPj4gCj4+IAo+PiBUaGFua3MuCj4+IAo+PiAKPj4gTGlhbmcKPgo=
