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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDB8C388F7
	for <linux-clk@archiver.kernel.org>; Thu, 22 Oct 2020 12:43:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EE1624196
	for <linux-clk@archiver.kernel.org>; Thu, 22 Oct 2020 12:43:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EptQDCeT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505992AbgJVMnL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Oct 2020 08:43:11 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:44187 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2505168AbgJVMnK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Oct 2020 08:43:10 -0400
X-UUID: a42a7ada98164c59b35a83be851ed7e3-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vAXufp8oPq4yL34QGUZja+5laQrxJs+P3x47cbv2unU=;
        b=EptQDCeT3huBdgfT3MK+vm8UR1J8i5jVED7FPSxDmhEeDQ1GdcQiy2iUsbyvLUFv/7Ivt/iTZE3laGpWIpW29jXwyS/Ph7uJOl6zu83jx+zV69R9sD9Oulwjm5SEMvC3DV9pdGVL04z6KlkAV37IRgavO983S9qQqTzTTb48JzI=;
X-UUID: a42a7ada98164c59b35a83be851ed7e3-20201022
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 76612940; Thu, 22 Oct 2020 20:37:53 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:37:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Oct 2020 20:37:51 +0800
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v4 06/34] dt-bindings: ARM: Mediatek: Add new document bindings of vdecsys soc controller
Date:   Thu, 22 Oct 2020 20:36:59 +0800
Message-ID: <1603370247-30437-7-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIHRoZSBuZXcgYmluZGluZyBkb2N1bWVudGF0aW9uIG9mIHZkZWNzeXMg
c29jIGNvbnRyb2xsZXINCmZvciBNZWRpYXRlayBNVDgxOTIuDQoNClNpZ25lZC1vZmYtYnk6IFdl
aXlpIEx1IDx3ZWl5aS5sdUBtZWRpYXRlay5jb20+DQotLS0NCiAuLi4vYXJtL21lZGlhdGVrL21l
ZGlhdGVrLHZkZWNzeXMtc29jLnlhbWwgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysr
KysNCiAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVr
LHZkZWNzeXMtc29jLnlhbWwNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssdmRlY3N5cy1zb2MueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssdmRlY3N5
cy1zb2MueWFtbA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAuLjA4MmYyMmUN
Ci0tLSAvZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vbWVkaWF0ZWsvbWVkaWF0ZWssdmRlY3N5cy1zb2MueWFtbA0KQEAgLTAsMCArMSwzOCBAQA0K
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkNCisl
WUFNTCAxLjINCistLS0NCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2FybS9t
ZWRpYXRlay9tZWRpYXRlayx2ZGVjc3lzLXNvYy55YW1sIw0KKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KKw0KK3RpdGxlOiBNZWRpYVRlayBW
REVDU1lTIFNPQyBDb250cm9sbGVyDQorDQorbWFpbnRhaW5lcnM6DQorICAtIFdlaXlpIEx1IDx3
ZWl5aS5sdUBtZWRpYXRlay5jb20+DQorDQorZGVzY3JpcHRpb246DQorICBUaGUgTWVkaWF0ZWsg
dmRlY3N5cyBzb2MgY29udHJvbGxlciBwcm92aWRlcyBmdW5jdGlvbmFsIGNvbmZpZ3VyYXRpb25z
IGFuZCBjbG9ja3MgdG8gdGhlIHN5c3RlbS4NCisNCitwcm9wZXJ0aWVzOg0KKyAgY29tcGF0aWJs
ZToNCisgICAgaXRlbXM6DQorICAgICAgLSBlbnVtOg0KKyAgICAgICAgICAtIG1lZGlhdGVrLG10
ODE5Mi12ZGVjc3lzX3NvYw0KKyAgICAgIC0gY29uc3Q6IHN5c2Nvbg0KKw0KKyAgcmVnOg0KKyAg
ICBtYXhJdGVtczogMQ0KKw0KKyAgJyNjbG9jay1jZWxscyc6DQorICAgIGNvbnN0OiAxDQorDQor
cmVxdWlyZWQ6DQorICAtIGNvbXBhdGlibGUNCisgIC0gcmVnDQorDQorZXhhbXBsZXM6DQorICAt
IHwNCisgICAgdmRlY3N5c19zb2M6IHN5c2NvbkAxNjAwZjAwMCB7DQorICAgICAgICBjb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE5Mi12ZGVjc3lzX3NvYyIsICJzeXNjb24iOw0KKyAgICAgICAg
cmVnID0gPDAgMHgxNjAwZjAwMCAwIDB4MTAwMD47DQorICAgICAgICAjY2xvY2stY2VsbHMgPSA8
MT47DQorICAgIH07DQotLSANCjEuOC4xLjEuZGlydHkNCg==

