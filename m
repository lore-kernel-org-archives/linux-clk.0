Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:17587 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729708AbeGQT1c (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Jul 2018 15:27:32 -0400
Date: Wed, 18 Jul 2018 02:52:47 +0800
From: kbuild test robot <lkp@intel.com>
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: kbuild-all@01.org, Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, Owen Chen <owen.chen@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH v5 10/11] clk: mediatek: Add MT6765 clock support
Message-ID: <201807180207.ER8P4qsc%fengguang.wu@intel.com>
References: <1531817552-17221-11-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1531817552-17221-11-git-send-email-mars.cheng@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Owen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on v4.18-rc5 next-20180717]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Mars-Cheng/Add-basic-SoC-support-for-mt6765/20180717-205540
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/clk/mediatek/clk-mt6765.c:36:14: sparse: symbol 'cksys_base' was not declared. Should it be static?
>> drivers/clk/mediatek/clk-mt6765.c:37:14: sparse: symbol 'apmixed_base' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
