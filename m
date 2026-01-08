Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADAD4C77AF
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880694; cv=pass; b=NfqiioLRK5oF/pLefKKOYg4aYr+Y10j3K2h4i2EA1RKyx0EVZrL8ishBFRVwV0MqYaMuADmp0oapGr4rycCqtvteMmSfW/rBkaaVzA6mKnHExtxoaKeNiaw+fqlY9KHgqDj5NcTypXILauFPJOjYRioevUaIlKJCGlOYJDaQ1wY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880694; c=relaxed/simple;
	bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=klbGBBB2AF8151R/ILyY+S6WbmUZnXeaf4jKcLDT5a034F6eAnoKHK9dK9PsXb52OmKa63JHTzybP4+eUDC+KfyUqSbWPFVm/BMId+qhdUCP0jMxzLeeubC8lqEIGuLrhK4h/RABEBGqV4XbQ48X5jzfKDbtC5BGLqoLw/c87dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ilfcfo9l; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ilfcfo9l"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ae9f7fd413so54016eec.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 05:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767880690; cv=none;
        d=google.com; s=arc-20240605;
        b=hSb6BGxaEnbMvUk6tfwwAoAK/i87z+L5QfeigaE8xups7TaE5+2+GZLkmxdTVg9hIk
         5DP0JG+xIyjQDHMcBs91NrNx26VISTLfmYcaPr/x5F4/4FS1l3SV76eMm9mTGroAkuug
         eB7drBtvehm8mPuLQ59scY3ug5K23UI14NbBEKCozGPo6M6xCY32jZZ0i4OuI0CMjVMu
         kAS2r+FU79hjqtEgDBtwjmSxD4KyjO9IVm0Jd0ImcTmLqOhc2ToUYiQy9jc3/P3qoC0T
         sKmm8eu341x0xHgLLgPL1zEVMAyPlz6N+Uw8S+Xi09axHx/9n+JWssjCqiw5rZzuRitQ
         SlcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
        fh=evhItOXTdIw7LAeShIisjGqxTu8EMrRgX0UrdZ6OAO8=;
        b=KMGGNBGiHOaHnMFd594wh/7DNoVr5li8W8YhiSPnmBmQHnyawwlEX/HYTWI1iOoQwq
         SJ7LA5rPxWX3B06/sJQxgXj8VmixspppXkp9ZrlLNs+X5gvdeSsmgMYQYc/HCim2XVjJ
         IUqZkjGuH6IFWXGEcG/uMua8AByE6PxSoAmHPR+eFx0algSopT30MDN38ulbwGdKVhSD
         N2qdD0WYUa+Um5RGxyAmM+sYvTlVPlOqS9Z4RwjmgZadCv+U2HiVGktnmS25lVDrD0II
         JSAWf3a84qJ9mOZSnPjk3fBQWbVb1500Z4a/HWEeLVptHeRNhiKk5IOR883e8ODiA4wy
         Q10A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767880690; x=1768485490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
        b=Ilfcfo9lhPbFoRwXYyeWTa35Ybnj14xI7aJp+J3RZeWzb1Y58ehXAKXbI2lCRWxjri
         9l1F8djK2AftPQ4aVHsRmcLERuPatxSLv0s7oGJrs4iVgh+Q3nBRw6By6yAt7TQoZun5
         3DOZnFeI1gL3oNBsmeZNRVGzoE+JoBHHr/hDfRJyQNVVuwSXuAHKy4BE5mzSQfcanEsE
         5Sd3iX50T/MSSzc+jdmaBFXlOVQgRzo3CCMFo5QBBWs6wM/lcBJpDS02fshclj7GWE5+
         mP7J+FTxRVOdCYbKDJyhFh3MSSuveyxcPSvMCTlpDu0Yw3hsQS5ezi1MiJrQ9lUieQ+t
         2RJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880690; x=1768485490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
        b=VEuNJMgoHrKLiVSapZAKHDyGEwmUkblSi22sRcS8eVQHCqb/+VWB4xkg1vvpjTGNcN
         BwqUFP5sLmu2wPUgJjpOvDDpzGlHSBUSYdFSG4Sh+kT41tEZOb9b/x3Wn5lxiBzQb8Wo
         jtqzW0ZD09+IVRzuBKiGDQIyOpDTy7DyLrUA4d2/3iH1SOje/dkNXK9UNE4g8NwwOVKC
         H+wtuvXF0tzTocAU77pBErSAj5n3vcA+qnLrX2MxjfsfQJAP4AtboWSbup297IBNP4l2
         kZsVFBC+J/F/KeDSaDR3Ajf+9cgdPFVJBol7BLBEn4OHwecjpaj5t8/Mw26Aa4aj+9vl
         zGQw==
