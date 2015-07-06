Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20150702165914.GE7201@codeaurora.org>
References: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org>
 <1435068567-30995-9-git-send-email-gabriel.fernandez@linaro.org> <20150702165914.GE7201@codeaurora.org>
From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Date: Mon, 6 Jul 2015 10:00:54 +0200
Message-ID: <CAG374jC1fABjS3H+umrqVG2M0OXEHgj3pF0e9R7V0X1rjvvC9g@mail.gmail.com>
Subject: Re: [PATCH 8/9] drivers: clk: st: Rename st_pll3200c32_407_c0_x into st_pll3200c32_cx_x
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Srinivas Kandagatla <srinivas.kandagatla@gmail.com>,
	Maxime Coquelin <maxime.coquelin@st.com>,
	Patrice Chotard <patrice.chotard@st.com>,
	Russell King <linux@arm.linux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
	Olivier Bideau <olivier.bideau@st.com>,
	Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fabian Frederick <fabf@skynet.be>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"kernel@stlinux.com" <kernel@stlinux.com>,
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

Sorry for the delay i was in day off.

Yes it's just a cleanup but it's to prepare introduction of new
platform which use this PLL.

If you want apply only fixes we can drop these last two patches.

And in a second phase,  deals with Maxime to avoid break compatibility.

BR

Gabriel.

On 2 July 2015 at 18:59, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 06/23, Gabriel Fernandez wrote:
>> Use a generic name for this kind of PLL
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
>
> Is this just a cleanup/nicety? I could take this patch but patch
> 9 needs to go through arm-soc and then we have to deal with DT
> incompatibility. How about we drop these last two patches?
>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
