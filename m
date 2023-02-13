Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE72C636D4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 12:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjBMMeZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 07:34:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjBMMeZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 07:34:25 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAEB14EB0;
        Mon, 13 Feb 2023 04:34:20 -0800 (PST)
Received: from rico.lan (unknown [159.196.93.152])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 276EB20034;
        Mon, 13 Feb 2023 20:34:15 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1676291657;
        bh=AbnhUf2jT5hj7p6JuOOwz4CzqTHAGtxv9hk5Xq/6WcY=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=P8VDGGOKUiSD67DyMS7WJOrKGYv7fbslE37MxTCXoA3mP9AbvXTkkzWpIG0yMzi3Z
         Ud2V4L7/dIl52TaAoNr8aK4BOCLf9LV3MMb3qnW+UfvOjOHKfl7xk73RtrHuy9pdrY
         peP0UHqjNmXZpiAVxodOtScW9D3c7bvx02AZJmQK6ogccIHvOcLkuENcy/LZ8slEJ+
         Lkwdu30c+XMRQ8C6pojEKfbdWFXKZsLv33/IbfQtJC66KWAwrTU2jhZib2f0GZNQML
         1d0rXke/b2Ghys8ftaIxr7hSCQIS1M1/vZ/RlM0e/xSrjBE8+V5pShompsXpqdX8ic
         ivfasQXyH6g0w==
Message-ID: <d58b6170427c9d1414118a0376e98d40f2579b20.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/3] clk: aspeed: Add full configs for i3c clocks
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date:   Mon, 13 Feb 2023 20:34:14 +0800
In-Reply-To: <45ce9e62-2620-b959-985d-ae00b071e350@linaro.org>
References: <cover.1676267865.git.jk@codeconstruct.com.au>
         <5ee4ade6820a9db8dc9c20bb39fd8a4c4cd7c2a6.1676267865.git.jk@codeconstruct.com.au>
         <45ce9e62-2620-b959-985d-ae00b071e350@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgS3J6eXN6dG9mLAoKPiBCaW5kaW5ncyBhcmUgYWx3YXlzIHNlcGFyYXRlIHBhdGNoZXMuCgpP
SywgSSdsbCBzcGxpdCB0aGVzZSB1cCBpbnRvIHRoZSBkdC1iaW5kaW5ncyBhbmQgdGhlIGNsayBj
aGFuZ2VzLgoKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FzdDI2
MDAtY2xvY2suaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYXN0MjYwMC1jbG9jay5oCj4g
PiBpbmRleCBkOGIwZGIyZjdhN2QuLjYwMDU0OWQ3YmVlOCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1
ZGUvZHQtYmluZGluZ3MvY2xvY2svYXN0MjYwMC1jbG9jay5oCj4gPiArKysgYi9pbmNsdWRlL2R0
LWJpbmRpbmdzL2Nsb2NrL2FzdDI2MDAtY2xvY2suaAo+ID4gQEAgLTU3LDggKzU3LDYgQEAKPiA+
IMKgI2RlZmluZSBBU1BFRURfQ0xLX0dBVEVfSTNDM0NMS8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgNDAKPiA+IMKgI2RlZmluZSBBU1BFRURfQ0xLX0dBVEVfSTNDNENMS8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgNDEKPiA+IMKgI2RlZmluZSBBU1BFRURfQ0xLX0dBVEVf
STNDNUNMS8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgNDIKPiA+IC0jZGVmaW5lIEFT
UEVFRF9DTEtfR0FURV9JM0M2Q0xLwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA0Mwo+
ID4gLSNkZWZpbmUgQVNQRUVEX0NMS19HQVRFX0kzQzdDTEvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoDQ0Cj4gCj4gVGhpcyBpcyBhbiBBQkkgYnJlYWsgYW5kIGNvbW1pdCBtc2cgZG9l
cyBub3QgcmVhbGx5IGp1c3RpZnkgaXQuCgpJJ2xsIGFkZCBtb3JlIHJhdGlvbmFsZSB0aGVyZS4K
CkNoZWVycywKCgpKZXJlbXkKCg==

