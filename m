Return-Path: <SRS0=Ml2J=PQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2BBC43444
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 13:31:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAEBB20827
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 13:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gMmRvNkg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbfAHNbe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Jan 2019 08:31:34 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39444 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbfAHNbe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Jan 2019 08:31:34 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x08DVTUu075124;
        Tue, 8 Jan 2019 07:31:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1546954289;
        bh=u/6FEYlxM96pwJ1Qm+SkmI5JogO6aWRB2nRQmlpOFAE=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=gMmRvNkgGIPsXslnbXAMXJt9F3y3xSnCzwnd10zH41j3BFIXlDlm+eQ7VyZ5a092w
         VS4ZeyPskbL+du/fXBpt9iZW1na6aXyBHyLKLgfYqpspp+WNgQExqLGFhRaZRK+PXD
         m3HvJujol3vGQFJEw99d5YDZCwWVdlSKCX9eQyIk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x08DVT5i120695
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Jan 2019 07:31:29 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 8
 Jan 2019 07:31:27 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 8 Jan 2019 07:31:27 -0600
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x08DVMuf011668;
        Tue, 8 Jan 2019 07:31:25 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <robh+dt@kernel.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/3] dt-bindings: clock: ti,sci-clk: Add support for parsing clock info from DT
Date:   Tue, 8 Jan 2019 15:30:21 +0200
Message-ID: <1546954223-9738-2-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

By default, the available clock info is queried from firmware, which can
be quite a lengthy operation if there is a very large amount of clocks
available. Add option for parsing the used clocks from DT instead, and
only register these which can improve the boot time of the device quite
a lot.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 Documentation/devicetree/bindings/clock/ti,sci-clk.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt b/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
index 4e59dc6..c757ae1 100644
--- a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
+++ b/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
@@ -18,6 +18,13 @@ Required properties:
   and clocks IDs for 66AK2G SoC are documented at
   http://processors.wiki.ti.com/index.php/TISCI#66AK2G02_Data
 
+Optional properties:
+-------------------
+- ti,scan-clocks-from-dt: Scan clock tree info from DT. By default,
+  clocks are queried from firmware, which can be rather slow operation,
+  especially if there is a really large number of clocks available out
+  of which only a handful are ever used by kernel.
+
 Examples:
 --------
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
