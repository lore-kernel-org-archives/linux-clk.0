Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00EBCCF9E2
	for <linux-clk@archiver.kernel.org>; Tue,  5 Sep 2023 23:28:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237714AbjIEX2z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Sep 2023 19:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbjIEX2y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Sep 2023 19:28:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DE39E;
        Tue,  5 Sep 2023 16:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693956531; x=1725492531;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0wpZ4uEiyvX8GLZIB6P9f6saFvhcvQ+D5/9/Acf/xw4=;
  b=Cg0zXQqBfsHkub+HcCoJ7GPREZyB0V0udhlIct9NxaFSp/REwtOi8yk7
   vvg2jP2smuTdcUzdFBZlGdco2/6iRjJyIXzGzp2R6KW7/F//so/2OCZVN
   sMEM91qaKOWWsNyv2t5oSU78HZHFyRY4hs/TzZdWPDnX+GJroXeAWAmu3
   vyh9DUXiubzMFKByA/7zGP8Rnk/hmQInW8nr1khfUhGWHUUJUZXXLgL6O
   hLXJHyaJ78wVpBJSDE7hdReI0Cuk+Eu6Eo7etOvK/WMLmLJwDDLT535Yp
   0nEtmxVJ0kI3CfTqHGtI27++1/VTn9JJovGXt5xo5Ud/x3IElFGjl8uHp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="379643885"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="379643885"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 16:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="744448396"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="744448396"
Received: from amlin-018-114.igk.intel.com ([10.102.18.114])
  by fmsmga007.fm.intel.com with ESMTP; 05 Sep 2023 16:28:47 -0700
From:   Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
To:     kuba@kernel.org, jiri@resnulli.us, jonathan.lemon@gmail.com,
        pabeni@redhat.com, vadim.fedorenko@linux.dev
Cc:     linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, bvanassche@acm.org,
        intel-wired-lan@lists.osuosl.org,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Subject: [PATCH net-next 0/4] dpll: add phase offset and phase adjust
Date:   Wed,  6 Sep 2023 01:26:06 +0200
Message-Id: <20230905232610.1403647-1-arkadiusz.kubalewski@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This RFC is to start discussion over extending dpll interface
with possibility to:
- read a phase offset between signals on pin and dpll,
- adjust a phase of pin's signal.

The RFC is based on latest version of dpll interface submitted for
net-next [1].

[1] https://lore.kernel.org/netdev/20230824213132.827338-1-vadim.fedorenko@linux.dev/

Arkadiusz Kubalewski (4):
  dpll: docs: add support for pin signal phase offset/adjust
  dpll: spec: add support for pin-dpll signal phase offset/adjust
  dpll: netlink/core: add support for pin-dpll signal phase
    offset/adjust
  ice: dpll: implement phase related callbacks

 Documentation/driver-api/dpll.rst         |  53 ++++-
 Documentation/netlink/specs/dpll.yaml     |  33 +++-
 drivers/dpll/dpll_netlink.c               |  99 +++++++++-
 drivers/dpll/dpll_nl.c                    |   8 +-
 drivers/dpll/dpll_nl.h                    |   2 +-
 drivers/net/ethernet/intel/ice/ice_dpll.c | 224 +++++++++++++++++++++-
 drivers/net/ethernet/intel/ice/ice_dpll.h |  10 +-
 include/linux/dpll.h                      |  18 ++
 include/uapi/linux/dpll.h                 |   8 +-
 9 files changed, 443 insertions(+), 12 deletions(-)

-- 
2.38.1

