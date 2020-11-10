Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67698C2D0A3
	for <linux-clk@archiver.kernel.org>; Tue, 10 Nov 2020 01:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04AA120789
	for <linux-clk@archiver.kernel.org>; Tue, 10 Nov 2020 01:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nO8dGzUI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731267AbgKJBis (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Nov 2020 20:38:48 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:58472 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731151AbgKJBir (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Nov 2020 20:38:47 -0500
X-UUID: ab346585b6d447eebda9f4e3fe62f05a-20201110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=YjSSNPs9DIKiggA5+V9fbL6MfaunwhMceWHthl8AyvQ=;
        b=nO8dGzUIDG+QXsinumgcurz/T7wPsQvr1oPc1A7nF2uGE/ORDVrKMr2cPaXTjHVcwXG+f0QJzH/z4yRyz3kSnOATU5ipjC41YTEp5qhOTcaDXEMhpNWle2fifa5iqlrB8JIuxFI+6nZB366Js0YYH18fbyORUb0kY9ga/Rg25VI=;
X-UUID: ab346585b6d447eebda9f4e3fe62f05a-20201110
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 362126511; Tue, 10 Nov 2020 09:38:42 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 09:38:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Nov 2020 09:38:40 +0800
Message-ID: <1604972321.16474.9.camel@mtksdaap41>
Subject: Re: [PATCH] clk: mediatek: fix mtk_clk_register_mux() as static
 function
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <stable@vger.kernel.org>,
        Owen Chen <owen.chen@mediatek.com>
Date:   Tue, 10 Nov 2020 09:38:41 +0800
In-Reply-To: <20201109102035.GA1238638@kroah.com>
References: <1604914627-9203-1-git-send-email-weiyi.lu@mediatek.com>
         <20201109102035.GA1238638@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gTW9uLCAyMDIwLTExLTA5IGF0IDExOjIwICswMTAwLCBHcmVnIEtIIHdyb3RlOg0KPiBPbiBN
b24sIE5vdiAwOSwgMjAyMCBhdCAwNTozNzowN1BNICswODAwLCBXZWl5aSBMdSB3cm90ZToNCj4g
PiBtdGtfY2xrX3JlZ2lzdGVyX211eCgpIHNob3VsZCBiZSBhIHN0YXRpYyBmdW5jdGlvbg0KPiA+
IA0KPiA+IEZpeGVzOiBhM2FlNTQ5OTE3ZjE2ICgiY2xrOiBtZWRpYXRlazogQWRkIG5ldyBjbGtt
dXggcmVnaXN0ZXIgQVBJIikNCj4gPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+DQo+IA0K
PiBXaHkgaXMgdGhpcyBmb3Igc3RhYmxlIHRyZWVzPw0KDQpIaSBHcmVnLA0KDQpNeSBNaXN0YWtl
LiBJbmRlZWQsIHRoaXMgaXMgbm90IGEgYnVnIGZpeCBmb3Igc3RhYmxlIHRyZWUuDQpBbmQgdGhl
cmUgYXJlIHNpbXBsZSBxdWVzdGlvbnMuDQpXaWxsIEkgYmUgYWxsb3dlZCB0byBrZWVwIHRoZSBm
aXhlcyB0YWcgaW4gdGhpcyBwYXRjaCB0byBpbmRpY2F0ZSB0aGUNCm1pc3Rha2VzIHdlIG1hZGUg
aW4gcHJldmlvdXMgY29tbWl0IGlmIGl0J3Mgbm90IGEgYnVnIGZpeCBmb3Igc3RhYmxlDQp0cmVl
Pw0KQW5kIGFsbCBJIG5lZWQgdG8gZG8gbm93IGlzIHRvIHJlbW92ZSBzdGFibGUgdHJlZSBmcm9t
IGNjIGxpc3QuIElzIGl0DQpjb3JyZWN0Pw0KDQpNYW55IHRoYW5rcy4NCg0KPiANCg0K

