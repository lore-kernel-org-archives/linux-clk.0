Return-Path: <SRS0=IhfR=UZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3C9C4646B
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 03:46:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B095205ED
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 03:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561520801;
	bh=l0sV3wiaJXOEwcEu1BXGGj9r65jtZ9vymvP9nJxOSH4=;
	h=In-Reply-To:References:To:From:Subject:Date:List-ID:From;
	b=h9vAwmjmLK50moqukfMe+d6sC40ydJIE+bNq13v0Kb/5xHooCNmO8dXs5/xR/9Ngz
	 skZa+vtMjKQL0vR5fHzigLPXeCQv3THHk3v+l3cB7clvlvIXZvG1nGwLlnqxA4KXqu
	 zA4VmsAeebVq49t7VXUgWUMcSArMG4RZ4AFk1NiA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbfFZDqk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 23:46:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:58470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728012AbfFZDqj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 23:46:39 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 369CA20659;
        Wed, 26 Jun 2019 03:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561520798;
        bh=l0sV3wiaJXOEwcEu1BXGGj9r65jtZ9vymvP9nJxOSH4=;
        h=In-Reply-To:References:To:From:Subject:Date:From;
        b=J3F19NCJb6TnAKknu+M99cgLhs32wonOcvzLvolY5WS0Ap/sV5POOb2pPwtBCWxfM
         jvl0IK97zvY2DkLBaH3cwOSJItiW1/KZRNSm9MdYQacOw9uWiAzUc8Qprw2PSNNnbX
         RaC2q84bNuCVYo/fBlIND7m4knf/DufGEmnviCcg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1bf34693-a4e9-bbdd-9066-ff5dc5c6ce32@electromag.com.au>
References: <1560484363-77239-1-git-send-email-preid@electromag.com.au> <20190625225453.1BDD020665@mail.kernel.org> <1bf34693-a4e9-bbdd-9066-ff5dc5c6ce32@electromag.com.au>
To:     Phil Reid <preid@electromag.com.au>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/1] clk: clk-cdce925: Add regulator support
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 20:46:37 -0700
Message-Id: <20190626034638.369CA20659@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Phil Reid (2019-06-25 18:06:29)
> On 26/06/2019 06:54, Stephen Boyd wrote:
> > Quoting Phil Reid (2019-06-13 20:52:43)
> >> +               return PTR_ERR(regulator);
> >> +
> >> +       err =3D regulator_enable(regulator);
> >=20
> G'day Stephen,
>=20
> Thanks for looking at this.
> > The regulator is never turned off though. Are these regulators really
> > just always on regulators that don't need to be managed by this driver?
> >=20
> For our system the regulator needs to be enabled before we try talking to=
 the chip.
> Funny that.
> Unloading the driver will disable the regulator thru the devm call to
> cdce925_regulator_disable

Ok. Is it a regulator that is expected to just always be on though? Or
does the datasheet for this device indicate that these supplies can be
turned on and off when the device isn't in use?

>=20
> > +     return devm_add_action_or_reset(dev, cdce925_regulator_disable,
> > +                                     regulator);
> > +}
>=20
> In the future suspend/resume support could be added to power the device d=
own.
> The system I have doesn't support suspending thou.
>=20
> > Also, is there an update to the DT binding somewhere?
> >=20
> No I didn't update that.
> It seems a bit adhoc if supply reference are including in the DT docs.
> I can add something if your happy with the pathc in general.
>=20

Yes, the binding needs an update to list out the supplies. If they're
not always going to be enabled because they're controlled supplies in
the design then it makes sense to me to add them to the binding and use
them from this driver so that things operate properly.

