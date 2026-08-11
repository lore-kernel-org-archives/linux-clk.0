Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEB52DC798
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 19:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786476275; cv=pass; b=Kzh23ILKmBDkQKdD9ThfK2C9V08qPMNgRqIVCZfHVpbj5rKbaqKcKtSyUbSWkyf6nbAIbq4x2qoGQiM9mmS1IRrFYkMKOpE+nB7Jjzd3REZMBnw/IDQL6mq0D/+fY8g2VImnh4O/VPxKToE2xHx6OGjpRv8vGONZXuZxHZOVuoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786476275; c=relaxed/simple;
	bh=pvM++vc0HsYobIPkT5dR3rREFxAKr7kzE34v4Lzz8BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTkNK/AS6e3wXGSEUOi6KczOR802hIhSiaq2SQ2UotzFrewmFakkMkDGVd9M4DFErWBRjaCSlGheoQyv8gukuTAEvIq8v9jSXfV5Wp+Pq+UBpalIkyUUkbChEOsUApPX6Ou3Wnn20Tr0f3P6QKmAhoRwzPzDjknUW0tlLtCulkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnW82Tic; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnW82Tic"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so223518a12.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 12:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786476272; cv=none;
        d=google.com; s=arc-20260327;
        b=ADV3dKF0JBLQMcf9stFEO8JyGIk3B0bm/z2W62IL1UYkyCTkx03boxueUgcDVzFudF
         K2Ggp8IoFVA965bm6BeXQyV98DcseBPigHZ9bQcdlzkAXMbRyQcEXHxBasx2OEcWr/uP
         2la8PWNUsUTMXFNx2rXmEjejTgUYtQqCwcdUnn4twyZO6anVlV1sJIGR5UNkihvLXjbW
         POpxmfzQDMTq9U4U7lgxBwUkOVxBVrxXyEDrj7jINpmOwKYgys5IJwoNMbU52RTgDfL2
         AQYCsoN24+3y4t+LHgI1a/Tzcm1XGlTyPjH1G7HqiMlv6LlnTtX9dIb0RGV2RIqj2fi8
         i+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=buQhdfRXPDhdGddRViZT6KrsBkyixNDeK7u3oyQgY5M=;
        fh=fM4ZI8+hWSv3Fnbj2b8tQ4LUMCJe/yK27MRsZNxqW0A=;
        b=rETaAsNfvbaTSDOanZDPElKVlWG9kGYUy0JqLpbhlGhxTx5VFUJ5zsp8vI6VG/eAXr
         MDjF/QaYQCCcaYq9qPIBfV7ZGi1e+b5A84mhQHOPcGVyEgfSEsXu2JFpo6MDUUy2LLCX
         Bn6kZ3YQUaGl8dzQKZEsl4hwZLBxHe4cUCXtrMqZv3I/8a0kXkWNJi6INASLmJU3v6hA
         e/JqRtyXFIs4NQaxg+tP4crj3O8tfQEkGeXsbb5iIAKSfVwbP8J1kF8WCP70QdTphvPx
         UlpBXGHFXdkWotuBIl8BS8LnUqvfYb8d8QVztvKJT5BRiMcFYSumRKV1A1fvdBUTx2+n
         MGcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786476272; x=1787081072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=buQhdfRXPDhdGddRViZT6KrsBkyixNDeK7u3oyQgY5M=;
        b=nnW82Ticc68esXxJ3u9tlHY2Hg103gBaT99UqUN8OJoNhLb4PUVaRVckkjZOtysJsE
         cc0Y6yABYeDPxuHWFktj5yiRj9xyv579kpybM/ASA9sjHiw8jAXJ1RIIXtfJNyDwoyIt
         H5YAfTtTXZ6M4zgf/oB8/GJkrfv/Mc6Sm+zKr+6jnNU81k5dqSqJC9r/UqOIw8ZrXus0
         dsxbL4vFLc6ppTcdlgiXWkHLbZ3OiDJsvdQGv1p/9gECEEWXAjorW205EuoLuKywI9LI
         8BpfpCRKXuOJ+lIarHstLZ0hY1PMEj+1j9emmxi2ioAAEY0jsmEyFGVv5UTMICxEJDcB
         sw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786476272; x=1787081072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=buQhdfRXPDhdGddRViZT6KrsBkyixNDeK7u3oyQgY5M=;
        b=Lax+dIDcdZM2Ecng2D+PV5Sh6b1CNgh4GTg0TqOi8Z9xLpgOn2Ao165KtD+EHYj+JY
         fzCtnFJWw4ZVh+mo2aA9IG2VvIGmYh3M+sskJ8A0IpaLy413MjWcqyW0ex2b4TYq0Yjn
         1SJ63O906Tyao7DkC8/T30c5qVww8BFkeQFbrfMrNiOUfhgMogd5bihY1x6699O5/zwQ
         MTDyTZw2DPd2YkTaUZyTlaIScPlNX2FaGi5iYNwWa/dgccQlovk4Bd/L653QkHRdPPbb
         iIqvJjKc5PPGGLPrh16xkgC2TPuM5UOfvkcmn1h/a0R67bhn3Sh9RYxO+9JxCUvdIsbr
         0GHQ==
