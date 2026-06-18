Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3737E3ED105
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779232; cv=pass; b=suyn87LnGm0FrpgUZBKHeuxegUr9lyTHJqbF+XjJel7y3/SuxI7+mQLIRRNDpb2jGb6lR1THzgjsueQo1JTJRoX1xpzVvHvg//0iXeNRnLGxxwqnOIEvTYWIXBHr/GfWgW5Xx6+lRynQIzoU3REVLw0ibIahQTV7h+wre89nWZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779232; c=relaxed/simple;
	bh=yhUtjbZV53eJ33+I5WWMx1PK7EZ98q+cI9GUW0pweEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFtfvzm1gwGlWQkqQ92SR2m02Z1ZwvpNr5GRg8aotNPWCZl7Dv0OUMKLPKfuRqYTXx/pecElPt32di8jGkMZxc+20i/1WEbclgCKd/mcs9ji22+fZjwuRvwKzyT9VX4t3beEmE2pLfWbmRXvKSRTbbVV+KylLpe2s5sK3p8GGPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDW4jrkf; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDW4jrkf"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30bda2cb796so49098eec.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 03:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781779227; cv=none;
        d=google.com; s=arc-20240605;
        b=OhXvYDBIhp3qrcV+TipDkd9XHRLqAHUYuFAqNG+9riVLlWACYDGNCK/Jy2hhjPmaQF
         aqQdUy9rL4jOzewJp1ByoDkG5ZVH6De68hsS+5JF+XInWz8DCsGf7qlGY5RoPXw6xxeK
         7pQnIfE9Gd/5irH+pC8MXLEindcFKxrqvc58kddt8kCJgFTZUW5J63VSaj27lJBBBx55
         k0dPPMTqGPnhe9icUbQ57Y1Y+Ij8IVf96teOU1YFi/41cRengfAGS0Z+hrQD4fEiGyC/
         MrM2SMYFXXbWN050ZoCVQYDET8Ef6ZZp/pInI+n8gTJcW9zODj7fHGwkqo9q4UtjRwl1
         oDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7DUQbCb92xOvO01pv+r7iCHPQp0UAu27WllptLJOlB8=;
        fh=ZEcZGPOSvuJ2zd6qdeCGQp9WoUqJgXnjKAFC1eJuW5s=;
        b=X49T1eCh9FPCOw3v8ZK/9sUlBXeMPCY1ZA5dqaxmamxA2xr53exQ83cL4WScJ3L16u
         HsnpNj3b9uXzjNUzjq8fwaXx4vCm8TaUW4hs95oSFT37NUefDnuNjIht7sFcfzaYrrbD
         +SLc/3WkGniUzsmeStMlR536bFduEILgW1u2RJCQQIPJB9oUhr1GAmMXuxgnu7gGsykZ
         ARxBkohwvUE6FqIRH+FsWL/lk0o4qCPjumJMDd5upVj9ppKSthQ2G7ztDC+PEdquWMmL
         OA7CX0rGjC2hKJOsP7L+h7eltI0rUDJ9djvEtcrxPhHYYKbqGdQgJlnz9dSnnw88IfgC
         buLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779227; x=1782384027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DUQbCb92xOvO01pv+r7iCHPQp0UAu27WllptLJOlB8=;
        b=ZDW4jrkfk3387CIo4fAM4NOExN7ZA+JSUepXfBLmjVA+9FSYPSR+jjJ6jViBSqlURM
         S9V6LCLaqgcwgr9YDdt1Mgl6rSrPgLi8WYmsdwGZtGJJHr8fYYLDPOoydPJz4Ej2woKa
         VGi8nER7rddQjktBGGDNpeu/TaA3SWCVmWzCouZBHU0fSB6Sdk7+0DOLfMz5Xd9t+1tq
         4PPNM8eij0R9Mi9C35+amzk2T60DWvpon7MBlHRKPr54i4XVSTz2ulaIiuYX181sHbxm
         yTzCEmnhvbEtgMB/vBKfM7I3+8rtXvucGfl2SYuH7oSYFK02IzPvqvDmqj2hgddxeFNX
         K+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779227; x=1782384027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7DUQbCb92xOvO01pv+r7iCHPQp0UAu27WllptLJOlB8=;
        b=nMxHHnMULUUO3A89SBZqARpdSxr+9dcjT67X7e/7g+XdxwvgQb9sapbKSjb3vFFppy
         9v2Cx4ZE9Z2kn8g+v5xdopYIukV0oiiChYp8NNpZCxY9n9eKGBfrpbkV6jZ/Rku+GzA1
         dTzB89k0nXHiE/8PJUYSIep1fLa2jjkZSTJMQEDFEnSCtMMJLZk9JBEI6EWup4M9u4+k
         YLv/xUcqs+Qevk1PqXblS9pfzp8DxYpuWon+ykiqcNKzAi3XU3nNdqDnv73ClfUtgFjz
         phqhWagCQVnD9zTeZht26WCJWXYioUNEZ0Dl9ZUCv07LM7/LaThIuP+Zt3NxYpIoiAuB
         u3Mw==
