Return-Path: <SRS0=lEqg=QF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D10C169C4
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jan 2019 22:26:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 276DB20882
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jan 2019 22:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548800764;
	bh=tF26+0dkvPMN82sf8Qh4/qnGwMHETUp+tJzZyT/8RTg=;
	h=Subject:References:Cc:From:In-Reply-To:To:Date:List-ID:From;
	b=hTNbjC08V2PYXvvkP5DCIma3hNoeGJ0RfOCdbzH9MVkSEnH1JRWwIk2UGEwpRZh4J
	 HrnY7vNh7JtIIllj5c5qmsJHZvVUZk1EX42z63ZFlnDEQYfWwBOZZbf3kFX0H35B4Q
	 yoQnflCT1a1HrGcruhXeTdyax/Wn1cj1ezUuRoww=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727342AbfA2W0D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jan 2019 17:26:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:41182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727332AbfA2W0D (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jan 2019 17:26:03 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28BA52087F;
        Tue, 29 Jan 2019 22:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548800762;
        bh=tF26+0dkvPMN82sf8Qh4/qnGwMHETUp+tJzZyT/8RTg=;
        h=Subject:References:Cc:From:In-Reply-To:To:Date:From;
        b=tHrA8hivb7uRmyRqOXgjlsutlNkHqHT6oI9RtkHTN2if0LTPtzY589/RR6InciHnG
         sISqUDmv8zWOO2r/Ol9WukVzPxOIo6mNaYJJmRb3InnA45XZEvpSRxnYSPy8aTB1Gk
         iW0vvShysTjv8nfFjGvOOlpmhOvzf2BYgVwfOCJ4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: Informing common clock framework driver of externally-derived base clock frequency
References: <CGME20190104023702epcas4p4e6b225121db059cb6ed167581c303e92@epcas4p4.samsung.com> <CAP_wsPYwykAPF=aedoHkZnKhLgFdbUNMK7tpFJkhMfr_X2Gnrg@mail.gmail.com> <32a08ee4-3989-3785-88d6-7d215147eba3@samsung.com> <CAP_wsPa5qsuUhDNXWe55612xY-ppytj+jX4+5s-bFxn5BURoTg@mail.gmail.com> <f5d6c493-5e7e-00ec-a547-c952369630c6@samsung.com>
User-Agent: alot/0.8
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <f5d6c493-5e7e-00ec-a547-c952369630c6@samsung.com>
Message-ID: <154880076123.136743.5941772164120864991@swboyd.mtv.corp.google.com>
To:     Jonny Hall <jonny.hall@boxcast.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Date:   Tue, 29 Jan 2019 14:26:01 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sylwester Nawrocki (2019-01-09 06:22:05)
> On 1/4/19 22:29, Jonny Hall wrote:
> > On Fri, Jan 4, 2019 at 4:30 AM Sylwester Nawrocki
> > <s.nawrocki@samsung.com> wrote:
> [...]
> >> On 1/4/19 03:35, Jonny Hall wrote:
> >> [...]
> >>> ... However, in my application, the input frequency of
> >>> the si5342 is not known in advance, is derived from an external
> >>> source, and can change during runtime. The si5342 will need to be
> >>> (re)configured during operation with the frequency of this root clock
> >>> source in order to properly lock onto it and generate the correct
> >>> output frequencies -- it cannot independently determine the input
> >>> frequency, only "locked" / "unlocked" state.  The application software
> >>> (other drivers and usermode application code) will know the input
> >>> clock rate.  I've though of a couple ways to do this:
> >>>
> >>> -Implement the root clock source as an "imaginary" divider where the
> >>> set_rate call actually configures the input dividers of the si5342.
> >>> This approach seems to abuse the common clock framework, as I'm not
> >>> actually *setting* the rate, I'm *informing* the driver of a rate that
> >>> was determined independently.
> >>
> >> It sounds like registering a clk notifier on the si5342 root source cl=
ock
> >> might be a way to go, wouldn't that work for you?
> >> For an example you could have a look at drivers/clk/sunxi-ng/ccu_mux.c.
>=20
> > Maybe my understanding is incorrect, but to me it looks like a
> > notifier (callback registered with clk_notifier_register) is actually
> > the opposite case -- this method would be used by a clock consumer
> > that wants to be notified by the common clock framework that a clock
> > rate has changed (I, as an endpoint, want to know when my clock
> > source, which is controlled by CCF drivers, changes rate).  The use
> > case I'm looking for is when a clock chip needs to be notified by
> > *something else* that something in the system has changed (I, as a
> > clock chip, need to be informed by other parts of the system what my
> > input clock rate is).
>=20
> How about modelling SI5432 input clocks as clock objects? Don't you do it=
=20
> already? These are clocks the SI5432 consumes so would be needed anyway.
> =20
> > To add a bit of clarity to the scenario -- in my use case, the si5342
> > is generating video pixel clocks for video outputs from the system.
> > The inputs of the si5342 are other video pixel clocks, from video
> > inputs to the system.  The parts of the system that are aware of the
> > input clock rates are things like HDMI subsystem drivers and usermode
> > application code.  I need a way to connect these
> > "parts-that-are-aware-of-the-clock-rate" to my si5342 driver so it can
> > properly configure that portion of the si5342 -- preferably within the
> > common clock framework, because on the output side of the si5342, our
> > video output drivers already work with the CCF.
>=20
> Assuming the HDMI receiver is source of the clock, couldn't the HDMI=20
> driver just register a clock and modify its rate according to the HW
> state changes or user ioctls, etc.? The rate is then propagated through
> whole clock tree and any element can get notified about changes.
>=20

It isn't super clear to me still what the scenario is but let me make
some general statements.

1) Try to avoid using clk notifiers. I'd like to get rid of them so new
users is frowned up, but accepted if necessary.

2) The root clk can be variable, it doesn't have to be fixed.

3) Adding a way for drivers to 'inject' a new rate seems weird too. We
already have a way for that to work, just call clk_set_rate() and then
the rate will be propagated down to all child clks during the set_rate
call.

So maybe that means your imaginary divider is the way to go? I'm not
sure, but I would say that whatever is informed about the external clk
input that's changing rate should be the piece of code that calls
clk_set_rate() on the external clk and informs the rest of the clk
children that the rate has changed. If clk drivers need to do something
else when their clk that uses the external clk changes rate, then they
can hook their clk's .set_rate op (basically implementing their own rate
change hook) and do things to keep providing the same rate desired by
whatever is consuming that clk.

Put another way, calling clk_set_rate() on something near the root of
the tree doesn't mean that downstream users should be put into an
inconsistent state. If that use-case isn't working for you we can look
into fixing it, maybe by using the clk rate locking or clk rate
constraint features.

