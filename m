Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476081494B8
	for <linux-clk@vger.kernel.org>; Wed, 21 Aug 2024 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724254522; cv=none; b=D4zzGChX4ugbeLWPVMM9YsRkR2vc9B+spEpjQrjaU5GcLhHFqwtZXSvxiAda0wcHj4EvLJCoVyXSojVSh0JoKII1mJ7ZNFqF8uS5heVjINgnFWA8UZKZHFTSnRYnzhMNwEJfN0DW3UzBBdwJKKuLg3rB9I4vyr68ENxaS3CgySE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724254522; c=relaxed/simple;
	bh=q0aRixnhWUWpxjM3Ck4bjrpb4pe7AI96MxRCxkxtVwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLoHee6cGeZZdJTeVXuz8w0jU8fTehl/lOVHXrXwLxfvWLyWBP4XcBb0swf/NucJJLQLYkfjM8gKrF+RS8+jrYiyGqJxDssQuN6SRuq8yaFzFSvjNFC0D/0x3D1TZ/7+3yE8/gt2ROPFKot2lg2194ZC16Ou9p11YEYv8lqqIwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXXsHuD8; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXXsHuD8"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5d5e1c86b83so4354881eaf.3
        for <linux-clk@vger.kernel.org>; Wed, 21 Aug 2024 08:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724254520; x=1724859320; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B92SIehQD/sLMBWjePhjq8cDV+wlqZQrnnvx6Bm71co=;
        b=PXXsHuD8muxBu9u7zISm/280RncJXoB7bBQbyDhwKHMlVmEuc/BCXqyh2l/i57uE/H
         fpA0qchv5IyhMZIan0fgEzcAZcB/cWP5FeWguolLSMb2v+S0C8all8ZwXhn7nMJ+24a8
         +q+KEW9xVxw8iw/rgxJWBU4jhIzCq6IqGfySZtxopgBw3lGHYb5Whvsab6tZFiBB9cd7
         t6IGpxGZy6VFgsRrvIvl4y71yJKjoKpvTyNgLZSwi/fkoylfhwmdYtyL2pk9QyjUKARH
         KrAbnMOYPY3YERhnibbFt+PRYgrdnD0rNyeyNIMvMKj4UkARHddu0WkZa4KrzRybg3K8
         zcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724254520; x=1724859320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B92SIehQD/sLMBWjePhjq8cDV+wlqZQrnnvx6Bm71co=;
        b=DzabPvgDgEpdbirkofPF9K+LVg9owat6vcL/zQ9xT8+H5epDADebfwcxE7uvYrhJFn
         MEEaaog1rAX/9JwEQ0+IrxUrJ6fl94F4kwWjBpR7SZ5e7kAAbC/4CsngN//fAzGpBeHV
         lUcWf9h49OoqkwnY62TdKGdWh9rl6FP5HMnLaPncdT9875SmPYkW9fikx3UpvVbJQGlG
         2PBMsXhyv1lAUw5pvPtVr3AZ4bzpyL9PKk2p03rvVfmkYa4VOeiuKyp3C8NO5UQQw61x
         EM+KahlhcSc72FczjxOJe77/SwJK+ZPUrvZt0jtZq0kDuCPmfI+SnVzY0rKX24AKGfKX
         eqoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi0Y3Ydm5peFsXi109ALWzM9Tf1Ui9xaNxLmgKtl5JMBeQZKSp6vCQXFTsB68AGnR2HnppENSVs78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnJn22bE9dK56wtjuTWvsYPZ8Vw0WQbn0HfAgWX9nfGXslR8sT
	LH/BBnyP9zCjLLy8YO0pDwAFdaGYWQmAZGp7teg/+siDfehnmYYdqcqK0xsupXoFuYRqtiqrDaw
	quNzU8/VAVIyzACBCF9OD5pF5z2xHXv5yKQa1nw==
X-Google-Smtp-Source: AGHT+IHtjLVFoilgrnbbIQMVwq05/DqJA4CW2+AENaI/70z5AgIJxpdFSd6TduzT2Mi5cnCvDMGVL39BMCO82c2hHq8=
X-Received: by 2002:a05:6358:310b:b0:1b5:a060:678b with SMTP id
 e5c5f4694b2df-1b5a265b26amr290392655d.3.1724254520067; Wed, 21 Aug 2024
 08:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819233628.2074654-1-swboyd@chromium.org>
In-Reply-To: <20240819233628.2074654-1-swboyd@chromium.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 21 Aug 2024 21:04:43 +0530
Message-ID: <CAMi1Hd3=1S0Jktej0vv0ZJna1Z=Kb6WHEzpbxuHFHdCaEUKWrQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] clk: qcom: gcc-sm8550: Fix shared clk parking breakage
To: Stephen Boyd <swboyd@chromium.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, patches@lists.linux.dev, 
	linux-clk@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Aug 2024 at 05:06, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Amit Pundir reported[1] that a recent commit 01a0a6cc8cfd ("clk: qcom:
> Park shared RCGs upon registration") broke USB and audio on sm8550-hdk.
> These two patches fix the issue by skipping the parking bit of the
> shared RCGs for devices that can't run so slow.
>
> [1] https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com/
>

Thank you for the patches Stephen. This series fixes the serial
console garbage, audio, and USB-C host mode regression I see on
SM8550-HDK running AOSP.

Tested-by: Amit Pundir <amit.pundir@linaro.org>


> Stephen Boyd (2):
>   clk: qcom: gcc-sm8550: Don't use parking clk_ops for QUPs
>   clk: qcom: gcc-sm8550: Don't park the USB RCG at registration time
>
>  drivers/clk/qcom/clk-rcg.h    |  1 +
>  drivers/clk/qcom/clk-rcg2.c   | 30 +++++++++++++++++++
>  drivers/clk/qcom/gcc-sm8550.c | 54 +++++++++++++++++------------------
>  3 files changed, 58 insertions(+), 27 deletions(-)
>
>
> base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
> --
> https://chromeos.dev
>
