Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD63321456
	for <linux-clk@vger.kernel.org>; Tue,  6 Jan 2026 10:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767695130; cv=none; b=o39uYIQxXxh+Lm0Y2fvfUj9iY2xxidDTL/XWA0wT7sCOrqj4uE7eyU7RogXAJStd6Yi7LZfrxIxPLkAmm5UIRQ1aBorKX3OUDX0ehg1LUB/0md75knoGdKsaKXd7Y487AQgGmf0GxTk2VOd20l07lruEjRkkRREnNzhRhk68WR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767695130; c=relaxed/simple;
	bh=nong8fdB1qEQv1HMJAMSfz5xFyfxpst7My1lNS5fUHc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ALvimymIX8psL6N1iAEMNiqGvDhAZ4zWDSsyH7cJ31HqZg6ldvfhlgWPvz75pbF8ez4j8NS3DZHTTQLqEWc6GSP2dZZjZZvOF+OnTVsggrB8umUYCsUWPE8KoSwEXJiuZzcOXMQtCyrLu4kunhy3hr9WppciFYgyIrpSZ6xvJ28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zqDRzQ6D; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zqDRzQ6D"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-430f57cd471so362459f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 02:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767695122; x=1768299922; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0qANYzoev4CDFAFriC0/ymDfXiPKNr8QETcgvp/u6vU=;
        b=zqDRzQ6DqrxtDdZFY230e+12dTk4UtbYss55fPdu8mvj0PA1NvMISVBdjRcaEgjci2
         /Pl16T/tB3PC8laHJq0gQgxB31MD15PiSbY0mRYgeORASGXxohGcbOQq24CEchH7EunW
         Ks4a4P0lkAXLFYvBxjxhb/IjhcvUAjv91Glsk7XWXQZhQvKozZr/DV3QmNzGmT1ZydRj
         pYd/dh4yxE56pjsk6TUvw8ED3T1zKPmKeu7vTkAoMzyvz92/ZAuDOl8lSwvvaXvQmqPr
         f5n3nF5Nnj+rpXmSptrPe6EiR4kuTQfZIWfxRIeoeUT03hEdG/seOy2C1jiPvJCAPQch
         039g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767695122; x=1768299922;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0qANYzoev4CDFAFriC0/ymDfXiPKNr8QETcgvp/u6vU=;
        b=nJUXFL0FgCVuRKpIZqurUlDu8gvvsICBUHx7k5KetvX2fIugwKRwjKR7Yct0oidP9b
         59VVJHolxl9zdMWl7Sqn9QgyJ/K0dYT6YNJmEaWYplw52HLg/sxujIuoHxk4J34qyG/B
         B4puTPWpgb4ngaLD7wO2LRX59eUqOYGFSP9OUddJtpR9jiATkyYSFz2pOXmsoThQ98TC
         dQ7drb6nkzfdd9oC4K2wKLV5jEbnNwT4fmftlnuPnnvhIJaEPhbcd6Pi1rdvg6aT9ZLw
         2EbV4eVN1ZY93iAy4drIeaJBLKVCEVf7aQsCGmyx7AbNzjrKQHeez73vf5DkVW+AAmBm
         /jEA==
X-Forwarded-Encrypted: i=1; AJvYcCXkpkbAn7rr9KHnvTrxH1Qrpo6ZfJGvgf7ZIzk0VyoNDgW5RcObve84a/zkbrdPP/D6PkjzzBpUJ+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv/AXRnXhJd7iMPcjYj4yLx6hB14fNZGMaskHjv0IMtlRQ0OjQ
	q4x9BBFvHqzNejBrTeUU0ee0qPfLQijeyYypfiD/yDaMmPgVpESMZLrwB9x0+gALLV8osdFO9yi
	E+lnun+w=
X-Gm-Gg: AY/fxX5onlzIwF1IeMx+6cn6akkFeJJmHnVbsFDCrCCGYsn2wlHvhtg18ScQUXKpPM4
	dx7BxnAEQMeSSa0ieBqq6XEtCDjrRGD/c+LgSFlBkUCk9Yzu6JkKdacGVojx2DbmJTe3kCCnTyP
	1CwbNRlKF9j0S044EAen0VXSYd67Rlas1GxY/mzh6BFYLjbVjMOSNWGbK3hoB6vUGB+4IdGmiBz
	DAXOZwvCwQ++Vx9zytbKG9mfs5/QydmX639xZ+jF9CujC+SVGZ4KCvxEWvDBzpKP81M7EDy9wiG
	bVnzASSKqTuIT5IpZUeGUwAbPo1cHozlgv8yELLNZvIxD487nPfH3y5HikAYHRwGwsCyVtIiip5
	2TqYwMmJW9kkE/Vr2gDObOIAX01U14AmcWywsh8VI9sNTbbMRj81lde8S7VXWeRJY0L7YV2mQ3n
	6FbCeQp3nlNg==
X-Google-Smtp-Source: AGHT+IEv0FV/dLsQxvu+BoaxabRvTrsfnnhhr1sy/Eszfp34wH82WJypgYYqe5SNFW9OsYmIAalYIQ==
X-Received: by 2002:a05:6000:26cb:b0:430:fcbb:2e6b with SMTP id ffacd0b85a97d-432bca3f1c9mr3845176f8f.27.1767695122452;
        Tue, 06 Jan 2026 02:25:22 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:e12b:7496:6c81:d3aa])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd5ff0b2sm3584447f8f.42.2026.01.06.02.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:25:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  jian.hu@amlogic.com
Subject: Re: [PATCH v1 0/3] clk: meson: small fixes for HDMI PLL OD
In-Reply-To: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
	(Martin Blumenstingl's message of "Mon, 5 Jan 2026 21:47:07 +0100")
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 06 Jan 2026 11:25:20 +0100
Message-ID: <1jfr8jdomn.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 05 janv. 2026 at 21:47, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> this series contains two fixes for preventing HDMI PLL OD /8 on
> GXL/GXM and G12A/G12B/SM1, like the downstream driver does. See:
> - downstream GXBB code: [0]
> - downstream GXL/GXM code: [1]
> - downstream G12A/G12B/SM1 code: [2]
>
> I have verified this on GXL (Le Potato) by setting HDMI PLL OD1 to 0x3
> (which should result in divide-by-8). The resulting frequency reported
> by meson-clk-msr is double (meaning: only divide-by-4) compared to what
> CCF sees.
>
> These are not critical for now since the CCF code-path for the HDMI PLL
> is read-only (as drm/meson directly programs the registers).
>
> Additionally there's a cosmetic fix to use the HHI_HDMI_PLL_CNTL3 macro
> instead of calculating HHI_HDMI_PLL_CNTL + 8.
>
>
> [0] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_clk.c#L505-L627
> [1] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_gxl.c#L501-L553
> [2] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_g12a.c#L671-L721
>
>
> Martin Blumenstingl (3):
>   clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
>   clk: meson: g12a: Limit the HDMI PLL OD to /4
>   clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro

Looks good.

I'd like to add a comment like this in the code

+/*
+ * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
+ * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ */

(and a similar one for the G12). Is this Ok with you ?

>
>  drivers/clk/meson/g12a.c | 13 ++++++++++---
>  drivers/clk/meson/gxbb.c | 19 +++++++++++++------
>  2 files changed, 23 insertions(+), 9 deletions(-)

-- 
Jerome
