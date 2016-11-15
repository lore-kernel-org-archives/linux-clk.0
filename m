Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:38236 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S941024AbcKOAGn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Nov 2016 19:06:43 -0500
Subject: Re: [PATCH v7 00/14] mmc: sdhci-msm: Add clk-rates, DDR, HS400
 support
To: Ritesh Harjani <riteshh@codeaurora.org>, ulf.hansson@linaro.org,
        linux-mmc@vger.kernel.org, adrian.hunter@intel.com,
        shawn.lin@rock-chips.com, sboyd@codeaurora.org,
        andy.gross@linaro.org
References: <1479103248-9491-1-git-send-email-riteshh@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        david.brown@linaro.org, linux-arm-msm@vger.kernel.org,
        georgi.djakov@linaro.org, alex.lemberg@sandisk.com,
        mateusz.nowak@intel.com, Yuliy.Izrailov@sandisk.com,
        asutoshd@codeaurora.org, kdorfman@codeaurora.org,
        david.griego@linaro.org, stummala@codeaurora.org,
        venkatg@codeaurora.org, rnayak@codeaurora.org,
        pramod.gurav@linaro.org
From: Jeremy McNicoll <jmcnicol@redhat.com>
Message-ID: <812a4ae1-504b-3fa1-27b9-95baceeed9b6@redhat.com>
Date: Mon, 14 Nov 2016 16:06:40 -0800
MIME-Version: 1.0
In-Reply-To: <1479103248-9491-1-git-send-email-riteshh@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2016-11-13 10:00 PM, Ritesh Harjani wrote:
> Hi,
>
> This is v7 version of the patch series which adds support for MSM8996.
> Adds HS400 driver support as well.
> These are tested on internal msm8996 & db410c HW.
>
> Below are the changes in v7.
>

After adding the associated changes to
drivers/clk/qcom/gcc-msm8994.c (2/14) this version of the series work fine
on my Nexus 5X (msm8992).  All partitions have been found and can be
mounted as expected.  Reading files seems to work as well, I didn't
try writing anything as I didn't want to mess up my phone at this
point.

So,

Tested-by: Jeremy McNicoll <jeremymc@redhat.com>

-jeremy

