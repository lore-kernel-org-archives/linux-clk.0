Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAED421CC4B
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275522; cv=none; b=p+4h25M1HLHzsOquKVFO0hqs4gaDXhzf6Nz2aW7Rj8mfFVIwrgYs2J+Fznb3GfK4rIHvX/3AdVFHIfvY1Ck3bixcj3vCRv+zE9G7bPu5zHhKa6Ara+/3A546Rsds6T2aB4zkX4Dgky7fctQPeL8UHCG/vVqqSqIuZQMnYwrvnJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275522; c=relaxed/simple;
	bh=90CkRn6xqgCSuiiGN92fWBGlZyLVs9LUFtpS7VvzMZc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iJR0Gs6BpOwFkVHsw1rIk4bGpMlbJkGSZLVjXT1NqOYsMnj7ieq/M2yq1IjOTfUWgWRp1fMsHq0CdA6k+458IYAXlJEiNbEUUsVbGiaV9U2g52oDaSUlfJybQIQ1oVfTAgcK23zyFR5whWLJmtDEbbXk+BgWp/3VJFJ2CDG5cGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fXDjk9jg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fXDjk9jg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45f29dd8490so17658155e9.1
        for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758275518; x=1758880318; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=90CkRn6xqgCSuiiGN92fWBGlZyLVs9LUFtpS7VvzMZc=;
        b=fXDjk9jgH/TsWw2fkfSPp9xcC4WcYwOf6Hq8p0GCI1HaZ/aOG3eY7L029l5x98VIex
         YnszEl/q7nIDe3EfAiKe/9vLW6RB6ABlvCxXZVfLq3YyGyBqcGbOKyxXoRlza9ls/UQa
         dIlNLLdVcEu6k2hLiM1WHhi8UVhPAKWVsFq2pqY+DAuyG7t8Ru9tyvVIS1B5x9NhWLVl
         liKqguZkQUoSygWPhRyT3tJ7/Bz1osf469HV3GYAvT3mIlUg5F+jY0UiQdCPdpJGujo9
         lJyEb6DxvIAwE90ArCD+GOHhpp4Lk+Nwkn+ccJnwQJvZOhqI1uNV0uVDKm6EOaZ/ds4B
         Dd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275518; x=1758880318;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90CkRn6xqgCSuiiGN92fWBGlZyLVs9LUFtpS7VvzMZc=;
        b=hMkBTQs4WDYjsRMgGiO6a5Za+1B2DuMFBL/zNFKodUnt2onAWXKDK/lQQh5pZlZFz8
         hW2WHRmgGoIz/TmoYyXtNeD1r3CaV7GqH44vHydp0AJKE/ozshlLXK/poB/dOz87ICKJ
         zq2srdGjdzwkiKZQrGjFHND1jjUNiE9WMurzYZZGcz5xQyUnuocTP2XJw3fCfeL0S6nH
         9TflmeLmGf86nJWmlzWm2M8cbimbW7//ZmyaDbTzJ6yx1SMqg4KvF4TQe5g9dLv2CQZB
         vaGyRRm3qvKlKpntmZCMeyU5fcckLw3dpcipI9Vw2Wbihr99DlRTb/jzTGlhk8LDPgmf
         b2cQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1HUHOwyuppJSMbd1dLxi8tgrwqixoMmPANmQ5YfEUNd8rKj/xZoGu73KCM4fdmNBwEmxIRUDGbIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVdIN938T4lhx6Iw5XcUc8PX5nnxYxmfwnYzRNYHj6MTOkbuLv
	qS6OdIIs9fjZiHo/2UqgTulbJPOMZJBGbTz+JS+au7qJkSSaTvKgHbl9yi+LZgPRBcQ=
X-Gm-Gg: ASbGnct8QkzTA/wBFLrJtBynbDCGLVPoMM4IptO8MIbPwPNdXDE3baxa+vQjG49kSS5
	k35Ry0qa2VFXMPAQ127ElQ/QOX4Yu0XPp0zlHB02+8kVOUoEUO5kUGSG8RS8p4Y9qj1I45MhuVL
	TBR76KEGsUPgcK+V+xf2Sgq1J/uogWO2fnDtv1h9hLhi9+gbITy310mwHeggbxVGsnlByhpkOT+
	2S+ES9JGiy3GNoyULua1uKDgyk+D9cyCrdvGYMa8OK2KZx8tV0jAvOkL6B93k78ph5fLH9lawzl
	kXHlQg7FbueIUSHZErsvRYCk2M6A24n2f0dcU1hAmr8bzSoVN/mlOoGu+BGi+lu3jZTBc8siirl
	BNZuGAshC3itr/N/B1S3G4A==
X-Google-Smtp-Source: AGHT+IFtlGAsHLcjZynA2Pl/WGYGGhzPYoDKnmB8DJOFmQEH6caueLqOVqd3kXjvCLiXRfFUr0z5eQ==
X-Received: by 2002:a05:600c:4f11:b0:45f:27fb:8017 with SMTP id 5b1f17b1804b1-468a10cd520mr18422985e9.5.1758275518279;
        Fri, 19 Sep 2025 02:51:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:636b:57f6:8727:48bb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45f320e2000sm81272685e9.1.2025.09.19.02.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:51:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Chuan Liu
 <chuan.liu@amlogic.com>
Subject: Re: [PATCH] clk: amlogic: fix recent code refactoring
In-Reply-To: <20250918160601.3286872-1-m.szyprowski@samsung.com> (Marek
	Szyprowski's message of "Thu, 18 Sep 2025 18:06:01 +0200")
References: <CGME20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6@eucas1p1.samsung.com>
	<20250918160601.3286872-1-m.szyprowski@samsung.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Sep 2025 11:51:57 +0200
Message-ID: <1jqzw26a82.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 18 Sep 2025 at 18:06, Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Commit 4c4e17f27013 ("clk: amlogic: naming consistency alignment")
> refactored some internals in the g12a meson clock driver. Unfortunately
> it introduced a bug in the clock init data, which results in the
> following kernel panic:
>
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> Mem abort info:

Thanks a lot for the early testing Marek.
I had no g12b with me to check

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Stephen, would you mind picking this up directly please ?
