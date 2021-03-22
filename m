Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4EFC433DB
	for <linux-clk@archiver.kernel.org>; Mon, 22 Mar 2021 06:19:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 971A16196C
	for <linux-clk@archiver.kernel.org>; Mon, 22 Mar 2021 06:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbhCVGSv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Mar 2021 02:18:51 -0400
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:38686 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhCVGSW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Mar 2021 02:18:22 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 12M6I5Lg032690; Mon, 22 Mar 2021 15:18:05 +0900
X-Iguazu-Qid: 34tKV5jqdrtpNtbwQb
X-Iguazu-QSIG: v=2; s=0; t=1616393885; q=34tKV5jqdrtpNtbwQb; m=iiWfmwWjR7evAzSncjWp4d2pqHj3A9gOPRyzWA7EzQM=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
        by relay.securemx.jp (mx-mr1512) id 12M6I4S7023951
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 22 Mar 2021 15:18:04 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id 7A1861000BC;
        Mon, 22 Mar 2021 15:18:04 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 12M6I4ai022359;
        Mon, 22 Mar 2021 15:18:04 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     michal.simek@xilinx.com
Cc:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] Update ZYNQMP clock configuration
Date:   Mon, 22 Mar 2021 15:17:52 +0900
X-TSB-HOP: ON
Message-Id: <20210322061754.1065367-1-punit1.agrawal@toshiba.co.jp>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Here are a couple of patches defaulting the ZYNQMP clock configuration
if it's dependencies are available. The clock driver is needed for
peripherals such as micro sd card required for booting.

The second posting adds a patch to drop the redundant dependency on
ARCH_ZYNQMP requested by Michal.

Thanks,
Punit

Previous posting -

[0] https://lore.kernel.org/linux-arm-kernel/20210316090540.973014-1-punit1.agrawal@toshiba.co.jp/

Punit Agrawal (2):
  clk: zynqmp: Enable the driver if ZYNQMP_FIRMWARE is selected
  clk: zynqmp: Drop dependency on ARCH_ZYNQMP

 drivers/clk/zynqmp/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.30.1

