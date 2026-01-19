Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF66B38A71C
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836177; cv=pass; b=rIqZqUi5L/6cOcdgTOA7jxY9hxU8cCvgTx1hHWge8dK1Ed0iEkC/45fqpfcpuLDX6cwPnoUNX16FCUwQ+cLNoH69eUXgU1fr4GT/3HktjWRGrrccErWLXEJQvYVEM5dQW555FbQJa9kozV+m1+eu0aqDmBiy5TjVhanQfnixSt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836177; c=relaxed/simple;
	bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3igIvzeVDCGp/S5aPR/QbkVkYcmDglSpBuOjbOX9hyi+xJ7AVz0w1kj2mZljUoIYjjmyTZQ+vDeELQBgszVxr7E98DGdyX/5aaaM0SDgB8C3j5fnzSZB0SdVZlCpqy2C74DuT4hMZ04kfXPp3nu/08EPzdoOWYXj7xGf8M5RoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AitzS9lM; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AitzS9lM"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1232de2e2c6so149751c88.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 07:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768836175; cv=none;
        d=google.com; s=arc-20240605;
        b=O4pkF1gSvOtkcuPf7rVldKz6C/El6O/9msaXvnc5qejYdJD4r7o5HMbWWFiy48iZX+
         LzouXCZJuj7/XXUOYSfAMWlbzdyBTgnNZ5bxUCJGQD4QtpyZsIOx1ZbnNI/r3+9xLvue
         /9dN0+aL4WBPnfk+QX6SYoDYXm1K28mC8QKkbyorduoSQFS2pOm+2BsO/sKhZ8Hv8Sqm
         4qKy4op7oD0jczBhD4dGKAu5cpVg5HwwPf/k+9ryM/j9xfTGEIptudyl2JJ5IwGYnSDB
         pk6uPohZ+K7DvjYcl40iMofDpzstHhyOwqoLahpqcezO2nsRM9o8VGOT7+veSL/FQFU6
         wxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
        fh=xYuZESspLVG0+o30eWnTA1VHI8msZ2bPSQrpsoWjTgY=;
        b=a1OFWBDmZAWclntwmauwlvpZbzOGZfO/dnL8SY50XrnJoSU1FulZDOFqTiyHFMMToI
         OCGpkZzsazKd+JAJIN1G9HWvmrZBYslVOvMAxBQ/YyABeciF8BMi15JiUeMmelskrQIS
         HpT+Umxex7wqivVAqXjt16foOBoBxyywnISB20rpRGQK1rjeCigMBXYA6wIzrYJ2VSEr
         YLKFg70Trql6Q1NoYQLSbpS90WOlvvhVxG2HImfYyt8/tb6VK/cs+Ft4UlpbNC0rrdWE
         OO1yYaiCu+gxNEM0rAtq6JdCzBJEOcIb5jHNRmvFt2jXiJNnmjoIdpgZbuPOr7JCDRXv
         ngUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768836175; x=1769440975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
        b=AitzS9lMQwv4+fdWYBLW4qMQFvS0PfAesTfFeFGvl6x4XWg1Y/WFr1kTmFIDODAIrT
         OsJ3v6RHnxP8T7v/xmPcJA9AvmSAxKKeK7k/YTdlf8rSOfSNqEiMrZUis1XRsW/5TFTU
         I42ndpD/s+RX+n1G75OsTnYR92yrNDKQa7Nlb3Iym2/QxjJu8vwbU+7Wp17DxDeU4wDd
         TmMjKSlZsub+p2JSB9288ug/ipPwFzsDd1Ni1l7h9CtWRRnodPCrXHzd07aUIb08+ovj
         iFcB29jKkC5RjVwPsgTsq5r8E/m5iWgLSgdd9oXoJmvy1qA7PSAHVTb1Hhxf4ctF4H9m
         Pvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836175; x=1769440975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
        b=D71u0HM1DER8wLX4ScQ/dG+Tbk6UqmVc275ZFnDQppJomU6MekcmASTtz+Cm6GdEpb
         nD9QVMUoAASVqYvLh5M/oK5gjB+Y3dzMvnIO6aXK3uJRAn8rrS/qk7xrgWIXSjgOZkYH
         Dxq51DzcXZPz07kx5t6sFbEzpRqwBE0m4t+naP2db16RCQSpeL4OnmnDvSsWnOqWkyyr
         vQfyBsh3zeBfFZPeRVDKVLeJPLmr7w/QBa7SSJdUun6JRJlCWDF16uHNJNEOuIHsGTMY
         E8eSMdarq7cO2Xy5/mEJuqawecoUHzSQGYokFbgTSqEYWbI43yfF8sDE+kIsj+AlVkgK
         ljJw==
X-Forwarded-Encrypted: i=1; AJvYcCVd+9C0AMqM80O1tnZo92awYLPzx2DfMTZHpiHqq7VFd37Xhefj1rOa78Ej4ApnBLY5QLC3b/Wgio4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwayATBNkggV+BH1/o00kkCElN7AgX/wR9H4mX0eYJaVi8Udn1M
	SUC9AAevSxHC2jdrz0C0qzx0sDqnfDMe0FMcqMoMCZGKlLHxzp/gKHXQNrcMQsFtbsAEf4S35mT
	yjHObA2elL5pXiQf5xw22h0Y7UbVjxqs=
X-Gm-Gg: AZuq6aIxjKXMtR56W/ZBRAyGxKq7EDcshr2j66/qfdHM0Q08xEbi0kpg+LvhNN4vRqQ
	XuxifqEG4sZjtBfqxzAHFgjiNjf5WBtAQcnj35ShhxQctGAQxiB6lzs/1qpZ9BW8hOJnOkRt6dz
	HYdEuu1KTvE7CH2OU8KNBxcyhdtFfXz0xZsKzEbgP7tdZrJS2veRliILMrrauXoR95CGIe6kiZg
	1vYuLhrT6VnAgz/dyro8ZxpUUrVL4gYSFt+jM6crT0GpQQ54O4fRZv/rNB8NDlzz3toNmllq+0o
	YvvO/41xTnIlkadJmMe6wlsvgqaaBQlWKFtBqlfsyvWDyKeM8IH4h5a+SKTLOrp56fhae8RmKFr
	39WVzx4+27nof
X-Received: by 2002:a05:7301:228e:b0:2b6:f613:74e6 with SMTP id
 5a478bee46e88-2b6f613797fmr27366eec.4.1768836173425; Mon, 19 Jan 2026
 07:22:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com> <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
In-Reply-To: <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 16:22:40 +0100
X-Gm-Features: AZwV_QgNN_SRIlYoHUy-qlXXeVjMEAqzZugkTtOGHbXvqJ3qT7hNtgfXtF3Q8KU
Message-ID: <CANiq72kcRQShDgMJKZ+ekUEdP1T6Jr=4PDiMJCqnQjgCQEK_eA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 3:20=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I guess it's time for me to work on a `#[sealed]` macro...

...and perhaps pinging upstream for the language feature... :) I added
https://github.com/rust-lang/rust/issues/105077 to our usual list of
wishes at https://github.com/Rust-for-Linux/linux/issues/354.

Do you think using the linked crate in the commit message would make
sense? It seems to be a couple pages of code, using `syn` 2.0, which
should be fine now.

Another option is a "good first issue" of medium difficulty if you wish.

> I wonder if it makes sense to add a general `ErrorWith` type for errors t=
hat
> carries error code + data.

Sounds reasonable...

Cheers,
Miguel
