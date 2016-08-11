Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 01/10] clk: Fix inconsistencies in usage of data types
Date: Thu, 11 Aug 2016 14:10:49 +0530
Message-Id: <1470904858-11930-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

index is of type u8 in all places except in clk_hw_get_parent_by_index()
and return value of all round_rate functions is long except for
clk_hw_round_rate(). Make them consistent with the rest of the places

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/clk.c            | 4 ++--
 include/linux/clk-provider.h | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 820a939..e768071 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -261,7 +261,7 @@ static struct clk_core *clk_core_get_parent_by_index(struct clk_core *core,
 }
 
 struct clk_hw *
-clk_hw_get_parent_by_index(const struct clk_hw *hw, unsigned int index)
+clk_hw_get_parent_by_index(const struct clk_hw *hw, u8 index)
 {
 	struct clk_core *parent;
 
@@ -889,7 +889,7 @@ int __clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 }
 EXPORT_SYMBOL_GPL(__clk_determine_rate);
 
-unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
+long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 {
 	int ret;
 	struct clk_rate_request req;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a39c0c5..230a249 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -732,8 +732,7 @@ const char *clk_hw_get_name(const struct clk_hw *hw);
 struct clk_hw *__clk_get_hw(struct clk *clk);
 unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
-struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
-					  unsigned int index);
+struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw, u8 index);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
@@ -760,7 +759,7 @@ static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 /*
  * FIXME clock api without lock protection
  */
-unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate);
+long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate);
 
 struct of_device_id;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
