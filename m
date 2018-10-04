Return-Path: <SRS0=t8U+=MQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DCFC00449
	for <linux-clk@archiver.kernel.org>; Thu,  4 Oct 2018 00:37:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D659420856
	for <linux-clk@archiver.kernel.org>; Thu,  4 Oct 2018 00:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="G2CJuMXt";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="jjKcT5Hh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D659420856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbeJDH2k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Oct 2018 03:28:40 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39488 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbeJDH2k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Oct 2018 03:28:40 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7E97760C67; Thu,  4 Oct 2018 00:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1538613476;
        bh=HHM4PmLNCqAqOA/Gdm6Dm6WR7BXZUkrzDHnHi5KQDq8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=G2CJuMXtZfvL6glkP70ijvGVEQCs5OKeRvcnt1RRgPMUTFg6zxM+c1eOAP9XpEpzw
         gGR0rK1pqJJ0Z1XAWS441fuc1f2/Y1Cgj0Sn1xSH067MH1eVgwF/0oBZWsG3EqkVzj
         2E/DXISET67QIm0eksLeRRXocSbYp+j50Ha9zR8M=
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 6C4B460C61;
        Thu,  4 Oct 2018 00:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1538613474;
        bh=HHM4PmLNCqAqOA/Gdm6Dm6WR7BXZUkrzDHnHi5KQDq8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jjKcT5Hh0pZIqaIXn6l8HerKkBSMeKv3x8ji6qfBtU+8ANus8ewEClE4BSVqzBV8q
         OjPw/ltVhNj+R6bTeAKU20kNh0QlS4cISxFeSSx05SSXL4KdtYDpd1aJu056Ao+et9
         oy52IQu6FwUIsawsIQU47yCOIVWePdK2NjdC4fZI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 03 Oct 2018 17:37:54 -0700
From:   Graham Roff <grahamr@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Amit Nischal <anischal@codeaurora.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        linux-clk-owner@vger.kernel.org
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
Organization: Qualcomm Technologies Inc.
In-Reply-To: <20181001190037.30477.54878@harbor.lan>
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
 <20180723082641.GJ1636@tbergstrom-lnx.Nvidia.com>
 <153247347784.48062.15923823598346148594@swboyd.mtv.corp.google.com>
 <20180725054400.96956.13278@harbor.lan>
 <20180725112702.GN1636@tbergstrom-lnx.Nvidia.com>
 <CAPDyKFqHNOc-KHcA-LGpyScZ54rsa-FWgJihStgW6sPmXgw07A@mail.gmail.com>
 <83d6a10252e7238f326e378957f2ff70@codeaurora.org>
 <CAPDyKFrthH5djDN=Ves0VK4GpSVWQrerqc-JC6EAkJz4U_nGQw@mail.gmail.com>
 <20180918230023.67076.42969@harbor.lan>
 <8495bbcc9fcdafde536e61459f2cb814@codeaurora.org>
 <20181001190037.30477.54878@harbor.lan>
