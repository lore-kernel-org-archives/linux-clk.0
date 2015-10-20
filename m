Return-Path: <manabian@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20151019222644.GC19782@codeaurora.org>
References: <1440527643-2960-1-git-send-email-manabian@gmail.com>
	<1440527643-2960-2-git-send-email-manabian@gmail.com>
	<20151019222644.GC19782@codeaurora.org>
Date: Tue, 20 Oct 2015 12:42:14 +0200
Message-ID: <CAGhQ9Vzi6SqhAfKW9VAeHNT50ywvHCgQ-movNXjc1dKZa9Ex5g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: lpc18xx-ccu: fix potential system hang when
 disabling unused clocks
From: Joachim  Eastwood <manabian@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 20 October 2015 at 00:26, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 08/25, Joachim Eastwood wrote:
>> CCU branch clock register must only be accessed while the base
>> (parent) clock is running. Access with a disabled base clock
>> will cause the system to hang. Fix this issue by adding code
>> that check if the parent clock is running in the is_enabled
>> clk_ops callback.
>>
>> This hang would occur when disabling unused clocks after AMBA
>> runtime pm had already disabled some of the clocks.
>>
>> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
>> ---
>>
>> No changes from v1.
>>
>>  drivers/clk/nxp/clk-lpc18xx-ccu.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/clk/nxp/clk-lpc18xx-ccu.c b/drivers/clk/nxp/clk-lpc18xx-ccu.c
>> index eeaee97da110..1845476e635e 100644
>> --- a/drivers/clk/nxp/clk-lpc18xx-ccu.c
>> +++ b/drivers/clk/nxp/clk-lpc18xx-ccu.c
>> @@ -180,6 +180,20 @@ static void lpc18xx_ccu_gate_disable(struct clk_hw *hw)
>>  static int lpc18xx_ccu_gate_is_enabled(struct clk_hw *hw)
>>  {
>>       struct clk_gate *gate = to_clk_gate(hw);
>> +     struct clk *parent;
>> +
>> +     /*
>> +      * The branch clock registers are only accessible
>> +      * if the base (parent) clock is enabled. Register
>> +      * access with a disabled base clock will hang the
>> +      * system.
>> +      */
>> +     parent = clk_get_parent(hw->clk);
>
> Why not use provider APIs (clk_hw_get_parent and we could add a
> clk_hw_is_enabled)?

That is simply because I didn't know it existed.
Adding a clk_hw_is_enabled() seems like a good idea to me.


>I also wonder why we don't just read the
> register directly here instead of going through the framework to
> find out if the parent is enabled?

Reading the register when the parent clock is off will hang the hardware.


> It may also make sense to "optimize" the disable unused code to
> do a depth first search for a disabled clock and then disable
> clocks from the leaves to the root. That would avoid this problem
> right?

As long the leaf clock registers that has a disabled parent clock is
not touched it will solve the problem I have.


regards,
Joachim Eastwood
