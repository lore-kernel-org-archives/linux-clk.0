Return-Path: <robdclark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWg45oc-9aQAMkxNrUL57vd6Vmqqn7TFfzz7-qMmzxKGQ@mail.gmail.com>
References: <20170704175117.8636-1-robdclark@gmail.com> <CAMuHMdWg45oc-9aQAMkxNrUL57vd6Vmqqn7TFfzz7-qMmzxKGQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 4 Jul 2017 15:02:25 -0400
Message-ID: <CAF6AEGuM8-kKxXq9-qcjFAPrVMt6HznEZOkGSVahRXjaCcxK4g@mail.gmail.com>
Subject: Re: [RFC] clk: inherit display clocks enabled by bootloader
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Archit Taneja <architt@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>,
	Rajendra Nayak <rnayak@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 4, 2017 at 2:45 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Jul 4, 2017 at 7:51 PM, Rob Clark <robdclark@gmail.com> wrote:
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
>
> Cfr. Documentation/devicetree/bindings/display/simple-framebuffer.txt?
>

which afaict doesn't help for efifb.. which we have no bindings for
(and would seem like a strange thing to have bindings for)

BR,
-R
