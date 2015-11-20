Return-Path: <jacob@teenage.engineering>
Return-Path: <jacob@teenage.engineering>
From: Jacob Siverskog <jacob@teenage.engineering>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Belisko Marek <marek.belisko@gmail.com>,
	Jacob Siverskog <jacob@teenage.engineering>
Subject: [PATCH v3 0/1] clk: si5351: Add PLL soft reset
Date: Fri, 20 Nov 2015 19:03:12 +0100
Message-Id: <1448042593-23670-1-git-send-email-jacob@teenage.engineering>
In-Reply-To: <564F5E8F.80709@gmail.com>
References: <564F5E8F.80709@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Hi!

Changes in v3:
- Fix multiline comment style

Changes in v2:
- Output disabling and power down removed in order to prevent
  breaking systems requiring always-enabled clocks
- Cosmetic changes

     Jacob

Jacob Siverskog (1):
  clk: si5351: Add PLL soft reset

 drivers/clk/clk-si5351.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.6.3
