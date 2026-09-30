Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950BC3624DB;
	Wed, 30 Sep 2026 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768971; cv=none; b=m2FeyXiKvSr+PJRF2rtZw1FhcOpQeCh6rJkTMFk9CVXxJXQThyiByVvhmFmQGAVaW0dAYB+36jdKOgurDfd4FZfeYfGxoNja8Q5gqzAyGPH4ZZwKcivTurJWuO71yf9YZYSA5Tr/aahE/F9ufYuob49dCe39Wvo6tr1Vax3g2ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768971; c=relaxed/simple;
	bh=fH9KqpUd/UAig1ou+hpknXGpJweBouk38gVkdK7C9cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f4KVVUbiBxUD4E4ojlthsGrnm/p3auBjSJXjngp/tDjSm5fYkgXN/sQtvUhsWOidSmqY+ayr7+Yr0b2mS268RW6or/OJ++o5OthnK9aLEjdzWXMt1H2FWEJyhPReoV4p7RxCklafDy11nvdsPMRZ++IiDzMnyleW7taS6d89YEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=pfUogwvG; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="pfUogwvG"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0D7631FB1B;
	Wed, 30 Sep 2026 13:49:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790768958;
	bh=HIwm+dEiYRCTnCPcd9kDSKgwpQhnVykGcKTzar+9zo8=; h=From:To:Subject;
	b=pfUogwvG1OVQTPVBu9qmufBiDZBvI8pBOyFvIk7bOy7ikZsuqZOd26w48pUu/gWDf
	 RlFZur/VTXqmaoeL1TDQvNPZPSlVnVcDDRbbrxO56p4M7jL47Vgjmek9VJ19x95uku
	 nwn4DT7t5wCAZTok3X3ndPdxQZH/sJ3LO+NT5+IbirSxxv09SSbWNRIYrxqz0XBt4B
	 6cjXcRGYwFr1bK5RDc3Pu2LHp11V/tjrjjaVacSm4KTH/Bpk1dZQ3iT84VZCgRqjgU
	 xabIyGoSty6L/N2T6JBGJZKaAevtKwpRJzJGw8pykTdfY3KJmijd9OGv4jQVvX/ZNu
	 C3Oa/Xn1W+X0g==
From: Francesco Dolcini <francesco@dolcini.it>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] clk: clk-gpio: do not blame the DT property on probe deferral
Date: Wed, 30 Sep 2026 13:49:06 +0200
Message-ID: <20260930114907.153690-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The message is also stored as the probe deferral reason, where it wrongly
claims the 'enable'/'select' property is missing while it is the GPIO
provider that has not probed (yet?).

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/clk/clk-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 9099c57e2715..918b2c6444ee 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -214,7 +214,7 @@ static int gpio_clk_driver_probe(struct platform_device *pdev)
 	gpiod = devm_gpiod_get(dev, gpio_name, GPIOD_OUT_LOW);
 	if (IS_ERR(gpiod))
 		return dev_err_probe(dev, PTR_ERR(gpiod),
-				     "Can't get '%s' named GPIO property\n", gpio_name);
+				     "Can't get '%s' GPIO\n", gpio_name);
 
 	if (is_mux)
 		hw = clk_hw_register_gpio_mux(dev, gpiod);
-- 
2.47.3

