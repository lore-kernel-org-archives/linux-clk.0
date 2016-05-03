Return-Path: <martin@sperl.org>
Content-Type: multipart/alternative; boundary="Apple-Mail=_D41E0F10-A33B-4A54-813E-EAF16F391440"
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH V4 1/2] clk: bcm2835: mark enabled clocks with CLK_IS_CRITICAL
From: Martin Sperl <martin@sperl.org>
In-Reply-To: <399371FE-CC25-469C-9917-FDFCDA741D56@martin.sperl.org>
Date: Tue, 3 May 2016 14:29:23 +0200
Cc: Stephen Boyd <sboyd@codeaurora.org>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Lee Jones <lee@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <752C2E9F-42DF-4D99-8D56-FA6D903D39D3@sperl.org>
References: <1461951756-16804-1-git-send-email-kernel@martin.sperl.org> <1461951756-16804-2-git-send-email-kernel@martin.sperl.org> <87zis8h3pp.fsf@eliezer.anholt.net> <5CC0D984-91E5-4401-8AB6-5827269C4395@martin.sperl.org> <87wpncueoq.fsf@eliezer.anholt.net> <399371FE-CC25-469C-9917-FDFCDA741D56@martin.sperl.org>
To: Eric Anholt <eric@anholt.net>,
 Michael Turquette <mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>


--Apple-Mail=_D41E0F10-A33B-4A54-813E-EAF16F391440
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



On 03.05.2016 07:07, Martin Sperl wrote:
>=20
>> On 03.05.2016, at 03:13, Eric Anholt <eric@anholt.net> =
<mailto:eric@anholt.net> wrote:
>>=20
>> Martin Sperl <kernel@martin.sperl.org> =
<mailto:kernel@martin.sperl.org> writes:
>>=20
>>>> On 02.05.2016, at 17:36, Eric Anholt <eric@anholt.net> =
<mailto:eric@anholt.net> wrote:
>>>>=20
>>>> kernel@martin.sperl.org <mailto:kernel@martin.sperl.org> writes:
>>>>=20
>>>>> From: Martin Sperl <kernel@martin.sperl.org> =
<mailto:kernel@martin.sperl.org>
>>>>>=20
>>>>> The bcm2835 firmware enables several clocks and plls before
>>>>> booting the linux kernel.
>>>>>=20
>>>>> These plls should never get disabled as it may result in a
>>>>> stopped system clock and more.
>>>>>=20
>>>>> So during probing we check if the clock is enabled
>>>>> and if it is then mark that clock with CLK_IS_CRITICAL.
>>>>>=20
>>>>> As a consequence this will also enable the corresponding
>>>>> parent plls and pll-divs.
>>>>>=20
>>>>> This is intended as a stop-gap until CLK_ENABLE_HAND_OFF
>>>>> becomes available, at which point it should be used instead.
>>>>>=20
>>>>> Signed-off-by: Martin Sperl <kernel@martin.sperl.org> =
<mailto:kernel@martin.sperl.org>
>>>> I still think that we don't want this patch.  We should be able to
>>>> disable clocks that the firmware turned on, unless they really need =
to
>>>> stay on.  If you have troubles on the upstream DT, let's talk about
>>>> individual clocks.
>>> May I ask you what is your main concern about using
>>> CLK_IS_CRITICAL as a stop-gap/in general?
>> Burning power when you shouldn't, which is a bug.
> It is a bug, but it is better than a crash that happens currently
> because of a stopped clock.
> Also there is a proposed way forward when hand-off
> becomes available.
>=20
>>> Also the current situation of the machine crashing when releasing =
the
>>> PCM clock when the parent is PLLC or PLLD is worse than having some
>>> clocks/pll running unnecessarily.
>> Are you saying this happens on the upstream kernel?  This sounds like =
a
>> bug you'd see in the downstream kernel because they haven't hooked up
>> the clocks in their DT.
> This happens for both upstream and downstream when using
> cprman...
>=20
> You remember the main-uart crashing discussion (when=20
> loaded as a module or not used as the kernel console?) it is
> exactly what an unclaimed clock is triggering when the clock
> Is prepared/enabled and then released.
>=20
> I have also seen the same issue happen with PCM without
> the patch - as soon as we request a frequency which will use
> pllc/d-per as the parent, and we later release the clock the
> system crashes -  but there only if we run the dt with minimal
> clocks using cprman, as it is hidden as soon as you increase enable
> count of the plls because of an enabled clock by a different
> device that also consumes the same pll.
>=20
> So this bug is mostly hidden behind the complete dts that
> just consumes lots of parent clocks, but it still may occur=20
> when we select a frequency that will select the firmware=20
> enabled but not claimed plla_per - no idea what stopping
> that pll would trigger in the system.
>=20
> Hence we need this patch for the running clocks , but we
> also need it for the pll_divs, so actually my patch is
> incomplete!

