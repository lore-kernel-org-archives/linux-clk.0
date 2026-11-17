Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.124.121.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932266;
	b=CKR+/r4YQTskq8Zdk1jvgCRl1gyTmuHwgNdSFKl5IY1esxZ8oiSCi9zDu9Pfb9vbkClW
	 ROy0B2u6yUtlzank19dAvYj+kfQT5U5aY0ShMZaRVoXV7BW5SQ41AQofeM86DJnNzmDaZ
	 sYSq32Do6pZnglLgKoJcc3wWmxih3HUkMyuQXD+3t9YCBH0NyJeV8oCWKV7GB2v6j8Zgy
	 OXVx4KLyEo0QM2ml1cZW7ka0DDIrBHMu6fTCexNR6y0U8FgpulXamq8h6AIceu02Y3kDQ
	 8r9otewpkSG6bl6JUvsFgxgV/S1zM+SKOZgzgb2uJs56l5kx7jLMeilj9sk1WX+ReOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932266;
	h=DMARC-Filter:DKIM-Signature:X-MSG-ID:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UZawLPyDnVL4+sMKVmjUKh3WLcBWYaI8OlarGb9V+Go=;
	b=dXcEEZBAaA1WolhA48kXdv89pOSUr7qPHxkCPi4qHtK6TSfisPEBLVep247eUsSNz4ZO
	 RgNX96u/LbUIzP1p6+CKULGT4dtpjeY5hldIoh86qwPT9BADWrf45eFJTPEcSMt2Fu9t+
	 busfTBDYersok/XZKrM+Fl6xgWCR2Nn4diV2R3oUVCXcfXypsDee8woN0HTM7oOdJ6nFb
	 bFD/UvgQop8Z4q7WiKeoA9LEm0ZpvgrI0INQus3PvlNONUISGc5QsgT5lRrGT/02f+Fyv
	 OQP6bHC5hYknghAgIr3ZRyVnE/Fg6cq9oIf9zyH5hcAXirmjlmQ9Cnk4aoNcacH6eIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zanders.be;
	spf=pass smtp.mailfrom=zanders.be;
	dkim=pass header.d=zanders.be header.i=@zanders.be header.a=rsa-sha256 header.s=202002 header.b=QChQft8L;
	arc=none smtp.remote-ip=94.124.121.40
Received: from smtp28.bhosted.nl (smtp28.bhosted.nl [94.124.121.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FD6606A8AC
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 16:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4FD6606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zanders.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zanders.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zanders.be header.i=@zanders.be header.a=rsa-sha256 header.s=202002 header.b=QChQft8L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=cc:to:message-id:content-transfer-encoding:content-type:mime-version:subject:
	 date:from:from;
	bh=UZawLPyDnVL4+sMKVmjUKh3WLcBWYaI8OlarGb9V+Go=;
	b=QChQft8L6U/kdfRFoFlQzk7vwmBQPBuPqV2YeO+8FScUQtrHCtg7P9cyFYbiIrPYPor8Q8vpR8T/a
	 rom0ZEPI2ZpNr7KqMXscTLfs21OX8E2IphYdkhnW/A1Ndr+aI/UYJZLJSM3XsgAzmHJfvE93Rl711/
	 PNaRAWELL3zAOI35MThyTUh9bjaXdTpzEKHoaR+oo8TgW9hLmHnF54DOIfgtLNOdUHwjWICFYVr+tt
	 /6bWTip40US10c4brkBQkgoGbvjN/xeJ2Nf0wfgQPTh0pZhSvLDxZrsuZz/DGeG7V3XxQUsz3I7XwL
	 XDiSqvFySSSa5l4DtKoOkNSU1Y1m/mQ==
X-MSG-ID: 5be7e631-e2a2-11f1-a524-0050568164d1
From: Maarten Zanders <maarten@zanders.be>
Date: Tue, 17 Nov 2026 17:16:49 +0100
Subject: [PATCH] clk: vc5: Enable PFD frequency doubler for VersaClock 6E
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-vc5-6975-dbl-v1-1-d332b89964dc@zanders.be>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5EMBCA4VeROe8kHUXDq2wctAYjGystIhHvr
 jh+h/8/ILAXDlAlB3jeJMh/iqBPAm5opp5R2mhIVVoQkcHN5ViUJsfW/lArzqwhzZ0qISaz507
 2Z/etX4fVjuyW+wHneQHRtjZNcAAAAA==
X-Change-ID: 20261117-vc5-6975-dbl-30e4b713ef09
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Fend <matthias.fend@emfend.at>, Adam Ford <aford173@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Maarten Zanders <maarten@zanders.be>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794932255; l=1665;
 i=maarten@zanders.be; s=20261117; h=from:subject:message-id;
 bh=ivgRUAw+BjhjkWLq2nx/trZxYSQ6Tfor0pqfyiqefKw=;
 b=YmRxxD137KgXdAm7fEiZNIeTuiaq8Wi/2LXmvmsw2twhYQCK2LeA1BRQdzc/uuFQOjRCXAAVl
 VRqhxwUWfBxDGZJrUPQGFyqw1hY71dLscFwBQ23D+NksgqRuqVYAecJ
X-Developer-Key: i=maarten@zanders.be; a=ed25519;
 pk=9vkWF6gtn9DS+97n+W487XUEhrI3+9cvA7Fdon8T1uI=

The VersaClock 6E family (5P49V6965, 5P49V6975) supports the
reference frequency doubler, but VC5_HAS_PFD_FREQ_DBL is not set for
these devices. As a result, the doubler setting is ignored and all
PLL and output rates are reported at half their actual value when it
is enabled.

Set VC5_HAS_PFD_FREQ_DBL for the 5P49V6965 and 5P49V6975. Tested on
5P49V6975 only.

Fixes: 2bda748e6ad8 ("clk: vc5: Add support for IDT VersaClock 5P49V6965")
Fixes: d8473831066b ("clk: vc5: Add support for IDT/Renesas VersaClock 5P49V6975")
Signed-off-by: Maarten Zanders <maarten@zanders.be>
---
 drivers/clk/clk-versaclock5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 1cf8526975eb..7a7691841b7b 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -1299,7 +1299,7 @@ static const struct vc5_chip_info idt_5p49v6965_info = {
 	.model = IDT_VC6_5P49V6965,
 	.clk_fod_cnt = 4,
 	.clk_out_cnt = 5,
-	.flags = VC5_HAS_BYPASS_SYNC_BIT,
+	.flags = VC5_HAS_PFD_FREQ_DBL | VC5_HAS_BYPASS_SYNC_BIT,
 	.vco_max = 3000000000UL,
 };
 
@@ -1307,7 +1307,7 @@ static const struct vc5_chip_info idt_5p49v6975_info = {
 	.model = IDT_VC6_5P49V6975,
 	.clk_fod_cnt = 4,
 	.clk_out_cnt = 5,
-	.flags = VC5_HAS_BYPASS_SYNC_BIT | VC5_HAS_INTERNAL_XTAL,
+	.flags = VC5_HAS_PFD_FREQ_DBL | VC5_HAS_BYPASS_SYNC_BIT | VC5_HAS_INTERNAL_XTAL,
 	.vco_max = 3000000000UL,
 };
 

---
base-commit: 77987cd64bd6f58d3d35ccbac548fa064b892950
change-id: 20261117-vc5-6975-dbl-30e4b713ef09

Best regards,
--  
Maarten Zanders <maarten@zanders.be>

