Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D108A388E60
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 18:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786558871; cv=pass; b=Tab8GzFV2OKs1GTiSvafhDhr6mtqwzxqNfAx2Woi8xMaqoDXFVOBqYdt9H+Qe4TTigJ2li/BDM+N3xyGx4WsKCyeTA+lKsTnOyo/jAPupgO3KzKHMvTmOMiVjuIh89MO7ZUgVRNC3OBLTOe9HW3AXS61kROuqoh4n8JPcSQOORo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786558871; c=relaxed/simple;
	bh=wYRwnIOrDTshNQUOcwMnTufYCJHILpuwrSJ8FxA8hgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPASImHHmU7h0htV07eDv+EOLnecL5Myyhq7PH6tcPMwDwZiFIFuxozUY2MpX1jOImilIoZRUnRXndpjqK3wYYQSxaGAiEoLZ4s/Pg7pPRmcJZmQ3gMVuE+S6/AnovbnHCJV/RboD8o9MeR4lirzHjebJs++HuKk/URHkeein4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9YrXPbQ; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9YrXPbQ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so1737766a12.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 11:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786558868; cv=none;
        d=google.com; s=arc-20260327;
        b=EVz2EYaW/oeDJKrlTfbc9mACgYTww40BS3kFG5MoPSELxY7+R5R0zcdQL5G741uegS
         TJDS4FADuqnTNYoRdF6Ru4LnmzzrbdUcQm1oYHnO7Q+XmH7SCOeLZuVN4P6TmO/zR/BI
         LyusIOkx1lCLPAsJ+cWMzdMUeK/c0yNZCQkHwK/dlw4+psIbFJ4YtCPN9O5GPDUnAD02
         4cheAqyO1yOACphCEdgveQ1tycQylIaQRsbzvhXDJEQvCi43QeLoGmtgzNHcRFBf/GPn
         6Gxmieh3ju90PS/Gyv6tZ2fzAtYZXd9Yn7FDVaTy3MqAo9AaURYWPcLakDiiEjTI2yi4
         uTAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wYRwnIOrDTshNQUOcwMnTufYCJHILpuwrSJ8FxA8hgc=;
        fh=RIJ5OKxslitT17VrKCgvbfqcJjgKX4eNo0phdYPtuXE=;
        b=NDIshnaLMSv6VIEX8KajWsv+MgMs3HZ109fs4Y2Oa/9Wqg9wTA03ssV6rGAx8A5Rjd
         yuZ4E69sGTk7oSMN5UPjpZaylBLjNlPsAdDrJNjotYk+u8PPPgSBh7tfxOAy6Z05zWjQ
         sJtauPdf8jtStglLuKwmaxPR73EVHUaWtiJCUH7yjR2Cnz0gRQIpHWz+9Wqzmm9JpBS+
         EUL0WlFlbsOAqCWmKYGW6JeCNxOt2Glml5ezob0dOajZZAZpIY7TYScBCVJe64dnup2A
         B3tocS3gzHhbRY24uTjuOAlaTavSIT4go+1ymHGpzLEEtPBN8WbEabbApdp40xZ6e97O
         BA8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786558868; x=1787163668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wYRwnIOrDTshNQUOcwMnTufYCJHILpuwrSJ8FxA8hgc=;
        b=s9YrXPbQ3STyEJjQo8cTTWFghCosBn0fiyd7r/SwFa08I4lR/cFMH16LPZ3s/QKA1h
         AB90/r3/7eCotegJErqVqJSE4g6NMAyaUxAfWGCFDmqvAAryJWOijJhZQsVTuMA3jYJW
         EQI5Qb+nRRYTMI7tyE1pUKNvC+ZKIIR3/vIST164b0QGyR3ghSRHkKmoVXdbj0caEHfF
         dL3QGc4FJNWHMY7Xhn7iuZShRo3LWEKds2XZQuWJaP7j0/H2cWUlspqWFOtGZ6T6m/zE
         U9vgQ7d5VViLq89cN0Wh4mxnqnOJBiDx7YS/y12yZqec0lRT2fxi1te4jLsapaRoBzj6
         NXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786558868; x=1787163668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wYRwnIOrDTshNQUOcwMnTufYCJHILpuwrSJ8FxA8hgc=;
        b=CK45E/t7+JJ3qnIFY10vkpeS2vx3X/9t+V2L+kUnsuuc3khIBUnj/gk6vq3vq35Yxq
         FootlEEmUgLHUyjPG6ejo9q/kaW3jQ8hz961Iz5MZSqQVqamc4WZVrdBHuuydZg6u5lp
         VlIjNPOyzMmgLxDRlvUM1p37kHy/jcEJiJHUKRuX9x2ImYpDmGH/Xxn3wrDxODsPyXOq
         JNE0EIUKY8uCsi4uX1/Id7EanhSZRWWqv2DdlvBc7/ZaxrEvW2gHsEgSeCKM3SsF1LjN
         kzgDl8ZQ0UEvwNHuPW7oX3GjSzbyBlFsE6YoT4VSe6sDbznrfMU4GT6WX9exToDjH9Jq
         fvBw==
