Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1530604912.2900.152.camel@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <1530604912.2900.152.camel@baylibre.com>
Message-ID: <153089990511.143105.13825086493199733880@swboyd.mtv.corp.google.com>
Subject: Re: [GIT PULL] Amlogic clock fixes for v4.18-rc
Date: Fri, 06 Jul 2018 10:58:25 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2018-07-03 01:01:52)
> Dear clock maintainers,
> =

> Below is a request to pull amlogic clock fixes for v4.18.
> =

> These are two simple fixes, yet the first one is quite important as it so=
lves
> boots hangs we've been having when FDIV2 gets disabled. This did not show=
 up
> before because this particular clock is heavily used and only gets disabl=
ed for
> a very short period of time before modules (such as ethernet or emmc) pro=
be.
> =


Thanks. Pulled into clk-fixes.
