Return-Path: <robdclark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <fbc5b229-b48b-59bb-b217-590d9499b0ea@codeaurora.org>
References: <20170704175117.8636-1-robdclark@gmail.com> <fbc5b229-b48b-59bb-b217-590d9499b0ea@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Jul 2017 06:06:12 -0400
Message-ID: <CAF6AEGsKc-7Wcr0_t8XRV9Vz-4n5k-q_130oqNWD=zyWe43=iA@mail.gmail.com>
Subject: Re: [RFC] clk: inherit display clocks enabled by bootloader
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Archit Taneja <architt@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 4, 2017 at 11:27 PM, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
>
> On 07/04/2017 11:21 PM, Rob Clark wrote:
>> The goal here is to support inheriting a display setup by bootloader,
>> although there may also be some non-display related use-cases.
>>
>> Rough idea is to add a flag for clks and power domains that might
>> already be enabled when kernel starts, and make corresponding fixups
>> to clk enable/prepare_count and power-domain state so that these are
>> not automatically disabled late in boot.
>>
>> If bootloader is enabling display, and kernel is using efifb before
>> real display driver is loaded (potentially from kernel module after
>> userspace starts, in a typical distro kernel), we don't want to kill
>> the clocks and power domains that are used by the display before
>> userspace starts.
>>
>> Second part will be (*waves hands*) for drm/msm to check if display
>> related clocks are enabled when it is loaded, and if so use drm
>> atomic framework's hooks to read back hw state to sync existing
>> display state w/ software state, and skip the initial clk_enable.
>> Therefore inheriting the enable done by bootloader.
>>
>> Obviously this should be split up into multiple patches and many
>> TODOs addressed.  But I guess this is enough for now to start
>> discussing the approach, and in particular how drm and clock/pd
>> drivers work together to handle handover from bootloader.
>>
>> The CLK_INHERIT_BOOTLOADER and related gsdc flag should only be set
>> on leaf nodes.
>> ---
>> A bit hacky right now, but display survives clk_disable_unused()
>> and genpd_power_off_unused().  It hangs just after that late in
>> boot, which I'm still debugging (might be unrelated shenanigans).
>> And haven't started on the drm/msm side of this.  But I figured
>> it was half baked enough to send out for comments/ideas, or to
>> see if anyone had some different idea about how to solve this.
>
> Another RFC proposed around to handle similar situations is
> https://lkml.org/lkml/2017/6/28/188
>
> That one though, I guess deals with only regulator supplies for now.

Interesting.. although I do prefer it not being a static thing.  Ie.
depending on lk version and 'fastboot oem' params it may or may not
light up the display.  So detecting whether something is on at boot
is, imo, important.

(I haven't looked at regulators yet.. looks like it is all power
domains, at least on 8x16, not sure about others..)

BR,
-R