X-Forwarded-Encrypted: i=1; AFNElJ92FZMyKWMwrRHdhZ0J8MnZVmx8S/bD+15kATnXIrP4SSjPGaeZSXuuhR1G6LhhoHKW8hLkW3JXSjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7+Kr8VgqMqjRu8qlf+BxRfuCFR5ZZ6P6XSCeBZ6U+0xNGxk2M
	8CRgmhuX6QS7rlst9VqELMBNqJkZqLdjnJhpYQck2Ss52vy0kJH3Ro6eEnJw8E36+7RdbIRtp9V
	p5sPQVXm4Ae7/D/JfI2OcYbpuAn9DsU0=
X-Gm-Gg: AfdE7cky367IDQThSHDxmRwiLAQQNKtV/BhyCjHMBnPsPX62DD+xxh0pMaltVHVESfS
	2Z40Q6iMdpv6BPiMcMzojefxO/5aWJhPNrx8gZmjSf53ecGgjIPnD4Gz5n6WeDMzplqD0fans7W
	sxGOZIoDBiTSdiGdDjmJCAdAb1iJ7bj5MpEQs/7kpzk5c60YOH8iSFijnPeLRbMpdngWM8Tm76G
	utgjzaYicdBMtVp3lXjqo654fM0KedO82piwTJ3CG7moJkjqpyrawUVU3JXPzFl4h2befppuVZA
	5nrCB4eB2qoB+bgAGPCm70Nyl3CWnmGXtNglKJuaBDGQt4ozUgh56mB7HbDhtsXzAOQcVvO4Nh0
	heYjI4l8cYTq9
X-Received: by 2002:a05:7300:ed85:b0:30b:c021:5045 with SMTP id
 5a478bee46e88-30bf09c4416mr1020403eec.5.1781779227291; Thu, 18 Jun 2026
 03:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-clk-type-state-v4-0-8be082786080@collabora.com> <20260618-clk-type-state-v4-3-8be082786080@collabora.com>
In-Reply-To: <20260618-clk-type-state-v4-3-8be082786080@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Jun 2026 12:40:14 +0200
X-Gm-Features: AVVi8CcKkRQ8t8MfiUD4gXtI1Y4DMiQAI7JLxiiYKqJ_3SsG98lF2VyIrlJ2k1o
Message-ID: <CANiq72myoVT9npyaB0pVvbJ1v9ELzw68uAvSoAkdJJX2MJQ=kA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] rust: clk: use 'kernel vertical style' for imports
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Brian Masney <bmasney@redhat.com>, Boqun Feng <boqun@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 5:48=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> +            Result, //

Since you import the prelude, I think you can take the change to
remove e.g. this one.

>          /// use kernel::error::Result;

>      /// use kernel::error::Result;

>      /// use kernel::error::Result;

>          /// use kernel::error::Result;

Similarly, the prelude is imported in doctests by default.

Cheers,
Miguel
