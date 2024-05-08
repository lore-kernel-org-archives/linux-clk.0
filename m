Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CCD1A2C24
	for <linux-clk@vger.kernel.org>; Wed,  8 May 2024 04:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715141209; cv=none; b=i5Yk60y/FOLd+ly1mDKMY4OqcolYRvYHdkrjaEsvAY0Q/yR8+rsUyUPqr6MAhtZG16xF8Lxe3SPqEDQmCCk0MVDDTM3j1CyWH7aDQWtwUI7mTVrkKqESyJkvzzX2d46AQ2EV0o+nT+13dXYcf5xoOFXkR9XMhaF7z6M6cyws3wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715141209; c=relaxed/simple;
	bh=ThaP/iIA0FhQz+tdINXBQ2OCpL5MofYandZrXlsm2eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNi/uwHRzElkfRnucVyzqV/1UgoFWIeECSDCWH4grHforjvOqe+z2W64evsCAd9pxZSpe1vJGHhPJLUauFze9ikr/uzKhvClT9kY0VGrOpsAh6t3EYyVTbW5Jx5cAhKiCgdN4gwIaJwMZMjWYCGyE7s1ntFnyyPYuCWQOFtk/rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uv80mz0C; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uv80mz0C"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6a0ffaa079dso3618896d6.1
        for <linux-clk@vger.kernel.org>; Tue, 07 May 2024 21:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715141207; x=1715746007; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YE3OmvezbNJbmFg9AsFdXDjrSKNk464POBXlEe8hgAA=;
        b=Uv80mz0CRzDHrfAEUnb5jJ9aqr9u4aUts9Aa8TLiQPKg2OvlG+pCq7CTzV20Y91/8U
         HBq3XXcFmkH24dKqtqYCKxs3+4Cl21mKSVc1xsWsiLQeNehcqSVbUDbFb0rDMUH7haFM
         mtq/wnaYEwtex1s9mXQUjNvRbVJhEYwTmO5x931I842nC4/RiVjK194ZALvpKIxSFxEH
         amvEZcoLjHz/9M8WiEBSGbymWDw3JLILy+AFPZoEIfM7Hjl8h3zsEhqbs9sz9jOU1JzV
         gS/2uavjIHLr92VTSWwNFTZcOWT4V8QDIqHKPoTmXXAgxDNZFUJSmIQNMAmmEX+pj6Fp
         rTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715141207; x=1715746007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YE3OmvezbNJbmFg9AsFdXDjrSKNk464POBXlEe8hgAA=;
        b=CB7BOnKmHr+RyZebTbQPa6i6l1qhYEYG0KwShB2hJBbOT6h5O8t7gXOgM0GnPHkcCH
         h2yqYrE2YK/DGIy96ti9SL86hFhVSA90Wppr5OVkVcdRJr7A9WnOPkXFbG304Bj6eql1
         g7q4xaovAABmKEgahJhxjV5KOq4lYGgBOjhgASPCqSDgWrTq7ERGSDsFMs6emfBjdSFU
         MbkVaIzR9VoRArtzu1j3FcTDKPNvWsjVESNvUXjTcsHVV5kfext6uhQkSOruc27qZF36
         qnjdQIjc4xxqmnnwR3NU4V8aSH8QkCfBulhOsmGBPjMVChf6rjeSfjKIUPx/BjAlpXJL
         /zcg==
X-Forwarded-Encrypted: i=1; AJvYcCXZxVoto8BpHK1dWGhX/9R0uQvknIbAlO05tn/v7RhlBXPIf7L1FAVTGKcb99F96Wmfn6JHVJA/1h4jbvgkFtst0DzzARydGXC3
X-Gm-Message-State: AOJu0YwTWcBLlUoZKLh3+ijVa43lhFb2a38F02oLt++Q84tHrMb/Kf43
	HmsibdLxKwNezJyDR79uY7NOn1eRdwvMQToo0evm0BL9ALpDHh0uARfWNgiynWiPQ/CdrePTuYg
	PxCJQQdqnzBchCbDz2La0vd8G2FEIObIqmPl0pw==
X-Google-Smtp-Source: AGHT+IHcUUK+FnWDxPpiMNuBsCYu9M7kpUkZ0Qngrv9ZJRMPE8I6eLkcdSuSNr7hBS3Of3DyHZLjyLmHSb/D/Scgt5M=
X-Received: by 2002:a05:6214:21cd:b0:6a0:e690:2f96 with SMTP id
 6a1803df08f44-6a1514bb4demr24911666d6.21.1715141206889; Tue, 07 May 2024
 21:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYuZd_ur56H8fwDSvUywopvn_b7ogprGkjEatQ7EPTLwYQ@mail.gmail.com>
 <11be44d3-0f32-49c6-b4ae-ba97a9f97763@app.fastmail.com> <820ddc2ec70780ae1ecd3af864dc8bd6.sboyd@kernel.org>
In-Reply-To: <820ddc2ec70780ae1ecd3af864dc8bd6.sboyd@kernel.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Wed, 8 May 2024 06:06:35 +0200
Message-ID: <CADYN=9LJCHK=TkU8y6jNFVFGNg4v4GtPEUUvvsvJ4it6X00D7A@mail.gmail.com>
Subject: Re: clkdev: report over-sized strings when creating clkdev entries
To: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, linux-clk <linux-clk@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 May 2024 at 22:26, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Arnd Bergmann (2024-05-07 00:44:15)
> > On Tue, May 7, 2024, at 09:20, Naresh Kamboju wrote:
> > > The WinLink E850-96 board boot failed with Linux next-20240506 but there
> > > is no kernel crash log on the serial [1].
> > >
> > > Anders bisection results pointing to this commit,
> > > # first bad commit:
> > >   [4d11c62ca8d77cb1f79054844b598e0f4e92dabe]
> > >   clkdev: report over-sized strings when creating clkdev entrie
> > >
> > > After reverting the above patch the boot test passed [2].
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >
>
> There are two fixes on the list: [1] and [2]. Perhaps one of those
> resolves this?

I applied patch [2] ontop of next-20240506 was helpful and the e850-96
board booted.

Cheers,
Anders

>
> [1] https://lore.kernel.org/r/20240507065317.3214186-1-m.szyprowski@samsung.com
> [2] https://lore.kernel.org/r/20240507064434.3213933-1-m.szyprowski@samsung.com
