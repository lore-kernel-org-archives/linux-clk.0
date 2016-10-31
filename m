Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34499 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941465AbcJaM2u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Oct 2016 08:28:50 -0400
MIME-Version: 1.0
In-Reply-To: <20161031122140.GB6774@kroah.com>
References: <120f00f2-94b6-aead-7bb4-9917bc338660@redhat.com>
 <1475856570-10743-1-git-send-email-labbott@redhat.com> <CAMuHMdW1xaYvcv4RtevyCsLrLQmcujNSQJ1839++cX1US-UKBw@mail.gmail.com>
 <20161031122140.GB6774@kroah.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Oct 2016 13:28:49 +0100
Message-ID: <CAMuHMdVZFTeRDpRkF4s-=XM+BAT0=W4Lm=o8C4eYBTR4uUSBQw@mail.gmail.com>
Subject: Re: [PATCH] driver core: Make Kconfig text for DEBUG_TEST_DRIVER_REMOVE
 stronger
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laura Abbott <labbott@redhat.com>, Rob Herring <robh@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Greg,

On Mon, Oct 31, 2016 at 1:21 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Mon, Oct 31, 2016 at 11:12:45AM +0100, Geert Uytterhoeven wrote:
>> On Fri, Oct 7, 2016 at 6:09 PM, Laura Abbott <labbott@redhat.com> wrote:
>> > The current state of driver removal is not great.
>> > CONFIG_DEBUG_TEST_DRIVER_REMOVE finds lots of errors. The help text
>> > currently undersells exactly how many errors this option will find. Add
>> > a bit more description to indicate this option shouldn't be turned on
>> > unless you actually want to debug driver removal. The text can be
>> > changed later when more drivers are fixed up.
>>
>> Indeed, this is failing miserably for e.g. SoC clock drivers using
>> platform_driver_probe(), which are never retried, rendering the complete
>> system useless.
>
> Why are they never retried?

Because platform_driver_probe() is meant for non-hotpluggable devices,
and unregisters the platform driver immediately if probe fails.
See also the comments for __platform_driver_probe():

 * Note that this is incompatible with deferred probing.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
