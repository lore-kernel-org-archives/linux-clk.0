Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from imap0.codethink.co.uk ([185.43.218.159]:42475 "EHLO
        imap0.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933054AbdCaQL1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2017 12:11:27 -0400
Subject: Re: [GIT PULL] Amlogic 64-bit DT updates for v4.12
To: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
References: <m28tnn69ls.fsf@baylibre.com>
 <CAK8P3a02e3DxjuW9pA66NSCc9vw_h1Xuk6TdEbRnEQ4v4W7NHA@mail.gmail.com>
 <m2fuht4eqs.fsf@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, arm-soc <arm@kernel.org>,
        linux-clk@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Message-ID: <8e708a9f-b32e-a80c-b5d7-8979e59b6662@codethink.co.uk>
Date: Fri, 31 Mar 2017 17:11:17 +0100
MIME-Version: 1.0
In-Reply-To: <m2fuht4eqs.fsf@baylibre.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 31/03/17 17:01, Kevin Hilman wrote:
> Arnd Bergmann <arnd@arndb.de> writes:
>
>> On Wed, Mar 29, 2017 at 11:45 PM, Kevin Hilman <khilman@baylibre.com> wrote:
>>> Olof, Arnd,
>>>
>>> Below are some 64-bit DT changes for Amlogic platforms for v4.12.  Note
>>> that this branch includes a merge of an immutable branch from the clk
>>> tree (clk-meson) due to dependencies on new clocks added to the meson
>>> clock driver and used in these DT updates.
>>
>> I did not pull this one because of the silly dependency. The device tree
>> files should be completely independent of the driver changes.
>
> Aaargh, this is getting very frustrating.

I tried to make this point very early on in the development,
we don't want to be changing both driver and dt if we are
adding things like IDs for gated clocks.

For example, having an almost 1:1 mapping from clock-id to
bit-in-hardware would make life much easier, even if the
driver had a little bit more code to create clocks at the
probe time, it would have meant that DT additions for new
peripherals would have been much easier.

> [...]
>
>> Which add random macros in the middle of the number space.
>>
>> Since the header changes are in an immutable branch, it's probably
>> too late to fix this for 4.12, but maybe we can get the header into a
>> form that allows us to do future DT changes without having to
>> wait an extra release. The clock driver apparently already defines
>> some of the numbers above, so you can fill all of those in already.
>
> We could, but this is in direct conflict with the recommendations of the
> clk maintainers to not expose clock IDs to the DT until we know they are
> used because, well, things change.
>
> Can we *please* get some clarity on on this between arm-soc and the clk
> maintainers?  I've been asking for a couple merge windows now.
>
> Irritated,
>
> Kevin
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
