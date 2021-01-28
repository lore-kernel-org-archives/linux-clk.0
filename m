Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F69C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 28 Jan 2021 04:06:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E323E64DD1
	for <linux-clk@archiver.kernel.org>; Thu, 28 Jan 2021 04:06:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbhA1EG0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Jan 2021 23:06:26 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:37379 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229545AbhA1EFW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jan 2021 23:05:22 -0500
X-UUID: 95a272e237da400daa76b54aec9b1207-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=fg+euiyblGbtxNVAjLLyu7Sv510gpFwpVrdrd1jugf4=;
        b=qkNEl1DZETvkkT7lcPJmBNgX1/+SIMjdqBJ3/6Z0i8ULmlNVKgYvJGKdWmtyo+4/MjktiEbzxwcAHuq8cjqagBPknJFUejTZslMe51rx7b/YHwGaD/vLCmbMYofEDARKLud77781v38bETZ3BY5B+dIfk394eRDPdldwLkRfIvU=;
X-UUID: 95a272e237da400daa76b54aec9b1207-20210128
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 348542046; Thu, 28 Jan 2021 12:04:35 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 12:04:33 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 12:04:33 +0800
Message-ID: <1611806673.11015.5.camel@mtksdaap41>
Subject: Re: [PATCH 2/2] clk: mediatek: mux: Update parent at enable time
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Phi-Bang Nguyen <pnguyen@baylibre.com>,
        <linux-mediatek@lists.infradead.org>
Date:   Thu, 28 Jan 2021 12:04:33 +0800
In-Reply-To: <20210125170819.26130-3-laurent.pinchart@ideasonboard.com>
References: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com>
         <20210125170819.26130-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gTW9uLCAyMDIxLTAxLTI1IGF0IDE5OjA4ICswMjAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3Rl
