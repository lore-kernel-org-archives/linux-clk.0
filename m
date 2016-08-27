Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
Subject: Re: [PATCH v4 0/6] Add Amlogic meson8b clock gates
To: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <1469800864-43440-1-git-send-email-serveralex@gmail.com>
 <147208467939.32728.10815386393422927131@resonance>
From: =?UTF-8?Q?Alexander_M=c3=bcller?= <serveralex@gmail.com>
Message-ID: <b4db9b01-89ec-ec83-8e66-d88f03dda681@gmail.com>
Date: Sat, 27 Aug 2016 19:42:26 +0200
MIME-Version: 1.0
In-Reply-To: <147208467939.32728.10815386393422927131@resonance>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

The rebased patch series is on its way. Thanks!

Regards,
Alex

On 25/08/16 02:24, Michael Turquette wrote:
> Quoting Alexander Müller (2016-07-29 07:00:58)
>> This patch series adds support for the Amlogic meson8b clock gates. The Amlogic
>> U-Boot disables most of them at boot. In order to enable ethernet, USB and other
>> components it's mandatory to enable the clock gates when loading the corresponding
>> drivers.
>>
>> The meson8b clock gate support is based on the previous work done for Amlogic gxbb
>> currently available in clk-next.
> 
> Hi Alexander,
> 
> This series looks good to me. Can you rebase it against the
> clk-meson-gxbb-ao branch?
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-meson-gxbb-ao
> 
> I'll merge it on top of that and Kevin and Carlo can pull it into the
> linux-amlogic tree if they feel like it.
> 
> Regards,
> Mike
> 
>>
>> Changes since v3:
>>   - Include include/dt-bindings/clock/meson8b-clkc.h to prevent code duplicates
>>
>> Changes since v2:
>>   - Added commit description for patch 2
>>   - Changed CLK_NR_CLOCKS macro to constant int
>>   - Moved back MESON_GATE macro to share it between gxbb and meson8b
>>
>> Changes since v1:
>>   - Fixed GXBB spelling
>>   - Moved newly introduced CLKID defines to private header
>>   - Moved CLK_NR_CLKS define from DT binding to private header
>>   - Rebased to linux-amlogic/v4.7/integ making Kconfig select obsolete
>>
>> Alexander Müller (6):
>>   clk: meson: Rename meson8b-clkc.c to reflect gxbb naming convention
>>   meson: clk: Move register definitions to meson8b.h
>>   meson: clk: Rename register names according to Amlogic datasheet
>>   clk: meson: Copy meson8b CLKID defines to private header file
>>   gxbb: clk: Adjust MESON_GATE macro to be shared with meson8b
>>   meson: clk: Add support for clock gates
>>
>>  drivers/clk/meson/Makefile                      |   2 +-
>>  drivers/clk/meson/clkc.h                        |   2 +-
>>  drivers/clk/meson/gxbb.c                        | 162 ++++++-------
>>  drivers/clk/meson/{meson8b-clkc.c => meson8b.c} | 293 +++++++++++++++++++++---
>>  drivers/clk/meson/meson8b.h                     | 151 ++++++++++++
>>  include/dt-bindings/clock/meson8b-clkc.h        |   2 -
>>  6 files changed, 497 insertions(+), 115 deletions(-)
>>  rename drivers/clk/meson/{meson8b-clkc.c => meson8b.c} (52%)
>>  create mode 100644 drivers/clk/meson/meson8b.h
>>
>> -- 
>> 2.5.0
>>
