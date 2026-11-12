Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476227;
	b=gzsQmMd7GzUFY/wwZDqcQxz4jVy3mwyePG9mgpQ0a06MqE7YUQrT4s8H6bCE0CklW1Py
	 Fs4riMu03H8nQ2cagbThjXJWgosfd/UyK8OntzepOCZHamyYjiXEFF8+YaU4/9KiGeL3U
	 ShZ85nkKrEeoF6QN5mGF5IUvqZZYzvRtLlIfGdG+yOR6UyIRWbrGBlmXE7JRBkO5h/tuu
	 bSCCreVjFiJOA3siU5y52RMTlpREk3k5+i0jFOxt3IgekTicLbUOwaNXICwoahVi6lJLx
	 b1dWCfMDnGb+L/EjY8IZTaldp55LPa6+gQhW3nvzVDm6+LbK9ffUBSSfq1Sept0SZBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ESiachlockZrnvqU0XnUvarapEpxdf04nuLSeirX8gs=;
	b=WXM9Te5y1VK/626Tmz7pbYGDvDMp5WIwrJ5mbkxvg6J83ClHypFThCzb2VO7oHohe2IL
	 SD0coOO2kQALP+HJmOe31CXjBOVWPhCGZTcR8mhs4ZCfNDiFMtpjiZg/9YN6L8Lqz2zhW
	 ERjw+CD9YDkadM8PY1ilcZdX42l/8fYQ904wsXqGDos5O0NEA8qCsDsbJJ3UxhhxjvYKP
	 XK26Wl6C/64RmnDIEj4v2i1pKSsT9rTxQTFC3zb+YdtXSDAESXrPZ90Ctf1OgEvGTlNzN
	 t4KJWlgOKgzjNWl0df0fuq+0sqL4+ktBGQiBAws6eOVpkXJzM790uHCB4HbewHX42TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="lB86/Wbj";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4627606A327
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 09:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4627606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lB86/Wbj
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so35512335e9.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 01:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794476225; x=1795081025; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ESiachlockZrnvqU0XnUvarapEpxdf04nuLSeirX8gs=;
        b=lB86/WbjKtgtbsETxD+/ofiI9T3VWhFU9RSIse8Tx6nM/BvLOP4yKp/ntcYCuLfEqI
         +ItXvRatjhgrqHbzlWivmQnGJpiV+jeSvN96gtoD+F+y6cgJQKaWjWgaDCoHl+xBPnqA
         G9HJ8vNLkonGr6EDAYeawNetj7/6cJwyUejaiosnGMp8QoQOeZU6iTk0uk8zIfci+5M+
         jY3s1TqmhRHmEYOzum4eZNcjpEF+7itzDRRB6e5uzCYam3hYBSLs8tz00j8KyVE5PVZc
         FSd1xNmR6ziDIIocNuiTTQYeoH8/IIZcZVhjCwH3fEqeI6ify1SNMBDRIJaCd7FOwg6m
         4BEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476225; x=1795081025;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ESiachlockZrnvqU0XnUvarapEpxdf04nuLSeirX8gs=;
        b=sQpC+47oU6/GxTg5gmMnUhtHQ+KoDQCo4F8q45TcIfKaCWqj5FEYwt26+Ecdvfy1kl
         4INEikUPZ41/O6FdGMeDjT+/xJgmwtCkcGolG+q0N4mTEatz8Yze4tMb2Nr6bOH5daSF
         SS5btDWwu7Xn/i6LJlPYRsI+gn9NvBZVTk3XF3iYNyIXz8KSgzoeeKxyIssi4IbUqkpd
         ff/gQvRhUkxSgUTVg4tNTbCPdUFefTulQwyCrCkzxH+arXEzmuCPPTvCjCF7zLg6DmGP
         lS/vaJTnM2C5mVm9OjbhkSnO2wUe8k4vc2GUfcF94IIyC62MZQDpvqppT9gPa3/3IIfm
         ZPgA==
X-Forwarded-Encrypted: i=1; AL+hErHqc4R3fDLEDvkyORANPByghmMu8FxZ/oZlSy959G03eVV1xkCx2XxeXH75+kAhG3rUisrm1XeH2Co=@vger.kernel.org
X-Gm-Message-State: APuU4Z90ZD3ZL+DX0GdrrcBI91b5MltJSuVKHTdLb3gg1QtvvUi1Q5zB
	2UTPbcWpeQtTO6iGPyEDxI432DzyGf9dPtVVQMsPdnB45HKDzYUEvDu4ayuozm3lfZc=
