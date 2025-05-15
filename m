Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A371BC4E
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 13:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314455; cv=none; b=cbhRwteV5I+9E/SEQYqYMcFz3YgY/ZZfY061A6rAYJowZH3zXnytQvkjBHj23BKAiGVLmZbjd0KJUfsUtvis3RZDjuvtguslKNXxW3onqpRpye4Ci2dZpOpVib28nNjJcKt0wPFvBxgf8z6rpqmkjFb6TFF8MzoekTSXtGsm+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314455; c=relaxed/simple;
	bh=xEJGCcPVFal23aCZJqJ2U+RUtpjAwTlRqxHeF6GWSRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CDDd0KH3BdibfE1DkTmsWuCje2PJcGzdNP/WWyQFHo5cXEf06p/+z9YfwcXWk4iuNWksguNFhXvcn3KNxFkw3CxovCoHFHs8kswL+oUvb1pzh++2Anw5a7ChKgaQ0EuLU71hA2SZw7gtNXdvT7Eybz2XqZrbQxMzsgMM30pDPRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZbDT/ULK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZbDT/ULK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso8653445e9.2
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 06:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747314451; x=1747919251; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iDfRqwWfszcqhqCUOCGRTjujtzBxRWhvCOesR4XZCXc=;
        b=ZbDT/ULKSNyblnB0Aeh0AiWOmJIwu5ghQSUy3hR4BEyD1O2VgYtv6KLSVhm60zRIYb
         V+GyiGojUXGnerxWUoT0qdJM7p8CBTm8x3mjATn0gJKtJSJ8934o14YSeJ9K29ErgUbi
         A4fk6TkX0QoJ0xtr/Xm/jd6+4GDBD64ZI85ha+1xvsMrxJumj+QuweviFCwrAZrHCg0x
         SUCyxrPqAnqlWlA0wrQzUTvCsej+mYRnoiRd6TKOi2zRPCrMGMAKi5/lvtPNVumlR8y9
         dbQA/J27ayyR6xRvVXe6bf1bRlCgFQNTJOiuH54E3Vmq+dEDJEqDyVMaRfOeVnj1S4bm
         jv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747314451; x=1747919251;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iDfRqwWfszcqhqCUOCGRTjujtzBxRWhvCOesR4XZCXc=;
        b=FfM5DKSC3zJ4j6wjSExhWcBB8RuS5JFnXJ3VgvMhwSFiIg8KHUz80oZM2ftXKhiD2Y
         15jz6sX74TMg9mBGbrjVspaDaweMEcGZw/sPltApG0D5Dt3801QLAW7p0zZM0OsTk2k1
         HL7CrLt5aWPjO+ml/xekI8glM399izFanaPnDUwvoLcJNObOnbV4Ec0sk1u2rChlB2L+
         VrKquQYy0A+8+Wnp46q9GoPZrbEQxY34IjtMpHQDLrE4Txd9bo5DGI3mbpRY4ElD1Dh2
         Jd4fjfetk9aitGH+k82AnMtylvzDUJDkiRk4XUiQToB4Dp9afUvuJeEsF5IYBSDxpl1P
         A+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzhVd1H2i1ll5KkiYN2FfMsbnT7GkP5Sx1/UHRB/E6JUHV70Ofuat9wjIzQDkM3B9W1kSC05od+eA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa+ZYZHo/wodcj/D8olrE/Rjn7E/AsgnCRhEWnVARuHwL1sBkc
	wc88nNn+DIFilrk9dbsZXETlUSUYDJIwwvqot4w56Mb7TnBisP/rYLe9LNXEA1g=
X-Gm-Gg: ASbGncvgx3/AtIQy+RC/j82IDS3+7k/oyFR4lcON0ESwmfH2CcxAnGsEjV5BLOqFbhQ
	I9nOhbLILjL1v38wTCo5A1iw8EkZwT0kinYWx6/yUV//e24t9q2YsGPKwILyIByqThgiBmhXmH7
	RVnA0dyBxLbyduifY9bcACnzgIE76ZSikjDGW2x/NIZvTSmSUhft8anj4VkxliTDa3AHtMjDwa+
	ejFaVioTihTdXrBhVz1dVznmygrznNO5eYcjOcjCnBsZ5kv4vK5YH6SmwcAXgCBoM7LV1LPMbKA
	D7ycCx/+MstmAdwxzX+yOanVTGWMFKIIOHjX33DHQMwFAa4M879naV5pswHhVA==
X-Google-Smtp-Source: AGHT+IFzTwr6XrgpHahEDEhk8qmO3Jyl7d4MjTwz9FJVl2SaaSHYZKmfUjsNvoEcZvjzAqzfyAW6CA==
X-Received: by 2002:a05:600c:a014:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-442f970aa63mr20565245e9.21.1747314451351;
        Thu, 15 May 2025 06:07:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:82b8:c32f:4d8c:199e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442f3369293sm70577055e9.6.2025.05.15.06.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:07:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Subject: [GIT PULL] clk: meson: amlogic updates for v6.16
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 15 May 2025 15:07:29 +0200
Message-ID: <1j4ixmxbse.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Stephen,

Here are the Amlogic clock updates for v6.16, just a couple of simple fixes.
Please pull.

Cheers
Jerome

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.16-1

for you to fetch changes up to 0afce85ed26c73860bb6e99a0657e1d90d533256:

  clk: meson: Do not enable by default during compile testing (2025-05-15 14:44:50 +0200)

----------------------------------------------------------------
Amlogic clock updates for v6.16:

* Fix G12 SPICC clock sources
* Compile test Amlogic clocks only if ARCH_MESON is set

----------------------------------------------------------------
Da Xue (1):
      clk: meson-g12a: add missing fclk_div2 to spicc

Krzysztof Kozlowski (1):
      clk: meson: Do not enable by default during compile testing

 drivers/clk/meson/Kconfig | 16 ++++++++--------
 drivers/clk/meson/g12a.c  |  1 +
 2 files changed, 9 insertions(+), 8 deletions(-)

