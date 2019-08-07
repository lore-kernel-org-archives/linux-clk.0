Return-Path: <SRS0=sie6=WD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E74C433FF
	for <linux-clk@archiver.kernel.org>; Wed,  7 Aug 2019 13:05:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7826C21BE3
	for <linux-clk@archiver.kernel.org>; Wed,  7 Aug 2019 13:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xcIVS+/h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387970AbfHGNFE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Aug 2019 09:05:04 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51474 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387476AbfHGNFE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Aug 2019 09:05:04 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77D504C056000;
        Wed, 7 Aug 2019 08:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565183100;
        bh=jhssGt2ewkitOak3BNmAutgMVExRPPs+Oro+ZadcTuo=;
        h=From:To:CC:Subject:Date;
        b=xcIVS+/hA8noofLLRPFvxYdK9YnzzhNCPEclfodxsby8Xj8hBnBt+PvCIx9sf5fTf
         1LMQQyXOpQsoRYQzlHXRnleqvN0GUbwWbryGdTZL2krMChZEGZsngEfY/cS8POFnRA
         ApsPUgHbKNg/eSCXe3JwfueAeGQXls+TYbudsC4E=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77D50Zr040009
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 08:05:00 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 08:05:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 08:05:00 -0500
Received: from gomoku.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77D4i1c081508;
        Wed, 7 Aug 2019 08:04:52 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCH 0/3] clk: ti: couple of fixes towards 5.4
Date:   Wed, 7 Aug 2019 16:04:36 +0300
Message-ID: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Here are some TI clock fixes which can be queued for 5.4. These are
needed for getting remoteproc functionality working properly, as these
depend on reset handling also and timing out with clocks is bad for
them. The timer clock alias fix is needed for the same, as remoteprocs
depend on certain HW timers for their functionality.

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
