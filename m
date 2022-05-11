Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA09C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 05:35:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241433AbiEKFfM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 01:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237924AbiEKFfM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 01:35:12 -0400
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8EC9244F05;
        Tue, 10 May 2022 22:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
         s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:
        From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=mNgW2vafzT3PmGQNSFNtHjivvzfraVcWWb2Uopdw+sk=; b=AFGn1xidR1qpdPi7CsHQO10TKm
        03YlIII6Lamn46ZnATOVceUzNphbeMO/dOl/bpbZCNa5gjmyxDutw8EZ4D6APheAhTN68pxG7VaqN
        gSWikmbkVG9Jgl2vY6X57oBZDCiOQy2wjToYC03Wv6zjTGG7U3rhnpp501PSRVKHqovI=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:62614 helo=localhost.localdomain)
        by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <matthias.fend@emfend.at>)
        id 1nof02-00Ch9T-FR; Wed, 11 May 2022 07:35:02 +0200
From:   Matthias Fend <matthias.fend@emfend.at>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        matthias.fend@emfend.at
Subject: [PATCH v2 1/2] dt-bindings: clock: vc5: Add 5P49V6975
Date:   Wed, 11 May 2022 07:34:54 +0200
Message-Id: <20220511053455.360335-1-matthias.fend@emfend.at>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The 5P49V6975 is a member of the VersaClock 6E family and supports four
fractional dividers (FODs), five clock outputs and an internal oscillator.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 Documentation/devicetree/bindings/clock/idt,versaclock5.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index be66f1e8b547..2476ce265f84 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -56,6 +56,7 @@ properties:
       - idt,5p49v5935
       - idt,5p49v6901
       - idt,5p49v6965
+      - idt,5p49v6975
 
   reg:
     description: I2C device address
@@ -134,6 +135,7 @@ allOf:
           enum:
             - idt,5p49v5933
             - idt,5p49v5935
+            - idt,5p49v6975
     then:
       # Devices with builtin crystal + optional external input
       properties:
-- 
2.25.1

