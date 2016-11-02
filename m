Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:60432 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756196AbcKBR4M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Nov 2016 13:56:12 -0400
Date: Wed, 2 Nov 2016 10:56:10 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-clk@vger.kernel.org,
        "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Michael Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: cdce925: add support for CDCE913, CDCE937, and
 CDCE949
Message-ID: <20161102175610.GH16026@codeaurora.org>
References: <1477848637-5151-1-git-send-email-akinobu.mita@gmail.com>
 <20161031181509.GS16026@codeaurora.org>
 <CAC5umyiVcV_KEL+g=mRL-mGQfJrCU5XrEVNzX=CFFXWNuTMBGQ@mail.gmail.com>
 <20161101174808.GU16026@codeaurora.org>
 <CAC5umyj+NO7tXEfT4YEGAo6-CRfxufLHPSXQVmCdJjHDYgZiSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAC5umyj+NO7tXEfT4YEGAo6-CRfxufLHPSXQVmCdJjHDYgZiSg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/02, Akinobu Mita wrote:
> 2016-11-02 2:48 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> > On 11/01, Akinobu Mita wrote:
> >> 2016-11-01 3:15 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> >> > On 10/31, Akinobu Mita wrote:
> >>
> >> I think it isn't needed. Because the data field in struct of_device_id
> >> for this driver is not used even if the device is registered from
> >> device tree.  But the driver_data in i2c_device_id is used instead.
> >
> > Ok. Have you tested this driver with DT or platform data? Do you
> > prefix the compatible string with "ti," in the DT case?
> 
> I have tested with DT with compatible = "ti,cdce937" and checked that
> correct i2c_device_id is passed by the caller of cdce925_probe().
> 
> According to of_i2c_register_device() in drivers/i2c/i2c-core.c,
> the manufacturer prefix like "ti," is stripped from i2c_client->name by
> of_modalias_node().  So i2c_match_id() can find correct i2c_device_id
> entry and ->probe() is called with it.

Great! Thanks for the explanation.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
