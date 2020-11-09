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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2452CC56202
	for <linux-clk@archiver.kernel.org>; Mon,  9 Nov 2020 02:04:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4BF2206E3
	for <linux-clk@archiver.kernel.org>; Mon,  9 Nov 2020 02:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Pz4sT/QL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729071AbgKICED (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Nov 2020 21:04:03 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:57288 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727979AbgKICEC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Nov 2020 21:04:02 -0500
X-UUID: 83017f0190db435980eccaa2246ebfc9-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9wNboL5OaqOvm8O1kSiQyNh0JW94zk4ilPH/jQIwCok=;
        b=Pz4sT/QLiSJ94Tf/3+FggU599a5tR7o0oI41xx/VsUuh8wDDJJwUYZbZoOmymwIJl5b57Nxeb99fAgcZ/4luSIB8IXF1RrQmA4S0pQ8/i2neOfbGqQJfTdiKKwUBNci052SyjHturBCjxap8XutshXxS3kifaduXZb4KekgRaAM=;
X-UUID: 83017f0190db435980eccaa2246ebfc9-20201109
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 716802795; Mon, 09 Nov 2020 10:03:56 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:03:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 10:03:55 +0800
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v5 24/24] arm64: dts: mediatek: Correct UART0 bus clock of MT8192
Date:   Mon, 9 Nov 2020 10:03:49 +0800
Message-ID: <1604887429-29445-25-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

aW5mcmFfdWFydDAgY2xvY2sgaXMgdGhlIHJlYWwgb25lIHdoYXQgdWFydDAgdXNlcyBhcyBidXMg
Y2xvY2suDQoNClNpZ25lZC1vZmYtYnk6IFdlaXlpIEx1IDx3ZWl5aS5sdUBtZWRpYXRlay5jb20+
DQotLS0NCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpIHwgMiArLQ0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaSBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kNCmluZGV4IDkyZGNmYmQuLmFjNWRjYTYg
MTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpDQor
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpDQpAQCAtMjgzLDcg
KzI4Myw3IEBADQogCQkJCSAgICAgIm1lZGlhdGVrLG10NjU3Ny11YXJ0IjsNCiAJCQlyZWcgPSA8
MCAweDExMDAyMDAwIDAgMHgxMDAwPjsNCiAJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTA5IElS
UV9UWVBFX0xFVkVMX0hJR0ggMD47DQotCQkJY2xvY2tzID0gPCZjbGsyNm0+LCA8JmNsazI2bT47
DQorCQkJY2xvY2tzID0gPCZjbGsyNm0+LCA8JmluZnJhY2ZnIENMS19JTkZSQV9VQVJUMD47DQog
CQkJY2xvY2stbmFtZXMgPSAiYmF1ZCIsICJidXMiOw0KIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
DQogCQl9Ow0KLS0gDQoxLjguMS4xLmRpcnR5DQo=

