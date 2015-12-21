Return-Path: <heiko.stuebner@collabora.com>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko.stuebner@collabora.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-clk@vger.kernel.org, dianders@chromium.org, mturquette@baylibre.com, sboyd@codeaurora.org, Chris Zhong <zyw@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: only enter pll slow-mode directly before reboots on rk3288
Date: Mon, 21 Dec 2015 02:06:10 +0100
Message-ID: <2178082.zdAf6brHOY@diego>
In-Reply-To: <1705995.CL2pqRBHZb@diego>
References: <1705995.CL2pqRBHZb@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Freitag, 18. Dezember 2015, 19:33:50 schrieb Heiko St=FCbner:
> As commit 1d33929e2a2b ("clk: rockchip: switch PLLs to slow mode befo=
re
> reboot for rk3288") states, switching the PLLs to slow-mode is only
> necessary when rebooting using the soft-reset done through the CRU.
>=20
> The dwc2 controllers used create really big number of interrupts in
> special constellations involving usb-hubs and their number is so high=
,
> it can even overwhelm the interrupt handler if the cpu-speed os to lo=
w.
>=20
> Right now the PLLs are put into slow-mode in a shutdown syscore_ops
> callback which means it happens on all reboots (not only the soft-res=
et
> ones) and even on poweroff actions.
>=20
> This can result in the system not powering off and getting stuck inst=
ead,
> so we should move the slow-mode change nearer to the actual reboot ac=
tion.
>=20
> For this we introduce the possiblity to also set a callback that gets=

> called from the restart-handler directly prior to restarting the syst=
em
> and move the shutdown-callback to this new option.
>=20
> With this the slow-mode switch is done only on the necessary reboots
> and also has a smaller possibility of causing artifacts.
>=20
> Fixes: 1d33929e2a2b ("clk: rockchip: switch PLLs to slow mode before =
reboot
> for rk3288") Signed-off-by: Heiko Stuebner <heiko.stuebner@collabora.=
com>

applied to my clk branch for 4.5
