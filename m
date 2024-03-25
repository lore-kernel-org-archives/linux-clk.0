Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CC07442A
	for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 16:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711383555; cv=none; b=igb0Fkg080iUh0cFj28lspvhfmm5PR3O3efHZeO0CwHGOG777bGHoXLjm/RD6huhsjlcfWCqP+s/tE39yFGlPY6XhqG8JBFXXFgZtGd89JFG8gVyBp6y1rx3VZtJHI5WJK0/sRO+IM9Fr1f4GYLFyQTlYsbnHQg4bnr4j9BPEnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711383555; c=relaxed/simple;
	bh=C0yANzAlSzgND8qqihTlSMXwQ/R0JMuPRLxdKZ8jvZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcgzcqb2UKIdxL3vgBgzv+TVm7cFi32MgIeLwT2sV6/HjBbod+deacq094H3t1H9m6mpWvpWuis2dmZtn5mJFCCWc2j49DIyloMStq56Lh8+V4veao1TmzrBZ8QBmoH19AWEEblxbi6x9gNrDBdsCnfat/37szrmVmhd19/Mnug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W+mrT5se; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W+mrT5se"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-430c4d0408eso26820361cf.3
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 09:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711383550; x=1711988350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKP+i5jnsTv1b1X+grUsnmPFecRRLS4nYrDFL9hNpXg=;
        b=W+mrT5se5SXV/eaQK3UVwLxVAIcOCDRowUpmtMn0lB9w2c8+LvZXRRQ2KTUFWYnjW7
         P/eE0vaSXXbgSPvmPF8CUwFeEolCLBA8nKog6EVUn+OaYjoUBxwzCgn69bmDLLskYq9P
         wdEnXAixjhyiz5HQ6Z0tMw6hMMhgtM/nkEW7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711383550; x=1711988350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKP+i5jnsTv1b1X+grUsnmPFecRRLS4nYrDFL9hNpXg=;
        b=k+zeEIEYrVxlHhvmZ6BwgGG8cgkQOLeioM4Nht6SKib51Tt5JqAv3LfmNntw2T2CGS
         mokA4IHqcLQ9tFiiGo4icfyMqNQXQBgLfuhAV8C0iEOc+Vb9kEr9KJ651VyNOmqYHznR
         oDGhHBwpVPPmkKFw4faVkWoHeDzalJqT6HxOmv735LBF/cfjxwjmAIph+HCtw+4nae1M
         srAp/wJhOW12iZvsyDD4pUcTMAD+fiOV+5QUwlBEC2TzabQQYzrWG+z7IVVQImSw7vox
         bRKQVm49x7tx0YkR7UTjHNCsEym6aeVKN9CRLPDt3KSeVZ9xBXPZHXtM/GMuXns1zw1z
         EEbg==
X-Forwarded-Encrypted: i=1; AJvYcCWYzyNo8G2ArldI6klBo4J6HVbLtIF+rAJ0akXlXfxHv5GclCddH6YUKHXeDz9/1ID2mZyBCxRJUnXssBY5KoH+MuqiTXbINUtD
X-Gm-Message-State: AOJu0Yyb0mWwuD09UhWCl88gOuRHzHXjNN86EqJ++UmsI6rd18MGkyV4
	A7scfJF3k4k5f2XnWI3R7SERkipjA0MHBkZH5+ihsOsFhB8Lt5F+/M2M962InquTOmWOnGJ6Qa8
	=
X-Google-Smtp-Source: AGHT+IHQy3fZWkETQUz+ADmGTiCDYmVZHqgVTf9bwDB3nMe6M4arGs9f7e2NBDChoCYmieC+9dznyw==
X-Received: by 2002:a05:622a:50d:b0:431:2008:8c6d with SMTP id l13-20020a05622a050d00b0043120088c6dmr8477357qtx.64.1711383549805;
        Mon, 25 Mar 2024 09:19:09 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id a5-20020ac87205000000b00430bd60afa5sm2727119qtp.48.2024.03.25.09.19.08
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 09:19:09 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-431347c6c99so487271cf.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 09:19:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKHeOeWF07qQRWVEAuuB/ZhkQjIHRk7b47JNf2A5CFGRIVjtw+nFCD26RfYehSvkRyhY08ZkjRgK1ZfUUmNazkN3rPojxmSWjv
X-Received: by 2002:a05:622a:5447:b0:431:4eea:ef20 with SMTP id
 eo7-20020a05622a544700b004314eeaef20mr283279qtb.16.1711383548431; Mon, 25 Mar
 2024 09:19:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325054403.592298-1-sboyd@kernel.org> <20240325054403.592298-2-sboyd@kernel.org>
In-Reply-To: <20240325054403.592298-2-sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 09:18:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vo2vpemyH1ChdHtUdaeKnGckBUeqKfL11xn3WsN5+BUw@mail.gmail.com>
Message-ID: <CAD=FV=Vo2vpemyH1ChdHtUdaeKnGckBUeqKfL11xn3WsN5+BUw@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: Remove prepare_lock hold assertion in __clk_release()
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Mar 24, 2024 at 10:44=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Removing this assertion lets us move the kref_put() call outside the
> prepare_lock section. We don't need to hold the prepare_lock here to
> free memory and destroy the clk_core structure. We've already unlinked
> the clk from the clk tree and by the time the release function runs
> nothing holds a reference to the clk_core anymore so anything with the
> pointer can't access the memory that's being freed anyway. Way back in
> commit 496eadf821c2 ("clk: Use lockdep asserts to find missing hold of
> prepare_lock") we didn't need to have this assertion either.
>
> Fixes: 496eadf821c2 ("clk: Use lockdep asserts to find missing hold of pr=
epare_lock")
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
