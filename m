Return-Path: <carlo.caione@gmail.com>
Return-Path: <carlo.caione@gmail.com>
Sender: Carlo Caione <carlo.caione@gmail.com>
Date: Tue, 5 Jul 2016 20:55:27 +0200
From: Carlo Caione <carlo@caione.org>
To: Alexander =?utf-8?Q?M=C3=BCller?= <serveralex@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/7] clk: meson: Rename meson8b-clkc.c to reflect gxbb
 naming convention
Message-ID: <20160705185527.GA17348@localhost>
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
 <1467741391-60534-2-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1467741391-60534-2-git-send-email-serveralex@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/07/16 19:56, Alexander Müller wrote:
> Signed-off-by: Alexander Müller <serveralex@gmail.com>
> ---
>  drivers/clk/meson/Makefile       |   2 +-
>  drivers/clk/meson/meson8b-clkc.c | 458 ---------------------------------------
>  drivers/clk/meson/meson8b.c      | 458 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 459 insertions(+), 459 deletions(-)
>  delete mode 100644 drivers/clk/meson/meson8b-clkc.c
>  create mode 100644 drivers/clk/meson/meson8b.c

Can you create the patch passing the '-M' parameter to git-format-patch
to detect renames?

Thanks,

-- 
Carlo Caione
