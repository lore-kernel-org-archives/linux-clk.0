Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACE1211495;
	Wed, 22 Jan 2025 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737545247; cv=none; b=uH9cQP0gbN+o1G/49k7aDuNW+O4gIY1oNxAP9hkInjh8/g4zKpOlIxWG2P7DIw3QJ3IXKBM9toqnL8oeIDN8WjFVGER/XJXYoMRU14z0MBiNWIVf20SwZ4A9kxNB93cQCejOjrP6rNnXnw0PKBclgu+J9y0eq4cVS3tLtSWNgYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737545247; c=relaxed/simple;
	bh=98CdIkuCUy2iuas6P2522HXat0LpAQ2j0j3P9jNI3x8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLzt8J/iDvpiMQJ5kEK3iYcKv57kpmfphrc7ftWCY0t9HaC70TUxlWJMbwAN/6o06dWXFm2ko3IZz4t40Jyk84ZLbC+hUOkr6/aYfTtnZ10i+MpbTDih49a069yEYIFwsyKlZxkY19ZBZgH5GY0/KvbNiVatyqYRnhcDm4UsVlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=O7mh6dk+; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="O7mh6dk+"
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 76257120009;
	Wed, 22 Jan 2025 14:27:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 76257120009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1737545225;
	bh=5Bj6SlnqGUNk+5S9i5pvyH6aDELpYCxdwMZsHtSo9SQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=O7mh6dk+o8cs2UgkOsSDEdMYYrUx6icHmvuQxefocfBRv+M8stAXADwisxpRW782s
	 K2lUVF2rRLMENOg+23trHvf3XEeRLS/fElbF4qf3zEvaMPcKhL4hOZ8iizJrwojHgz
	 SwobHj35QqNOzZ09J2zSEZr0rM5lfhLTxEkjLXaxp9fHGMEVi1jAA9ot4YVobcYkW1
	 SrgUvKiruF9EpZaXAVjT8qBNk7TZ/ZRUHGzf2Z1/n1Cx0ju7bloht6SlB0hY8ArYdp
	 qtYuQNipX0YM23wT3PNqmoyHqLOWPQQd1So29/zeveUEGsjF+wLLSieYqJM34hL2ZZ
	 fzrIgQM65/+sg==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 22 Jan 2025 14:27:05 +0300 (MSK)
Date: Wed, 22 Jan 2025 14:27:03 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/4] clk: amlogic: drop clk_regmap tables
Message-ID: <pvklak6rusprrnj2pd64ada42oi43uty7xi7iaaoqu2sqdpyko@noy36ilokhwf>
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
 <20250120-amlogic-clk-drop-clk-regmap-tables-v3-3-126244146947@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-3-126244146947@baylibre.com>
User-Agent: NeoMutt/20241212
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190499 [Jan 22 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/01/22 10:19:00 #27099507
X-KSMG-AntiVirus-Status: Clean, skipped

On Mon, Jan 20, 2025 at 06:15:32PM +0100, Jerome Brunet wrote:
> Remove the clk_regmap tables that are used to keep track which clock
> need to be initialised before being registered. The initialisation is now
> done by the .init() operation of clk_regmap.
> 
> This rework saves a bit memory and makes maintenance a bit easier.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

For the A1 and AXG:
Tested-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

> ---
>  drivers/clk/meson/a1-peripherals.c | 163 +-------------
>  drivers/clk/meson/a1-pll.c         |  16 +-
>  drivers/clk/meson/axg-aoclk.c      |  22 --
>  drivers/clk/meson/axg-audio.c      | 433 -------------------------------------
>  drivers/clk/meson/axg.c            | 131 -----------
>  drivers/clk/meson/c3-peripherals.c | 210 +-----------------
>  drivers/clk/meson/c3-pll.c         |  32 +--
>  drivers/clk/meson/g12a-aoclk.c     |  34 ---
>  drivers/clk/meson/g12a.c           | 261 ----------------------
>  drivers/clk/meson/gxbb-aoclk.c     |  19 --
>  drivers/clk/meson/gxbb.c           | 393 ---------------------------------
>  drivers/clk/meson/meson-aoclk.c    |   5 +-
>  drivers/clk/meson/meson-aoclk.h    |   2 -
>  drivers/clk/meson/meson-eeclk.c    |   4 -
>  drivers/clk/meson/meson-eeclk.h    |   2 -
>  drivers/clk/meson/meson8-ddr.c     |   9 -
>  drivers/clk/meson/meson8b.c        | 200 -----------------
>  drivers/clk/meson/s4-peripherals.c | 229 --------------------
>  drivers/clk/meson/s4-pll.c         |  31 ---
>  19 files changed, 5 insertions(+), 2191 deletions(-)
> 

[...]
-- 
Thank you,
Dmitry
