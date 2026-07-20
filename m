Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B562C429810
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558844; cv=pass; b=lXUnWqqG1yd5ghC9SHY6KhzdiUReTfWmBXEBBfAHDDFNPiFX1eMfsk8Jhww3D6P2zeYVuv5cpFaDHM4yis+SpD1XSUmLXAC5mWeHZJaDPzAeElwvlIaJMuJLImsMU1joI8a4T6uSMjxl2JuUxvUqFN1Uj58pre3ZVO+aylRh8LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558844; c=relaxed/simple;
	bh=tOgJD/yhuK1mdPlOLB9kjefkhDtkScT2remlU889DgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PpqEzlaVsDRI1umJyAJzSzjw7Pcq43wq11FAoIRPHTOhQtPJK9csPGbKDp+VaGHDLRXp72tLukhZ3rH3xKCrD7lng6NxGVVoodmCvQPJgWdECraVThDVC9SM+/BoGO2Fm/JRJYIk0G2bLFHnVV6FfYilcvadKEtKcZbKaUQG7x0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SnCVMMbI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FsZXE34J; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SnCVMMbI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FsZXE34J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784558839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tOgJD/yhuK1mdPlOLB9kjefkhDtkScT2remlU889DgU=;
	b=SnCVMMbIH47eHJXgU4GTSXxgOBzKQW5WF4n3SEcRJtoNPqW1gKeKhw8fpTp25r/P1Dv5VT
	GoThrMreF1gaJR1GqXeBhdQl1vHGqSBJoKYKtGsYv0law2EmRfLZpyfwTz+fF6YOHkQTLA
	LmEryj/p7axUKl+7qJaO+CzvEHc33tA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-Zqh0ehyvOQq8EJMFcO9zIA-1; Mon, 20 Jul 2026 10:47:17 -0400
X-MC-Unique: Zqh0ehyvOQq8EJMFcO9zIA-1
X-Mimecast-MFC-AGG-ID: Zqh0ehyvOQq8EJMFcO9zIA_1784558837
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c162ff98c4fso1031740666b.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 07:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784558836; cv=none;
        d=google.com; s=arc-20260327;
        b=sCEHOv6WWsIQ51LsKihQatXDZz8z0wwn8nGPk9qVUmf3glA5Xpc0J0ZZFccItL68Kk
         JQe2RICiMFunVIDBDxkX2qTGNOeRJsUntn+ByzW6/CCEirfaEGjelZ5qefM4qHt0/w9f
         Edo3MDRK4CrfZkI3yqAKvXkOS6CihLJqp+4N4e7MOLnqFHbMzaFuboUocmUygfQ1iMWX
         rXwhmcVQdIbYfXKoBNVyFozd/PhkUVPrw1lmBD/pzozh6UOipNseVOP3DLwauaD0a9y9
         +ZFXrh0DEtV4d3Q8OGic4pT1E2oHv0dYusyfrg7tS1yjyUU9tfwGKFhiqt9P+Ilrh0oX
         7l0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tOgJD/yhuK1mdPlOLB9kjefkhDtkScT2remlU889DgU=;
        fh=DXY+PyUigmm3fk6w4Uim0/v0D+3Vv0nAq0Sp8iTvdfo=;
        b=h8H46UToKL+Wq4UPR+Ocb/bN89CmrzeMxOEALB5NOpd26ZEKRg8bbtmENngY5CIGf8
         dqhpvag+ZrTWkC9XRj0EWOpmpZmHX8s9v+mmQKHkIUZIUrF8M/TaadSMTHaaA5cGAOuD
         lhmWEc5kYsitdpofj4pixfkAWh8w14dgPSeUlKt1OkY/dlcBjxqb2wzw8tRmwSXCBegi
         yJ75Mf1jCH01XHWKCQqs3a8Axw5mvxY5ZM0y0/b/Ik0MRA0TrwL+LBJXBwgAdYEQR+s3
         X7F8kT6A9/u15GDJCZN2yrHxebDkL9419OGUgUF6cEevlMzWNKsVAEaCFg1t5kpcOXG+
         Mz9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784558836; x=1785163636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tOgJD/yhuK1mdPlOLB9kjefkhDtkScT2remlU889DgU=;
        b=FsZXE34JXbXv51Ms7lBIpO8c0NfXJIELywt/aXw2vOB/x+LnCWq4N3OoRuM8Q1ITBy
         TIjh1H1nIITT22e97XnpRoo8eOmo/ZvLkCQdL1oNLMDLMsXhYBPFU3dvCD5nj6FWLqMa
         cFNKeZuZYUrpmw/x8SmzuL4SGActE10oczvdKvxLsj11eT/nK3iuNAgwyKjbjXlSYhzb
         20W3K/2n2h+pWK3M0avR3Ey3zT1cuyNmZuz3O9jR756prQB7J3cSIW1ONzpRa1+asnrZ
         bZ+lo9Uog/kIf8IsjIrpuL7g9Ly9Ceh9Yxsm5sNhNCnBHrD/EZnppujPo0AW7qilN3ho
         dKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558836; x=1785163636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOgJD/yhuK1mdPlOLB9kjefkhDtkScT2remlU889DgU=;
        b=gT58jc3ZfCFmMoi9jUcHpSOg5XQ4ytR95x8W4KEw9CRrD3tREpZGg+KdaGKDJ1FZy2
         S0u8hFt2BDOj6XhrZm6KURuB38F+stlYpR46fyzMGrwFhcQZ2cJBAvrJ7JK7nYoyM4mi
         HLtmSDZN3aIJXRS8/I8cqffNVqkaN6h8oTAFy5dL/7+7S7oPH6UFlpTD1nQW8eziRbeC
         7od5vBWy2cO5m/o7AObHQcTOkQu5b30FpH59j+Gu8zkDubyfmRTqyOm65Q0skaMpdq2Q
         Pn6RPxApSRRrfQHL12hc+UzYOYuym5W1z0qoqLtoxNpeEoivkzkid6A9snd+Jr1haqT4
         3IYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rob+Ey3c89fuWXD0/SJ9W6VSc/KSOkacIiYNem8sMnoAIwfZAoSFA+cYuO5fPPhSuH7t6fereYSTvg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyp+uefYcGzz2I9l0/dAEAVKJJ0zimxtwfh6onMKjTpQMyZ1q1
	S1MIKbbN1ce0W+ZR9OHiY+iYezxxuR04S4jO/TGW6+bcETRCHjaOJGa0yrox5h+mw5WcRs8GKI8
	HI5N7uIYakRBkj/kh2vPiqYtXFmIffCvH8izc5kdzgYSy/mTUrbHfdOLTgZ0GcUg91o6qG/7Q+n
	LY5f0BrUJbjGMPBvP4M4tFAGlBRoqbObF1xgQV
