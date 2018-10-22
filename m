Return-Path: <SRS0=3SWV=NC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304FDC004D3
	for <linux-clk@archiver.kernel.org>; Mon, 22 Oct 2018 15:30:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 16E2B20664
	for <linux-clk@archiver.kernel.org>; Mon, 22 Oct 2018 15:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="N72DjFrK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16E2B20664
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbeJVXtL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Oct 2018 19:49:11 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44557 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728368AbeJVXtK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Oct 2018 19:49:10 -0400
Received: by mail-lf1-f66.google.com with SMTP id m18-v6so30740439lfl.11
        for <linux-clk@vger.kernel.org>; Mon, 22 Oct 2018 08:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=emwnZeCNqDDjL/Nk2ikIdZiZGc/ye4j/fvhFOuYMaco=;
        b=N72DjFrKwV6tbOhH4e15D+KmExRZWEfCqdv6l8opj8DiEsvue5TVQ2M6nHYtgJAMb2
         Bn5+5XFYjFm4qw59lepbTzvj7DaPt1bCVB+kgnImMZs6aEBqs575SJetAgMdB+D7P34S
         otQmE6mh/OR02L6bGhnPNvmfxNhzEdtdSbMjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=emwnZeCNqDDjL/Nk2ikIdZiZGc/ye4j/fvhFOuYMaco=;
        b=NrbtANUVbCRl7k5GWh3HJoFYZqoTHgjll9/dIS7svZsBpKf9+b8GoTDV7sRx2aiJZO
         5a25+R80xpRWtVbH5A5KaMiLBVENibpqRAm1hyq+bVheUkWftU6A7Dz4G9OWbs1Jw8In
         mDvFdLrpzaLHXA3RcSnzVqr2MP9NLooR/iaUUMJE6GXTAmISEuBh6nEHhEnKLRIrzRn+
         pQ/zh/vEiL67sOQ8/nkI8LGiWP/9rK27o+154fZzCQVQMApf3LoVttS3WYAxJV5flYPo
         ZDOcDR27x2wvC08dE1+HkSA8+Egk6XoJ0v4/YBR7EYL3eHBq+Mgioz68YxevxhXxjOna
         ttyQ==
X-Gm-Message-State: ABuFfoiXn0YSgppZq0fpn0rA1NHRuk2+wn3aukSGjUBtXL9oOOepSRay
        r0/yfq9JNpmc9I+8O7E4CuNwaQ==
X-Google-Smtp-Source: ACcGV60hWQXVQa/gUiVl+8fzcTeY50+Bb7IcRFneAdAEpIdPGj+FJXP7tBFvW6IRPQ/KKieXoHi/Wg==
X-Received: by 2002:a19:750e:: with SMTP id y14-v6mr5437951lfe.43.1540222208969;
        Mon, 22 Oct 2018 08:30:08 -0700 (PDT)
Received: from centauri.lan (h-229-118.A785.priv.bahnhof.se. [5.150.229.118])
        by smtp.gmail.com with ESMTPSA id q24-v6sm653336lff.65.2018.10.22.08.30.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Oct 2018 08:30:08 -0700 (PDT)
Date:   Mon, 22 Oct 2018 17:30:05 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Craig <ctatlor97@gmail.com>,
        andy.gross@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux@arm.linux.org.uk,
        linux@armlinux.org.uk, mark.rutland@arm.com,
        mturquette@baylibre.com, rjw@rjwysocki.net, robh@kernel.org,
        sboyd@codeaurora.org, sudeep.holla@arm.com,
        thierry.escande@linaro.org, viresh.kumar@linaro.org
Subject: Re: [PATCH V12 00/14] Krait clocks + Krait CPUfreq
Message-ID: <20181022153005.GA23950@centauri.lan>
References: <1534248753-2440-1-git-send-email-sricharan@codeaurora.org>
 <2ae96741-94c0-ba4c-fc19-05d33179683c@codeaurora.org>
 <d682580d-5070-0271-197f-29d988172937@codeaurora.org>
 <D8FC68C0-2572-4A86-81D9-D0099D314A45@gmail.com>
 <F5A89365-C613-4FE2-AD32-DC0AC6DF380B@gmail.com>
 <fb81b8d5-3d24-b413-8d59-33cb70e46f8b@codeaurora.org>
 <153979105280.5275.841088095583550635@swboyd.mtv.corp.google.com>
 <153980741313.5275.10376918222904341760@swboyd.mtv.corp.google.com>
 <c5f492c0-19a2-db8f-a114-d3cfe17ae6c6@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5f492c0-19a2-db8f-a114-d3cfe17ae6c6@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 22, 2018 at 09:39:03AM +0530, Sricharan R wrote:
> Hi Stephen,
> 
> On 10/18/2018 1:46 AM, Stephen Boyd wrote:
> > Quoting Stephen Boyd (2018-10-17 08:44:12)
> >> Quoting Sricharan R (2018-09-20 06:03:31)
> >>>
> >>>
> >>> On 9/20/2018 1:54 AM, Craig wrote:
> >>>> Yup, this patch seems to have fixed the higher frequencies from the quick test I did.
> >>>>
> >>>       Thanks !!. Can i take that as 
> >>>           Tested-by: Craig Tatlor <ctatlor97@gmail.com>  ?
> >>>
> >>
> >> Is this patch series going to be resent?
> >>
> > 
> > Nevermind. Looking at it I think I can apply all the clk ones and we're
> > good to go. If you can send a followup patch series to change the
> > registration and provider APIs to be clk_hw instead of clk based I would
> > appreciate it.
> > 
> 
> Sorry for the late response. Was away.
> Only pending thing was separating out the binding documentation for the cpu-freq
> driver and fixing the text in documentation.  That means, yes its fine to merge
> the clk ones as you said. I will resend that. Also, will send a follow up series for clk_hw to
> clk change as you mentioned separately.

Hello Sricharan,

Great to see that the clk parts has been marged to clk-next!

Are you also planning on sending out a new version of the cpufreq driver
consolidation parts?

I'm planning on extending your consilidated cpufreq driver with support
for msm8916 (Cortex-A53), where I plan to read PVS/speedbin, in order to
set opp_supported_hw(), and also register with cpufreq (since Viresh/Ulf
suggested that we shouldn't register with cpufreq in the CPR power-domain
driver).


Kind regards,
Niklas
