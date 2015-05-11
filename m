Return-Path: <daniel.thompson@linaro.org>
Return-Path: <daniel.thompson@linaro.org>
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@linaro.org,
	linaro-kernel@lists.linaro.org,
	Michael Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH] clk: Update docs after removal of clk-private.h
Date: Mon, 11 May 2015 11:20:06 +0100
Message-Id: <1431339606-16038-1-git-send-email-daniel.thompson@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Currently Documentation/clk.txt describes an obsolete techinique to
statically define struct clk objects.

This capability was removed by b09d6d991025("clk: remove clk-private.h")
and is no longer supported. The documentation describing the feature should
be removed.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Michael Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
---
 Documentation/clk.txt | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/Documentation/clk.txt b/Documentation/clk.txt
index 0e4f90aa1c13..f463bdc37f88 100644
--- a/Documentation/clk.txt
+++ b/Documentation/clk.txt
@@ -230,30 +230,7 @@ clk_register(...)

 See the basic clock types in drivers/clk/clk-*.c for examples.

-	Part 5 - static initialization of clock data
-
-For platforms with many clocks (often numbering into the hundreds) it
-may be desirable to statically initialize some clock data.  This
-presents a problem since the definition of struct clk should be hidden
-from everyone except for the clock core in drivers/clk/clk.c.
-
-To get around this problem struct clk's definition is exposed in
-include/linux/clk-private.h along with some macros for more easily
-initializing instances of the basic clock types.  These clocks must
-still be initialized with the common clock framework via a call to
-__clk_init.
-
-clk-private.h must NEVER be included by code which implements struct
-clk_ops callbacks, nor must it be included by any logic which pokes
-around inside of struct clk at run-time.  To do so is a layering
-violation.
-
-To better enforce this policy, always follow this simple rule: any
-statically initialized clock data MUST be defined in a separate file
-from the logic that implements its ops.  Basically separate the logic
-from the data and all is well.
-
-	Part 6 - Disabling clock gating of unused clocks
+	Part 5 - Disabling clock gating of unused clocks

 Sometimes during development it can be useful to be able to bypass the
 default disabling of unused clocks. For example, if drivers aren't enabling
@@ -264,7 +241,7 @@ are sorted out.
 To bypass this disabling, include "clk_ignore_unused" in the bootargs to the
 kernel.

-	Part 7 - Locking
+	Part 6 - Locking

 The common clock framework uses two global locks, the prepare lock and the
 enable lock.
--
2.1.0