Og0KPiBUaGUgbXV4IGNsb2NrcyBkb24ndCBhbHdheXMgY29ycmVjdGx5IHRha2UgdGhlIG5ldyBw
YXJlbnQgaW50byBhY2NvdW50DQo+IHdoZW4gdGhlIHBhcmVudCBpcyB1cGRhdGVkIHdoaWxlIHRo
ZSBjbG9jayBpcyBkaXNhYmxlZC4gU2V0IHRoZSB1cGRhdGUNCj4gYml0IHdoZW4gZW5hYmxpbmcg
dGhlIGNsb2NrIHRvIGZvcmNlIGFuIHVwZGF0ZSBvZiB0aGUgbXV4Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
Pg0KDQpIaSBMYXVyZW50LA0KDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4gTG9va3MgZ29vZCB0
byBtZS4NClJldmlld2VkLWJ5OiBXZWl5aSBMdSA8d2VpeWkubHVAbWVkaWF0ZWsuY29tPg0KDQo+
IC0tLQ0KPiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW11eC5jIHwgMzIgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0NCj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdXguaCB8
ICAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXV4LmMgYi9k
cml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXV4LmMNCj4gaW5kZXggOTM3MGJlYmNhN2Y4Li5iMGM2
MTcwOWJhY2MgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdXguYw0K
PiArKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXV4LmMNCj4gQEAgLTIwLDkgKzIwLDMz
IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IG10a19jbGtfbXV4ICp0b19tdGtfY2xrX211eChzdHJ1
Y3QgY2xrX2h3ICpodykNCj4gIHN0YXRpYyBpbnQgbXRrX2Nsa19tdXhfZW5hYmxlX3NldGNscihz
dHJ1Y3QgY2xrX2h3ICpodykNCj4gIHsNCj4gIAlzdHJ1Y3QgbXRrX2Nsa19tdXggKm11eCA9IHRv
X210a19jbGtfbXV4KGh3KTsNCj4gKwl1bnNpZ25lZCBsb25nIGZsYWdzID0gMDsNCj4gIA0KPiAt
CXJldHVybiByZWdtYXBfd3JpdGUobXV4LT5yZWdtYXAsIG11eC0+ZGF0YS0+Y2xyX29mcywNCj4g
LQkJCUJJVChtdXgtPmRhdGEtPmdhdGVfc2hpZnQpKTsNCj4gKwlpZiAobXV4LT5sb2NrKQ0KPiAr
CQlzcGluX2xvY2tfaXJxc2F2ZShtdXgtPmxvY2ssIGZsYWdzKTsNCj4gKwllbHNlDQo+ICsJCV9f
YWNxdWlyZShtdXgtPmxvY2spOw0KPiArDQo+ICsJcmVnbWFwX3dyaXRlKG11eC0+cmVnbWFwLCBt
dXgtPmRhdGEtPmNscl9vZnMsDQo+ICsJCSAgICAgQklUKG11eC0+ZGF0YS0+Z2F0ZV9zaGlmdCkp
Ow0KPiArDQo+ICsJLyoNCj4gKwkgKiBJZiB0aGUgcGFyZW50IGhhcyBiZWVuIGNoYW5nZWQgd2hl
biB0aGUgY2xvY2sgd2FzIGRpc2FibGVkLCBpdCB3aWxsDQo+ICsJICogbm90IGJlIGVmZmVjdGl2
ZSB5ZXQuIFNldCB0aGUgdXBkYXRlIGJpdCB0byBlbnN1cmUgdGhlIG11eCBnZXRzDQo+ICsJICog
dXBkYXRlZC4NCj4gKwkgKi8NCj4gKwlpZiAobXV4LT5yZXBhcmVudCAmJiBtdXgtPmRhdGEtPnVw
ZF9zaGlmdCA+PSAwKSB7DQo+ICsJCXJlZ21hcF93cml0ZShtdXgtPnJlZ21hcCwgbXV4LT5kYXRh
LT51cGRfb2ZzLA0KPiArCQkJICAgICBCSVQobXV4LT5kYXRhLT51cGRfc2hpZnQpKTsNCj4gKwkJ
bXV4LT5yZXBhcmVudCA9IGZhbHNlOw0KPiArCX0NCj4gKw0KPiArCWlmIChtdXgtPmxvY2spDQo+
ICsJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUobXV4LT5sb2NrLCBmbGFncyk7DQo+ICsJZWxzZQ0K
PiArCQlfX3JlbGVhc2UobXV4LT5sb2NrKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiAgfQ0KPiAg
DQo+ICBzdGF0aWMgdm9pZCBtdGtfY2xrX211eF9kaXNhYmxlX3NldGNscihzdHJ1Y3QgY2xrX2h3
ICpodykNCj4gQEAgLTc3LDkgKzEwMSwxMSBAQCBzdGF0aWMgaW50IG10a19jbGtfbXV4X3NldF9w
YXJlbnRfc2V0Y2xyX2xvY2soc3RydWN0IGNsa19odyAqaHcsIHU4IGluZGV4KQ0KPiAgCQlyZWdt
YXBfd3JpdGUobXV4LT5yZWdtYXAsIG11eC0+ZGF0YS0+c2V0X29mcywNCj4gIAkJCQlpbmRleCA8
PCBtdXgtPmRhdGEtPm11eF9zaGlmdCk7DQo+ICANCj4gLQkJaWYgKG11eC0+ZGF0YS0+dXBkX3No
aWZ0ID49IDApDQo+ICsJCWlmIChtdXgtPmRhdGEtPnVwZF9zaGlmdCA+PSAwKSB7DQo+ICAJCQly
ZWdtYXBfd3JpdGUobXV4LT5yZWdtYXAsIG11eC0+ZGF0YS0+dXBkX29mcywNCj4gIAkJCQkJQklU
KG11eC0+ZGF0YS0+dXBkX3NoaWZ0KSk7DQo+ICsJCQltdXgtPnJlcGFyZW50ID0gdHJ1ZTsNCj4g
KwkJfQ0KPiAgCX0NCj4gIA0KPiAgCWlmIChtdXgtPmxvY2spDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2Nsay9tZWRpYXRlay9jbGstbXV4LmggYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXV4
LmgNCj4gaW5kZXggMTVjNjIzNjZiYTlhLi5mMTk0NjE2MWFkZTEgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdXguaA0KPiArKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRl
ay9jbGstbXV4LmgNCj4gQEAgLTE0LDYgKzE0LDcgQEAgc3RydWN0IG10a19jbGtfbXV4IHsNCj4g
IAlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7DQo+ICAJY29uc3Qgc3RydWN0IG10a19tdXggKmRhdGE7
DQo+ICAJc3BpbmxvY2tfdCAqbG9jazsNCj4gKwlib29sIHJlcGFyZW50Ow0KPiAgfTsNCj4gIA0K
PiAgc3RydWN0IG10a19tdXggew0KDQo=