To put in some perspective:

So sing 4.6.0-rc1 with pwm disabled in the dt and amba_pl011 as a module
(modprobe blacklisted) I get the following enabled clocks:
root@raspcm:~# grep -vE ^0 /sys/kernel/debug/clk/*/clk_enable_count
/sys/kernel/debug/clk/emmc/clk_enable_count:1
/sys/kernel/debug/clk/osc/clk_enable_count:1
/sys/kernel/debug/clk/pllc/clk_enable_count:1
/sys/kernel/debug/clk/pllc_per/clk_enable_count:1

modprobe amba_pl011
gives these clocks:
root@raspcm:~# grep -vE ^0 /sys/kernel/debug/clk/*/clk_enable_count
/sys/kernel/debug/clk/emmc/clk_enable_count:1
/sys/kernel/debug/clk/osc/clk_enable_count:1
/sys/kernel/debug/clk/pllc/clk_enable_count:2
/sys/kernel/debug/clk/pllc_core0/clk_enable_count:1
/sys/kernel/debug/clk/pllc_per/clk_enable_count:1
/sys/kernel/debug/clk/vpu/clk_enable_count:1

rmmod amba_pl011
results in a crash.

Similarly using my private dtb that includes i2s + drivers,
loading the i2s audio modules gives still the default enabled clocks:
root@raspcm:~# grep -vE ^0 /sys/kernel/debug/clk/*/clk_enable_count
/sys/kernel/debug/clk/emmc/clk_enable_count:1
/sys/kernel/debug/clk/osc/clk_enable_count:1
/sys/kernel/debug/clk/pllc/clk_enable_count:1
/sys/kernel/debug/clk/pllc_per/clk_enable_count:1

Playing a sound with 48000Hz sample-rate useing speaker-test and=20
looking at the enabled clocks gives:
root@raspcm:~# grep -vE ^0 /sys/kernel/debug/clk/*/clk_enable_count
/sys/kernel/debug/clk/emmc/clk_enable_count:1
/sys/kernel/debug/clk/osc/clk_enable_count:2
/sys/kernel/debug/clk/pcm/clk_enable_count:1
/sys/kernel/debug/clk/pllc/clk_enable_count:1
/sys/kernel/debug/clk/pllc_per/clk_enable_count:1

No issue when stopping - clocks then look like this:
root@raspcm:~# grep -vE ^0 /sys/kernel/debug/clk/*/clk_enable_count
/sys/kernel/debug/clk/emmc/clk_enable_count:1
/sys/kernel/debug/clk/osc/clk_enable_count:1
/sys/kernel/debug/clk/pllc/clk_enable_count:1
/sys/kernel/debug/clk/pllc_per/clk_enable_count:1

So now playing a sound at 44100Hz sample rate gives no sound
the clocks look like this:
root@raspcm:~# grep -vE ^0 /sys/kernel/debug/clk/*/clk_enable_count
/sys/kernel/debug/clk/emmc/clk_enable_count:1
/sys/kernel/debug/clk/osc/clk_enable_count:2
/sys/kernel/debug/clk/pcm/clk_enable_count:1
/sys/kernel/debug/clk/pllc/clk_enable_count:1
/sys/kernel/debug/clk/pllc_per/clk_enable_count:1
/sys/kernel/debug/clk/plld/clk_enable_count:1
/sys/kernel/debug/clk/plld_per/clk_enable_count:1

and when aborting the playback the machine crashes=E2=80=A6

So it is fairly simple to see that this happens with an upstream
kernel using 2 distinct cases.

