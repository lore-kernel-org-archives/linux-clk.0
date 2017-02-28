Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 0/2] rockchip: fix serial output on rk3036
Date: Tue, 28 Feb 2017 19:12:12 +0100
Message-Id: <20170228181214.6413-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

Recent changes to the 8250-dw variant revealed issues concerning
how the clock rates are handled on the rk3036 uart.

For one, there was an error in the clock declaration, but also the
shared uart-pll-select-mux also as default got supplied from the apll
that also supplies the cpu and thus gets frequency scaled.

The patches in this series remedy this and make the debug uart
function again on 4.10 + current merge window.


As for the merge-path, I've now tested all Rockchip socs I have access
to (3036, 3288, 3368, 3399) and didn't find any more clock-related issues
with the merge-window as of today. So if no other subtle issue turns up
this week, these should be all fixes for the 4.11 cycle.
So these 2 patches could be picked up by clock-maintainers directly if
so desired, or I can send a pull request after the merge-window closes
and we're save to say that nothing else broke.


changes in v2:
- Fixes tag for the missing ","
- do reparenting in the driver itself
- drop clock-id addition, as they're not needed for the fix anymore

Heiko Stuebner (2):
  clk: rockchip: add "," to mux_pll_src_apll_dpll_gpll_usb480m_p on
    rk3036
  clk: rockchip: Make uartpll a child of the gpll on rk3036

 drivers/clk/rockchip/clk-rk3036.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

-- 
2.11.0
