Return-Path: <tyler.baker@linaro.org>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1507211020420.22725@linux-builds1>
References: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
	<1436241546-16731-6-git-send-email-dinguyen@opensource.altera.com>
	<20150718005313.GE30412@codeaurora.org>
	<CANMBJr6q7w4SzB2m4JPgwaAFPmSmQcVFu1Sq3EU0_k_Zx7Sa8A@mail.gmail.com>
	<alpine.DEB.2.02.1507211020420.22725@linux-builds1>
Date: Tue, 21 Jul 2015 09:29:17 -0700
Message-ID: <CANMBJr5FCib=+JG9hdGehbxhayFDkTp341mNCnFTiS0GpGxZZw@mail.gmail.com>
Subject: Re: [PATCHv2 5/6] clk: sunxi: make use of of_clk_parent_fill helper function
From: Tyler Baker <tyler.baker@linaro.org>
To: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, dinh.linux@gmail.com,
	linux-clk@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Dinh,

On 21 July 2015 at 08:22, Dinh Nguyen <dinguyen@opensource.altera.com> wrot=
e:
> On Tue, 21 Jul 2015, Tyler Baker wrote:
>
>> Hi,
>>
>> On 17 July 2015 at 17:53, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> > On 07/06, dinguyen@opensource.altera.com wrote:
>> >> From: Dinh Nguyen <dinguyen@opensource.altera.com>
>> >>
>> >> Use of_clk_parent_fill to fill in the parent clock names' array.
>> >>
>> >> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
>> >> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
>> >> Cc: "Emilio L=C3=B3pez" <emilio@elopez.com.ar>
>> >> ---
>> >
>> > Applied to clk-next with that fix I posted.
>>
>> The kernelci.org bot reported sunxi a20 boot failures[1][2] in
>> next-20150720 and next-20150721. I have bisected[3] these failures to
>> this commit. However, I have not investigated any further but
>> reverting this commit on top of next-20150721 gets the boards booting
>> again.
>>
>
> Can you please try this patch?

I've tested the patch below on top of next-20150721 and can confirm it
fixes the sunxi a20 issues I've reported.

> -->8-
>
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.=
c
> index e8c5185..958655f 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -204,7 +204,7 @@ static void __init sun6i_ahb1_clk_setup(struct device=
_node *node)
>                 return;
>
>         /* we have a mux, we will have >1 parents */
> -       of_clk_parent_fill(node, parents, SUN6I_AHB1_MAX_PARENTS);
> +       i =3D of_clk_parent_fill(node, parents, SUN6I_AHB1_MAX_PARENTS);
>         of_property_read_string(node, "clock-output-names", &clk_name);
>
>         ahb1 =3D kzalloc(sizeof(struct sun6i_ahb1_clk), GFP_KERNEL);
> @@ -789,7 +789,7 @@ static void __init sunxi_mux_clk_setup(struct device_=
node *node,
>
>         reg =3D of_iomap(node, 0);
>
> -       of_clk_parent_fill(node, parents, SUNXI_MAX_PARENTS);
> +       i =3D of_clk_parent_fill(node, parents, SUNXI_MAX_PARENTS);
>         of_property_read_string(node, "clock-output-names", &clk_name);
>
>         clk =3D clk_register_mux(NULL, clk_name, parents, i,

Thanks,

Tyler