Using the =E2=80=9CIS_CRITICAL=E2=80=9D patch instead avoids crashing =
the hw in
the above circumstances - clocks after boot look like this:
root@raspcm:~# grep -vE ^0 /sys/kernel/debug/clk/*/clk_enable_count
/sys/kernel/debug/clk/emmc/clk_enable_count:2
/sys/kernel/debug/clk/h264/clk_enable_count:1
/sys/kernel/debug/clk/hsm/clk_enable_count:1
/sys/kernel/debug/clk/isp/clk_enable_count:1
/sys/kernel/debug/clk/osc/clk_enable_count:6
/sys/kernel/debug/clk/otp/clk_enable_count:1
/sys/kernel/debug/clk/plla/clk_enable_count:1
/sys/kernel/debug/clk/plla_core/clk_enable_count:3
/sys/kernel/debug/clk/pllc/clk_enable_count:1
/sys/kernel/debug/clk/pllc_per/clk_enable_count:1
/sys/kernel/debug/clk/plld/clk_enable_count:1
/sys/kernel/debug/clk/plld_per/clk_enable_count:2
/sys/kernel/debug/clk/timer/clk_enable_count:1
/sys/kernel/debug/clk/tsens/clk_enable_count:1
/sys/kernel/debug/clk/uart/clk_enable_count:1
/sys/kernel/debug/clk/v3d/clk_enable_count:1

There is one drawback with IS_CRITICAL is visible in the
above: the emmc clock count goes up to 2.

When playing with speaker-test the =E2=80=9Ccrash=E2=80=9D no longer =
happens,
but there is still that issue with rmmod amba_pl011 still persists
When loading/unloading while playing pcm still results in a crash
but this time one can hear noise on the audio lines=E2=80=A6.

So it is not perfect, but at least audio playback does not fail.

Now finally with ENABLE_HAND_OFF:
root@raspcm:~# grep -vE ^0 /sys/kernel/debug/clk/*/clk_enable_count
/sys/kernel/debug/clk/emmc/clk_enable_count:1
/sys/kernel/debug/clk/h264/clk_enable_count:1
/sys/kernel/debug/clk/hsm/clk_enable_count:1
/sys/kernel/debug/clk/isp/clk_enable_count:1
/sys/kernel/debug/clk/osc/clk_enable_count:6
/sys/kernel/debug/clk/otp/clk_enable_count:1
/sys/kernel/debug/clk/plla/clk_enable_count:1
/sys/kernel/debug/clk/plla_core/clk_enable_count:3
/sys/kernel/debug/clk/pllc/clk_enable_count:1
/sys/kernel/debug/clk/pllc_per/clk_enable_count:1
/sys/kernel/debug/clk/plld/clk_enable_count:1
/sys/kernel/debug/clk/plld_per/clk_enable_count:2
/sys/kernel/debug/clk/timer/clk_enable_count:1
/sys/kernel/debug/clk/tsens/clk_enable_count:1
/sys/kernel/debug/clk/uart/clk_enable_count:1
/sys/kernel/debug/clk/v3d/clk_enable_count:1

With the following observations:
* audio again works
* amba_pl011 remove still fails=E2=80=A6

So hand-off for clocks still does not work for everything.

Especially we still have cases where enabling and then disabling
a clock still can crash the system, but at least the emmc count
stays at 1.

Finally: when marking the running pll_div with HAND_OFF or CITICAL
in addition to the running clocks, then "rmmod amba_pl011" does no
longer crash the system - instead it triggers the dmesg:=20
Trying to free nonexistent resource <0000000020201000-0000000020201fff>

But I guess this is a different issue.

So as a way forward: should we enable pll_div also to CRITICAL
and then HAND_OFF?

Or should we just use HAND_OFF - when can we get HAND_OFF
merged so that we can really make use of it without having to have a
CRITICAL step in between?

Assuming that we get ENABLE_HAND_OFF  into clk-next, then I
could create a new patch that:
* only uses HAND_OFF=20
   (without the intermediate step of using CRITCAl)
* marks running pll_divs and clocks as HAND_OFF.

Thanks,
		Martin




--Apple-Mail=_D41E0F10-A33B-4A54-813E-EAF16F391440
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8">
    <meta content=3D"text/html; charset=3Dwindows-1252" =
http-equiv=3D"Content-Type">
  </head><body bgcolor=3D"#FFFFFF" text=3D"#000000" style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space;" class=3D"">
    <br class=3D"">
    <br class=3D"">
    <div class=3D"moz-cite-prefix">On 03.05.2016 07:07, Martin Sperl
      wrote:<br class=3D"">
    </div>
    <blockquote =
