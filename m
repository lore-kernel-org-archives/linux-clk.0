Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, gabriel.fernandez@st.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1524556723-26926-1-git-send-email-gabriel.fernandez@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, olivier.bideau@st.com,
 Loic PALLARDY <loic.pallardy@st.com>,
 benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Gabriel Fernandez <gabriel.fernandez@st.com>
References: <1524556723-26926-1-git-send-email-gabriel.fernandez@st.com>
Message-ID: <152640858418.34267.5971648282268914967@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: stm32mp1: Add CLK_IGNORE_UNUSED to ck_sys_dbg clock
Date: Tue, 15 May 2018 11:23:04 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting gabriel.fernandez@st.com (2018-04-24 00:58:43)
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> =

> Don't disable the dbg clock if was set by bootloader.
> =

> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---

Applied to clk-next
