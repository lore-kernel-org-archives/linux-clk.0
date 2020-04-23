Return-Path: <SRS0=Q+FU=6H=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDEBC54FD0
	for <linux-clk@archiver.kernel.org>; Thu, 23 Apr 2020 19:59:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A83220767
	for <linux-clk@archiver.kernel.org>; Thu, 23 Apr 2020 19:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4475DoL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgDWT70 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Apr 2020 15:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgDWT70 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Apr 2020 15:59:26 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCA4C09B043
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2020 12:59:26 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id m13so8316728otf.6
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2020 12:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jVciOj44ySv1IOecSqQhTqt7UKrTfstNOwhWpfuXtSE=;
        b=i4475DoLnh9j+NOLf745YUNNBbHvkY3kiR8xpdjSUhRuUEGqx5o2+pVwfclsy6XJOt
         kYnT0Qy7hK9uzjbpsYnxJz4LJzdPNMW4VLkq2+LGlnEfycDDv4jE8dUudIC2Z+2b7kH7
         GCV64QRmfIOQglDyb/E9Ov76NzkE+09sSo1/W/4xiJ60JseF97nYA3KR59UibamAaPdq
         GoODjDJAspf0le7CmFWSQSWAE/sdhQsyx392D9WylB9RlD5ofVZJFeNWSp5OSA/Mx3qC
         1w2/NXPHDpcs8gNOxflEJtWBxQ3w+xRDB0XtoZHY1M4ijh4k7bv+TtNQoq5ZTG9mMyWq
         Wqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jVciOj44ySv1IOecSqQhTqt7UKrTfstNOwhWpfuXtSE=;
        b=p4AA6YWfu9DKBhVYRpYlSTB8Epgvko3tACX8Drpn2rPQr03S2ZMj9KvVt5FNxBmD8W
         H+sTVaMpCax+Jll7AbOb6Fgvi+IP9MxeEANrqrIIt9N0CU4t57NNjuVtIO/AQtWkdpNu
         asjo3+M/J5LIUwtCd4PlL1ehvAVS/sZVg8GrDY5EQTz3c5A/3gMx9X/StrnG/B5e2saI
         U6MQeLOn9DMi3PIUUhM/1GEN5aQuwXLLwtJHkfPdixFX+55tPgsshazb+VhuOLYHwyA0
         2qXPB/vmbhAbJbAcQI1oYZ9oRKPFN57v5py5eZB745Mw4grVs2r1MRKvT75A8Q3gZQ9S
         U0Dg==
X-Gm-Message-State: AGi0PuZtn5mhw2FcAKpgSBs+XK9AmHgXn1LoWPkQA3NqtVAmaIC3BlRr
        wY4u6Uh3MpfD2kxZm+b6/N0jCwMHhhrLrXd1RTnW/Q==
X-Google-Smtp-Source: APiQypIvfq9bRmRPv4MzXZX5tMqhZAWCP4u2+RmwrXyVsOBb77205qV3U9skRSVJ6M9rEguc5l7CP6JHYjhJVmg9PNA=
X-Received: by 2002:a54:4f02:: with SMTP id e2mr4563635oiy.10.1587671965758;
 Thu, 23 Apr 2020 12:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200421142350.GA77260@archlinux.localdomain> <AM6PR04MB4966D212E388766E8F6101A980D30@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <20200423194726.GA18436@portage>
In-Reply-To: <20200423194726.GA18436@portage>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 23 Apr 2020 12:59:14 -0700
Message-ID: <CALAqxLV1zA3Bzvs=zKG8ULQfXDUYyVz9rMcKVcHLg5QQUixfsw@mail.gmail.com>
Subject: Re: imx8qxp-lpcg-clk: probe of 5a4a0000.clock-controller failed with
 error -110
To:     Oliver Graute <oliver.graute@gmail.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Oliver Graute <Oliver.Graute@kococonnector.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Apr 23, 2020 at 12:47 PM Oliver Graute <oliver.graute@gmail.com> wrote:
>
> On 23/04/20, Aisheng Dong wrote:
> > > From: Oliver Graute <oliver.graute@gmail.com>
> > > Sent: Tuesday, April 21, 2020 10:24 PM
> > >
> > > Hello,
> > >
> > > I run into below clock probing issue, after upgrading from next-20200214 to
> > > next-20200420. I use the following patches series ontop:
> > > >
> > > Some ideas what's the reason for this behavior? or how to fix this?
> > >
> >
> > I will check it tomorrow.
> > Before that, I need rebase my patch series to last kernel to reproduce this issue.
>
> ok fine, I have some bisect results for you I think this change is
> causing the issue.
>
> e2cec7d6853712295cef5377762165a489b2957f is the first bad commit
> commit e2cec7d6853712295cef5377762165a489b2957f
> Author: John Stultz <john.stultz@linaro.org>
> Date:   Tue Feb 25 05:08:24 2020 +0000
>
>     driver core: Set deferred_probe_timeout to a longer default if CONFIG_MODULES is set
>
>     When using modules, its common for the modules not to be loaded
>     until quite late by userland. With the current code,
>     driver_deferred_probe_check_state() will stop returning
>     EPROBE_DEFER after late_initcall, which can cause module
>     dependency resolution to fail after that.
>
>     So allow a longer window of 30 seconds (picked somewhat
>     arbitrarily, but influenced by the similar regulator core
>     timeout value) in the case where modules are enabled.

Yea. Apologies for the trouble.

I've got some patches to set the 30 second window back to zero on the
list, but they haven't been picked up yet:
https://lore.kernel.org/lkml/20200422203245.83244-1-john.stultz@linaro.org/

thanks
-john
