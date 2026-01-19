Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343931B87C0
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 18:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768845613; cv=pass; b=CMSut/6JPB6NFsaVoMNSPg+yY53gI0Eri3uZqnEsXzfPzuIHhN+/F7INpjNi4i7ZMCCfURgdiOgQpL6A/sZqXk+EYX0r3ggvMrY3eNpGDItoma1V9OWPZLTVcGnRtTDsrYZ5qaqGYrwkpNCc8IXzV17X5i/vBBc4kDergoJknHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768845613; c=relaxed/simple;
	bh=cBK0XomjoEWCMk/yUF1Mrq97OYn4i0QUJa4LmHepAss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0uc37m3Vl6wSh76+EDfusVtARpUiTCO0K2+EbVCNe7gBN0FxN8FXK/R+Hhyracd8fZIIBXBg3lGiWr6Dqv4xosYI9knBqv1n61wFINI6ty09vNi7sgySeQ88d6qxPLAbZ/0wevB0EvMNkWFpz2G2Cc0Gt9V0ubLQNz4taNYVZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtNfKSo4; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtNfKSo4"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-123387e3151so241669c88.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 10:00:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768845611; cv=none;
        d=google.com; s=arc-20240605;
        b=h4lmga5KH3n7wwmOSnTaUil/bcdcUIJITvubUrjx2MG/SqmKZn7Jsd9NqBz0/s4kge
         s3+LS6vZdlSQeFMXI6ZvHKFCY09TNJZtxYyTKa2AkYYRYN0lxjHbsxr+RZsN2/owsSxv
         eX9/Am8mnGaa0W/NE+occ6BMj9Oh+R2GsgA18fdedlSluKtlYo2JZGayM6JLniCc/UvN
         LLyzBxR+gr1wo3ydM87C3Vw7m64bZjTZ4uRDZOzXids4YrLtGM1p89jLF4IzoPZKvPQ5
         j7q9/pOZnCHd8jQFKEyw6Bci2mvRZwgoYEXV9EWJZjvx+ew/AbbkI8ql61LM8Acb9cpn
         DRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=24n1hBg/G9VprywVnyvsBQEj3q/7S0xyV4+1Oz2Cusc=;
        fh=Rnk2rMMhBccCv5TvX6XbSHIYydCnGFz+a4iZPE3CxZY=;
        b=aX7E+wieID8NWR7a/Ikw8FNI9sVYJfJqdDNWq9temiaumnfNNVHl3uCQDp0HNSkfvS
         fx6wRa+XQPz3xjgHuT3DDeySj/QnAARtRdqxxP2qtgaz+ZeiYpLZAsildOdIVSzviVu+
         jfpjmXIfsOtk+T3BUBtff2GUjCEXpRoMSeLMG9xBXktwCgGjC0/Vejutj1Z5+PrxpXD+
         DBkLOYfRHrKTMbq34B9V+8/HNEKtvu4DqxGLcrA58DZhsCE1lqxXYj+sf30GgdfJK3hr
         8LH6D0Ko8FjUh63BSTA/ZN4wp9FbdnAxx9+tXHpZ4cMxDx5XAmt0a93lD7yzmwhMFFzm
         omCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768845611; x=1769450411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24n1hBg/G9VprywVnyvsBQEj3q/7S0xyV4+1Oz2Cusc=;
        b=QtNfKSo4YmAwefCRbId0ho/mPTY4hXefAaqQ7kalEMX/kfHn+hej7GQcVRLtpwkVlw
         alMTbjTwV5D4Fbvjnh8JQXA97NHVW7fc0VCVuwsR6J34PFTwaoALuxCYJFzsxQgP0Gdi
         l+tqYwbanY8OIGYZ0J8r1sVqoxC7jg3CIQoUkhkD7oliOMq193fasksb+E3/aFXx6pQO
         FW8LcnhG4/9MUggFYKNyhcTLGo8g8skohxwJOmcTOXKB7ZwXwm1fHinMa1jPqqHHl1aR
         JLojkiki/7Z+qhSRdBruZAWs8IjhQ/2pCBTYx/mGax5/GBOZTqxsy24fhm2nzbqAQx9H
         bfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768845611; x=1769450411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=24n1hBg/G9VprywVnyvsBQEj3q/7S0xyV4+1Oz2Cusc=;
        b=uk3F6DHju1m8YarJvlJ6xPSVYhfMRweErazkJkgbObdf2PIAfuqat8bWuckGYsqo+U
         NSx8nTKZydWsBlRoIYOtvYG3RUIodgrya1MHC1rPJQmbHzfJ4624sfc1ulQLIIvTevT9
         uHFL+X7VofYx9X2VtbS/IaclRwupsvySfTU/Jr7Vnv/Jg6HRdpfp+ZXRn791YS1RIe3/
         OK7Qt8P51tj80D13bLkjw4JM6QVVA4h5rSzxufURdh7hjztE3t/a19rx2V+KDYyFP2IR
         KZVB905IZpPtJQ7OTa+hS1uvOkCtMHmK4yrxB9rAvucE9Dsb0XBumKAwL0naumC/x0SP
         cKGg==
