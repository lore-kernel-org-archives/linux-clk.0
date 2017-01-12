Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20170112220627.GQ17126@codeaurora.org>
References: <20170111134107.3821564-1-arnd@arndb.de> <20170112220627.GQ17126@codeaurora.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 12 Jan 2017 23:42:30 +0100
Message-ID: <CAK8P3a3ieV29jgh0jhioN3KjZCfP2drPAQme_+1oMuTTSiA4NQ@mail.gmail.com>
Subject: Re: [PATCH] clk: stm32f4: avoid uninitialized variable access
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>,
	Rob Herring <robh@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 12, 2017 at 11:06 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>
> Applied to clk-next. Seems I need to update my compiler to find
> these warnings.

I'm currently playing with gcc-7, which adds a lot of new warnings
(including many false positives). gcc-6 was supposed to have better
warnings than 5, but I didn't find the difference that noticeable. 5
or 6 is probably best at the moment, and if you have at least 4.9
there is no urgent need to upgrade.

    Arnd
