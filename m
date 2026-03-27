Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB7417B418
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774623632; cv=pass; b=YxIkHpmmaHZYTkBCJOx0SusTiDt055z7zyZx7MDIF3RtFNb+qQo93C9XvJAgYVXZ6Ll/orGMAv5xWhDGhQsBKhWW4xu7ORXitPaAyhdZ61GT5RKSOLkH89rwGoKSb7nRdxjDagrqgo37HkjKlQhTli0JtmWQU+R449JcP6tJz+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774623632; c=relaxed/simple;
	bh=D9xCXX4qh7yDgqFtjupRac54WTmWuupUUXzjqiuoTv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFahCuQ6MH6jnV6z3Apz68bdSykoGm2zVJynOMPQgDHn3aSwQbSQW6qyc+lNtxx5loeS5ppfg0qj8W36Otthd8oI9pbB+SN4KCadCwIVEa5b8Ck7d4RkkL4qpgLFMdESgrmZcrJa5yi0nslTjt5nAu0d2BcQB9jOlTR6XI3kcDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/AIeTGJ; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/AIeTGJ"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1277863a912so294212c88.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 08:00:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774623631; cv=none;
        d=google.com; s=arc-20240605;
        b=WPe67z3YyJxzv16UOCrBB98P1W/8q0/hQyRwviqwOHdv9Pi+37cHMvt7zqUplMMwes
         XfwuDw0wibPPtbnIc6nxej6VVJOtUUjaxZ7B/bdB5EfgpXwDKfXt6qxJSAL5/15VaKNS
         R3X2Q/i5p2tmxuKW4Hk1vAiDNn8AJRneDGlwgjgsjMQZHgQmPJ42gUc6rq8yIQMECLhe
         9v3t7R0SCFf4TCOgUORDYehV7BmGdHVQxw+0RuKPrSXk8N7d1hLKD0YwUabHkIEDQYEf
         R7NosyqHLCSvE6qPrTWCPZW5uJIs6ln3vwzANUrWEfxRabQonUwlL21TcuHMeNoYNhbb
         Q96w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D9xCXX4qh7yDgqFtjupRac54WTmWuupUUXzjqiuoTv0=;
        fh=qMLL4sIx+X5iMH/+gMuZ0T4ymU+thvR1qgH2X3WfdEc=;
        b=jy7KYrTQDHBa07mYJpU1pEmV1EZU4d3m8qrrq4NBBIp4JntGFQ3qrBvNfUU2+Wuud5
         /O2fMRMdISqNW84kfODCg3QbmVCc+qskp9YJtggzU7jZIfNNU8f+2/X5eQvxjC/92S52
         VKUw71KSL5d8/itWiCh2xHDa69H+G0c0CUGSrMMMZT19YCs+0sSOkR9dsH4fMBvk3NUW
         u462bLnCr999SPAuKdhvl4vpEhqEiEiL+uhLmrQH5vNgm6HYIqukYRDGtEtr0Zq5PRrE
         ouQOL++hoxPiT9DNZv6Zfk5eFgu0Hk2UFUfmwU/CnolcqjWINuXpeszsGgxyiQ4gpe5X
         TlIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774623631; x=1775228431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9xCXX4qh7yDgqFtjupRac54WTmWuupUUXzjqiuoTv0=;
        b=V/AIeTGJtPpwVUdsxrEOZw9ZJI4hUZZQ4n6eL+dQ7Hs7SZSN+IqHQYZvBddYnfShbH
         KCb+bttTBwWh0wjcz9wQ2bSwdtSqu1AhhIhvCcroEHSuiRUNMI08xwLal/Et9ndp59CZ
         foaAHr+cmB51VcgaJni5jyrOSyk26PDNW6VZwQHVUBBXdod862bmiXHQMq5CRFzAI30e
         812YtBpWJ/9bjWqPAeEOWIUoh8PigQ8NgygTznymAnahh2+r4iGi0pIJNrM/5PZ6E/h/
         1BX9GrEDOm2rDM9X+PzQCowF0wT0uHXRpAE8bPfy/bkULcdkmmSgxyZ0Um7JfUD3KW0Z
         DxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774623631; x=1775228431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D9xCXX4qh7yDgqFtjupRac54WTmWuupUUXzjqiuoTv0=;
        b=ZGFFpCKAvx/daRomFkk6FVqoKKq+UwcivGvxAudhUH2EKLMt/gRcm+tjN/LspDBnlm
         BVQ6cFKvt9hjBZNbErS9V9XdIGSR2KPnYwXDQHYlE2XRzviIhNsYB9rqKw6KVNCx1e7K
         7+8vgDUFeCR9HrP+6SXRYx6VIWn/6C7KyyNCI6N/8pR/2c0FpV9T+syijGWcTr17pjYZ
         A+KUjCWemr+H0jT5v/dulFGOJPq5nEqyuLYp+tNqnaq9v54YR/pdEGLwQpkpdB/eERlb
         5ZUZQbOAqNvXKNDeQeDo4fi3U+FguVF2p4yFp8DERMzWKrctL6ctF3CO2WruPjollOG4
         ck3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdTGvNDkX/1b/U+X3xKAq1opT944zqInWOTIel7rbRarUmu6wzjkhoJtcRdES91BKbGPsEJ/3WkFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQGOq4ympN/E1lmDfK0GrnZQhF31hzokKF3vekfYh7pmZhASLe
	LvWiVc68WMiaKmeMlUWr46yJy0oUfq4WIiBl33GdY4xik8BaWnIHcZDf96W7wkGSmcl0HXG8Lmv
	G+jWsxkmoPr8i8d1Ej0aV4CY5t0IDD6I=
