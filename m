Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEC51E1E16
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228213; cv=none; b=ICnPKJKc30GNGWPXKGC72zULsGcnZfItDlR4ngCGtVzqqipVGO+ArZ9/jRfepGthsIh4ZMjv5/Hh1A5l4WnlLc/rVECCiRQ9Ka+UBSUU4ECDkVc/awyVtyn+uKPVd3b8cWOfNE+6C00EYYK8lE6YUh8mmem/nsbRBUKDk0ncI0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228213; c=relaxed/simple;
	bh=DYJcZRRmdEMSPPmAFV4ygUc0KtR2ijewql1crILf5Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yd+1wfgBUMCjK4fyVJ226EbLGc7XHEJajwBycRZ/BLtvf3RpIzwjRaQuy29OemS9BtuBb8jWdDmQX7bDaRWKOceza1QcxUdd2WqNrlqXybmffmK6hmBupgNMIJIxkgYLQ9GSOLkjMeH+j76DH2DmdtlVTi3k0dIrR7t6eBzC6aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HUM29w91; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HUM29w91"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5635f6cb32fso1069243e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 06:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768228211; x=1768833011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYJcZRRmdEMSPPmAFV4ygUc0KtR2ijewql1crILf5Fs=;
        b=HUM29w91GQeTA7yvCw+Q+BlMJL2b8+enc1dLVPnv8NTufBvlmcA3HGD4SntA9yaiRd
         t1uJPbYWIW6LEI3lgz4o7z78vu4Ml2gZ2R7vCyM3K+gRPzMoHYYcTDaE53Z4N4sqzJxG
         YjX836cs+uD1A2KEYvv1izhd/fPh9D6+hXrGDtnGNfj03vk6CVWYrTidXzs6LfgUSURm
         S//CjOw25USqcwLTS1yUYl/5Bq27KNT+iC1XrsNJcIatV1jQM6aO8BTXewiENdLLuUpl
         AecFxtbUZoNQzb3YhNVF2J/bqkoHLiL1xtCc0/5Rf4XMNrJZREeFd7odLaPuk2qnqcnN
         YOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228211; x=1768833011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYJcZRRmdEMSPPmAFV4ygUc0KtR2ijewql1crILf5Fs=;
        b=Zfccrg7pBHAN2FS7MvTp+VQq/CfkgiMHZrfs023ZEc3geD1OO9EjF86VgY40pytHYZ
         FOUCa9gnvZiNbcy7S2CrpBiS1xmU9bJPJlcyNlVugzwCJvlgVxJCPnqGL6s+dFHdeIeQ
         v5bOZoFJC6ucfNaohcdHMzeclz/xOdsl23GSMasigjXl1t4v27WH0Vhvw/jkz+MJebcC
         yt+hmnJv964Sy+yxpD2recNlQxsyCZiNViaEUcNNwkEl5GeZ7E9W+87vA6B1BqnqEwPy
         yMPH+JhomQxf1oCgerSv7Z/ZL0I9PWLdxbRmWMATaOgUALMDJz1Z1wnSMBDnkUXsaIlb
         hUNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT2paP4H98cG8oD5x/jLpy3+rvJy/nvOYlsg2oKE8f2quu1zVxtgY6Hubytvu9QDo/MaA0fIESfiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YycIz8Xfwe7hZpJVcc094fMMOlMf0VVmUvRRHZrk/2yHLur8MIL
	3svuP/1sV5kXIZji7Zb169Xk2P7v0KXhzpN9T+gw6CzVn2De7oH4QrEGRJLbyOFmHScrDK7QjU4
	+PcFvAC0OE4SIEz55PEi010nr/bmQSQKgeAPaZIRyhQ==
X-Gm-Gg: AY/fxX7AdmC408Wk9olnfysww/hBt5eeWt3dVz15YCSZhie+wWAdnXNn69SDIFPKdd0
	jAl+XBwxtGjBB9UXfvRQIpc1KL4KHJhAvWWyCRrxOU2/tdIsTOilG+klsoacxMg2w5IDIplIK9M
	RSNTS2/jdLMz4tdO6DPb/yslJjhI9xv3KvkrN0mop3vluPTBhNkdlZGAsvqZNmKZJB2vCKgv+da
	KD6mjYpklfGrKVQGUz8BN0Oq15+rMm26GowNGrJtLTuCyguGE793RGgx7MHxb6ydZULAR40ZYM6
	gWHF1SmXqSmIpjVdZRAW3QF3NCJvog==
X-Google-Smtp-Source: AGHT+IH99W7nwLgEet5FdEP/u+i5jdZDgClsT+5CiMOQ1spY+a7QdU3aguNyWZv64H0AdvbI4admB5ccZbM6V9dJafg=
X-Received: by 2002:a05:6102:8088:b0:5dd:b2a1:a5a4 with SMTP id
 ada2fe7eead31-5ecb1e731d9mr6591509137.5.1768228209479; Mon, 12 Jan 2026
 06:30:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
 <20260109-clk-samsung-autoclk-updates-v1-2-2394dcf242a9@linaro.org>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-2-2394dcf242a9@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:29:56 +0000
X-Gm-Features: AZwV_QiWt47PILn4o1sT2KySNxv4rOargBnbBbiIyWb62OAi4o7lAfW6acLnscA
Message-ID: <CADrjBPpiMxNsHMnV8StHvU7waW3QE7jtAPK3Gyq-j0mVRQrgnw@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: samsung: fix sysreg save/restore when PM is
 enabled for CMU
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Juan Yescas <jyescas@google.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Jan 2026 at 17:27, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Currently, sysreg registers of a CMU that has PM and automatic clock
> gating enabled are not saved / restored during runtime PM (RPM) or
> s2idle. During normal suspend, they are accessed too late, after the
> CMU (and potentially power domain) have been shut down, causing an
> SError.
>
> The reason is that these registers are registered to be saved/restored
> via a syscore suspend handler which doesn't run during RPM or s2idle.
> During normal suspend, this handler runs after the CMU has been shut
> down. This registration happens as part of
> samsung_clk_extended_sleep_init() via samsung_en_dyn_root_clk_gating().
>
> When PM is enabled for a CMU, registers must be saved/restored via
> exynos_arm64_cmu_suspend() / exynos_arm64_cmu_resume() respectively
> instead. These use their own data structures and are unrelated to
> anything that samsung_clk_extended_sleep_init() does. Calling it
> unconditionally from samsung_en_dyn_root_clk_gating() therefore isn't
> useful.
>
> Update the code to prepare sysreg save / restore in a similar way to
> how it handles other clock registers in the PM case already.
> exynos_arm64_cmu_suspend() / exynos_arm64_cmu_resume() already handle
> sysreg save/restore, just the setup was incorrect.
>
> Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode=
 for CMUs")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
