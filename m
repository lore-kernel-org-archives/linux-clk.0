Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Heiko Stuebner <heiko@sntech.de>
To: Derek Basehore <dbasehore@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH] clk: rockchip: Add 1.6GHz PLL rate
Date: Wed, 14 Mar 2018 00:38:40 +0100
Message-ID: <13704601.M15qmmjcHi@phil>
In-Reply-To: <20180313203719.75639-1-dbasehore@chromium.org>
References: <20180313203719.75639-1-dbasehore@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 13. März 2018, 21:37:19 CET schrieb Derek Basehore:
> We need this rate to generate 100, 200, and 228.57MHz from the same
> PLL. 228.57MHz is useful for a pixel clock when the VPLL is used for
> and external display.
> 
> Signed-off-by: Derek Basehore <dbasehore@chromium.org>

applied for 4.17

Thanks
Heiko
