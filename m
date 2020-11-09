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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF15C83011
	for <linux-clk@archiver.kernel.org>; Mon,  9 Nov 2020 02:15:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC6C52071E
	for <linux-clk@archiver.kernel.org>; Mon,  9 Nov 2020 02:14:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="berhmkBz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729046AbgKICN7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Nov 2020 21:13:59 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:34079 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729267AbgKICNz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Nov 2020 21:13:55 -0500
X-UUID: 99b1305eb7154944b95ff5ce76da57b5-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ARo+aZnxsWHz4UuONZ9dF73YwZqt8F6SqOJGyOAxrEk=;
        b=berhmkBz4a29ZW5/El8UFJmva8NuOhmoeQP1XllJnisFZ0AKiBSHYJoWnjFEIDsyIVdqWCuDkSJv3R+eEcqT70IQL0MXzqz8THpGvc+M112Glap2ylxSRyHonnIY747PnTPWvlgmwA8zjazbIG0RrCCA5hLAlSjAxw+DfnZrS8o=;
X-UUID: 99b1305eb7154944b95ff5ce76da57b5-20201109
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1250100646; Mon, 09 Nov 2020 10:13:46 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:13:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 10:13:45 +0800
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v2 12/13] clk: mediatek: Clean up the pll_en_bit from en_mask on MT8516
Date:   Mon, 9 Nov 2020 10:13:27 +0800
Message-ID: <1604888008-30555-13-git-send-email-weiyi.lu@mediatek.com>
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
L21lZGlhdGVrL2Nsay1tdDg1MTYuYyB8IDEyICsrKysrKy0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsay9tZWRpYXRlay9jbGstbXQ4NTE2LmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4
NTE2LmMNCmluZGV4IDlkNDI2MWUuLmVjMjE1ZTUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2Nsay9t
ZWRpYXRlay9jbGstbXQ4NTE2LmMNCisrKyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDg1
MTYuYw0KQEAgLTc3MCwxNyArNzcwLDE3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBtdGtfaW5mcmFj
ZmdfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpDQogfTsNCiANCiBzdGF0aWMgY29uc3Qg
c3RydWN0IG10a19wbGxfZGF0YSBwbGxzW10gPSB7DQotCVBMTChDTEtfQVBNSVhFRF9BUk1QTEws
ICJhcm1wbGwiLCAweDAxMDAsIDB4MDExMCwgMHgwMDAwMDAwMSwgMCwNCisJUExMKENMS19BUE1J
WEVEX0FSTVBMTCwgImFybXBsbCIsIDB4MDEwMCwgMHgwMTEwLCAwLCAwLA0KIAkJMjEsIDB4MDEw
NCwgMjQsIDAsIDB4MDEwNCwgMCksDQotCVBMTChDTEtfQVBNSVhFRF9NQUlOUExMLCAibWFpbnBs
bCIsIDB4MDEyMCwgMHgwMTMwLCAweDAwMDAwMDAxLA0KKwlQTEwoQ0xLX0FQTUlYRURfTUFJTlBM
TCwgIm1haW5wbGwiLCAweDAxMjAsIDB4MDEzMCwgMCwNCiAJCUhBVkVfUlNUX0JBUiwgMjEsIDB4
MDEyNCwgMjQsIDAsIDB4MDEyNCwgMCksDQotCVBMTChDTEtfQVBNSVhFRF9VTklWUExMLCAidW5p
dnBsbCIsIDB4MDE0MCwgMHgwMTUwLCAweDMwMDAwMDAxLA0KKwlQTEwoQ0xLX0FQTUlYRURfVU5J
VlBMTCwgInVuaXZwbGwiLCAweDAxNDAsIDB4MDE1MCwgMHgzMDAwMDAwMCwNCiAJCUhBVkVfUlNU
X0JBUiwgNywgMHgwMTQ0LCAyNCwgMCwgMHgwMTQ0LCAwKSwNCi0JUExMX0IoQ0xLX0FQTUlYRURf
TU1QTEwsICJtbXBsbCIsIDB4MDE2MCwgMHgwMTcwLCAweDAwMDAwMDAxLCAwLA0KKwlQTExfQihD
TEtfQVBNSVhFRF9NTVBMTCwgIm1tcGxsIiwgMHgwMTYwLCAweDAxNzAsIDAsIDAsDQogCQkyMSwg
MHgwMTY0LCAyNCwgMCwgMHgwMTY0LCAwLCBtbXBsbF9kaXZfdGFibGUpLA0KLQlQTEwoQ0xLX0FQ
TUlYRURfQVBMTDEsICJhcGxsMSIsIDB4MDE4MCwgMHgwMTkwLCAweDAwMDAwMDAxLCAwLA0KKwlQ
TEwoQ0xLX0FQTUlYRURfQVBMTDEsICJhcGxsMSIsIDB4MDE4MCwgMHgwMTkwLCAwLCAwLA0KIAkJ
MzEsIDB4MDE4MCwgMSwgMHgwMTk0LCAweDAxODQsIDApLA0KLQlQTEwoQ0xLX0FQTUlYRURfQVBM
TDIsICJhcGxsMiIsIDB4MDFBMCwgMHgwMUIwLCAweDAwMDAwMDAxLCAwLA0KKwlQTEwoQ0xLX0FQ
TUlYRURfQVBMTDIsICJhcGxsMiIsIDB4MDFBMCwgMHgwMUIwLCAwLCAwLA0KIAkJMzEsIDB4MDFB
MCwgMSwgMHgwMUI0LCAweDAxQTQsIDApLA0KIH07DQogDQotLSANCjEuOC4xLjEuZGlydHkNCg==

