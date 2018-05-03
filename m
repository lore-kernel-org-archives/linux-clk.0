Return-Path: <TEJASP@xilinx.com>
Return-Path: tejas.patel@xilinx.com
From: Tejas Patel <tejas.patel@xilinx.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tejas Patel
	<tejas.patel@xilinx.com>
Subject: [PATCH] clk: divider: Use round off divisor instead of round up
Date: Thu, 3 May 2018 02:25:35 -0700
Message-ID: <1525339535-25595-1-git-send-email-tejas.patel@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

divider_get_val() is used to find clock divisor which is
giving round up value. So even though actual divisor is closer to
round down integer value it will return round up integer value.
This can result into large variation between expected clock rate and
actual clock rate.

See for example:
Parent rate is 1400MHz and desired child rate is 693MHz.
So if we calculate simple divisor for child clock it would be
1400000000/693000000 =3D 2.02. But, because of roundup logic
(DIV_ROUND_UP_ULL(1400000000, 693000000)) divisor returned from
divider_get_val() will be 3.

So actual child rate would be (1400000000/3) =3D 466666667 instead of
693000000. Here, difference between expected child rate and actual child
rate is approx 226MHz. So there is almost 32% error between desired and
actual clock rate.

Fix this by using round off value (DIV_ROUND_CLOSEST_ULL) instead of
round up/down.

Signed-off-by: Tejas Patel <tejas.patel@xilinx.com>
---
 drivers/clk/clk-divider.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index b6234a5..6ae6d43 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -391,7 +391,7 @@ int divider_get_val(unsigned long rate, unsigned long p=
arent_rate,
 {
        unsigned int div, value;

-       div =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+       div =3D DIV_ROUND_CLOSEST_ULL((u64)parent_rate, rate);

        if (!_is_valid_div(table, div, flags))
                return -EINVAL;
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
