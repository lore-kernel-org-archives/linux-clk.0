Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B79B35B65F
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 14:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524075; cv=pass; b=LLoUoIyTnt0uMe4mrr+OQrnJeXTnWSi0D2m7ZLcAkjJoTY0RDQuhAHrrkzXAoI5BQcjVYYZYEpDT2oexMYfl4j6Yfz8nFJI5iqxdqKsC/wKnR755CuBcfe6SSWo3bNqVKI3om1p3zrS2epFY4viGGMT/aHk62ehn+BN1zFFn98w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524075; c=relaxed/simple;
	bh=7jXWc5Y1W0r5wnDCFnW+ABKB1zQfFFLJhRvMaBRGPng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MyLpTIodFiHYUhnTSMNBKdXwc9Rrg/QH1QCpNVAAiSBy6zCXij4QjB3anHWocRoT3CJXXh9FOHs9w+1umdS8HHP60Ubsjk23tkY0z5V4yKIyUEGTmbmExXZVlepmR/eZgSmmR04LfcdZQpC66k2K4Ejv2zYVdrIF4VlTZofMDv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5lL26S1; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5lL26S1"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-124a7216c9cso1703c88.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 06:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769524073; cv=none;
        d=google.com; s=arc-20240605;
        b=ZfP+Gy+RUl22FYrpF/z4wtyKnRvwxobAXziJVZWAE4WeZmZOPql3OfPWPIVA/QUqiZ
         o4SZJAYVa8++B6C731iKfd8OBse95HV4Y1wtAY/yTKyQ5laenBfmTAqhTY5Ilzr4ETlG
         I8DKy1zxqk4S5FD8dYKmpzuMbcGgemsCKJAE1KsiiyLtcSnh7+Vu1AqGJFXFGHuL4BhV
         el3XhmOpb2knPBBUGPxCOWvYKM0vO1iVlLu4FUlLGG6eI8tJOUfXn96ctQTuMRLTcdTw
         mKCzX7EEynQKVln32GlBOBe+/1teri7ACCTEnjxMkYAfw39zgIbXBgAsvLcOVh431NPb
         k52w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7jXWc5Y1W0r5wnDCFnW+ABKB1zQfFFLJhRvMaBRGPng=;
        fh=i3tXk2SIW54gOFFudnQ0JdBxpr/F+MM9xecNXEqtqDg=;
        b=VMJ9DRJnQfuxaM0iyH72YXUEVyBWdV+1RVXyQ29Q8ZYZBqpw9StdAnNmn0+HKymxoN
         LgIpLUHq6cu56UeHlepfpfeJHDHpYwIQmQcoEbAtTVq/uWK3csPmQ36ctk8YDLKiqBWi
         uQ/tghUlRdd6LWkKtc7Vlr1AyApj5YWb1/i7Hp3w32Z5cw0v2v1bIO+8uNYVC4rNeFox
         1SMA6FQueJwsX8/K4XZkOPuQGOvXzBukw4544DDBgbj7tPIoUhhMiEQK0ojS9z49U3fT
         KjqWBQ940GW3yrWaTE24ZdBerlVE3fMQL3M5yVP+bNfLUNcIgfZRIjBKlhhP5HiZWKoA
         IRcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769524073; x=1770128873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jXWc5Y1W0r5wnDCFnW+ABKB1zQfFFLJhRvMaBRGPng=;
        b=W5lL26S1PQvsxl1axYxVbQq9Puo85xOommOTVgHHwA5gME0kzmxBL23mXpQXFbPZPF
         Yc3mAg7enjm/ozzqqAVT23ox8tTY06yJG5oPKxTGNRibTQaynOZM6RkNNB/pQb/Qfd28
         q7n5KBmEXiRVjDTB1cER+Ql9deKCZYc1gopAPBbHyTS7YPwOFMD19uDy+bH6oo4EgOwk
         Go0hXlNDfIqNsXT4Fn5InRtxN9/IFRN9rfxyxlKjW0/lvCrfh8tKEq5uc0QT84S3QJLc
         50ehJjzgsTe/vQY7oUSG8b26iwCpb7Ws+owIsKoeq6NGelQxibm//Z2CXyk5uN60dO9w
         Ddzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524073; x=1770128873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7jXWc5Y1W0r5wnDCFnW+ABKB1zQfFFLJhRvMaBRGPng=;
        b=mCaq/JCRTYFikIPVJc1uOp9Att80AkltJ4mZhgOFqSASTck2ksiBy2OJ3Uvt4xYsZ1
         VolzVX8vikAHyFx3ZiBNu0lB1AUtviThx0BWlJyg5bZj9Uq9PPDOuIWVUQi7WYTcJtwh
         Bd1ghNo2ZpM7vCer/Dk/PSn+KrRzKQuLhp3ThfVtP1CbjQJVN7dK5L7hOSEm5R5QNGg6
         TrKzihcyQFXdxL6Z5TfkCOwiAzL+3IVmtSSFGEARLlnPtNfF1Q5g07Bs3coi4RHDM5AT
         uXmhRHTWiaBJc4iEMdeYSMejDI7zDqVxwWSsUBPAFy3+8s/2Jdy2rp7t0SUqFlFo3tXu
         r3Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUe6F3T2ZxWIO91R00ezL4i8hHgSYizupFI0wXAHy7M/gZqYAJerfX2qCg+9drxPgbAm5R4rLg9n7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXtU34XxhR6jh4/dqHGAM2LnrG76uGMDli4as1/FQINO4gn4dw
	Xa47BTWwqNO5CzD8rBUY1pcqqeVN2h6z0Itnsr+Wd2MpKjnA13WelxbySW/EytS5fzB/1m3u30w
	4pPcog4pcq+7dnWVOXI8Kp589/qXEjEo=
