Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5142882AA
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 20:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768595555; cv=pass; b=oQ2CShP4N51IRveZ/3qL/2Jc/2D/eYaAHAK6+yp+Fsv2GS7JQm62bsmnS5XUBrTzBDGCXaQh40LiDfGjvWus/nNy5LdqBS3vVEU1EvxemwrCXLrXZk4jvKdPZUiuowr+CVERIXI5mzhJn5gGLXpcEiqJsvJb/RpaO7i4LeMHiKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768595555; c=relaxed/simple;
	bh=PpmlZ4hHWamCBSa4D0DoiFTzgcXHGWRBgeeQ73UEY7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LF+eb2/wr18b8UpoZIO97qNFki0ebASIpV5UCwiwDa3i/n81FIlFkILiN9+mcvjqJk8cdeTG61Ua60i17m7OqlamsYaGv13WgdUqNIEAI2N7XvyU7TgF1hF45gxXOgGCLO92TZxyTFm4JHP+H29y5SgqWKaNeMFFebgcsVWXi0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=MhAfWHae; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="MhAfWHae"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-644798bb299so2230653d50.3
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 12:32:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768595552; cv=none;
        d=google.com; s=arc-20240605;
        b=KkKyOotlFwyz8vYFL/BZ3JQ8EXl2jROSjMlTVYLmpjbZz8nF7qKUVa3oRir+pimLSb
         gMjGYeSDJ5kiARCRaEdR7P3F3xf7OY+NiUG61waDqU/2BNYc0rhHBW6ILZ+WTx5/NttB
         i2TRt0Ji8kPAHcPISsl/0cqQirvcxf/LW6Mn7yQYPM43367qQogy/1FUgz/scnoXrnMK
         cawSTGs5nMJm/0fpJzgovSf4EM+O6Ssn3UegZA/jgMa5mziiSpK9yHo2jLfghhaF33sN
         2tt7SH3/t92NZkzU2+16J+/SuUDtyMInOX9FkC9mnSalJditiURgwbp5KuznmGLunSnl
         FA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PpmlZ4hHWamCBSa4D0DoiFTzgcXHGWRBgeeQ73UEY7c=;
        fh=i9KU0MGfreuVFXpnjgo0hnjwcmFZU2DKVZUNj7cbsn8=;
        b=JzcSZx9q8BwNno8vKliF9YbQv/2GSvino3bV7u95o6VnqQnJEPvmxFYh60MuqcugG8
         3eSTbAU2ouEu3h4tPIOUEIbZtkSRaY/66wJwD0O89i3Tmy1W7UBPx6YiyTy1ZiooZMVV
         eKzJPZoz4MR9nbzCrvCsdPMiWTdpbbPiYnmg+WVIR1/4NDBbYB26c/7htL+6fYwNbvUr
         al96Jft6uumZF37od0UMNbxsJByBqNauioifXMhV4sJBwgKEZIk6QKQPUH4IPuzVJwUI
         Qs3b51pvmNdVZUnbGCweA5wTkcahAzm5XHlysIeV5ORVd8gCvdUxTZCLI5AdncFLSa0p
         5Tlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768595552; x=1769200352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpmlZ4hHWamCBSa4D0DoiFTzgcXHGWRBgeeQ73UEY7c=;
        b=MhAfWHae0c6U0rDpHFh9KVXvb/BigS6oJJkoDAUWYeUeU2Y83b2VG+S8VYJ5aQTVgP
         qINDRXVOOANtocyrxE1OyVbwNTUZfgxv4SEbMzAacd13/vxkp9maV5wcR3nUyKAaZRfT
         ygOG+nbEXXbiRz5J/9lz6QH5wqsVrj/oxU/NvFvMtMaA66WT3H0IyW8zmWGqI0HZ4mT7
         kGYhn9A8kjxPVcOt4fyJ8ic76oJS2aDlmBna2ePhZMlyLDdUTDrAcOuU8riIx/VgiuOy
         18lZHonGInGZ7bQkG3jfQu5LJ5eRRBaWj0PkydObB4KE1hR1FF2JysPPMDtbWvrD/vk3
         r0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768595552; x=1769200352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PpmlZ4hHWamCBSa4D0DoiFTzgcXHGWRBgeeQ73UEY7c=;
        b=sQFDjQxUi5l5iYqyksq6TAoL18svtLjm6vCC8uwarGBsE/oIfLNwcXTeMIOTbik/lW
         fTXOtv8e5hhfSHaYqVUcD37HVXrE9ochK0wFTXnzXCqq2CVi62bRjGu4dKwdLnX9R9ZO
         cEqfeVEEnQS//stbPSg7nbUwQX+J5KpmnxDyKFLsVN8x/e1VzkamqesMOGxuyr4h7tcW
         KKYvRLyEwHtVofQ0EKNt9O8LpGYFEv2n92WP1ZRz7vE5EbaVzJEMFKyvBMrpBwITCBnx
         2exQfM+IYxgk/fsQk6vPB8buorIMAP0Yp6aBY16GMrH7RA50eHs5TJ3dph8O0ydSk4Ge
         YFpg==
