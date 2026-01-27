Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3AD346ACF
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769523283; cv=pass; b=C8jPD9yC7mriqQfSba0beHiUDBhKKe9dZ6H5coDZa6fjaiX8XvfNQUsTsNMpeiPfk7b+NCxbr4E7IO4bh3Sg/979NJYrb76W0NRcvpMv0jOsHU175UZdFf9m8kMp2qD6ZCDaLctV/RDjSKQHD8Ka8UDen/GYL5hq3NZkD0kZWBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769523283; c=relaxed/simple;
	bh=KUBW9RZ6XUkvKx3qs7FVOF9Kte5loY/oG1ToIEJFoEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUIr8RO7TPCFYAlRsBzcOAWqC2pVUgQAOsCIOss5kfcbV7+ly5FO7EQD15BQZ6tAEWLZZO7Fx35YoxQ+pPQmMeBhFOpwFybhIqt08DQ+/MOvJTfD+YdRmeaOMIbJirFif6eGgyXrLQtXkk8vCe6AfbfDH9m3w1LAJ1JSVCPicck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xkkz4ZmB; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xkkz4ZmB"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fd45a1feso59193051fa.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 06:14:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769523279; cv=none;
        d=google.com; s=arc-20240605;
        b=jU2h8qNEBRZz8IJRw9nFYx6lhK1Pc8buCx8Zi0XYk8jP1TctbzomS7DTT2N+Qcwqfe
         lRJv0K3xhTRv43IQHcyyblxHaJjOxY6/pnI9N2rQf08jA0Rt3fu4Wlngu48nXvWtqSJj
         JERF7PRnFTqG1dsYIkffLTi3VJlVswAmU46+qcbhQc1qHi+QHvQi9XA7D0JrACNcXA5H
         woRAr606Ir26KD7cEJAFoMxRyIJCQLovGmNaiYRvVNd8kHWoUV4CsyMUHSK9iQrU5ifJ
         Y2NLlqaGENGoKSEaUH06lnxxkqJf0erJQ46F3YnE7MdmgBNZeYR0IwL85tirJcYQbiil
         m9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=94DdoxzibB+TbibiDMK+NQAtSkvBwbDxE5T+cBWz8o0=;
        fh=XQ3le4zzWX4YUal+G+AXtzkZGLirL+W2Z986B1uh5sU=;
        b=DyE5h7SGOxs+1CepiMuMiRsfrZGOFS+TTHBEHZkHpqyr+j9VGf74vNf4ERZIPe8Ck/
         Fjb63Tev0O9B4L0xX123SqheD9Yr0/EHICDB23pRu3/RWMwFIFAoe+UBCJtaJvmpej6A
         aH6+Ok4jgzosqwW56CDRz2iCRJhxjMhI6zFO+J+wLzhjaZNynM/LcOfRGCSNIR9ErEKL
         dpJA2RJg5aQD2PyVfrYRD1ABxh0T8FgERIVEkvWi0QA/xYEJbzdL5xWr/PJTzW65TIMh
         wuU06u8aNU9mli41JQoRd+DWVM19Z25+ahruIvkHraRsIgJTyIN+OzgjDRtL8HQtJ7mQ
         MutQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769523279; x=1770128079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94DdoxzibB+TbibiDMK+NQAtSkvBwbDxE5T+cBWz8o0=;
        b=Xkkz4ZmBFsO0cI7kgEekbXLzy50aCkkhU+71B1ELWrWBe4CCN0B1sRSktXrWTuxgji
         HbwvTeHUQTrfV5tSBD8se3cceUJlOhENYL5Uzb3qQr9Si/2dozRLeXNsOxv2aWACVkXX
         A7vPgyjYTI2Bq7mWovZLCdAmk9da5sx1F7AehKvY293a4NEwFP8plZ35GBJZSrnWEY2d
         LvqkXY1CXVye5aMVEUE/VC20nw3ELzcO8mRZGg41HB+zhojIC3eHzLfTUbOtfXP3oFEl
         HXu4stz3myyuPQ+4CqtiEC5zrLQbee35MbbVJthsP86DFRxA0Yaq/XyNgh9NgLLkYr2o
         UYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769523279; x=1770128079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=94DdoxzibB+TbibiDMK+NQAtSkvBwbDxE5T+cBWz8o0=;
        b=DweWl4lzH8B1m/KtB9tva0+V+njVFf5yzQcJSO/xAP3iMlTYQgcgkaaWwUWp6RwT+D
         OMw5nnuibV2YniFCSKyPR88yHVjD86H/BliKmX9XvWwwJeUD/Gmj4R7Xq0y/RVgIv1SI
         LdFfrKJ28KDk528bpu689S0M25tzgQ1xmklqbuOcWxHvq5h1+03GiaG7HXrUff3xKIHt
         qUHKRSSU8nQPy4lR1DzKNUEbIHEl9J1O+JGykSXNSJJw1JyMTWLernL6EFPyNCZ43SHT
         v6JhavCbqfQq6Xy2cwb/3IzRw7bxiehkc+DN08iGXhvS0hVFa7kWQow6rR0TLdGYy/nE
         SF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmdTO4278o31HLYGtaJisrFVKhigMXccqK48L64QC+WhukIIn4/W+21XDNXG7wD9YcqnKVieJavGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpF3FFTKeNqWLj5NNaYSX4XswzqHFYP67Yy16yCYz58qXr30pB
	3PUhRQYQp7W24CrHPbkKUH4k7AiFK17NLrmmyC2FBcw2ZeGMB+Ndu17ecT76PKQVoeAEP0E4Trp
	C2kJdn6n9Z6cbyc5bw7juEjOuu3ROB7A=
