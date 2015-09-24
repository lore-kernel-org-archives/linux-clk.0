Return-Path: <zhengxing@rock-chips.com>
Message-ID: <56036EAE.9040201@rock-chips.com>
Date: Thu, 24 Sep 2015 11:31:58 +0800
From: Xing Zheng <zhengxing@rock-chips.com>
MIME-Version: 1.0
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
CC: linux-rockchip@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/9] clk: rockchip: add clock controller for rk3036
References: <1442478540-15068-1-git-send-email-zhengxing@rock-chips.com> <1442478540-15068-4-git-send-email-zhengxing@rock-chips.com> <1775899.zcIuq65f1o@diego> <5603683F.4020302@rock-chips.com>
In-Reply-To: <5603683F.4020302@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 2015年09月24日 11:04, Xing Zheng wrote:
>>>
>>>   #define RK3066_PLL_RATE(_rate, _nr, _nf, _no)    \
>>> @@ -95,12 +106,31 @@ enum rockchip_pll_type {
>>>       .nb = _nb,                        \
>>>   }
>>>
>>> +#define RK3036_PLL_RATE(_rate, _refdiv, _fbdiv, _postdiv1,    \
>>> +            _postdiv2, _dsmpd, _frac)        \
>>> +{                                \
>>> +    .rate    = _rate##U,                    \
>>> +    .fbdiv = _fbdiv,                    \
>>> +    .postdiv1 = _postdiv1,                    \
>>> +    .refdiv = _refdiv,                    \
>>> +    .postdiv2 = _postdiv2,                    \
>>> +    .dsmpd = _dsmpd,                    \
>>> +    .frac = _frac,                        \
>>> +}
>>> +
>>>   struct rockchip_pll_rate_table {
>>>       unsigned long rate;
>>>       unsigned int nr;
>>>       unsigned int nf;
>>>       unsigned int no;
>>>       unsigned int nb;
>>> +    /* for RK3036 */
>>> +    unsigned int fbdiv;
>>> +    unsigned int postdiv1;
>>> +    unsigned int refdiv;
>>> +    unsigned int postdiv2;
>>> +    unsigned int dsmpd;
>>> +    unsigned int frac;
>> same for these 2 ... should be part of the pll addition itself
>   };
> Done.
>
Sorry, I have one question:
The "struct rockchip_pll_rate_table" is called in "rockchip/clk-pll.c" 
on many functions, I think I could add a struct like:
struct rk3036_pll_rate_table {
     unsigned int fbdiv;
     unsigned int postdiv1;
     unsigned int refdiv;
     unsigned int postdiv2;
     unsigned int dsmpd;
     unsigned int frac;
};
but, it will add many redundancy codes in "rockchip/clk-pll.c" just for 
call "struct rk3036_pll_rate_table".

Thanks.