X-Forwarded-Encrypted: i=1; AJvYcCVk1xMFj9MHnWmrur0kQ0FYqpINJNJ1pxBWJvBmeSSUfvPApTnTWY8tmBkBWyugjhEboMlBuC0JzsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUPsw3FRbhZKgqEBOrDd8QbbBS2Jc9mHIe7lbfOC0+zwNDuXyG
	LgNloQ8YPdTjqIH33XUUVC1FsPY39ltUW5J3KLknbeXmqV1jGejznz8Xt3vdzpJAVmgWPTfnzbA
	qgWB955BtGBDSXVPFMQjR5IUW7MqR/RYe7aVJrKE0Hw==
X-Gm-Gg: AY/fxX5ssiuHTObbOIqiO2w0f4UktgckbvlCGnr6bc+uRhhp8hFSRrdBsP/X2p+WA44
	aGbE6MYEn6KhaBVuHOGb8EDr8B3pUL9/ZOkgAtPcoj0uUCxqsT0FnnpK6bvirhwhw606Uo41o3K
	plGCAzsKPWD2iofWaZbdCp4zpVGUy5mL3QssjdHMERJhxraf9LghMls9M5NRUEXmvFobJ7Zd1iI
	8gp1R/oN5h9strgglj0NkxR7gXFb7rycRripHQ8hD2ckNef0iy0Xciu+/wKruRyhvMppRSAjprz
	b6gPPaiHVOr2iqZbdzuCE4WsNB7lSbW4mZrGh21LRqfobJj5/b4NPoUqo16Q
X-Received: by 2002:a05:690e:4008:b0:644:4f94:c534 with SMTP id
 956f58d0204a3-649177115d0mr2857181d50.53.1768595552016; Fri, 16 Jan 2026
 12:32:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
 <aWmc73irBAM8DZwF@redhat.com> <20260116-frisky-heavenly-pig-953fa4@quoll>
In-Reply-To: <20260116-frisky-heavenly-pig-953fa4@quoll>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Jan 2026 14:32:21 -0600
X-Gm-Features: AZwV_QjleAtHG0gb6HDBCsnDqxotEfpJ-YdV_J7Ve07OakGedKmM_eqvYI7Qzqg
Message-ID: <CAEev2e_4RfHChkyvj=X8XFXC8-Tk_=SLJsMCR1M+v6sC+urxsQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Brian and Krzysztof,

On Fri, Jan 16, 2026 at 3:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Jan 15, 2026 at 09:05:35PM -0500, Brian Masney wrote:
> >
> > Are these abstractions really needed? Why not just call spin_lock/unloc=
k
> > directly?
>
> They are actually harmful - make code less readable and introduce very
> poor (lose) API accepting whatever pointer... This is exactly code which
> should notbe here.

Some of the clocks use a regmap for register accesses, while the
others use the devm_clk_hw_register_xxx functions which require a
pointer to the control register and a lock. My above implementation
sets the regmap's lock and ensures that the same lock is used across
both types of clocks.

I tried setting the regmap_lock/unlock functions to
spin_lock/spin_unlock like you suggested Brian, but that throws a
compile time error

error: initialization of 'void (*)(void *)' from incompatible pointer
type 'void (*)(spinlock_t *)' {aka 'void (*)(struct spinlock *)'}
[-Wincompatible-pointer-types]

This pattern is used by other drivers when they want to override the
regmap's lock [1] [2] [3]. Should I be doing this in a different
manner? Please let me know.

[1] https://elixir.bootlin.com/linux/v6.18.5/source/drivers/soc/sunxi/sunxi=
_sram.c#L338
[2] https://elixir.bootlin.com/linux/v6.18.5/source/drivers/mfd/atc260x-cor=
e.c#L47
[3] https://elixir.bootlin.com/linux/v6.18.5/source/drivers/net/ethernet/mi=
crochip/encx24j600-regmap.c#L46
