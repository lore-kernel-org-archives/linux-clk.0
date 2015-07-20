Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55AD3781.2030604@codeaurora.org>
Date: Mon, 20 Jul 2015 11:01:37 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>
CC: Mike Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 33/45] clk: sunxi: Include clk.h
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org> <1436571223-10959-34-git-send-email-sboyd@codeaurora.org> <20150720080116.GS28632@lukather>
In-Reply-To: <20150720080116.GS28632@lukather>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/20/2015 01:01 AM, Maxime Ripard wrote:
> Hi Stephen,
>
> On Fri, Jul 10, 2015 at 04:33:31PM -0700, Stephen Boyd wrote:
>> This clock provider uses the consumer API, so include clk.h
>> explicitly.
>>
>> Cc: Chen-Yu Tsai <wens@csie.org>
>> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>> ---
>>   drivers/clk/sunxi/clk-mod0.c       | 3 ++-
>>   drivers/clk/sunxi/clk-sun8i-mbus.c | 2 +-
>>   drivers/clk/sunxi/clk-sun9i-core.c | 2 +-
>>   drivers/clk/sunxi/clk-sun9i-mmc.c  | 3 ++-
>>   drivers/clk/sunxi/clk-sunxi.c      | 2 ++
>>   drivers/clk/sunxi/clk-usb.c        | 3 ++-
>>   6 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
>> index 9d028aec58e5..39ba5c3d5d3a 100644
>> --- a/drivers/clk/sunxi/clk-mod0.c
>> +++ b/drivers/clk/sunxi/clk-mod0.c
>> @@ -14,8 +14,9 @@
>>    * GNU General Public License for more details.
>>    */
>>   
>> +#include <linux/clk.h>
>>   #include <linux/clk-provider.h>
>> -#include <linux/clkdev.h>
>> +#include <linux/slab.h>
> I guess you're adding a bit more that clk.h ;)
>
> Could you sort the headers alphabetically please?
>

Sure.

---8<----

From: Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH] clk: sunxi: Include clk.h and remove unused clkdev.h includes

This clock provider uses the consumer API, so include clk.h
explicitly. Also remove clkdev.h in files that aren't using it
and include slab.h when clkdev.h was being used to implicitly
include it.

Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
  drivers/clk/sunxi/clk-mod0.c       | 3 ++-
  drivers/clk/sunxi/clk-sun8i-mbus.c | 2 +-
  drivers/clk/sunxi/clk-sun9i-core.c | 2 +-
  drivers/clk/sunxi/clk-sun9i-mmc.c  | 3 ++-
  drivers/clk/sunxi/clk-sunxi.c      | 2 ++
  drivers/clk/sunxi/clk-usb.c        | 3 ++-
  6 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
index 9d028aec58e5..d167e1efb927 100644
--- a/drivers/clk/sunxi/clk-mod0.c
+++ b/drivers/clk/sunxi/clk-mod0.c
@@ -14,10 +14,11 @@
   * GNU General Public License for more details.
   */
  
+#include <linux/clk.h>
  #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
  #include <linux/of_address.h>
  #include <linux/platform_device.h>
+#include <linux/slab.h>
  
  #include "clk-factors.h"
  
diff --git a/drivers/clk/sunxi/clk-sun8i-mbus.c b/drivers/clk/sunxi/clk-sun8i-mbus.c
index 14cd026064bf..bf117a636d23 100644
--- a/drivers/clk/sunxi/clk-sun8i-mbus.c
+++ b/drivers/clk/sunxi/clk-sun8i-mbus.c
@@ -14,8 +14,8 @@
   * GNU General Public License for more details.
   */
  
+#include <linux/clk.h>
  #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
  #include <linux/of_address.h>
  
  #include "clk-factors.h"
diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
index 887f4ea161bb..6c4c98324d3c 100644
--- a/drivers/clk/sunxi/clk-sun9i-core.c
+++ b/drivers/clk/sunxi/clk-sun9i-core.c
@@ -14,8 +14,8 @@
   * GNU General Public License for more details.
   */
  
+#include <linux/clk.h>
  #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
  #include <linux/of.h>
  #include <linux/of_address.h>
  #include <linux/log2.h>
diff --git a/drivers/clk/sunxi/clk-sun9i-mmc.c b/drivers/clk/sunxi/clk-sun9i-mmc.c
index 710c273648d7..3436a948b796 100644
--- a/drivers/clk/sunxi/clk-sun9i-mmc.c
+++ b/drivers/clk/sunxi/clk-sun9i-mmc.c
@@ -14,14 +14,15 @@
   * GNU General Public License for more details.
   */
  
+#include <linux/clk.h>
  #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
  #include <linux/module.h>
  #include <linux/of.h>
  #include <linux/of_device.h>
  #include <linux/reset.h>
  #include <linux/platform_device.h>
  #include <linux/reset-controller.h>
+#include <linux/slab.h>
  #include <linux/spinlock.h>
  
  #define SUN9I_MMC_WIDTH		4
diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 9a82f17d2d73..4ac26122a7c6 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -14,11 +14,13 @@
   * GNU General Public License for more details.
   */
  
+#include <linux/clk.h>
  #include <linux/clk-provider.h>
  #include <linux/clkdev.h>
  #include <linux/of.h>
  #include <linux/of_address.h>
  #include <linux/reset-controller.h>
+#include <linux/slab.h>
  #include <linux/spinlock.h>
  #include <linux/log2.h>
  
diff --git a/drivers/clk/sunxi/clk-usb.c b/drivers/clk/sunxi/clk-usb.c
index 3a25f9588e67..1a72cd672839 100644
--- a/drivers/clk/sunxi/clk-usb.c
+++ b/drivers/clk/sunxi/clk-usb.c
@@ -14,11 +14,12 @@
   * GNU General Public License for more details.
   */
  
+#include <linux/clk.h>
  #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
  #include <linux/of.h>
  #include <linux/of_address.h>
  #include <linux/reset-controller.h>
+#include <linux/slab.h>
  #include <linux/spinlock.h>
  
  


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

