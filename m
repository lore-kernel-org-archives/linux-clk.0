Return-Path: <SRS0=EEPi=MY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B262DC6787C
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 21:25:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7553B20865
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 21:25:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnfFaJun"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7553B20865
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbeJME7y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 13 Oct 2018 00:59:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:35652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbeJME7y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 13 Oct 2018 00:59:54 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 180F12075B;
        Fri, 12 Oct 2018 21:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539379531;
        bh=qCRcfVfdkpcRtKk7QmfPxQl6VHCEmMqEpb01j2NM4Wg=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=RnfFaJunmdAlRpL+vasX+mbfVDHX/+Fn7YqsmrkvskCZH60yVAyJfbfRF8YO0qcMt
         Yj6yPHcwdGilr55LZd0kFmNxjcQclCdOghfzqrU/afob6TX9a6AbNRMqSi0AXFLShN
         7PxWM7rX1k4n3SBYQZMd6oNhi0RqZ5Ll/H6UgADg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1535728027-24573-5-git-send-email-t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com
References: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
 <1535728027-24573-5-git-send-email-t-kristo@ti.com>
Message-ID: <153937953037.5275.784660292030040696@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 04/11] clk: ti: clkctrl: support multiple clkctrl nodes under a
 cm node
Date:   Fri, 12 Oct 2018 14:25:30 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2018-08-31 08:07:00)
> @@ -492,19 +501,35 @@ static void __init _ti_omap4_clkctrl_setup(struct d=
evice_node *node)
>  =

>         provider->base =3D of_iomap(node, 0);
>  =

> -       provider->clkdm_name =3D kmalloc(strlen(node->parent->name) + 3,
> -                                      GFP_KERNEL);
> -       if (!provider->clkdm_name) {
> -               kfree(provider);
> -               return;
> +       if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) {
> +               provider->clkdm_name =3D kmalloc(strlen(node->parent->nam=
e) + 3,
> +                                              GFP_KERNEL);
> +               if (!provider->clkdm_name) {
> +                       kfree(provider);
> +                       return;
> +               }
> +
> +               /*
> +                * Create default clkdm name, replace _cm from end of par=
ent
> +                * node name with _clkdm
> +                */
> +               strcpy(provider->clkdm_name, node->parent->name);
> +               provider->clkdm_name[strlen(provider->clkdm_name) - 2] =
=3D 0;
> +       } else {
> +               provider->clkdm_name =3D kmalloc(strlen(node->name), GFP_=
KERNEL);
> +               if (!provider->clkdm_name) {
> +                       kfree(provider);
> +                       return;
> +               }
> +
> +               /*
> +                * Create default clkdm name, replace _clkctrl from end of
> +                * node name with _clkdm
> +                */
> +               strcpy(provider->clkdm_name, node->name);
> +               provider->clkdm_name[strlen(provider->clkdm_name) - 7] =
=3D 0;
>         }
>  =


This conflicts with Rob's change so I tried to fix it up. Let me know if
something is horribly wrong with it. I suspect Rob will need to figure
out how to make node::name usage go away again, but I put it back.