Message-ID: <6a4089d37c0b7fdad080a5968ea1d540@codeaurora.org>
X-Sender: grahamr@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2018-10-01 12:00, Michael Turquette wrote:
> Quoting grahamr@codeaurora.org (2018-09-25 14:26:25)
>> On 2018-09-18 16:00, Michael Turquette wrote:
>> > Quoting Ulf Hansson (2018-08-23 06:20:11)
>> >> On 31 July 2018 at 22:02,  <grahamr@codeaurora.org> wrote:
>> >> > I have two significant concerns with using a wrapper framework to support
>> >> > DVFS.  The first may be Qualcomm-specific, and more of a practical concern
>> >> > rather than a principled one.  We (clock driver owners) get
>> >> > voltage/frequency operating points from the clock controller designers in a
>> >> > single data-set, it is not information that is provided to or coming from
>> >> > the clock consumer hardware or software teams.  Tracking, updating, and
>> >> > debugging frequency/voltage mismatches falls completely into the clock team,
>> >> > so moving the responsibility of handling the relationship in code to the
>> >> > consumer would be a disaster (SDM845 has almost 200 clock domains and over
>> >> > 800 clock branches - not all controlled by Linux but a large proportion
>> >> > are).  It would mean all clock consumers using any clk_set_rate or
>> >> > clk_enable APIs would need to make the appropriate voltage requests as well
>> >> > - and even if they could look up the required voltage based on frequency
>> >> > from some central location (which I expect would be delivered and maintained
>> >> > by the clock driver team) the chance that everyone would do that correctly
>> >> > is, frankly, zero.  The types of problems that arise from under-volting a
>> >> > clock generator or consumer are very hard to debug (since it can essentially
>> >> > result in random behavior).
>> >>
>> >> Okay, I see.
>> >>
>> >> Wouldn't a nice script that does a search/replace work out? :-)
>> >>
>> >> >
>> >> > My second concern is that we do have voltage requirements coming from the
>> >> > clock controller itself, not related to the clock consumer.  The clock
>> >> > hardware components themselves (PLLs, muxes, etc) require voltage levels
>> >> > that may differ from that of the final consumer of the output clock.  We
>> >> > could hack all these requirements into the frequency/voltage tuple table
>> >> > that consumers look up, but at that point we have diverged fairly
>> >> > dramatically from Stephen's principle that the clock framework should not
>> >> > directly require any voltage - fundamentally they do (at least ours do).
>> >>
>> >> This changes my view, as I didn't know about these kind of cases.
>> >>
>> >> First, it seems like you need to associate a struct device with the
>> >> clock controller, such that it can be attached to its corresponding PM
>> >> domain (genpd). Of course, then you also needs to deploy runtime PM
>> >> support for the clock driver for this clock controller device. Do note
>> >> that runtime PM is already supported by the clock core, so should be
>> >> trivial. Why, because this is needed to properly allow genpd to
>> >> aggregates the votes for the PM domain(s), in case there are other
>> >> devices in the same PM domain (or if there are dependencies to
>> >> subdomains).
>> >
>> > Your struct device can be considered as Done. Stephen and I have been
>> > forcing clock driver authors to write proper platform drivers for a
>> > while now.
>> >
>> >>
>> >> Also, if I am not mistaken, the runtime PM enablement is something
>> >> that is already being used (or at least tried out) for some Exynos
>> >> clock drivers. I recall there were some discussions around locking
>> >> issues around the runtime PM support in the clock core. Let me see if
>> >> can search the mail archive to see if I find out if/what went wrong, I
>> >> will come back to this.
>> >
>> > This was mostly related to idle power management issues, but yes there
>> > is some basic runtime pm awareness in the clock framework.
>> >
>> >>
>> >> Anyway, in regards to control the performance state for these clock
>> >> controller devices, to me it seems like there are no other way, but
>> >> explicitly allow clock drivers to call an "OPP API" to request a
>> >> performance state. Simply, because it's the clock driver that needs
>> >> the performance state for its device. Whether the "OPP API" is the
>> >> new, dev_pm_genpd_set_performance_state() or something not even
>> >> invented yet, is another question.
>> >
>> > I completely agree, with the exception that I don't think it will be an
>> > "OPP API" but instead I hope it will be some runtime pm performance
>> > api.
>> 
>> If we allow the clock framework to use runtime pm to request 
>> performance
>> levels for its own voltage requirements, what is the real difference 
>> in
>> having it cover all voltage requirements based on the chosen clock
>> frequency/state (because on/off affect the voltage requirement as well
>> as the rate)?
> 
> I had to re-read this a dozen times. At first I thought you were
> challenging the idea that a clock provider should act like a voltage
> consumer (in the case where the clock generator has performance
> requirements of its own).
> 
> But now I think that you're asking: why can't the clock provider driver
> know everything about how the soc is integrated and set the voltage
> based on the whole clock tree, thus sparing the consumer drivers having
> to think about their voltage at all. Do I have that right?

In a sense that is what I'm asking, but not as a request for any 
additional framework support - just as how a vendor could set up their 
performance states for the clock controller itself.
As we have discussed, the clock controller needs to itself be a consumer 
of performance states from runtime pm (the requirement is for sure, the 
use of runtime pm is at least the current proposal for how to support 
it).  This is absolutely the case for PLLs, internal clock generators, 
etc.  The performance state required will vary based on what frequency 
these internal clock components are running at.  So structurally we need 
to track and aggregate a performance state for the clock controller 
based on the frequencies of various components it managers.  I believe 
that this is understood and accepted?  Once that framework is in place, 
then it is completely transparent to the framework design what or whose 
requirements are covered by the performance state associated with each 
frequency.  I can include the consumer's voltage requirement without any 
change apart from updating the already existing data structure in the 
clock controller.


> There are a bunch of problems with this. I really do see how it
> simplifies your life since you invested a bunch of time and code into 
> an
> out-of-tree implementation that does this already, but let's take the
> long view on this design topic:
> 
> 1) how does your approach solve the problem for consumer drivers that
> are not integrated within the SoC? What if a consumer driver consumes a
> clkout pin derived from your in-SoC clock generator, but is powered by
> an external PMIC? Where does this integration data live? Who owns it?

I do not think this is related actually.  A consumer driver with 
independent voltage requirements can manage them via runtime pm 
performance states just like how the clock controller does.  genpd will 
aggregate requirements from different consumers perfectly fine.


> 2) how does your approach solve for multiple clock provider drivers 
> that
> might need to manage shared voltage rails? How do they coordinate their
> needs and requests?

Again, genpd aggregates under the hood.  I am confused why this question 
is relevant though, whether or not one of the consumers of a voltage 
rail is a clock controller or not, aggregation is required between 
multiple users.  If USB and UART both share a rail and request it via 
runtime pm state changes, genpd still has to aggregate.



> 3) clock data is already big. If we start lumping in freq/volt tuples
> and use-case configuration data into those drivers, someone up the 
> chain
> is going to start complaining eventually. We've seen it before.