cite=3D"mid:399371FE-CC25-469C-9917-FDFCDA741D56@martin.sperl.org" =
type=3D"cite" class=3D"">
      <pre wrap=3D"" class=3D"">
</pre>
      <blockquote type=3D"cite" class=3D"">
        <pre wrap=3D"" class=3D"">On 03.05.2016, at 03:13, Eric Anholt =
<a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:eric@anholt.net">&lt;eric@anholt.net&gt;</a> wrote:

Martin Sperl <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:kernel@martin.sperl.org">&lt;kernel@martin.sperl.org&gt;</a=
> writes:

</pre>
        <blockquote type=3D"cite" class=3D"">
          <blockquote type=3D"cite" class=3D"">
            <pre wrap=3D"" class=3D"">On 02.05.2016, at 17:36, Eric =
Anholt <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:eric@anholt.net">&lt;eric@anholt.net&gt;</a> wrote:

<a class=3D"moz-txt-link-abbreviated" =
href=3D"mailto:kernel@martin.sperl.org">kernel@martin.sperl.org</a> =
writes:

</pre>
            <blockquote type=3D"cite" class=3D"">
              <pre wrap=3D"" class=3D"">From: Martin Sperl <a =
class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:kernel@martin.sperl.org">&lt;kernel@martin.sperl.org&gt;</a=
>

The bcm2835 firmware enables several clocks and plls before
booting the linux kernel.

These plls should never get disabled as it may result in a
stopped system clock and more.

So during probing we check if the clock is enabled
and if it is then mark that clock with CLK_IS_CRITICAL.

As a consequence this will also enable the corresponding
parent plls and pll-divs.

This is intended as a stop-gap until CLK_ENABLE_HAND_OFF
becomes available, at which point it should be used instead.

Signed-off-by: Martin Sperl <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:kernel@martin.sperl.org">&lt;kernel@martin.sperl.org&gt;</a=
>
</pre>
            </blockquote>
            <pre wrap=3D"" class=3D"">I still think that we don't want =
this patch.  We should be able to
disable clocks that the firmware turned on, unless they really need to
stay on.  If you have troubles on the upstream DT, let's talk about
individual clocks.
</pre>
          </blockquote>
          <pre wrap=3D"" class=3D"">May I ask you what is your main =
concern about using
CLK_IS_CRITICAL as a stop-gap/in general?
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"">Burning power when you shouldn't, =
which is a bug.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"">It is a bug, but it is better than a =
crash that happens currently
because of a stopped clock.
Also there is a proposed way forward when hand-off
becomes available.

</pre>
      <blockquote type=3D"cite" class=3D"">
        <pre wrap=3D"" class=3D""></pre>
        <blockquote type=3D"cite" class=3D"">
          <pre wrap=3D"" class=3D"">Also the current situation of the =
machine crashing when releasing the
PCM clock when the parent is PLLC or PLLD is worse than having some
clocks/pll running unnecessarily.
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"">Are you saying this happens on the =
upstream kernel?  This sounds like a
bug you'd see in the downstream kernel because they haven't hooked up
the clocks in their DT.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"">This happens for both upstream and =
downstream when using
cprman...

You remember the main-uart crashing discussion (when=20
loaded as a module or not used as the kernel console?) it is
exactly what an unclaimed clock is triggering when the clock
Is prepared/enabled and then released.

I have also seen the same issue happen with PCM without
the patch - as soon as we request a frequency which will use
pllc/d-per as the parent, and we later release the clock the
system crashes -  but there only if we run the dt with minimal
clocks using cprman, as it is hidden as soon as you increase enable
count of the plls because of an enabled clock by a different
device that also consumes the same pll.

So this bug is mostly hidden behind the complete dts that
just consumes lots of parent clocks, but it still may occur=20
when we select a frequency that will select the firmware=20
enabled but not claimed plla_per - no idea what stopping
that pll would trigger in the system.

Hence we need this patch for the running clocks , but we
also need it for the pll_divs, so actually my patch is
incomplete!
</pre>
    </blockquote>
    <div class=3D""><br class=3D""></div><div class=3D"">To put in some =
