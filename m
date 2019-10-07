Return-Path: <SRS0=ZgeQ=YA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C9BC47404
	for <linux-clk@archiver.kernel.org>; Mon,  7 Oct 2019 12:26:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07C3E21721
	for <linux-clk@archiver.kernel.org>; Mon,  7 Oct 2019 12:26:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O9DAvZw6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbfJGM0O (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Oct 2019 08:26:14 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35600 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfJGM0O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Oct 2019 08:26:14 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97CQAwQ025349;
        Mon, 7 Oct 2019 07:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570451170;
        bh=xdnlWNGLDMRw9dcvDdalUpzX+gYMrnIcBpP1U6rIl0c=;
        h=From:To:CC:Subject:Date;
        b=O9DAvZw6EkNOG1IDOJgtu28w5BNf0NtmxVtv2wnw2xWoW3x6BGAHO9yF1QGq7t/DP
         ulR5RdwTQmSNXdVKOkTQ06aRxWh0+XYgwqaC2SKdiwC++VvI35j6sc6fwZLqPa2oMG
         32ma8ouTXAJvPn4JLiGccoKpGsZqyuBlbaZKusqQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97CQAp5062584
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 07:26:10 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:26:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:26:09 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CQ8NZ085058;
        Mon, 7 Oct 2019 07:26:08 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 0/2] clk: ti: fix GFX clocks for reset support
Date:   Mon, 7 Oct 2019 15:26:02 +0300
Message-ID: <20191007122604.18508-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

These two patches are on top of [1] to support GFX module reset
properly for am3/am4 SoCs.

-Tero

[1] https://patchwork.kernel.org/cover/11143025/


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
