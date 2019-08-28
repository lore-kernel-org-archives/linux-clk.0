Return-Path: <SRS0=KEZg=WY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D07C3A5A6
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 06:59:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6963422CF4
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 06:59:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HmuxGt7g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfH1G7l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Aug 2019 02:59:41 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56066 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbfH1G7l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Aug 2019 02:59:41 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S6xb0t110382;
        Wed, 28 Aug 2019 01:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566975577;
        bh=OxRwKmSxm8MnNs4TJxgejIlpEIEtHkmm3i7c5FBHOZg=;
        h=From:To:CC:Subject:Date;
        b=HmuxGt7gfIyAsJkMItUS/2XH0+zP0pvN8W/0OCaj3BF8YPAUQFIr0eJKY307xar7I
         nn8skUGJy1llH0lArVCpD4XJ7UDivstNX4sdzS3dTSXRHABQyOXc+0GhPKZa5V+tpO
         hJk8WtQDegDA6RqKvqDD4ghufj/qUU/8YpplolGc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S6xbHi057431
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 01:59:37 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 01:59:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 01:59:35 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S6xXVA074399;
        Wed, 28 Aug 2019 01:59:34 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv2 0/6] clk: ti: reset handling support fixes
Date:   Wed, 28 Aug 2019 09:59:23 +0300
Message-ID: <20190828065929.32150-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

This is v2 of the earlier series [1] targeting remoteproc / reset support for
OMAP SoCs. None of the earlier patches have been retained, mostly everything
is re-written. :)

Couple of notes about the individual patches:

#1: needed so that reset handling code can find clkctrl handles
#2: just to convert the code to look a bit neater with all the bit
    handling logic
#3: new TI SoC only API for checking standby state for clocks, needed
    for remoteproc idle status handling
#4: new TI SoC only API for syncing up status between reset + associated
    clock
#5/#6: add missing IVA clkctrl clock entries for omap5, this has been
    just missed before and is needed as IVA has reset lines

I know its already quite late for 5.4, but in theory these
could be picked up for it also. If not, pushing for 5.5 is fine.

-Tero

[1] https://www.spinics.net/lists/linux-clk/msg40060.html


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
