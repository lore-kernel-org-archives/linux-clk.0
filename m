Return-Path: <mopsfelder@gmail.com>
Return-Path: <mopsfelder@gmail.com>
From: Murilo Opsfelder Araujo <mopsfelder@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>,
	Murilo Opsfelder Araujo <mopsfelder@gmail.com>
Subject: [PATCH 0/2] Small adjustments in drivers/clk/clk.c
Date: Wed,  6 May 2015 21:50:59 -0300
Message-Id: <1430959861-14925-1-git-send-email-mopsfelder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The first patch just improves code readability by addig comments after
#endif statements; the second one gets rid of a warning message during
kernel build.

Murilo Opsfelder Araujo (2):
  drivers: clk: clk.c: Add comments indicating the matching #ifdef
    blocks
  drivers: clk: clk.c: Make clk_is_orphan() dependent of CONFIG_OF

 drivers/clk/clk.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

--
2.1.4
