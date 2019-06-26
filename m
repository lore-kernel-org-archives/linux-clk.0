Return-Path: <SRS0=IhfR=UZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DB0C4646B
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 04:10:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14AF62086D
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 04:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561522207;
	bh=kGqJvIR6OnIpZmAdKpB2ktVpJ2v8JLZ7WNAfGpZrrak=;
	h=In-Reply-To:References:To:From:Subject:Date:List-ID:From;
	b=1lv3PPskpJMeHp8iHp62xLRnOhdniJaa8tlp1p9xxTwIaWJudQXItjx+om95N6l99
	 vM0fjCRfzxIFY9aNSEl2gRLJw/NWFcrgFH8b40xVo1/hbPYuTCusyGxHITH0lxqrES
	 bdoJfL+6uZ7l4OZBpM+N6asm0NDqVFPyZECvx0R8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbfFZEKG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jun 2019 00:10:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:57102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725804AbfFZEKG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 26 Jun 2019 00:10:06 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6496220645;
        Wed, 26 Jun 2019 04:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561522205;
        bh=kGqJvIR6OnIpZmAdKpB2ktVpJ2v8JLZ7WNAfGpZrrak=;
        h=In-Reply-To:References:To:From:Subject:Date:From;
        b=TPUH+CDrtUS4w6plelkaR1gAwSe3IeqBY08Lh1kijIUt4PE5Y9B21bd2vEPHsE8jH
         1exX9424x2oblQn58qVcqpVublh6lMbxN4s9UtmMjARPwkBeQ+DwRr8zQUNAwvyj6P
         C92TjNAv0fmqTCLwAeGTojPy2jaBHsgfvrsbfGbY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7bc0046c-d66e-a614-5eee-59a1e72de050@electromag.com.au>
References: <1560484363-77239-1-git-send-email-preid@electromag.com.au> <20190625225453.1BDD020665@mail.kernel.org> <1bf34693-a4e9-bbdd-9066-ff5dc5c6ce32@electromag.com.au> <20190626034638.369CA20659@mail.kernel.org> <7bc0046c-d66e-a614-5eee-59a1e72de050@electromag.com.au>
To:     Phil Reid <preid@electromag.com.au>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/1] clk: clk-cdce925: Add regulator support
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 21:10:04 -0700
Message-Id: <20190626041005.6496220645@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Phil Reid (2019-06-25 21:03:20)
> On 26/06/2019 11:46, Stephen Boyd wrote:
> > Quoting Phil Reid (2019-06-25 18:06:29)
> >> On 26/06/2019 06:54, Stephen Boyd wrote:
> >>> Quoting Phil Reid (2019-06-13 20:52:43)
> >>>> +               return PTR_ERR(regulator);
> >>>> +
> >>>> +       err =3D regulator_enable(regulator);
> >>>
> >> G'day Stephen,
> >>
> >> Thanks for looking at this.
> >>> The regulator is never turned off though. Are these regulators really
> >>> just always on regulators that don't need to be managed by this drive=
r?
> >>>
> >> For our system the regulator needs to be enabled before we try talking=
 to the chip.
> >> Funny that.
> >> Unloading the driver will disable the regulator thru the devm call to
> >> cdce925_regulator_disable
> >=20
> > Ok. Is it a regulator that is expected to just always be on though? Or
> > does the datasheet for this device indicate that these supplies can be
> > turned on and off when the device isn't in use?
>=20
> Sorry I'm not understanding what your asking.
> Should we be using some other method to ensure there is power to this dev=
ice
> before probingHow do I then ensure the dependency to that power supply?

No, I'm not an expert in this clk driver so I have no idea if this is
some sort of supply that is typically always on or if software is
expected to manage the regulator at runtime. I'm just asking to make
sure that your use case requires this be managed at runtime instead of
turned on immediately when the regulator driver probes and left on
forever.

>=20
> I can't see why that part of the system can't be shut down, provided that=
 inputs
> are also isolated correctly when the regulator is disabled etc.
> The data sheet says that input can execeed VDD / VDDOUT provide
> clamp current ratings are observed.
>=20
> It is also seems permissible to disable Vddout independently of Vdd (for =
some variants).

Sounds like it's all fine then. Just document it in the binding and it
should be fine to add.