perspective:</div><div class=3D""><br class=3D""></div><div class=3D"">So =
sing 4.6.0-rc1 with pwm disabled in the dt and amba_pl011 as a =
module</div><div class=3D"">(modprobe blacklisted) I get the following =
enabled clocks:</div><div class=3D"">root@raspcm:~# grep -vE ^0 =
/sys/kernel/debug/clk/*/clk_enable_count</div><div class=3D""><div =
class=3D"">/sys/kernel/debug/clk/emmc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/osc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc_per/clk_enable_count:1</div></div><d=
iv class=3D""><br class=3D""></div><div class=3D"">modprobe =
amba_pl011</div><div class=3D"">gives these clocks:</div><div =
class=3D""><div class=3D"">root@raspcm:~# grep -vE ^0 =
/sys/kernel/debug/clk/*/clk_enable_count</div><div =
class=3D"">/sys/kernel/debug/clk/emmc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/osc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc/clk_enable_count:2</div><div =
class=3D"">/sys/kernel/debug/clk/pllc_core0/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc_per/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/vpu/clk_enable_count:1</div></div><div =
class=3D""><br class=3D""></div><div =
class=3D"">rmmod&nbsp;amba_pl011</div><div class=3D"">results in a =
crash.</div><div class=3D""><br class=3D""></div><div class=3D"">Similarly=
 using my private dtb that includes i2s + drivers,</div><div =
class=3D"">loading the i2s audio modules gives still the default enabled =
clocks:</div><div class=3D""><div class=3D"">root@raspcm:~# grep -vE ^0 =
/sys/kernel/debug/clk/*/clk_enable_count</div><div =
class=3D"">/sys/kernel/debug/clk/emmc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/osc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc_per/clk_enable_count:1</div></div><d=
iv class=3D""><br class=3D""></div><div class=3D"">Playing a sound with =
48000Hz sample-rate useing speaker-test and&nbsp;</div><div =
class=3D"">looking at the enabled clocks gives:</div><div class=3D""><div =
class=3D"">root@raspcm:~# grep -vE ^0 =
/sys/kernel/debug/clk/*/clk_enable_count</div><div =
class=3D"">/sys/kernel/debug/clk/emmc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/osc/clk_enable_count:2</div><div =
class=3D"">/sys/kernel/debug/clk/pcm/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc_per/clk_enable_count:1</div></div><d=
iv class=3D""><br class=3D""></div><div class=3D"">No issue when =
stopping - clocks then look like this:</div><div class=3D""><div =
class=3D"">root@raspcm:~# grep -vE ^0 =
/sys/kernel/debug/clk/*/clk_enable_count</div><div =
class=3D"">/sys/kernel/debug/clk/emmc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/osc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc_per/clk_enable_count:1</div><div =
class=3D""><br class=3D""></div></div><div class=3D"">So now playing a =
sound at 44100Hz sample rate gives no sound</div><div class=3D"">the =
clocks look like this:</div><div class=3D""><div class=3D"">root@raspcm:~#=
 grep -vE ^0 /sys/kernel/debug/clk/*/clk_enable_count</div><div =
