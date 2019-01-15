Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBD9C43387
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 09:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CCE720645
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 09:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dErekPOQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbfAOJP3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 04:15:29 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40526 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbfAOJP3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Jan 2019 04:15:29 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0F9FQc2050749;
        Tue, 15 Jan 2019 03:15:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1547543726;
        bh=lJQtf9rnl+BWmcNBXg4Vxyr8mk7GpzPsw6zZNF0sD/o=;
        h=From:To:CC:Subject:Date;
        b=dErekPOQJd6rJY7ehybsOvv/3kTc5cPOWiT1GLwBhexPriO+XH6JhMCp4abj2CnMh
         czUvzG36xMZAjcCKHdut4HT7fLAEQ3vqrOOsuzCo9HZKgOPHGbRgMgY5ReFx7ED8G4
         vuuNvk7fBsTMKN19O9QIP5/bjHU/fr88kAXJaaZY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0F9FPoT007507
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Jan 2019 03:15:26 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 15
 Jan 2019 03:15:25 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 15 Jan 2019 03:15:25 -0600
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0F9FNLg016112;
        Tue, 15 Jan 2019 03:15:24 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 0/4] clk: ti: get rid of CLK_IS_BASIC
Date:   Tue, 15 Jan 2019 11:15:11 +0200
Message-ID: <1547543715-16467-1-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

As requested, this series gets rid of CLK_IS_BASIC flag usage from
TI clock drivers.

Boot tested on am3/am4/am5/omap3/omap4 series of SoCs. Also, ran a quick
suspend/resume test on omap3/omap4/am5.

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