X-Forwarded-Encrypted: i=1; AJvYcCUmK3N+EUkb1WlSmJUjJZe63k1OHydgLuGZ9rdgjuU1TcnoH2rrLQxISHHhYH44le+82Rtw2gSNhSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKq3FrJw4gL3324tKR3EgtsbwjMbuQVBkmMA25qbS1jerEkZXt
	GoAsQa+vFibzULbXCyLkpJGUWiVUIk8/QxrREb6KBDbaCnkZ67mLHZgCPvQdJeXXrCD/vzyVx8m
	pm3o66+NjcHyy8/iWkR6656/I3x0gUFg=
X-Gm-Gg: AY/fxX4iKTD3j5DROOYzCqXeFw4+FMMBOmjiHEBMpOcQeF3FjvI7lTJx7Gn+Jjs/Khb
	EKcQhJ2Yh8mMEJqVmnHvdUlg4V++eW2PqeobWKTicYgB6QSP57F6JyhjuERq9avY38T7zwLaQ9g
	iSLbqAN2Mlro86LH8mCv/HxzqnVmQGba8y1dMw6H9Gi2bPTdO8J7E1jHb1eDB3kfVosdZNuevrS
	fWOnnTqlGBJ4OhqGlH/h2zryOQtFQc2damK5M9cplXFl0FJVyP2Z/6+b3BG8X491Hfe/KjnUzpG
	03n9tGl0PzZWJXNXy9ZPMVidhv9kQHMC8dPgRCq3cDK2dtEx3i3PiSeqyh3h7sRUiuZfUVJN/7W
	5rd1X1Q6TZOuA441Qb5IGuaQ=
X-Google-Smtp-Source: AGHT+IHlnNhSjE3fiGAFdHKCvng7Zuc8n9ttJNcOcaKfOXOHrvEYhA907pjuVU71kxGKClIXln7ajb5XI4DP4iSFO60=
X-Received: by 2002:a05:7301:10c4:b0:2b0:502d:c27c with SMTP id
 5a478bee46e88-2b17d2b80c6mr2509787eec.5.1767880690160; Thu, 08 Jan 2026
 05:58:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com> <20260108-delectable-fennec-of-sunshine-ffca19@houat>
In-Reply-To: <20260108-delectable-fennec-of-sunshine-ffca19@houat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 14:57:56 +0100
X-Gm-Features: AQt7F2rtmhmzWGc_DLT6cTXt2EVzqLjQhI34cDZ6wkg42nM_UD7cfFl6t1r9_zk
Message-ID: <CANiq72=38RO9PGAMDtnTK8wj-yRSmg9UOfq7D6af7AwAKwn=DA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 9:07=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> AFAIU, encoding the state of the clock into the Clk type (and thus
> forcing the structure that holds it) prevents that mutation. If not, we
> should make it clearer (by expanding the doc maybe?) how such a pattern
> can be supported.

One possibility to consider in cases like this is whether supporting
both cases differently makes sense, i.e. one for that covers
easily/safely/... the usual "80%" of cases, and another "advanced" one
(possibly unsafe etc.) for the rest.

While it may be a bit more to maintain, it may pay itself off by
making it easier to review the easy ones if the majority only need
that etc.

Cheers,
Miguel
