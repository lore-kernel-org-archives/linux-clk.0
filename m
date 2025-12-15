Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EAC287516
	for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765795871; cv=none; b=oZ7MtPY+nNXzdu7peDHeWxK2WBZfDX/1fEg83O991FmZ5H3esjnvmI2eQEWxJJquj9pL6xIdtroR0llIuGtRM4h/g5pP6TcG4upkbldx7uXTKlQL7MwIp6sYrMNZKJgvSlK02kt/hg0yri7MlWz0SQ9sW02ENxJY/y4we5nd2Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765795871; c=relaxed/simple;
	bh=53C07aiX+KmUS4ZwyUDhunA2al4zK1t48hjSDjLErNw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uFowreu7oJ/42mZ6opPRsxsNc0EQyK7dVP9cjR33dN3mvbaxAa4VvCJ772ZAggJfXVAhMj2bF6qbCD6XQBfNFRM4MFY3uG8++Lvmvh0noyK6+bc3fsOgs+c8qD+7dA8CCK0vAGjzj2Pr/1Z9Bmyd5BTbPr4akEA/eSGL4iyrq5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=If1nQ4jw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="If1nQ4jw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so37613555e9.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 02:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765795867; x=1766400667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=df9nR8VZxWqdoDGlAC2gMzlQG9390TwrDoFTIv4go2s=;
        b=If1nQ4jwOAZPBKTmVlMwwvUIqFVIqAZV9QfHvo/pvBflGwz8b/6pjJLdq8fJ/lZO8R
         UPwA1qO9MV2uAao6FnK2bOqulPgnbCb9z8uOaLYAtRXdr1Lgf9DrXDzeZyK9mpoySIIa
         F/SKjk8GvHly5Z1cjphEyxQPdnsQENPBXH+t73WkN4W0CwtTiyGafss759wV+a7nO8Ai
         6iNreaazj1u4u/aSGWdauyEosweNyJ42T/TqtYnSoW7E0aNMUxbqMVfyJqtrPMDV7MBD
         QaKbC0UnujGJa/Od8YLyV8uv6wSL5ZfjlOFY+cyIvZCVdPNZGmGSJ3WTmmoonNmhBEWn
         X/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765795867; x=1766400667;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=df9nR8VZxWqdoDGlAC2gMzlQG9390TwrDoFTIv4go2s=;
        b=VQZ1mGKgU94ZDIvO2+t3LPSpOxHKdmMeSTeMM8vJP2T87uYI2dGkmQTig126Spspiz
         V4wOjEZUUOFopyV5fJIKMYgYSqGirpv4wRQiaT2MkrZBgTMKUlkSOJNb8Mz+tA85qzZO
         CcFPaw+I4cbKGkc03WgVzPaXs7MoJJMivaAsL51+uP6h6rzOVjkxlW5Dgc7vFyeGiF01
         pEm2Gq+z3XNchQiWiA2l5MF4abIXv/ulDiyNh61kSOYekK+8wc8l3NL9KEOohbvQK+Qo
         qt60ClNBEa94WL4Rt7GQWfF6fq1TqWcJXDG9eHul5eMO9bMnSlP5oBKm1iuaqqbTM+48
         M7cQ==
X-Gm-Message-State: AOJu0Yx/SIh3QArR//J8SjRLA3tIX6mGInSaD07/s9vlYZeFpjTszjHD
	1UIl9kUB/rHAModKQkhYUEGTBve6zN+j4uO4xidQOAvz9wyGBARwfY1X3wzPFCCFhbY=
X-Gm-Gg: AY/fxX5PcrALtvA00khCt4L8dqTI21IMxxc+zauMzGaiVC1RFBhmuBDgxJLEylJt8Ex
	8eY4MpGY4BjsFFDt54UK6ZTbWxP0U17QBA8bJFHcL/CAZ8IS6WMkR1N1/xASdRN+oz/dQCYrceQ
	97VWpR6+3fQnhEDdJb9kbfxH1KaFT1SuPYvhHPM/5Vu045yGx1SRZJh523UCMFgDX1oDdoP4qE3
	akPR5lsgmdw/mEQCzg7gaM/AwhI7h19Qzr9kXe0sQDNdrCvW72i7qQ8mh7gocOOL19PfPU945qF
	t+2Y9KddoTWspObmKJSVNvZoJsv+xTXT9ucWGwAFOgdCg0NzepnBp3dzaTOsGmzHZCv/CLx2UrG
	ecfh/p4D+Ky5IbKS7T1cNdQfqyYHzBQUNO7gfcAE3sxX0wGB0I39PiL9+/3HhxTIsnMc/mkjZSC
	hOb2ITneo4D0Kdj1PpoKbqUDZl
X-Google-Smtp-Source: AGHT+IGQkDPSiIqBU16hW6pkKLW9N/W+yMzLNnRQRqaDZA+xNXh4rMLXjgTTwvCUQbRtUa5UMQD+Sw==
X-Received: by 2002:a05:600c:8b6d:b0:479:3a87:2093 with SMTP id 5b1f17b1804b1-47a8f914528mr96491215e9.37.1765795866989;
        Mon, 15 Dec 2025 02:51:06 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:3f77:1837:bfee:f255])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-430fb078e56sm7695439f8f.21.2025.12.15.02.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:51:06 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20250919-add_video_clk-v6-0-fe223161fb3f@amlogic.com>
References: <20250919-add_video_clk-v6-0-fe223161fb3f@amlogic.com>
Subject: Re: [PATCH v6 0/3] clk: amlogic: add video-related clocks for S4
 SoC
Message-Id: <176579586619.1510096.14461375977036233686.b4-ty@baylibre.com>
Date: Mon, 15 Dec 2025 11:51:06 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Applied to clk-meson (clk-meson-next), thanks!

[1/3] dt-bindings: clock: add video clock indices for Amlogic S4 SoC
      https://github.com/BayLibre/clk-meson/commit/29c4f32095d0
[2/3] clk: amlogic: add video-related clocks for S4 SoC
      https://github.com/BayLibre/clk-meson/commit/c78c9dbe2bb9
[3/3] clk: amlogic: remove potentially unsafe flags from S4 video clocks
      https://github.com/BayLibre/clk-meson/commit/4aca7e92023c

Best regards,
--
Jerome