I don't have a choice, our HW has voltage requirements based on PLL and 
RCG (clock generator) frequencies.  The clock controller is a voltage 
consumer, and needs to aggregate it's own requirements across each clock 
node.


>> From an implementation and data structure point of view
>> there is no difference at all - we will need to track a voltage
>> requirement per clock operating point for the clock controller needs.
> 
> The code (and data) has to live somewhere, sure.
> 
>> Including the consumer requirements as well adds nothing and removes 
>> the
>> need for any consumer changes to themselves use runtime pm.
> 
> Except for the examples I mentioned above, especially #1 up above.
> 
>> I get the principle of having the consumer deal with their own 
>> specific
>> needs, but the consumers in the SOCs I've seen do not know what their
>> voltage requirements are - it's data managed by the clock provider.  
>> It
> 
> I guess I wasn't clear on the call at Connect: consumers should never
> concern themselves with their voltage requirements. The performance API
> will primarily use hertz as the perf value passed in, especially for 
> the
> SoCs you care about. Consumer drivers don't need to think about 
> voltage.

Now I'm confused.  When you say the consumer drivers don't need to think 
about voltage, do you just mean the software driver code itself?  
Because the runtime pm data and any governors would need to be owned by 
the same developer (they are the ones who understand their performance 
state requirements), so in that sense the consumer very much needs to 
think about the voltage when they put that piece in place.  This is one 
of the key challenges we (at least Qualcomm) faces in moving the voltage 
requirement completely outside of the clock controller.


> And it's only "data managed by the clock provider" because that's what
> you've hacked together out-of-tree.
> 
>> seems once the door is open to have the clock driver use runtime pm, 
>> why
>> not allow SOCs with that kind of data management policy to build in 
>> the
>> consumer requirements that way as well since it is zero extra work?
> 
> Because it's not zero extra work. None of the clock drivers that use
> runtime pm use it for anything like active or performance management.
> It's used for idle power management.

Yes, however in order to satisfy the clock controller's own voltage 
requirements, we will need to build in support for active performance 
state management in the clock framework.  Once that is there, I argue it 
is zero extra work to use it for all clock/voltage voting.

Graham



> Regardless of which design route that we take, we'll have to glue
> voltages to clock frequencies and make that code work. There is not a
> case where we get something for free.
> 
> Best regards,
> Mike
> 
>> 
>> Graham
>> 
>> 
>> 
>> 
>> >>
>> >> My conclusion so far is, that we seems to fall back to a potential
>> >> locking problem. In regards to that, I am wondering whether that is
>> >> actually more of hypothetical problem than a real problem for your
>> >> case.
>> >
>> > For reference, this is why we allow reentrancy into the clock
>> > framework.
>> > It is common that consumer A calls clk_set_rate to set clock X to a
>> > rate, but in order for clock X to acheive that rate the clock provider
>> > might need to call clk_set_rate on another clock. We support reentrancy
>> > for this type of case.
>> >
>> > The problem described by Graham seems analogous. There are times when a
>> > performance provider itself will need to adjust it's own performance
>> > (as
>> > consumed by some other parent provider). I'm under the impression that
>> > runtime pm allows reentrancy and genpd allows for nested genpds, so
>> > hopefully this should Just Work.
>> >
>> >>
>> >> > Our most recent patch that Taniya posted has gone in the direction similar
>> >> > to Tegra - instead of having the framework handle it, we use prepare and
>> >> > set_rate hooks to implement voltage (corner) voting in the qcom drivers via
>> >> > the new genpd.  This is not fully proven yet but is so far working well and
>> >> > will likely be our internal solution going forward if the framework
>> >> > consensus is to force consumers to manage their frequency-based voltage
>> >> > requirements themselves - I just do not see that as a practical solution for
>> >> > a complicated SoC with a large, highly distributed, clock tree.  That being
>> >> > said I do see potential future deadlock race conditions between clk and
>> >> > genpd which concern me - it remains a downside of that coupling.
>> >> >
>> >> > Would there be some way to prevent consumers from directly calling
>> >> > clk_set_rate or clk_enable and force them to go via another framework for
>> >> > these calls?  It would at least prevent people from using the "wrong"
>> >> > interface and bypassing voltage requirements.  That of course means having
>> >> > to mirror any of the clk APIs that update clock state into genpd/opp, which
>> >> > Stephen finds distasteful (and I agree).
>> >>
>> >> I am not sure about this. Sound like an awful wrapper API.
>> >
>> > Yeah, overloading the prepare callbacks is just a symptom of the
>> > greater
>> > problem: we don't have a real DVFS api.
>> >
>> > Regards,
>> > Mike
>> >
>> >>
>> >> However, what Mike seems to express the need for, is a common consumer
>> >> OPP API to set a performance state for a device, but also a way to to
>> >> allow SoC specific performance state providers to manage the backend
>> >> parts of actually changing the performance state.
>> >>
>> >> I am wondering whether this could be a way forward, maybe not exactly
>> >> what you was looking for, but perhaps it can address your concerns?
>> >>
>> >> [...]
>> >>
>> >> Kind regards
>> >> Uffe
