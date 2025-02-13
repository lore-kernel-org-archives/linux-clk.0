Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2B815539A;
	Thu, 13 Feb 2025 17:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467517; cv=none; b=vGntKmBajEevcGj3IjmK5nhw0hZPHgfIcKqLWxCrtHBEzQGEHqvwN/fObjmxu2JUixjFhJCWJUwNR5Q77o2SdC7FJwrXfdAVgQgBt/Vf4otwlwgUIrL3zloU+eJprhE4Wk5W95axggQAY53fy9OStOZumdLnRZ0CBvBUhBuUHWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467517; c=relaxed/simple;
	bh=VMYWSsH8QrPxZbFQtUpelBA46x5+bWjvZ2r99Z1W3HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TtjmcvCdQ7oF/Lhkfp1jd6Z0mIY1p4hVuPmuzyIXxJtuG1K7on8hX1Nx6mmMUNYKBRKky7sClkPFBzgMjF223Jzao2p9S7QdHpJdR0DEzOIfQKO8zYxrLbIWKcysYoR/t8XNlGkXNo5wijOtTZO8nV1hV6x4bKR02mR8BgKEGR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELTXc3+A; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELTXc3+A"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5fcb72ffb76so339836eaf.0;
        Thu, 13 Feb 2025 09:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739467514; x=1740072314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NC0gjVnxt4O15p2NxkemDQxdl3X7+EfnLKcG4TwVy48=;
        b=ELTXc3+Aj0kbG61fv7XnPcbLWX34OvBH/FYq+/yA9V5UIMtXNit66qNGGaPuLmM8Cb
         otbiYYFWOW98mhoE/8yhVAVL8qR954z4Sns0iBz12o8U6POrxocO8pqxaPZMXlLSDcI+
         vFm6yKqxkBtWPxIdxCCtzS66nig6ef20TiWj5cf/qUk2WswXR5bfwYDH2NMXpzRNsWWn
         eInCKXbEAVa5WVQV0ezJjgezIQewKCBXY2dcTWok5i3CBql0gFzxjWtY1/EP5yWVdyLB
         qz7HPMljDzUOV8xhZsB56DFiBGF8Nwm4pt9WLcjiXWkTtVE2C62EtnWpAPTgMwcA56t+
         o5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467514; x=1740072314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NC0gjVnxt4O15p2NxkemDQxdl3X7+EfnLKcG4TwVy48=;
        b=Qo+/OgF8Ao/jeDOl7OD9q5XaWaxNTPHXyde7h/jqpjqj9+jmVkX0qn7EtNJT898owC
         TETqyMyVS98e38AopJMwPNvz2lgdkIGkfQLlbZpieivRD0ubPdfP11XBkL7vzi2hLyaO
         HSjtTGv5lZboXXO5OeI6/i5IOWNUzTDoWVX2TrPZ2mmk2ekDkDq4en3u+x82e5Z3IhfH
         BWwvz8F5wwxVaHwTzULncn2nES+yLYds91EsFJ98txuv/6z28+sovjF4AMOgyMR0vFHg
         HxAIhAlv0vtiAmt+QC4ioycM0lHfgqKqg3ScGFEDqTQrOMFbzFFATHhKq36fq0z1o852
         dnuA==
X-Forwarded-Encrypted: i=1; AJvYcCU4vS5rcwHgZ2tInie9ql6Z46hm0hu0v3BwsDew3IdhYj+sEBsVc31SLgnY2wpwepCT6/oaZ6duI1o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn6i7n+IbTzV3iZKlbcgfUUght73ZpzdQJ/h0X91nfac/iXUBi
	SLWT07iMbsqbRM5KIXsxUwPOPe4uq5ldYgbIjDUttNIGNbjc2n53
X-Gm-Gg: ASbGnctNRwYcj28x0G+G1gmKGlDN77WQ8JhbuWnXG78e/j+MKBuKCpkEvHlkmZIxijL
	syJ3utKWhkQzLoOIp8YJ/I5y2VBDb4yCSTGQOCSSBSeionXRmtOPVJtrueilDyFB0uhxw/flZUt
	zfuFbRZuswJM8172VfNbI+bycglbhpPAOggcAcy6O+RwciqlpkDUiIvbx7kf37fC3xmt4t98XTS
	J0NaTAwGIwEJgGH3Aga1Ow/zgOZ2LzF8AChbB61tCBt2ltZAL7GghJTqCMoLvGtEU8EuezJG4Js
	GMC19qqTlyUJl5rqbKFotVhMx4YTZ8sqqWw=
X-Google-Smtp-Source: AGHT+IHMPb5bBBC/1QDSYybmG+VaVkuaJ/TpwRYu/tD+Ot2X4QRdZ62tgboTYHD4NCXnaisKyPW16g==
X-Received: by 2002:a4a:e849:0:b0:5fa:61a7:16b8 with SMTP id 006d021491bc7-5fcb08fb8e1mr2213914eaf.2.1739467514552;
        Thu, 13 Feb 2025 09:25:14 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:2d58:1e06:61bd:218e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb155b77dsm680358eaf.0.2025.02.13.09.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:25:14 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	p.zabel@pengutronix.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	ryan@testtoast.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 0/2] Add Clock and Reset for TCON LCD
Date: Thu, 13 Feb 2025 11:22:46 -0600
Message-ID: <20250213172248.158447-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the required resets and clocks used by the display engine TCON for
LCD output. This is required for LCD output for the DE33 which is
currently pending acceptance into mainline.

Note that while the clock is exposed on the T507, H616, and H700 the
H616 does not expose the LCD controller that requires these clocks.

https://lore.kernel.org/linux-sunxi/67acd970.050a0220.1eb03a.101e@mx.google.com/

Changes since V1:
 - Updated commit message to note that the H616 has this clock, but not
   the LCD controller that uses this clock.

Chris Morgan (2):
  dt-bindings: clock: sun50i-h616-ccu: Add LCD TCON clk and reset
  clk: sunxi-ng: h616: Add clock/reset for LCD TCON

 drivers/clk/sunxi-ng/ccu-sun50i-h616.c      | 24 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h      |  2 +-
 include/dt-bindings/clock/sun50i-h616-ccu.h |  4 ++++
 include/dt-bindings/reset/sun50i-h616-ccu.h |  2 ++
 4 files changed, 31 insertions(+), 1 deletion(-)

-- 
2.43.0

