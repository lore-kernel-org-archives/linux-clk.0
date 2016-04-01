Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-clk@vger.kernel.org,
	mturquette@baylibre.com,
	sjan@baylibre.com,
	ahaslam@baylibre.com,
	abailon@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 5/5] MAINTAINERS: Add Neil Armstrong as maintainers of schrodinger clock
Date: Fri,  1 Apr 2016 13:37:15 +0200
Message-Id: <1459510635-8204-6-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1459510635-8204-1-git-send-email-narmstrong@baylibre.com>
References: <1459510635-8204-1-git-send-email-narmstrong@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 378ebff..598d85e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10183,6 +10183,12 @@ S:	Maintained
 F:	drivers/media/i2c/ov2659.c
 F:	include/media/i2c/ov2659.h
 
+SCHRODINGER CLOCK
+M:	Neil Armstrong <narmstrong@baylibre.com>
+L:	linux-clk@vger.kernel.org
+S:	Maintained
+F:	drivers/clk/clk-schrodinger.c
+
 SILICON MOTION SM712 FRAME BUFFER DRIVER
 M:	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
 M:	Teddy Wang <teddy.wang@siliconmotion.com>
-- 
1.9.1