class=3D"">/sys/kernel/debug/clk/emmc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/osc/clk_enable_count:2</div><div =
class=3D"">/sys/kernel/debug/clk/pcm/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc_per/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/plld/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/plld_per/clk_enable_count:1</div></div><d=
iv class=3D""><br class=3D""></div><div class=3D"">and when aborting the =
playback the machine crashes=E2=80=A6</div><div class=3D""><br =
class=3D""></div><div class=3D"">So it is fairly simple to see that this =
happens with an upstream</div><div class=3D"">kernel using 2 distinct =
cases.</div><div class=3D""><br class=3D""></div><div class=3D"">Using =
the =E2=80=9CIS_CRITICAL=E2=80=9D patch instead avoids crashing the hw =
in</div><div class=3D"">the above circumstances - clocks after boot look =
like this:</div><div class=3D""><div class=3D"">root@raspcm:~# grep -vE =
^0 /sys/kernel/debug/clk/*/clk_enable_count</div><div =
class=3D"">/sys/kernel/debug/clk/emmc/clk_enable_count:2</div><div =
class=3D"">/sys/kernel/debug/clk/h264/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/hsm/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/isp/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/osc/clk_enable_count:6</div><div =
class=3D"">/sys/kernel/debug/clk/otp/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/plla/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/plla_core/clk_enable_count:3</div><div =
class=3D"">/sys/kernel/debug/clk/pllc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc_per/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/plld/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/plld_per/clk_enable_count:2</div><div =
class=3D"">/sys/kernel/debug/clk/timer/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/tsens/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/uart/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/v3d/clk_enable_count:1</div></div><div =
class=3D""><br class=3D""></div><div class=3D"">There is one drawback =
with IS_CRITICAL is visible in the</div><div class=3D"">above: the emmc =
clock count goes up to 2.</div><div class=3D""><br class=3D""></div><div =
class=3D"">When playing with speaker-test the =E2=80=9Ccrash=E2=80=9D no =
longer happens,</div><div class=3D"">but there is still that issue with =
rmmod&nbsp;amba_pl011 still persists</div><div class=3D"">When =
loading/unloading while playing pcm still results in a crash</div><div =
class=3D"">but this time one can hear noise on the audio =
lines=E2=80=A6.</div><div class=3D""><br class=3D""></div><div =
class=3D"">So it is not perfect, but at least audio playback does not =
fail.</div><div class=3D""><br class=3D""></div><div class=3D"">Now =
finally with ENABLE_HAND_OFF:</div><div class=3D""><div =
class=3D"">root@raspcm:~# grep -vE ^0 =
/sys/kernel/debug/clk/*/clk_enable_count</div><div =
class=3D"">/sys/kernel/debug/clk/emmc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/h264/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/hsm/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/isp/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/osc/clk_enable_count:6</div><div =
class=3D"">/sys/kernel/debug/clk/otp/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/plla/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/plla_core/clk_enable_count:3</div><div =
class=3D"">/sys/kernel/debug/clk/pllc/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/pllc_per/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/plld/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/plld_per/clk_enable_count:2</div><div =
class=3D"">/sys/kernel/debug/clk/timer/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/tsens/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/uart/clk_enable_count:1</div><div =
class=3D"">/sys/kernel/debug/clk/v3d/clk_enable_count:1</div></div><div =
class=3D""><br class=3D""></div><div class=3D"">With the following =
observations:</div><div class=3D"">* audio again works</div><div =
class=3D"">* amba_pl011 remove still fails=E2=80=A6</div><div =
class=3D""><br class=3D""></div><div class=3D"">So hand-off for clocks =
still does not work for everything.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Especially we still have cases where =
enabling and then disabling</div><div class=3D"">a clock still can crash =
the system, but at least the emmc count</div><div class=3D"">stays at =
1.</div><div class=3D""><br class=3D""></div><div class=3D"">Finally: =
when marking the running pll_div with HAND_OFF or CITICAL</div><div =
class=3D"">in addition to the running clocks, then "rmmod amba_pl011" =
does no</div><div class=3D"">longer crash the system - instead it =
triggers the dmesg:&nbsp;</div><div class=3D"">Trying to free =
nonexistent resource &lt;0000000020201000-0000000020201fff&gt;</div><div =
class=3D""><br class=3D""></div><div class=3D"">But I guess this is a =
different issue.</div><div class=3D""><br class=3D""></div><div =
class=3D"">So as a way forward: should we enable pll_div also to =
CRITICAL</div><div class=3D"">and then HAND_OFF?</div><div class=3D""><br =
class=3D""></div><div class=3D"">Or should we just use HAND_OFF - when =
can we get HAND_OFF</div><div class=3D"">merged so that we can really =
make use of it without having to have a</div><div class=3D"">CRITICAL =
step in between?</div><div class=3D""><br class=3D""></div><div =
class=3D"">Assuming that we get ENABLE_HAND_OFF &nbsp;into clk-next, =
then I</div><div class=3D"">could create a new patch that:</div><div =
class=3D"">* only uses HAND_OFF&nbsp;</div><div class=3D"">&nbsp; =
&nbsp;(without the intermediate step of using CRITCAl)</div><div =
class=3D"">* marks running pll_divs and clocks as HAND_OFF.</div><div =
class=3D""><br class=3D""></div><div class=3D"">Thanks,</div><div =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>Martin</div><div class=3D""><br class=3D""></div><div =
class=3D""><div class=3D""><br class=3D"">
    <br class=3D"">
 =20

</div></div></body></html>=

--Apple-Mail=_D41E0F10-A33B-4A54-813E-EAF16F391440--
