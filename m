Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:48245 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752852AbcKOAyA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Nov 2016 19:54:00 -0500
Date: Tue, 15 Nov 2016 08:53:50 +0800
From: Fengguang Wu <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ritesh Harjani <riteshh@codeaurora.org>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, david.brown@linaro.org,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Alex Lemberg <alex.lemberg@sandisk.com>,
        Mateusz Nowak <mateusz.nowak@intel.com>,
        Yuliy Izrailov <Yuliy.Izrailov@sandisk.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        "kdorfman@codeaurora.org" <kdorfman@codeaurora.org>,
        David Griego <david.griego@linaro.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Pramod Gurav <pramod.gurav@linaro.org>
Subject: Re: [PATCH v7 11/14] mmc: sdhci-msm: Add HS400 platform support
Message-ID: <20161115005350.s657okf2jifdwj6d@wfg-t540p.sh.intel.com>
References: <1479103248-9491-12-git-send-email-riteshh@codeaurora.org>
 <201611142112.EdLY7cAN%fengguang.wu@intel.com>
 <CAPDyKFoUiGgXhLtW9-+iAxdV6sy4+wgQfW8P5+VwsqHc3QwkqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAPDyKFoUiGgXhLtW9-+iAxdV6sy4+wgQfW8P5+VwsqHc3QwkqA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Nov 14, 2016 at 04:44:19PM +0100, Ulf Hansson wrote:
>Hi,
>
>On 14 November 2016 at 14:53, kbuild test robot <lkp@intel.com> wrote:
>> Hi Venkat,
>>
>> [auto build test ERROR on ulf.hansson-mmc/next]
>> [also build test ERROR on v4.9-rc5]
>> [cannot apply to next-20161114]
>> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
>Here we go...
>
>>
>> url:    https://github.com/0day-ci/linux/commits/Ritesh-Harjani/mmc-sdhci-msm-Add-clk-rates-DDR-HS400-support/20161114-142815
>> base:   https://git.linaro.org/people/ulf.hansson/mmc next
>
>This above is the old tree, here's the new:
>git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
>
>Could you please update the path in the build system?

OK, done.

Regards,
Fengguang
