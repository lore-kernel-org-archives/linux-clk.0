Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE06E30C378
	for <linux-clk@vger.kernel.org>; Sun, 18 Jan 2026 22:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768774472; cv=pass; b=uGBsx+x3pCbsSWoPNMTihmtxaFKReazmGewWO7kc8yi+raRmyGlngZLB8Fd2LNkIJc0CIipsx8S87RT4SSINbqBvN7FOuwk6LQaLM/Id1Mt+8WYXCuINI2pjKtVYasMmw5Iz+2MORYTnAJrY3s2R7pmEafP0CkaVD4qP2m+ND4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768774472; c=relaxed/simple;
	bh=rFVaXTamawVca7FcuOUlaGPv4PCZvXD301YzgKJrMFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I6M6aFKFKqIJq3gWR1ZEPhUELlhmFRYM77zwJ4EH9dvxQj2d1q7oqYoRVaBuuq9B5bubbbLs8tw6WuyPY/NO6RFEA3g3i7R0Lq6a6nXjodzfuiWg21Elv9+MxdoOOFfmpYU+eLRSZLJlkl36GmTlSVMEYM3/te5aVCjE+0NndG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWiIQ9HX; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWiIQ9HX"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12336c0ae91so304770c88.2
        for <linux-clk@vger.kernel.org>; Sun, 18 Jan 2026 14:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768774470; cv=none;
        d=google.com; s=arc-20240605;
        b=OGhKCE/OvgMBp32vLHgfYmbsGpGJf7AgbCl+DpEcMWNj59opnQ+GSS5Av2UKjM+lDX
         hudOnSUaiW/7ZPwafA6UiSO6RyU+wN8T3FZ5ngpFYmhZvW6UPQpTHtD6d1zZBnazBCg+
         AbeibvXAB0XyGXflTuwR27xOn/GLLn8jj0uStgkztrxpsfBenmKqzT9nQM1gMGvGatJR
         NyHHu74Jb/Y/D9PbILYt0fVJQeuovcyXnuyk7mwRrby7ntl3HqNSqyOw/zz38ol3gYNm
         D2XeJzLbHOQK7g9APF6MOpprFd8G7QjeMoSeXvwTd0cBg6sMKXg50Z9/iUsKDgPaonf9
         7HmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rFVaXTamawVca7FcuOUlaGPv4PCZvXD301YzgKJrMFo=;
        fh=YxXcNl2VmVpoyEF0p/qWnTQ6Lc2gxrb3AFstWZLHwpo=;
        b=Q0bUGeiLtQ7OmHz0XwGhFyEOwbZOMYfrL7d91hKB09fnBYMVnQ7GMomQTRON26Vreo
         DjqBOJUBkECanELlRW5VElX8u6ekSqcj+4zsE4Apa86FNk2OLZqFaMrsg1/M+YpNqRTP
         X++NVf7yUY7AYjCcIRY4Wj6FrB/VY9ot8r87+I8VbSCoiyatwZdw5xod+xuv+GdPYI03
         XN9Ppgz4gWYdkbNj1KO/RhV5XiItYvo0AXmdLbbU8D2JcXiGEetvohdnHmO9tsFQSBF6
         VjO/e6/xh4kbJtgnxXrfWtjaWHuMXbnbDjEkYqTMhVjNHuqBYPwZ+xdNnTCJNXE2MSlc
         JBoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768774470; x=1769379270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFVaXTamawVca7FcuOUlaGPv4PCZvXD301YzgKJrMFo=;
        b=JWiIQ9HXnyHlxeIvNWseZ40qClOQD0daZAW7xELlgF2Z49UCc9kJLgiUguxqUqG+zS
         4lnqx19AF6FljkTUWlCVJw4cTNX8JMz2XXeXSjtZYd0BzZxVFTWV+LiKJoVzbXHJdp4+
         89Ow1Uowhy/mJ83wPL6NSVCH8n5kbAUbjDSBaJlSULg3Yuk893QpFipIsVLtn4mtJS1k
         hc2CC5sPxBjb0ERpzMCTWvE89HvvDvBb+XaPl22AYWf0DM5vkZBCcGqCQkPVHZDjb/0F
         S0kutDrDqrjyo6bPXRTe+wZrpW6SxKuCiI7rYtz0s/V7nY4A2jUtq8xvRzAsMWpFgW6y
         Sz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768774470; x=1769379270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rFVaXTamawVca7FcuOUlaGPv4PCZvXD301YzgKJrMFo=;
        b=VzdRGYULIUynjE1TQhESDPLqRwCVTGR7MAFHz/FlF71FUfgBcuuTzhesUpHn0JjLNx
         /34aOMq6z50LwuEtT3vYZSegk3nDKWE8gL9+1V39sxNPDddVwPkGnZljwvPihonSE+bU
         aFmskMv4OM6Ke168y/mk0LaxrxVZBYxBgst13cvcQrLoDVoFeC3/lPIEOSnzm51M/10j
         MCvuJf39l5y/OmKY5Df2a4dj3ZYIvBHPMzo4B2K4EqjXvADH8zQrPQ8TDSp/fF0qtJfU
         gmBEHXz62EU3kdsSPiBFfuavUQZwj4FaLN8tFVSTKO9Ccm6iGSKmtDN2IvBhDo1t441g
         lg1A==
