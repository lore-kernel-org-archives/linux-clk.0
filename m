Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C232C1FBBFC;
	Mon, 13 Jan 2025 23:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736809864; cv=none; b=jaiqjTbfgiPaBJRSZmih/iWF01b6fWjn5DvkG3KA728kH6Q6kk+5JEEFFq8x6J5OxajLSEQ/0aNKS4l5H+bqPzo18p/wqfS9PIW9XAY4tQoHgx8TRQiJNKwCt5rk74v22eR1HtxL2j0GP7cwsImxHBgKTEX7bMpZM5eI2r38oyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736809864; c=relaxed/simple;
	bh=STQ5LHZDi5Oseu22m36ubr8p2IACzB87DJqVySoufpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b86PKbHnrta30khgJeKGQ2ZLqdmZ9vkGjO/rYw/SktegHeDgesr99Rt5BuACU3kZ0kwJomOWVt30uYlWtQR9n43P8Xe2Wd0Jn2u6Xb5z3AYYbOAss81T2x0HH8jtsAfpwpgL9KMTkekdzAZp21UpB6R0rf+vHxl5N3m4UPmZYRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOA7TSJS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOA7TSJS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436345cc17bso35135215e9.0;
        Mon, 13 Jan 2025 15:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736809861; x=1737414661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JatB3iJnt4fYdkysh3yoyeMx8SbiKtxuCa8EVl95b/k=;
        b=OOA7TSJSZMoitJ9oE7WI78pqizM+OqkOWfEefujdskp+62DhXfhepmtHW3HnnQrg0n
         gsGao0V+aMJgYY6Q43unK0YPT67zxh3wTQyVUDu9oJFEy0FUlfQ/xZukoLOeeuNyE+bp
         v5iW2Nav8+rbO3ILJJW+/eRwba/m/5imy/S5xif9Cy1lHaheqLd/pzJxqC6nCOOhgwP2
         OjNIMalp/NXMbNN6tNWMH6JHSPKB62FLTMrs3DRD2Uvf2zLrqBckghTftpCTGzQU0UgZ
         xt5TSVW5aW6N4aQNbLefG7zi25A1D1Q9dRU9r1ltDiGS6pDPOvcIWg6e878i79hRkua7
         jbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736809861; x=1737414661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JatB3iJnt4fYdkysh3yoyeMx8SbiKtxuCa8EVl95b/k=;
        b=SsLEeNKIOLNEwEyX9gmx1k4OgSm9cLVA6b9HgvAtmQJRZn0V/wyHAotupYn7IsEmYS
         r5stHdEDLfu1ALuLrdmFdTfodawrVQvr1tSt5ZicfX3v3AXXaGbdkOiW2ODocaQ6aPut
         Fwqx/YKV9nuPelUy61gMhVmiOAVQ+wvEJZrxISfG1i462AcKCcPrMoWMS5iRysQIdk3b
         O7ZKEnSPGNqHJ3dunmH8ytyjvMpq+bqfXxYk0cfD2xixDaerhAZKCVnoS3kxKih0f0xC
         1DPWtySky6i6O2b8S0tYk+z5+6LVsZoA1OztPeC2aUsPW8Hv/tSNdF8sogQi5bmzh/Gt
         eesg==
X-Forwarded-Encrypted: i=1; AJvYcCU1mfn2fCsVFnXmqimG3CnwBHIQ0KI5136p287S2uxufL2fDGOC3p0sb4WOaSM4Qi4JdLQpkban/tGo@vger.kernel.org, AJvYcCUDnjFZDSPkVf9CX2Qhjd2ABoVf76Z+/ERz/QthgYi899h78uEPfy0SpkaVeINYYkBJKxW8hk0a/bFX@vger.kernel.org, AJvYcCXTKExwUYU0eti5CGrh8aW9mOh7ew5rA7sEqWaKONQefNaT46UA16ZS/FDjNlVopyCD2mjBLdysqDd+BM5C@vger.kernel.org
X-Gm-Message-State: AOJu0YwXR2rU6Lw5lwRc4eQYs6Hvl+CJQ5W2ll3XkVk2x2e+WKN/DrLZ
	9++tC9lxxXhajWeDr1f6OZV5Uqxipybaa52t1B1NwzQ2/qQWN9it1sq/zw==
X-Gm-Gg: ASbGncu8bAMlJn9JGJZ0845TEyPd90v/ojzk0FsaOKhvz4J4xy84W7uuV3574+IUV0M
	c7JS45AhbQI7Z5Wc7bOc7iRWpkH7etTpqWth87ns1Lcuo9ctEQ2DaGLgcZjfYChD25lLFyWXPAu
	KQtjeGWk5EJVA0VkrH6yTGq1kJVqEUrPQGc7nAAgw6hGXiSBm9Rng1L0v5u3SHbi+1nVqJ2la6q
	gcQjRvGz2MpIokSLBVuVLAJMkvgW4gNw3CvF7+4WsTX81537UYZwiK7+HIem3QHApl77Jd8MpZB
	MthAzXknBcXI5INAjKZ3pMu10w==
X-Google-Smtp-Source: AGHT+IHUHXYYo8+0N7tFDuyRgR4GwyjS3cwo2xY2W4QoXXzhhDlhTGrS+ovs+do2fPuLaBcwkAmCCg==
X-Received: by 2002:a05:600c:450d:b0:434:a711:ace4 with SMTP id 5b1f17b1804b1-436e26a9510mr218046355e9.17.1736809861073;
        Mon, 13 Jan 2025 15:11:01 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e9dd1de9sm156091075e9.15.2025.01.13.15.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:11:00 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 3/4] dt-bindings: clock: add ID for eMMC for EN7581
Date: Tue, 14 Jan 2025 00:10:04 +0100
Message-ID: <20250113231030.6735-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250113231030.6735-1-ansuelsmth@gmail.com>
References: <20250113231030.6735-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ID for eMMC for EN7581. This is to control clock selection of eMMC
between 200MHz and 150MHz.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 include/dt-bindings/clock/en7523-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index 28e56745ccff..edfa64045f52 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -12,4 +12,6 @@
 #define EN7523_CLK_CRYPTO	6
 #define EN7523_CLK_PCIE		7
 
+#define EN7581_CLK_EMMC		8
+
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
-- 
2.45.2

