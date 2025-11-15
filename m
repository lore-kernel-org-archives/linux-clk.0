Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C122D9EF8
	for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763217642; cv=none; b=l2RhCWIxlb9CwOdwXmnD711+Mfh1zNuV72z1dqSUahjV9eOOgjoMRmybXNJ6I2hS0R33fQePUks+idbWoyGT7NR49oQ2XrWYapqpXQGHa/bGEeY46KnrluP4QiwycYmW+8TlJz7kw8fcOw7pLAs6AAvpRdRLKSKvfsNYh4c34BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763217642; c=relaxed/simple;
	bh=Sue3DiX7aivO+CREJvjgnQK9H3Tgu+sLekJRMaXhs2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjYntRLXQMj9XYtSHxMKBPO0V2szJ9mIhEoNksPxmcuF2uLdfzhMszTD56xUgXJglcRfrsLNUlTDHYp4/sEBF1zDTLt6A+zbI5sLfhsjIBsUviinrD2RA0W3cpqf6PWVQ2+Jw8vQ+XVu8a6apiI3DAIm7/ILEQPzy3pivnSGse4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0/xhHDg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0/xhHDg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FFAC2BCB0
	for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763217642;
	bh=Sue3DiX7aivO+CREJvjgnQK9H3Tgu+sLekJRMaXhs2A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=e0/xhHDgEpX+qvo7bt2NtZv5UqTwljM9yOhKZpdkAEjBUM/ShJdiCYeeHS/7b7SxX
	 92+m8ZKs7jgCkSuh3UkznDZr1xEAsyG74Sc7dCYxkBAWNM8HKEnBKmvAFe1Wg7UUTb
	 biszcCcyjJEStaxmYowyRm8QtA0EM0qdFrGhCNxDDO9NIF3+XvwCwhDr44cu67si8I
	 sKLwwavGlzx6cVI1LcIkODzN2NcwLMaOt1pCPLG6ZCMdmkegCQfJIYqA1Mhm0WJz50
	 DbMkNJ+wNgcIwmtYz6t0A6XxUiQ2nWAhNNu4AfSFNsmD6YN7MqXcUwIRVRKCUyaOdo
	 +iZATXqNGxOqQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37a3a4d3d53so26187461fa.3
        for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 06:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlVmG7CCMWxoUH4KyMv9qMSncy7Cv6kYKfb9xvnESvZn4hlZ9F7RndDEkLeZ3WdyCUqj3KnNs8saU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws8txakNUTPgVxp/78J5ygiq8NrdVq+KgGeJ7ocGfzHIifugmU
	f9tUvycMwLGc78HpXzmMt6eXhT+oLv4yRNQxvpnVnctnBN5A4quRvfXqzD3b/d9cI2Pj0NfnKeY
	VuGstjJaqJHk7x39ZYFgrABLzk/PjjOU=
X-Google-Smtp-Source: AGHT+IESjGE8+0xVTH/QjhjF8+obf5TP9Oc8OEClkcCl8dEd7PpJQsH5CVoNDaeGwAe6R1UChVfXuLbguHAeh3ulKxU=
X-Received: by 2002:a05:651c:41c8:b0:37a:455e:f302 with SMTP id
 38308e7fff4ca-37babd5cb6cmr20120411fa.27.1763217640107; Sat, 15 Nov 2025
 06:40:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com> <20251115141347.13087-3-jernej.skrabec@gmail.com>
In-Reply-To: <20251115141347.13087-3-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 15 Nov 2025 22:40:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
X-Gm-Features: AWmQ_bk6LAUI84UIq1LoT1dh5454sL5SZsNoWjCZBYs2iLefOyWq2c142CwfOnM
Message-ID: <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/sun4i: vi_layer: Limit formats for DE33
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> YUV formats need scaler support due to chroma upscaling, but that's not
> yet supported in the driver. Remove them from supported list until
> DE33 scaler is properly supported.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

I assume a fixes tag isn't needed because technically DE33 support isn't
there yet?
