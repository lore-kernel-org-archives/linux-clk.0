Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413BD35F607
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 05:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782884931; cv=none; b=aEhoh67yvwqHelbiv3RqEHzzG9/BVEgm5N7aB25jWjHpHqeZRe1KZDQKI6f+R4oDo18WZqideBvP2rKJGyaAUBWA6DrBGfe3uOwvKMlxLEwvmI5RenHhRz3OjSZY2LaOWSS+FmuzDoA/iVaXFkovyQsx2CdBpWXOSkQtPiDq6MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782884931; c=relaxed/simple;
	bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qC+KyMiFcKXvSbdQgAcKWVc5pnM6kTNEogw2Bkvc1toMR9UnGXD4saXng/F+4LUom93tqtqdkUVUIBJ70hcbguHf7i5qkitT9qEag0MLneXIg11RYjnLoSXOmqthnGZhxNB7tGESV1Lvww9sEQ2WuvKZnTWSJx1XO9oVYyuu1wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGfH/kus; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGfH/kus"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664d35b4777so293306d50.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 22:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782884929; x=1783489729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
        b=MGfH/kusValSWGS2sOYAUZg7P2dHCrIE4+i5MC+fqg0jRrtpayUdRNqekt0iVYMoUv
         f3SE3ZHg9KjuonVL+acd0t07/FmT1zSLkU28Mb+JFeG+gaeQra0JznX5H2JLE2U2qpjr
         A5Vy36pHzkLEysoPJ9MappCC0ubyOi2O0i0EMl2Cj5J7WgDf45BXYKYQYApIUPXJszGk
         PlpD/FiQC8JXY/iJxEdNtB2olgYQiMNQJnphywgllciBr3nt9yu3FyVuOHxbwlqDKN0k
         Qp7us9xk2ykcWKDGqBzQ+peVBDPacwLxILS9aNpuBzVQxdZqqHLEL88ZjteYAeELTLEl
         aFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782884929; x=1783489729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
        b=AuxPKhnbnOjGANZdkvU0fkKFzGOtA3uWebAJF9hujn+AiEzcZTEn6QgUlrhX532P5O
         5R9MFfoJgmwLCBMzbab6ximiSeITBt02/JFS/e0C5I0ucEC9xx4Nho51TV6+9md+29Ph
         Itf4tLadj8zilcB8UOYb5ENYxPBxwDt81ctWgeZADmEdQu/XG1A1g178RNwpu5XuSpxb
         F0IIKzozslaLsf7tM2Xq+OM1mrNYCoVExw9FhqcmlsMXsPP3lD1YU+ENDxBCY41mODBM
         RBNPiShNZM+R7kwIZn9DQr+Jzpl7M2tyDlq+kNEKfvRRoNyHsWXfqQUzR/S9oQcuj8Aq
         tbrA==
X-Forwarded-Encrypted: i=1; AHgh+RoVqWaJs26LY7XdoJs9bi6VTqQsu6QhqIK1NALLW/FQi0SlmNt5EicIYrjTsSoh0VLIEGbpcLNg3vE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtftkFXwIHuNk+O5bMs5Q8HZfKE31Gyd5ZyXkMg51DlB5qL/29
	+AWTOw8KFVbpsvczHs59Kv33qY1hHwmHqYkZ3Z3wbEXc6OV+xL55bD8w
X-Gm-Gg: AfdE7ckizGn5I8egTNza3MVZEXlZU7OyoRvav/y4OS1yRixoofOMIxRNBYguyzrXaXj
	rzdtcWMJE180iEE2weB19anj+a+sfkRCOLlB7RvvPYFQf5bOq+PlQy/MUA2LrgJC83sS13HuGVp
	73cUkolLqhBmPcOD9qI9MGYCS8gZNS6PvuuH83TEZv7N7xrBC3G2YVv3sp8JCDhxyE+Yobp+sv+
	NITCmwWGDMZvzzwY0ZM0EIHuA8fuNXBx+Yg3jPNx+miAzA6t/h91l9hNcO+9KcU9lOzBBgb+vvm
	WBLKArF3rpmzFmtYG10n92ohPYy96vDaS7G9EDIsDxuaqT6/XnQbnJ9n4h+z1r8gd7jcGyiuY4b
	zfRZ33qzQfx1NWkmrZXagDM4SKNAMfAjSl0RlstKLnrtwa8Ky+WdoOXv2CzTPYiVqf2Az/CgpqE
	27YnuHU4nnyevaDrJZtIY3lseBZlFRdUM5b8rL0TITMpJ7yhGtWJskDKq+Uhw+
X-Received: by 2002:a05:690e:150f:b0:664:c7b0:f655 with SMTP id 956f58d0204a3-66521ae384fmr205145d50.53.1782884929334;
        Tue, 30 Jun 2026 22:48:49 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-665000c8152sm1920856d50.0.2026.06.30.22.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:48:48 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/6] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Wed,  1 Jul 2026 01:47:44 -0400
Message-ID: <20260701054744.3962458-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jerome,

Thanks for reworking the A733 RTC support.

I ran v2 on a Radxa Cubie A7S. This is local validation evidence
only, not a hardware Tested-by.

For the A7S integration test, I stacked the series with the currently
visible public A733 CCU/PRCM v1 and pinctrl v1 prerequisites. Focused
RTC binding validation, targeted RTC/clk builds, and a Cubie A7S DTB
build all pass, and focused CHECK_DTBS=y shows no RTC, main CCU, or
R-CCU findings. The remaining findings in that base are unrelated
A733-wide schema gaps.

On A7S hardware the artifact boots cleanly to shell and the RTC driver
probes and registers as rtc0. While the board stays powered, RTC read,
write, and a short readback all work correctly; the readback advances
as expected.

I am deliberately not adding a Tested-by. The RTC value does not
survive a full power removal on this board: the published Cubie A7S
V1.10 schematic exposes the PMIC BKUPBAT pin but does not show a
connected backup battery or supercap path, and Radxa's A7S
documentation describes no populated RTC backup battery interface. So
I can confirm the driver is runtime-functional while powered, but I
cannot honestly attest cold-power persistence on this board.

Happy to rerun only the persistence phase if a valid VRTC/BKUPBAT
backup supply is identified or fitted.
