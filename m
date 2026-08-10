Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7018442B0F
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390955; cv=none; b=TgjxWP9AzKFm2GHW+TQ/0aKH+M7u/Ci5wOuRkMxLtrXkUah3G8PZaOzINaQu5ZUiMR17YYkhYVcTdJG4DRRD2P6ExV7PZJVEE6oH1DHWGqzOZ/N60E4sLr3YHAjQ3W3bseZ7cnWQEkwZbbNb7jrd/ey7v0Guby6JCm2iO/nZdgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390955; c=relaxed/simple;
	bh=a/RorDak4AbNVbw/fWC8eA91U4vFHIR3vGa//TAL5kU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XR7/+Oc+Qx1TUNNK8FHVaKE9SV5u0k9KG3VboiZNaYdGDgkMApp50zuxNI1YWV4pvCCQbNTacALI5/ZRc5bshn/aHSZRs0B1UJPfO0McLADg27CdVwgqeHHVn8cLlVwaCMFkq0Mr/6AuxT7Q+85IyGw6tifgKbrjwN713B00pcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSLGM9fv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSLGM9fv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9800B1F0155C
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786390939;
	bh=a/RorDak4AbNVbw/fWC8eA91U4vFHIR3vGa//TAL5kU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kSLGM9fvZI2I6QdHwXN0GjtPaULcvCw9vClBJvqivQxrdMkxYyJaRVbE3dw9Eg0pk
	 gV9irYScyYu3xK17ROFreMHuX9kjNrCsAI7rTWmkA8bsJv37uaRG/Q1i91vBEsdUgF
	 YeOFxPs7saOgvEvi4Zeb+YNk8YhPmK+vMCPBiRYFNUkY4TLRLuxOq4Dc0hZFhhI8e3
	 tKJkrH7B5676yvOgh5CfKkNSh1T1uN2TG66MEnlhrdm/SUiD7x87+TLkC78ihLb5y4
	 UiFCyMjEmhKX9kMCNnOdxIEpJLkERQOkYray6+KOiu7troydDHQ8l4Mmgk5yO3hUFK
	 CuDJ7XTxoQmKQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so2181161e87.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 12:42:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrgTfgZzrnnRhNw1mMqj36+t1ZzKw2bM1456uEXf3nMqBRU8ERMT2bodx4kTx8fIntMsr/GCEpLHdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLFLCi9L2IUz64NpFZxcDw+GOnpI5ZX0e7RIW+vRPNv4fz6HIs
	6RNSfnpCYdId/kzwBckfpTSYz/n+tcDdASdR6unoHFwRcZYawT1sqNPfY9CvLe/E+n4PBoU/Oms
	eCwV6pjPKzZTOEJKsL3bbmWU5D9dD/C8=
X-Received: by 2002:a05:6512:61a5:b0:5ae:ba8e:2ef2 with SMTP id
 2adb3069b0e04-5b3181d3181mr686062e87.51.1786390938286; Mon, 10 Aug 2026
 12:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-7-6b09707c5fe9@ambarella.com>
 <CAD++jLk0LoOJk=TXin42AL3_z_7eVVkvMnYr1S8090C6A_B+dQ@mail.gmail.com> <DS0PR19MB7925690FD29D578D8AC5D10EDADE2@DS0PR19MB7925.namprd19.prod.outlook.com>
In-Reply-To: <DS0PR19MB7925690FD29D578D8AC5D10EDADE2@DS0PR19MB7925.namprd19.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 21:42:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkUPU0eujvWc5Hn1tEu4n451LvkuGGT=j6OfirJENpRgg@mail.gmail.com>
X-Gm-Features: AUfX_mzNR-BpdsCoy7KeBCm5BOABzsx_ocJuW04mgEWpmksgWM6rzG04G-gloAk
Message-ID: <CAD++jLkUPU0eujvWc5Hn1tEu4n451LvkuGGT=j6OfirJENpRgg@mail.gmail.com>
Subject: Re: Re: [PATCH v2 07/10] pinctrl: ambarella: add Ambarella pin controller
To: Long Zhao <longzhao@ambarella.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 6:02=E2=80=AFAM Long Zhao <longzhao@ambarella.com> =
wrote:

> Thanks for the review. I will rework this to reuse the PL061 driver with
> per-variant register offsets, and evaluate modeling each GPIO bank as a
> separate DT entity. The duplicated GPIO implementation will be removed.

Thanks Long, I think it will be easier if you break out the pin control
bindings and driver from the patch series and work on it separately,
the same with the serial driver at least.

I understand this can be hard to test on the hardware, I usually
put a few patches "underneath" the b4 cover letter, and then the
b4 send-email will only send the cover letter and the patches
on top.

Yours,
Linus Walleij