X-Gm-Gg: AZuq6aIiVy8Wrl+38V9ZgQpPt5G1m/DrX4cHSjK15LNxJ8dx0bbOPy5Hw3PrzLJrsFg
	3axpnaXYTHSb60btvwG/8xmgcj4MlA1rO0yynsRF7QS8nRoM8xKpS83EpOZMMfVDjdG0M87fgYj
	wQGJnEHb2fiKPm6FDhXtKLaOGeC3oKpsoG39X3Ho7QDVeQ115IjKbTG8l/4vB5/Px5ngol5kCLz
	yG32Nkqsm8NQJJk7sfB4mrGf8YcjIiNAuVsYIX6y06f0VaLtfKfApmZnFiRWDn3hefkWnymv1Ca
	d7uCnL976EP5jMGsqhc2+hi+8QOumqd/IbUrtTcRNke/kKpH1/dycOsyq/PPvv1tqrmcNWeEAkQ
	7fWAVUPFKVcg/
X-Received: by 2002:a05:7300:220d:b0:2b6:f613:74e6 with SMTP id
 5a478bee46e88-2b78d9bd5e9mr651106eec.4.1769524073350; Tue, 27 Jan 2026
 06:27:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
 <CAJ-ks9mjBY7x1s_4wqMC8xqWsX2+aCM6NHn0j7yh_+daKiyS1Q@mail.gmail.com>
 <CAJ-ks9kn=0Sm2_1WV4xyzunzcGG1VZDKy8L=_SCCWyV2OkJTDA@mail.gmail.com>
 <CANiq72krt9De1+WgMh0y8XX5K9RrU-_1FuSp+sKO1Ya8EaVoUg@mail.gmail.com> <CAJ-ks9m-0C=hOdYC_z9mNH54fXjnaWpYgZSPaWoJC8rnQ4Kgkw@mail.gmail.com>
In-Reply-To: <CAJ-ks9m-0C=hOdYC_z9mNH54fXjnaWpYgZSPaWoJC8rnQ4Kgkw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 15:27:41 +0100
X-Gm-Features: AZwV_QimCOYUz3SKZDNlKheXS8HWk9yG3Ey67VA1qou3jr15MiIGw-t2u0Nt8dc
Message-ID: <CANiq72m0TCPTEn=HkMg19Et7JFeRc-fqP+MxP1gaDosSF42iww@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 3:14=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Another ping here, folks! Miguel, what can we do if we do not hear
> from the clk maintainers?

Stephen already Acked-by this one, right?

So I assume they were OK with me taking it -- I will do that unless
someone shouts.

Thanks!

Cheers,
Miguel
