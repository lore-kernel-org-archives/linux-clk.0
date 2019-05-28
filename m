Return-Path: <SRS0=Al5s=T4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692B5C04AB6
	for <linux-clk@archiver.kernel.org>; Tue, 28 May 2019 13:10:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31F3F2133F
	for <linux-clk@archiver.kernel.org>; Tue, 28 May 2019 13:10:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jp1iwcFQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfE1NKj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 May 2019 09:10:39 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50910 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbfE1NKj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 May 2019 09:10:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SDAXeZ060641;
        Tue, 28 May 2019 08:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559049033;
        bh=j/HzWeJq7uUYskgj6xTmASdH7f56zUC9hO0ZwJte/V8=;
        h=From:To:CC:Subject:Date;
        b=jp1iwcFQHLiuDEgMeAAZ9JygmEqLBQPZhasyyK9kYwabsH0vtlI88PbaRm4nNqczV
         PqhwlUlgKd3PIa7wfT3w0Hk0Rc1JfqliM1N29IDEKTAJgHl7YI4LuEOtg1zH7/h4R8
         fKTpufiTSWTgWwaW9ITJoLOU+gxULu7igkSbIOoc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SDAX3I090325
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 08:10:33 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 08:10:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 08:10:33 -0500
Received: from gomoku.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SDAVBu079520;
        Tue, 28 May 2019 08:10:31 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <ssantosh@kernel.org>, <nm@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCHv2 0/5] clk: keystone: clock optimizations / fixes
Date:   Tue, 28 May 2019 16:10:19 +0300
Message-ID: <1559049024-30872-1-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

This is a re-base / re-spin of the Keystone clock optimization series [1].

Changes from v1:
- rebased on top of 5.2-rc1
- added support for clk-ids 255+
- changed patch #3 to parse also 'assigned-clocks' in addition to 'clocks'
  DT nodes only. This allows automatic (DT based) programming of clocks
  that are not directly touched by any driver.

Please note that there is hard dependency between patches 4 & 5, patch #5
must be applied after patch #4, otherwise bad things will happen (basically
boot breaks.) The cast magic in patch #4 is done also so that this order
of patches can be used and bisectability is retained.

-Tero

[1] https://lore.kernel.org/linux-arm-kernel/1555093342-428-1-git-send-email-t-kristo@ti.com/


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
