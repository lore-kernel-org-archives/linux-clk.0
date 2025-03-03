Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7641F0E2C
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740996332; cv=none; b=MvmfyFoHpTlN24qiT05LCjIZk+9RrpE0cMReor1/RF6dd5/EbcMnISXKV8bTyTF/SGsYJO0AFCSZ8BM3LDtLlozDmwWGik6kuQfva1Z8Lofq2vL2R60DwUctwqC4BTnk/SNGS+XIham1utGo/uqCR7sumxHwsyIlg0IcdsJNla0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740996332; c=relaxed/simple;
	bh=7QyQstdhk1iCcfADNLha/6aG2uup2vCJ66MTtxh2nZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZy9CBRuE0UlzP6DYm9xON4mfDSklDRFOzPT27mVo108aSoOH9Yo7jeSJsuePomK8sW1wEsC4jLwfoxPVg6HyPBSo23DLpqHyvnQr1Rigg6gnJWW1bNFVSiczfdWFHRGPCmI3WF4ae4f/TolXDoY4xQmVOFjVrS/q4bL9tQInrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a0brHlXU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a0brHlXU"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43995b907cfso26346425e9.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 02:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740996329; x=1741601129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QyQstdhk1iCcfADNLha/6aG2uup2vCJ66MTtxh2nZg=;
        b=a0brHlXU2on+kl7ovToLUczsXU4U8kwPaZd+PkQlBdcT51KLmbcFyk8WXmNC5Id9JU
         jVKp424O8JTFpuMgYReujkGEZ4/W9b++mGMryJYsuU62kZRFjPyOJPgIwafLoTu6OJa/
         aJmVc/6kobfsq5QfM3mV/rvEE6V6ajHMBcyzV7csVOT+sKOKY4B6KkG8EBii153iqjkU
         VwayvXd/BX/eHY5mH7v3aIFl5CvcOk7H2ALFsCrq26M0+BQEF+Hw3kT2iKB7JS6B7rnk
         7R27n9fSJHTHui0z6wkapCp2B6KjsOUp/YTE/Eduo1WiYVd/Bcp4ExLmu1VFgqjRvSrA
         nq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740996329; x=1741601129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QyQstdhk1iCcfADNLha/6aG2uup2vCJ66MTtxh2nZg=;
        b=Lbqu1DBhB/1juxSLYenfdvvZ/P3zx5aLXIxJowt9X9j3r3ga2T9SDOFZGlxskezhuo
         lK7JSS4PfjTf2bvJ9KqMnacb90/QxBbA1fbj3kdq/bS0cTskJ5KqqFWdxK/QI7oI/XmR
         6bLU4mvK4jaB9IQNro65/KypivuL0DLrM+Hg6YEESn9YkOI8cFYzYCtbLuumC8pZCz+P
         QiKtnmM+NHqHeTy/2UaOLg1silhzlsjPn2VnxIKJU/lciQ047aMu6uUWgfMI866J9cXb
         nnGl1/SUyVEwjfoJqEsPkLhHUCk0h7RdeTeKMG+YanFBOPW6L8/hWAHj+xKooXZnpGNa
         lhog==
X-Forwarded-Encrypted: i=1; AJvYcCVG4V2mOzgSpJc5LlJKZY6HPN/BVuw1wnJgzJSJCi1yEmgU/yHsB+7HkIoooLvglrCzrnVYDEuyjYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRGdrbPuPDThZiqxq/vR2xAKlPv/aqR5Wy6i1XlL6qBq6L4yL2
	cik01sj/q2l4ARKmh8CfYSSiUygMYAftN5uiF4SPxcNRr15K1u1e7oul5fGnixYBEpGuCdTfKCe
	PRegoR46AAUaJ/ceLdELM92nZwJInrFolyF0F
X-Gm-Gg: ASbGnctLGWTK7OwwDWWHrMSMBdZ9oJa8YjIJoO2PhVmBVxe12fnvGPMqizOpK1qYEDQ
	Ibdld+wXw5jcWRDtVfFuIBFs75xZd05Fc2YMtK+XlGiGHhVHsVtHk1wRrf1BECKcBa5JJejZcAC
	egw0D/ORnF60Xd3SLaauc398JIbV7Gkz8GGBuHJbMX2PM0dhoFNIA0chPT
X-Google-Smtp-Source: AGHT+IFEmyW0EbB6Ka9yQFfGVEPvOJqwYCEl504db3Ko2DygqJYxclr7CKQSdflmS7+pNsrqn4Y5OCDx9d3jRQoSqPk=
X-Received: by 2002:a5d:64a2:0:b0:390:d6ab:6c49 with SMTP id
 ffacd0b85a97d-390eca138ddmr11915449f8f.35.1740996328672; Mon, 03 Mar 2025
 02:05:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740995194.git.viresh.kumar@linaro.org> <171b6cd811ff4e913880ab33bc11e634f7cdeecb.1740995194.git.viresh.kumar@linaro.org>
In-Reply-To: <171b6cd811ff4e913880ab33bc11e634f7cdeecb.1740995194.git.viresh.kumar@linaro.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 11:05:16 +0100
X-Gm-Features: AQ5f1Jo64QlrJ8dyyVG_P39vJUDGWo2eEl4f6vfHkIrvzl7tE2S1Ro0v3PDYRZA
Message-ID: <CAH5fLgjNE7BF7fC6TxO3NjKV1OHXRxZFKn2Bs6fy8h_0zYd1tg@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] rust: Add clk helpers
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 11:00=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> Non-trivial C macros and inlined C functions cannot be used directly
> in the Rust code and are used via functions ("helpers") that wrap
> those so that they can be called from Rust.
>
> In order to prepare for adding Rust abstractions for the clock APIs,
> add clock helpers required by the Rust implementation.
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Did clk maintainers ask for this to be separate? We normally just add
helpers in the commit that need them.

Alice
