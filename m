Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447D2C433DB
	for <linux-clk@archiver.kernel.org>; Tue, 22 Dec 2020 10:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AC1523105
	for <linux-clk@archiver.kernel.org>; Tue, 22 Dec 2020 10:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgLVKvj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Dec 2020 05:51:39 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:56163 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725847AbgLVKvj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Dec 2020 05:51:39 -0500
X-UUID: 7ab6e4c7ef4846bb8e1e4d628c890e65-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=rZA2GXxZH7t4kaVt16HKlqffGV0gmjkPmS1PjrXZIqM=;
        b=AkczCm031GdoJJ8+1BnqVdmS8Q0GkeOINdY362ugedv/Hr8D/GGi9oZyFKs/nX6F7SFnEIAy3Y2MD1Qbhj4Alsi6pR4miKccKlJBJ8YrS4cxAQ5bMAm0wbQ/t58YGPbEt/o7majwNP05QJw6QHrlax4Mm0/ofb6YPPlbEE7pOfw=;
X-UUID: 7ab6e4c7ef4846bb8e1e4d628c890e65-20201222
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1887090278; Tue, 22 Dec 2020 18:50:54 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 18:50:49 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Dec 2020 18:50:49 +0800
Message-ID: <1608634252.32765.3.camel@mtksdaap41>
Subject: Re: [PATCH v2] clk: mediatek: Remove MT8192 unused clock
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Tinghan Shen <tinghan.shen@mediatek.com>, <drinkcat@chromium.org>,
        <matthias.bgg@gmail.com>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <ryan-jh.yu@mediatek.com>,
        <nathan.chung@mediatek.com>, <erin.lo@mediatek.com>
Date:   Tue, 22 Dec 2020 18:50:52 +0800
In-Reply-To: <160819533548.1580929.12545650149091991895@swboyd.mtv.corp.google.com>
References: <20201209083921.879-1-tinghan.shen@mediatek.com>
         <160819533548.1580929.12545650149091991895@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gVGh1LCAyMDIwLTEyLTE3IGF0IDAwOjU1IC0wODAwLCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+
IFF1b3RpbmcgVGluZ2hhbiBTaGVuICgyMDIwLTEyLTA5IDAwOjM5OjIxKQ0KPiA+IEZyb206ICJU
aW5naGFuIFNoZW4iIDx0aW5naGFuLnNoZW5AbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+IFJlbW92
ZSBNVDgxOTIgc3NwbSBjbG9jaw0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFRpbmdoYW4gU2hl
biA8dGluZ2hhbi5zaGVuQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiB2MjogcmVzZW5kIHBh
dGNoIHRvIGxpbnV4LW1lZGlhdGVrIGJlY2F1c2UgYmxvY2tlZCBieSB3cm9uZyBtYWlsIHNldHRp
bmcuICANCj4gPiANCj4gPiBUaGlzIHBhdGNoIGRlcGVuZHMgb24gc2VyaWVzICJNZWRpYXRlayBN
VDgxOTIgY2xvY2sgc3VwcG9ydCJbMV0uDQo+ID4gDQo+ID4gWzFdIGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9saXN0Lz9zZXJpZXM9Mzc5OTU1IA0K
PiANCj4gQ2FuIHRoaXMgYmUgcm9sbGVkIGludG8gdGhhdCBzZXJpZXM/DQoNCkhpIFRpbmdoYW4s
DQpUaGFuayB5b3UuIEknbGwgcm9sbCB0aGlzIHBhdGNoIGluIG15IG5leHQgdmVyc2lvbiB2NiBv
ZiA4MTkyIGNsb2Nrcw0Kc2VyaWVzLg0KDQo=

