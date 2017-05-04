Return-Path: <martin.blumenstingl@googlemail.com>
Return-Path: <martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com,
	narmstrong@baylibre.com,
	linux-clk@vger.kernel.org
Cc: khilman@baylibre.com,
	carlo@caione.org,
	sboyd@codeaurora.org,
	mturquette@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/1] mark clk81 as critical on Meson8b
Date: Thu,  4 May 2017 20:32:00 +0200
Message-Id: <20170504183201.13175-1-martin.blumenstingl@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

The GX (gxbb.c) clock controller driver already marks the clk81 clock
as criticial. However, the Meson8b clock controller driver does not do
this yet.
This can lead to a freeze of the whole system when clk81 is disabled
by the common clock framework (for example after the last child clock
is disabled by a driver which used that child clock).

Martin Blumenstingl (1):
  clk: meson: meson8b: mark clk81 as critical

 drivers/clk/meson/meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.12.2
