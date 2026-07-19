Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46B5305057
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 21:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784497459; cv=pass; b=In15mRWa3Lp0myLyt7Ju59pXvv6wnMN7GaRdbDcqJs0Jy/gkHPAUdF1R+eX0hmT0s019I1Xb2N74l+/nAkqU3/FncTx7c6rvMieC1rXQH+7Om/VwuQSKj/CKJMn7DID7QoYZxSSHChP4uN1WwTo2huUvRY8PIfvEbmfu3UcqLLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784497459; c=relaxed/simple;
	bh=qsCYuckKASREOCqrWu2OiTP9uAhxU/090DtklF6jGXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fi7UkOBQMkM80d2h5qLCuS2EYuqULdn7eYCgQjQ82VEqqS52y8BvkzM9HfS0O9rx+lsDtQ3jHCqleksjmYCytFcPT5fkddE0KFt4OJ+gvQ8ueV/mRus87YTA82ZObKEO8qqf3/4bEsDw+aEl/7D6oKmrvubm4w/q+XPxCpQIfwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElPSNpNf; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElPSNpNf"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso7781965e87.2
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 14:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784497455; cv=none;
        d=google.com; s=arc-20260327;
        b=EeKRfO/jzfi5Mjx/KoVQq1QVIIgXdJMSHRBcMgaZQWek5Pc2ve6z7pMX9A9gO/y4Um
         lYf5sdmqvy7y329G9Aoy+3kldDcNjhwk3D4mmEDE2zSsryNIi+axW4AZd1DZEW/P0wGN
         U+Btzolxe8xXnAExnHeI+mENHjvxgZwZDXF7pZTfqZuvtR0PrUdQ5KbH0d+HpKO1KzCV
         d856F6mEom0/NKESmMUCcfXeHT4wNZ8ibvU3y8ojM8jBwMXDSsPhG1bKG75f1R3PnQhs
         c0uWlH2yfXDOsqWtzfz4/vy+ftRsZ5AHlri/63gF27UL1vKMwZQv3mSevqaETEtP10Vw
         Xt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfdfHA5WCA+spIZWH2utCUt8Mub2WpDVKDTvo9VEZbA=;
        fh=p8oEOtS1LuUk7/GxtETUPZBVH3XD4CeqUrtZ0awMQ24=;
        b=DKGauXFVYzP8DLyH9qMmV5uYsHSOvTNYZD/+EZCDzZLUA1RB6/RUJShUg4bD6cn845
         E50cD1XS1xqTghlhwCtODztQ+YEBC0pNkSdMkV9yNC5Rex+J9VKn90CgVjGzh1+6l+HS
         HiDqgID8cE0DKIPhAGgDgbebUDQ1caKISrBAej1g2g31Ta0om6dO/xc7t3/TM9XuEAE4
         +ga5IXznkodUlgCFQMx/u/Y8C0dtgAra6PcBBMdr4K8QEqc1I3xKJZPxvaD8j2Clh9cS
         mjiDW8yZ4FHDh4KEyTGyXXKjQNp+UrhgiTo6f1W67rSKaxbAmFuzLSYLQDEnTKwLKUmm
         md5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497455; x=1785102255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfdfHA5WCA+spIZWH2utCUt8Mub2WpDVKDTvo9VEZbA=;
        b=ElPSNpNfyl6R+5/qaD9g1SAcOdK8E6QZzrcKGjNYGbcluhcV5kurSGU3GoYvQCg0fP
         jAo3NJC/sOO5e5Ez1zUqRAHkcSt1va8iR20We/I9WQIuKM7IBS0a0hDgV1HKfL0gicaw
         jocwBsiXgqhmjcjUlwg8mpZHTrHWlgoCFF8yPGA4AcrdY0CsoT/lANOffaqF+8ANqOF6
         ls4Mju2o7kXicdEMRZJSEAsDYf68STnZoNlRLRV0AExFhrlnovPE03bAif2mQnpI2ENN
         joXcuPeRV7Z3MEl5gsamRrKgPyZ8QUlA0TE20tNG8JrtULKJm/riJQe2BdXfwiqI08H/
         0a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497455; x=1785102255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfdfHA5WCA+spIZWH2utCUt8Mub2WpDVKDTvo9VEZbA=;
        b=HT1orsS2myS36jcGY9Uu0RmhHvkANiEHE65HoE8tBBVmcH2RIQ9vT0vg1VEod7576n
         BYJL0DIXoux3kivMKmah6YRcv0Csi6hQncS4jFzuDO/UlksJRAKEKgGEhsB+trlOgOco
         Gv4McFgyUQ2HWX0Wk8nFEOjv9vZhzq1D7UcyywGzqEaIRurOhMiqFbeJQKObDk7LyH1c
         f+ReolvcTo+GvKWWbIPblUat2/4Nmk30hFqzykneCDOD9ffXsHeRltadb89ppcno25Xj
         E+zuSKZG/T+tFLwfyhA4dMcd9LygpL280LsP1D3biNBh8+9C9Cd1dkI7Vm+8e1TH+/Jx
         VtLg==
