Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE531426C
	for <linux-clk@vger.kernel.org>; Fri, 22 Dec 2023 10:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0ffGAluF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3367632ce7bso1380295f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 22 Dec 2023 02:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1703242110; x=1703846910; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+GWXCTtjSNNR9oPq2iw0nf47LFIhwakJPmZPJ2MyFfU=;
        b=0ffGAluFaWLABIeX+rnNQuZhorZHkEJBOBvQbSUUpY/mj7LsJxqXDNfLoAKNniED4s
         VyRvSOcpVRlanfl48guWcmeHnYFmJb6+qHw3X7GK+i314cUy/W6WKfh9HiUrZf/AY21A
         Vv9mdL/9UPaGePtUaSjoFtwQ3J7Pp6HtU7fUibw1mGJbCj/u6Ikjk6NxcnPgpJ+uZY4B
         voQHcXP5fotcFxMvUyO9OZ4Xp9t2AuuJj2kEFtiCMkxc9sHp7Q/+XBvMSNXL2eVpiYJD
         O6McIOP7ZwjHAcotNhBamEGJj+ccqOpO/Dv4sH5MtHXsD4KZ/pyPIBEUpz85O5nTWmW9
         0m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703242110; x=1703846910;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GWXCTtjSNNR9oPq2iw0nf47LFIhwakJPmZPJ2MyFfU=;
        b=WxMOGwFZEBTGJNyKa6g5fXNvw1TDwbvNlslz/W8Z2Er3rCis6+T1fvS3Ou0RKjq96n
         LMX1AyO0DkcjX6KmVSw6FX54vH5D5r81Z05EHU+XfKE9VBdGOObVB/mnTQLX4+bXv77L
         GzdXyUCLzsIG4gf+a/N2+z8XyLkFK3uOHjwxAW9vQsqLMrywCPXjTjc9uSdl9+npOsba
         sHzhUPjkWfzxRn625s83TCDU484zHOwS7FjW3TYYORi/HcC+0dURYMenqc9+1tb5SkH5
         VZ7Z3PSeX7E0i7mv5KjwR53TNR+KIZ53LRpxC9627XHFY9v460Cnhn9aywExP7nM+krr
         xMmQ==
X-Gm-Message-State: AOJu0Yx+ZlZFU1c+HkX+lBpZS4vB7IoM3txMcnfjzi/fb8Stc5fq8aZo
	ycod6GttcY4krFFdYAW8lgQPxauKhh8MJ2P8XBjpYQf/33k=
X-Google-Smtp-Source: AGHT+IGpgKGlsu3/wK0e2gT8HUtM9465RlPHpE7S5sqn7igaY/OJ9/MGNXGVgdBk1vdggoRNKVwkTQ==
X-Received: by 2002:a5d:40cb:0:b0:336:7655:c63f with SMTP id b11-20020a5d40cb000000b003367655c63fmr581406wrq.47.1703242109957;
        Fri, 22 Dec 2023 02:48:29 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:c099:e596:3179:b0fa])
        by smtp.gmail.com with ESMTPSA id h16-20020a056000001000b003365c83273csm3992142wrx.16.2023.12.22.02.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 02:48:29 -0800 (PST)
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: amlogic clock updates for v6.8
Date: Fri, 22 Dec 2023 11:41:11 +0100
Message-ID: <1jzfy28qdf.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Stephen,

Here are the amlogic clock updates for v6.8.
It adds few new clocks on the g12 SoC family, for DSI, CSI and the ISP.

Cheers
Jerome

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.8-1

for you to fetch changes up to 5205628ab0bfe64952974d476ee001f6c7e0ef7f:

  clk: meson: g12a: add CSI & ISP gates clocks (2023-11-24 18:08:48 +0100)

----------------------------------------------------------------
Amlogic clock updates for v6.8

* Add DSI clocks on g12/sm1
* Add CSI and ISP clocks on g12/sm1

----------------------------------------------------------------
Jerome Brunet (1):
      Merge branch 'v6.8/dt-bindings' into v6.8/drivers

Neil Armstrong (5):
      dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
      clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
      dt-bindings: clock: g12a-clkc: add MIPI ISP & CSI PHY clock ids
      clk: meson: g12a: add MIPI ISP clocks
      clk: meson: g12a: add CSI & ISP gates clocks

 drivers/clk/meson/g12a.c              | 115 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |   1 +
 include/dt-bindings/clock/g12a-clkc.h |   8 +++
 3 files changed, 124 insertions(+)

