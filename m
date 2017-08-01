Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] clk: meson: expose clk ids
To: Arnd Bergmann <arnd@arndb.de>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>, Olof Johansson <olof@lixom.net>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org
References: <20170731113832.26490-1-jbrunet@baylibre.com>
 <CAK8P3a28nb8QsJC8V4+SJM0gz70BDOv8jAczRWoCF+HfvkwJfA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <6494a76f-7282-cc39-c02a-0f1b2a8d83ff@baylibre.com>
Date: Tue, 1 Aug 2017 14:00:22 +0200
MIME-Version: 1.0
In-Reply-To: <CAK8P3a28nb8QsJC8V4+SJM0gz70BDOv8jAczRWoCF+HfvkwJfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 07/31/2017 04:05 PM, Arnd Bergmann wrote:
> On Mon, Jul 31, 2017 at 1:38 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
>> In previous cycles, concerns have been raised about the way clocks are
>> exposed for the meson clock controller, only when validated and required
>> in DT.
>>
>> Instead, this patchset expose all the known clocks which may be needed in
>> DT later on. The clocks left out are internal clocks which should never be
>> used directly in DT. These are mostly internal muxes and dividers of
>> composite clocks.
>>
>> While this should reduce the patch flow on the related header files, It
>> won't stop it completely. There are still many clocks we don't know about
>> yet. We tend discover a few in every cycle.
>>
>> This patchset depends on these fixes [0] to avoid issues when adding new
>> clk ids.
>>
>> [0]: https://lkml.kernel.org/r/20170727161755.10393-1-jbrunet@baylibre.com
> 
> Thanks a lot!
> 
>  Acked-by: Arnd Bergmann <arnd@arndb.de>
> 

Applied to clk-meson's next/headers with arnd's ack.