X-Gm-Gg: AYBFou0Q8Q7nGwwUdsTQGzJYJi6a8FGtT3/a/4bKz9DuARr7rz/iA+fojYHQJYRza+C
	ohFLvs6ul9IqhLzJ90x38NzmstW1fKEwpYN3H1/EaT6uW1/e22TrKCPWIftcPQjYwzHAxu2Blox
	O0wrFrNeSi3cx6iJTL4WFEvlZuR0XUJXWAh/h3wjg0czuuCquI5fQc5Od6gk1aekIIST0Gu7LTq
	9xB+gxgbafKOXvCqmZAbFHsQ1Zu0ZZsZSCkezfK9y/bCKl+NKR9W1ZT5H6t8nItG5jxWO/SEU7x
	kkOBZYUFndFqVN9zqoUXHlJ7ENCxofRn0TshwbzTvBWjYdBxlfmBK/tCyaTqytz1pTJPi5cRIdX
	4b4ydvuQxz+vRbBdVaNnZa9yU58BqYLJg4wzZBoZIugd+G/TJXiq9PAshde+6na8rfGefRDA0Jh
	vdWpLZUwNEJFeJdkYi/37WcaCi/O2fQj48NjZKKvmMvh3zPl5qpNdlW8w1dmvYDFtvZEVk5VNpy
	fYbK3UOo8OJRsvVt2LqquOsIETo8wL7YyWKXt2lDbG7QdBexcNdAjNTzXvzKG1OfdsX+VImZIJ0
	rCOnbrDwiQU4IVTz6c4oDj2UVjekmow7dqPSZgzNW4ytfZd57lsZKwF/zVsVzWKnROtkDprRrRF
	eo2KjZ95myaw7q7E9dQwdWQl3orJOr3N95GifHPQVXGzbwA==
X-Received: by 2002:a05:600c:1914:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4ba0937ad15mr93644665e9.19.1794476225131;
        Thu, 12 Nov 2026 01:37:05 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm85413905e9.0.2026.11.12.01.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:37:04 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/3] Fix clk-divider rates above 4.29 GHz on 64-bit
Date: Thu, 12 Nov 2026 10:36:58 +0100
Message-Id: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5WOSw6CMBRFt0I6toYWBHTkPgyDfh7ylF9eSyMh7
 N2CK3B4kpN77socEIJjt2RlBAEdjkMEeUqYadXwBI42MpOpLIRIJZ8n5wlUz0335hYDWiDeKYo
 mKQ+OV6XMi7IqcsiuLM5MBA1+jsSj/rGb9QuM33d3o0XnR1qOD0Hs3h+5IHjKQYsyzS66UVbet
 Vo61ARnM/as3rbtC8wmwD7lAAAA
X-Change-ID: 20261102-upstream-clk-divider-large-rates-872467864e39
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Maxime Coquelin <maxime.coquelin@st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Michael Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On 64-bit platforms, the clk-divider truncates requested rates above
4.29 GHz when computing a divisor. Fix it and add KUnit tests.

Sebastian Reichel fixed this in 2023 [1], but later versions moved to a
new generic macro and were never applied. Patch 1 builds on his v1 and
rounds up with (parent_rate - 1) / rate + 1, which does not overflow
with clk_round_rate(clk, ULONG_MAX). Patch 2 fixes a division by zero
found by the new tests.

[1] https://lore.kernel.org/linux-clk/20230519190522.194729-3-sebastian.reichel@collabora.com/

---
Changes in v2:
- Patch 1: round up with (parent_rate - 1) / rate + 1, as
  DIV64_U64_ROUND_UP() overflows with clk_round_rate(clk, ULONG_MAX)
  (Jerome, David)
- New patch 2: fix a division by zero in round-closest dividers
- Patch 3: also test the maximum rate (Brian) and rates above the parent
- Link to v1: https://patch.msgid.link/20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com

---
Carlo Caione (3):
      clk: divider: Fix the divisor for rates above 4.29 GHz
      clk: divider: Fix round-closest for rates above the parent rate
      clk: divider: test: Add tests for rates above 4.29 GHz

 drivers/clk/clk-divider.c      |  21 +++-
 drivers/clk/clk-divider_test.c | 244 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 260 insertions(+), 5 deletions(-)
---
base-commit: ab94dbf302331eed3679e262e1d8d1a73f308640
change-id: 20261102-upstream-clk-divider-large-rates-872467864e39

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

