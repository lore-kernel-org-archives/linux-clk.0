Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2361D86F6
	for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 16:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737044657; cv=none; b=tXxkIaqTbFdXcZuVSKwuQ/fiDiBg586RT/h5KDLerJFVnuBdcna0di4KlFIxUpAzPlMoNMVPwzLdRThjqB3ogkW3ZLdL5MZZroQW7yavi3BZIHRS/k5Z1ww9uR5ZMoUy88d1mZkd3NBnq21z8TtgUR2pFR/j+22Ws6kc0Ijp0R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737044657; c=relaxed/simple;
	bh=pbY4CeM7I6pcN98vHzgogkhz8niM8qOCmP45kpFIA3U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QkzDoyUuzTByHBB5FjWHUnI2IilZY48gXAqmcDNyUXOq75IoA/g+212hDAODij7CeUmHiuCpBUTOMdai2kuEyd5edUraqxHqB+3/4NkBLcw8dW7nnxm9uwtA1jnEX+4MFiwd5N2qToexF4iJSNzo67ESI9hZS8KiznzooBz2RpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=n/rJZOov; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="n/rJZOov"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385de59c1a0so683984f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 08:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737044652; x=1737649452; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JkidhIxI0JJqKCLy7C7vNd6vALRZn2Ej+iOClGDcLcc=;
        b=n/rJZOovohMQCGmGOd0E+Q9bqePTya2cK2pIl+EmghsI0jPI2K59SHEnsdifWFOvY/
         rTH8UHUajK/2LPCq5uvAcLU8Nig9WbAJDcS3LqtmbB0nxeWjfgaLqJ50hSMeRQZbNUzi
         YyRNuwr06NAcV0hani8DmcRf0UojBCljApdSGqDyMcRGsr1RoC/QeYV8M1xWTShzFix0
         7fwXRhUpARJJxtuufXRUhOJQB4+5RaCBZ6ktj26fIqtpceY/nPVxtUqhiFgqqC0bfaA2
         JxNk70W95y6Fv8GUmfowylT7nCMfWvqBjLn8z8B69/htBcGCBpPUGBtHxT01thGnRjVw
         Ij6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737044652; x=1737649452;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JkidhIxI0JJqKCLy7C7vNd6vALRZn2Ej+iOClGDcLcc=;
        b=X9R/THX2v3I7J8CbL8p+DNQfkAZqsS1KvmhrMYRwRxyzd5Gd9c2fkkx0uaV6FXoor3
         kAnYQuwIsBquMqAymu0/vl/fU6cfWo/nYSvBGyJk9wUfTI2QJTbSYJ8btCRUa+CXqL20
         RpRzerei9q8JrsOWK5Vc2kdtKTVDD3joyWt41tHuyGl19lTCToQP0mqOe0oc5Rb+WCrq
         AoKuwT92vNDpIp4C55w6pqpuit9baSHpE6BFaX9adJ1DIbCH8+xI1ieT+Y3sYVjqHbqj
         RGgmYogzIqkxrIERh63wl9PWK08EV/i8taXOySNvC2NzHUJ2oPwm82RvnDaXotsige/4
         xRQw==
X-Gm-Message-State: AOJu0YwPZPUQpJqhlH4PviSqC9Y1Rkcu1lp3MKyqEd6r+0mlWSjxseNo
	pXZ7phqrz5iuzyD77Qayhj0GL23dUg2rc4yEULgArOQVZIACNBuSTS3BCtUYh9U=
X-Gm-Gg: ASbGnctwifeGWn4d54ivw2t761eeQszMyxA29RtVlsWaI3Wck1/HVml2JVazT+cOqq5
	Fo6HLJbjcOAVTf3NMzRvXHqwfsVbpuyo7Xfp2xauicQkpPQZSLr5qNuLDpwbVuBQG8wXqNmXOVD
	G86pY6QeuNll4Dmf7vkgDXQCWNQ0VCh1nwQrtnY2BbNkjULNcBIQUZaHQzNyuktTqta9yN2re4Y
	vedp68oHNYf+fpNDYqFjsnLZ9FKo+BoHzQLBm5dpGvjAjEc
X-Google-Smtp-Source: AGHT+IEK9Riy8ul/CXhkvjuSyP8TO4TugJgmWjoRSyKi2uOy9w+mQYDd/mxF5HQqa/Eb7X2t/US4rw==
X-Received: by 2002:a5d:584f:0:b0:385:f638:c68a with SMTP id ffacd0b85a97d-38a8730b738mr30034471f8f.30.1737044652594;
        Thu, 16 Jan 2025 08:24:12 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890469ba8sm3715955e9.37.2025.01.16.08.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:24:12 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/5] clk: bcm: rpi: Add additional clocks for 2712.
Date: Thu, 16 Jan 2025 16:24:07 +0000
Message-Id: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKcyiWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0NT3aTkXCNzQyPd5Jxs3dKClMSS1GJdS4tEE/M0YyNDQ7MUJaDOgqL
 UtMwKsKnRsbW1ACw4f2llAAAA
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.1

These patches were Acked by Stephen as patches 30-34 of
https://lore.kernel.org/all/20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com/
with v2 at
https://lore.kernel.org/all/20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com/

I'm a newbie on kernel processes and where the patches should be merged.

I'd asked Stephen on the v1 thread as to what needed to happen to get
them merged, and he asked me to resend the clk patches for the next merge
window.
I must confess to it having slipped my mind, but resending them now to
hopefully be merged in time.

Thanks.
  Dave

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dom Cobley (3):
      clk: bcm: rpi: Add ISP to exported clocks
      clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
      clk: bcm: rpi: Enable minimize for all firmware clocks

Maxime Ripard (2):
      clk: bcm: rpi: Create helper to retrieve private data
      clk: bcm: rpi: Add disp clock

 drivers/clk/bcm/clk-raspberrypi.c          | 33 ++++++++++++++++++++++--------
 include/soc/bcm2835/raspberrypi-firmware.h |  1 +
 2 files changed, 25 insertions(+), 9 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20250115-bcm2712-clk-updates-98a47f32116d

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

