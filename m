Return-Path: <robdclark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUFfKN2mYRTpTe-Z_sLyXpw4aRM27VgKi5FaXUXLaEkNg@mail.gmail.com>
References: <20170711182008.28298-1-robdclark@gmail.com> <CAMuHMdUFfKN2mYRTpTe-Z_sLyXpw4aRM27VgKi5FaXUXLaEkNg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Jul 2017 15:16:52 -0400
Message-ID: <CAF6AEGtJaR1Je9QwqvbWMCf9OrmZ8Nt_58rjs++816YxzC=X3A@mail.gmail.com>
Subject: Re: [RFC 0/3] drm/msm+clk: handover of bootloader display
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, linux-clk <linux-clk@vger.kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	Archit Taneja <architt@codeaurora.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 11, 2017 at 2:35 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Rob,
>
> On Tue, Jul 11, 2017 at 8:20 PM, Rob Clark <robdclark@gmail.com> wrote:
>> So now that this is working (at least on a single device), I figured
>> it was a good time to send out an RFC to start discussion about how
>> to do this properly, in particular the CCF/powerdomain parts.
>>
>> The first patch adds flags so we can mark power domains and leaf
>> node clocks which might (or might not) be enabled by bootloader and
>> which we want to inherit when real display driver is probed.  (There
>> might be use-cases outside of display.. such as debug serial port?
>> I guess display is the most common/complex/useful use-case.)  From
>> the CCF/genpd standpoint, "inherit" really just means "fixup enable/
>> prepare_count and don't automatically switch off in lateinit".  The
>> rest of the complexity is in the display driver.
>>
>> For display, there are two different cases depending on whether the
>> display driver is built as a module (ie. probes after lateinit) or
>> not.  If the display driver is built as a module, then we want efifb
>> to keep working after the clk_disable_unused + genpd_power_off_unused
>> late_initcall's.  And in either case, we want the display driver to
>> be able to detect that display is already on (by checking whether
>> various clocks are already enabled) so that it knows to readback the
>> hw state.  (And not try to do things like clk_set_rate() on already
>> running clocks.)
>
> For the PM domains: won't these just stay enabled if efifb would
> call pm_runtime_enable() and pm_runtime_get_sync()?
>
> For clocks, can't efifb enable all clocks tied to the device in DT?

There is no node in dt (nor dt bindings) for efifb, and there really
should not be any, so no.

That could maybe work in the non-efi-boot case with simplefb except
that (a) we'd still need to know if clocks were already enabled at
boot or not, and in general having a dependency on clocks would keep
simplefb from probing anywhere near as early in boot, and (b) since
bootloader is populating simple-fb node in this case, it would end up
being kernel specific (ie. clk/powerdomain bindings work differently
between upstream and vendor kernel, so what the bootloader did would
end up being the right thing for downstream kernel and not upstream
kernel).  So in the end trying to solve this through DT doesn't really
accomplish anything.

BR,
-R