X-Gm-Gg: AZuq6aJWWTQUGjo4FpsvsnNpyPUBYQPWPvpeP7/8rqfupYDjNwlYfkquNBAxSUEBIiK
	Kzl/ZS2wPeXESPyBg7Jf/edMu7PFfzqw7Vd5f5IxXag3vfwJypBPY1REqoLLWp1VBtxCrT3BuAD
	4MQjNbroqkmdVKxXif7iypy80qVRHRFr6ah3YZ56XWGiRC/j66Lvxlfid50LnGnf//vHTraRWUm
	Ah/WxRqpfBjnsHLWx3KisSUYDs7Yy7VITdDOgDUBFmpCt9XTowkK6f8/c0uHjVUGRwNxjFrUTku
	w96ZNUBBiwRA0tR+Swg+Vhv0qnykwuJbX4x9fY3BbH8f8d7yQmL2lm/Gt6m6b26cu5OrPpWkKqt
	5JAaQWTwp
X-Received: by 2002:a05:651c:4392:20b0:383:86c:547b with SMTP id
 38308e7fff4ca-3861cf11ae1mr7238561fa.14.1769523279214; Tue, 27 Jan 2026
 06:14:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
 <CAJ-ks9mjBY7x1s_4wqMC8xqWsX2+aCM6NHn0j7yh_+daKiyS1Q@mail.gmail.com>
 <CAJ-ks9kn=0Sm2_1WV4xyzunzcGG1VZDKy8L=_SCCWyV2OkJTDA@mail.gmail.com> <CANiq72krt9De1+WgMh0y8XX5K9RrU-_1FuSp+sKO1Ya8EaVoUg@mail.gmail.com>
In-Reply-To: <CANiq72krt9De1+WgMh0y8XX5K9RrU-_1FuSp+sKO1Ya8EaVoUg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 27 Jan 2026 09:14:02 -0500
X-Gm-Features: AZwV_Qh_QLxn5ei1IIusA7bhY1TdtP-oqorpAeBjx6PIE0AdqLry5Qsp04FSMso
Message-ID: <CAJ-ks9m-0C=hOdYC_z9mNH54fXjnaWpYgZSPaWoJC8rnQ4Kgkw@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: replace `kernel::c_str!` with C-Strings
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Mon, Jan 19, 2026 at 1:00=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jan 19, 2026 at 1:52=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > Michael or Stephen: could you take this through clk or would you be ok
> > with it going through rust-next?
>
> Either seems good to me, thanks!
>
> For context, this is part of a long migration:
>
>     https://github.com/Rust-for-Linux/linux/issues/1075
>     https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a91524037=
783@gmail.com/
>
> Cheers,
> Miguel

Another ping here, folks! Miguel, what can we do if we do not hear
from the clk maintainers?
