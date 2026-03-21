Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2442DC332
	for <linux-clk@vger.kernel.org>; Sat, 21 Mar 2026 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774105422; cv=pass; b=Q8BFeO7DdLaXxyW6NliR2iN3k7N6DWQ0i2YjkUW7ItpCna0KLnibvt6IDT/lEAhSNScoZ9pho/xN8RolSYfVMzn/1gzxnMUfSxwJQPFX/JMlD0bxYYZrAMq6KTblhdNLs9tpLlpE+heAn8x8s73IV+CJPu4Bvl2UJO30afc3hGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774105422; c=relaxed/simple;
	bh=ucO0y1q7MG/iWCmErUhGurBrhiHi/90k+hcQ7EeukC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9Ofnaqm8tm/cYZj8PTpz0gNJ/gvBeHhNf3TW+796e1/wq6T3j/eKs6AcRaAsM82dYaJLvPtUXE8ZiI5mV287+1QTcb96AjiE4Xt3W8sHMaVvKSDc9TqkLG509II8GJ9MKf8CxAm+BGPulbOWj7tLoAOPnL/DT3JNBaPdxX08dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDL9dgrY; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDL9dgrY"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12736a0147cso244997c88.1
        for <linux-clk@vger.kernel.org>; Sat, 21 Mar 2026 08:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774105421; cv=none;
        d=google.com; s=arc-20240605;
        b=HAdTLUhnCuYrnl3IY8/uJDfAvZGN2b0B2lB4roNNw7sa3KsaP160iw3WzznNxmEjJP
         8OC5oEAuOR5uub0Rzeb4h2EGcC6KjA4/eM+hWF6lOYhm6VjgMcMbwVFvRXrepwBQE3Q+
         +jzHhyV/f9xhFbvGUaiy07R0MrvRkiUN1uGLB4TBJIsuWKQ5XSA8Hl9j4V9u0QfCjMxm
         421XA3P9BYdkvjJH9+MRj8Fz83f6qb1CiHksKvQID7Xc54FOce+bhQ/GVNoBTa/ng+zi
         KDMIY4j7VEXfk8Edc1TCB/jfC01lxvrSD+mOmxdG7DYeudWs4+ZP+CQMxOk/a/kU/A4J
         /aqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ucO0y1q7MG/iWCmErUhGurBrhiHi/90k+hcQ7EeukC0=;
        fh=fV0Ocwppq3LWS8zzszH8NZj7jLD7pbFOslMohZV51UM=;
        b=TpW7eJx91jp1rOmIT3G4NK1pUFR5BKbe79B5qQdx0LNkfqVUeCXgeeJo10EJbfHRcm
         zfK3Qyzmr7pM60/PLIsRf5usUr4dtmp7i9g2K1yodhv63FY4OOZcjzpYJXU4BIduSDVp
         XdXzivp/5n48hL825Lu11Jvba5ncYX93Y5h4IMO9eK8CMgNZ6qOZCCKiZb5XDq2Zm51N
         y/8559z3AlhsKFoNp0G4BUQn0d61bnTQG6nvGdBxRLyylkcaYeEqg+NS+m3EL0xGSXXe
         jLPghAYDfItjt0Qf0qvt62WwrB+/EbxzIFKzHu4exp7DAWj5oe/deI1V1qfMbJm2PAEV
         Y5uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774105421; x=1774710221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucO0y1q7MG/iWCmErUhGurBrhiHi/90k+hcQ7EeukC0=;
        b=kDL9dgrYHwKEyaRrd+d5+lqUntzRbNwcvGj7HDmbAxjXZBs1N5z2HMa3EdYfMZXCA/
         F/5yW86ZIjjXeD589p25QEJXAU4rOdKvQsYsHF+ug+cHhztBVf/UspiSoGzGWmuRdndm
         RedtOW9GQ0zqcvuTitJBDGikqUpA0faWvCZSn18c5coiW/o0atsjFFFoVdPrE0z6Ik1W
         tpFTehc/FjSZw0CgLv8EFBgy3zIwceJiwt/UYXFUAAJvuNmZFcXXTG9y1YfALNy3eJjt
         fogHmBc6hedyvGVBU6eYhJfI9Utw7CGj1Xsyed42yzN8woCLxLiVGWebyeJtPqzV7Et3
         Xmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774105421; x=1774710221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ucO0y1q7MG/iWCmErUhGurBrhiHi/90k+hcQ7EeukC0=;
        b=Bapmr8wD1z/HR9PvIV4m1oDfbxWIwdP+uCdZsyWuZQBatKWj8siTGzNdCfbGWDo5h0
         yWghIvgAX6KvpHF6BUn33w2+UibBRH52heeBB7xo/DUYJeYHfEx64G5VS80kj/dFHfbl
         VyuG5QGvebuMVee8Ou1F+rbQYy5xjQXEg4RHQItEujf/puzelmK2dr9ZTrQgr5Hih9yS
         zfAQ0HXpjyoaPIkk4ycGoYYffhUV9F9UwPha/Sit2OcMkam6SyUketwHqmDzOYah2nbZ
         u/A24sXAP2HY1ReRvOcWfL87z+52wKuDjhe+5+3Z4TwRGUISPsgFcXBASQU3qIK5QTkj
         YXQA==
