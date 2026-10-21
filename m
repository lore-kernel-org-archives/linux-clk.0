Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575964;
	b=NXDcFnH4Yt+By1GkFZYzna9eE2gAMLGFxnPlYxVxwrCOSTv0Dl/2H2SOyK9/paAZ+Y3+
	 3xMmy1zcy7VkcUocwBrdd6v5XZqCm295wHSktWhvrKlIuX+wTDrau6Lpil2CbBCoyE2/C
	 ovmcvvAnPaAHaw+sUXN+ksYJvejDlNXntExMtXntFYGROTF9KS2A4GrEp/7b0gW44kMLx
	 whNe7tPEjg4ZqGV5UWBly6acXThQNZCz5f640xpaG7U+h1bAKJ7GCKndSpajVdSl9tsbC
	 3KLGaZ266mfxLImFIizzTSHnljVAYS4EhjItFgOCq4vlSG3eO90PTlxIgRg6ILx7vWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=24F/d8Z+ERFiE118WtTUpKViM5tZiEO9H1s/ycjWi/Y=;
	b=sovH+l2lA1hTIMI9ixnM9ySVy/yxQdt+/O9wllMN2mf9Lyp8dQ2E6pggHZ2lsB5vN1PD
	 bj8YdW5Rq79giVbrxrYPK5nwiAW6F5vxJ2bkx1IpRP1YuIgmOGXlMFgDEnDxq4uPxs3o2
	 nF46LEOtRc7Jqv82hXtK5uYEzBa5LijVDW/m7v8TKK/NOuauHLxzPAi8phZtQOlOotYz/
	 vyNpcw25C9QiXslzYg3JZAwezur/qxqodKoak9ulAtVnuTYfeydjGs3+qRM924nOlo2j4
	 Amwc51eYpFTHjahVFxTqtaB4c6wRngyydN4CyF/YLwMS0IYGVDiWu9LZj+6AX9ChBdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PWoutujy;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE17606A31E
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 09:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE17606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PWoutujy
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so3474185e9.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575962; x=1793180762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24F/d8Z+ERFiE118WtTUpKViM5tZiEO9H1s/ycjWi/Y=;
        b=PWoutujyIoRGuofHtTRZnHId0HXYZ+TiVKa3GHuxDc34OaszjKj6r1xqRfR8s4xocf
         upF/LOGDzkzeq1/Vjd36KiK45m+8db/XqNDiKF6H/C4qkPUAwM7n/wjEa/FEPH9d71ri
         G8ryHZU3RqC0X3P925JN+AqnPMyDVIdqU4Li0v//xBG/n2oGTmsj3NFAlpN9tYs3wW37
         gpvHhUDv4Xuyf/KRijLrIjMFxHv8q4hw3CzrGJ/Yd+FuYs5NXonm6FlIXvbcgEjt844V
         Gpgcf/qc/bsd9CQ7wcvg+dsn9dmEfj8LHga+yAdrjem5qNbPNCUiNO6wk6k9gGI36XgB
         cpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575962; x=1793180762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=24F/d8Z+ERFiE118WtTUpKViM5tZiEO9H1s/ycjWi/Y=;
        b=URe1/vSXz1sEz0dspTOZvUlEJm37jBd4sHkCtVB2UMnswXEaKdEO4IckTkShS3ar68
         Ce45GOPiUWfFH/pEjxYQGkxQ2mN73k3BRw43N3GoP6UeSOdhYbJZDAGQBY1q0hCtLR7R
         9AoSIBFxcbwJpAASAnI6S4iYVHlDJClHNF/U/HuPswDf32Wc4eCmlJFd5Awfny8MHoVp
         R9DifA0KonvLiX755aF+utcWGe0eA4C3KuzfAEcYdigeqbsvAuzL/8E54huZuRahS/w1
         3OqNnknjZN3S4V3M5STaQY1v7lekh+kBEyu0Lbhfjnxdn0BXoGlYfPQn8ygucytMxHMg
         BliA==
