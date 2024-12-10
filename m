Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C08223DEAD
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 16:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733847951; cv=none; b=llfobnQ+mC90lPsbdtzlwE1piu4S4DrZTlI7jtFGVsIXzFoG4Kpi8AqXOyxdPRw1ag/PaszokWtiO4GPrADtkuGw8d57Mcv75agpS+b1IOWZ9mHV8p1Jqg4o/ReoX0HCIxspV7/Tuw6hiW18I4QzdiOP9mxF54U7ZPHFIPTBMKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733847951; c=relaxed/simple;
	bh=lNDEl1jFraHMx+yjBlSG6hrmLnmDOXsjaHrVuUlWP5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Am8efpiL6pHd/ToaRIn0RF/ZA5bvnLLzYZ/VIphPwKlNOtB21m3jad2dtwi8tKphaMKgVdSuJ0OHUZzTHLVwmMxabih1MNJfQe1dAPdNxxT3o/bUT5BBd4xl0lf/TUqnK3B+69PAW7hnGF8IJeeOIdIocHfziIrJ67bJU4zUvF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=yurxfwQ7; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="yurxfwQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1733847942;
 bh=Rfks6ZTiwp1kxRzHwe4qrzjZlR1gfefb3q3lO/fYtDA=;
 b=yurxfwQ7unIjEb47s7vUlZ5nmET+d0VFLe6GN+5yltcPCDp55mdq2yk34tDlbS1JKKK26E+6Q
 BuA01kE/9Q2TbpPFlrERXB1zdYKsJMIxjHKT11m/ehftMhBLy3ywdXesujxDSIlMk4auO5xK/IX
 IoihvM5L/pGdCuFof4QVP2sKMBuQ7TALx9EzorM+fdc9WgSrMpoJXwXqQRXGPUV3qEp0e5MjGAL
 GOwHoJVAXmn1NpbS9KXfk3et5WGdZ8iCMmm70veO9F+NN55Q+rfvPYdC652EjICEVx1lejT3FQm
 K64+FyWCPm6yF+6fHKu4ptB2KpLyvQWFpgssZ/GmBhXA==
Message-ID: <304fd668-0e61-4f5e-a12c-36fd7e54ab6e@kwiboo.se>
Date: Tue, 10 Dec 2024 17:25:34 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: rockchip: fix wrong clk_ref_usb3otg parent for
 rk3328
To: Peter Geis <pgwipeout@gmail.com>, Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Elaine Zhang
 <zhangqing@rock-chips.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20241210013010.81257-1-pgwipeout@gmail.com>
 <20241210013010.81257-3-pgwipeout@gmail.com>
 <0d11705121f29ccfb7cfa342505a6e35@manjaro.org>
 <CAMdYzYqJLK6oJHCUVztth6mtJsYrRQSPzNYpR-ZmR7rNprZXfg@mail.gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CAMdYzYqJLK6oJHCUVztth6mtJsYrRQSPzNYpR-ZmR7rNprZXfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 67586b83ce9f514b1380d1a4

On 2024-12-10 14:27, Peter Geis wrote:
> On Tue, Dec 10, 2024 at 4:44 AM Dragan Simic <dsimic@manjaro.org> wrote:
>>
>> Hello Peter,
>>
>> On 2024-12-10 02:30, Peter Geis wrote:
>>> Correct the clk_ref_usb3otg parent to fix clock control for the usb3
>>> controller on rk3328. Verified against the rk3328 trm and usb3 clock
>>> tree
>>> documentation.
>>>
>>> Fixes: fe3511ad8a1c ("clk: rockchip: add clock controller for rk3328")
>>> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>>> ---
>>>
>>>  drivers/clk/rockchip/clk-rk3328.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/rockchip/clk-rk3328.c
>>> b/drivers/clk/rockchip/clk-rk3328.c
>>> index 3bb87b27b662..cf60fcf2fa5c 100644
>>> --- a/drivers/clk/rockchip/clk-rk3328.c
>>> +++ b/drivers/clk/rockchip/clk-rk3328.c
>>> @@ -201,7 +201,7 @@ PNAME(mux_aclk_peri_pre_p)        = { "cpll_peri",
>>>                                   "gpll_peri",
>>>                                   "hdmiphy_peri" };
>>>  PNAME(mux_ref_usb3otg_src_p) = { "xin24m",
>>> -                                 "clk_usb3otg_ref" };
>>> +                                 "clk_ref_usb3otg_src" };
>>>  PNAME(mux_xin24m_32k_p)              = { "xin24m",
>>>                                   "clk_rtc32k" };
>>>  PNAME(mux_mac2io_src_p)              = { "clk_mac2io_src",
>>
>> Sorry, but I was unable to verify this in the part 1 of the
>> RK3328 TRM, in both versions 1.1 and 1.2, which is all I have
>> when it comes to the RK3328 TRM.  Is that maybe described in
>> the part 2, which I've been unable to locate for years?
>>
>> Moreover, the downstream kernel source from Rockchip does it
>> the way [1] it's currently done in the mainline kernel, which
>> makes me confused a bit?  Could you, please, provide more
>> details about the two references you mentioned in the patch
>> description, or maybe even you could provide the links to
>> those two references?
>>
>> [1]
>> https://raw.githubusercontent.com/rockchip-linux/kernel/refs/heads/develop-4.4/drivers/clk/rockchip/clk-rk3328.c
> 
> It is unfortunate the TRM doesn't include the clock maps, because they
> are extremely helpful when one can acquire them. It also doesn't help
> that the TRM register definition only referred to this as "pll". I was
> sent specifically the usb3 phy clock map for my work on the driver,
> which had the location of each switch and divider along with the
> register and bit that controlled it. That combined with the TRM
> register map allowed me to find this error.

I can also confirm that the changes in this patch matches Fig. 3-8
RK3228H Clock Architecture Diagram 7 for the USB3OTG block.

                                    XIN24M -\
                                             S45_8 - ref_clk_usb3otg
S45_7 (2PLL) / G4_9 / S45_0 (DivFree 1~64) -/

Regards,
Jonas

> 
> Thanks!
> Peter
> 