X-Forwarded-Encrypted: i=1; AJvYcCW1HCOLNw6fGJ1P/LUk3UbFe+uUKPxMqaJN8tfJEzh7u5UovhmZUfGMtkBGlcst0eGe+4pvS2/YWl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOUgY95ZrkOnRX30K4BuMRgQgrtmDODW+d21vUsnPBc5TmlpnM
	YpC2uQOXAxQB6tiX2lM+uC5mKbDZwAOR3mHYmvaMApKUT4znaEp9rLMxEXMrDkmyYTf6xUzcwJN
	zphf5xb6ek3BRKBYmlvS9YFol+JQT4rk=
X-Gm-Gg: ATEYQzySCi46l9Tykn5nSNwBCmGy+Z1KtF4xgMWDrkaiGhThv2WR3M7GQLFsHx8KSIS
	59bEq4MZBE+SEMjkF1h6x3cbGHoNvJklhr0aIhTImG9NDp5sTLhKR94dF9qMvNtg5k78MlZrFzf
	6Okmr3horBP0yuC2PoU9OpBu4ITkG4EA0q/r3FdYM3OU1beuemFu7Hcs4WIe5Gw7G4YozLL0cIi
	u/gL1X+9kRrlpU8LfEXXd9YVvW0fmtrL9LSoHCv0XtiGkaBXe3PHw8y1/R441Rh9uCBGuuSqhkz
	rvZVIIJ8lbs+kxmmihzIweDb51QE9PAOzj6rDLQeWuxYOUamU2X65bN1t4G6LgdqoKSG70jXgcX
	UKH06cCCs2dP1X8rv/JEzb68=
X-Received: by 2002:a05:7022:792:b0:127:3480:7ca5 with SMTP id
 a92af1059eb24-12a726513cfmr1588676c88.2.1774105420874; Sat, 21 Mar 2026
 08:03:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com> <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org>
In-Reply-To: <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Mar 2026 16:03:28 +0100
X-Gm-Features: AaiRm52lxzUk0_iCcIFX3-uHQqZ_28CgqK_qR7We3jIMceDCHvhnu1d2ud_6c3s
Message-ID: <CANiq72mqpGk9DAjkt+Ohhw9K2xQChKtUQXPM8iucfokbYT_uTg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Danilo Krummrich <dakr@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
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

On Fri, Mar 20, 2026 at 12:43=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> Alice has resent this over the past three cycles, but it hasn't been pick=
ed up
> yet. Please let me know if there are any concerns -- otherwise, I plan to=
 take
> it through the drm-rust tree in a few days.

+1, it will keep accumulating changes otherwise. Alice asked me about
this one too; I can pick it up if needed too.

Cheers,
Miguel
