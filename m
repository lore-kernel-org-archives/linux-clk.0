Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC4D37AA95
	for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097931; cv=none; b=Igk1N9rymmhwV6722Gh+fQTQqJNT3Jd+TmAHv0aQpbizqamE8aFpTYbbgWvUWksjP5g+Glw/KHJMAA6hEbK6/HJcH7tsNdP5vxoyXbqOTl4Q6gDorqbVzi62LEPlBbJaYTi9tTbV+ozO46H71FWNaQpTNVXhXA5u8bC1eGJtT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097931; c=relaxed/simple;
	bh=eZ7GtOnPnUjwFAMKpgZVqTk2gRTNJ6uuZdDIiOCCHzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jEYmNbVPYHGNPeMkdDS0CFti/CAA/R8Bnkp/ORiCbuHA7y1sqOSVdj21Ma7qd1cZ8tSKwjL1NsHurndybKihUgEUDPEETJEv+C7BGa5bqQgeEWhNbjXY3qcaDGGwWmpDS98XwEjI+SN+I2CcH74OG1LruslKlWa3YqozIOSkEzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QVckfxsw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z6ynEQvD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QVckfxsw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z6ynEQvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769097922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=8NmUi+JCIHLnFNZPL3W+AznGM/aqprY8hMKt/Ws5doM=;
	b=QVckfxswxYdP60sOoBSubz5s30RBJdmYz42VXZq5R8VjmhRMg4lPYgeq0vLFEIJ9ZIMiLS
	yLTzKyUuA5fdZWAafwl/rAFb7Ocxov7GDuKZvSaE3OGfQHsGUvyCEYyJW2oH3wP3QhnATC
	fT8CAfMX5Pdzgt8AFILfy6iOiKMBAZo=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-Ap7wrL27P4mfqVse0-MV4w-1; Thu, 22 Jan 2026 11:05:21 -0500
X-MC-Unique: Ap7wrL27P4mfqVse0-MV4w-1
X-Mimecast-MFC-AGG-ID: Ap7wrL27P4mfqVse0-MV4w_1769097920
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f536124e01so1914725137.2
        for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 08:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769097920; x=1769702720; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8NmUi+JCIHLnFNZPL3W+AznGM/aqprY8hMKt/Ws5doM=;
        b=Z6ynEQvDFgSegzQzEV9uexolOM8WA9xMz+JGJJ82RbkVK45uk6Z/s8jCFjyx6zp2Tl
         9ZoihutMqQvUmGODR8uCRnFA2haMMIdFtK3lHZ04pdI8/FOg5d3e6AWBeUEss7nzFcse
         BgCXv5IWMuSC90uMaX/F9x+c33Qnh4nc3VbGqfloacyS/6mqIjkHlhbjYuAjqYrypZbp
         A3R+Jmr4Qb0NsXKLFs0tylnQ3SLGVVVFYtBPdET3CSQHl1Yy6MdWHsFV7RwXCRx3bHk+
         PxqmcYEwo9zRNiMPLehaKHMU7mO0ZM53cBYKJuybZjLffTnrhgd6/xnnfdv17+p3eTU/
         z9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097920; x=1769702720;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NmUi+JCIHLnFNZPL3W+AznGM/aqprY8hMKt/Ws5doM=;
        b=YBbTXheoqhkWF082UWrx/JoBFL6RwzO9OQGeiZhdmWYBI1d+xAflvm94ceo8XGOyuw
         oo7ep/Xd3zoBRv2+kxedwncKE3L8TARX+rKZFW0mjLdy1Ke9WzotAfwrdUpUTCOO5MY+
         lVRHFwOYvGyoQoiGvTn0yoW71jo93l11gv/ZJXQ93XLd5lsMnexo9XUEpDwUmeveXD76
         bXCblVjVyKu5+BnthOdF9w0q1LLsd97hZswfCLhs5X0iRpG7bCUe+uexwEn+ps1400O0
         B2ThLwM1EU21TJROb2MUf9TANG1rli4CV25yvpNrGDcyWej9KzVqeugQIdy8npuJEX7u
         GXdw==
X-Gm-Message-State: AOJu0Yxk6z3V2xB0aYY/Em4yNeISSfWp1vEafHLdLP2Rk5vIWZtoXie+
	fRs5NKBGauyqksSspl45GMpDxtl3KZu+iuIOslTdTBUaftcqsb1++yyTb2LWMVAQH4eeFjHZLRX
	BSllGfVM3DOLOKTNCTlqeiLddhr3BmfAbTQOUqtDSNc+wIuPdYtMd/Msx8/0dAg==
X-Gm-Gg: AZuq6aKlAE46n2R6P+aEp+SqqFkuSptFxnkD13zuahvtLTS627M/d/DApHj+E+6GJi2
	upkvrc2kmWlVK5++EyOybWNblzUR2YxoWAg6Qyf50Idc88TpjXn2QmpBJHIpHVmzi2zPlqbrPAi
	Kn8JcWcGb5wDYLBAE5wM6T/lm1klssvacq4KjJXToaNAo0s8x+ZsE997Xk+bEMDM2+GgSioro46
	HuzdkDC3v30/Pgq87AQBaFrwaPvwy7OYYe6LWs2ygZfaXlcIcUSAK/n5qz2HBHLpeaAjIO3Ob2m
	JG+nO05/5zLb057GEBX2i1BbqpzV+eVnUxNeB6MAim3eDsNSoQQggQ5mLSGJq6UNFRN09Vqbx7e
	cvquaU3/3rtb3fw/b5vv0kbv21UB07jtyCy2KjjQPYvxi
