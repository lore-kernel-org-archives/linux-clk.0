Return-Path: <SRS0=Q+FU=6H=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF23C54FD0
	for <linux-clk@archiver.kernel.org>; Thu, 23 Apr 2020 19:47:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0481520728
	for <linux-clk@archiver.kernel.org>; Thu, 23 Apr 2020 19:47:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHGGJBMO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgDWTrb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Apr 2020 15:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgDWTrb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Apr 2020 15:47:31 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3966BC09B042
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2020 12:47:31 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id pg17so5631014ejb.9
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2020 12:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eu1JjVOxELUgxTKtCnJF1cKtrRvuQ0zxNce+3IOPNG4=;
        b=aHGGJBMO8aIh6R/t4vgw2/UnTvqfi88owWaY+ncPQ08ZHatVLp37vDcPdCWZ0/gqq3
         3vxM0iZUqLHXZAMj1ERhl/ywNgIR1Qbf3SOusfZRl4iBSYO/QYqQdLiAPcB9EB9mhSK6
         VK8UzAMtqOWp9EKATb419tFKLzbMtQM8JAT9b3lA8ohpLoqEbq+Hmm5sDXD4Hbf5RtN4
         TV/iMEjmyqAig7+TZ+fbdtuksfHS8TcaauTJvhAuwNRMGtjPyMWf0JQuVFPtETztFSH8
         n3mDPAJ0QD4CENuj06rSwH7KwoE5eLuvzbrmLHRHTmPXXzeuXrPWV+c+6m5p1tLDJgrF
         Tokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eu1JjVOxELUgxTKtCnJF1cKtrRvuQ0zxNce+3IOPNG4=;
        b=hKf01PfNlW8maLOd6xDV8BpKk40T8pkGet1ZitpKjWd7v0Hp6ybzpkEJ8h901mSv8p
         sAgmUKvJxTn/iuGuViD3L2WXasuirw4cty8KOo6dj68mSQQbdVkwn4vdDQDUoFjKBK0l
         ddViGMTbpFKBUJKoPACFeFWxQ7PorSLLV2Oex636EBx7/NhC288LfFLRSosyq7m3Z0cm
         lDcM+hht8RfrdIiAl5ocp6R0YRFtLFOdyXrValLHz3IPrEzhDt1CQRkMCEDcF4KYx8s1
         N5gPV6yLIsTY4vS0r10oO3qZ3JsQK9Lp57s6OVRoBXn++DUepDVhc8mDtjBUo2XwqZwU
         131w==
X-Gm-Message-State: AGi0PuasjYtUVKHfrT6vpVF4qmUE7zzL3R3PBU8JL1cJCRMPwcBcZrQj
        0b4wmWR22L+KKF4JzmpCkrI=
X-Google-Smtp-Source: APiQypJugfkYwl8uXexYu1t6cGPzSC9w2g8IlN9KYueSes1YYC1D8Jp57AZsYlA+0fyUeBF6NK7dug==
X-Received: by 2002:a17:906:4ecb:: with SMTP id i11mr3921141ejv.79.1587671249772;
        Thu, 23 Apr 2020 12:47:29 -0700 (PDT)
Received: from localhost (ipv6-80adf4751ff4da96.ost.clients.hamburg.freifunk.net. [2a03:2267:4:0:80ad:f475:1ff4:da96])
        by smtp.gmail.com with ESMTPSA id m7sm290939edv.70.2020.04.23.12.47.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Apr 2020 12:47:28 -0700 (PDT)
Date:   Thu, 23 Apr 2020 21:47:26 +0200
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Oliver Graute <Oliver.Graute@KoCoConnector.com>,
        John Stultz <john.stultz@linaro.org>
Subject: Re: imx8qxp-lpcg-clk: probe of 5a4a0000.clock-controller failed with
 error -110
Message-ID: <20200423194726.GA18436@portage>
References: <20200421142350.GA77260@archlinux.localdomain>
 <AM6PR04MB4966D212E388766E8F6101A980D30@AM6PR04MB4966.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB4966D212E388766E8F6101A980D30@AM6PR04MB4966.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/04/20, Aisheng Dong wrote:
> > From: Oliver Graute <oliver.graute@gmail.com>
> > Sent: Tuesday, April 21, 2020 10:24 PM
> > 
> > Hello,
> > 
> > I run into below clock probing issue, after upgrading from next-20200214 to
> > next-20200420. I use the following patches series ontop:
> > > 
> > Some ideas what's the reason for this behavior? or how to fix this?
> > 
> 
> I will check it tomorrow.
> Before that, I need rebase my patch series to last kernel to reproduce this issue.

ok fine, I have some bisect results for you I think this change is
causing the issue.

e2cec7d6853712295cef5377762165a489b2957f is the first bad commit
commit e2cec7d6853712295cef5377762165a489b2957f
Author: John Stultz <john.stultz@linaro.org>
Date:   Tue Feb 25 05:08:24 2020 +0000

    driver core: Set deferred_probe_timeout to a longer default if CONFIG_MODULES is set
    
    When using modules, its common for the modules not to be loaded
    until quite late by userland. With the current code,
    driver_deferred_probe_check_state() will stop returning
    EPROBE_DEFER after late_initcall, which can cause module
    dependency resolution to fail after that.
    
    So allow a longer window of 30 seconds (picked somewhat
    arbitrarily, but influenced by the similar regulator core
    timeout value) in the case where modules are enabled.

 drivers/base/dd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

Best regards,

Oliver