X-Forwarded-Encrypted: i=1; AKwUvBxgRko24RWLhWPd2S/ygt0mU6itu5wxCnYZrMJjD1ryZRE0T7lqU0JO+yX5q+xZLEQXFkGwRne0MNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS9Gef4tX1LwoZq3vEGGfj/U8GpghY1qHTsGxMcDabBd3XZsTg
	WcfeuBwOF65W9qwaq7LgA34AmVCtr3dwb0Y8YDk3lpQuYyeFbbrHoq5v
X-Gm-Gg: AYBFou1VPZSPQ7ZMfaAfwUlMABBLkLV6Wn3PysXc9cfetXnSD6uMFUgMPswjq36blPk
	W0lTn7yMo5P4srjqWMwdmnicdYaY3YZgSqTRjQsKuf3sCj43/rW+Xnl1WvcGM/iZqyFuUVRPfNl
	zbwCYYaq8OMmfZEuFNnlcJ75hr/9Nqmqq6Yxn1ivG2EPU6i+zY7ydFfg3uDiFg2VpwqzpULqPI+
	bll7QSJFHG3stvv14IoHp0Rmouy8zA+Ua8KpD5Tj/q8Y9ZE6BPnoO4Hvi/JdwHtlQPTNH5PhKqI
	kTumGHWTAZRQ+7tCwJuDGmKzubb3TAvZesjN+nkngLo4LrKRtseOuST2jwN/XMQ9gk38lRze0BT
	ozIi9DjnukaqhZWmTp/5LUWa+Xj87UEoTpLuH0H2MpYDixPGYFS0ui0+SwDfZWjr6VDDZMKi02I
	g+rGlhUjCeODV1BgXM7W9hzoVi3eLDM7Q5K9xYR6WSnFfWXmwkmhjPfeOA/OEKtp4477cUUS1EA
	YRCrlAbypc8Z7k3ww6cGgiD8dDPYXHHlFp26HZ5yNdfBMEVUkQ=
X-Received: by 2002:a05:600c:1f95:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a1fdd109camr28889945e9.28.1792575961841;
        Wed, 21 Oct 2026 02:46:01 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258427cesm4320300f8f.52.2026.10.21.02.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:46:00 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: akkun11.open@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	bmasney+clk@redhat.com,
	dakr@kernel.org,
	jbrunet+clk@baylibre.com,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	nicolas.frattaroli@collabora.com,
	o-takashi@sakamocchi.jp,
	sboyd@kernel.org,
	sjoerd@collabora.com,
	u.kleine-koenig@baylibre.com,
	wenst@chromium.org,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: [PATCH 3/6] clk: mediatek: Reserve missing MT8167 clock ID
Date: Wed, 21 Oct 2026 11:45:20 +0200
Message-ID: <20261021094542.59417-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921102522.1640072-4-akkun11.open@gmail.com>
References: <20260921102522.1640072-4-akkun11.open@gmail.com>
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

I tested this patch on the Sony PlayStation Classic Mini (MT8167) and
unfortunately it breaks HDMI output.

MediaTek HDMI PHY driver registers the hdmtx_clkdig_cts clock at runtime
[1]. When this patch is applied, the following boot error appears:

10018300.hdmi-phy: error -EEXIST: failed to register clk 'hdmtx_dig_cts'
  (0xffff0000018539a0)
10018300.hdmi-phy: error -EEXIST: Failed to register PLL
10018300.hdmi-phy: probe with driver mediatek-hdmi-phy failed with error
  -17

The original problem is caused by having the HDMI PHY node disabled in the
DTS, which is usually the dtsi default, but it does not happen if the
HDMI PHY is enabled. If this is merged I think this error would show
up on all the affected SoCs.

[1] https://github.com/torvalds/linux/blob/a804c5742bff224d4cb4d25dd383554d598be32b/drivers/phy/mediatek/phy-mtk-hdmi.c#L140
--
Luca

