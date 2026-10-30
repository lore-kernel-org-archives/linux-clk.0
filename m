Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345809;
	b=KLphWkuGkZKv6HS2cKX/Otyhtm5JFiqMBrBWWM/ViYWBvDhrQcXgl8P7AETS5oe9Y3mw
	 BWhFxAn8ZBZi4tSFhbAtN2/1DBea5EQ5oZjvGDksFXFTpp6T66y+JvLCK5TwJAVGemNFp
	 8XF7EyHY/Hn+6sEIzrJfWERX6KmIEjSMkHeojXg+ki0G9f75AypfNMNFT/8iH+btRGVq+
	 coBPtEfHlzp1AE4nbDniYP9XS02MGTySVEM14/L58AnmbWxTIlDDgUGeq1IYGdII2ZTRy
	 A2JPilPJo5OWmS9PKa7d3OdVcl6w/3JQ95hfFzf96In+U/WCCHyzZFwW0C+5YrqgyFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zyVM5qTzy2De10MnH1DSqnYzP+ppEdRoaIvfy2pZmrI=;
	b=NOU8efYYOPePLHeoWEEN1l9+wSgTBHYTxxZrL3JH+Tps6/uIWbCkY7rY0cneVY9MGnD0
	 X/gteVuAHWFlsmcch95SU3zWpbBZXG6410Vacq7muV+KrTtlrdSRh9sIWaFB2jopolS6J
	 U5u1jgJs1yiVnNyYU7cULoyuHU6ZNEFWC0Epsdtk8N75fG5mp0bqqtPFxOnfWKbuhaLc5
	 4uzpN8+VQUmE/a82u9LqHSeL+ROALtZH824V8tUI6bfHU8xkHDj39xnlpEzGUuBP1Xc7i
	 jNKmz9rSh4PWtNu5aRwqKa4/Y4YFZAdE+MdjwHOVyeotXoV1DESnp4j8CUUBP4Gs/Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd2gLNYn;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDE1606A31C
	for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 07:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEDE1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd2gLNYn
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso2252195e9.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 00:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793345807; x=1793950607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyVM5qTzy2De10MnH1DSqnYzP+ppEdRoaIvfy2pZmrI=;
        b=yd2gLNYnt4zXBPKtqusIqQO1V26SRS+9409pgFKGPqbZIqx4YhzYPKqZ2lWzapNybZ
         JyrItnkPdDjjaVbbxMYNMl2+BEk+UF6Pt5ouiELQ3eOKZ5NjFKGun5g2JN6Suuo7YzLp
         bCvZv839RMDjp2YnC6hxcacuzUauz05K3sRQykx4GhaNUohrWGrdL7zGYpDfgcpIwmMA
         3/F3oBmgZWphG8fp4VWtJjl8wbJmBpMNglRkNlQh2zhuRlyT5cxmdyehVCkhh8/4iiAc
         gyFCPGu6Pkhvmumy5BY9CKJYVuQz972lWJyudLH1zjtdQHytlz8EydTdCHG99P1bTzE/
         7xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345807; x=1793950607;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zyVM5qTzy2De10MnH1DSqnYzP+ppEdRoaIvfy2pZmrI=;
        b=CrpztgX/twx/iZ6RuZVPRvvM+NYzRlY2SgwuugawO1G1x0To2AftzTkanmcAEvvoa+
         /GXwAsM4b2QvdIyDFwXjWonT9FhcAb8mZT/fs7y91b0RHod9WutgAQnIirCEJq7W7bIA
         cqEWY1DpJ7jOijxYjjwq2IHjHBdpt3UzH1lZYf6GxRjyiCC7xDZQBUcvp+wvL3Edvp9V
         P3HlBg69So/Hw6a2Zo429Zh7kWH2SWEKcgLOGYVE5jjNpMRcxNYZE5BIXjsHrHzq8R6k
         a8TgUl11EwIY5LkfYmd5QGtjyKP1Gyl8HzlQ4rhXd+DsVQ/6CjDjXwK9ok6tWSYvn0YA
         uq6A==
X-Forwarded-Encrypted: i=1; AKwUvBwNtqtGj1PN2qmume/in4pQKauRCmRnHbEyfe07Ef1zGELX2Z35MskNE4PqhGH3kjhthpz10PsKgX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOcWsl2LpCeDLpxWUIyC7Ho/1iX716zuIbZ0umcAtrSUiZkwjI
	xz9b2iund6cCpL70mtgbGxDmOTJzrMyT6oxOdITJJOa2STLNpIZ8w5/pg9aAuaWIWQE=
