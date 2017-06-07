Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <CAGb2v66QvLdojDe4+uG9Opa7fApA-GH9pW4v0En5j6QSPf1yZw@mail.gmail.com>
References: <20170602223006.1653-1-sboyd@codeaurora.org> <201706031243.qNvuUbQX%fengguang.wu@intel.com>
 <20170605144546.b6oh5sygrza22hbe@flea.lan> <CAK8P3a1Qvt4nvM5HeK-n87tsi2D5GBOmZo0rZv_Lp==CC=34Uw@mail.gmail.com>
 <CAGb2v66QvLdojDe4+uG9Opa7fApA-GH9pW4v0En5j6QSPf1yZw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 7 Jun 2017 09:36:34 +0200
Message-ID: <CAK8P3a38TyiHXBgB0DQka=0iASuyJO_zMrczXqYBiJj6LEnNWg@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: Move all clock types to a library
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, kbuild test robot <lkp@intel.com>,
	Stephen Boyd <sboyd@codeaurora.org>, kbuild-all@01.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jun 7, 2017 at 7:45 AM, Chen-Yu Tsai <wens@csie.org> wrote:
> at the bottom (with a comment) would be cleaner, and
> we wouldn't need to modify all the existing lines.
> AFAIK about Makefiles, that should work?

Ah, yes. That's much better.

      Arnd
