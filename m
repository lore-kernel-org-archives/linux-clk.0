Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:35528 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941491AbcJaMVc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Oct 2016 08:21:32 -0400
Date: Mon, 31 Oct 2016 06:21:40 -0600
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laura Abbott <labbott@redhat.com>, Rob Herring <robh@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] driver core: Make Kconfig text for
 DEBUG_TEST_DRIVER_REMOVE stronger
Message-ID: <20161031122140.GB6774@kroah.com>
References: <120f00f2-94b6-aead-7bb4-9917bc338660@redhat.com>
 <1475856570-10743-1-git-send-email-labbott@redhat.com>
 <CAMuHMdW1xaYvcv4RtevyCsLrLQmcujNSQJ1839++cX1US-UKBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAMuHMdW1xaYvcv4RtevyCsLrLQmcujNSQJ1839++cX1US-UKBw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Oct 31, 2016 at 11:12:45AM +0100, Geert Uytterhoeven wrote:
> On Fri, Oct 7, 2016 at 6:09 PM, Laura Abbott <labbott@redhat.com> wrote:
> > The current state of driver removal is not great.
> > CONFIG_DEBUG_TEST_DRIVER_REMOVE finds lots of errors. The help text
> > currently undersells exactly how many errors this option will find. Add
> > a bit more description to indicate this option shouldn't be turned on
> > unless you actually want to debug driver removal. The text can be
> > changed later when more drivers are fixed up.
> 
> Indeed, this is failing miserably for e.g. SoC clock drivers using
> platform_driver_probe(), which are never retried, rendering the complete
> system useless.

Why are they never retried?
