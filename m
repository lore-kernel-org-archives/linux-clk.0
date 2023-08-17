Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE113C3064E
	for <linux-clk@archiver.kernel.org>; Thu, 17 Aug 2023 15:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244226AbjHQPYZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Aug 2023 11:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353180AbjHQPYP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Aug 2023 11:24:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5596FE55;
        Thu, 17 Aug 2023 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692285853; x=1723821853;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zofViGS7v/C3zO2ASIv9BAypzeMZYbo+V0M4OX9L9m4=;
  b=PjNr5W5uZoUzFCd1YWHeY2fBXUUxB1O+sUaDHIi5QPcN49w3zO82fExN
   O2Jfu3vEKOkUf+xBlqA0mrtAhL9Rf37pOi1QRQOaquOHGdGGDBZNZK8oZ
   lJ5H7sfqU2gavCNW7wQEmlyv5Os5mUZ3JlZaLHyo0YIVbxYQsZgbmZPud
   8SB4Ay2UUtBqqxawoFdCB/YUXbTJk42BOtfy24oHacRX2Oc+ilQijZjKT
   hCZqKaPSZELjDXOdKv2DLgfsbqlVk7QkjtPYVLFO2qcwUCN2ueWUt1CwT
   Oz1/kjtne+55z5rzTJOFFflbtuu8qkR+ufEIm0+AEQ8I/aUT24ZNPh3XI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="436758726"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="436758726"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 08:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="734694075"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="734694075"
Received: from mmichali-devpc.igk.intel.com ([10.211.235.239])
  by orsmga002.jf.intel.com with ESMTP; 17 Aug 2023 08:24:08 -0700
From:   Michal Michalik <michal.michalik@intel.com>
To:     netdev@vger.kernel.org
Cc:     vadim.fedorenko@linux.dev, kuba@kernel.org, jiri@resnulli.us,
        arkadiusz.kubalewski@intel.com, jonathan.lemon@gmail.com,
        pabeni@redhat.com, poros@redhat.com, milena.olech@intel.com,
        mschmidt@redhat.com, linux-clk@vger.kernel.org, bvanassche@acm.org,
        Michal Michalik <michal.michalik@intel.com>
Subject: [PATCH RFC net-next v1 0/2] selftests/dpll: DPLL subsystem integration tests
Date:   Thu, 17 Aug 2023 17:22:07 +0200
Message-Id: <20230817152209.23868-1-michal.michalik@intel.com>
X-Mailer: git-send-email 2.9.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The newly proposed common DPLL interface discussed on a newsletter[1]
is introducing new, complex subsystem which requires proper integration
testing - this patch adds core for such framework, as well as the
initial test cases. Framework does not require neither any special
hardware nor any special system architecture.

To properly test the DPLL subsystem this patch adds two fake modules,
named 'dpll_test' and 'dpll_test_other'. Only one of them is a subject
for testing, but to rule out the possibility of different behavior based
on the order of modules load the tests are duplicated in multiple
environments:
1) only 'dpll_test' loaded,
2) both 'dpll_test_other' and 'dpll_test' loaded, in this order,
3) both 'dpll_test' and 'dpll_test_other' loaded, in this order.

Patch adds few helper scripts, which are:
1) tools/testing/selftests/dpll/modules_handler.sh˙
    Script is providing a simple way to build, load and unload a
    particular module needed in integration testing - can be used
    standalone
2) tools/testing/selftests/dpll/run_dpll_tests.sh
    Script is checking for all dependencies, creates temporary
    environment, installs required libraries and run all tests - can be
    used standalone
3) tools/testing/selftests/dpll/ynlfamilyhandler.py˙
    Library for easier ynl use in the pytest framework - can be used
    standalone

[1] https://lore.kernel.org/netdev/20230811200340.577359-1-vadim.fedorenko@linux.dev/

Michal Michalik (2):
  selftests/dpll: add DPLL module for integration selftests
  selftests/dpll: add DPLL system integration selftests

 tools/testing/selftests/Makefile                   |   1 +
 tools/testing/selftests/dpll/Makefile              |  11 +
 tools/testing/selftests/dpll/__init__.py           |   0
 tools/testing/selftests/dpll/config                |   1 +
 tools/testing/selftests/dpll/consts.py             |  34 ++
 tools/testing/selftests/dpll/dpll_modules/Makefile |  12 +
 .../selftests/dpll/dpll_modules/dpll_helpers.c     | 259 ++++++++++++++
 .../selftests/dpll/dpll_modules/dpll_test.c        | 148 ++++++++
 .../selftests/dpll/dpll_modules/dpll_test.h        |  38 ++
 .../selftests/dpll/dpll_modules/dpll_test_other.c  |  93 +++++
 .../selftests/dpll/dpll_modules/dpll_test_other.h  |  27 ++
 tools/testing/selftests/dpll/dpll_utils.py         | 104 ++++++
 tools/testing/selftests/dpll/modules_handler.sh    |  79 +++++
 tools/testing/selftests/dpll/requirements.txt      |   3 +
 tools/testing/selftests/dpll/run_dpll_tests.sh     |  75 ++++
 tools/testing/selftests/dpll/test_dpll.py          | 385 +++++++++++++++++++++
 tools/testing/selftests/dpll/ynlfamilyhandler.py   |  49 +++
 17 files changed, 1319 insertions(+)
 create mode 100644 tools/testing/selftests/dpll/Makefile
 create mode 100644 tools/testing/selftests/dpll/__init__.py
 create mode 100644 tools/testing/selftests/dpll/config
 create mode 100644 tools/testing/selftests/dpll/consts.py
 create mode 100644 tools/testing/selftests/dpll/dpll_modules/Makefile
 create mode 100644 tools/testing/selftests/dpll/dpll_modules/dpll_helpers.c
 create mode 100644 tools/testing/selftests/dpll/dpll_modules/dpll_test.c
 create mode 100644 tools/testing/selftests/dpll/dpll_modules/dpll_test.h
 create mode 100644 tools/testing/selftests/dpll/dpll_modules/dpll_test_other.c
 create mode 100644 tools/testing/selftests/dpll/dpll_modules/dpll_test_other.h
 create mode 100644 tools/testing/selftests/dpll/dpll_utils.py
 create mode 100755 tools/testing/selftests/dpll/modules_handler.sh
 create mode 100644 tools/testing/selftests/dpll/requirements.txt
 create mode 100755 tools/testing/selftests/dpll/run_dpll_tests.sh
 create mode 100644 tools/testing/selftests/dpll/test_dpll.py
 create mode 100644 tools/testing/selftests/dpll/ynlfamilyhandler.py

-- 
2.9.5

base-commit: f54a2a132a9d76c0e31fd1d5f569e84682563e54
