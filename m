Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:44380 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S943874AbcJaPHq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Oct 2016 11:07:46 -0400
Date: Mon, 31 Oct 2016 09:07:51 -0600
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Laura Abbott <labbott@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] driver core: Make Kconfig text for
 DEBUG_TEST_DRIVER_REMOVE stronger
Message-ID: <20161031150751.GA3744@kroah.com>
References: <120f00f2-94b6-aead-7bb4-9917bc338660@redhat.com>
 <1475856570-10743-1-git-send-email-labbott@redhat.com>
 <CAMuHMdW1xaYvcv4RtevyCsLrLQmcujNSQJ1839++cX1US-UKBw@mail.gmail.com>
 <20161031122140.GB6774@kroah.com>
 <CAMuHMdVZFTeRDpRkF4s-=XM+BAT0=W4Lm=o8C4eYBTR4uUSBQw@mail.gmail.com>
 <CAL_JsqJsPhy_ATTaTH8H2kaAQP04V1Huiv5J-SQM=CMBq5hmSQ@mail.gmail.com>
 <20161031150724.GA3687@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161031150724.GA3687@kroah.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Oct 31, 2016 at 09:07:24AM -0600, Greg Kroah-Hartman wrote:
> On Mon, Oct 31, 2016 at 09:10:57AM -0500, Rob Herring wrote:
> > On Mon, Oct 31, 2016 at 7:28 AM, Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > Hi Greg,
> > >
> > > On Mon, Oct 31, 2016 at 1:21 PM, Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > >> On Mon, Oct 31, 2016 at 11:12:45AM +0100, Geert Uytterhoeven wrote:
> > >>> On Fri, Oct 7, 2016 at 6:09 PM, Laura Abbott <labbott@redhat.com> wrote:
> > >>> > The current state of driver removal is not great.
> > >>> > CONFIG_DEBUG_TEST_DRIVER_REMOVE finds lots of errors. The help text
> > >>> > currently undersells exactly how many errors this option will find. Add
> > >>> > a bit more description to indicate this option shouldn't be turned on
> > >>> > unless you actually want to debug driver removal. The text can be
> > >>> > changed later when more drivers are fixed up.
> > >>>
> > >>> Indeed, this is failing miserably for e.g. SoC clock drivers using
> > >>> platform_driver_probe(), which are never retried, rendering the complete
> > >>> system useless.
> > >>
> > >> Why are they never retried?
> > >
> > > Because platform_driver_probe() is meant for non-hotpluggable devices,
> > > and unregisters the platform driver immediately if probe fails.
> > > See also the comments for __platform_driver_probe():
> > 
> > My patch "driver core: skip removal test for non-removable drivers"
> > fixes this case. It seems to have dropped from Greg's queue, so I'll
> > resend.
> 
> Odd, I don't see that anywhere here, sorry about that...

Ah, found it, will queue it up now.
