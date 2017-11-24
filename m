Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36437 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751136AbdKXGzx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Nov 2017 01:55:53 -0500
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: sboyd@codeaurora.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, ysato@users.sourceforge.jp, vz@mleia.com,
        slemieux.tyco@gmail.com, vireshk@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/6] clk: pr_err() strings should end with newlines
Date: Fri, 24 Nov 2017 12:25:27 +0530
Message-Id: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

pr_err() messages should end with a new-line to avoid other messages
being concatenated.

Arvind Yadav (6):
  [PATCH 1/6] clk: stm32f4: pr_err() strings should end with newlines
  [PATCH 2/6] clk: lpc32xx: pr_err() strings should end with newlines
  [PATCH 3/6] clk: SPEAr: pr_err() strings should end with newlines
  [PATCH 4/6] SPEAr: clk: pr_err() strings should end with newlines
  [PATCH 5/6] clk: h8s2678: pr_err() strings should end with newlines
  [PATCH 6/6] clk: h8300: pr_err() strings should end with newlines

 drivers/clk/clk-stm32f4.c          | 2 +-
 drivers/clk/h8300/clk-div.c        | 4 ++--
 drivers/clk/h8300/clk-h8s2678.c    | 6 +++---
 drivers/clk/nxp/clk-lpc32xx.c      | 4 ++--
 drivers/clk/spear/clk-frac-synth.c | 2 +-
 drivers/clk/spear/clk-gpt-synth.c  | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

-- 
1.9.1

