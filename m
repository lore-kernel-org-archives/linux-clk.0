Return-Path: <christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lars@metafoo.de,
	dan.carpenter@oracle.com,
	ssantosh@kernel.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/3] clk: keystone: Fix some error handling paths
Date: Mon, 24 Oct 2016 22:43:23 +0200
Message-Id: <cover.1477339880.git.christophe.jaillet@wanadoo.fr>
List-ID: <linux-clk.vger.kernel.org>

The first of these 3 patches is a v2 of a patch posted earlier.
The main change in this v2 is the propagation of the error returned by
'clk_register_pll()'.

The 2nd one is completely un-related and fixes some typo in error messages
spoted while looking at the file.

Finaly, the 3rd one refactors the '_of_pll_clk_init' function in order to
factorize some cleanups in case of error and to add some missing 'iounmap()'
calls if 'clk_register_pll()' fails.

These patches are un-compiled. I get some errors for some reasons in my build
environment. I've not checked further the root cause of these build errors
but I guess that my plateform is not what is expected to build this code.

Christophe JAILLET (3):
  clk: keystone: Fix an error checking
  clk: keystone: Fix some error messages
  clk: keystone: Fix missing iounmap calls in an error handling path

 drivers/clk/keystone/pll.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

-- 
2.9.3
