Return-Path: <gustavo@embeddedor.com>
Date: Thu, 23 Aug 2018 18:06:54 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Brendan Higgins <brendanhiggins@google.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] clk: npcm7xx: fix memory allocation
Message-ID: <20180823230654.GA11576@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct foo {
	int stuff;
        void *entry[];
};

instance = kzalloc(sizeof(struct foo) + sizeof(void *) * count,
GFP_KERNEL);

Instead of leaving these open-coded and prone to type mistakes, we can
now use the new struct_size() helper:

instance = kzalloc(struct_size(instance, entry, count), GFP_KERNEL);

Notice that, currently, there is a bug during the allocation:
	
sizeof(npcm7xx_clk_data) should be sizeof(*npcm7xx_clk_data)

Fix this bug by using struct_size() in kzalloc()

This issue was detected with the help of Coccinelle.

Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/clk/clk-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index 740af90..c5edf8f 100644
--- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -558,8 +558,8 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 	if (!clk_base)
 		goto npcm7xx_init_error;
 
-	npcm7xx_clk_data = kzalloc(sizeof(*npcm7xx_clk_data->hws) *
-		NPCM7XX_NUM_CLOCKS + sizeof(npcm7xx_clk_data), GFP_KERNEL);
+	npcm7xx_clk_data = kzalloc(struct_size(npcm7xx_clk_data, hws,
+				   NPCM7XX_NUM_CLOCKS), GFP_KERNEL);
 	if (!npcm7xx_clk_data)
 		goto npcm7xx_init_np_err;
 
-- 
2.7.4