X-Gm-Message-State: AOJu0YwmhQg0xhhW4mMmgfbQ0F2U3zyCSI77EtS3SyiCPovJcGyhZu/O
	9527j3x36K94HlTHPILk6IE1Y37MHQLheOzCFN4M7O0o/+mUVWYjmjmdkpUdpxB3RrCZSe9PhMJ
	w4b5PR8l7IATmAzuWWAtxrqyfEBG/LOU=
X-Gm-Gg: AfdE7cmR2JbyGi/9BIFfH08d3dtr/oxkbryXbUZtWb3wcIK7EKY3REfRU9FYQClWK2s
	Ghs20udT54idsn5wwWA9Xs/Fk2EAhaYhAvLQ0PmHUPd6X4GDyXrh7wI8diuqZSDYKByyrptHJYt
	ZhKItbij40M2P3fmdHUbxXUsNV24lDwMCtgTdqxO9KMVL+X+verI9sw+oQivci2XedF9yurp+Xv
	wc4PXfxx6DfYjSytm4fDGfCUG1x65tpJAAma1c7bOZnQ5nhqCDU5SUj/XOpXvZqoPgLFi5t3B3L
	nltJCoDlbR8ivifa0ujmeKbh50oz23X8XbV6xSpZ0TVg+5MrXHh3pJZdOfLXBMX+ceiCBDTqIjJ
	AjY5XvAY7pAYfBzIgoaa5NjyNtOaM7cGALMW2JSfDk4V5jy31FqvPgUvsYKxtRvDG75e7SY+P
X-Received: by 2002:a05:6512:66d7:20b0:5b0:1f7c:254d with SMTP id
 2adb3069b0e04-5b28f9b9f21mr1377355e87.58.1784497454636; Sun, 19 Jul 2026
 14:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509051110.1061393-1-rosenp@gmail.com> <agHu78VflprAM7Yj@redhat.com>
In-Reply-To: <agHu78VflprAM7Yj@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 19 Jul 2026 14:44:03 -0700
X-Gm-Features: AUfX_mydAb8OKQC-V9pRIVqyJYvnD-MKgJEDEArKFjqMm6JFlPXOW7FXXxffczQ
Message-ID: <CAKxU2N9Wf07ZNvVyOz=WR+8TdzxoivnAp5x3_FN5rqpU6M7maw@mail.gmail.com>
Subject: Re: [PATCH] clk: hisilicon: allow COMPILE_TEST builds
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 8:00=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
>
> On Fri, May 08, 2026 at 10:11:10PM -0700, Rosen Penev wrote:
> > The HiSilicon clock symbols already depend on ARCH_HISI or COMPILE_TEST=
,
> > but the parent clock Makefile only descends into the hisilicon director=
y
> > when ARCH_HISI is enabled.
> >
> > Add a hidden family gate selected by the HiSilicon clock and reset symb=
ols,
> > default it for ARCH_HISI, and use it for the parent Makefile descent.  =
This
> > keeps existing platform builds unchanged while allowing compile-test
> > coverage.
> >
> > Tested with:
> > make LLVM=3D1 ARCH=3Dloongarch drivers/clk/hisilicon/
> >
> > Assisted-by: Codex:GPT-5.5
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
Should I resend?
>
