Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FC230205E
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636620; cv=none; b=DMwdTppam4ekcUzHYePxNtr/dqPqbh5cmQ2Ym2qUW3n/rft4la86odP1KaQ7A2iSDJNJWN92KvEekm6hHv5SYU+eXW1ZNGrgbNgWWBA4DrXmCz8xxcd7l/gn6JVkS0Im0+tqlsVr/1bLqhrUrbawQZS40miqtU/BGWtLu+2voWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636620; c=relaxed/simple;
	bh=qTydbvwsipxNicmaEZ+CKER7CcHb2CWmAMgsd8CYofI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qftAz1qGt4oUA/riKSu68n8be6fhacivAk0k3p0cyaXQ+FIeJm0ZaOFxQ7B4yfF9bKX6ahVWp94+zGKTcSu+XZYNZOr175xxmYzStVor4batrm/ZvbNcNyS3LITowOj9OJEedSOgqRtw7/uE2PpGpGaldFr7OV0AVni5wFdu9jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JE4+YTJr; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JE4+YTJr"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo1552161a12.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 06:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751636615; x=1752241415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVHE9lJ0YDRv5jonU7HwVUdVK1j8h+dQL57nzRKWT18=;
        b=JE4+YTJr540uoJUiObsEN2jXNaeXLSKPq8Yv+zDsWB3o5/WxGUGSkitipqYjioAaaF
         Kg4x+VCPa9vhQtvshxs8JXJkPu/iL6hjgp+4a8hhYRfuxKRsssmYpxv6hfqoaItAtYlK
         7q1tp/0+xkYZ5pnsSfP7hpg1JXUP6v9qa6w32Rm54m9ylFr66LAn0ak6q1SHF6/5VjOc
         neUbCKmLeViI+mAX00/oSSt4B5ZjPeUwJ3q4zLoeDeJl0JlVCTJ4ZNYwUvp2KCwgYGA3
         SoTfTL4BlWzX0j5Gut4TDdTVi4FGyi01BLrI8OuGHcv+CHVcsvS+fME83urDYUTHpmp6
         vFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636615; x=1752241415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVHE9lJ0YDRv5jonU7HwVUdVK1j8h+dQL57nzRKWT18=;
        b=XQxCto6jLF+WKjeUPaS4/8P+JUaJ/Ixswe1CYbIRJr/gooe5SlzU1zkFSAxuts3Pjc
         v/+UWDliHWDkV7MoHfSbfEsTFYs9yTvjS0JGbDG8krKomCdZWrS6xph7eDvKfF41l7TZ
         C/JSW9q0TNRSpP8y0AQqcwyLnYeJj8A8yp9Mu+zG6ZybWiXZ0PEqllf0o/XfTddvhZDj
         XfiB4s/uq70GU+CKWklnFon0adIDu1hl7Iwe0JTfG117K9kzfhFF0+WR2g7emMkiwoKF
         tFoGBz/yUDJvzz63UWQ/EzePSXArrXeaZsqMsskUqzJgvMhDMmIoy44rDWoruQvrgSBW
         HvpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmsErLtpXbaseguCpWRSaNNwMaF1On+hD9ookEbqWr3vASzwV6qpsTVImD4o4FGra2+a4ikkdBgdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIvC9a2gIMjG/O8Wc4khchgklIElb+VcNS/zsREC/uBXhQH0uS
	f4JM6tbiJGUWDaSSiEsRktSr0/A8ECKqNfHANaggnHUX7qK487n/KB/+ddFZPjlxdgI4JZDSoEt
	CuHbN
X-Gm-Gg: ASbGnctJEJ1yCVR7nirzPivfPjSsIncZIz8jsMtj7gQl74eetgCQLkDyREqXs+Eamao
	OjyIDvUTh6CAH7tJDVpFE1BZwlezq4Lhhjq7DqBM//GqQZD5XlVCEqJr8tvhhcsh/1g1dpKVT0Z
	TLf2vlCn/cU3g7MvhrSRVTahaOHNUnKIfpmrvKPigU/yZcObfkf3cMpPWmip9DDF4S7OgobgKOH
	fKKnZIbftAA/kwZeDpTb7MAnAWzZh7Iq8ECVRtJUaX/e3EWSKlILv22TSP5bk1T6TXjX8F+IKIn
	jy7YsBazizmllDp/d8s8aYH31Si1ixJA5QoF5RDVF2vMhfQ/vFiTl6zOH7ZQH0BAYaefyJ0rquv
	UJy0XxsCosO2y3iNQ79gLv+Wu3w==
X-Google-Smtp-Source: AGHT+IFGPw3v50tj/GPM1uEZkj/0eYHeSowBVbc3cQ6zDPa98ZgFCGKQvA42xxJtIW7UpUVkFtB5/w==
X-Received: by 2002:a05:6402:5191:b0:60b:9f77:e514 with SMTP id 4fb4d7f45d1cf-60fd6510ce0mr1836018a12.10.1751636615396;
        Fri, 04 Jul 2025 06:43:35 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fd3895ac7sm1084916a12.30.2025.07.04.06.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:43:34 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/3] clk: renesas: Add MSTOP support for RZ/G2{L, LC, UL}, RZ/V2L, RZ/Five
Date: Fri,  4 Jul 2025 16:43:25 +0300
Message-ID: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
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

Series adds MSTOP support for the RZ/G2{L, LC, UL}, RZ/V2L, RZ/Five
SoCs.

Along with it, a fix for RZ/G3S MSTOP was included.

Thank you,
Claudiu Beznea

Claudiu Beznea (3):
  clk: renesas: r9a08g045-cpg: Add MSTOP for coupled clocks as well
  clk: renesas: r9a07g044-cpg: Add MSTOP for RZ/G2L
  clk: renesas: r9a07g043-cpg: Add MSTOP for RZ/G2UL

 drivers/clk/renesas/r9a07g043-cpg.c | 130 ++++++++++++------------
 drivers/clk/renesas/r9a07g044-cpg.c | 152 ++++++++++++++--------------
 drivers/clk/renesas/r9a08g045-cpg.c |   6 +-
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 4 files changed, 146 insertions(+), 143 deletions(-)

-- 
2.43.0

