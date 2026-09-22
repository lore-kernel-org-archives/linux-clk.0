Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBB043A806
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067189; cv=none; b=CuqhBIMyb7sN70FP0f48vWLyjosuPuAxFi0GaLHZXrdSfpezrOsg7zjGQTZmcM5E/HtIUCACjUZ8Z7PyNtnzuZHL1vcrPSMxFlIuBbk+l32ua4FzsOqgsNSFpeoOQ6jHmKDD5+FNALpyXx1sVd3p2gYa8Xz8wmXGfLJslcZo9KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067189; c=relaxed/simple;
	bh=pRTDJDK9EW1jEeZqKwFH96oBkO/dZl6A0f1ILw5pqSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrEKmcP49u7qUHA/ZUGIfYb7CXnHmrW58cYk4vVmDV9gtKCY88SW9DXZ+Zwuisw/wJHscqYRJW+S4VQnjRJhxDdWs15VCMtSFM8nU2SPF+6HiHUazGunoj/WRfYmNqUR0xqsL5Whg83na9k2aaA8m3TpOyP6oDLITxqk8ISbgk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlhrzD68; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlhrzD68"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3771F00893
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 08:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067186;
	bh=pRTDJDK9EW1jEeZqKwFH96oBkO/dZl6A0f1ILw5pqSw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KlhrzD68zCgzYUViZwYOFPRjRUzOuT7fyO3U3rwgTcrxAwfyub62TdnRVitovVoNp
	 KWR1turWzPPoOsSjEPUqt/wh4YDf90diNBX7nNV/wALDLpdn3no6oQSm5JN6+t7cA8
	 QgoUDdm21iIOWcklji8pn/dj35y9WuWqJBfhjrIhVgs5/w4j/Jho9oOIlIdxXWuDbn
	 2GzOscwzHZZ1WjYL2JNx3hMyXsoOt8KKhLnbODpQzmtR0uF2b4e4r7L2mrlQWbfjIG
	 +qvXp6/aJSnfv+UKTYepNt/zYwNG/0QZirBMWlcIaTxqup2954a3YhRCFQwu/wKdtc
	 TYC/JDJkPEing==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso3866089e87.2
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 01:53:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDH2g2TMRfW9j1+70zCGzSabv1E0Qqpxp5aHx3TgfS0nj3RqE490pOFuS2IU64vNHY+1ieJxGCZd0=@vger.kernel.org
X-Gm-Message-State: AFuF++lT+RcOeiVjkp3k7y1JY3djtUSbUVN4FY52Heren7xtWgRn5Rv/
	aWn/6J4dKsmWoBMLBNtYCVplB3M3IChPbzhNia+NWRaxGzGhA7Tk/CU5Re2XEINvnzlL1HiEE0A
	9DTRmm6PWYndbS+z9GlNetcf6q9vVQrA=
X-Received: by 2002:a05:6512:3e08:b0:5b6:172a:c36e with SMTP id
 2adb3069b0e04-5b8c17f2023mr4223635e87.8.1790067185256; Tue, 22 Sep 2026
 01:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <CAD++jLkCNkcf-gn0FgvLZZTibLUvbKaH6L+=nRqkNZr2iKFqsQ@mail.gmail.com> <39641ec4.7a73.1a0c848bfa4.Coremail.zl020895@163.com>
In-Reply-To: <39641ec4.7a73.1a0c848bfa4.Coremail.zl020895@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 10:52:52 +0200
X-Gmail-Original-Message-ID: <CAD++jLkZ9F3_KQwGDZyKaFYBzO9PXVq+5v8geFE+oOM47KmagQ@mail.gmail.com>
X-Gm-Features: AclHuK9Y1QMax6-R6N3W6XKZsP5OW6rOHXGLWKISlcK8k5n-6-JwlZacROssNGg
Message-ID: <CAD++jLkZ9F3_KQwGDZyKaFYBzO9PXVq+5v8geFE+oOM47KmagQ@mail.gmail.com>
Subject: Re: Re: [PATCH v7 00/15] Ambarella CV75 SoC minimal bring-up
To: zl020895 <zl020895@163.com>
Cc: longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 10:44=E2=80=AFAM zl020895 <zl020895@163.com> wrote:

> No LLM was used for coding or testing. Different developers are responsib=
le for
> different parts of the code. LLM was only used to polish commit messages.
> Could you advise whether I still need to disclose this?

We add it even if it just used for commit messages, we don't really
differentiate.

Maybe this is to coarse but it's what we have.

The tag doesn't really mean much, it just mean "an LLM was
involved with something related to this patch", it could
have been used just for testing or review.

Since we have Sashiko reviewing everything I guess in theory
we should even add it if we looked at the Sashiko reviews,
but nobody does that. So it's a bit arbitrary. Nobody's gonna
be upset about either, it's just some helpful metadata.

Yours,
Linus Walleij
