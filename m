Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74083AC0E6
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098735; cv=none; b=FPoryeBfg3zszUurfcqwdBNG63QQq8gweTG29a4RRrNnv7UUzMqTKuN8a2lFjSOE16OURliaVd5aZQZQ5+UZxBHwGG92UqfWS2CZj/sZym7Zk1MtgxfIQw47UmQbdZO6u3VIx0PMUVt09putfymx05F8by7o0g5IBrNm8RRHr20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098735; c=relaxed/simple;
	bh=LiDPD502aNFj7TV1fAchY59EExnmYWDT1KIERp9pxQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKqlszroxnmMF2D0TYZnR9WglC7MrIMIVb8PpGQxoBPSGafqB+n6QWKUPBrT9rj+iGHOdfUnLbjKqWPYX+Dt/1RRdb9vNObW9CvChvsDPEuxFzGxQOvGtRfw9/5xqFdG9eUWt2LzblMmE+T/d8V1dVUhymNsRNYcHPov4osCUvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2or5bt2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2or5bt2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7CD1F0089D
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781098733;
	bh=LiDPD502aNFj7TV1fAchY59EExnmYWDT1KIERp9pxQE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E2or5bt2rvXSetk1M1A6hE+bIwWXM8k5QSDOnWK4clnYp2+FfiNst2Eh0tpDpI/jv
	 8fM8Hsmf3i8R6Kzq/aoG+zpSw+O28YJ/dHFXHPO44knvS+RikAsYRHaZkw01zhc3TY
	 5Ne+c8pnPurZkfUxi+Bxct6S+GckeY9+8p5gWOSmTQ4KY49SqWzHK4shZePkqi4Tdk
	 ldo+WLOgUB6PPZPS+IT/5nC9JilQtXGoLcRn4OJYff1CJ+lKcH0DcC00mweB4Wfy8E
	 hv1CWZe49rumYdyBB5TM9rJwWczC5EZAwmfmmHBGWMrc7hYhBceigEaFxQ3xibQRPl
	 wmr/C6+xJCaVQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-396775c26f9so61541761fa.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:38:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ84UBDiObBM0KMsZAM4h1qJ8pu6R17eqBh//ZHUZD4ZxVjF1xA4wHofrGFFx3xz+PwOxtCWHawrtHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRfkUlWqm8fp632OFoT8Z6yKiY2DJd3cX1VM4Y1X5r+8s5m9sD
	Ih33sj5ktv5rIFfiUlutlutL+QuIfdsAjCpwOe5oTEtwqyI1qlM1FG8rRnLHmHBD0NkVSBv2UtR
	fnIOWGVcV7byVy783GFfHpNJ8UySQ8ck=
X-Received: by 2002:a2e:bc0f:0:b0:393:a37e:b131 with SMTP id
 38308e7fff4ca-396d079d2e6mr65556041fa.9.1781098732456; Wed, 10 Jun 2026
 06:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602062927.467249-1-github.com@herrie.org>
In-Reply-To: <20260602062927.467249-1-github.com@herrie.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 15:38:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLmu257Dvc28pR2zWzR7QVC7ALTZ5YTogtXpwuetMm2gHw@mail.gmail.com>
X-Gm-Features: AVVi8CcBl1eEu1t1aSv7SadamVzIrFdhwp6YSvRQhe3eZfWTWpyUG5I-wUmdWy4
Message-ID: <CAD++jLmu257Dvc28pR2zWzR7QVC7ALTZ5YTogtXpwuetMm2gHw@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: clk-pll: reject vote enable on orphan parent
To: Herman van Hazendonk <github.com@herrie.org>
Cc: sboyd@kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 8:29=E2=80=AFAM Herman van Hazendonk
<github.com@herrie.org> wrote:

> clk_pll_vote_enable() unconditionally feeds the result of
> clk_hw_get_parent(hw) through to_clk_pll() and on to wait_for_pll().
> The common clock framework permits clk_enable() on an orphan clock
> (supplier not bound yet), in which case clk_hw_get_parent() returns
> NULL. to_clk_pll(NULL) then yields container_of(NULL, struct clk_pll,
> clkr) -- a non-NULL bogus pointer pointing into the negative offset
> of struct clk_pll.
>
> wait_for_pll() reaches for the parent's name via
> clk_hw_get_name(&pll->clkr.hw). Because clkr sits at a fixed offset
> inside struct clk_pll, &pll->clkr.hw cancels the to_clk_pll offset
> exactly back to NULL and clk_hw_get_name() then dereferences
> core->name on a NULL clk_hw, panicking the kernel.
>
> This is reachable today: gcc-msm8960.c and gcc-apq8064.c register a
> pll4_vote whose parent (pll4) lives in lcc-msm8960.c, and the future
> gcc-msm8660 pll4_vote does the same. If anything calls clk_enable()
> on pll4_vote between gcc probe and the LCC clock controller binding,
> the system panics. The exposure widens as more SoCs adopt the same
> cross-controller voter pattern.
>
> Resolve the parent with clk_hw_get_parent() once, return -ENODEV when
> it is NULL, and only call into wait_for_pll() with a real
> struct clk_pll. The enable-regmap write is also gated behind the
> parent check so a failed enable cannot leave the vote bit asserted
> against a clock the framework has not finished wiring up.
>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

Sashiko complained, Herman fixed. Obviously a job well done, so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
