Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF43F23C51B
	for <linux-clk@vger.kernel.org>; Tue,  3 Jun 2025 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965405; cv=none; b=Gn2E6r2KYgxm1XCxQ9CG54pFlmdA8pZFCT9wOa3RoTq5sVvTWmtU0r8/wCcspc3IdPxlhANlR8q2OXG0ozy9fZAXQ0N34lNy0gF+KGPGYTCLlEoJHqsm4VNI3fT7HvlT1Pq5vyHZnrhH/EwnOENM7U23J4FLI+btF9Qk3ngmDxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965405; c=relaxed/simple;
	bh=0/e960cM7qU9YBT+WAzc6pA7trJpgvnwKErk9+qJgkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GN831ViEnKwlmvYj8aOuaezM8TV3M4Oac6P8b1tnKdXKKbvkFePwPbIqwxTihRW6NxwXFS3ZRD6qaDRv2yiRnRrhzhJ3z4zKBVh8zSO9SCxtuBW3QSIjrXOfJ7IaSdKJZY7QUhOow+xjoO4E6OsXJYcpLSL1P0kZh5MDb7mrQEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P273XMMX; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P273XMMX"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-604f26055c6so12892308a12.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Jun 2025 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965402; x=1749570202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyDAynqsG9jh+cOOc7N5aPAGPcSiqWcSOwtimCSGBpI=;
        b=P273XMMXui2BrL1K6VjKCIGVjjh6KLBxKfhhkLbaZp/N1uNeBoV1jOmiHj2gNVDAgA
         hUofkBnL1GFtogzuwpl0tCI2x3RVOIi7Y//DUPfsrWbaeC/Fhs9mnC7RPTM274NKwn/3
         k/s5I0sdIG35osdAbJmw0oSDeKblNv1CtUyshgihH7qs+q83YxyMbLLCKpWI/81IyCNC
         jQiW4diZ3US7nFyrf8rYGZwBKBaMoUrNQ0l3NlcXp9NAV+zL8OHxfvZ0UM5fKfDbi1zL
         raC0E8jusvu5/asvSPPyQJlNyp+JlnBiVpmL3NPxm58oemcTtxttS7K9f74W4viYdLFC
         hiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965402; x=1749570202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyDAynqsG9jh+cOOc7N5aPAGPcSiqWcSOwtimCSGBpI=;
        b=X9vq/woBBdCfcbX1qUzZi6ldP5sV8PMFwJDqoMkZ/OIUS3bnJ+vWiDJKe0CFPQVwwU
         WZBFfQVE1NXaqLF0VFPE9/S7U/gy48QZFo/mVx40YPgMq9WfsKFETbLLz/d9tC4z22oN
         +wHr1HhZe9oSQK4H+J8CPPJtbc4kwLUFsTY1MLw52DphGv179yR4/1r3suraBqeDnL5A
         fX4Hpp2QQ7JkBcBIsCyHJv7rCalcJcbYZCa9IvANp1mQPnuXXuSZzrz3Ba1vG1OTn6Ny
         iCVtT5VE1Tk4u+D51xTRrjM8X+nZUeD0fpUw6H8HOMLXBi2jYxScE/GfAAuW2t2aX39x
         OvRw==
X-Forwarded-Encrypted: i=1; AJvYcCWGk5QQBt5dnLD3MObRV5IQ9t+2sK7W3MAMtQXNLNiM5a8b9gw2JCAkrmkWT9PlozeSvPZE/CUlUPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwBpoj6oQNSvBhfraLr4bKUNRfYMdctVqXK4DcfkMM2UW35byC
	UJ3h4InJO64iUoaFP2Z78sXsS1mz05gxDHXb2HWJPaoKyMWsJ60VngX62VrMyP5KqP0=
X-Gm-Gg: ASbGncvHvI9PUWUUI1ofUjqRsPoMwWIEfc9Z4cK2GD8DCPtY3Gxv3VnwIY4YmZOgCc7
	z6gRvG0mIfPlHhmkykTNSDMa2YJSJkLXWhUuDhHFeVRWGI7MPuMFmrjJOyqxjAsLzGAGia6Mpwx
	8d0SuqN9ZeX2uaTAaFKNPlSGicMnJfJUJ04RsWgJK6aBByOthayxSs5kyuYWl2huMruXqOHDWcN
	iOQRMnFcEEm93Pmqf0c+IYl1oB+K6XJO6e5estRmOPa25Z8UohGV5hb5eu6ycPCrZe2/IEQsmed
	PFfkZ3rhn5I4jrhF0zlzY9RSf9oouIoyapGljDkUBWfbP66A3SR9xRaQWqc/jbKTd3RKUBEp5e0
	KH+lsT3EQYg7jt6IDDI3bcnBooWE3hwoQJsQ=
X-Google-Smtp-Source: AGHT+IHaS+y52wFsPfn/BGos8YaLrH6Wz7Z3gAJ7jHqi4eOsbjUUHHFwYuM6LlBkTlFWjROGBuJiGw==
X-Received: by 2002:a17:906:f5a3:b0:ad8:959c:c567 with SMTP id a640c23a62f3a-adde66652d6mr315927366b.10.1748965402049;
        Tue, 03 Jun 2025 08:43:22 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de9bsm959277166b.47.2025.06.03.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:43:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Jun 2025 16:43:20 +0100
Subject: [PATCH 2/3] clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref
 parent clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250603-samsung-clk-fixes-v1-2-49daf1ff4592@linaro.org>
References: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
In-Reply-To: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

The alternate parent clock for this mux is mout_pll_usb, not the pll
itself.

Fixes: 1891e4d48755 ("clk: samsung: gs101: add support for cmu_hsi0")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 12ee416375ef31deed5f45ea6aaec05fde260dc5..70b26db9b95ad0b376d23f637c7683fbc8c8c600 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -2129,7 +2129,7 @@ PNAME(mout_hsi0_usbdpdbg_user_p)	= { "oscclk",
 					    "dout_cmu_hsi0_usbdpdbg" };
 PNAME(mout_hsi0_bus_p)			= { "mout_hsi0_bus_user",
 					    "mout_hsi0_alt_user" };
-PNAME(mout_hsi0_usb20_ref_p)		= { "fout_usb_pll",
+PNAME(mout_hsi0_usb20_ref_p)		= { "mout_pll_usb",
 					    "mout_hsi0_tcxo_user" };
 PNAME(mout_hsi0_usb31drd_p)		= { "fout_usb_pll",
 					    "mout_hsi0_usb31drd_user",

-- 
2.49.0.1204.g71687c7c1d-goog

