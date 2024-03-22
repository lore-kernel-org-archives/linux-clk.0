Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F3626DD
	for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 18:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711130991; cv=none; b=eflZ3hJDqtdDCccaiD5ziXb2fxs+wI2OYOomhOrzeYsZuibuQYPkrT8PTGVeLXyExevBdsu9VNepJxK3BuOlnqnIajMYwdT4kPbagktrtc+iUQbxA5Z3VCfQC8vJQ9TmHUOkJkz34TPg6V+qwdgmXRubd3lmODdzKjyY7py1WyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711130991; c=relaxed/simple;
	bh=B4sbDsuOvZKIeibg8vvbrEb2XScnKsrmTvz+Q6EZUB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMscZmUC/LOi9E1IMdvP3H8rZGXaxMzH4CtSg9Mfhm6lgYGq+tR+DbswXzrrqH37JkL8uOx4fvhp9ICJg/z7IL5KUVMgRFgfTh9jOFF78j0tLvJiR+x3yZzXU+lQpVa4E5bUz/9LiGE6bBTDSO0Ax3wy5jXtIEAZFXxevZyc9XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kwQByvCX; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kwQByvCX"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so1522000a12.1
        for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711130989; x=1711735789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4sbDsuOvZKIeibg8vvbrEb2XScnKsrmTvz+Q6EZUB4=;
        b=kwQByvCXNEoWTTK/etf485vcHqxgMeyoNCiDwfje8rgLt9i9QjipTFJCSpyWmJm+7p
         gux4BUF1nLSK0nJZ2Wwb/wX1NbRa3zGNZfrvB4SAN+WZ1tPIriivuleOL5GipGYWM1Jb
         wYg83WeSLfuxB9aBU21JS7d2eWTgL/7ACCpCDau4zWDR1pd0Yw7C9M/rWPIoZur27u6I
         vWiDCf9oh7iCxqYj5IB3rZEn1NF40214KuhnYMhkFOzPN29ymEeoN2THuMctcDRr0wVT
         vekaC1NphHeswQexuOlYyJFp1AgEuYQ9B/o9zF8chLr7T9hDQs1TeMbVZtV0b4I6g95D
         McEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711130989; x=1711735789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4sbDsuOvZKIeibg8vvbrEb2XScnKsrmTvz+Q6EZUB4=;
        b=TLkXFn3Hn+pd0GMHlLijx3MbDGtzSWI4Eram6x6xellRRc5kdf6CRdEQyWuMOK9znH
         A27mZNdgta5f4P+a3r+z8GcE/U+pECZd5Ds8hy/qHB3qhG4XhaDHEETqkCp8sJIGACF7
         Zw5QEUffXU+z9gmBaEm8F5to5TZLRWvDbqrGE+fgqE53gzIyRw4LIpufvkLRKVI2YJPf
         jfgv4r/gQcWS8xyLlsTLItDZ2XF40vcY+tWjoXIfuCq0Um3qsCelh4BsqQPZECtZt3po
         1VS5DnJ9vifOvoKZEIPx50ATfLQ2LpQp54mhh1OgkIanwaeIO2Sqqd1DAZxbaq6NA75G
         dHsg==
X-Forwarded-Encrypted: i=1; AJvYcCVmPkQ8tC7qXfzholcwL+31YnkFuJtXhrmMck2/i9a5YFOiPGuWy/qW/owKwTcPnFP9kh4LtnL2QF8Zo4D6T1kn9Qo8DbI5suOV
X-Gm-Message-State: AOJu0YzIKrCaDHVtXTR1ArnxJOtNQnKIai+cXKLfJx6z1dQ1CxnIOfz2
	VfPvdFNUXMB32oKC4vyqath9BfnuVjHoKKZj9RlPOuJwDHu/cjNuhulNTqF+SzU286pf047HA/p
	Lq3xEPItA8YGBYGBrZa2OqM+J+RlI6+AJ+3jDQw==
X-Google-Smtp-Source: AGHT+IHbIgzFZJrnayUw9uaEmWMhyoSB8z65Yw2YoZfEhl+AX+br8325k9E+8hMkgDwJHkwpF+BkhWneNlLVoUeaygM=
X-Received: by 2002:a17:90a:6d61:b0:29c:b540:706b with SMTP id
 z88-20020a17090a6d6100b0029cb540706bmr424792pjj.17.1711130988988; Fri, 22 Mar
 2024 11:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229122021.1901785-1-tudor.ambarus@linaro.org>
 <20240229122021.1901785-5-tudor.ambarus@linaro.org> <CAPLW+4=jSr6ZsB7XekXsiUBm0SmVpVFnqpgjViuF3=HpT4gRAg@mail.gmail.com>
 <867158d7-0d98-4058-9c2e-6b573ec68516@linaro.org>
In-Reply-To: <867158d7-0d98-4058-9c2e-6b573ec68516@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 22 Mar 2024 13:09:37 -0500
Message-ID: <CAPLW+4=nRjRPdu80Y3izifxQDNUaJymU3di0hGErm1dHry3EfQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: samsung: exynos850: fix propagation of SPI IPCLK rate
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: =?UTF-8?B?6rmA7J6s7JuQL0pBRVdPTiBLSU0=?= <jaewon02.kim@samsung.com>, 
	krzysztof.kozlowski@linaro.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
	peter.griffin@linaro.org, andre.draszik@linaro.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	willmcvicker@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 4:39=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Hi, Sam!
>
> On 3/1/24 00:13, Sam Protsenko wrote:
> > I fail to see how this patch fixes anything. Instead it looks to me it
> > replaces the (already) correctly implemented logic with incorrect one.
>
> I opened another thread asking for feedback on whether it's safe to
> re-parent the USI MUX to OSCCLK at run-time, find it here:
> https://lore.kernel.org/linux-samsung-soc/71df1d6b-f40b-4896-a672-c5f0f52=
6fb1f@linaro.org/T/#m588abb87eb5fd8817d71d06b94c91eb84928e06b
>
> Jaewon came up with the idea on verifying what the downstream clock
> driver does. I added some prints in the driver, and indeed the USI MUX
> re-parents to OSCCLK on low SPI clock rates in the GS101 case.
>
> Thus I'll respin this patch set fixing GS101 on low USI clock rates by
> re-parenting the USI MUX to OSCCLK. I'll leave exynos850 out if I don't
> hear back from you, but I think it deserves the same fix. Allowing SPI
> to modify the clock rate of HSI2C/I3C at run-time is bad IMO.
> Re-parenting the USI MUX to OSCCLK fixes this problem, HSI2C/I3C will no
> longer be affected on low SPI clock rates.
>

Yes, please leave Exynos850 out of it, if possible. It's fine with me
if you send it for gs101, as it's you who is going to maintain that
platform further, so it's for the maintainers to decide. I'll refrain
from reviewing that particular patch.

For Exynos850 driver, I'm convinced the SPI clock derivation is
already implemented in the correct way (exactly as it was designed in
HW), and doing anything else would be a hack, and frankly this sole
fact is already enough of argumentation for me. There is also the
whole bunch of use-cases which I think could be affected by using
OSCCLK, e.g.: clock signal integrity, runtime PM concerns, possible
interference in case of automatic clock control enablement, etc. I
don't even want to think about all possible pitfalls which
implementation of this non-standard and undocumented behavior could
create. So as the only person who currently supports Exynos850 drivers
(apart from the maintainers, of course), I would strictly oppose this
particular OSCCLK change.

> Cheers,
> ta
