Return-Path: <SRS0=EEPi=MY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4A1C6787C
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 21:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E7612098A
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 21:45:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="auHiUFqB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E7612098A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbeJMFTv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 13 Oct 2018 01:19:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:45050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725755AbeJMFTv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 13 Oct 2018 01:19:51 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A197C2098A;
        Fri, 12 Oct 2018 21:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539380724;
        bh=nhqvnY0wtcw9dTQ1ALJF0yfKzxS5noHHhC8Qfj7mqsg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=auHiUFqBz1QvJWy/vhePIlWCGX9Cw3T6uoFhVARu5kEckc1CRmJzpde57tWa7HgYH
         ucqYkemXS8fIzPtZ19XcVK7Por9FVE6I/uWgmfZsYWFXYCZtgtQ/p1s9zBBYra20j7
         aAeFGI35boJxWqPD78OBMflq16KDdw4DP59IF9C8=
Received: by mail-qt1-f172.google.com with SMTP id q40-v6so15457701qte.0;
        Fri, 12 Oct 2018 14:45:24 -0700 (PDT)
X-Gm-Message-State: ABuFfoixbux5ezfu6gQTjwJJXdjZXPXfQJMDu/YmLfVDh1LU01cSzwRM
        vL8h0kKKwJpfKHoW7H66it3p9mwDzz7Y2OmtSA==
X-Google-Smtp-Source: ACcGV61Wopblcur4VgKvgpcYUKFpuVv61FiHGYADFpZ8N7rVu//Om7GWxt5r9PDPgCjAA5QzvO9bMqMuWzk4R9MyI/0=
X-Received: by 2002:aed:3ec2:: with SMTP id o2-v6mr7394374qtf.26.1539380723887;
 Fri, 12 Oct 2018 14:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
 <1535728027-24573-5-git-send-email-t-kristo@ti.com> <153937953037.5275.784660292030040696@swboyd.mtv.corp.google.com>
In-Reply-To: <153937953037.5275.784660292030040696@swboyd.mtv.corp.google.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 12 Oct 2018 16:45:08 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+68yemY+6qxv7DrfHkdqiCQTOuCiLBtrWgYE+CPd1iGQ@mail.gmail.com>
Message-ID: <CAL_Jsq+68yemY+6qxv7DrfHkdqiCQTOuCiLBtrWgYE+CPd1iGQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] clk: ti: clkctrl: support multiple clkctrl nodes
 under a cm node
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Oct 12, 2018 at 4:25 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Tero Kristo (2018-08-31 08:07:00)
> > @@ -492,19 +501,35 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
> >
> >         provider->base = of_iomap(node, 0);
> >
> > -       provider->clkdm_name = kmalloc(strlen(node->parent->name) + 3,
> > -                                      GFP_KERNEL);
> > -       if (!provider->clkdm_name) {
> > -               kfree(provider);
> > -               return;
> > +       if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) {
> > +               provider->clkdm_name = kmalloc(strlen(node->parent->name) + 3,
> > +                                              GFP_KERNEL);
> > +               if (!provider->clkdm_name) {
> > +                       kfree(provider);
> > +                       return;
> > +               }
> > +
> > +               /*
> > +                * Create default clkdm name, replace _cm from end of parent
> > +                * node name with _clkdm
> > +                */
> > +               strcpy(provider->clkdm_name, node->parent->name);

kasprintf can replace kmalloc, strlen and strcpy here and remove the
direct access of .name in the process.

> > +               provider->clkdm_name[strlen(provider->clkdm_name) - 2] = 0;
> > +       } else {
> > +               provider->clkdm_name = kmalloc(strlen(node->name), GFP_KERNEL);
> > +               if (!provider->clkdm_name) {
> > +                       kfree(provider);
> > +                       return;
> > +               }
> > +
> > +               /*
> > +                * Create default clkdm name, replace _clkctrl from end of
> > +                * node name with _clkdm
> > +                */
> > +               strcpy(provider->clkdm_name, node->name);

and here.

> > +               provider->clkdm_name[strlen(provider->clkdm_name) - 7] = 0;
> >         }
> >
>
> This conflicts with Rob's change so I tried to fix it up. Let me know if
> something is horribly wrong with it. I suspect Rob will need to figure
> out how to make node::name usage go away again, but I put it back.

Then I don't have to find and fix. :)

Rob
