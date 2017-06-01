Return-Path: <phil@raspberrypi.org>
Subject: Re: [PATCH 1/2] clk: bcm2835: Limit PCM clock to OSC and PLLD_PER
To: Eric Anholt <eric@anholt.net>,
        Michael Turquette
 <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <866b60bb-d1c8-726e-3a2d-11a34f9e8ac7@raspberrypi.org>
 <87efv4btyt.fsf@eliezer.anholt.net>
From: Phil Elwell <phil@raspberrypi.org>
Message-ID: <8aa0c35a-dfa5-d0a8-4af6-84173fd50edf@raspberrypi.org>
Date: Thu, 1 Jun 2017 09:46:24 +0100
MIME-Version: 1.0
In-Reply-To: <87efv4btyt.fsf@eliezer.anholt.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 31/05/2017 22:24, Eric Anholt wrote:
> Phil Elwell <phil@raspberrypi.org> writes:
> 
>> Restrict clock sources for the PCM peripheral to the oscillator and
>> PLLD_PER because other source may have varying rates or be switched off.
>> Prevent other sources from being selected by replacing their names in
>> the list of potential parents with dummy entries (entry index is
>> significant).
> 
> I might be up for giving my r-b on this, but first I'd like to check if
> we can simplify even more.  Looking through this list:
> 
> static const char *const bcm2835_clock_per_parents[] = {
> 	"gnd",
> 	"xosc",
> 	"testdebug0",
> 	"testdebug1",
> 	"plla_per",
> 	"pllc_per",
> 	"plld_per",
> 	"pllh_aux",
> };
> 
> PLLA is off and unused and we don't want any peripheral to turn it on
> (unless we wanted PCM to do so, but we aren't doing that here).
> 
> PLLC's rate gets changed by the VPU and so it isn't reliable.
> 67615c588a059b731df9d019edc3c561d8006ec9 made it so that nobody uses it
> that isn't using it by firmware setup, and EMMC is the only one that the
> firmware is having use PLLC.  Would we be better off just having EMMC
> always be on PLLD?  Or, we could special-case EMMC to be the only one to
> use PLLC.
> 
> PLLD is stable.
> 
> PLLH should only be used as a parent by VEC (or HSM, assuming that
> drm/vc4 rate-sets PLLH_PIX first, but I don't know of a reason for HSM
> to not just be fractionally divided off of PLLD).  If you've got
> firmware display in use, it may change rate or be disabled behind
> Linux's back, so we don't want anything but Linux-controlled VEC to use
> it.  We could special-case VEC to be the only one that had PLLH_AUX as
> parent.
> 
> So, my proposal would be to basically make everything but VEC and maybe
> EMMC use your new list, and drop the code in
> 67615c588a059b731df9d019edc3c561d8006ec9.  That said, if you want to do
> this first for PCM and then extend it to the rest of the clock
> consumers, I'm fine with that.

Thank, Eric. In the Linux spirit of doing things in small, incremental steps
(that and cowardice) I'd like to just restrict PCM for now. I'll add
your Reviewed-by to v3.

Phil
