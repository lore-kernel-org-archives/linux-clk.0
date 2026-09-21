Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6674BEE58
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 16:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006950; cv=pass; b=arS9pF6V19MLrVAJ8R8eLX66Rh7BHz0zCFLptdofsmPjpjqWXnVkPRzZHN55ZINVg04Pl4Nygmel7R6JLOu6ZdT/nHBSzK9chgqof6UwKrLODNZKI30Q/NPD/25SCnEavXfpoP0K1FWtOL9GoSV2mSWl6bzzyU9nuVeEo/BCxU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006950; c=relaxed/simple;
	bh=AIjc3MXIEI1WNzfDBHDw6Y+wt0nahAW6usfM1evUcdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+HF1fXrmOjlJEdE8BnDILk3Jg8AJmIE0OLxw6VB+oclVhQ+IZMTD18L1pAcbs91oftI1MqP+tILSgLMJRFeBHGJTTx2XnY+eMjHHDbQ2Ng7OtXGW6AfKMvWkLUlIP4iD7xP0uxhbEZGdHFw4134hkSEbFa7RxGbD6oCW7l/gjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyZzq0iI; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyZzq0iI"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b89a8cf7c9so392796e87.0
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 09:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790006947; cv=none;
        d=google.com; s=arc-20260327;
        b=Z0NjKKIYxXpmmTIeyOI6kEPSvYG6iu7WHnUFVI5By/ScRjgTQqh5Pi4dbrlV1HiTH3
         4ByHKk6Crw5pjvHBXgjcbVbE3e77v+88r4J/1eOyxP6+RR9KuyyKq3Gy5NaRRR+3CQYE
         NF7l9sXTdGvZKaUZ5BnHuVh2FPqPRvOAMJ6vRjfjcWW1RotA6OCblXJCx3Nkjcp3Hv1+
         ztmmvtJ/bxG2/2eYM6Kl2+gVgD3GlMvSv3sUUvK/Q/hqG6GFMrtUXRZnPIOIquD6kzif
         N7RW/SGe75cnQwKh4pGAd0+iAhY2ZkrxBcR55vR88yu3KoWAD++L7BNTc2OCPci3HiBV
         wvhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AIjc3MXIEI1WNzfDBHDw6Y+wt0nahAW6usfM1evUcdQ=;
        fh=/dhV1SXsVfJV7Dnj0bxpIX8sr1MPX5vdQcZCEWM58/4=;
        b=La58ASkGE+tZXDy4RMGFeAL0H0qZz5BjkB7XRobd7elRozIJftx4ovYIgyTCT0/Ba0
         l+IxSSx8Nw/WgsIQW+x9K2z+NYaNq0Y1tyybIOrjtMVqkKI7PbFaEtxpnN7JYVyjTWoK
         vXI+DtELgoRaCqXaEEMzoiJQfBVnx+qkbDeQrWYE0y1X3F/dgoXp77CCQTw4t549iEJY
         8qgZhEbepOKjmDm9Kw3odKdvXxXTx5PIMI+P3kWM+zYdm5mrMsQ7xMOWCzIV62yQa8yU
         m4oS2WVpzDXSvvpRF5+dLQNGrV3SEABZnGvcvF75yGgI+svY0Lt992bP5s4JZGcVZa7o
         DMhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790006947; x=1790611747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AIjc3MXIEI1WNzfDBHDw6Y+wt0nahAW6usfM1evUcdQ=;
        b=HyZzq0iICYBObXLKZzkAbYdHutJgeMFWvA3srR1rgB9/G3D0DM4o72UNWCWsecRCUe
         +NL6bE5yfhrSDsN32oKwXFadspCpfpFLd1FVlcIvBLJ0Z7zpuKMJivUJvf7NL9x4W3aT
         n0SkrBqDJiMKlMJZ+9Vnx9t1OTZrqlzc6xcMW/Xupzv5oIDUAFLlltcbALfsGedOBKfi
         yx1qMu7wOJ7UgTqd4fu6TQxQ7AYVp7fK1aKSGdhsKFSWt7HGUX/4fU5HgWD0O0HZeGWR
         gO0jA3unzMgTiSzuVz/0MObUlTtmZ5KNhs5IHD6lr5HmeVx1e5ZkHgMBmKwANx4S8EXm
         2oLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006947; x=1790611747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIjc3MXIEI1WNzfDBHDw6Y+wt0nahAW6usfM1evUcdQ=;
        b=IFLQAhAdhXaKcyPilhsZWgOpMlFdFem5mkpYXoW7EGXNMHZ1CbSrcFSwJONDvpux8A
         vAnBuut2U+Q3k1/8f/S3K+5NCKQoPCk1rocUlg8PiAQF/9Hr9Tp671h3mx6wCJpE/QPk
         iWJXf/s1hvb6HyUwGfO5/jZRdC6mwdll623HIJODlmvW5o6HzxdbjLs+WZ2kWnzlP6dW
         YDqj6vHRd7sdC20fvb0BerZsxmL5cw2KJXRlm7erOM/QLNwdhWqsKl2OglVh7JrwmmFA
         9vkVB6XjzZ5p4LKkI8l0GqQgQjGDycERC5KIHKFatfxQ4GrNQ/tQr7hjkRwoP2BvOL+I
         uT1w==
