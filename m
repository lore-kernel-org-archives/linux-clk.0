Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F3C2E5B3F
	for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 22:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755814928; cv=none; b=bsaPo7mZZrdAtGvXFQU7y/gY985tcHUpI2fj+SNKGPFMlnocIJ1u6i2C04oR8JaK0p6wrLi7/LSZxnAWfn51KsfWvnnOebUsWJZBkCqk4WJWKM2ixnZ0FTveQuDmcApngExuhLijEkNYNvsD2xRHHmsGbQhrkkMku2GUyY+AW9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755814928; c=relaxed/simple;
	bh=wfvrOUarsnAgVOaXTV03r1PbaKh+yXIIvvT8ysYqXk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FE8BBP0jTLHlq3XMWq4Em0RUwG9c9PJVCmo8O0FnTeRvXgSLRnkPHJBjUn44ItAqkflK0gwQn8JHnvEqFNkBd2y5t4UrUqlwQEfQxa69VLI2dgyz7hmmdMjwrnPwaoqiIOP9bcBcrMx7iTJ3OV9Uyf7mIVGJP+AJbiGb3c1CLYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=HeSqW70C; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="HeSqW70C"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d60528734so13163137b3.2
        for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 15:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755814924; x=1756419724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBj8SHJfZNGuq71dQKyp+ING7ZoPtD6w+DOcmGVXVSg=;
        b=HeSqW70CJbGyo42KQLImVE1GO5VaB+4y5Nf+hi2EjObKOBIHBbckeP6QHGgsPh9SNX
         EjEggCtoiSac76HP+sPHbAXZ7zxA06XV1lVwqQ2FDkQPcCQFq5FiVjQdSqHHFbZSQ9Tf
         GvLoaBCwyjPjXRbglhq62YK5lgOjRqJQKxI6iXFPXoSam9U3H1vn9V2w451RGyWNxv1X
         P8dPhayyce3ObgvQ1kP0VlAgBdwC0PAVIsyWmxwnWQIZOJ4lkB3j6vdJG0RNO/gyYYmQ
         722xr8iTej/7N4U+k5IAAeRs1NXR6kTvlrR1VxJXK+RkGYm1Y4cY8HfKXy8HOl+MJfr+
         mZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755814924; x=1756419724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBj8SHJfZNGuq71dQKyp+ING7ZoPtD6w+DOcmGVXVSg=;
        b=DkJXUTMbOKSgm5AbCqNwT9At5hq4UP5ldwmX30OaSGgLjA9Xn0UDju4pLPv0DL8CSy
         ZyAB2uhzDJ8QUH78ewjVbNb13PXDTO7yB7TZnKhaSFuLYRqDST6kpULEDGEnnl/BZEU6
         efU340dhIjDTw2sGHBJUzM09yDvYz2UBjbwYuI8uiW5DL5pZdZqbCgj245LFU+AVOK4H
         ggTuLylt1MBx7lu0yIsXI5CKo3crGs1uGMOuaM4PNUPwQB9kl2psHWqr9nN6dKr2rK+V
         n/ja/HWgjwQCDH9GztTgB0Ly/vxSdf5/pikF40+VjfeFBnBignmcr0EN9c2yQ8eyslsO
         v+aA==
X-Forwarded-Encrypted: i=1; AJvYcCXHVii9TIN1IjWT1t5A7cpPQ3CR3eRiSgEUVrWKmJVTuIEESk1MAVzwCNlSr/t5mWy0HiYu4KlfEqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVPTvQ31/s2+cjMWqOuDplRa/5UpQFV65u7FG+AzfCsTK5Yq9/
	ZoOSPf8Bsz6ThxGJP6dTF75ZuxopGZJxzbAvgZmkVjx3eNnt2FjcTOCjg5rqthqUpzIBI8V+7t8
	blJwb6tWtBdTEB1KSUK45iso/TGBhzKNVMez/MYtn
X-Gm-Gg: ASbGncuXBD0GFamSpALRb+dlU7nFT1p8RlhfcabARdgD54oqdU4NeFdWNPoy1D4uWgl
	Q+HwBSx74dgkfAX18OFmYQck40msEmKV3QpHQZfM61r1O3l2iIXhk3FgUkK++Nd8GY5++GJWCBY
	yBFdds5lhFggRkaGNGiBmVw+Goez0rWdUUnI2GuUnV7XNgjLsvmGrNTHmS9FlDaD/cDPN5Ym/79
	4PgeoGDQ7wYnUbX361vl2NcP2oHbKz5JjORgtATCWDngRvOKMfXXvzsOvwVEA==
X-Google-Smtp-Source: AGHT+IGsRvIzVdiLiubOw6s26FCV+8GUBa/zvOZHQKwnuxp9m8DDW2C1NVHDopq1Qw9f3dHJcaZcP9J53I+yjNcPN2E=
X-Received: by 2002:a05:690c:9a01:b0:71f:96b4:9adc with SMTP id
 00721157ae682-71fdc327bd2mr9169047b3.18.1755814924223; Thu, 21 Aug 2025
 15:22:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814200953.1969944-1-da@libre.computer> <CAFBinCA2XZfiY2ESDSp2WyM9r-XB_LSj9s91woU9iWoQKrp6QA@mail.gmail.com>
In-Reply-To: <CAFBinCA2XZfiY2ESDSp2WyM9r-XB_LSj9s91woU9iWoQKrp6QA@mail.gmail.com>
From: Da Xue <da@libre.computer>
Date: Thu, 21 Aug 2025 18:21:53 -0400
X-Gm-Features: Ac12FXxi99gixxdRQMIukXDBwJ56n_o8uuNClN7qs096fAcZ04uxsTATA3IRRuY
Message-ID: <CACqvRUaZaoh7vV7Qo_dtnxC-NE227rY7EQe=dx2a_nCcfiZB2Q@mail.gmail.com>
Subject: Re: [PATCH] clk: meson-g12a: fix bit range for fixed sys and hifi pll
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 4:43=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Thu, Aug 14, 2025 at 10:09=E2=80=AFPM Da Xue <da@libre.computer> wrote=
:
> >
> > The bit range 17:0 does not match the datasheet for A311D / S905D3.
> > Change the bit range to 19:0 for FIX and HIFI PLLs to match datasheet.
> I have:
> -  S905X3_Public_Datasheet_Hardkernel.pdf
> -  S922X_Datasheet_Wesion.pdf
> -  A311D_Datasheet_01_Wesion.pdf
> These state (for all three PLLs) that .frac is [18:0] (that's shift =3D
> 0 and width =3D 19).
> I get where you're coming from with 19:0 - in the context of this
> patch this can be misleading as it would mean that the fractional
> divider is 20 bits wide.

Yes, I was in a rush and missed this. The description is bad and I'll
spin a v2 with the Fixes as well as report the clock differences.

>
> > There's no frac for sys pll so add that as well.
> I first read this as sys pll does not have a fractional divider.
> What do you think about: "The frac field for sys pll is missing so add
> that as well"

Will correct in V2.

>
> I guess at this point this should include:
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> > Signed-off-by: Da Xue <da@libre.computer>

Ack
>
> [...]
> Have you compared /sys/kernel/debug/meson-clk-msr/measure_summary and
> /sys/kernel/debug/clk/clk_summary before/after this patch?
> I'll test this during the weekend and then give my Tested/Reviewed by

Will provide in V2.

>
>
> Best regards,
> Martin
