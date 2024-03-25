Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C31512F381
	for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 16:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711383578; cv=none; b=PMdZvAI9J4Y93tZNrPqeScXen6uT1OavtfqTzKaPCbQIPiFbajN2EqYoMNxZrUe43fh2h+L7iFxDR5eWqFLbvFsUYnTimLbVCukNCBxHqL4qtax1kbTDpTR3VyPUE00GVHMI+w0y0DMC7ymcpwwtXQ7x+B38+bhLEDml8LI8E4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711383578; c=relaxed/simple;
	bh=uh9WFKIeWkaAivfeZSQMhbdOFpPDb/6h8qrwur73QbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwdsOfIL7467guxLsAnDXdUFvhwtXRjOxRKUtk//lSvglQx3wTqADqYBlnpDo2y9Vh9U3tDwER106FviR/Zsys6G2VTr1OtXrsCVNhk0aLh13Nln2td/fKUSB78YrnM9OYhLVMRFaxG/PL6XfEdWDNNtf1fZNCVinWE8aqP7IjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XLLBaugm; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XLLBaugm"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6e4e51b0bfcso2240886a34.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 09:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711383575; x=1711988375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipKnULZuL+tAFscQ7D07riaZRlX7/8LgeP9Tufvdjpg=;
        b=XLLBaugmiPhoNGtKG73uPzqJiCtlYMpyH4dUevRSjdhxmykhJTTypVfEsU/yZgsMGV
         WJZ+UxEy7BnWNSg7QGhxdBl+6uxr44ZqX6Fg0M1fr+zfpQMP4BAozvxGeGxUVTubgt4D
         U+d+WQK6R2mTuERnuSzeWhx97qTykJBGXKiHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711383575; x=1711988375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipKnULZuL+tAFscQ7D07riaZRlX7/8LgeP9Tufvdjpg=;
        b=p5RS34f2SxuAhVar1rbS35ROl1GlqpGZoefMkj8MGtVNoFJvwQXWrzDRWTy2InXqHp
         Fxbk0x/v4eVO63sSkJMA1CCUhrlXBHmYvbG8GFIO6I/wiGapl14Wio7PQaRM5N1FZjbA
         bSth1MxRqCZcqfXNKvxj3SE3egy7m0wVF7nS3cpnTVZwvjOLL/1FlYOKsW0rsyLCpB+W
         0M14OWYOcFn+l5i7922/EO0HFvc5N/LfP98K/jMlZJYKJMIe7JbWoIGZzC+u+XGnZe9W
         xSb1pm1jQgm2ynxgJhpguoWmtbjzG02eY2N7GVq6L9GbXfaa2Txhg8Q78VqLJk5Mcp+t
         XxKw==
X-Forwarded-Encrypted: i=1; AJvYcCVywg7l4cLvMP5bIlp5bYO/X7rLx3FkB6/h310afDnw9jvfrm0eBKjx2Ve3/XzYWovCq6ZBzVZXnq9giGlgbDJO0vnIVoEhLK8h
X-Gm-Message-State: AOJu0Yw3/h9eQ28rxfKsSG+Y67y/Br9Loe0EIis9nha4yCvHtT9P8PZg
	uqAHQFQE3tf+GWsmaHSviW71soF55yM+1guWkz07Hq02gpeDRQVVU1J7x8r/HDooTq5as29lZ2A
	=
X-Google-Smtp-Source: AGHT+IFTHGkVjKoJ/s7PTDGb/JpAL26Mnnix/PqHHHU1pS99iYtcNRXF74XnVUi+uZ1Xkt1kNy2DRA==
X-Received: by 2002:a05:6830:1601:b0:6e4:e514:c3e4 with SMTP id g1-20020a056830160100b006e4e514c3e4mr9109080otr.13.1711383575177;
        Mon, 25 Mar 2024 09:19:35 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id c9-20020a05620a134900b00788357d6759sm2250383qkl.11.2024.03.25.09.19.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 09:19:34 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-42ee0c326e8so413681cf.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 09:19:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVi4G5dM99Zb3skVWYR/TK3oYDVb+A8gP27mNdzXQ9di0O0ZMIPmxmVr4Qz9aj5TBqieGHKQejLhL6tlnVRYQyk6qcOg1+vBGox
X-Received: by 2002:ac8:5c0f:0:b0:431:1e00:996a with SMTP id
 i15-20020ac85c0f000000b004311e00996amr1088763qti.27.1711383574002; Mon, 25
 Mar 2024 09:19:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325054403.592298-1-sboyd@kernel.org> <20240325054403.592298-4-sboyd@kernel.org>
In-Reply-To: <20240325054403.592298-4-sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 09:19:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vc-oe=JVJmg4w50VB_-AyxNoWe5KotnXPzrXUfgqhpkQ@mail.gmail.com>
Message-ID: <CAD=FV=Vc-oe=JVJmg4w50VB_-AyxNoWe5KotnXPzrXUfgqhpkQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: Initialize struct clk_core kref earlier
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hik

On Sun, Mar 24, 2024 at 10:44=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Initialize this kref once we allocate memory for the struct clk_core so
> that we can reuse the release function to free any memory associated
> with the structure. This mostly consolidates code, but also clarifies
> that the kref lifetime exists once the container structure (struct
> clk_core) is allocated instead of leaving it in a half-baked state for
> most of __clk_core_init().
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9fc522c26de8..ee80b21f2824 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3959,8 +3959,6 @@ static int __clk_core_init(struct clk_core *core)
>         }
>
>         clk_core_reparent_orphans_nolock();
> -
> -       kref_init(&core->ref);
>  out:
>         clk_pm_runtime_put(core);
>  unlock:
> @@ -4189,6 +4187,16 @@ static void clk_core_free_parent_map(struct clk_co=
re *core)
>         kfree(core->parents);
>  }
>
> +/* Free memory allocated for a struct clk_core */
> +static void __clk_release(struct kref *ref)
> +{
> +       struct clk_core *core =3D container_of(ref, struct clk_core, ref)=
;
> +
> +       clk_core_free_parent_map(core);
> +       kfree_const(core->name);
> +       kfree(core);
> +}
> +
>  static struct clk *
>  __clk_register(struct device *dev, struct device_node *np, struct clk_hw=
 *hw)
>  {
> @@ -4209,6 +4217,8 @@ __clk_register(struct device *dev, struct device_no=
de *np, struct clk_hw *hw)
>                 goto fail_out;
>         }
>
> +       kref_init(&core->ref);
> +
>         core->name =3D kstrdup_const(init->name, GFP_KERNEL);
>         if (!core->name) {
>                 ret =3D -ENOMEM;
> @@ -4263,12 +4273,10 @@ __clk_register(struct device *dev, struct device_=
node *np, struct clk_hw *hw)
>         hw->clk =3D NULL;
>
>  fail_create_clk:
> -       clk_core_free_parent_map(core);
>  fail_parents:
>  fail_ops:
> -       kfree_const(core->name);
>  fail_name:
> -       kfree(core);
> +       kref_put(&core->ref, __clk_release);
>  fail_out:
>         return ERR_PTR(ret);

If it were me, I probably would have:

* Removed "fail_out" and turned the one "goto fail_out" to just return
the error.

* Consolidated the rest of the labels into a single "fail" label.

That's definitely just a style opinion though, and IMO the patch is
fine as-is and overall cleans up the code.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
