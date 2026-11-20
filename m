Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795210300;
	b=m0xM1RkIvKTxb/Te0SRq6ino2q6MyhxH9Va+hZ+RrI12Y3Eg8ywoENEpu5+x7ChYJeH0
	 uLO4/mBit86q6inrO6lmrlCk+ONuXHexqqrjcARCI8ptGUyDeToY8DnLaAhdpdb6uHZ7S
	 6tiYor+2xCq9r7VgyKGwEhjTy7pHGqQuN5MIdTE4AxdWMvQ6wAWThIcM6aXV+MtAd40NO
	 6ymO1XQdqJhnEsJEWtPWriVt3TJoo5ERaIu3ymG9oeUWq+KYvMnQ1J9C7FvxsZjDegaBW
	 yeWDoV7cVCQSKUvuyKF88hvKFAS3boSv2SwJNCD003lubzxT4nxd8AlwWZoenTWn/7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
	b=VXr4fXKfI+Lds3bzUp0utmMFGE0LXbXaxyatcj4GnttnzMXJ+dRfsL/eyc+jAzTHzvA1
	 +2r0/tmczwCaHRbXLG9UiP5sMMMWF6/NW9UyhWwmkDdKyF4HP/8jkFwWUUWBdgyCxOhrq
	 GKwPveAVVxfxJ+wzye+Y3AO/dzlvrFszmnebP1JXZ+sb3CAnkA3kwpUi4fCrqpjR7NEr6
	 xV4J3050vRhyfK69EecaWa9pT3STD27YPTyw1NcvGLI95S54DVVywLDAhcfD8i3/4o4Ug
	 PzRFmPpBmzq5V3AMWnboXlqA+GcWtb5PSF5D0uvAFGhbOSpiG+HopAbxF3ka08ttASA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owhm7wLl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FD860A260E
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 21:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0FD860A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owhm7wLl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab3cb83f54so1050091fa.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 13:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795210297; cv=none;
        d=google.com; s=arc-20260327;
        b=phzVV/O+FRzdJ+XaErS2HFflAMv1ij1rRnOIeAkSuMWdbQTXzKMOc3xUuDT5KaJLPe
         CD1X4LqQvzlquaOwLOQgVk4uN8D+ZCDoUPmTIkJu9ZYo4BqlzBS4z8gp9yubrXqleRAS
         FqQl0kAPiA2CaRR9wqHuQtJAhf1gi8NNrlsLUbL758vlv6QEQu3qqLyl20YC1EGn4cHq
         lnyZ0ELtN6Qxd8rJEAEcHiqS6vuvdhDQA5yr86vJ8xHn7n6kDAqvdSubtL3M5OU2FEe3
         DDIng/8Lm6FNQYI4YxALG21NKSNmZgt7Tm7ZrfzOGT1Ej8qnzFXHlga44bNtsjttQNnT
         pOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
        fh=lnLZOrWsWekF6YmsMKMwTDCQc3D0Nw7iAKYa0A3HHQM=;
        b=Q/xYzpB6scktK7freAeBivfqobkMwdHnjQwThBkZVIDRs+X8d1jIo+CIH1aM3UpaQU
         x5coZ0Qe1f9EaHgmctvzReCYgeyoDBLJB2i5HA0C9eP046PtCmnHmVxt+YScpqfI0YH7
         IQK6DHPWIzdoExYKwxofcahQBwARH8AdBSPtfRVlY8qJ8lhvVnwYgRKfBOwzMcDX6MD/
         UWskwvlIN9wCK9vWKX1+mZ+2zTlHW43l2WYiqAdI/CE3cZFRD0N2tnx18Tu0UYVxdwqU
         YjqzScoLivJuigtORvHnaFHXwtsrGNoUyH0FqU8hhXK7jsu6se1afXD4yspTjfEsLoPw
         jwPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210297; x=1795815097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
        b=owhm7wLllg3l9s3Ng9CV1HrjwLj04k4mew4+Il/Z8w5k0GXizWUecYujWL4XpHDtMa
         eS9MRCtEBZwwC8OdUWFwKPDTIlDgdFLHLZUfue/yq/USkW8/TiW1ko9/CoxPtSxP1A9D
         D8MSFcWmlq6iHfxe/N4v0YRGxj23N85NQtLSVROCDnIzR4Uv318mpVWcVMo7jrrlABYt
         YjadBn6OUuNuIFRnWiaLZ5X/eKMo7W3sxO+bCCWoKuFkljemHmv/yxy6hv/IR4N1kz5O
         L3UPxcjApzNrfzj6wR8qTA9djgxz/M4AodemmINAcWB3TwhsliP53LE71qSquskMkxGi
         21ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210297; x=1795815097;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
        b=1hNKAVQvmy/978fXQxihDUrLqHfbu3U7/HhQTdP7O4LGvDGYVARP9spS8Rx2TlqHM2
         LiT3BQtvOBo/gW4xoPt1JzQ/xEGyOU7xUsr+3XO6mq0zjGCvlFZ7VQnNaDClkrRmy7ij
         Lch2iV2cDdURu4qYQ9K8u/VpV3ic2x7//UO+opJyL3HonrOovFjiRtHgxphM3M0kHuiE
         JtfNC2672QVurumjjR0wd//dw3B1ZtUN0LpEXTeqlmK31l0mcaC7vHIgTsdrAsvQEn+l
         1L2A0FKjai0qoD/xxEQTUvbpDJcPCqwilPTcdoYL7OXdrwbm+IGFIufCq0FK34x0QNtz
         +3DQ==
