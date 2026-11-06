Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966348;
	b=DQv87HZmvxT8jCDDlKyczA15mzkxkBi3/9OiUCwcpqMEVEZ8LHXZ6oNFJIKVh/E/auG3
	 G2Fmvm4/BWgIf5rctzTB3HrMXSR6TuyU+Bgb785SPCM2vnHg3CJBidnfXfSnlRjf3F8Gf
	 43o3heJTQ5dlHnLxzk+yMcxZ/T9pUjVDxXTNGR750vckYLGyOJa+bRXspHS2E1jNycR3r
	 CJE3cLVzyj+7HiQfSNCSVn2q4E6v3koqhn8zbOF1W4Xn1X4Y3P4I6MYbUyE93zUF1cUee
	 YDQdlUsWPxP3rxaT6LR3U85xR8jkS9X4tTmFafyN6LB2nN2fTSUEjNSCTIoenQKghJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vgb+cjl96ygFaTK6ZGzDBTxWIYeEzqjwHcNjALJCkdU=;
	b=yufajkXGa95uL/AlLtsRTBoeK4QuqG5f9Im5FanwWSYEa14AzjFsrFEkTGZI/Cxpcj8p
	 Z6TVQTGiDZb2S9E2IX0gNVkSmx9ll9Buq9wljL8evmiboCoK1yKIpIJnFwJ3tqJ+fe8oZ
	 nvwRU0jVDOVea4aCwgDgYDo9Onftt4/Fwhgq2ugOU9aYSUmDymmq2tTIgjmrrDaBXRmJV
	 xL8hhY0m2DpIwCtxs0tseARbUCkwucYpzn1IvcOqyFrll9en9i5FoF+a8wlABsR8PAjPB
	 tJl6YtZBnIJWeqmFUD/9NeQQkjLyqu0qBfKhZoQ3d4y8z8XWk0+rJnn3w8vPHQTnF6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7xtl7sW;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D293606A33A
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 11:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D293606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7xtl7sW
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a208d93758so5639865e9.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 03:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966346; x=1794571146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vgb+cjl96ygFaTK6ZGzDBTxWIYeEzqjwHcNjALJCkdU=;
        b=R7xtl7sW7EmobVMgdMwO8Z4zbumVWxPTPUqr2gloWr+RMmgVLk6X8UZ7PZ2mwYaIki
         K4n0/3ZqNqI5e6Mnjn3IUgacRQvAbIgFDSxrj9QtUHUbsOPs34iFLSuIxqMVatMhN/aX
         JWGlTv65AvH/HlgUvF07JriBlvvSiOrRZ8FUOdSJCju9GElvmdph6uq3mai0VraqKqIs
         9+qmBsdSYBpolGLGgIweT6UX4CtsrDiRVtOfoVBN5k51JpnQrX2OQhFWgqEMvoKVItbP
         xNqInF2tnnyUvIQUw8mNMXilHd024EhauwK1wxdMUwWI7RpYlBmSUhLUOGg1MMwMhq+N
         k6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966346; x=1794571146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vgb+cjl96ygFaTK6ZGzDBTxWIYeEzqjwHcNjALJCkdU=;
        b=LdT1h9KOzKP/O77gv8eloYn2YXF9H3ADbZ9nFyj7ImO8g7tlxtMOlvcWm0yfSX8GTT
         RZMNicIo0FDDA2rhlQQkNEba1SRyVg80BXIWcU0j8EO4nd5tylq1BJ8zo478PHeMWRIT
         ApJYAhfOD+1cu/KNJpeMPiCHbl82hsH1sfyFELjvn7w2vTWijkYc2dXrKoSWbaTAF6Be
         KsJcJhF2Yd/4m7kH9wpmxlnxtk93jsxTS4NG1I7NmUVCW0jzbNY8YdhqLtUiWmDYW2S/
         3RjqAJ9objdFApAYxE4gFRIY+qlNVa+WZO5YPL4byD/LYVyVTNltJaPGXi8USKdpXnUa
         oOdA==
X-Forwarded-Encrypted: i=1; AKwUvBz5Qr3qw6Wa/I5/hH+zdx+mgYXpnF1mXJP4jEowC+7WE+aXokWVgNwoI+n1XDZNTHrYMAQ2G6P0X9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z89xzMKzyj7MdLiVgQH3M8nw/sWD/ALKVZ6x5Zq1VctVKTG0lLc
	kkg4DVSpHCx+L7j7O5TGP5jhQcu7H2RuUPwNQjlrmNjv/ixUzRb6CMNa
X-Gm-Gg: AYBFou34bW4lucg9MkdNGVZ2p59T8nsjuWLQpk8pBvKZh7RBwQhlNZbzgtdE+gPx+G9
	avxrqO6ebkVeXMvKxDyMlQMmCOL6QAJOjNZGQ/yBtl2Y8T93yf8tjxEch+cPEA6G3jVWGkWfySY
	C4zkOGcciEP4hLUYiXX98mQX7nZBEB8o9HsmO66OSg8wE6ooh/j+yjNRW3FMCG4UZ+KAWaFAr2V
	ljO7whgFHsiLneP/gN1zrQgWkG8SVcL8iZ3/j9r2Qwm3A4Km8GUlhTcQEdAfR17aK0ONtdk8eej
	VXoLxwZoYYM2ttct0r/lXmyzzzXddsOaEDXC3RHdcSLAZG5EdBJ2X/Yq89e6fkhqrOnMWUTk64g
	CBa7q4L+VwpK4UBUc6L2c3aAxx5Nazx4pwhs2j2KgKz0fhDYNDQRkJDOdH1qURVkwaFo3gU6M+j
	dCH0ERKw9VOG3ZlWLE4S8tMz5YR+wUbrRgKW8jYAMvEr2Hdr3Aqjlvgs5iZN5aao0Z9p3jF653g
	vmCMvcoGXtCzYqFjWhg/HwulyvFy2JMU8rx4+W2E/5nwxj+hOop8QFEyGC48FVioBMT2V10QTD1
	em8SXHoe7sUvxd5jkkvlFpzl9iOGEExz3uC2xuUL2/8vxgg4OQdctAQjSNaYJ6O9EUamriQWMmb
	TE4wnl3EyFG5EXvXqFSeqML/QLHatugAkN/sAbanIuCJyRndmdMHLqns=
X-Received: by 2002:a05:600c:37c3:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4b6d8592096mr37325885e9.0.1793966346253;
        Fri, 06 Nov 2026 03:59:06 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b76b5d52a7sm4849775e9.1.2026.11.06.03.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:59:05 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v11 4/5] clk: en7523: generalize register clocks function
Date: Fri,  6 Nov 2026 12:58:49 +0100
Message-ID: <20261106115852.189098-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106115852.189098-1-ansuelsmth@gmail.com>
References: <20261106115852.189098-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index e534a5c91e61..8e24eef651a1 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -818,12 +819,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
+	const struct en_clk_soc_data *soc_data;
 	struct clk_hw *hw;
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
+	soc_data = device_get_match_data(dev);
+
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1308,6 +1312,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

