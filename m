Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A065125B087;
	Thu,  8 Oct 2026 16:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477066; cv=none; b=Gg2Mze9vWhAMLgCFkk5BuThJxO7u4e24esQwXQhSwpJpfHfVKLX9UZNjrONrgxfI5y7td4JjJ8Y91DI31yOTagvkGXcnRxV3J2QBCi5y9DHTnKFnDIQoDdMINynF4xn+aqJU3SAMVCjKF1NRV+v3LBoiWu0YnmDQGryUluSLzdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477066; c=relaxed/simple;
	bh=U1MKW/Ll82BG6IOJf/SnwyWtljrjaXD52z9hTaCQ774=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uIry27ZvjdSxD2wI5hS0FWRwsZN17e4hWJZHz72xrUXOKQx6uF5QKiWqOqi7XCGw2jrzVM5JYCBGN+4NDJai78VmonM1Rg9pUPtZSKo6HB0WADnAgQvULlrB3xPQJa2sET+j3WpsBZrLw5R5iz7yRhtQTi1A0qFa4UZJ730Kxeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACXljQ5xcdqciAOCg--.38966S2;
	Fri, 09 Oct 2026 00:30:49 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: at91: fix device node reference leak in at91sam9x5_sckc_register()
Date: Fri,  9 Oct 2026 00:30:52 +0800
Message-Id: <20261008163052.2685401-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACXljQ5xcdqciAOCg--.38966S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4Utry5Ar45WFyDCF4DJwb_yoW8uF15pF
	4UCry5AFs5Xr4UuFW2yF97XFyY9a92gFW8ur1xCwnI9rn5tFyxtrWjgFykXF15AFWrGay3
	Jw4jq3W7Zr45AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUqVcEUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgAOA2rHo1NcQAAAsK

at91sam9x5_sckc_register() calls of_get_compatible_child() to look up the
"atmel,at91sam9x5-clk-slow-osc" and "atmel,at91sam9x5-clk-slow" legacy
child nodes during DT backward compatibility handling. Both calls return a
device node with its reference count incremented, but neither reference is
ever dropped: the first is simply overwritten when the second lookup
reassigns child, and the second is leaked on every return path, including
the unregister_slow_* cleanup labels. of_clk_add_hw_provider() takes its
own reference and does not consume the caller's.

Drop the slow-osc reference once it has been used and release the remaining
child reference on both the success and error paths.

Fixes: 45b5ec8498ff ("clk: at91: modernize sckc binding")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clk/at91/sckc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index 776118f14867..bdf6897a98e3 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -398,8 +398,9 @@ static void __init at91sam9x5_sckc_register(struct device_node *np,
 
 		xtal_name = of_clk_get_parent_name(child, 0);
 		bypass = of_property_read_bool(child, "atmel,osc-bypass");
+		of_node_put(child);
 
-		child =  of_get_compatible_child(np, "atmel,at91sam9x5-clk-slow");
+		child = of_get_compatible_child(np, "atmel,at91sam9x5-clk-slow");
 	} else {
 		bypass = of_property_read_bool(np, "atmel,osc-bypass");
 	}
@@ -431,6 +432,7 @@ static void __init at91sam9x5_sckc_register(struct device_node *np,
 	if (WARN_ON(ret))
 		goto unregister_slowck;
 
+	of_node_put(child);
 	return;
 
 unregister_slowck:
@@ -439,6 +441,7 @@ static void __init at91sam9x5_sckc_register(struct device_node *np,
 	at91_clk_unregister_slow_osc(slow_osc);
 unregister_slow_rc:
 	at91_clk_unregister_slow_rc_osc(slow_rc);
+	of_node_put(child);
 }
 
 static const struct clk_slow_bits at91sam9x5_bits = {
-- 
2.25.1

