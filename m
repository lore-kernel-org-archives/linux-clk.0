Return-Path: <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 6/7] meson: clk: Add support for clock gates
To: Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?Q?Alexander_M=c3=bcller?= <serveralex@gmail.com>,
 linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
 <1467741391-60534-7-git-send-email-serveralex@gmail.com>
 <b42e2bb3-2cd0-3115-9be4-16e3a48b46fd@codethink.co.uk>
 <146776626852.35356.9847034661606022714@resonance>
 <07f37b8b-cfd2-ebc6-a693-4372d6c34293@codethink.co.uk>
 <146779266886.35356.2727828069246665428@resonance>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Message-ID: <3d8bea0d-043e-b9ca-386c-3007f7989974@codethink.co.uk>
Date: Wed, 6 Jul 2016 09:50:49 +0100
MIME-Version: 1.0
In-Reply-To: <146779266886.35356.2727828069246665428@resonance>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 06/07/16 09:11, Michael Turquette wrote:
> Quoting Ben Dooks (2016-07-06 00:35:28)
>> On 06/07/16 01:51, Michael Turquette wrote:
>>> Hi Ben,
>>>
>>> Quoting Ben Dooks (2016-07-05 11:01:14)
>>>> On 05/07/16 18:56, Alexander Müller wrote:
>>>>> This patch adds support for the meson8b clock gates. Most of
>>>>> them are disabled by Amlogic U-Boot, but need to be enabled
>>>>> for ethernet, USB and many other components.
>>>>>
>>>>> Signed-off-by: Alexander Müller <serveralex@gmail.com>
>>>>> ---
>>>>
>>>> This seems to be a lot of structures for clocks that may
>>>> never be use. I think it would be better to provide a custom
>>>> lookup function that creates these as needed and use the ID
>>>> in the dt as a offset+bit id.
>>>
>>> We want the real clocks registered so that we can disable spuriously
>>> enabled at late_initcall time with clk_disable_unused.
>>>
>>> Furthermore, I'd like to not represent all of these gates in the DT
>>> binding description (see my response to the earlier patches in this
>>> series), since it becomes ABI (and a maintenance nightmare).
>>
>> Erm, so writing /more/ code and having them defined in /two/ places
>> is a nightmare? Sounds more of a nightmare of having the ID in the DT
>> represent the register/bit offset and then having them created at
>> lookup time.
> 
> I apologize, but I really don't understand what side of the argument
> that you are pushing for based on the above text. Something is a
> nightmare, but I'm not sure which design pattern you are attributing
> nightmare status too.
> 
> Anyways, clock string name is required always, so even if you encode
> register and bitfield in DT cleverly, you've still got data in C,
> assuming your point was to remove stuff from C. That might change some
> day, but not today. Memory footprint should remain the same with either
> implementation.

Is that actually useful for anything other than debug?

> If you have an alternative implementation, patches are always welcome.

I can think of a few ways we could do this, depending on how much
code is to be added either to the meson-clk driver or to something
that is more generic.

If we add gate support to the meson clkock driver, we could have
two implementations, we can either encode the reg/bit into the ID
and have a valid bitmask fro the clock registers to define which
are valid:

#define CLK81_GATE_BASE			(0x10000)
#define CLK81_GATE(__reg, __bit)	(CLK81_GATE_BASE + ((__reg) * 32) +
(__bit))

	clks: meson-clock-driver@xxx {
		valid-clk-masks = <...>, <...>, <...>;
	};

We could even have one sub-node for each 32bit gate


	clks: meson-clock-driver@xxx {
		clk81_gate0: {
			compatible = "meson,meson-gate-reg";
			valid-clk-mask = <0x1f1>;
		}
	};

Both of these allow easy changing of the bitmask or number of clock
gates in the DT. It also means the work is done in one place, and
is re-usable by other operating systems.

In this case, you could also have a generic clock gate driver which
could be define. I'll try and dig out my previous implementation of
this which may need a bit of updating.

clk81_gate0: clk-gate@regaddr {
	reg = <regaddr>;
	compatible = "clock,clock-32git-gate";
	valid-clocks = <0x1f1>;
	clk-parent = <&clk81>;
	has-single-parent;
};

Note, all these could be extended with a clk-names = "a", "b", "c";
and there is already precedent for having a list of valid clock
as an array of integers if bitmasks are not acceptable.

My side comes down to:

1) We end up with an ID to register mapping which is not clear to
   see from the DT to the actual register and bit combination being
   used.

2) If the DT is updated, then we have to update the kernel too if we
   are using the ID scheme suggested originally.

3) Some of the drivers would provide a generic solution to other SoCs

4) We could even re-use a generic clk-gate driver outside of AMLogic

5) This makes it easier to port to other operating systems as all the
   data is available in the DT. See also #1

A second note, if we don't want to register n*32 clocks then adding
a clk_unused callback called at the end of the initcalls could use
the mask/list of clocks to mask out the unused clocks so we don't
end up with unused clk structures lying aroudn (could even be a
cmdline or kconfig config)

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
