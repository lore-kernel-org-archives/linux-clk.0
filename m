Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB842D595D
	for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 22:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769035874; cv=none; b=uf91khahYf8aldN641rxKApyWdacJjeuPcCQlCbtEgBXhfQlS/tshAWPnU0sgAAZDQDvk2aaSoUZlYHmh+IwyNxOXTkEOH//XJWgbMrO7k9t/P0rmTzCPtHEkr4mxBcZWdNEPLkxdac8Ri06L78q7y8tWeRVJ0gamc/KlIeD7pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769035874; c=relaxed/simple;
	bh=yWkY+UHjIsVWWucZVtJVRKqou4DthkosLf0vkVsVgXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z4XpcYBI8Hrijg6Yv0wRYlfZMWyx8fppXIFM+p1guhb2IiePLsEnMnrRXs/+hpsKWtqLdp/2SyMFllvV+W6NgtOg0gtqFKe9AyFdNmeoii0pZhLLLOpHjwCrk/KvRWgwB8Gq9Ym9HaXb5oueYyF0BWhvYIrUuNzmwka2ns+1X98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DZgQ9U0+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lGivQTIj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DZgQ9U0+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lGivQTIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769035866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Yi8dtRe+OkhFN0mZv7ax8V9fdnQTxFvioYJNH369UP8=;
	b=DZgQ9U0+04fvZkaINwvyzxkDC1OTvBXnpPS2sDz3YTn0+FlAMKWntJD7Owq6YyJ6tvOMFS
	xSJMuqLR9YnOMZh95zPc9E+RZNSD4BU9L8kFRgaylPZS8f+kZ6kFt/Kie1jQqJhQOZ8O45
	hLH5um1T428BCRAwBcZdNRJJnyuz8xE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-HCFA7_0wOkWb5F3sSlRyVA-1; Wed, 21 Jan 2026 17:51:05 -0500
X-MC-Unique: HCFA7_0wOkWb5F3sSlRyVA-1
X-Mimecast-MFC-AGG-ID: HCFA7_0wOkWb5F3sSlRyVA_1769035865
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5014b22d678so4761631cf.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 14:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769035865; x=1769640665; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yi8dtRe+OkhFN0mZv7ax8V9fdnQTxFvioYJNH369UP8=;
        b=lGivQTIj7cm49qRJ6/5Do0zLSDPU+WF9bgGaTv4Sf9lLWoKihJL79aiwwRAAd0bAau
         4Z+R4LUDz+/q6H2NqkJ66do95xijaV7Re65A7vPhNPJXpaGi5qSw2ef12n34PnPyENfR
         rF28jGi7e4tEVsif2uakgy8ZBLCC5jQdxCbQdnyXKtnJIkMmFUEZJY3yUm+YOrqtcU4T
         5aX0kriW7MohjP5xx/bDrn5h29HYwLw6pkULzN3pybqO170L4KEUOO5H7GYREh2RrcB6
         jR/31tytsNOb/p3asOSimFOkvCs22i2/w8Xbw8VRR6Lv/EfjEwXwt7jPO6sdjA50Fslw
         Ttzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769035865; x=1769640665;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi8dtRe+OkhFN0mZv7ax8V9fdnQTxFvioYJNH369UP8=;
        b=DPqnh9u/O8UBfm5m+e5rOd6TZ8aRfDQSaVVvLsbMZHXU4+m9nKsmDDgrV/+6nLrxzn
         +UxNJIJV50Zbmi+E/SXldsYcCJUSMpaxtE38eJ7W1l3Ddy0D2UPbg1oleRu+53DXLlh9
         NVQ+4HGgLNBP4ai3qv/6509J+U1sXgbyDKlMIVoTuG3kVeepLzBkeScPZKTFDuXUJeBO
         XwJTn/jmz7jq0vWrMsgJ/s31SyiCI02WEdK/sxMmcmlc21GtxR4KYbrjITGJJ1GeIyNN
         izh7cyQQZE6CINW17kb3mOGVmY9auvA/mcv4r9kN8hHEdYtB9jhfMbg+UtlhQEsnyvt1
         qf2Q==
X-Gm-Message-State: AOJu0YyZu5/KNUnn4AoMvxOa9TW3k7Eqkt8F/yb217EYAdHJuo7cWxm6
	B/3fhj9xElMreVc/Qq+/nL05B8Y/7MmqRShL7Edo0Ko6eumLQs+PIuNewNrWRtjyGxnf2L/R7wL
	sYWEtM8j8/B3bNUzsaoN3uTvooaOM5cgTI6ZM6O4dtB3ETCB7MPT2cdV7juAmMA==
X-Gm-Gg: AZuq6aIfwFEc5LvIYCnhTPeJQ+1JO1D80IZk8gSxF1LBjY0mTaEOeIGgr8dboVraers
	uhqP3fRqD17FqfhFeq4vGh3lPyvDfLBTcQAy/M3O9knmRB/D0RfOX2jekVVaTQAuQgDdzl9jSwK
	KeYemKlF/PRyGEFCexyhw6XipYLxwYMG/BVvJkDrOy2o9Y009hMrMXcLsFzpn9qTyK/CinRLGDJ
	/vZeznnO4yhTdCIDrkcFqlhw2eDw12qa0EvvKMvxqjqfXtI1XYqKO/p6fV7OhW+DVzGBXgNxejj
	i/IHU4kQVQJSIMkwZyBtd4OMDs9nNoxFuNW8sjGLgpaNEK0Ye+SNZFrpqcVqc35qX+xnkVckgq/
	DC+1FJuKC
X-Received: by 2002:ac8:584f:0:b0:501:3d11:18ce with SMTP id d75a77b69052e-502d8523a03mr93018231cf.65.1769035864746;
        Wed, 21 Jan 2026 14:51:04 -0800 (PST)
X-Received: by 2002:ac8:584f:0:b0:501:3d11:18ce with SMTP id d75a77b69052e-502d8523a03mr93018031cf.65.1769035864344;
        Wed, 21 Jan 2026 14:51:04 -0800 (PST)
Received: from redhat.com ([2600:382:8125:73a8:e201:8ac3:bd7d:6acd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1efb0b2sm123098491cf.29.2026.01.21.14.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:51:02 -0800 (PST)
Date: Wed, 21 Jan 2026 17:50:59 -0500
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [GIT PULL] clk: remove deprecated API divider_round_rate() and
 friends for v6.20
Message-ID: <aXFYU324yQ6uBmk0@redhat.com>
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
some deprecated round_rate APIs. I used the following b4 command to
collect up this series:

    b4 am --cherry-pick 1-13,17-23 \
        20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com

I skipped some of the patches that have already been picked up by
others. The last two patches in that series that actually remove the
deprecated functions will need to go in during the next dev cycle.

One thing that I want to call out in this pull is the change to
drivers/rtc/rtc-ac100.c, which is all clk related.


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/masneyb/linux tags/clk-divider-round-rate-v6.20

for you to fetch changes up to 533162201ebcc478739235c6d002971f02f42f19:

  clk: zynqmp: divider: convert from divider_round_rate() to divider_determine_rate() (2026-01-21 16:32:09 -0500)

----------------------------------------------------------------
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

----------------------------------------------------------------
Brian Masney (20):
      clk: sophgo: cv18xx-ip: convert from divider_round_rate() to divider_determine_rate()
      clk: sunxi-ng: convert from divider_round_rate_parent() to divider_determine_rate()
      rtc: ac100: convert from divider_round_rate() to divider_determine_rate()
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

