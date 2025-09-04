Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E152FF66F
	for <linux-clk@vger.kernel.org>; Thu,  4 Sep 2025 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756991289; cv=none; b=ak0XzpgdU7wSWJh1tjsy+rTSXuX3AFn9fd+w3/ac09N7mb4jzkptCwgBgQoIMXXpeoczDgqW1USIIj3Dnfs6etFM8L0JjB/VZ9Ha9R1odVttd/LmZsC7AfPX18MnOuzRAinHIuSqbocNmdV/Xj8mn0hbrcmb3/HwkFzxnrF1VOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756991289; c=relaxed/simple;
	bh=4cZqK9YzKCpf0+zZ9irAoAp8vCEv1wbUaz3rjA5fNE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBN5qIi4l1vQkp+J3NFV43EFTjNATRT9eWGDbEdrsrWuByrpAfnyYOGkw2AdC3nWAT/akQXlTgxHtuzDUG0kYgf27RYEVxIFhq34NukMb8XFuF6wKIrt1APN6Byfa4QyLVR1wYjB++AMniEvHZCkiQZg1QPTlhNodRzJf2CYJcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E6hlXJkG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E6hlXJkG"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3df15fdf0caso822225f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 04 Sep 2025 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756991286; x=1757596086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cZqK9YzKCpf0+zZ9irAoAp8vCEv1wbUaz3rjA5fNE4=;
        b=E6hlXJkG4hPYwLFypn3mCBhkVMicv7RpGvd7YkRty6WunpEBNzohzgsfp2MQx+WqVe
         6DKVPk8hFPp2FVY6VUocQrq86tWNTMqRQXdDJLWVCBymxivGlT1/046nQ00ld1+NJBsQ
         3NgKjqbajaqO0/5M/ANL2GF3OxU2MjHwmz4FyrN0ZFAsum87WRkENgWvJqH1tGPtc4Yt
         XyOwZX9d/nxi8lIqwPq4oho7Kril6qZuMl5uInVq5lVsJGMAMlO4DGzlyxDF4CHeZcNo
         aVJ34/ekU2+MjcvBS3N+g7K8u77833NitznLfr2vN7udLX2yGcbRwqZx4Vb95+XQZj2n
         cCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991286; x=1757596086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cZqK9YzKCpf0+zZ9irAoAp8vCEv1wbUaz3rjA5fNE4=;
        b=axOGKiY7ULciw93/immRMquwx9cFDGzisRNTI/vSZgVSg1QOLbGCKh4AzgWkQCNbfm
         455uMOccU56enogYyhVFD+QdweV8QUpctCamgVgLQNte6mh5u2Y2BWAgEwrKIOzGmBDx
         ZoswVCsnz2CIdmbAqxvF8nHBcuEQZZ6leTUGxFvyoORe04xm2R/zr8qDxSAdFTEMlofQ
         TcpnFVEtweU32Nl6jaW7FV7t9bUgIQY2+hWIZjZRMzj1FPAvosMeUb78j5P8s1rEnisT
         87N4Z0qvmI/b74u8joEft53yjEZHBfkYdjFCIelS/7PNjd3ozIoMSvFnp2jUD0hWB2KT
         8lRA==
X-Forwarded-Encrypted: i=1; AJvYcCVJha9VJJV2Ow/KNnNxbrR5i1hLSk3h9NoJlXu8MEA3FBu+pghbRFQ+pzyuzBkN1HNQBeU10EzM6/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoctG1Zjol4CwvSNFXaGNfd6sQfE7lMHPYKZqNk+Ay6D58t0Dz
	Oj1ZYMqJzGIHBDRBCTkeLzRfoRr3w6IyTN9n+UZT1NXHlLUm/zMGyxPMEA2GqKQ6QBSHyeJuYdx
	acUbszyjaIKJhglFQ0IuO2q965gnf84/EjPSnTatP
X-Gm-Gg: ASbGncsRMoSQorg/8XLbzpEtCOyeDL6or1lsT6PTHQBckoSwQzLvhG2GUVm78EBOsWB
	XUu2d2cPDYu+jXQi1/2821PlsI+Au5qfQTEojaDuyh8nxi3gVoTUsZ9q3D1VF7Ao+Ev0hqV/9PI
	YsFckjDfZEGuaPJLzIIIZd92mOzJc/TGXZGxvyagKZJQ/fUpZUFudVBGdYqWkqQ5Kr4in7ALRy/
	zaKuLZFO/5xBzjrQEK5FKw7lRYn+ziOsRjxy8qaGn8VcYX2dMvvgXirq+MtO4y64AXuXqrn1dDI
	wpAI6ZAM48jbOZvHeJ2RAQ==
X-Google-Smtp-Source: AGHT+IFg6AKl3SCJnL7g0+bfVP2sauEBpLDoUNy8WCcZYED03ALkKxVTPtnNlh4mcIMrUbbycxmFvWWlSYL5Ai+IHxo=
X-Received: by 2002:a05:6000:2308:b0:3d7:abf7:24af with SMTP id
 ffacd0b85a97d-3d7abf72cecmr10000884f8f.23.1756991285894; Thu, 04 Sep 2025
 06:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904-clk-send-sync-v1-1-48d023320eb8@google.com> <CB9F3786-48F0-46EE-BE61-8823E437C786@collabora.com>
In-Reply-To: <CB9F3786-48F0-46EE-BE61-8823E437C786@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Sep 2025 15:07:53 +0200
X-Gm-Features: Ac12FXy7iJnmk3xcF8Jlr0VlqsGLW3OO3fce9tyZdWo45UwBU5P9xsN6P9IsbB8
Message-ID: <CAH5fLgjRaFjiw84_uP4N2kTs_iuDCe1vcZ7gyF4XiwDkbEgiWQ@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: implement Send and Sync
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 2:31=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
> Can you base your change on top of [0]? Otherwise it will become stale ra=
ther
> quickly, as this introduces new types, i.e.: Clk<Unprepared>, Clk<Prepare=
d>
> etc.
>
> I will push out a new version today.
>
> [0]: https://lore.kernel.org/rust-for-linux/20250729-clk-type-state-v1-1-=
896b53816f7b@collabora.com/

I would suggest the reverse. If your series is based on top of mine,
then this patch can land today regardless of how long it takes to
finish the clk refactor.

Alice
