Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:62320 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965307AbbKEXb3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 5 Nov 2015 18:31:29 -0500
Date: Fri, 6 Nov 2015 07:32:47 +0800
From: kbuild test robot <lkp@intel.com>
To: Matthew McClintock <mmcclint@codeaurora.org>
Cc: kbuild-all@01.org, Andy Gross <agross@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	Varadarajan Narayanan <varada@codeaurora.org>,
	linux-kernel@vger.kernel.org,
	qca-upstream.external@qca.qualcomm.com,
	Pradeep Banavathi <pradeepb@codeaurora.org>,
	Senthilkumar N L <snlakshm@codeaurora.org>,
	Matthew McClintock <mmcclint@codeaurora.org>
Subject: Re: [PATCH 2/5] clk: qcom: Add IPQ4019 Global Clock Controller
 support
Message-ID: <201511060736.HU8V8VsZ%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1446761276-9111-3-git-send-email-mmcclint@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Varadarajan,

[auto build test WARNING on: agross-msm/qcom/for-next]
[also build test WARNING on: v4.3 next-20151105]

url:    https://github.com/0day-ci/linux/commits/Matthew-McClintock/arm-qcom-Add-support-for-IPQ8014-family-of-SoCs/20151106-061211
base:   git://codeaurora.org/quic/kernel/agross-msm qcom/for-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/clk/qcom/gcc-ipq4019.c:1661:3-8: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
