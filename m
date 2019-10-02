Return-Path: <SRS0=ekiN=X3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFDBC352AA
	for <linux-clk@archiver.kernel.org>; Wed,  2 Oct 2019 12:06:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 75F4F218DE
	for <linux-clk@archiver.kernel.org>; Wed,  2 Oct 2019 12:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="h1LREXFk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbfJBMG3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Oct 2019 08:06:29 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49904 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJBMG2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Oct 2019 08:06:28 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92C6OWb005404;
        Wed, 2 Oct 2019 07:06:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570017984;
        bh=aPvd+C7TqqygO08W7se1h60SDZdqTkcv2apX3jlsElc=;
        h=From:To:CC:Subject:Date;
        b=h1LREXFkk2kqME2lNiNQ7CMazyvqgnNHJsESMQD3lbK65MLaTCHeMM2upjecqdK2b
         c+pOE6yeanLXN9ndaDV59BDkq7kykQwJBNg/9vWpVEP1HpDcjCp1wPiHP+bcMom9uU
         0VxObHjkbntP72qw2OcqHLVJpCDKQG9Qowr+T0dk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92C6OHM070787
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 07:06:24 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:06:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:06:13 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92C6L3h046205;
        Wed, 2 Oct 2019 07:06:21 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>,
        <aford173@gmail.com>, <tomi.valkeinen@ti.com>
Subject: [PATCH 0/4] clk: ti: re-work divider clock support
Date:   Wed, 2 Oct 2019 15:06:07 +0300
Message-ID: <20191002120611.26121-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

The existing divider clock support appears to have an inherent bug
because of the bit field width implementation and limitation of divider
values based on this. The limitation by bit field only is not enough,
as we can have divider settings which accept only certain range of
dividers within the full range of the bit-field.

Because of this, the divider clock is re-implemented to use min,max,mask
values instead of just the bit-field.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
