Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE501FB4
	for <linux-clk@vger.kernel.org>; Tue, 24 Sep 2024 08:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727166934; cv=none; b=qcQtfwYvly20emA6U7bRGKuF9mUCLR5Xqie0sAtBR86SxwKhIm781rfcJUiiMkvOJPIQVJnbc8IST8hcwbl5D4sWX1G9FuyE7TmEf47w2AW3CB87pwPHsKhjAcvisP1BvpA8BvFY2J9KJ7kueKsiDy7Z5ayZQWgN3Y9gQsrTSac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727166934; c=relaxed/simple;
	bh=Z1n8cf+UyJ4mIEbA2H5S5x5ghAQcXS5iS6WK2MQutvM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ux0geDDuHdqkMitosSXn6jHr6hf2/mYutNWhdeC7fhC3GdWweA8uoj9memg/ibpNbpWwkzxy+q42cy6of9YAi7jB15RkMQzQemjz8Zq+pBHRaKUq1KDoVEOBoicFvINmW2D12CSCppnSi3Q71dgnP3r+gvpD3DVO/oijlLnsoQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XcVw40xG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XcVw40xG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so45310605e9.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Sep 2024 01:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727166930; x=1727771730; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajeLGRjVvqIoh7fHFa/mBoUm6iFMTd+Uc6vP6nnSb0w=;
        b=XcVw40xGEi4+hLgtl+XJtuXZbCJqF1c2muu/rdJEXtVlJE0FHKy6Mx7bWDErLwmvdU
         I3xqbmgvl55pqlyWzwnHWDVUlDajkllwp7G+49/PIFGuHQYf23vvgN2xJYgyOVYHOEIB
         Eclptrc4C3FkbyrCPMABGv81yexqpwIAwjUILgWHxA2dmrBZRciF7ooTwK88tKiiX5Ux
         t+yKzaBjBanronsWr9tMQLXjf2qysSOe5/cMNt/cPCKqQsDrfpWh1s8CScgNKrX8wzSM
         e3k/DyGhKreylS9ZMVrSaJo59e6NCV/IL5WkW9hCZQVuCxE6idXf4XqPdVk6EA+jCC6d
         eeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727166930; x=1727771730;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajeLGRjVvqIoh7fHFa/mBoUm6iFMTd+Uc6vP6nnSb0w=;
        b=AazR0Tw/qYHQmPzLTYcKv9PC+xB2x4n2ks1teZ9n6q1zyV6bdkbLrzhwhMwRbAerFH
         5wAveuwVoptnzc84bnw9tKpmLgutnR2OucdrVEEWU2hEAPsW+aE/n7EkvIQwDr0j6bIh
         Hbq+wGpzKvxeNMxvWFN7X6KGuiMHBpzLHiUl7MDVta4ZvftkOZvfNBVBwCJqa/6s+Wcp
         zBf7xhvGfUWYRlfNPX5612rDQG23twCyaj5HXCPjsJiUaAsR/lTNqtoc4Y0EiILiRPHR
         352IcAYecB6ZYx744ruclGKJHkv1nefMXRDbH4hURnGibDwS+sjlA/MW0qtlvtZPvymZ
         dJzw==
X-Forwarded-Encrypted: i=1; AJvYcCWPGvFqBThaE+46Yi4wd8ptONtq/m42cMIEB0vK8WyELl3PAQrRg64Mjtu3egHscVWGcVnuqCPy178=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn6N4TJZxPURtXva1sUofuLeRUFV/aPW4TP+wHxHFLJQGlfelC
	rG0k4n4Q+wGUzVCiKNEEQRl0uNapgk1k45Cc3ZUAKBjcDcpSZKZcDv92hyd2OtE=
X-Google-Smtp-Source: AGHT+IHhTgBXiAq5c+olVcBWWoivRLr76awcJwTLO/O9wNbJguyL/g7Rk4pyYzb8CS+Nk0zSGxEACw==
X-Received: by 2002:a05:600c:3ba5:b0:42c:87dc:85e7 with SMTP id 5b1f17b1804b1-42e7ac23e28mr98263485e9.18.1727166930213;
        Tue, 24 Sep 2024 01:35:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:885c:440c:fff5:ed00])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e902c66d0sm14303335e9.41.2024.09.24.01.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 01:35:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] clk: meson: Delete a meaningless spinlock from the
 MPLL
In-Reply-To: <20240920-mpll_spinlock-v1-0-5249a9a7e2b7@amlogic.com> (Chuan Liu
	via's message of "Fri, 20 Sep 2024 16:16:10 +0800")
References: <20240920-mpll_spinlock-v1-0-5249a9a7e2b7@amlogic.com>
Date: Tue, 24 Sep 2024 10:35:28 +0200
Message-ID: <1j34lpzbxr.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 20 Sep 2024 at 16:16, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> The existing locking mechanism of CCF can effectively avoid concurrent
> register access. struct meson_clk_mpll_data has no meaning in defining
> a spinlock repeatedly.
>
> In addition, the register corresponding to MPLL does not share the same
> register with other module drivers, so there is no concurrent access to
> the register with other modules drivers.
>
> Every driver file with mpll defines a spinlock with the same name (even
> if defined as "static"), giving the illusion of repeated definitions?
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>

I'm ok with the patch in general but I have problem with the wording.
The lock is not meaningless. It has a meaning but it does not serve a
purpose, at least not anymore. You could write that it is useless, or
superfluous if you want to, but not meaningless.

Also, please squash the changes. 1 patch for this is fine.

> ---
> Chuan Liu (6):
>       clk: meson: mpll: Delete a meaningless spinlock from the MPLL
>       clk: meson: axg: Delete the spinlock from the MPLL
>       clk: meson: meson8b: Delete the spinlock from the MPLL
>       clk: meson: gxbb: Delete the spinlock from the MPLL
>       clk: meson: g12a: Delete the spinlock from the MPLL
>       clk: meson: s4: Delete the spinlock from the MPLL
>
>  drivers/clk/meson/axg.c      |  6 ------
>  drivers/clk/meson/clk-mpll.c | 11 -----------
>  drivers/clk/meson/clk-mpll.h |  1 -
>  drivers/clk/meson/g12a.c     |  6 ------
>  drivers/clk/meson/gxbb.c     |  6 ------
>  drivers/clk/meson/meson8b.c  |  3 ---
>  drivers/clk/meson/s4-pll.c   |  6 ------
>  7 files changed, 39 deletions(-)
> ---
> base-commit: 0ef513560b53d499c824b77220c537eafe1df90d
> change-id: 20240918-mpll_spinlock-4b9b55c44fd5
>
> Best regards,

-- 
Jerome
