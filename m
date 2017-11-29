Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:38884 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752250AbdK2Uh5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Nov 2017 15:37:57 -0500
Received: by mail-wr0-f193.google.com with SMTP id o2so4618396wro.5
        for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2017 12:37:57 -0800 (PST)
Subject: Re: [PATCH] clk: fix compile testing of scpi clk driver
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-clk@vger.kernel.org,
        kbuild test robot <fengguang.wu@intel.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
References: <24058ecb-9f12-f7e1-503d-bd98eb894c6c@gmail.com>
 <20171129170453.GA7698@codeaurora.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <d01ed8fa-9f9e-adf6-3133-800433fef7bb@gmail.com>
Date: Wed, 29 Nov 2017 21:37:46 +0100
MIME-Version: 1.0
In-Reply-To: <20171129170453.GA7698@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Am 29.11.2017 um 18:04 schrieb Stephen Boyd:
> On 11/28, Heiner Kallweit wrote:
>> We now have a hard dependency on ARM_SCPI_PROTOCOL and may end up with
>> the following error:
>> ERROR: "get_scpi_ops" [drivers/clk/clk-scpi.ko] undefined!
>> Fix this by removing COMPILE_TEST from COMMON_CLK_SCPI dependencies.
>>
>> Fixes: f7fee8be06a6 "firmware: arm_scpi: remove default for get_scpi_ops if not reachable"
> 
> I don't see this commit anywhere. Is this a future issue?
> 
Sorry, yes it is and the patch was primarily addressed to Sudeep. See here:
https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/log/?h=for-next/scpi
