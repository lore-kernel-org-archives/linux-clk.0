Return-Path: <SRS0=VQD0=EP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MIME_BASE64_TEXT,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33282C64EBC
	for <linux-clk@archiver.kernel.org>; Mon,  9 Nov 2020 02:15:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71C6F21D81
	for <linux-clk@archiver.kernel.org>; Mon,  9 Nov 2020 02:14:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="siQlBmwy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729193AbgKICNq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Nov 2020 21:13:46 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:38108 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729172AbgKICNp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Nov 2020 21:13:45 -0500
X-UUID: b5eddbc39a8f4a6aa41f79083de54725-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jcDQIRlA203yrK1ble4ivJq5TwvvWTRleMHo60x2WY0=;
        b=siQlBmwyUTVuYGDrEtoLwGkJKsu7CSxBoQuPl1mOpN4PcWIgC+DX1W1EpZcwH2mQSclDorx7Bsu42lUb0WN+7KuyeZSwT3lsrTk/COKVFr0Vt4iNH4WnvopYiT8Sy/05SDYJhypHUF7a8COjLrAblnWstuLI0SWbGNdpUFKrfAg=;
X-UUID: b5eddbc39a8f4a6aa41f79083de54725-20201109
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 538006959; Mon, 09 Nov 2020 10:13:38 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:13:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 10:13:37 +0800
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v2 07/13] clk: mediatek: Clean up the pll_en_bit from en_mask on MT7629
Date:   Mon, 9 Nov 2020 10:13:22 +0800
Message-ID: <1604888008-30555-8-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
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
L21lZGlhdGVrL2Nsay1tdDc2MjkuYyB8IDEyICsrKysrKy0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsay9tZWRpYXRlay9jbGstbXQ3NjI5LmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3
NjI5LmMNCmluZGV4IGEwZWUwNzkuLmI5N2UwZWIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2Nsay9t
ZWRpYXRlay9jbGstbXQ3NjI5LmMNCisrKyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc2
MjkuYw0KQEAgLTMzNSwxNyArMzM1LDE3IEBADQogfTsNCiANCiBzdGF0aWMgY29uc3Qgc3RydWN0
IG10a19wbGxfZGF0YSBwbGxzW10gPSB7DQotCVBMTChDTEtfQVBNSVhFRF9BUk1QTEwsICJhcm1w
bGwiLCAweDAyMDAsIDB4MDIwQywgMHgwMDAwMDAwMSwNCisJUExMKENMS19BUE1JWEVEX0FSTVBM
TCwgImFybXBsbCIsIDB4MDIwMCwgMHgwMjBDLCAwLA0KIAkgICAgMCwgMjEsIDB4MDIwNCwgMjQs
IDAsIDB4MDIwNCwgMCksDQotCVBMTChDTEtfQVBNSVhFRF9NQUlOUExMLCAibWFpbnBsbCIsIDB4
MDIxMCwgMHgwMjFDLCAweDAwMDAwMDAxLA0KKwlQTEwoQ0xLX0FQTUlYRURfTUFJTlBMTCwgIm1h
aW5wbGwiLCAweDAyMTAsIDB4MDIxQywgMCwNCiAJICAgIEhBVkVfUlNUX0JBUiwgMjEsIDB4MDIx
NCwgMjQsIDAsIDB4MDIxNCwgMCksDQotCVBMTChDTEtfQVBNSVhFRF9VTklWMlBMTCwgInVuaXYy
cGxsIiwgMHgwMjIwLCAweDAyMkMsIDB4MDAwMDAwMDEsDQorCVBMTChDTEtfQVBNSVhFRF9VTklW
MlBMTCwgInVuaXYycGxsIiwgMHgwMjIwLCAweDAyMkMsIDAsDQogCSAgICBIQVZFX1JTVF9CQVIs
IDcsIDB4MDIyNCwgMjQsIDAsIDB4MDIyNCwgMTQpLA0KLQlQTEwoQ0xLX0FQTUlYRURfRVRIMVBM
TCwgImV0aDFwbGwiLCAweDAzMDAsIDB4MDMxMCwgMHgwMDAwMDAwMSwNCisJUExMKENMS19BUE1J
WEVEX0VUSDFQTEwsICJldGgxcGxsIiwgMHgwMzAwLCAweDAzMTAsIDAsDQogCSAgICAwLCAyMSwg
MHgwMzAwLCAxLCAwLCAweDAzMDQsIDApLA0KLQlQTEwoQ0xLX0FQTUlYRURfRVRIMlBMTCwgImV0
aDJwbGwiLCAweDAzMTQsIDB4MDMyMCwgMHgwMDAwMDAwMSwNCisJUExMKENMS19BUE1JWEVEX0VU
SDJQTEwsICJldGgycGxsIiwgMHgwMzE0LCAweDAzMjAsIDAsDQogCSAgICAwLCAyMSwgMHgwMzE0
LCAxLCAwLCAweDAzMTgsIDApLA0KLQlQTEwoQ0xLX0FQTUlYRURfU0dNSVBMTCwgInNnbWlwbGwi
LCAweDAzNTgsIDB4MDM2OCwgMHgwMDAwMDAwMSwNCisJUExMKENMS19BUE1JWEVEX1NHTUlQTEws
ICJzZ21pcGxsIiwgMHgwMzU4LCAweDAzNjgsIDAsDQogCSAgICAwLCAyMSwgMHgwMzU4LCAxLCAw
LCAweDAzNUMsIDApLA0KIH07DQogDQotLSANCjEuOC4xLjEuZGlydHkNCg==

