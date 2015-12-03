Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] clk: let of_clk_get_parent_name() fail for invalid clock-indices
Date: Thu,  3 Dec 2015 11:20:35 +0900
Message-Id: <1449109235-27214-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Currently, of_clk_get_parent_name() returns a wrong parent clock name
when "clock-indices" property exists and the target index is not
found in the property.  In this case, NULL should be returned.

For example,

        oscillator {
                compatible = "myclocktype";
                #clock-cells = <1>;
                clock-indices = <1>, <3>;
                clock-output-names = "clka", "clkb";
        };

        consumer {
                compatible = "myclockconsumer";
                clocks = <&oscillator 0>, <&oscillator 1>;
        };

Currently, of_clk_get_parent_name(consumer_np, 0) returns "clka"
(and of_clk_get_parent_name(consumer_np, 1) also returns "clka",
this is correct).   Because the "clock-indices" in the clock parent
does not contain <0>, of_clk_get_parent_name(consumer_np, 0) should
return NULL.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
  - Choose the least invasive way

Changes in v2:
  - Rephrase the git-log

 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 88a723b..1d95033 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3079,6 +3079,9 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 		}
 		count++;
 	}
+	/* We went off the end of 'clock-indices' without finding it */
+	if (prop && !vp)
+		return NULL;
 
 	if (of_property_read_string_index(clkspec.np, "clock-output-names",
 					  index,
-- 
1.9.1