X-Forwarded-Encrypted: i=1; AL+hErFfr1JJ4RyxsQj9ZiOlMfASQLlCmAHogV80cKXA/8xnZ4lvanrPQQviMZeRf2Bx7x58ww70pjYcCWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z84AcquXMvPyUw/x9z3rhzyN7djYW0x/xXyuLQWKrNxBijTVBol
	ws6fMq+dUKh/1sguYYYjpb/X2bEIBjYhiEY3zjyu7KwcXRtNABZ6T6S1pTaEH18/mj0oWmjXYTK
	hTQeuSfXv26g4RIHBwrlROC/M7Z9jbZg=
X-Gm-Gg: AZFdTZfDLzFJXl2iTNGwq7e+ugpE/nu9P2VX+9UmFyttEjnPWFyDiYRjX042bdN/wDu
	tGleNkxXWwkjCaN7QyLHtPnvP1zOeNyQQQTsCyLTSKr3y5dU/4aaYuxkq0+QOlGsdQR0OyWaV5P
	SrXA2xDOiku9zGJHVMQfEDxWujpiKhrG1Vsb1glvkeKPN2O9Id+eI7HtucMNW+beZY2Lk2gVVfz
	1RxmtWB+MmtR5fZbBAZZESnJLr1n9XloG5GjmDLt9Q3hHQcX8WrXYatSxiszwm6lIPDtWkkyyfd
	rj34UY8dUK/h4qnDSL5e0BBNZox+i/7QppTMZiVRNiVfAIAUv/t52+AYc+zvJG/r8LIucdhzIgI
	OvisH/QirIgwQDZvofg9+uRwtY4hor8/hYVFVrPYtEyCTPwaJRw7C/xbjllom4z5khTjGiPMZtn
	Jb5vi/Myy6/hnA9Byff8Pzn2Bm3rZkMuOX1WPkKFyhNwatI6bY3CaukSTsOl1mVU1yrESRUy5T7
	WBpA0APjrKRxvPKeqvuVQdLLDCx+qwepkUOXRS1AgZm7tjvQ9v6k8I1HqTEs8YntnxgPrrk
X-Received: by 2002:a05:6512:1320:b0:5bf:cf6d:ef1 with SMTP id
 2adb3069b0e04-5c1bc5767fdmr1687437e87.0.1795210296624; Fri, 20 Nov 2026
 13:31:36 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <1a1cb87df11.2c57f9fa237371.844135553238709982@collabora.com> <179519331840.3795820.8047048832159165355.b4-reply@b4>
In-Reply-To: <179519331840.3795820.8047048832159165355.b4-reply@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 22:31:25 +0100
X-Gm-Features: Aa3M54o4i_zALBjbkgtOxZes0dCWZ4jiHPCTwn8GOTMZ7mrp5N06gIycRXOv0PA
Message-ID: <CANiq72nOKrAtct_eb7tjc9JFFpOQrN0=5bOyOZo1p4C+4U5bsw@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Clk improvements
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, linux-pm <linux-pm@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-pwm <linux-pwm@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Maurice Hieronymus <mhi@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 5:49=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> I was wondering how the rust folks expect these changes to be handled sin=
ce they
> touch the rust/ dir. Should the clock changes go through the clock tree o=
r the
> rust one ? it is fine with me either way.

The clock tree would be ideal, i.e. a lot of subfolders of `rust/`
belong to different subsystems (the file is already under "COMMON CLK
FRAMEWORK" in `MAINTAINERS`). The "treewide" Rust tree can act as a
fallback tree for files tracked elsewhere if needed, but it is meant
to be exceptional.

(The files will be able to move to e.g. `drivers/clk/` eventually,
when we lift the limitations of the build system regarding that.)

I hope that clarifies!

Cheers,
Miguel
