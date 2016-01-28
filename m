Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2] clk: Move vendor's Kconfig into CCF menu section
To: James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>
References: <1453971537-5510-1-git-send-email-jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Mike Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <56AA1032.70001@samsung.com>
Date: Thu, 28 Jan 2016 13:57:22 +0100
MIME-version: 1.0
In-reply-to: <1453971537-5510-1-git-send-email-jamesjj.liao@mediatek.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 28/01/16 09:58, James Liao wrote:
> Move all vendor's Kconfig into CCF menu section to prevent
> new drivers putting their Kconfig files in a wrong place.
> 
> Some Kconigs need to modify at the same time to avoid build

"Some Kconfigs need to be modified..." ?

> warnings.
> 
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> ---
> This patch is based on v4.5-rc1.
> 
> changes since v1:
> - Modify s3c24xx and samsung's Kconfig to avoid build warngings.
> 
>  arch/arm/mach-s3c24xx/Kconfig | 1 +
>  drivers/clk/Kconfig           | 8 +++-----
>  drivers/clk/samsung/Kconfig   | 1 -
>  3 files changed, 4 insertions(+), 6 deletions(-)

For the samsung code changes:

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Thanks,
Sylwester
