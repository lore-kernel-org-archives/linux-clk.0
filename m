Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B60364935
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786637; cv=none; b=HlsDXVbFND4z0j/7Irnf+dhzm6NeSb+TtYI2fluBUKjGzITh2LkP0CNxDL20pDHTLt9HgCQC7cr71u7yuuSlE09XVERcAxDRMdtRDR/f3sR9UbztTpgoxkZxpRHKE3a3BdEnlnVYW0nFzLWuuMpXNeS0f2qlnInY830Q8L3gRGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786637; c=relaxed/simple;
	bh=t6HlpzVkV6z864H43M58aoqN8E6EQKTOL7RyFtVr08k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VO4lNkJBX7wKwEF0GB0axKZOiRD2gdjNzoeFb3GDYX9gGpV24Acpb90GRktVa5JZKIgs78HZglWNlu0+TOVpxbEYYLkPglQJQ5TlOXY0ejhO78FtPAso8gv/pwWd/arFLZvSjoQkp6nPpipokziGhuPRUMmYMsqk4bzJ+QJF+JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dO/UH6re; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dO/UH6re"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so8047085ad.1
        for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 23:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786634; x=1792391434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKOeMXNG1kfy2/JP3GJLdq+HcYyRr6DhQVK+LeX96yQ=;
        b=dO/UH6rentCrJQ4n/6eD5EDXV0UD0hd0JAhz1icDjW0bQymkAwhs09EuFD3B4Awwo8
         hWDDK9UC3+dhu3NAwgCkUI3Q5nMAeboxlhO8PClxxtmvvrV9y0nt9oX7WZrEWRBVf2Kb
         82k4OaDY15t6c6AFztkd2ePdlQ0JSkrAuwD5PyNdyVewXkloK9dXk7bsyxMpaVxQf6eL
         r9m5ySR1hs/TIG4Ag1A0nTnu/QIsyyyI7nSG3aGvCUuehs8E4RmxQEp5llEUToNnpVJX
         XXLQiOVAygGm4psknVJihEEvJkg2pmvyL6433a52Yova4iX9zCNdvlHebk+67VRYJG5P
         Ix2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786634; x=1792391434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKOeMXNG1kfy2/JP3GJLdq+HcYyRr6DhQVK+LeX96yQ=;
        b=FpUHiIy54iy8yNUW8jUxVtC3Akbj3iKsjGtm70LTTBpHuoEMGqgrfW8W2vY9Eq7l2V
         lw8AjdDtQ19SAtoeOXjfinWR5DJ1Y6ROrf9r4H83dURik01dBQilR9bXjVjncYj5YkNK
         NLvUIXlMLIINu9KcBd/+6muPrgGiUwNlRIZHmb+vyen3Q9C6zAoYmnMMwEoOaIkb+PAx
         QRHgIp4wv2fIGltHwQO9sIUlHdRjUWbqN+A6RYgv+OnelYuY9xdHBMrRG98uJ/OyH9Vx
         VN32Zg8fJqljqTNT6RMK/eZLObsKaj8K6JaOd6ZKxsooybGiMyZpYipYzmZETpjE7KA3
         rTfw==
X-Forwarded-Encrypted: i=1; AKwUvBxloztqqTJanzBa+dn1/gNjnAtLECtXHDK8Mnl9HQapRYBzAOkcQCPD+nXH94nRETmgBzR4b7j9vKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMxVa3NNxZ1CMUrXb+8q+DkhR+NHrI63W+rtX/hDyDabpPvm/u
	mNvfZZ65ZTJQyXqQ4z+aiasPYqWan3bfh8Wlcr1nOWEqHbC0+wXNaSm/
X-Gm-Gg: AYBFou37oMs0mEiff558HduZ5x8aUtzWppxO/TcTG0aTlb70qqLlpscS2thA5XIdjoz
	SsztPVDWkJ3hqLc7s9CbBb6GwyUDdwe0qr+5TWF0USuvcSqE7ED8J41k2QGjYjB4T4IrEykORhI
	uIqRALPJLickAW7mEgWKR6q3Nld4/ZAM3PGHSC2IwoiZE2XqugO/w2ZhJrVIKZteWCKhNtKeA3S
	RQPvSCIOpkNcqPpPrCYY50Rq8Zp5DjQAmr/vB3tW3AlAv0CczUkdpiN19tHlz+KwCqj2c4adwP/
	zio0dr1FFiR1s7lcxytUsKJPHW0/hf4MRQ7cq1bQNY/0/7hsCljDU2FqEWaDkeANdTbpHKqquwx
	JVjsq5aa8SeEDLhDYJAc/bDi9kk+3cRuESe9hyJg1+epxXBZPc/ziDbyaeMKyL8m6hUMwme1TUl
	SJdVrgNl5VNyvbzLhufSQqgKVUHUYqHQm6rg35FruvSCR6o/wnZ1iuJ9E7td/mN7OoXOr2yjmnm
	NY43yTHiv889gr4tYruWp16Ylov0v+zxpVLrUrg7Mr9n8DplPMSIZ4xAswid/8=
X-Received: by 2002:a17:902:cccc:b0:2df:7fe1:72b8 with SMTP id d9443c01a7336-2e8429a649bmr73282855ad.16.1791786633938;
        Sun, 11 Oct 2026 23:30:33 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422da9b1sm39071745ad.66.2026.10.11.23.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:30:33 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	arnd@arndb.de,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 2/3] clk: nuvoton: ma35d1: use the generic divider for the ADC clock
Date: Mon, 12 Oct 2026 14:30:19 +0800
Message-ID: <20261012063020.3331443-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012063020.3331443-1-a0987203069@gmail.com>
References: <20261012063020.3331443-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADC clock divider implements rate = parent_rate / (2 * (N + 1)),
which is what the generic clk divider already provides with
CLK_DIVIDER_EVEN_INTEGERS. Use it with CLK_DIVIDER_ROUND_CLOSEST, as the
dedicated driver did, instead of a private clk_ops implementation. This
also keeps the rate request propagation handled by
divider_determine_rate().

The dedicated driver additionally OR'd a caller-supplied mask bit into
the divider register on every set_rate(). Its only caller passed a
bitmask (0x1ffff) rather than a bit index, which made BIT() shift by an
out-of-range amount, and nothing requires an extra bit to be forced, so
that behavior is not carried over.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 09e6ceeb2c556..523493e42e38c 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -1014,10 +1014,11 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[QEI2_GATE] = ma35d1_clk_gate(dev, "qei2_gate", "pclk1",
 					 clk_base + REG_CLK_APBCLK2, 14);
 
-	hws[ADC_DIV] = ma35d1_reg_adc_clkdiv(dev, "adc_div", hws[PCLK0],
-					     &ma35d1_lock, 0,
-					     clk_base + REG_CLK_CLKDIV4,
-					     4, 17, 0x1ffff);
+	hws[ADC_DIV] = devm_clk_hw_register_divider_parent_hw(dev, "adc_div", hws[PCLK0], 0,
+							      clk_base + REG_CLK_CLKDIV4, 4, 17,
+							      CLK_DIVIDER_EVEN_INTEGERS |
+							      CLK_DIVIDER_ROUND_CLOSEST,
+							      &ma35d1_lock);
 	hws[ADC_GATE] = ma35d1_clk_gate(dev, "adc_gate", "adc_div",
 					clk_base + REG_CLK_APBCLK2, 24);
 
-- 
2.43.0