X-Gm-Gg: AYBFou0szsUr2NUfEjSDYAfHveokDj3ANsgcSQWWr1mrrfASYUCr4gkw31n2tyB5sOZ
	d7eK1OCsGkLFXp+mOOWTFXnT8lN/FriRozt+K7a6UjLP3epGJNDa163KoRCB9Ll6D5OpCigJjLE
	SlN7faLh9fiy1LzFrE8kh/5seQ6GtcUmZmmaUk8d9Bf2A3fnIRorK3w/HYpork3VW/n3TIYGLXD
	vP087XaHqydL8xX12ApVrHeP6xQN3+Vv3Xv18FFwBGzne0nGN/biLSnOYA/6a2VwfmyixkgonIU
	slE8ox5Y88l/QrVnM+Ob7KujYo18rbJTlQEKqMi5gsJHEtexMLcSfBXItU6DfjWfBcABNt5nGvm
	VNjxVbNZNkN0sXaqSuWjnwWC0tNub/r62qIFX7DSIBZ6DnCE3hNBQQiskle3SEsLH0NsPvIN6vK
	qxKV2biZDzMuTag3XxTQkz9cQ3Ut79SS3RGWUTiiQIDOm5m9ipO9k1NONyi/kIiB9thFjvIyDz0
	rbXEJ9v0UoJMDXj4G+Mwxr9osryhfBnsliQR1Of6raiBg2hEWnjhh75SZrLvihj78hzHCJ+45aB
	NljSXb+F7dtmzUMbSw4VyiNDqERKXOhwra1vCFUwQS/WSDwCGKRC5z6YDQ==
X-Received: by 2002:a05:600c:4585:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4ac1889d5a1mr28432205e9.28.1793345807114;
        Fri, 30 Oct 2026 00:36:47 -0700 (PDT)
Received: from thinkpad.hgw.local ([159.146.110.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm1721764f8f.10.2026.10.30.00.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:36:46 -0700 (PDT)
From: =?UTF-8?q?Yal=C3=A7=C4=B1n=20Can?= <ylcncn@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: rockchip: rk3066: uart0/1 pclk comes from hclk_ahb2apb
Date: Fri, 30 Oct 2026 10:36:38 +0300
Message-ID: <20261030073638.164388-1-ylcncn@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On rk3066a, uart0 (0x10124000) and uart1 (0x10126000) sit behind the
AHB-to-APB bridge of the cpu bus, as on rk3188, but their pclk gates name
pclk_cpu as parent. Nothing then holds hclk_ahb2apb (CLKGATE_CON4 bit 9),
so it is switched off as unused at late init and both UARTs read back as
all zeros: 8250 autoconfig reports PORT_UNKNOWN for uart0 and a serdev
Bluetooth controller on it (brcm,bcm4330-bt) times out on every command.

The vendor 3.0 kernel uses the same parent, but models ahb2apb as a
divider without a gate, so it is never turned off there.

Make hclk_ahb2apb the parent of pclk_uart0/1, as the rk3188 table already
does.

Tested on an RK3066a board (MK808B, BCM4330 Bluetooth on uart0): before,
CLKGATE_CON4 reads 0x6200, uart0 registers read 0 and ttyS0 is
PORT_UNKNOWN; clearing bit 9 by hand makes it probe as a 16550A. With this
patch uart0 probes as a 16550A at boot, hci_bcm loads its firmware patch,
and LE and BR/EDR scans find other devices. uart1 is not wired on this
board and was not tested.

Fixes: 2c14736c75db ("clk: rockchip: add clock driver for rk3188 and rk3066 clocks")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yalçın Can <ylcncn@gmail.com>
---
 drivers/clk/rockchip/clk-rk3188.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 318c8ddc8..680c33a62 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -649,8 +649,9 @@ static struct rockchip_clk_branch rk3066a_clk_branches[] __initdata = {
 	GATE(PCLK_TIMER1, "pclk_timer1", "pclk_cpu", 0, RK2928_CLKGATE_CON(7), 8, GFLAGS),
 	GATE(PCLK_TIMER2, "pclk_timer2", "pclk_cpu", 0, RK2928_CLKGATE_CON(7), 9, GFLAGS),
 	GATE(PCLK_GPIO6, "pclk_gpio6", "pclk_cpu", 0, RK2928_CLKGATE_CON(8), 15, GFLAGS),
-	GATE(PCLK_UART0, "pclk_uart0", "pclk_cpu", 0, RK2928_CLKGATE_CON(8), 0, GFLAGS),
-	GATE(PCLK_UART1, "pclk_uart1", "pclk_cpu", 0, RK2928_CLKGATE_CON(8), 1, GFLAGS),
+	/* uart0/1 sit behind the AHB-to-APB bridge, as on rk3188 */
+	GATE(PCLK_UART0, "pclk_uart0", "hclk_ahb2apb", 0, RK2928_CLKGATE_CON(8), 0, GFLAGS),
+	GATE(PCLK_UART1, "pclk_uart1", "hclk_ahb2apb", 0, RK2928_CLKGATE_CON(8), 1, GFLAGS),
 
 	GATE(PCLK_GPIO4, "pclk_gpio4", "pclk_peri", 0, RK2928_CLKGATE_CON(8), 13, GFLAGS),
 	GATE(PCLK_TSADC, "pclk_tsadc", "pclk_peri", 0, RK2928_CLKGATE_CON(4), 13, GFLAGS),
-- 
2.47.3

