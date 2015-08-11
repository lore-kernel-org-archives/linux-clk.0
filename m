Return-Path: <maxime.coquelin@st.com>
Message-ID: <55C9C82F.6060401@st.com>
Date: Tue, 11 Aug 2015 12:02:23 +0200
From: Maxime Coquelin <maxime.coquelin@st.com>
MIME-Version: 1.0
To: Lee Jones <lee.jones@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@codeaurora.org>, <maxime.ripard@free-electrons.com>,
        <s.hauer@pengutronix.de>, <geert@linux-m68k.org>
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com> <1438974570-20812-4-git-send-email-mturquette@baylibre.com> <20150810144811.GN3249@x1> <20150810185516.2416.32293@quantum> <20150811084329.GA13374@x1>
In-Reply-To: <20150811084329.GA13374@x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

On 08/11/2015 10:43 AM, Lee Jones wrote:
> On Mon, 10 Aug 2015, Michael Turquette wrote:
>
>>
>>
>> ST's driver is an unfortunate case. All of the clock data was shoved
>> into DT before we had a clue that doing so is a terrible idea.

I tend to agree, and wouldn't do it this way if we could rewrite the 
history.
But now, we have to support it.

How can we pass CLK_ENABLE_HAND_OFF flag to a specific clock on STi 
platform?

Could we imagine having a kind of "clocks-enable-hand-off" property we 
could use in our clock controller DT node?

Regards,
Maxime
