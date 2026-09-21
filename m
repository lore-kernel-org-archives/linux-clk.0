Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E9F375ADD
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 20:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790021117; cv=none; b=Lhj0NQOINT5Ct1jJ9engYWlrTbdirEXWgntR4sMNgA9gG6F2RO9GmSDjnkMtpvtP+4LG/D+onIjBit82VDRUoQ8QrWoVN0eA0SAGWC9nU4+8YArYRWx10/G/Yg6u0lOdGuQTNFVbyibMzH0hr7VDl+K7kTEZOA4ZwpPX27cIHYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790021117; c=relaxed/simple;
	bh=7mw1SC7j2m+3fApFRtf/aio3nVzJa9ABqYViSIzMyeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYDhdP6RWTMzWsUoeGzBRrfOYttnQxVfqmwlyxOqGyZv3P4ocnfBvHge+ScmiBhhEemqhFItJfsG1J7ho3Gp7l0nXVw9eKshDOyZAxpLn0cQAjqkchggeqUg5JMx0Q/FeTytRuqdoFcHTZ941aBpxw58iSUQjFJMycc/up1MWUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARD8EeQn; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARD8EeQn"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4bf3dedf3so2154137b6e.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 13:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790021115; x=1790625915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEqRIUud4Bp4XkJfTYRmT98hk05FTIWNPmdqE/L9jW8=;
        b=ARD8EeQnt7st4LssyLm4BlT+NL4zdE6nN5ju0bU9MYkxXVk/6QFlFUcbTjMzrWYVwH
         6EOAf1MoU9q2dPw2VQEDDZwE9nramCXrFUgQPwoNLtb+ciPIS42E6scVAKtX3UkfquuS
         rtecAoeDkELB6ThBiXKhkbUZbb4CHPxY5gD0d5O+Ia5nxOFOkUm937YnJ0HVgQWaTEmQ
         S9dHG+McO6ni3a2eWp4/ijBmQpsf97X3O6uyx38VwOT7V5buwkLUG7aNKqVzkdEvppu5
         5683Qe7eZeCVVt3t2EXyl1Ll99Tn2RFV5FUvw/bhGN2SblUrmragUiwhAIMtd/Xi0D0x
         8b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790021115; x=1790625915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEqRIUud4Bp4XkJfTYRmT98hk05FTIWNPmdqE/L9jW8=;
        b=Wp0+8i15PMvPlXaGH1KCBLIeCFkT2eBijJEo7sPYKqMbRMxvnHV7aR7IeFvYLNgifZ
         BVZidDLPT2rk3/5SBXo/XPC+rZNu3jGqVivLh7Ar3HTkqiMJtmHDcCA9xyzJXLUgQbp+
         jN1DeZmMyvuQKOH40FM1CFC6J/DNaOtW00bA0QDUkgJdLIUMJx/YNhI3YtF2YL8shnVF
         D2OG8XF/w74r8b0Vc61lIdeEtfAdMMv2BwjcSiTkumm0cu70LohGkbNA1KJCsUMS1lpj
         GZ6mgS8Q8HZk5HaFYhknlNCRqFlOZvNT0svagwFOYnQyp3r2WHHLNlA7qPjd6pT0cEml
         TT0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwd42BmesbPdgNjR0L6e52o9Tb3qH7IhwTzcdJqQ+ZPdwD+ajhHgM9c40KvSed2wGJNI9o0CiF9SBQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nHOGdV6iNK2yI3NYTX0F7MVddM6EhdbZ/0BXBOowsenORQuR99
	WXa4/zpCx3zX4+WTvKxxQ6VXvAbS/NYLCN9OoN4WPIDo56NIC1pjiruY
X-Gm-Gg: AYBFou1VrVZF9A9SuwmjYwzBAU5sXcdE+hIZPBuAWMeyK11x957khsuVhTQ7+UqU99r
	r5OI/47YqiRvq0i2xkRQ5UEK74sa0KD6P/MxDjIXAKYbLr2aFbJOPBuJW5fhaWvM8gBcVnj+d71
	uy0b449r7l/zI37IQS35neGjWNWl9fz2ptyMd0jVn7KN22T435OAzStZMRefyonZlDre2IetXT2
	5ibRZIPZXVfGcSjQJHvAo+Wms8IIQ2fZa0+Pfg2Vfa+2+bhfqyS2JcaDWmzYKdggUHuDViSxoWV
	DoZvtH7i8cap+7P+CizxLECt6XAKfcTQhZZxqOWb9ZSMNBocjMQCtf6s3DtntA3uOnR7PTFND5l
	WgH8OUmf8Q+RnGWdnucOKH30vv6h9FB0wyi8XksoHLxBH2Fwy7gpLj5jv/Yb89GBc+tQJbVeib/
	anknNnJHLLOWGyZOKJzsrBgb2WnmCVH4d2N8bK7RRhGgSnQCyR+iULka/7paL5/GrMrPvtdNFD6
	TQSLYSlYxjTxtI3bJNFSR6CB0ctVIJ7bRnCrlOkHnEBUg==
X-Received: by 2002:a05:6808:c167:b0:4c5:90f1:b9cb with SMTP id 5614622812f47-4ccf74b09a0mr10949649b6e.16.1790021114836;
        Mon, 21 Sep 2026 13:05:14 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d423604f7fsm1137266b6e.7.2026.09.21.13.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:05:14 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Mon, 21 Sep 2026 16:05:12 -0400
Message-ID: <20260921200512.3179109-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech> <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

I tested the exact v4 series on a Radxa Cubie A7S. I used v7.3-rc1,
applied the four-patch A523 single-divider prerequisite, this eight-patch
series, and Andre's current seven-patch A733 pinctrl series. The test DT is
a minimal Cubie A7S harness with the main and R CCUs, RTC, pinctrl, UART0,
and MMC0. The Image, DTB, and initramfs were loaded into RAM from U-Boot.

The exact posted stack starts all eight CPUs, probes the RTC and the A733
pinctrl driver, and binds UART0. Serial output then stops immediately after
the 8250 driver replaces the boot console:

  sun60i-a733-pinctrl 2000000.pinctrl: initialized sunXi PIO driver
  printk: console [ttyS0] disabled
  2500000.serial: ttyS0 MMIO32:0x0000000002500000 ... is a 16550A
  printk: console [ttyS0] enabled
  printk: legacy bootconsole [uart8250] disabled

It never reaches the initramfs `/bin/sh` readiness line. There is no panic or
oops in the captured output.

As a private comparator, I changed only `ahb_cpus_clk` at 0x5c0 bit 28 to
`CLK_IS_CRITICAL`. That advances the same build to:

  clk: Disabling unused clocks

but serial output stops there and PID 1 is still not reached. I also added
private begin/done tracing around each individual enabled clock in
`clk_disable_unused_subtree()`. Neither trace marker appears, so the second
loss occurs before the first individual unused-clock disable is attempted.

Each run used the same RAM-only payload and was followed by an
identity-checked 120-second power recovery. The board returned to its exact
vendor kernel and eMMC root after all three runs.

So I cannot add a Tested-by for v4 as posted. The `ahb-cpus` gate appears to
be one issue, but marking it critical is not sufficient on this board. Could
you please check the CPUS/AHB dependency and the path entered immediately
after `clk: Disabling unused clocks`? I can retest a focused change or v5 on
the Cubie A7S.

Assisted-by: Codex:gpt-5
I reviewed this report and take responsibility for its contents.

Regards,
Enzo
