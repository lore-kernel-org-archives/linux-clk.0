Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE0E2C11D7
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 10:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213767; cv=none; b=RRRrD3PkcIteew9fHsd8FGyIpiEY5Buc3YMuRqEOOMkGNt10/1w1jvC2bwoRTbZTTysa6tQ+ZGyDLY7969e4bWZOBDE6FTT9/Rz+zoxN0Phw2YKKvbAgv/vXNsl5tu9hEnlYOqjWAAymW2JmbLxoZFXL74PNkdGLPJtKkgu+M3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213767; c=relaxed/simple;
	bh=tMfRIGG2xYipzsFk8tYUj11xvR+6RtJic1LhkCQRQUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UlahriBNK3iqzMAumthHPxCWc3zBXrUlTe/a8hA2L6Rct6OsG7XSVy72iy1FOLGmNF8HKbbBWklbif8QvSLZh4KuVwlPK9Uz1xP4SWcxK1SFzYysDBgZJvKqZMb9OL40LOhZPe68Twn0hf9vlgQpRALWimr90FA40/wrfjueQKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3rQwEKC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3rQwEKC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F2CC2BC86
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768213767;
	bh=tMfRIGG2xYipzsFk8tYUj11xvR+6RtJic1LhkCQRQUA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A3rQwEKCMTArBMdb7Uu1qKy/LjI1JbsTuUBaGq9SLOfOfrtbekF/pT+lJjEwXwnVn
	 /sWccPJx9MDxNlKdgZ00MFFoUmxbOBuUrJ2CYS8eixb+nhw7zuabVZYEHSbOx5vUa3
	 OIDfWcCIypYNSd/lBzIxHMLVasQaPyLeCOJtFor5tFiKgEpi0X4itDEtvq3BBcMPrf
	 sbRN0YjlcZGFqAHJQL+NFLadB81sgK8CEE94bzJhjfBG8B/IkT0so/Giv+ZcDrZxO8
	 ux3ImQV4uV7O6IWWpgnEDntwNVS1ePuGzRxgHNZYlCUGKUuriOqdojv3zZGFuxTOfc
	 t6tePr6QYZOCg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fa0dc9f4so51325991fa.3
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 02:29:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+azgW951U7Ql/G1aL9p6XxKN+Q3nsHNptweE50QLybum00eKW2r7PFmmW6broYv1JiASZ6vatVmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJQqvuNXdZEN9Zch6HGQeGwJ1gAp7AYmtcvv6vC9id+iG92QtT
	Wjez7LDTcKyiaHRZ5MENxic9n4DnnFYXeTHBpi7NmtnLK+k7yQEMs6Qktw4s4cKre/KDNKM2h6J
	LBCSn4zRDAHFvtxASGWZxio8iP79/j+gfX00kqm06Aw==
X-Google-Smtp-Source: AGHT+IHOMNiihVsQqSlMQKy2eht583DN76DmMlR1CjX8bHD/Pn8J9H7axTGtSnbKt1s2aTeKFtrMsGxBZegYZ0gbz3Y=
X-Received: by 2002:a05:651c:198d:b0:383:246a:74ec with SMTP id
 38308e7fff4ca-383246a7accmr26670981fa.18.1768213766153; Mon, 12 Jan 2026
 02:29:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 12 Jan 2026 11:29:14 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeFt7nWt_nMtHzVtXTQnBodOroT3jX4WTHFX-q7MsHiDw@mail.gmail.com>
X-Gm-Features: AZwV_QguRZzql2FHZgAwUYvea5idL_4oUoJlRPxd_dhQm2N_fFaDLJSpxjBuN3c
Message-ID: <CAMRc=MeFt7nWt_nMtHzVtXTQnBodOroT3jX4WTHFX-q7MsHiDw@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: don't select clk-mt8192 for all ARM64 builds
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 4:06=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> This option defaults to y for ARCH64 meaning it's built even if we don't
> want anything related to mediatek. Make the default condition stricter
> and only build it if ARCH_MEDIATEK is selected.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/clk/mediatek/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 0e8dd82aa84e..2c09fd729bab 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -820,7 +820,7 @@ config COMMON_CLK_MT8192
>         depends on ARM64 || COMPILE_TEST
>         select COMMON_CLK_MEDIATEK
>         select COMMON_CLK_MEDIATEK_FHCTL
> -       default ARM64
> +       default ARM64 && ARCH_MEDIATEK
>         help
>           This driver supports MediaTek MT8192 basic clocks.
>
> --
> 2.47.3
>
>

Gentle ping.

Bartosz
