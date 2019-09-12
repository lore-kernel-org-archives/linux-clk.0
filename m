Return-Path: <SRS0=F2l5=XH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02332C4CEC6
	for <linux-clk@archiver.kernel.org>; Thu, 12 Sep 2019 13:26:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD6CB20830
	for <linux-clk@archiver.kernel.org>; Thu, 12 Sep 2019 13:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oP2swmMP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732096AbfILN0Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Sep 2019 09:26:25 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58624 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732092AbfILN0Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Sep 2019 09:26:25 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQIDl098805;
        Thu, 12 Sep 2019 08:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568294778;
        bh=zjSX2gMSGTxOGtzxGFRr0fUTkymoKYHw2ZdgT8Yyniw=;
        h=From:To:CC:Subject:Date;
        b=oP2swmMPpwVBfEKKbgcxpWNBMsanbZK+vIyWyrbk3CFDPSviU2aPRRFPcG+War6dO
         3z0Ded9jyF8tmLwkTykXG2XV3ZqAn87xyndayVl/Y3iCjFsJfmTWbhoobLPCkji+xb
         +AGy50w6A8d+EiSGvcXCrgZBRUss7JT9TF1ppwms=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQIiw070828;
        Thu, 12 Sep 2019 08:26:18 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 08:26:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 08:26:17 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQFvP130575;
        Thu, 12 Sep 2019 08:26:16 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv3 00/10] clk: ti: remoteproc / iommu support patches
Date:   Thu, 12 Sep 2019 16:26:03 +0300
Message-ID: <20190912132613.28093-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

V3 of this series sort of reverted back to pretty much V1 which expects
strict sequencing of events from the bus driver. This one doesn't have
any dependency towards the reset driver either, and the controversial
reset handling APIs have been removed.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
