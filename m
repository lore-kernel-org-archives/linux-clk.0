Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180312093248.27512-1-benjamin.gaignard@st.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
References: <20180312093248.27512-1-benjamin.gaignard@st.com>
Message-ID: <152149259615.242365.15902281411022279273@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3] clk: stm32: add configuration flags for each of the stm32
 drivers
Date: Mon, 19 Mar 2018 13:49:56 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Benjamin Gaignard (2018-03-12 02:32:48)
> Add two configuration flags to be able to not compile all the time
> stm32f and stm32h7 drivers when ARCH_STM32 is set.
> That help to save some space on those small platforms.
> =

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Acked-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---

Applied to clk-next
