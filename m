Return-Path: <SRS0=IhfR=UZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6A6C48BD3
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 17:55:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF33F21726
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 17:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561571746;
	bh=uYYE+2xmmJ6VAbTTEa9ncedJrgUwTnScGw/RDgSJMnY=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=J9m04NzPJq2Gq/erZQzdFjAK5rAQ44gXYNSCFD/AwHRbWl67esQc0FUDKSjqJEZrO
	 P85ae8J71HoimtJpB9s03VGcgUE48hEmIEKTPKIOF/32el22ZTjfofHzmc0Qto4YIP
	 P9MY/wVhY4Aqb75UfXA1XWgG9dS9FbFoQSY2/t9Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfFZRzq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jun 2019 13:55:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:47214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726271AbfFZRzq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 26 Jun 2019 13:55:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40B15208E3;
        Wed, 26 Jun 2019 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561571745;
        bh=uYYE+2xmmJ6VAbTTEa9ncedJrgUwTnScGw/RDgSJMnY=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=r1q0xsbUOEXAdi9ST7oAxyxL9fcywDKRltBBbMOamJBKHelPaDZxvtdkhDrn6nonm
         e9DX0Aj6Oi+3dfLeHB/0ph2lf4aS3hlk1yeAgTq3NHsuYD73bjDpDpbpS7W0s1Wh8s
         +EyG6kKjprlKptKS6D+AtRH5RktQH89rhC50eG/M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190626131802.GE54126@ediswmail.ad.cirrus.com>
References: <20190625131053.25407-1-ckeepax@opensource.cirrus.com> <20190625234500.14A052086D@mail.kernel.org> <20190626131802.GE54126@ediswmail.ad.cirrus.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 RESEND] clk: lochnagar: Use new parent_data approach to register clock parents
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        patches@opensource.cirrus.com
User-Agent: alot/0.8.1
Date:   Wed, 26 Jun 2019 10:55:44 -0700
Message-Id: <20190626175545.40B15208E3@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Charles Keepax (2019-06-26 06:18:02)
> On Tue, Jun 25, 2019 at 04:44:59PM -0700, Stephen Boyd wrote:
> > Quoting Charles Keepax (2019-06-25 06:10:53)
> > > -static const char * const lochnagar1_clk_parents[] =3D {
> > > -       "ln-none",
> > > -       "ln-spdif-mclk",
> > > -       "ln-psia1-mclk",
> > > -       "ln-psia2-mclk",
> > > -       "ln-cdc-clkout",
> > > -       "ln-dsp-clkout",
> > > -       "ln-pmic-32k",
> > > -       "ln-gf-mclk1",
> > > -       "ln-gf-mclk3",
> > > -       "ln-gf-mclk2",
> > > -       "ln-gf-mclk4",
> > > +#define LN_PARENT(NAME) { .name =3D NAME, .fw_name =3D NAME }
> > > +
> > > +static const struct clk_parent_data lochnagar1_clk_parents[] =3D {
> > > +       LN_PARENT("ln-none"),
> > > +       LN_PARENT("ln-spdif-mclk"),
> >=20
> > The above two aren't documented in the binding. Is it intentional? I'd
> > like to apply this patch, but I don't want it to use undocumented
> > bindings.
> >=20
>=20
> ln-none is intentionally missing from the binding, it isn't really
> used at the moment, it is really more of a place holder for when
> the clocks are not parented to anything as many will generate a
> clock in that case. Maybe in the future it might be used to allow
> clocks to be put back into that state after being parented but that
> probably requires more thought.

Hmm.. So basically it's a way to configure the clk to have no parent
anymore and not be orphaned but output a clk signal? I'll have to think
about this more but maybe this means we should let clks parent to
themselves to indicate that they're not using anything else to output a
clk signal, i.e. clk_set_parent(clk, clk) would make it a root clk if
it's possible.

>=20
> ln-spdif-mclk should be in the binding though I will do a patch
> to add it. Do you want me to resend this patch as well? Feels
> like this stuff is orthogonal to what this patch is doing.
>=20

A follow-up patch is fine for this. I'll stack it on top and merge it up
to clk-next.

