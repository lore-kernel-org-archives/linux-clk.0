Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC26C46467
	for <linux-clk@archiver.kernel.org>; Sat, 14 Jan 2023 23:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjANX4l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Jan 2023 18:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbjANX4l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 14 Jan 2023 18:56:41 -0500
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9742D5269;
        Sat, 14 Jan 2023 15:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=4uMQEPmSSsjWWpucQFP5FFkGpoxKilfkptONSJ4evRs=; b=Ds8Pe+jPLK7sUhOfpqGtkI4ilx
        JIUU5L5IM/yl4YQDPtHvtk84aCaCMFXk9hffHa0VJCTgIKW5ZbrmOX6MmlEhwcSSI7ZkRhRvzUzMO
        NT8XxfvEl0jGVWMKeWtYCMIuPGnZAuCEpz6OLDEdn5RR5cKau7UA+0FJLTqIcBKGL7jdfUnLiQ8bm
        /DHQCJ0JOe9PXsy+mcWMytpLLAePQEtq61tVlcM/mzANmGb6PNNYgQHxz/fbJygsp6s7xsU3AOA2D
        tGkCcAuM+7jQHZJqsBICktYQg1EPdaBOMFGvsCX/llAZFr8dFXaEI60YoVwHHo29R9D/YTkWibyub
        j2WxS8Og==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pGq3b-0001az-EK; Sun, 15 Jan 2023 00:35:27 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pGq3a-0009Au-PR; Sun, 15 Jan 2023 00:35:27 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 3/3] dt-bindings: clock: versaclock5: Document 5P49V60 compatible string
Date:   Sat, 14 Jan 2023 15:35:00 -0800
Message-Id: <20230114233500.3294789-3-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230114233500.3294789-1-lars@metafoo.de>
References: <20230114233500.3294789-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26781/Sat Jan 14 09:29:51 2023)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The 5P49V60 clock generator is part of the same family of devices that is
described by the versaclock5 binding documentation.

Add the compatible string of the 5P49V60 to the binding documentation.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 Documentation/devicetree/bindings/clock/idt,versaclock5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index 61b246cf5e72..a2c6eea9871d 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -54,6 +54,7 @@ properties:
       - idt,5p49v5925
       - idt,5p49v5933
       - idt,5p49v5935
+      - idt,5p49v60
       - idt,5p49v6901
       - idt,5p49v6965
       - idt,5p49v6975
-- 
2.30.2