X-Gm-Gg: ATEYQzzHUzGPonLDvDl6y+k9wO5PNl/+HMzOkr9OM/GO5VnbCGGM//CvBa8KDHVXaD5
	vLrwcydRB7AuroFv9+DIi8Cjz+wFa1a8n38CK0NKOylh3Dmwn09p7tqTVayDGt6nmyVb/egIn1t
	euHtRHgR++gASZp6mdwOH5Fs7CcWbIAPm+BcM1cC9iFsUdhk+SEvn2xy7BgrPxw8eI3FBI7/p1F
	e+ysoOzjJ9PLId6TpZPL5soJG0kTZ1H2cTFnxEdQS7jj5k42gb2HTQk/opz5oT3ur5nHUtvDJlL
	ZrBhZkEBm61395WO7dDgptDBXWBLOL1s8gi0SoyqmyOYRr1V9jRbCxHxIp48PiCI4CwS47NxR5x
	Q2jzEHx6J3jvOFd11HL3sNBc=
X-Received: by 2002:a05:7300:3254:b0:2be:1946:858b with SMTP id
 5a478bee46e88-2c185e6b478mr676695eec.3.1774623630624; Fri, 27 Mar 2026
 08:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com> <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
In-Reply-To: <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 16:00:17 +0100
X-Gm-Features: AQROBzCg8z5hsjJLNQncsQnLe5Jv3qMm0sXMulY5sLScvTl8_VvaOlFJW_RT3vc
Message-ID: <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Brian Masney <bmasney@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 2:19=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Stephen came on the list and started to merge this things this week. I
> was going to collect up more patches for him if he wasn't around, and
> intended to include this. However, since he's starting to collect
> things, I'm not going to send him a clk pull today.
>
> It's up to you if you want to send this in via drm-rust or wait for Steph=
en.

I guess it depends if he plans to pick it up this cycle or not.

If he doesn't, then it may be best to just go forward with your
Acked-bys -- Danilo can pick it up if DRM needs it in their branch,
otherwise I can pick it up.

Thanks!

Cheers,
Miguel