X-Gm-Message-State: AOJu0YxUzHHNuoXqDwa5JWNrI0skSyfx/BUC+/o+Z3dVc1UPVCWajyzf
	Ee51Ij2f1EtkefhqrlURRlQMpdPTcywkbZmVGvqLuU+FO5Uc7UCil+uOcZJ9N79ibqvJ8yerheY
	CkKfjreMTmcvf5C+mrFYCrgTIRKjf795Jxw==
X-Gm-Gg: AR+sD13M8mzNABqJrsfmYqTlDe/Jq0J+BYxZYVgJmdsFdToDEU9eMiUVXr0ymJ1dinp
	uXWzb2dO9Y4w2uck/N5fdGw7p0b6AcpXuQz7EeqddMlcmTd4CQep8e6cSeryJjQP6gzu+EfZ9j2
	MQMZnNjVUwaSrBeYGCM9bwvZU4GCSVs94It9jpiRB4PJObfmEcgivwIxOtejwymPwb/Oe6Kj17C
	nL3XW1aGAvgDXSo2Yy7MP/rzdf425qV6AZ36jp14vG+NA5zWGiOb/pjo1BtMsfv6YQ2I9adYJNM
	HzGwXZ5MoJ4V/1K8VTQGEq6oysCXtGDWCtZIE3S6NS4wb4AXnNqi9mBbaUKjrEtG/qm3wXmHMBA
	ULx3wrXG6VMEGF+2Ob4LI0mClA8CzbgvrERpkdV16UCxwv9I04i2rSauLilEDxMKCCxLzMSiEOJ
	ppcIt+zYapUQ8oxRydanPTeHhxzyhI1pxF3PSb+YTenkT3p3IKov/YoCM=
X-Received: by 2002:a05:6402:44ca:b0:6a0:567c:c2fe with SMTP id
 4fb4d7f45d1cf-6a364526ec8mr2810499a12.20.1786476272208; Tue, 11 Aug 2026
 12:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811190821.117485-1-rosenp@gmail.com> <20260811191733.CF9141F000E9@smtp.kernel.org>
In-Reply-To: <20260811191733.CF9141F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 11 Aug 2026 12:24:19 -0700
X-Gm-Features: AUfX_mxr_vOfRAy0BAUB8fsvi9KMYklBxgQ1bG72ZHw3hguY1KNk8TLFrlo4fDQ
Message-ID: <CAKxU2N_NJZx3aWrmb3zGDWXVgULOvn4L606NwZJr_6AHpbYJ7Q@mail.gmail.com>
Subject: Re: [PATCH] clk: davinci: guard da850-specific init data references
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 12:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The patch uses a non-existent Kconfig macro `CONFIG_COMMON_CLK_D=
AVINCI_DA850` to guard DA850-specific clock definitions, which will uncondi=
tionally disable them.
> --
>
> --- Patch [1]: [PATCH] clk: davinci: guard da850-specific init data refer=
ences ---
> commit 8310fd74805280b1ea31726bf5935e313dcdb916
> Author: Rosen Penev <rosenp@gmail.com>
>
> clk: davinci: guard da850-specific init data references
>
> This commit attempts to fix undefined reference link errors in COMPILE_TE=
ST
> builds by wrapping DA850-specific clock data and declarations in a new
> preprocessor guard.
>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608111912.YS4Vg7Jh-lkp@i=
ntel.com/
>
> > diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
> > index f73b0ac5d8a08..af95dc27f840d 100644
> > --- a/drivers/clk/davinci/pll.c
> > +++ b/drivers/clk/davinci/pll.c
> > @@ -841,17 +841,23 @@ int of_davinci_pll_init(struct device *dev, struc=
t device_node *node,
> >       return 0;
> >  }
> >
> > +#ifdef CONFIG_COMMON_CLK_DAVINCI_DA850
>
> [Severity: High]
> Does the CONFIG_COMMON_CLK_DAVINCI_DA850 Kconfig option actually exist?
yes it does...
>
> It appears this should be checking CONFIG_ARCH_DAVINCI_DA850 instead. As
> currently written, this guard evaluates to false unconditionally. Will th=
is
> cause DA850 devices to fail to boot because their early clocks and match
> tables (in both pll.c and psc.c) are no longer compiled in?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811190821.11=
7485-1-rosenp@gmail.com?part=3D1
