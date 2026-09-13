Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DB6370D47
	for <linux-clk@vger.kernel.org>; Sun, 13 Sep 2026 16:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789316372; cv=none; b=t7Xz6VSyXIWJon5/3UKcKvxJQ1mDECIxQE4W1XOAA0kT/tbQlIhqUFNxqLdmgc7UBsGqMbKdIjRlEaKyPIj/rOCExyhDThj5+S7umGvEHuk6BTwzEA2aLuyoRBjShxbvejN9WJ0Yq5uD6+gbLtmShYWyuZ9AUDv0qge01Dzxjy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789316372; c=relaxed/simple;
	bh=KIR3o+3A1UUmD5skg6L1G6Sxv8CKuaG86LXOpAPQGLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKmiQ+sKF52I9QkXvsmlm7P+nJ9dFZlA7SVJa7BBUKLYmqrmtDR8MzAzhD0qgJ08hoDjmv71itXk+bUi/GIH3/pFmmJAv1LMmF6d1/70SqkM51v9JV8GOE32WJl/omWU06FcCdVuc7eqWNv5pA7+LlBtfWJAKKgLjeOch83bpsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrfG23hB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrfG23hB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23121F0089B
	for <linux-clk@vger.kernel.org>; Sun, 13 Sep 2026 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789316370;
	bh=Gbr8BsktfR+a1EaDYZ2USzm9WWAfk0q22+veUNOHUVk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=BrfG23hBES9HcMNEMPteo3eYejy43Wdu2nWC8rXpr52hll/lNlurXrU9mfGSDWgyw
	 W0nTDpy8xyl+bbQ2cQmBm2qR7iZzbTSHhTUaapRVHjyEwpquY/MsEZnUMmJtq3Rmpz
	 /Y6hCsbJM0Z91M2Dh3sBVIWqSbotjcGRTNvhAHYhPm942bcMEZePsQj/SItZWtia+k
	 Lq0tG1Ns5lb0c/f42kgpHYYqxjt7SCFhrxByfFaiFdVcFspEFdR2nUOu8iEnfaaW8o
	 sJLtR1qEV2lT8Asv1Y80p2vb0P31K/L+gnZnnHsWSRGS9XEwYmJtWi4Xm8DRHyfokp
	 ShVJGjTORW/Ug==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff174422so10340681fa.3
        for <linux-clk@vger.kernel.org>; Sun, 13 Sep 2026 09:19:30 -0700 (PDT)
X-Gm-Message-State: AFuF++ldf2YrY2CAm/RKFTy8PfAwkn2DfOTJEG2r493oVdJR3TBKbY6e
	0CBoYk4/68bRneMofHxFjffVoxnjE7jjCByxhSJIsVhy/CtJEqXlCiiqcKHVQPYHdf9/z1m7s+I
	mhjghMqhX1z+g8paeg1QvuxPD7TQgi9U=
X-Received: by 2002:a05:651c:2121:b0:3a5:b187:c7ae with SMTP id
 38308e7fff4ca-3a5b187c8cdmr20143951fa.9.1789316369058; Sun, 13 Sep 2026
 09:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech> <178931616050.1372417.13697138134958064084.b4-ty@kernel.org>
In-Reply-To: <178931616050.1372417.13697138134958064084.b4-ty@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 14 Sep 2026 00:19:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v64p7ZoYrK=fpQ+V8ZiLAALqfrtKVtQYdmNq9KGGKnAX6g@mail.gmail.com>
X-Gm-Features: AcwNN1VNp8ZTWcZawmR5nP_tvFoqU5e4dwI7SMu7ihcAACDG16NmdRqwhCQslB8
Message-ID: <CAGb2v64p7ZoYrK=fpQ+V8ZiLAALqfrtKVtQYdmNq9KGGKnAX6g@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: sunxi-ng: a523: Fix single-divider clocks
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 12:16=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Sun, 06 Sep 2026 15:06:37 +0800, Junhui Liu wrote:
> > Sashiko pointed out two issues in my series adding clock driver support
> > for the Allwinner A733 SoC [1][2].
> >
> > First, ccu_mp_set_rate() generates an invalid mask when an MP clock is
> > defined with a zero-width P divider, clearing unrelated register fields=
.
> > Second, ccu_mp_set_rate() does not handle CCU_FEATURE_UPDATE_BIT, so
> > divider changes are not latched by the hardware.
> >
> > [...]
>
> Applied to sunxi/clk-for-7.4 in sunxi, thanks!
>
> [1/4] clk: sunxi-ng: div: Add feature support to M clock macro
>       https://git.kernel.org/sunxi/linux/c/da543a093f65
> [2/4] clk: sunxi-ng: sun55i-a523-ccu: Use M-only clocks for MBUS, IOMMU a=
nd DRAM
>       https://git.kernel.org/sunxi/linux/c/88735a2ffbea
> [3/4] clk: sunxi-ng: sun55i-a523-ccu: Use P-only clocks for high-speed ti=
mers
>       https://git.kernel.org/sunxi/linux/c/4b41d0ffa9d9
> [4/4] clk: sunxi-ng: sun55i-a523-r-ccu: Use P-only clocks for timers
>       https://git.kernel.org/sunxi/linux/c/b260db91603a

After pushing things out, I realized that I based the topic branch on the
wrong base commit. I rebased things and forced pushed, so the commit hashes
here won't be correct.

Rest assured that things have indeed been merged.

> Best regards,
> --
> Chen-Yu Tsai <wens@kernel.org>
>
>
