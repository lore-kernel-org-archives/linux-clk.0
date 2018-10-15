Return-Path: <SRS0=3y70=M3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB7FC04EB9
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 23:38:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B84CD2098A
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 23:38:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTHYDfcy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B84CD2098A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbeJPHZs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Oct 2018 03:25:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:39258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726917AbeJPHZs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Oct 2018 03:25:48 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 778A1208D9;
        Mon, 15 Oct 2018 23:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539646697;
        bh=iDgnuzwimAzJHp0OlL2VOlANFenNPRoZ6HcfOmvmLxw=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=tTHYDfcy2oCarXPH/fcZhxefNMBFHa8FFMi+DqoIaGXjnb9tDzq0eEmvCm9iBqKE1
         ctjiOHR7ux6bg0bKnMYy7fzl8XKYVBn3R4ndQ+p5ZCmMELH4bBpCuiwqy0tayj6FPv
         YSYhjbFw8Xsq4WVxF+wyD7j6du6spRKI5cnEpHtU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Rob Herring <robh+dt@kernel.org>, Tero Kristo <t-kristo@ti.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <7163c8e6-9bd5-194c-c6f9-4ecfe83a214d@ti.com>
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
Message-ID: <153964669678.5275.18141587800966295694@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 04/11] clk: ti: clkctrl: support multiple clkctrl nodes under a
 cm node
Date:   Mon, 15 Oct 2018 16:38:16 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2018-10-15 08:58:21)
> On 13/10/18 01:03, Stephen Boyd wrote:
> > Quoting Rob Herring (2018-10-12 14:45:08)
> >> On Fri, Oct 12, 2018 at 4:25 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >>>
> >>> Quoting Tero Kristo (2018-08-31 08:07:00)
> >>>> @@ -492,19 +501,35 @@ static void __init _ti_omap4_clkctrl_setup(str=
uct device_node *node)
> >>>>
> >>>>          provider->base =3D of_iomap(node, 0);
> >>>>
> >>>> -       provider->clkdm_name =3D kmalloc(strlen(node->parent->name) =
+ 3,
> >>>> -                                      GFP_KERNEL);
> >>>> -       if (!provider->clkdm_name) {
> >>>> -               kfree(provider);
> >>>> -               return;
> >>>> +       if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) {
> >>>> +               provider->clkdm_name =3D kmalloc(strlen(node->parent=
->name) + 3,
> >>>> +                                              GFP_KERNEL);
> >>>> +               if (!provider->clkdm_name) {
> >>>> +                       kfree(provider);
> >>>> +                       return;
> >>>> +               }
> >>>> +
> >>>> +               /*
> >>>> +                * Create default clkdm name, replace _cm from end o=
f parent
> >>>> +                * node name with _clkdm
> >>>> +                */
> >>>> +               strcpy(provider->clkdm_name, node->parent->name);
> >>
> >> kasprintf can replace kmalloc, strlen and strcpy here and remove the
> >> direct access of .name in the process.
> >>
> >>>> +               provider->clkdm_name[strlen(provider->clkdm_name) - =
2] =3D 0;
> >>>> +       } else {
> >>>> +               provider->clkdm_name =3D kmalloc(strlen(node->name),=
 GFP_KERNEL);
> >>>> +               if (!provider->clkdm_name) {
> >>>> +                       kfree(provider);
> >>>> +                       return;
> >>>> +               }
> >>>> +
> >>>> +               /*
> >>>> +                * Create default clkdm name, replace _clkctrl from =
end of
> >>>> +                * node name with _clkdm
> >>>> +                */
> >>>> +               strcpy(provider->clkdm_name, node->name);
> >>
> >> and here.
> >>
> >>>> +               provider->clkdm_name[strlen(provider->clkdm_name) - =
7] =3D 0;
> >>>>          }
> >>>>
> >>>
> >>> This conflicts with Rob's change so I tried to fix it up. Let me know=
 if
> >>> something is horribly wrong with it. I suspect Rob will need to figure
> >>> out how to make node::name usage go away again, but I put it back.
> >>
> >> Then I don't have to find and fix. :)
> >>
> > =

> > Can you send a patch? Otherwise I will try and fix this up tomorrow.
> > You can use this git tree for reference:
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-ti
> > =

> =

> Sorry, I've also been OoO for last week, just captured this.
> =

> Do you need help on this one? I can take a look at it tomorrow if there =

> is a specific merge conflict you want me to take a look at.

This is what I got:

----8<---
diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 955f2e26ab00..78deca44789d 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -520,8 +520,7 @@ static void __init _ti_omap4_clkctrl_setup(struct devic=
e_node *node)
 	provider->base =3D of_iomap(node, 0);
 =

 	if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) {
-		provider->clkdm_name =3D kmalloc(strlen(node->parent->name) + 3,
-					       GFP_KERNEL);
+		provider->clkdm_name =3D kasprintf(GFP_KERNEL, "%pOFn%s", node->parent, =
"xxx");
 		if (!provider->clkdm_name) {
 			kfree(provider);
 			return;
@@ -531,10 +530,9 @@ static void __init _ti_omap4_clkctrl_setup(struct devi=
ce_node *node)
 		 * Create default clkdm name, replace _cm from end of parent
 		 * node name with _clkdm
 		 */
-		strcpy(provider->clkdm_name, node->parent->name);
-		provider->clkdm_name[strlen(provider->clkdm_name) - 2] =3D 0;
+		provider->clkdm_name[strlen(provider->clkdm_name) - 5] =3D 0;
 	} else {
-		provider->clkdm_name =3D kmalloc(strlen(node->name), GFP_KERNEL);
+		provider->clkdm_name =3D kasprintf(GFP_KERNEL, "%pOFn", node->name); =

 		if (!provider->clkdm_name) {
 			kfree(provider);
 			return;
@@ -544,7 +542,6 @@ static void __init _ti_omap4_clkctrl_setup(struct devic=
e_node *node)
 		 * Create default clkdm name, replace _clkctrl from end of
 		 * node name with _clkdm
 		 */
-		strcpy(provider->clkdm_name, node->name);
 		provider->clkdm_name[strlen(provider->clkdm_name) - 7] =3D 0;
 	}
=20
