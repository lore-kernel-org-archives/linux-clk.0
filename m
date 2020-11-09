Return-Path: <SRS0=VQD0=EP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MIME_BASE64_TEXT,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87294C63798
	for <linux-clk@archiver.kernel.org>; Mon,  9 Nov 2020 02:13:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41BD6206E3
	for <linux-clk@archiver.kernel.org>; Mon,  9 Nov 2020 02:13:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OvFgy8w8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729287AbgKICNz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Nov 2020 21:13:55 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:34094 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729271AbgKICNz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Nov 2020 21:13:55 -0500
X-UUID: 64d91ea122db4e8fb2c0b930f4a1221c-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2fjDethbyJB+P+fUMcxjxVjamkgr83Ie5SZqyhoUYSo=;
        b=OvFgy8w8wyy+pgk5Zjou8Z85gmQ6uXyh38kBAfT5vVHoxC8m4QmWfPden/pc213qsoG3+zB/lm3tG1MVDsX4risAdFOwr010j/Lwrp2uQL2J5nl6OXRZpTQRaIm6zUi/ib7CyENxPwLIIQaoPRg0zd6CESg8CIMNaOyMVphh96Y=;
X-UUID: 64d91ea122db4e8fb2c0b930f4a1221c-20201109
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 261954877; Mon, 09 Nov 2020 10:13:46 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:13:46 +0800
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
Subject: [PATCH v2 13/13] clk: mediatek: use en_mask as a pure div_en_mask
Date:   Mon, 9 Nov 2020 10:13:28 +0800
Message-ID: <1604888008-30555-14-git-send-email-weiyi.lu@mediatek.com>
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

QmVjYXVzZSBhbGwgcGxsIGRhdGEgaGFzIGJlZW4gdXBkYXRlZC4gV2Ugbm8gbG9uZ2VyIGFsbG93
DQplbl9tYXNrIHRvIGJlIGEgY29tYmluYXRpb24gb2YgcGxsX2VuX2JpdCBhbmQgZGl2X2VuX21h
c2suDQoNClNpZ25lZC1vZmYtYnk6IFdlaXlpIEx1IDx3ZWl5aS5sdUBtZWRpYXRlay5jb20+DQot
LS0NCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstcGxsLmMgfCAxMiArKysrLS0tLS0tLS0NCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLXBsbC5jIGIvZHJpdmVycy9jbGsvbWVkaWF0
ZWsvY2xrLXBsbC5jDQppbmRleCAxMWVkNWQxLi5lMGIwMGJjIDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvY2xrLXBsbC5jDQorKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGst
cGxsLmMNCkBAIC0yMzgsNyArMjM4LDYgQEAgc3RhdGljIGludCBtdGtfcGxsX3ByZXBhcmUoc3Ry
dWN0IGNsa19odyAqaHcpDQogew0KIAlzdHJ1Y3QgbXRrX2Nsa19wbGwgKnBsbCA9IHRvX210a19j
bGtfcGxsKGh3KTsNCiAJdTMyIHI7DQotCXUzMiBkaXZfZW5fbWFzazsNCiANCiAJciA9IHJlYWRs
KHBsbC0+cHdyX2FkZHIpIHwgQ09OMF9QV1JfT047DQogCXdyaXRlbChyLCBwbGwtPnB3cl9hZGRy
KTsNCkBAIC0yNTEsOSArMjUwLDggQEAgc3RhdGljIGludCBtdGtfcGxsX3ByZXBhcmUoc3RydWN0
IGNsa19odyAqaHcpDQogCXIgPSByZWFkbChwbGwtPmJhc2VfYWRkciArIFJFR19DT04wKSB8IENP
TjBfQkFTRV9FTjsNCiAJd3JpdGVsKHIsIHBsbC0+YmFzZV9hZGRyICsgUkVHX0NPTjApOw0KIA0K
LQlkaXZfZW5fbWFzayA9IHBsbC0+ZGF0YS0+ZW5fbWFzayAmIH5DT04wX0JBU0VfRU47DQotCWlm
IChkaXZfZW5fbWFzaykgew0KLQkJciA9IHJlYWRsKHBsbC0+YmFzZV9hZGRyICsgUkVHX0NPTjAp
IHwgZGl2X2VuX21hc2s7DQorCWlmIChwbGwtPmRhdGEtPmVuX21hc2spIHsNCisJCXIgPSByZWFk
bChwbGwtPmJhc2VfYWRkciArIFJFR19DT04wKSB8IHBsbC0+ZGF0YS0+ZW5fbWFzazsNCiAJCXdy
aXRlbChyLCBwbGwtPmJhc2VfYWRkciArIFJFR19DT04wKTsNCiAJfQ0KIA0KQEAgLTI3NCw3ICsy
NzIsNiBAQCBzdGF0aWMgdm9pZCBtdGtfcGxsX3VucHJlcGFyZShzdHJ1Y3QgY2xrX2h3ICpodykN
CiB7DQogCXN0cnVjdCBtdGtfY2xrX3BsbCAqcGxsID0gdG9fbXRrX2Nsa19wbGwoaHcpOw0KIAl1
MzIgcjsNCi0JdTMyIGRpdl9lbl9tYXNrOw0KIA0KIAlpZiAocGxsLT5kYXRhLT5mbGFncyAmIEhB
VkVfUlNUX0JBUikgew0KIAkJciA9IHJlYWRsKHBsbC0+YmFzZV9hZGRyICsgUkVHX0NPTjApOw0K
QEAgLTI4NCw5ICsyODEsOCBAQCBzdGF0aWMgdm9pZCBtdGtfcGxsX3VucHJlcGFyZShzdHJ1Y3Qg
Y2xrX2h3ICpodykNCiANCiAJX19tdGtfcGxsX3R1bmVyX2Rpc2FibGUocGxsKTsNCiANCi0JZGl2
X2VuX21hc2sgPSBwbGwtPmRhdGEtPmVuX21hc2sgJiB+Q09OMF9CQVNFX0VOOw0KLQlpZiAoZGl2
X2VuX21hc2spIHsNCi0JCXIgPSByZWFkbChwbGwtPmJhc2VfYWRkciArIFJFR19DT04wKSAmIH5k
aXZfZW5fbWFzazsNCisJaWYgKHBsbC0+ZGF0YS0+ZW5fbWFzaykgew0KKwkJciA9IHJlYWRsKHBs
bC0+YmFzZV9hZGRyICsgUkVHX0NPTjApICYgfnBsbC0+ZGF0YS0+ZW5fbWFzazsNCiAJCXdyaXRl
bChyLCBwbGwtPmJhc2VfYWRkciArIFJFR19DT04wKTsNCiAJfQ0KIA0KLS0gDQoxLjguMS4xLmRp
cnR5DQo=

