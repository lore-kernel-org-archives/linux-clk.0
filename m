Return-Path: <SRS0=Ml2J=PQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3023FC43387
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 13:31:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC49B20827
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 13:31:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qJ3VUWZs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbfAHNbj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Jan 2019 08:31:39 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39448 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbfAHNbj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Jan 2019 08:31:39 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x08DVQAb075118;
        Tue, 8 Jan 2019 07:31:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1546954286;
        bh=+wg76Pqo+Bo8l3yM3CQNB0mIE8I40rfxxv6nykYX4ZQ=;
        h=From:To:Subject:Date;
        b=qJ3VUWZsgw9hWVOKKifu3XUtcnHXdv0S5lU0LOvp2cooODlt/fY3Z80mphwFT5t29
         hyZgYK0g8/9nj7zB5RuJCwtZuL0Aex2mRNd79eJJ04Dki/rh6lWqtp8JwT2AMSMfyg
         6ia0H3Jx4mVHXjh+OUIEsVIUHtymgGkJqJof1Sfw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x08DVQJp074701
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Jan 2019 07:31:26 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 8
 Jan 2019 07:31:25 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 8 Jan 2019 07:31:25 -0600
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x08DVMue011668;
        Tue, 8 Jan 2019 07:31:23 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <robh+dt@kernel.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/3] clk: keystone: a few TI sci-clk improvements
Date:   Tue, 8 Jan 2019 15:30:20 +0200
Message-ID: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Patch 1 & 2 introduce a new DT flag for parsing the clock data from devicetree
instead of querying everything from firmware. The purpose of this change
is to improve boot time, it can be seen to give ~2s improvement in certain
setups. If adding a new DT flag for this is not acceptable, a kernel command
line parameter could be introduced instead, or even a new Kconfig option.
I voted for the DT flag for now as that seems to be the most versatile
solution.

Patch 3 shortens the kernel registered clock names, currently for am65x
they are of the form:

interconnect@100000:interconnect@28380000:interconnect@42040000:dmsc:clocks:11:1
0

After this patch the same clock name is cut down to:

clocks:11:10

This makes the debugfs interface much more readable in addition to some
memory savings.

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
