Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4731F869D
	for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2024 17:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734456692; cv=none; b=YmK5l1jb0rtMJl2lPG5kr+Z4tlJbhfhB2R+fuQxdyoEkOpOPMZcFQYb4rBRpyC+TUgQXxwS0EYUOLv7P+Uasq56riuk+KuDKDfw32m3MGYpIcsMMCuhS1i3pmoHNFYk0L+fEd1cJNTEXAhMSquAnGZzqeGAOnDRvoluthABsEw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734456692; c=relaxed/simple;
	bh=nXDuBvLd+1EKGqgHioo2pMPsq8yHLErJM7sCIrUm9Y4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=im4F+sYe5t+45I6/3/FlYBKkfYctzgnLkxKU0BM4gkKi4M7W0yA/0JKh4xuoQ3qii24X8cPb4ve9pLY3gxN/d7c2KGIxiRwQIAKxm1cYfGfECXu/SdahFioZvkhvQBfvF3b+YmEpDfaDg/Q1+BR1uSO07Fm7Ei1asv+In11Dboo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2WNyteep; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2WNyteep"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30225b2586cso68414041fa.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2024 09:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734456689; x=1735061489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ha6x+lGHmLlm0UbTzbiX5UUE3514H5VFpUkco5PqOI4=;
        b=2WNyteepL2ewQYBK5TlPkQ4Mtwb1u6BJYv7qRR/4zePioq4MvcYpn/h8goMgQxata4
         qSakQeHXbp6wYVZJoRP2tFbZLetAliI7zToCbyyZ2ZqsoDyYYWV1mFCupcc9xdfq08PN
         snRByBfGS6Jto7+q4QZ751MKCOtbsbXmuhLUHEMvG+MEBaLQcPLubdNFO/56QgZTzoG1
         sxphAg1BVRu7wYbcWnBpD/XCQGldHEys/BFYXwhlVfznC1DiTsd6V7SsVX5svlplb/sQ
         KOVoaI3+m2GB/imHpoOs579gjgC/b/GMNFgJSfe5zKAAO+Ur3SEU/vdD8B4BmhRdbQkh
         Xrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734456689; x=1735061489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ha6x+lGHmLlm0UbTzbiX5UUE3514H5VFpUkco5PqOI4=;
        b=NwsLxmUH95P2OcfsdO1VJb/RxEDxzpHLaCRSNrpUXJhXMc7h7qK/kOjOZJDQKfM26k
         sQcj1vpnfSkRfmGlUiHQ+xM4jNZjJ3duxvsv2G7CpyuL6eoMHZAkJqg6eTf21ITdab8+
         VIVnTdDO3oif6Z0sorzYXDG5sMQP7wJV+afaHsaqSt6tpIvfz7eTLF3lfp4BZd9PEeBX
         FRzBHIXfxb3R+O56x800K/D1ULPAzCZ9dvlKMgBQpG3ApPCSMJ2dUqKQbzgFfmnmxgHE
         nVD0/Ybh+NJD+H8IIhy4pa31iA9z8MeWSo6OKdf1YThDw1XQRdhdnpB3vuJvO7TJ6we6
         tFUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtQe7vfHr//aMONrl+yBfLOE2WUa7B58Bd00pClP+uUREgxnI9sQUieK1kv1Ye3JbksmgS8WAGMKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNGqCCqs4hThQK2cH25sWCvavbsQB1ACxHd7cTmghGPrcqgYEJ
	2yJnmZKi3/GwC1PGDa3U/2r0lDdVxk5q23vwYJD5Hg7ewJ+eWQRJNlP35Wv6yTt9UhUnRBDQ2bs
	C6LzXbXO6ZqbyDdGQiYGi0bpwcGzhPqRuLAsijGFKFjDkcuK+
X-Gm-Gg: ASbGnctuACN0ItB2NfQNk39dHrKmQ5ovTNaK//jKkbvMnQKEd/d2pWgNvH8dcl3MTcY
	HCYrjCQUxHR7mS74cVBRJsXafhB1Bn+63Ypoo2ozQ93Xfy8ZbpJ16gDv6z/4ZXia5rx2GFg==
X-Google-Smtp-Source: AGHT+IE0+qBlPfdjH3ZmpPdMyWvQddJuo9UIcBPstM8vHde6sb0s3OdX9W5zKPsV4XBBJJyIFSpI+q8iXkW0F89H5M0=
X-Received: by 2002:a2e:6111:0:b0:302:1d85:1045 with SMTP id
 38308e7fff4ca-304443cdf00mr11679581fa.20.1734456688714; Tue, 17 Dec 2024
 09:31:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210175723.127594-1-brgl@bgdev.pl> <24fb0bdb-6d59-424e-bb8f-a9d54d835f4b@lechnology.com>
In-Reply-To: <24fb0bdb-6d59-424e-bb8f-a9d54d835f4b@lechnology.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Dec 2024 18:31:17 +0100
Message-ID: <CAMRc=Me7VAOc=p9skjVFb+m82HVEouL_zMpwKg1k-mMqLO7G2A@mail.gmail.com>
Subject: Re: [PATCH] clk: davinci: remove platform data struct
To: David Lechner <david@lechnology.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 9:29=E2=80=AFPM David Lechner <david@lechnology.com=
> wrote:
>
> On 12/10/24 11:57 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > There are no board files using struct davinci_pll_platform_data anymore=
.
> > The structure itself is currently used to store a single pointer. Let's
> > remove the struct definition, the header and rework the driver to not
> > require the syscon regmap to be stored in probe().
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >
> > -     pdata =3D davinci_pll_get_pdata(dev);
> > -     if (!pdata) {
> > -             dev_err(dev, "missing platform data\n");
> > -             return -EINVAL;
> > -     }
> > +     if (dev->of_node)
>
> Or just leave out the if here.
>

Right, that's not at all necessary.

Bart
