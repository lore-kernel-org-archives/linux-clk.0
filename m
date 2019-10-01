Return-Path: <SRS0=E8mG=X2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C458C388F3
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 09:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 407E621906
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 09:02:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RbKJ8NpA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729878AbfJAJCO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Oct 2019 05:02:14 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36792 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729787AbfJAJCO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 05:02:14 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9192CXm039617;
        Tue, 1 Oct 2019 04:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569920532;
        bh=bb3PN6ZPkSOf4jE89BUFD3OKLOIRfJAYWUH5WWSH5/U=;
        h=From:To:CC:Subject:Date;
        b=RbKJ8NpAvYcy3hDwWpDYPsI1YiEP13/rs87lOh/Frhuy1X+4gNi6b9jFaqEaAaI3W
         ge5Frk8WqITQFwuxs3Z4nPq2njYFpEVZ0C/LP/htHeT1boS0q2LoOWkVXoSCakQ6At
         GuQaK8pyssNlEAeck0nDgESmzWFefB/Ikb9fbC08=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9192Bpo073743
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 04:02:12 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 04:02:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 04:02:01 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x919290I032920;
        Tue, 1 Oct 2019 04:02:10 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <tomi.valkeinen@ti.com>
Subject: [PATCH 0/4] clk: debugfs: add some simple debug functionality
Date:   Tue, 1 Oct 2019 12:01:58 +0300
Message-ID: <20191001090202.26346-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

I have been using a variation of these patches myself for several years
for debugging / testing different clock issues. Basically what I do here
is extend the functionality of debugfs to allow write access to certain
properties, like rate, enable / prepare counts, mux parents.

This allows simple testing of new features or debugging directly from
userspace. The functionality is hidden behind a Kconfig option because
it can be rather dangerous to allow access to these unconditionally if
the user does not know what they are doing.

Any thoughts?

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