X-Forwarded-Encrypted: i=1; AJvYcCXzK8tyjVGSp9kCuKlPSjKCMUBSW5AKTxyVJLmvBwcM7oWxDxRBh//aCydqaeiWQkO+iFnyAyygR9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqVGCB25Gu5k0XeM3HGmUNaXpHAwjAEJTlyx96TqDgNYJ9jwgq
	0EHH1QSBa6eSjTAqG/pG404f8VW9RiXiLSENvieB67pxtlFeTSx89JtkIw0xnOoIXbnTmN12TGh
	MJm6mHTl16jhipaI85K74Cdlyzu1MzrE=
X-Gm-Gg: AZuq6aJocFo4I8xIY/zRK6JYZwJ+lkoYsHZvYowgfIXCFcRGPF1NvZUwodCX5XWQKvh
	/l9+hALcw+jdmL68p8MGTU92FyNidazgPXJVLtRfJZfUf1AqfLCr9fxrz/ar79xxoBVxN43rW1a
	BW0px6XAZ1T+uK8PJLjvh/+ClWmHws09htARt+FKCsAf/vIcjHMYyZNvsSvFe11XVLfMnr1mgKP
	ielSWCXaVGinsHToCufs1nVrQ3gAMbQXBrG59+9n7VZfqV/rPDTtq2ycUuJHUkDJS/x02t/qMV1
	h8kEBZfXv84jdSQ9bWidXAdrMZrh6ZFrN1fxcovFSyCrRgsBw4Zo+0QSXV31/8EKxvOw8BKZvJr
	Le3qkLDgaOij7
X-Received: by 2002:a05:693c:4095:b0:2b6:f432:8f40 with SMTP id
 5a478bee46e88-2b6f43294d7mr305338eec.4.1768845609633; Mon, 19 Jan 2026
 10:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
 <CAJ-ks9mjBY7x1s_4wqMC8xqWsX2+aCM6NHn0j7yh_+daKiyS1Q@mail.gmail.com> <CAJ-ks9kn=0Sm2_1WV4xyzunzcGG1VZDKy8L=_SCCWyV2OkJTDA@mail.gmail.com>
In-Reply-To: <CAJ-ks9kn=0Sm2_1WV4xyzunzcGG1VZDKy8L=_SCCWyV2OkJTDA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 18:59:56 +0100
X-Gm-Features: AZwV_Qgf1QkDRHxM_KnLyiORsPFw3KDaXrXdgGz9YfanN_dj9eEzsucuWhLe8dM
Message-ID: <CANiq72krt9De1+WgMh0y8XX5K9RrU-_1FuSp+sKO1Ya8EaVoUg@mail.gmail.com>
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

On Mon, Jan 19, 2026 at 1:52=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Michael or Stephen: could you take this through clk or would you be ok
> with it going through rust-next?

Either seems good to me, thanks!

For context, this is part of a long migration:

    https://github.com/Rust-for-Linux/linux/issues/1075
    https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a9152403778=
3@gmail.com/

Cheers,
Miguel
