Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699967;
	b=IA5l9BRSeKcZiQzN8v10pSfIkFQhm9n4LzONPtppzooEF2DPOS58SPyg/c4flDFEyaVW
	 tqwjVnEp/FZvQOgY+WzPkuX3nDrbdLfrbcgklXXRwgBwLMFfTjJ4jTjQU9gMMtTUyvLtX
	 KpRXmDH7K4nRUKCaBPkZ10M3lNPQK4qNFOCz12912VMGA8fE9yxUOSif9vvYrcPeMKXzV
	 HmMZoumDz+IaiJx0esXBtzTWyXQ6ICutWac5xkN+Tll86SNC5N1Vw1wpJH4r9j1QKPvXw
	 4ZNC5pKO0x1TxqJEnmHseyYcm+iKdXFQ0+sZVBll4ZQkm+vbzLVzFgK/MHtGRy9pjBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=FNZQ0gtxT4Wys8jIUcbHf10HyijtjKU9qxZIf3oS0F0=;
	b=x+8e8mEk1Z9QAMUTT24Paf4y6hvL1HsOeaErR3yai5mdyw9Hu7e3mWoferDNF5LgjJQj
	 LV3mCIdfAT3PM1lPoBGkPI+0fW7TtTxpFtDMn196AjRYA5jtxTMoMt/29FiBOSQmpAGAz
	 nzkXv65e083+iwmqkVVOuJIMMNTaxdTcRKOoyQc0TgXrUyZ+/hth+aHkWRfbaMBJ8mWX0
	 EWv+Asf0Flq1w821ampHJrKrjAnpDXRsi8n3oknzmetsuCioGY66oxJ9MbRhd7qXY2Cqu
	 5b0q6fqGcI3HNFTD3J2irmO1Bp6SX4YxDcmeJwxMTaMU2BUl9F0OQGnUQo+zlCjyskw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VRdAk0MA;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFD9606A320
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 20:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CFD9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VRdAk0MA
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b0584ad71so134856f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 13:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699965; x=1793304765; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FNZQ0gtxT4Wys8jIUcbHf10HyijtjKU9qxZIf3oS0F0=;
        b=VRdAk0MANZPq8ltcZ5YX7+7Qyg1eGhnM2ItCJw/JVKqn4TkKzH8VmQcIEI4Wdw/de6
         rPKRHQZ0Ee78+LV6PNtRndOf0sIyhuTEB9h1LMUyiN8BgUWIC6Uxtp+tRUv/hnMRLnr3
         fRqe6OnzSs4bVBwTHkwcrU7cck1QE2fF+UPXFqpbS2egzVMpKOgTYCEhZ69drXTt8Wpl
         8r51lgg+dxaaLKFF1zph6wEzbmHXUMLaBrKgfrBFc4qcGSc/3wwlgqMgmYUOKMvm+0BV
         AQ1aFQ0vqY87Czn9DXRSCvIVIVBxBboDpzUsJf/jyIYi3MH68UZ0tBwj8+JSqug3a+X8
         pBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699965; x=1793304765;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FNZQ0gtxT4Wys8jIUcbHf10HyijtjKU9qxZIf3oS0F0=;
        b=TaKBotUCL8JLpUyMxfqU3CCDdLl+pZUpVEPybihLJweYwkDD2Z6ui1kYPsizVZuAky
         iWpwA+LRtYbUDfBSUP6Y0yttbUNgKq2nKAUt10WuZBbNZL3rFf/48OnWVgxzibgXdhVr
         Q4JHZ/iT1O3bappS9Som7kVM1OWrPb0JQTPlccJEK2J/D7lFd6j2gfW7xakV148Tmr1i
         /N1qHTlUXuxBdZoovrtceNiY3s7SiZbOP97jmJukUPfcBFteNPcEeypgJiBlv+qsUOIo
         7CaKK7L5t33+gT8wB0sxoL4wHGFL3b6QY16rK4YkJ/w+5h67hnfWEmTMMb2n9sMcfEIE
         nL3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwF6wQLWECzf1pVNphHpiE9L61Veg3A/17CEuEeulCL3Q9H8nTA7ZJcUjvVoPQ5j3RZ7FXDRCcSmLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzv1jiLTRVJ0rf6TzbTxt1VZsdLuMv1NmeqzMsLqMfAbO94p7C
	j229KJxuNOFnb6nfg2wZicz18Px+Cm6y3gwWMYI3fQUPL2gt/gkDOdm2OAp/mJaw9idtBavWgtX
	s9lhu
X-Gm-Gg: AYBFou1IMNhlrgZkERxLX256I3dh71sVW13xKb+MIvJ8lZ7xH9/U/jTuNnrNviHdx8D
	9tNVOMi3PRfweFuW2JoTDxEPwgTdfWWyBxbDXnI0DjZPR9Jyyzs3fYWG+bF4+MZLuRD6FGgu4uP
	mW3TaeJcPil2Os6Y3UMg1C3L2z+b2Jy96nqkULVuU4pPIb7JjcVzm4PjY7IvumYjDsgnR1ZILEJ
	OqroM3urHRVDvL1N7BXJELpx1RvjUia6UG7jCI3uDq7H6qB3qeS1KJU7hwsDbNCUAqaQiH/HOMF
	L5y2exPAh6gXFOQNcRQN5QJ+BSZyQ9sgaodioOt158CHyvfsZ2Pz4xybrQYBIuevYMc7pWWfTd1
	7oSiR12zC+0yuXfEY2q7lW/pHdwiF1ny9trLH16VE/YEsbq/zFBMBbWEwM/Ivqk0UtOyPcj2pcu
	1U+weUI8BRrEYsL0pyaSRqjf4BF0h4aBqN6ivChx/762kf8cs3GhfzN1Zbe+IQHunM037nDboWL
	T9z/wlJeSX4MRvk3dH8pI1FnsGul7X4tbw9Rb+RamnKC9GyPVPjWi6ykWD3wurdh1FuUd9PmsWw
	fsXRYfTIO9F+HjRLVIWn2/ktKjyCicgKJjBVtVI5jQ==
X-Received: by 2002:a05:6000:4007:b0:48e:870:778f with SMTP id ffacd0b85a97d-48e2649d848mr12345891f8f.16.1792699964688;
        Thu, 22 Oct 2026 13:12:44 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:44 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/3] Fix the ENCP clock select field on GXBB, G12A and S4
Date: Thu, 22 Oct 2026 22:10:31 +0200
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBAF0KuUWTvQRrDiVcRFOv2xozWGTCpC6
 d2Nunybt5IhK4xOzUoZLzV9xopu15BMPl7BOlaTa92ha53jJVnJ8A+W+c6Iktgws00aCocRvZf
 9cBT0VIeUEfT928+Xv20ZbpDyLWnbPqBM2Q5/AAAA
X-Change-ID: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The GXBB, G12A and S4 clock drivers describe the ENCP clock select with
the field of the ENCT one, VID_CLK_DIV[23:20], instead of [27:24]. Fix
it in the three drivers.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (3):
      clk: meson: gxbb: fix ENCP clock selection
      clk: meson: g12a: fix ENCP clock selection
      clk: meson: s4: fix ENCP clock selection

 drivers/clk/meson/g12a.c           | 2 +-
 drivers/clk/meson/gxbb.c           | 2 +-
 drivers/clk/meson/s4-peripherals.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

