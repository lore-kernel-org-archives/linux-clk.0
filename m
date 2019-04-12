Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD65FC10F0E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 18:22:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADCB720869
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 18:22:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uHbFRcaM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbfDLSWp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 14:22:45 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54732 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfDLSWp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Apr 2019 14:22:45 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3CIMbuv129373;
        Fri, 12 Apr 2019 13:22:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1555093357;
        bh=OISq6Lt0y5Q5Vs1krIqxQOOaAGSuGeZOWtqS+3c2QVE=;
        h=From:To:Subject:Date;
        b=uHbFRcaMPvK2NNnywlDuQKhSYkk4hLbGALpNYGEAiKab+A75n+dNUvcuxcnRftDRW
         OTAI5g76dryOjKP7P5vwgKgp2grlCXMvdhVKDToSBrHLuoca04GHf02wU5ogfsJi92
         3CuBC6ICR+3F9sJukZbE0K78uJdj48jiZsoI5kr0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3CIMati011067
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Apr 2019 13:22:37 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 12
 Apr 2019 13:22:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 12 Apr 2019 13:22:36 -0500
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3CIMYYi060123;
        Fri, 12 Apr 2019 13:22:35 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
Subject: [PATCH 0/3] clk: keystone: sci-clk: perf improvements
Date:   Fri, 12 Apr 2019 21:22:19 +0300
Message-ID: <1555093342-428-1-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

After some thinking, I decided to switch the clock scan method for
the sci-clk completely over to DT based scan. For example, on am65xx,
the boot time improvement for the clock probe is from 398ms down to
7.3ms. I retained the full firmware scan code behind a separate
Kconfig option; this can be useful for some debugging purposes if
someone needs to see all the clocks in a device.

Also, added patch #1 for cropping down the registered clock names,
currently they are pretty long forms containing the full interconnect
node paths, which makes the debugfs sort of un-usable.

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
