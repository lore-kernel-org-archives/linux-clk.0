Return-Path: <cw00.choi@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Message-id: <57BBB66E.2060807@samsung.com>
Date: Tue, 23 Aug 2016 11:35:26 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@baylibre.com,
 kgene@kernel.org, k.kozlowski@samsung.com, chanwoo@kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: samsung: exynos5260: Move struct samsung_cmu_info
 to init section
References: <1471834185-20249-1-git-send-email-cw00.choi@samsung.com>
 <1471834185-20249-2-git-send-email-cw00.choi@samsung.com>
 <CGME20160823005523epcas1p3993794ba487bb055cbf8a0b247fcb280@epcas1p3.samsung.com>
 <20160823005512.GP6502@codeaurora.org>
In-reply-to: <20160823005512.GP6502@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 2016=EB=85=84 08=EC=9B=94 23=EC=9D=BC 09:55, Stephen Boyd wrote:
> On 08/22, Chanwoo Choi wrote:
>> This patch moves the all samsung_cmu_info struct to initconst section
>> because they are used only in initconst section.
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> ---
>>  drivers/clk/samsung/clk-exynos5260.c | 350 +++++++++++++++++------------------
>>  1 file changed, 175 insertions(+), 175 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos5260.c b/drivers/clk/samsung/clk-exynos5260.c
>> index a43642c36039..fd1d9bfc151b 100644
>> --- a/drivers/clk/samsung/clk-exynos5260.c
>> +++ b/drivers/clk/samsung/clk-exynos5260.c
>> @@ -131,21 +131,21 @@ static const struct samsung_gate_clock aud_gate_clks[] __initconst =3D {
>>  			EN_IP_AUD, 4, 0, 0),
>>  };
>>  
>> +static const struct samsung_cmu_info aud_cmu __initconst =3D {
>> +	.mux_clks	=3D aud_mux_clks,
>> +	.nr_mux_clks	=3D ARRAY_SIZE(aud_mux_clks),
>> +	.div_clks	=3D aud_div_clks,
>> +	.nr_div_clks	=3D ARRAY_SIZE(aud_div_clks),
>> +	.gate_clks	=3D aud_gate_clks,
>> +	.nr_gate_clks	=3D ARRAY_SIZE(aud_gate_clks),
>> +	.nr_clk_ids	=3D AUD_NR_CLK,
>> +	.clk_regs	=3D aud_clk_regs,
>> +	.nr_clk_regs	=3D ARRAY_SIZE(aud_clk_regs),
>> +};
>> +
>>  static void __init exynos5260_clk_aud_init(struct device_node *np)
>>  {
>> -	struct samsung_cmu_info cmu =3D { NULL };
>> -
> 
> I presume this was done this way to save some initdata space by
> only allocating the array that's needed at runtime=3F I would
> expect to see some more kernel image bloat from this change but
> runtime memory usage would stay the same. Is there any real
> benefit from this patch though=3F
> 

After this patch, 'struct samsung_cmu_info' size should be added
to kernel image and then the size of deleted code should be removed
from kernel image. I think that it is not bloating.
(struct samsung_cmu_info includes the pointer and integer value.)

This patch make the code more simple and improve the readability.
And, the samsung_cmu_register_on() requires the 'const' type
argument for 'struct samsung_cmu_info'.

Regards,
Chanwoo Choi
