Return-Path: <SRS0=lNOc=M4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96795C04EBD
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 15:37:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EAA2208E4
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 15:37:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="w7JjIL1Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EAA2208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbeJPX2L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Oct 2018 19:28:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:45150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbeJPX2L (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Oct 2018 19:28:11 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4D8B20881;
        Tue, 16 Oct 2018 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539704231;
        bh=hQ37OYdjansv879QImf7ruiWk7Rxq3P2lmE3IE22bsA=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=w7JjIL1YEiCLY/ML2Q5m+ygDk4ViZx2NwV+HsPRWjtG41FuQ4Ps/pGxHiWVo4CDLC
         xIyBiCQPRrJb2tHgo5+shHdqgVEfsaQz9mT3tjlaSzpgqbUH6MfIW+BBP7b016LtrX
         F9r8SAEAo1VrH5pDLsM+7KOS8mU6CA89KdgXw7Oo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Rob Herring <robh+dt@kernel.org>, Tero Kristo <t-kristo@ti.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <e886fb85-c857-5aec-d1e2-5c428be9c059@ti.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
References: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
 <1535728027-24573-5-git-send-email-t-kristo@ti.com>
 <153937953037.5275.784660292030040696@swboyd.mtv.corp.google.com>
 <CAL_Jsq+68yemY+6qxv7DrfHkdqiCQTOuCiLBtrWgYE+CPd1iGQ@mail.gmail.com>
 <153938180944.5275.885829910555690983@swboyd.mtv.corp.google.com>
 <7163c8e6-9bd5-194c-c6f9-4ecfe83a214d@ti.com>
 <153964669678.5275.18141587800966295694@swboyd.mtv.corp.google.com>
 <e886fb85-c857-5aec-d1e2-5c428be9c059@ti.com>
Message-ID: <153970423020.5275.7771549930550361343@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 04/11] clk: ti: clkctrl: support multiple clkctrl nodes under a
 cm node
Date:   Tue, 16 Oct 2018 08:37:10 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2018-10-16 00:37:06)
> On 16/10/18 02:38, Stephen Boyd wrote:
> >                       return;
> > @@ -531,10 +530,9 @@ static void __init _ti_omap4_clkctrl_setup(struct =
device_node *node)
> >                * Create default clkdm name, replace _cm from end of par=
ent
> >                * node name with _clkdm
> >                */
> > -             strcpy(provider->clkdm_name, node->parent->name);
> > -             provider->clkdm_name[strlen(provider->clkdm_name) - 2] =
=3D 0;
> > +             provider->clkdm_name[strlen(provider->clkdm_name) - 5] =
=3D 0;
> >       } else {
> > -             provider->clkdm_name =3D kmalloc(strlen(node->name), GFP_=
KERNEL);
> > +             provider->clkdm_name =3D kasprintf(GFP_KERNEL, "%pOFn", n=
ode->name);
> =

> should be:
> =

>   +             provider->clkdm_name =3D kasprintf(GFP_KERNEL, "%pOFn", n=
ode);
> =

> ...instead right?
> =


Yes. Thanks for catching it!