X-Gm-Gg: AfdE7ckaxlDYqKCAox5TuDnBPU9WvYvtptGxbVemIUbb30zJL9II0ouLbbeRiKklto0
	yHVyZ7j9Za3MCy2XPkrS57+TkCSItAZNMgMxitbBn04y4OKw2rJHh1QTnBWBuvO7WPrd0efWJj7
	UlRp1rQDy9K8Ax6FuLLULxpJ5U1CZcPObh1xeeYB8CaHpaA53PgKazhIsV
X-Received: by 2002:a17:906:6a06:b0:c16:7b66:4932 with SMTP id a640c23a62f3a-c16b4874e81mr549391766b.64.1784558836622;
        Mon, 20 Jul 2026 07:47:16 -0700 (PDT)
X-Received: by 2002:a17:906:6a06:b0:c16:7b66:4932 with SMTP id
 a640c23a62f3a-c16b4874e81mr549390466b.64.1784558836156; Mon, 20 Jul 2026
 07:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
 <aln6H4A2QTO9w3Rq@monoceros> <alpC8l8qPFL955ZB@redhat.com>
 <aluuES750vojgH3q@monoceros> <al4QKxSTz6wd8EsW@redhat.com> <al4rKFweyMy-s-MH@monoceros>
In-Reply-To: <al4rKFweyMy-s-MH@monoceros>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 20 Jul 2026 10:47:04 -0400
X-Gm-Features: AUfX_mxaYkFt9VmbusgYer3vR97X4t5BmH-uOFTnQHQoD5ZiIFaMurnWhXoHtSM
Message-ID: <CABx5tqJfMJHH8tS4hePgpnJyLeDrb8F4E+QRSWJ0ENWXUrU=hA@mail.gmail.com>
Subject: Re: clk maintenance [Was: Re: [PATCH v1] clk: Use named initializers
 for platform_device_id arrays]
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Mon, Jul 20, 2026 at 10:16=E2=80=AFAM Uwe Kleine-K=C3=B6nig (The Capable=
 Hub)
<u.kleine-koenig@baylibre.com> wrote:
> On Mon, Jul 20, 2026 at 08:10:19AM -0400, Brian Masney wrote:
> > As Chen-Yu mentioned, I talked to Stephen about this at Linux Plumbers
> > in person last December. I'm interested, and given the importance of th=
e
> > subsystem, I think we actually need even more people to help spread the
> > load for a healthy ecosystem.
>
> I mentioned that internally in Baylibre. Maybe someone among my
> colleagues is motivated to spend some review time for clk.

That would be wonderful to attract more people.

> > [... quite some things that Brian did ...]
>
> Judging from where I stand, I like your efforts.

Thanks!

> > To help with review, I also think that we should enable Sashiko reviews
> > to the mainglist like some other subsystems currently have enabled.
>
> I created a pull request for that:
> https://github.com/sashiko-dev/sashiko/pull/349

I left a comment asking that to get merged. Thanks for opening this.

Brian

