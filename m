Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35453 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751057AbeAVIze (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Jan 2018 03:55:34 -0500
Received: by mail-it0-f68.google.com with SMTP id e1so8937898ita.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2018 00:55:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1516375101-29836-2-git-send-email-geert+renesas@glider.be>
References: <1516375101-29836-1-git-send-email-geert+renesas@glider.be> <1516375101-29836-2-git-send-email-geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 Jan 2018 09:55:33 +0100
Message-ID: <CACRpkdZMSU1GUbEaJs0H2upGLmWYtp188awMESGfn+fVVTODrQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: sunxi: Use of_clk_get_parent_count() instead
 of open coding
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-gpio@vger.kernel.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-tegra@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jan 19, 2018 at 4:18 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
