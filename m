Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20170811025134.ee4v2tbol2pjcd4i@rob-hp-laptop>
References: <20170808012540.16691-1-net147@gmail.com> <20170811025134.ee4v2tbol2pjcd4i@rob-hp-laptop>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 11 Aug 2017 22:13:09 +0800
Message-ID: <CAGb2v661S=a0Bzp4yAoTHKb2YaDURmDczEGjMOEGwgEqXo5ddg@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH] dt-bindings: clock: sunxi-ccu: Add
 compatibles for sun5i CCU driver
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Liu <net147@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Fri, Aug 11, 2017 at 10:51 AM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Aug 08, 2017 at 11:25:40AM +1000, Jonathan Liu wrote:
>> The bindings were not updated when the sun5i CCU driver was added in
>> commit 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver").
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>
> Acked-by: Rob Herring <robh@kernel.org>

Applied for 4.14.

ChenYu
