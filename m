Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:44006 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753415AbcKARsK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Nov 2016 13:48:10 -0400
Date: Tue, 1 Nov 2016 10:48:08 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-clk@vger.kernel.org,
        "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Michael Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: cdce925: add support for CDCE913, CDCE937, and
 CDCE949
Message-ID: <20161101174808.GU16026@codeaurora.org>
References: <1477848637-5151-1-git-send-email-akinobu.mita@gmail.com>
 <20161031181509.GS16026@codeaurora.org>
 <CAC5umyiVcV_KEL+g=mRL-mGQfJrCU5XrEVNzX=CFFXWNuTMBGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAC5umyiVcV_KEL+g=mRL-mGQfJrCU5XrEVNzX=CFFXWNuTMBGQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/01, Akinobu Mita wrote:
> 2016-11-01 3:15 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> > On 10/31, Akinobu Mita wrote:
> >> @@ -728,13 +780,19 @@ static int cdce925_probe(struct i2c_client *client,
> >>  }
> >>
> >>  static const struct i2c_device_id cdce925_id[] = {
> >> -     { "cdce925", 0 },
> >> +     { "cdce913", CDCE913 },
> >> +     { "cdce925", CDCE925 },
> >> +     { "cdce937", CDCE937 },
> >> +     { "cdce949", CDCE949 },
> >>       { }
> >>  };
> >>  MODULE_DEVICE_TABLE(i2c, cdce925_id);
> >>
> >>  static const struct of_device_id clk_cdce925_of_match[] = {
> >> +     { .compatible = "ti,cdce913" },
> >>       { .compatible = "ti,cdce925" },
> >> +     { .compatible = "ti,cdce937" },
> >> +     { .compatible = "ti,cdce949" },
> >
> > Doesn't this need to be updated to point to the correct enum
> > values?
> 
> I think it isn't needed. Because the data field in struct of_device_id
> for this driver is not used even if the device is registered from
> device tree.  But the driver_data in i2c_device_id is used instead.

Ok. Have you tested this driver with DT or platform data? Do you
prefix the compatible string with "ti," in the DT case?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
