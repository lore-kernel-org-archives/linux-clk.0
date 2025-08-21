Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA85E242D76
	for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 08:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763434; cv=none; b=FzWuABQMs65z+kLwBaDCxxDTEmvBj0B4B94SwrMHbxG5060NfBBwxyKn4Dye1yWNYs/HQ5M26HjqelO/3fYn3GSZQC8nqEuUBN/Ifj7+jz1yT2w4Gj7/FiNr7eOcK8MsV5lftCIHMTV3IdDyPDLg39DD4ZUf9u7l7lPqYO/3+zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763434; c=relaxed/simple;
	bh=BkUjAzazCdrdco3Umhau/Xuq5nuzBQH/yodQbE/M+BY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xw7B3GbsgLadi20ZlKBtZGG3uJUkVRtsCIa9TwTBTc1kDRaUcRUGFjgAPMvl3ex17oKuxhAim2cUdrcxMWBQJNWxBoKZQbnaYEmXVPFdBdPVAmaAT+/iogEKSSYDStsaJgKqeXv6spZ7zjAF+vbnINnpZkeIjvNXmljEKH6J4YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=f7Qa674Z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="f7Qa674Z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b00f187so3420085e9.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755763430; x=1756368230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPH4Dt9LC8zmN5YywximTfS/LxGtIse3pZkHAnoKBEk=;
        b=f7Qa674ZsqtyHtXxNt1JKOnNJCL3M6IKA3Mh7jiyKjGh/g1E2LhMd9yADGzcn4gmMO
         jI0yPDYpFDitcsRZ2MZXiS8uri6J0qARmJL0DMWOWkwatbWz2aDjTeD4zilKMvt4BpME
         uV8BVqeFdmr9RNYrqT3oHBb7KtWauTCYO9I9uHMzd1gUTmSpqM/jorNVnmyUVJvzyoMb
         SF7gqLqaczPNJ4gGdfLAyDu8TupSQDNlYd9mMPVZH7h1bMHcjyWnwG6cOI3PeXOtXTkz
         alnLLLavwtL6EQGjhj5dSUDbfH6M873mAolfjpMQgcatQ6T1m+oR8S2+dFrBiavamNYy
         i3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763430; x=1756368230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPH4Dt9LC8zmN5YywximTfS/LxGtIse3pZkHAnoKBEk=;
        b=PaigZo0qQEkWx4y5nOM06ZUxyJOEl3HbsywVUG29NwzsUelxXgM+ZGuUYrgs4mPtlL
         AvAJ50xqwwwM4aVDuZ53j+IVwGRA2Xue6DMnPlxU8+V9uQXuPMGYbzmigeefGqlVQMph
         fUesi8lhMgyslel3RrNvWNRrDn3fqb4VXJ2Lazh3Ikv6PviWg4BwqjjWvqYBbNjMZJAF
         u8wugBDjl+/c9zafOsTw319LWQ6LcH2vJSScYOXbwLtFD7c9s6jbjwySBmonkikJgxz2
         oK5wIFWBZOK+ZZeLwLgy3CfXqTuFhl2kP1PqpTFs0uRXfKzBYjmAsVeUfwz+gUM0TCXN
         55lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpUv5msmdPFFcFrpFlI3ucwBBe3gjTYWBp0MSJM1AGPXd9PKUvcSdWbwznzK9EuADZZmce2g6ZIGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMc3RrSKlGA4saLLVtKIuS8igHQrb4dqfk0HGTfi1o0Bq5YwBH
	mZtPF+K9XZAP/Eqd/JZnzK3Jzrqp6O6e5eSBS/Xg2JMBMnbc3pgH/a5mvt7oaQTfS5eTOX13PxE
	ajFzU
X-Gm-Gg: ASbGncuwlpvzRcrkfhW09oWRNYrouM7FXxbFwp0F+mpClAt7b9br3IAXgjMLxWSdL1o
	TlqO/iXar9+n2VC146+EFt0AMMO3qVqQbZ4Gmk0Ck0yaNIg1sbSocjnXfNY5w+kcFGvF/BN/EM8
	TUP/sir6zCKxZpckhobBS4DWq5siabaxPNiG//xH5vrklKEvQVQnpN9paQA6yLVU0O/r+O7QU9U
	VmnlVysz3anIlhxMLH9MGCim2fNi1xA+axbOx+4FCgzd7ngY87Hbs5a/Q2YY6sk07W1AC4FZy+U
	8kRZtOfouqX5+hAZZi/xaqid0+k5J1teAwK40qy2qcy8t8jZJQRtwjgfxH+GUraoqgIF8Onhsmr
	rA3iup3W4eY5Yg0kkVWTThcvnYlqSOI08ZBsA1RpyJAGaCfDv75I=
X-Google-Smtp-Source: AGHT+IHHm8Lchn2zvhRJUg1fgGzuxGz8KFFfOq4sSoyn5I0S9lKsbcJu4rnRhc/hWeaHsuyWmyDFzw==
X-Received: by 2002:a05:600c:3b19:b0:456:496:2100 with SMTP id 5b1f17b1804b1-45b4d84e6f0mr14634375e9.31.1755763430131;
        Thu, 21 Aug 2025 01:03:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4dc155b8sm17356225e9.19.2025.08.21.01.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:03:49 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	geert+renesas@glider.be,
	linux@armlinux.org.uk
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after resume
Date: Thu, 21 Aug 2025 11:03:30 +0300
Message-ID: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series disables clocks that remain unused after resume.
This is necessary when the resume process is done with the help of the
bootloader, as the bootloader enables various clocks when returning from
resume.

On the RZ/G3S SoC (where this series was tested), the bootloader enables
the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
1 is unused) and the clocks for a serial IP (unused by Linux).

Testing was done on the RZ/G3S SMARC Carrier II board.

Thank you,
Claudiu Benea

Claudiu Beznea (2):
  clk: Export clk_disable_unused()
  clk: renesas: rzg2l: Register PM notifier to disable unused clocks

 drivers/clk/clk.c               |  9 +++++----
 drivers/clk/renesas/rzg2l-cpg.c | 24 ++++++++++++++++++++++++
 include/linux/clk.h             | 12 ++++++++++++
 3 files changed, 41 insertions(+), 4 deletions(-)

-- 
2.43.0