X-Gm-Message-State: AOJu0Yx2N4CL6ogz1wJ0L43w5NYz3yWKv5n74T+w8/kpTpIuvPqXsNG5
	pD4nnnA0Y4hjih/2GHrE49b48Lsw0TmXXg2GAMa28TxEKjAiCkJR7JruLhb6D6M4QjA9xpvTr/0
	T4qywYI0+/u0JTQJ9bFe3mRz1k/yfiC8=
X-Gm-Gg: AR+sD10LB2bDLwjuloOMSmJ22qWhdFwAYx6A1G73HO/k1EbnNF3QDyZ8QU+CZ0Sd0Oj
	xwcf+FC0Nza8ruz/82FNx1Q5e3cwJbPJ8nOgaVZUXPqBY4nee4ETG9EDhs1V51CKCoPB1WY4qtp
	NRJdFrDZ+R0AwWQ+ZARD4ZqukzP+E67/tLbMKHxvj4GfD3GSc7t12XDfQbRMsImWBuM3Vva+iuI
	/GNuKpsFSBRvfNZZBfRHp1/240rtKoZ5kBSb+q9rs9uYx34lf9Mp0bnMyrTN6zRtAjFzwkxT3/l
	CjbieExFfzPpG355LrL5iDbttsBCrg7+tW9MRoxMyazmYS+CZ51NZYRw849YggPeuIDjm/ulThv
	OvbbafPDRzgMYHo4gN8KQuwtvvzHgG+DwfCkod1xFbfnxU0h/voqfkyzs+C3NEwD9+J3UYcYpEi
	OOwm9cbP6H8nlZq7MAqtZIfY9Pu/ijqImfxTNOyBSCAZj3sr7KhvSd/LA=
X-Received: by 2002:a17:906:99d4:b0:c20:fc67:b38b with SMTP id
 a640c23a62f3a-c2108dfe9b7mr8916966b.1.1786558867881; Wed, 12 Aug 2026
 11:21:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811190821.117485-1-rosenp@gmail.com> <2c761e07-0a58-46a6-86bf-b5265b2a443a@lechnology.com>
In-Reply-To: <2c761e07-0a58-46a6-86bf-b5265b2a443a@lechnology.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 12 Aug 2026 11:20:56 -0700
X-Gm-Features: AUfX_mxHUhlRj_wi9z6V0hWWe_9SaSKsD1UHvOmQSqtp1aMPswmY03yq7B72zF0
Message-ID: <CAKxU2N-BzB2=ty67YEVHyx_BK_LVt84HWn2nQrGBZ8McG9dVsA@mail.gmail.com>
Subject: Re: [PATCH] clk: davinci: guard da850-specific init data references
To: David Lechner <david@lechnology.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 7:06=E2=80=AFAM David Lechner <david@lechnology.com=
> wrote:
>
> On 8/11/26 2:08 PM, Rosen Penev wrote:
> > With COMPILE_TEST support, COMMON_CLK_DAVINCI can be enabled on
> > architectures without DaVinci support, where COMMON_CLK_DAVINCI_DA850
> > is not set. pll.c and psc.c unconditionally reference da850 init
> > functions and init data that are only built with the DA850 option,
> > resulting in undefined reference link errors.
> >
> > Guard the da850 entries in the match tables and the CLK_OF_DECLARE
> > with CONFIG_COMMON_CLK_DAVINCI_DA850.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202608111912.YS4Vg7Jh-lkp=
@intel.com/
> > Fixes: 34aeb6853fe2 ("clk: davinci: add COMPILE_TEST support")
> I don't think this patch was ever accepted, so you just need to send
> a v3 of that patch. Plus I left a comment on v2 that was never
> addressed.
Hrm I thought the kernel test bot operated on merged commits. Interesting..=
.
>
