Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH 4/5] clk: samsung: Add support for EPLL on exynos5410
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
 <1471883463-1950-5-git-send-email-s.nawrocki@samsung.com>
 <74d97f1b-6a3a-78f1-6d96-b0d0b9717ab2@samsung.com>
 <fe67f53a-b5cd-1ff2-ae9f-7bce6b3d33b8@samsung.com>
 <20160902173241.GB9022@kozik-lap>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-clk@vger.kernel.org,
 tomasz.figa@gmail.com, sboyd@codeaurora.org, mturquette@baylibre.com,
 kgene@kernel.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <fa9b00c6-d33c-cb24-c230-01669a69ec03@samsung.com>
Date: Mon, 05 Sep 2016 09:48:51 +0200
MIME-version: 1.0
In-reply-to: <20160902173241.GB9022@kozik-lap>
Content-type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 09/02/2016 07:32 PM, Krzysztof Kozlowski wrote:
> On Fri, Sep 02, 2016 at 05:15:31PM +0200, Sylwester Nawrocki wrote:
>> > On 08/30/2016 12:36 PM, Krzysztof Kozlowski wrote:
>>> > > On 08/22/2016 06:31 PM, Sylwester Nawrocki wrote:
>>>> > >> This patch adds code instantiating the EPLL, which is used as the
>>>> > >> audio subsystem's root clock.
>>>> > >> The requirement to specify the external root clock in clocks property
>>>> > >> is also added.
>>> > > 
>>> > > I think the requirement was there already but explained little bit
>>> > > differently:
>>> > > 19 External clock:
>>> > > 20
>>> > > 21 There is clock that is generated outside the SoC. It
>>> > > 22 is expected that it is defined using standard clock bindings
>>> > > 23 with following clock-output-name:
>>> > > 24
>>> > > 25  - "fin_pll" - PLL input clock from XXTI
>>> > >
>>> > > so you can just combine them. Driver now will require the fin_pll in two
>>> > > ways:
>>> > > 1. Old lookup by "fin_pll" name.
>>> > > 2. of_clk_get of yours.
>> > 
>> > I'm not sure what do you mean exactly, I'm also adding in this patch a sentence
>> > right after the text as quoted above saying that:
>> > 
>> > "This clock should be listed in the clocks property of the controller node."
>> > 
>> > The description of the consumer clock (the main clock controller's parent clock)
>> > was not in the binding so far, there is no "clocks" property in the list of
>> > required properties.
>
> First of all, in commit message, you are not adding the requirement...
> it was present already, I think. Wasn't it?

I guess we could say it was there, but the documentation was unclear
enough so that link between the oscillator clock and the main clocks
controller is missing in many dts files.

> As for the code, I am saying that you are duplicating the information.
> There is already an paragraph for external clock. You are adding a new
> one before and extending it... just make it simpler - mention external
> clock in one place.

Ah, now I see, indeed it makes sense to delete the "External clock"
paragraph.  I'll reword then the clocks property description to:

- clocks: should contain an entry specifying the root clock from external
  oscillator supplied through XXTI or XusbXTI pin.  This clock should be
  defined using standard clock bindings with "fin_pll" clock-output-name.
  The "fin_pll" clock is being passed internally to the 9 PLLs.

--
Thanks,
Sylwester