X-Forwarded-Encrypted: i=1; AKwUvBwVYp2QsPMTixPdMCzgIFFYQOgsu1uk50huZ1BCpSjiQffjgye9kZt15eZaH1EE+TZ25UodCUryG+w=@vger.kernel.org
X-Gm-Message-State: AFuF++lkZOMp+TNy3iFGyCMOJ8Q6EK5RMPE2ijFKaeC4uHtynJ/WG+SB
	QU389eoORy2T/cT3VnjE5u6GKWGXH4O2yPnjCMXyCByujZVOmNDvZJ8g56+EsDrmzOLgJ8+cIxt
	06X9YdlGfk2kQ/CSuW4AsibauWbT9KYo=
X-Gm-Gg: AYBFou2SxTeKZAaGGZyfHt/xnuhyYmlJ6MprOHsweDWGj63KNJda1+P/goajTHKGXTE
	mptonnlZqm2bzQM2EN2LckyCt/DKvqyfVe80GoQgZvd4KJjTYFhmaatt6NPxEk5l4A/V0WbRJp6
	lUVrFi711tI/9cusancbedYRR6nBjjDLmgAuuhPzTx4/JL60ef8Erh09vapYddny0oZ8uRmLvg4
	Dc3gwKX6l5Fjy0dQVEOjCW3//sB/9wPWFc6G7LCw+g36VOGovAt8/tXxKyKbtiI8vIiO9GGfoFm
	mxRhFvblPF4oeiP+r4V3uu86y56f1qWFYfNJ+JWtdabn4WduG3Mtk1mGNPqgNT1kBdpyK9LfplC
	/R/gZJfS1zdSoHAJaDuE810FFuUrMQhRONlVsvTAKUivVtb7yYEXeJTYVQU7sdD5dOCdjASgM63
	FhzWA8qIZsoTKRguyfVG4bfQiFqW4OgeFtY/0w5aEFCXE77HMT3Q==
X-Received: by 2002:a05:6512:65d3:20b0:5b8:c6de:48f9 with SMTP id
 2adb3069b0e04-5b8c6de4cc7mr1586547e87.4.1790006946532; Mon, 21 Sep 2026
 09:09:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
 <DLHSL43HJVOM.2LMYD808W8FPN@nvidia.com> <arFPKcA1RCecTfMD@redhat.com> <CAH5fLggOMBVi3DjQSmLtstnntgJQzDsQjEt15nRkiNi7EuLB8w@mail.gmail.com>
In-Reply-To: <CAH5fLggOMBVi3DjQSmLtstnntgJQzDsQjEt15nRkiNi7EuLB8w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Sep 2026 18:08:46 +0200
X-Gm-Features: AcwNN1XQ73lDz4xpLQP5yNOyxGkJdAQw7Y0pwDB52hNn7bLVuCDQdmrVcz_Iz7g
Message-ID: <CANiq72koa5rBohoBg4zaawBUPuhBatGouBzqTWi8djxMaaLacQ@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz` constructors
To: Alice Ryhl <aliceryhl@google.com>
Cc: Brian Masney <bmasney@redhat.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Georgios Androutsopoulos <georgeandrout13@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 5:51=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> My understanding is that the "default" way patches land is that the
> subsystem also takes Rust patches related to the subsystem, and that
> the rust tree is a fallback tree.

Indeed, the idea on how we suggest setting up the `MAINTAINERS`
entries is that, by default, maintainers keep control of both sides
(they are the experts, after all) and that, hopefully, they get more
involved on the Rust side etc.

It makes sense for reworking the subsystem, too, since it may happen
that a rework on the C side may need adjustments on the Rust side etc.

The file is already under "COMMON CLK FRAMEWORK", so in this instance
it seems fine.

Brian: in case you want it (but it wouldn't be needed!):

Acked-by: Miguel Ojeda <ojeda@kernel.org>

As Alexandre said, we may want to rework how these work (instead of
panicking), but documenting helps for now (and whether this counts as
a Fix or not is, I guess, up to what you usually do in your
subsystem).

I hope that helps!

Cheers,
Miguel
