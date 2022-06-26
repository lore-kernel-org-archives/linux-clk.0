Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C51C43334
	for <linux-clk@archiver.kernel.org>; Sun, 26 Jun 2022 19:34:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbiFZTek (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 26 Jun 2022 15:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiFZTek (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 26 Jun 2022 15:34:40 -0400
X-Greylist: delayed 582 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 26 Jun 2022 12:34:39 PDT
Received: from novek.ru (unknown [213.148.174.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B524C55A2
        for <linux-clk@vger.kernel.org>; Sun, 26 Jun 2022 12:34:39 -0700 (PDT)
Received: from nat1.ooonet.ru (gw.zelenaya.net [91.207.137.40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by novek.ru (Postfix) with ESMTPSA id 659A65001E5;
        Sun, 26 Jun 2022 22:23:18 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 novek.ru 659A65001E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novek.ru; s=mail;
        t=1656271400; bh=w5RmkcsvzizoK5cokekNqYoddoLcveR3wV1x+E2Nwe0=;
        h=From:To:Cc:Subject:Date:From;
        b=lkcTNVQ9q+SB4g6EiJ7JQicKvcsK+sAnkMsa+PLtXXvknoWE7pJ57F8FxFwWnh7BX
         jfVYgQeisPQMxiIK+OEZj0aEyf3FeIrG+FTNi7xlsKYBHEUOMygHrskhWCl6/sJ0o3
         JUnV4oPAH4ophbPYv+XAUBRFvJhwzH828rqmcdHE=
From:   Vadim Fedorenko <vfedorenko@novek.ru>
To:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>
Cc:     Vadim Fedorenko <vadfed@fb.com>, Aya Levin <ayal@nvidia.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [RFC PATCH v2 0/3] Create common DPLL/clock configuration API
Date:   Sun, 26 Jun 2022 22:24:41 +0300
Message-Id: <20220626192444.29321-1-vfedorenko@novek.ru>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Vadim Fedorenko <vadfed@fb.com>

Implement common API for clock/DPLL configuration and status reporting.
The API utilises netlink interface as transport for commands and event
notifications. This API aim to extend current pin configuration and
make it flexible and easy to cover special configurations.

v1 -> v2:
 * implement returning supported input/output types
 * ptp_ocp: follow suggestions from Jonathan
 * add linux-clk mailing list
v0 -> v1:
 * fix code style and errors
 * add linux-arm mailing list


Vadim Fedorenko (3):
  dpll: Add DPLL framework base functions
  dpll: add netlink events
  ptp_ocp: implement DPLL ops

 MAINTAINERS                 |   8 +
 drivers/Kconfig             |   2 +
 drivers/Makefile            |   1 +
 drivers/dpll/Kconfig        |   7 +
 drivers/dpll/Makefile       |   7 +
 drivers/dpll/dpll_core.c    | 161 ++++++++++
 drivers/dpll/dpll_core.h    |  40 +++
 drivers/dpll/dpll_netlink.c | 595 ++++++++++++++++++++++++++++++++++++
 drivers/dpll/dpll_netlink.h |  14 +
 drivers/ptp/Kconfig         |   1 +
 drivers/ptp/ptp_ocp.c       | 169 +++++++---
 include/linux/dpll.h        |  29 ++
 include/uapi/linux/dpll.h   |  81 +++++
 13 files changed, 1079 insertions(+), 36 deletions(-)
 create mode 100644 drivers/dpll/Kconfig
 create mode 100644 drivers/dpll/Makefile
 create mode 100644 drivers/dpll/dpll_core.c
 create mode 100644 drivers/dpll/dpll_core.h
 create mode 100644 drivers/dpll/dpll_netlink.c
 create mode 100644 drivers/dpll/dpll_netlink.h
 create mode 100644 include/linux/dpll.h
 create mode 100644 include/uapi/linux/dpll.h

-- 
2.27.0

