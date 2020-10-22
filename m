Return-Path: <SRS0=4E15=D5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MIME_BASE64_TEXT,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4403C388F2
	for <linux-clk@archiver.kernel.org>; Thu, 22 Oct 2020 12:56:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A98D2463F
	for <linux-clk@archiver.kernel.org>; Thu, 22 Oct 2020 12:56:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tcR3WEiq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2899098AbgJVM4i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Oct 2020 08:56:38 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:51600 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2899044AbgJVM4Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Oct 2020 08:56:16 -0400
X-UUID: 2df86793a9c240f6ae35d6714b869270-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EwpeqP52K3ZSx+ruSt6bPmBj7eBSE0Npgc0sGXbT4jw=;
        b=tcR3WEiqe8YE28sBl/zwtLVyiEbLZg+1zYsViNwC4QA0d2ahptdwJfdgnKUtEh4M9PFlmharjxRe3ieMTHyyrq0C1wNEtnjCxFMAzzYKjkuvvynJ/1mVDRnXj2J8Ax5SZYSPFGF1ZvTSHWYqCTTgU9v0XrDUdrl5cInIXRR4BKM=;
X-UUID: 2df86793a9c240f6ae35d6714b869270-20201022
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1107629185; Thu, 22 Oct 2020 20:56:10 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:56:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Oct 2020 20:56:08 +0800
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH 10/12] clk: mediatek: Clean up the pll_en_bit from en_mask on MT8183
Date:   Thu, 22 Oct 2020 20:56:03 +0800
Message-ID: <1603371365-30863-11-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603371365-30863-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603371365-30863-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

