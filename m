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
Subject: [PATCH v2] clk: si5351: Add PLL soft reset
Date: Fri, 20 Nov 2015 18:22:16 +0100
Message-Id: <1448040137-21400-1-git-send-email-jacob@teenage.engineering>
In-Reply-To: <CAEnXRPvCLRDFotc8FkS35df1PoLUW=X=1bTTUHR=UhRU_9zrCw@mail.gmail.com>
References: <CAEnXRPvCLRDFotc8FkS35df1PoLUW=X=1bTTUHR=UhRU_9zrCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi!
A representative from SiLabs writes: "All the currently published versions
of the Si5351 (v1.0) and AN619 (v0.6) do not include the “Si5351A/C only”
disclaimer. Based on this and our current understanding, I see no issue
performing a PLLB reset for ‘B’ type devices.". Hence, it should not be
any issues always performing the PLL reset.


Changes in v2:
- Output disabling and power down removed in order to prevent
  breaking systems requiring always-enabled clocks
- Cosmetic changes

     Jacob

Jacob Siverskog (1):
  clk: si5351: Add PLL soft reset

 drivers/clk/clk-si5351.c | 6 ++++++
 1 file changed, 6 insertions(+)

--
2.6.3
