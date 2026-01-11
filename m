Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E62E1F7580
	for <linux-clk@vger.kernel.org>; Sun, 11 Jan 2026 05:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768110548; cv=none; b=GEt/vrn2/5TewxQgTWi9uvOTJwtvhDr+cSruWrw+b/EPFBnGMKRZQU8oAyXrUf1TY0QLbXlKJTTa4stlyU2X4+/o564Z+aoE4zXsNvga7l0rstwelkDq5sWQmkRQXrXrxa825WLNPF7yQeSJtL/GlhZB/v7KUNkJRbmCmUUSU1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768110548; c=relaxed/simple;
	bh=f94E4L5SmOeYb1vuZvM5qXnRI7kcqN1FAuqd7C/lzvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZcHMnCXpSTFHD/xFR1S/7HWcUFIb9+zFeOj+lnvprxj8Bgm+QXLyPVTRzf3eaKUnJOW0XHihgX8v2z9XE4m/EvhnzfUgsdkimHdMuUxrrsfj0zjhA9ymAPuOKRCCIK7O+8zlC3Er9lVncCyq88NdH9obcIg/T1ex6o4yk5hN00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSMNRHZ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSMNRHZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE00C2BC87
	for <linux-clk@vger.kernel.org>; Sun, 11 Jan 2026 05:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768110548;
	bh=f94E4L5SmOeYb1vuZvM5qXnRI7kcqN1FAuqd7C/lzvA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=aSMNRHZ5j3AcO1XeAGNJ8+gKTPCzetHopv/xYqLz58Z6WWIAoJuKNDplKefAPOeuO
	 /l6YWX8xNFQQHGn0klICwfP5+EOrSNlE6aBgkoxDBsEbxCkqNM4q5liPDw/3nCtILs
	 9jcxCmOirLP5DzYG/cQU5B/5kl5J3cnzxkzmADK8w1dI23iivJkWsqYzquugD79m2Z
	 +tfbhVb0tXc6yG56Lbf06oLoinMo68CWg7cQU8xjAohdQQNyOfXnojvAme9ysC5yWL
	 wmEE5TnfxxHi490zu8CJB2E5pehy1Mz2wgMpQcMq/iwFER9vzZYdYnqEWlvBU1oD2C
	 PbjQlhKKLTaow==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38316445a67so20093091fa.3
        for <linux-clk@vger.kernel.org>; Sat, 10 Jan 2026 21:49:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUChWkma21S1aEuBRHquMo4oF7oSQ9ndxoHdSDeNyidaNYNVkRwdUDVwxLmCRsKpbb/a1f90SusAmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWc9Pt0U3Quh+fjAzphE4Bb/naFHJYEmkGk6PkI69COdo3aq06
	rrE/3xl7Y82AwnX1USdZX9et2xslQSK1SIyAr0wiOyRKC423sJU2zpOnA2Lud7HgLHTOdNuNj4E
	WQ1h2EIdT6xRMWBsfoY9TaBC24EKDBjQ=
X-Google-Smtp-Source: AGHT+IGrD4yWVyakk5sWnBK/I/H1GUL7zKBVZOcSN9AR7czy2ZBJuisGO7mjKMC+qA1D0w16r+zMrBNAHJe06lQ7mTY=
X-Received: by 2002:a05:651c:30ca:b0:383:1c18:ae07 with SMTP id
 38308e7fff4ca-3831c18bad0mr22169581fa.41.1768110546185; Sat, 10 Jan 2026
 21:49:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com> <20260108-clk-divider-round-rate-v1-2-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-2-535a3ed73bf3@redhat.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 11 Jan 2026 13:48:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v65idCaa4ixAytB0Dfa_4ivc+AQ-c6pdbzQNAnLnzmipGQ@mail.gmail.com>
X-Gm-Features: AZwV_QhR5DHEaFlzpd86lAqTlAj0_MLG2seSom12NCHQycmMQplaKdXkzaZfMOk
Message-ID: <CAGb2v65idCaa4ixAytB0Dfa_4ivc+AQ-c6pdbzQNAnLnzmipGQ@mail.gmail.com>
Subject: Re: [PATCH 02/27] clk: sunxi-ng: convert from divider_round_rate_parent()
 to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 5:17=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> The divider_round_rate_parent() function is now deprecated, so let's
> migrate to divider_determine_rate() instead so that this deprecated API
> can be removed. Also go ahead and convert all of the driver from round
> rate type to determine rate that accepts a 'struct clk_rate_request' to
> simplify the overall driver code.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>
