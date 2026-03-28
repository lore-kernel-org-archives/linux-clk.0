Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8BD276050
	for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 15:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712137; cv=none; b=bEYMSAiVsAgbvY0bKGOWAVEyU1yNZkEgoCDla5aOXdaQbkSiLty7Ip4zOAFPrfcQ70N/1A3dc+q665bgEsbSGtRNjW0JzdlbRvqYJ3wL40l7Jw9EJw5D0TkyCOHwMbyGCjl3twxz2ID7abdWrCnkMRbZiBufbA1tqGg72Kwb01g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712137; c=relaxed/simple;
	bh=BEU9rMTbOAWYA1FwR7F4qwNiCjzAb+HmPpFgx2cS7wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CV2B+q+GEuCK+2DehxddKZynMoC/uzyOfinqkUr8HQPMcXncl3H6EZiX0ZgP5JDvVSIVr8QiDnO3ib6wdirmignFdVGe58/iyY6Kxe2aL2RKy/MGJ3X7it+b771qc24UzM9rhN4HAzWfUX0oMtmX219n6IEW6KlhD5ON2TjhaVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEL/dp7A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEL/dp7A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA678C4CEF7
	for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774712136;
	bh=BEU9rMTbOAWYA1FwR7F4qwNiCjzAb+HmPpFgx2cS7wE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=ZEL/dp7ALWFVq0R4LeI3+PjU9Z+xCAhkf084ahncC7ZTGpjv37w01PwK5jJ4jhy6k
	 CzJG/7gcB1BhguUM6PeGmM+9Z0Fh/1fJHCtqDvbjXB8zrpAo+Osu75skgI/4o2l94H
	 aocyNX4jG5OAADJQ/NpVMUDAnGu8lreQgHBfCGJPWavA9zGhg5P3Dh++moIdwxSfwl
	 qv4ctmDwCeXDlE9l24TSX75SiPeCmOYaleD686q5G2VAvkrHBmbByTS2WvvYHlFkLb
	 U2zdbuRztex1vNiNoSwq++yMMxN1kduo1kFTGruWr2MYA4f0eQJmw5lgQn82U/6lOp
	 AWZesJu4I8rUQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9a0762ed5fso425698266b.1
        for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 08:35:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPcRIqrC+yaDZuVjFC2n/q8fU3LDK4srFn6Y73hoEK1mybxweE4RlK98veFSP9jKwdAtfsTSUF5MA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLbqZJ16RSUqceOZavBtlqgSzI9mGAhl5JeTIuGjZp7vqmiYqw
	ZkKhweuWO1MvixxJVTR+pLyafLgFDZf2I4ARoRoS4ArzW56WHNFVF1Un/x+Lvgz8OHouOk6kIpm
	UJ4CstG+6ikOq+qvR3idh/5H0aNaBfDQ=
X-Received: by 2002:a05:651c:30ec:b0:38c:33d1:dd09 with SMTP id
 38308e7fff4ca-38c653f91c1mr24155731fa.10.1774701616378; Sat, 28 Mar 2026
 05:40:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech> <20260121-a733-rtc-v1-6-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-6-d359437f23a7@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 28 Mar 2026 20:40:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v66YWa_CnSh1_rM707Lne4MF+imML3B5ad4TQ34hZgQ-tQ@mail.gmail.com>
X-Gm-Features: AQROBzD9uvYPfehFAvfWSqRC7-wZ99UgUGl_PBhFagiwx6384R3sEI_1rOb_K7w
Message-ID: <CAGb2v66YWa_CnSh1_rM707Lne4MF+imML3B5ad4TQ34hZgQ-tQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] rtc: sun6i: Add support for A733 RTC
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> The RTC in the Allwinner A733 SoC is compatible with the H616 in terms
> of its time storage and alarm functionality. However, its internal CCU
> is different, with additional DCXO handling logic.
>
> Add new match data to register a new auxiliary device for its CCU part.

This is probably incorrect, since you aren't actually adding auxiliary
devices. It should just say "add a new compatible and matching data for
the new SoC".

>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/rtc/rtc-sun6i.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index b4489e0a09ce..a58d9c6b917c 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -865,6 +865,11 @@ static const struct sun6i_rtc_match_data sun6i_rtc_m=
atch_data =3D {
>         .flags =3D RTC_LINEAR_DAY,
>  };
>
> +static const struct sun6i_rtc_match_data sun60i_rtc_match_data =3D {
> +       .adev_name =3D "sun60i",
> +       .flags =3D RTC_LINEAR_DAY,
> +};
> +
>  /*
>   * As far as RTC functionality goes, all models are the same. The
>   * datasheets claim that different models have different number of
> @@ -883,6 +888,8 @@ static const struct of_device_id sun6i_rtc_dt_ids[] =
=3D {
>                 .data =3D &sun6i_rtc_match_data },
>         { .compatible =3D "allwinner,sun50i-r329-rtc",
>                 .data =3D &sun6i_rtc_match_data },
> +       { .compatible =3D "allwinner,sun60i-a733-rtc",
> +               .data =3D &sun60i_rtc_match_data },
>         { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
>
> --
> 2.52.0
>
>
