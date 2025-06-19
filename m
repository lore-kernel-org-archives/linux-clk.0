Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D10F7DA6D
	for <linux-clk@vger.kernel.org>; Thu, 19 Jun 2025 06:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315539; cv=none; b=o15DTYsTvJqXPlbpDVQ2yEho3Ca4cvKhRER4sxve3PSIjf1cMd1DJ39jSKoCyOzkncMA3wBE9o0B6xKyIRyy9yqF8QL60KzafqztIycaFgnJctaYnIhRQvihDGQckYgOVGiW7dkllAoh76Mg2gwMXDJOiTIAo3LTaXT1RJBn6T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315539; c=relaxed/simple;
	bh=+eaXs18pbIdN16VjbFQKb/82Ep6y4XInUcmQiPzMqeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPXjBj8yFgUdkf9QjWFeEIpAUUhajI04TLzH47dmc9Plro3Zq//K5fiq9fbKX9b7B4LpIDgxEJcbYAmhQ9HsScCkJPBtJ3n3hmk8eT2GuVL/u/nxtWDPmcoqYb0Pzx2LEnAaZl+rRm9Wpv9VQBC0XSIclCgsdX/uFpEXyy2NVHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hkoKGdU1; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkoKGdU1"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747c2cc3419so276515b3a.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 23:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750315537; x=1750920337; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ErliHYPaGrgVEE/NGmtD/hd2ZJlTMAp3Vp1b/8FHHgk=;
        b=hkoKGdU13OY4Iw/aWO1ZtDgxoon4Us8wm1qV3TZ9LplmxbdVY33OJKwNJJM2wm1Pzz
         MYTMegM8u4PUVJGfznIDDD59S4u5iMOpl+uTZmlDi1YXAyqXLuVBIbRfCNTAGosishlK
         3MJlqu7Jeh3Mlu6rscioaO31Zf3OUTVQHKayN6l8cSisHRg7ry8ubOFK2dJ2bFg+e51i
         GElKWybjkIc/RQnXHgGDoU9v0Ao7Thr1Jm7zuAMseQX8lQtFOx/zbBg5K+JNVbLIByvh
         iOXMANgTgbQ9JXS/hkHHifWyvPLw6xltX37mK5Jv9e7htqHX/Th2wj3CF9MFN6lcIpcU
         lfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750315537; x=1750920337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErliHYPaGrgVEE/NGmtD/hd2ZJlTMAp3Vp1b/8FHHgk=;
        b=HzYFLYp5GakwldsGtgS+MJ2wwiBIoTI+sufdkC14RSAwZZvN6DtOnM0r03V0aQUHLL
         8gPABS6m7/NQVZwQ5+ESffMuU9Oe2/r2ZvDCu8UdaW5v8U12wkrMYCAVz1oYn6Ks9Q3D
         D5w3LSK9mTFg2e6hQgHEJ5qV977OyB7nHpKj07sx1/s+exBWRl3u7l1g4aNgZjBeJhIc
         qwQQJDrIUFVCvcc1mUV0QXUKIEkUvBKTqUFL2R72rYCBaDwA30KH6yPeE1i/LECeD9wH
         /aV5OYjSMwL2a9qS91iUF3sxlIxy7OikDUEShG0RmUMaEmLk02k/bFgUxpQ8RYl940TV
         0Z6g==
X-Forwarded-Encrypted: i=1; AJvYcCXiG02d/UA8WO3afbIDn1GfFwVpORlPpzjvbF0fDMX1kkkajB14DXNeTBy6Fs6xzQZxZ0FyEz4Cv0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaxT6B/P308NYVHmpdsKoMKxYJfmsSwiworx0i1wIoJ4KInMsM
	TPkEW1JHvS/lvEZ0dQuDiaLns8uo7CbwpV3VKt4R/xg6O+waPjuJHHtMkEQmRn57xHA=
X-Gm-Gg: ASbGncuva6tXMkr0vykCgESH3WVT+xDmtWttnS1yfs1DFXoNjlWDH0qV78jLJEVN7Jp
	dq+KL1HdlFWxQZAC85kX1fT9YK+Pwyeznlv6YanUyPt/51nbOzLLCva5ZSGg98H8ITgL7I8Dj9t
	IgBLc75Kzl8qnDbMy9IQY3sihIpsEZILUmARRwRYtk/wSZKVY31fZnAH55MuGnWfCLL84qECaPA
	8iVT2UxBmAm15WK5nBIl6ZycZo2nt7j/KGpX0CQtA0/9pVN1fqEVGIXL1rHZsMP4kiMPXYgA1ty
	TsLKb0xHl/H6juUtnUmIdsLfyUhIi2ZlrnoNBtwsVRJo6Bikmg66+ot9GS449MJ267vRBN4Z4g=
	=
X-Google-Smtp-Source: AGHT+IHIpRyDDmSazg/HxBTkiTvghcwJZ4JLLCka55/2JHWzaYB3i4/iq5jFfG6qzHy4OHiMpdt6Pw==
X-Received: by 2002:a05:6a21:6e4a:b0:215:dfd0:fd24 with SMTP id adf61e73a8af0-21fbd634a22mr33361216637.31.1750315537600;
        Wed, 18 Jun 2025 23:45:37 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe163a498sm10335555a12.15.2025.06.18.23.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 23:45:37 -0700 (PDT)
Date: Thu, 19 Jun 2025 12:15:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"gary@garyguo.net" <gary@garyguo.net>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
	"lossin@kernel.org" <lossin@kernel.org>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"tmgross@umich.edu" <tmgross@umich.edu>,
	"dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] Various improvements on clock abstractions
Message-ID: <20250619064534.nipg4rs2gwepxqw2@vireshk-i7>
References: <20250616200103.24245-1-work@onurozkan.dev>
 <CANiq72n0v7jinSyO85vorYRFB=y5NH5roW4xLRjwZz+DFJ5QSQ@mail.gmail.com>
 <42151750134012@mail.yandex.com>
 <CANiq72n3+qzDCCf0ct-5gtQHKXDbT2rr1fgxVQP4qBW69JmmhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n3+qzDCCf0ct-5gtQHKXDbT2rr1fgxVQP4qBW69JmmhA@mail.gmail.com>

On 17-06-25, 08:55, Miguel Ojeda wrote:
> On Tue, Jun 17, 2025 at 6:28 AM Onur Özkan <work@onurozkan.dev> wrote:
> >
> > Yes, it should be "Onur Özkan", sorry. Should I update that part and re-send the patch?
> 
> I would suggest to wait for other feedback, and then you can send a v2
> if needed.
> 
> > where my patch converts this into a single straight line which I think makes it more idiomatic.
> 
> Up to the maintainers :) So far we have both styles around.

I am okay with all the changes, the commit log can be improved as you mentioned
earlier.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
