Return-Path: <SRS0=O2Di=ZJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11EDC432C0
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:25:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7ED322075E
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:25:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTPNBukB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbfKQMZb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:25:31 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:43589 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfKQMZa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 17 Nov 2019 07:25:30 -0500
Received: by mail-il1-f196.google.com with SMTP id r9so13380771ilq.10
        for <linux-clk@vger.kernel.org>; Sun, 17 Nov 2019 04:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=otVcrBVD6kjervULINmD8GBHaxPZhxqsRUnWTrQKkSY=;
        b=pTPNBukBWYo4Q2L4Zp7zlZrqL66vQNhxLavP6cZ5mBxYiJffto17JjlItsSKXd5XeM
         4wyzThgCgdvUCLHxVluqUOM0fWUkjY4BrrpG1xcPo9xJ54KCwZP4PnYHJgjOwgzMSBZc
         BuzUyXtzCfmWvHGFt8tbMxqGs+QSiWgwnPNhy1VO3dWMMYtboz3Uw5x8FTBFhUJnqsKd
         lYND8CXWbooXe48diEjmnStgwvlBN2crwtlc+kJEmzAF4LlLNhG+d+prtRwl4TKmG/sc
         IqucQnG0btgeNo8jePb+/SxGrp1wJL70zfDAyTU2cTLgjSYTTELGeCMPY9n2dRicvCnp
         IcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=otVcrBVD6kjervULINmD8GBHaxPZhxqsRUnWTrQKkSY=;
        b=ohPezT5Fjxt8CU9eQE1dt6PTbRBw+/G1oHGSP+6WCpAQaA1/8hyFhGon6XryKUeh5L
         S8Xa64bcVuoWU3650LlO94DaL9EpZNaUP4lMWvcW4Axic22w1Pa9WofRfTcYOjnMO46y
         dSU8bZ0Eg2lYUX7EQHfk8ldhxw+WHDhp+Yacij9ISdVgH/+/4woSlJArTaV313GGDF9X
         jYj6T9FWEhNvRo8oM4d/35htHhrbJ9PfbOa5KQlqQMd96nSsP97myyL9keNLnlSJ0juO
         CqSjVamfp8303NTkRxJCFvUdCZqjD6zQmY05kyy9cvhsg3WHflPDsUMNpwHj/jBfefoB
         DnQg==
X-Gm-Message-State: APjAAAVOngvXLYka9rab+nZIEc5JSAT84w9KganrobCgIoVGgKPupjFE
        zcQNS1AZBGjMxiKDq50q5WjAYxHlj34GqANVt5I=
X-Google-Smtp-Source: APXvYqyM8OwMh+6orHmLf30C/l96ukGK50y0qYYCtd/JnP/de2oemLWGF5bzXkzsmOxp/jVwbDgy0xDzUGeSY3twpkk=
X-Received: by 2002:a92:35dd:: with SMTP id c90mr9988284ilf.191.1573993529990;
 Sun, 17 Nov 2019 04:25:29 -0800 (PST)
MIME-Version: 1.0
References: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com> <20191114122228.GI4147@optiplex>
In-Reply-To: <20191114122228.GI4147@optiplex>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Sun, 17 Nov 2019 20:14:29 +0800
Message-ID: <CAA+hA=R3yhO+oupTfc=cy3oNTcv28VhzTs7fg9kGYuE0j4s1vQ@mail.gmail.com>
Subject: Re: [PATCH V5 00/11] clk: imx8: add new clock binding for better pm support
To:     Oliver Graute <oliver.graute@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Nov 14, 2019 at 8:22 PM Oliver Graute <oliver.graute@gmail.com> wrote:
>
> On 09/09/19, Dong Aisheng wrote:
> > This is a follow up of this patch series.
> > https://patchwork.kernel.org/cover/10924029/
> > [V2,0/2] clk: imx: scu: add parsing clocks from device tree support
> Hello Aisheng,
>
> will there be an updated version of this two patch series for recent
> linux-next? Then I can test it on my two imx8qm boards.
>

Yes, i prepared them already.
Will send you in private email cause i don't have a public git.

Regards
Aisheng

> Best regards,
>
> Oliver
