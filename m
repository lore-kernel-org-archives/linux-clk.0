Return-Path: <tyler.baker@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20150718005313.GE30412@codeaurora.org>
References: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
	<1436241546-16731-6-git-send-email-dinguyen@opensource.altera.com>
	<20150718005313.GE30412@codeaurora.org>
Date: Tue, 21 Jul 2015 07:42:16 -0700
Message-ID: <CANMBJr6q7w4SzB2m4JPgwaAFPmSmQcVFu1Sq3EU0_k_Zx7Sa8A@mail.gmail.com>
Subject: Re: [PATCHv2 5/6] clk: sunxi: make use of of_clk_parent_fill helper function
From: Tyler Baker <tyler.baker@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: dinguyen@opensource.altera.com, Mike Turquette <mturquette@linaro.org>,
	dinh.linux@gmail.com, linux-clk@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

On 17 July 2015 at 17:53, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 07/06, dinguyen@opensource.altera.com wrote:
>> From: Dinh Nguyen <dinguyen@opensource.altera.com>
>>
>> Use of_clk_parent_fill to fill in the parent clock names' array.
>>
>> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
>> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
>> Cc: "Emilio L=C3=B3pez" <emilio@elopez.com.ar>
>> ---
>
> Applied to clk-next with that fix I posted.

The kernelci.org bot reported sunxi a20 boot failures[1][2] in
next-20150720 and next-20150721. I have bisected[3] these failures to
this commit. However, I have not investigated any further but
reverting this commit on top of next-20150721 gets the boards booting
again.

Cheers,

Tyler

[1] http://storage.kernelci.org/next/next-20150721/arm-sunxi_defconfig/lab-=
tbaker/boot-sun7i-a20-cubietruck.html
[2] http://storage.kernelci.org/next/next-20150721/arm-multi_v7_defconfig+C=
ONFIG_PROVE_LOCKING=3Dy/lab-mhart/boot-sun7i-a20-cubieboard2.html
[3] http://hastebin.com/nehatedece.vhdl
