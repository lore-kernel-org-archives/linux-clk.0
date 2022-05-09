Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDE3C433EF
	for <linux-clk@archiver.kernel.org>; Mon,  9 May 2022 14:24:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237137AbiEIO2k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 May 2022 10:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237124AbiEIO2j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 May 2022 10:28:39 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9DCB11E3EDA;
        Mon,  9 May 2022 07:24:45 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,211,1647270000"; 
   d="scan'208";a="119126743"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 May 2022 23:24:44 +0900
Received: from localhost.localdomain (unknown [10.226.93.110])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E654C40078D5;
        Mon,  9 May 2022 23:24:38 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/5] Add Renesas RZ/V2M Ethernet support
Date:   Mon,  9 May 2022 15:24:26 +0100
Message-Id: <20220509142431.24898-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The RZ/V2M Ethernet is very similar to R-Car Gen3 Ethernet-AVB, though
some small parts are the same as R-Car Gen2.
Other differences are:
* It has separate data (DI), error (Line 1) and management (Line 2) irqs
  rather than one irq for all three.
* Instead of using the High-speed peripheral bus clock for gPTP, it has
  a separate gPTP reference clock.

v2:
 * Just net patches in this series
 * Instead of reusing ch22 and ch24 interrupt names, use the proper names
 * Renamed irq_en_dis_regs to irq_en_dis
 * Squashed use of GIC reg versus GIE/GID and got rid of separate gptp_ptm_gic feature.
 * Move err_mgmt_irqs code under multi_irqs
 * Minor editing of the commit msgs


Phil Edworthy (5):
  dt-bindings: net: renesas,etheravb: Document RZ/V2M SoC
  ravb: Separate handling of irq enable/disable regs into feature
  ravb: Support separate Line0 (Desc), Line1 (Err) and Line2 (Mgmt) irqs
  ravb: Use separate clock for gPTP
  ravb: Add support for RZ/V2M

 .../bindings/net/renesas,etheravb.yaml        |  82 ++++++++++----
 drivers/net/ethernet/renesas/ravb.h           |   6 ++
 drivers/net/ethernet/renesas/ravb_main.c      | 102 ++++++++++++++++--
 drivers/net/ethernet/renesas/ravb_ptp.c       |   4 +-
 4 files changed, 162 insertions(+), 32 deletions(-)

-- 
2.32.0