X-Received: by 2002:a05:6102:2ac4:b0:5ef:a164:ebed with SMTP id ada2fe7eead31-5f54bd36d33mr49648137.43.1769097919967;
        Thu, 22 Jan 2026 08:05:19 -0800 (PST)
X-Received: by 2002:a05:6102:2ac4:b0:5ef:a164:ebed with SMTP id ada2fe7eead31-5f54bd36d33mr49576137.43.1769097919200;
        Thu, 22 Jan 2026 08:05:19 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6c9defsm157919766d6.48.2026.01.22.08.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 08:05:18 -0800 (PST)
Date: Thu, 22 Jan 2026 11:05:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [GIT PULL v2] clk: remove deprecated API divider_round_rate() and
 friends for v6.20
Message-ID: <aXJKvOJVrBIeCiny@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Stephen,

Here's a PULL for this large series that continues the work to remove
some deprecated round_rate APIs. I used the following b4 commands to
collect up this series:

    b4 am --cherry-pick 1-2,4-13,17-23 \
        20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com
    b4 am 20260122-rtc-ac100-divider-round-rate-v2-1-044f8b493c35@redhat.com

I skipped the patches that have already been picked up by others. The
two patches that actually remove the deprecated functions from drivers/clk/
will need to go in during the next dev cycle.

The only change since the v1 PULL is to drivers/rtc/rtc-ac100.c:
- Fix two cases of brace inbalances around if/else
- Picked up an Acked-by from Alexandre

Details are in the signed tag.

Thanks!


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/masneyb/linux tags/clk-divider-round-rate-v6.20-v2

for you to fetch changes up to ed806240b8975f951c88ccb4bb75813f5fb949df:

  rtc: ac100: convert from divider_round_rate() to divider_determine_rate() (2026-01-22 10:49:10 -0500)

----------------------------------------------------------------
clk: remove deprecated API divider_round_rate() and friends for v6.20

Here's a series that lays the groundwork to rid of the deprecated APIs
divider_round_rate(), divider_round_rate_parent(), and
divider_ro_round_rate_parent() since these functions are just wrappers
for the determine_rate variant.

We need to wait for some other changes to land in Linus's tree via the
phy tree before we can actually remove these functions. We should be
able to do that during the next development cycle.

Note that when I converted some of these drivers from round_rate to
determine_rate, this was mistakenly converted to the following in some
cases:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value. So this series fixes those bugs and removes
the deprecated APIs all in one go.

Note that this also contains a clk-specific change to
drivers/rtc/rtc-ac100.c, and that patch carrys an Acked-by from
Alexandre.

----------------------------------------------------------------
Brian Masney (20):
      clk: sophgo: cv18xx-ip: convert from divider_round_rate() to divider_determine_rate()
      clk: sunxi-ng: convert from divider_round_rate_parent() to divider_determine_rate()
      clk: actions: owl-composite: convert from owl_divider_helper_round_rate() to divider_determine_rate()
      clk: actions: owl-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: bm1880: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: bm1880: convert from divider_round_rate() to divider_determine_rate()
      clk: hisilicon: clkdivider-hi6220: convert from divider_round_rate() to divider_determine_rate()
      clk: loongson1: convert from divider_round_rate() to divider_determine_rate()
      clk: milbeaut: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: milbeaut: convert from divider_round_rate() to divider_determine_rate()
      clk: nuvoton: ma35d1-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: nxp: lpc32xx: convert from divider_round_rate() to divider_determine_rate()
      clk: sophgo: sg2042-clkgen: convert from divider_round_rate() to divider_determine_rate()
      clk: sprd: div: convert from divider_round_rate() to divider_determine_rate()
      clk: stm32: stm32-core: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: stm32: stm32-core: convert from divider_round_rate_parent() to divider_determine_rate()
      clk: versaclock3: convert from divider_round_rate() to divider_determine_rate()
      clk: x86: cgu: convert from divider_round_rate() to divider_determine_rate()
      clk: zynqmp: divider: convert from divider_round_rate() to divider_determine_rate()
      rtc: ac100: convert from divider_round_rate() to divider_determine_rate()

 drivers/clk/actions/owl-composite.c       |  11 +--
 drivers/clk/actions/owl-divider.c         |  17 +---
 drivers/clk/actions/owl-divider.h         |   5 -
 drivers/clk/clk-bm1880.c                  |  13 +--
 drivers/clk/clk-loongson1.c               |   5 +-
 drivers/clk/clk-milbeaut.c                |  15 +--
 drivers/clk/clk-versaclock3.c             |   7 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c |   6 +-
 drivers/clk/nuvoton/clk-ma35d1-divider.c  |   7 +-
 drivers/clk/nxp/clk-lpc32xx.c             |   6 +-
 drivers/clk/sophgo/clk-cv18xx-ip.c        | 154 +++++++++++++++++-------------
 drivers/clk/sophgo/clk-sg2042-clkgen.c    |  15 +--
 drivers/clk/sprd/div.c                    |   6 +-
 drivers/clk/stm32/clk-stm32-core.c        |  42 +++-----
 drivers/clk/sunxi-ng/ccu_div.c            |  25 +++--
 drivers/clk/sunxi-ng/ccu_mp.c             |  26 ++---
 drivers/clk/sunxi-ng/ccu_mult.c           |  16 ++--
 drivers/clk/sunxi-ng/ccu_mux.c            |  49 ++++++----
 drivers/clk/sunxi-ng/ccu_mux.h            |   8 +-
 drivers/clk/sunxi-ng/ccu_nkm.c            |  25 ++---
 drivers/clk/x86/clk-cgu.c                 |   6 +-
 drivers/clk/zynqmp/divider.c              |   5 +-
 drivers/rtc/rtc-ac100.c                   |  75 ++++++++-------
 23 files changed, 245 insertions(+), 299 deletions(-)