X-Forwarded-Encrypted: i=1; AJvYcCWpum86y+WC86tvxh3OBTQIqM6cLJmoxJ5wUoN8NW1CEHpQISnflQC55YnipKT8P7KyWh92Gd49tas=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4MOH79FV/h0N3cQres5ilhpo/jpRXyZL9FFtui7Hdt82uFQ9R
	TAMHoQvJxYhJtUewLViRdCcub8sKNUKmGx4jpS6BVe+YYlyLQrv1Iuocp68dPRkENqdSXtIH0yg
	sAL3AMCmSurEZhk2ZQWy2nhgfjsCypFk=
X-Gm-Gg: AY/fxX431WFKIr2sdBUy+bHNBt+vy5YqstQaZJ5iXaHNVU/PinxvSU3kRXr1Xm/qIoc
	DG6r7uT8HqTNjL1LGPHiUrFP+RuMv26SqsLXK2yLzRbOHJEs/D9rJDLxA3Rgel6SjX2fiK/jfYh
	aua6SS9nAjkluFsrnQUsKT89lb9FgJO8ILyaKKIwRzmpGe1kCR44G3z2fhl0z0Mr5Cj755uS1eZ
	itKMQgGu65zoqxp+RiRs0AJeLk+SKCe7GhV6mOU1u0OF11pEgeaRj9gbrmLvMVJFgnFfuXJTXgm
	jN99Zd+XMmDLLHkAGllOnLbbeY64X/usxlqWS1HatdaII0/0cvwiOPJiLIHgrVn9fXqEMlThiay
	LYgePh7mcho5n
X-Received: by 2002:a05:7300:fd0f:b0:2ae:605b:d530 with SMTP id
 5a478bee46e88-2b6b40f82e3mr4624275eec.6.1768774469760; Sun, 18 Jan 2026
 14:14:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251130211233.367946-1-seimun018r@gmail.com> <DEMK8K1I3FFY.27ERA2LKI7MYB@nvidia.com>
In-Reply-To: <DEMK8K1I3FFY.27ERA2LKI7MYB@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 23:14:16 +0100
X-Gm-Features: AZwV_QhbmS6fYnaLHG9OmfFPvxPSjjMQeHjogZCNf2NRKzxWYqqnS5uWm8UjCzE
Message-ID: <CANiq72=BN3gQfBX-0abv+8hDKDL20JC5G0U0BS=r3nY5VB4a0g@mail.gmail.com>
Subject: Re: [PATCH] rust: use consistent backtick formatting for NULL in docs
To: Alexandre Courbot <acourbot@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <raemoar63@gmail.com>
Cc: Peter Novak <seimun018r@gmail.com>, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 4:29=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> On Mon Dec 1, 2025 at 6:12 AM JST, Peter Novak wrote:
> > Some doc comments use `NULL` while others use plain NULL.
> > This patch makes it consistent by adding backticks everywhere,
> > matching the majority of existing usage.
> >
> > This is my first kernel patch - just getting familiar with
> > the contribution process.
> >
> > Signed-off-by: Peter Novak <seimun018r@gmail.com>
>
> This looks like a pretty good first patch! :)
>
> Just make sure to put the meta-comments (the "This is my first kernel
> patch" sentence) below a `---` line so they don't get picked up in the
> git log. See [1] for an example.
>
> With that sentence removed (which I believe will be done when applying
> if no other fixes are required),
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>
> I have double-checked with `rg '\/\/\/.*NULL'` from the `rust` directory
> and this indeed appears to address all cases.
>
> [1] https://lore.kernel.org/rust-for-linux/20251124-bounded_fix-v1-1-d8e3=
4e1c727f@nvidia.com/

Thanks Alexandre for this welcoming review, and Peter for the patch.

I see Cc's were missing, which explains why there weren't more
reactions. OK, added everyone now: clk, debugfs and KUnit.

It would be nice to have Acked-by's for them, but if nobody shouts, I
guess I will eventually apply it...

Thanks!

Cheers,
Miguel
