Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Subject: Re: [PATCH] clk: sunxi: Accept a greater rate when setting a parent
 clock
To: Jean-Francois Moine <moinejf@free.fr>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
References: <20160310081658.B749246B@mail.free-electrons.com>
 <20160321072546.GT30977@lukather>
 <20160321092549.4e6245e4f02839e29aeb86a9@free.fr>
From: =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>
Message-ID: <56FC3BEB.8030106@elopez.com.ar>
Date: Wed, 30 Mar 2016 17:49:47 -0300
MIME-Version: 1.0
In-Reply-To: <20160321092549.4e6245e4f02839e29aeb86a9@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Chen-Yu Tsai <wens@csie.org>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="windows-1252"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

[Sorry for the delay, I meant to reply to this post a while back but I
forgot]

El 21/03/16 a las 05:25, Jean-Francois Moine escribi=F3:
> On Mon, 21 Mar 2016 08:25:46 +0100
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
> =

>>> -	/* find the parent that can help provide the fastest rate <=3D rate */
>>> +	/* find the parent that can help provide the fastest rate */
>>>  	num_parents =3D clk_hw_get_num_parents(hw);
>>>  	for (i =3D 0; i < num_parents; i++) {
>>>  		parent =3D clk_hw_get_parent_by_index(hw, i);
>>> @@ -100,7 +100,7 @@ static int clk_factors_determine_rate(struct clk_hw=
 *hw,
>>>  		child_rate =3D clk_factors_round_rate(hw, req->rate,
>>>  						    &parent_rate);
>>>  =

>>> -		if (child_rate <=3D req->rate && child_rate > best_child_rate) {
>>> +		if (child_rate > best_child_rate) {
>>
>> I'm not sure this would work, since you'll end up picking the fastest
>> rate without considering whether it is the closest or not.
>>
>> I guess what you want here is using the absolute difference between
>> the requested rate and the rate you're evaluating.
>>
>> That being said, we had a similar discussion for SPI around a month
>> ago where we wanted a rate strictly lower than the requested one. I
>> guess it's time to add a flag to tell how you want to round.
> =

> You are right, I just removed half of the constraint, but I still wonder
> why does this sequence introduced by the commit 862b728387aef3a37
> (clk: sunxi: factors: automatic reparenting support) do
> 	"provide the fastest rate <=3D rate"
> instead of
> 	"provide the closest rate" ?
> =

> Emilio?

Overclocking components is usually not a good default in my opinion. I
don't recall at the moment if there was some other justification apart
from playing it safe.

Cheers,
Emilio

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