cmVtb3ZlIHBsbF9lbl9iaXQoYml0MCkgZnJvbSBlbl9tYXNrIHRvIG1ha2UgZW5fbWFzayBhIHB1
cmUgZW5fbWFzaw0KdGhhdCBvbmx5IHVzZWQgZm9yIHBsbCBkaXZpZGVycy4NCg0KU2lnbmVkLW9m
Zi1ieTogV2VpeWkgTHUgPHdlaXlpLmx1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMvY2xr
L21lZGlhdGVrL2Nsay1tdDgxODMuYyB8IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0NCiAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTgzLmMgYi9kcml2ZXJzL2Nsay9tZWRp
YXRlay9jbGstbXQ4MTgzLmMNCmluZGV4IDUwNDY4NTIuLjYwODEwOGMgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTgzLmMNCisrKyBiL2RyaXZlcnMvY2xrL21lZGlh
dGVrL2Nsay1tdDgxODMuYw0KQEAgLTExMjEsMzQgKzExMjEsMzQgQEANCiB9Ow0KIA0KIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgbXRrX3BsbF9kYXRhIHBsbHNbXSA9IHsNCi0JUExMX0IoQ0xLX0FQTUlY
RURfQVJNUExMX0xMLCAiYXJtcGxsX2xsIiwgMHgwMjAwLCAweDAyMEMsIDB4MDAwMDAwMDEsDQor
CVBMTF9CKENMS19BUE1JWEVEX0FSTVBMTF9MTCwgImFybXBsbF9sbCIsIDB4MDIwMCwgMHgwMjBD
LCAwLA0KIAkJSEFWRV9SU1RfQkFSIHwgUExMX0FPLCBCSVQoMjQpLCAyMiwgOCwgMHgwMjA0LCAy
NCwgMHgwLCAweDAsIDAsDQogCQkweDAyMDQsIDAsIDAsIGFybXBsbF9kaXZfdGFibGUpLA0KLQlQ
TExfQihDTEtfQVBNSVhFRF9BUk1QTExfTCwgImFybXBsbF9sIiwgMHgwMjEwLCAweDAyMUMsIDB4
MDAwMDAwMDEsDQorCVBMTF9CKENMS19BUE1JWEVEX0FSTVBMTF9MLCAiYXJtcGxsX2wiLCAweDAy
MTAsIDB4MDIxQywgMCwNCiAJCUhBVkVfUlNUX0JBUiB8IFBMTF9BTywgQklUKDI0KSwgMjIsIDgs
IDB4MDIxNCwgMjQsIDB4MCwgMHgwLCAwLA0KIAkJMHgwMjE0LCAwLCAwLCBhcm1wbGxfZGl2X3Rh
YmxlKSwNCi0JUExMKENMS19BUE1JWEVEX0NDSVBMTCwgImNjaXBsbCIsIDB4MDI5MCwgMHgwMjlD
LCAweDAwMDAwMDAxLA0KKwlQTEwoQ0xLX0FQTUlYRURfQ0NJUExMLCAiY2NpcGxsIiwgMHgwMjkw
LCAweDAyOUMsIDAsDQogCQlIQVZFX1JTVF9CQVIgfCBQTExfQU8sIEJJVCgyNCksIDIyLCA4LCAw
eDAyOTQsIDI0LCAweDAsIDB4MCwgMCwNCiAJCTB4MDI5NCwgMCwgMCksDQotCVBMTChDTEtfQVBN
SVhFRF9NQUlOUExMLCAibWFpbnBsbCIsIDB4MDIyMCwgMHgwMjJDLCAweDAwMDAwMDAxLA0KKwlQ
TEwoQ0xLX0FQTUlYRURfTUFJTlBMTCwgIm1haW5wbGwiLCAweDAyMjAsIDB4MDIyQywgMCwNCiAJ
CUhBVkVfUlNUX0JBUiwgQklUKDI0KSwgMjIsIDgsIDB4MDIyNCwgMjQsIDB4MCwgMHgwLCAwLA0K
IAkJMHgwMjI0LCAwLCAwKSwNCi0JUExMKENMS19BUE1JWEVEX1VOSVYyUExMLCAidW5pdjJwbGwi
LCAweDAyMzAsIDB4MDIzQywgMHgwMDAwMDAwMSwNCisJUExMKENMS19BUE1JWEVEX1VOSVYyUExM
LCAidW5pdjJwbGwiLCAweDAyMzAsIDB4MDIzQywgMCwNCiAJCUhBVkVfUlNUX0JBUiwgQklUKDI0
KSwgMjIsIDgsIDB4MDIzNCwgMjQsIDB4MCwgMHgwLCAwLA0KIAkJMHgwMjM0LCAwLCAwKSwNCi0J
UExMX0IoQ0xLX0FQTUlYRURfTUZHUExMLCAibWZncGxsIiwgMHgwMjQwLCAweDAyNEMsIDB4MDAw
MDAwMDEsDQorCVBMTF9CKENMS19BUE1JWEVEX01GR1BMTCwgIm1mZ3BsbCIsIDB4MDI0MCwgMHgw
MjRDLCAwLA0KIAkJMCwgMCwgMjIsIDgsIDB4MDI0NCwgMjQsIDB4MCwgMHgwLCAwLCAweDAyNDQs
IDAsIDAsDQogCQltZmdwbGxfZGl2X3RhYmxlKSwNCi0JUExMKENMS19BUE1JWEVEX01TRENQTEws
ICJtc2RjcGxsIiwgMHgwMjUwLCAweDAyNUMsIDB4MDAwMDAwMDEsDQorCVBMTChDTEtfQVBNSVhF
RF9NU0RDUExMLCAibXNkY3BsbCIsIDB4MDI1MCwgMHgwMjVDLCAwLA0KIAkJMCwgMCwgMjIsIDgs
IDB4MDI1NCwgMjQsIDB4MCwgMHgwLCAwLCAweDAyNTQsIDAsIDApLA0KLQlQTEwoQ0xLX0FQTUlY
RURfVFZEUExMLCAidHZkcGxsIiwgMHgwMjYwLCAweDAyNkMsIDB4MDAwMDAwMDEsDQorCVBMTChD
TEtfQVBNSVhFRF9UVkRQTEwsICJ0dmRwbGwiLCAweDAyNjAsIDB4MDI2QywgMCwNCiAJCTAsIDAs
IDIyLCA4LCAweDAyNjQsIDI0LCAweDAsIDB4MCwgMCwgMHgwMjY0LCAwLCAwKSwNCi0JUExMKENM
S19BUE1JWEVEX01NUExMLCAibW1wbGwiLCAweDAyNzAsIDB4MDI3QywgMHgwMDAwMDAwMSwNCisJ
UExMKENMS19BUE1JWEVEX01NUExMLCAibW1wbGwiLCAweDAyNzAsIDB4MDI3QywgMCwNCiAJCUhB
VkVfUlNUX0JBUiwgQklUKDIzKSwgMjIsIDgsIDB4MDI3NCwgMjQsIDB4MCwgMHgwLCAwLA0KIAkJ
MHgwMjc0LCAwLCAwKSwNCi0JUExMKENMS19BUE1JWEVEX0FQTEwxLCAiYXBsbDEiLCAweDAyQTAs
IDB4MDJCMCwgMHgwMDAwMDAwMSwNCisJUExMKENMS19BUE1JWEVEX0FQTEwxLCAiYXBsbDEiLCAw
eDAyQTAsIDB4MDJCMCwgMCwNCiAJCTAsIDAsIDMyLCA4LCAweDAyQTAsIDEsIDB4MDJBOCwgMHgw
MDE0LCAwLCAweDAyQTQsIDAsIDB4MDJBMCksDQotCVBMTChDTEtfQVBNSVhFRF9BUExMMiwgImFw
bGwyIiwgMHgwMmI0LCAweDAyYzQsIDB4MDAwMDAwMDEsDQorCVBMTChDTEtfQVBNSVhFRF9BUExM
MiwgImFwbGwyIiwgMHgwMmI0LCAweDAyYzQsIDAsDQogCQkwLCAwLCAzMiwgOCwgMHgwMkI0LCAx
LCAweDAyQkMsIDB4MDAxNCwgMSwgMHgwMkI4LCAwLCAweDAyQjQpLA0KIH07DQogDQotLSANCjEu
OC4xLjEuZGlydHkNCg==

