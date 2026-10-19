Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427282;
	b=tBQgJnz59r0DIdoCGFxu5LCLc+vx9lazE2d+t4XBECgKzwNxisZsRhtBgio0h22QsKL0
	 m3G0yw6FxEUsv0GmFfGJmfc3jQj78tq0MFGzsQRb5EfHM5IM+tbnpQwyuJNvil2+D65oR
	 psQhdTGExgCFM1lsPNRXDS2SMF7KaarvG9Izn5fhbqrl/WEjEyskGpKDDrdkGNTia9jOt
	 xhU3GZlmlRlyJPtW9oKnx6zWtuBdDc1UPn9di3mHk4ryo4ZGp58GjOj1PhlZSH4qo0DcX
	 gk1Ogx9QOEuECdXx6qFHluF2VO+3rWu+IkvEGHCxwupY3iPGkS+0ikTs6xzIAvAputA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427282;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=grtW76dvtFb1t9XrerLmKdj5qwyowpPAeH9vnpYNVM8=;
	b=kmcnzwPGQuM6xw9BaeZJLg6SQiAlsEdDjdHq/VT7NHRMS0H0d1UvgPxv4/DeUC6XtGpk
	 70gXQuocK1eBuKXnely5MazDX1Hky9fonYPb7rPY87225SZfCQehb+Y9MnxzcOpEtAOP7
	 p3e65j4jzYnlEyDqHL2+iTNcIS8WQiRlbcEKCbM8Fl38hP5/oRZsrmip5wHXu7a2I1tZp
	 o7IKoivvs2pzeWx9Uv+AxIKxMf/bCV1ybkQRo1YXiSQrkNcIkM5Mv8zp9lXoreN9OsVVp
	 0a+B4ckMRbQzxkzM57Pe0ID+zKXJhoZMcjx16inW58mgpSg79tSaVo03ISJ01MhlZWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8CC606A31C
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 16:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B8CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso355494266b.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427280; x=1793032080;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=grtW76dvtFb1t9XrerLmKdj5qwyowpPAeH9vnpYNVM8=;
        b=iDbVytj4cAGK8N3UyyOBQEKGUGDdRpGoC4mXaR0PvENlbLnyfwIFIGJPfa6cEoYQye
         35B2qFa9lr4Wd+VeEs+kep68FYPhj5UeLVYPpCtekU8RuvP9sLF3gcEpjeJ1SRAldM+r
         6i+m1eaekUJM9n+jr35uZH5aes4puLTsx/XDAxxqCdihzLGCEI1j5Q0L2V66nfvQvOwB
         J3IkRDRDM1PPgFJ+OhTJgOp4YEDQ4YYI+EgsvyK6ExsbPGKPxTcrdx9LOstKQ7wN1c98
         PazxVhVQgAnWuUBs0JeiHFqL0GfXBNZcZNI4pLKkUMCSY6/SQUn+4+QwsqdGvQ5QN7Pt
         c7FA==
X-Forwarded-Encrypted: i=1; AKwUvBwQAyZEjii0mAbUVc4abKmXqSmruG2SFrRKjOusNyb/sYlGKjU7BeZKV5femUmi8DGbgauTYuI086s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOhDCUIyDkM/6+acp5teSObjeRG8HtIjqW7w8On5WeF+MDF/7A
	yDVSq0AkMnyiNgJ22iyFu9rQs8AO4HsMozSjsktUwmJNQ3oM+z+MoelzCYZgeZoG4tc=
X-Gm-Gg: AYBFou3jf6gCuFyzGLJHQobcX/AKfufb62r+LwXkNi/Jq4Sa47AQEDYg7GvQPl+Y1ua
	j5o39YK7SYysOezRimZB+2QH8C8uSIuRThHjIPmJMe7rmLL8uu5ypZGz7iiy+AoQbFE6155To6G
	jno/CTLNnQ3KULXhRqisXPdnhIRGTRz8es8Sp9xeCufA7FTZ7SBu6n/OxFJiEvAiojK13Cxg7M5
	zlSQdyIxd23bPx0zaMTnhvovv/C5B4/ejPdW7GpS88nRcC1h6byuTRC9abUxl1IZbwCEt6q+x+r
	77CN3x9ARHoFNiGC3260WwaGKPEPZ9QqN9+vrnwqvijG76vqbnZ9GK96rDewZq/PZsJw6qa/Qu+
	uNKGqIW2hqe/W5WfyPlJF/352tEfu4seD06wEJlkbZN0Se+8cd9JI5k3A0501M8+3gsyWgUrYO0
	yj9zW4Xe9Hq5vSqTcYmN0aJzuA3Z8A7HxDKOTgepl7gnHrmM4fiB7LDXylEImzLSRffAKoDmN0K
	ITEXJAs86CdfXVuFwhguzw3gyZsDv6v+xVL
X-Received: by 2002:a17:906:1006:10b0:c42:53f:af64 with SMTP id a640c23a62f3a-c42053fc28amr329305266b.49.1792427276930;
        Mon, 19 Oct 2026 09:27:56 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb4ba6sm379437166b.75.2026.10.19.09.27.56
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:27:56 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso3299913a12.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:27:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzvXAKc3HD3rv1UJ0oEsbYRUhhPPCBcqw9FvzwnX+isTqw7YUQG6Bq8TC5LG7MlniqdJeTBVmtnWS4=@vger.kernel.org
X-Received: by 2002:a17:907:9486:b0:c40:f9ea:7387 with SMTP id
 a640c23a62f3a-c4199c63fd2mr604034966b.6.1792427276005; Mon, 19 Oct 2026
 09:27:56 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174605@kernel.org>
In-Reply-To: <sashiko-outbox-174605@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:27:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWT=9-GCt6pr3HT6C_=kxe2ud1y2jjXPZBH9MjcDYjB+g@mail.gmail.com>
X-Gm-Features: AclHuK-zFCPihodw8HUR_tYnDf84w30NySJpayeqxb6wS60EuVgB6NNWocEAZa4
Message-ID: <CAMuHMdWT=9-GCt6pr3HT6C_=kxe2ud1y2jjXPZBH9MjcDYjB+g@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Fri, 16 Oct 2026 at 18:09, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] pmdomain: unnecessary probe deferral on invalid domain index
> --
>
> commit c105920d803c0cf9396fb90d8428fdc4d83e8655
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
>
> Unlike provider-based look-up functions in other subsystems[1],
> genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> the provider is not found, thus not supporting probe deferral.
> Currently this is worked around in of_genpd_add_subdomain() by remapping
> -ENOENT[2].
>
> Fix this for all current and future callers by returning -EPROBE_DEFER
> instead, and drop the no longer needed remapping code.
>
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 964e44c2f78f1..88c886814a5b9 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -3021,7 +3021,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
> >  static struct generic_pm_domain *genpd_get_from_provider(
> >                                       const struct of_phandle_args *genpdspec)
> >  {
> > -     struct generic_pm_domain *genpd = ERR_PTR(-ENOENT);
> > +     struct generic_pm_domain *genpd = ERR_PTR(-EPROBE_DEFER);
> >       struct of_genpd_provider *provider;
> >
> >       if (!genpdspec)
>
> [ ... ]
>
> > @@ -3276,7 +3276,7 @@ int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
> >  out:
> >       mutex_unlock(&gpd_list_lock);
> >
> > -     return ret == -ENOENT ? -EPROBE_DEFER : ret;
> > +     return ret;
> >  }
>
> [Severity: Low]
> Does this change leave an unnecessary probe deferral in __genpd_dev_pm_attach()?
>
> If a device specifies a valid PM domain provider but an invalid domain index,
> genpd_get_from_provider() returns the specific error code from the provider's
> xlate callback, such as -ENOENT.
>
> However, __genpd_dev_pm_attach() still unconditionally routes all errors
> through driver_deferred_probe_check_state():
>
> drivers/pmdomain/core.c:__genpd_dev_pm_attach() {
>         ...
>         pd = genpd_get_from_provider(&pd_args);
>         of_node_put(pd_args.np);
>         if (IS_ERR(pd)) {
>                 mutex_unlock(&gpd_list_lock);
>                 dev_dbg(dev, "%s() failed to find PM domain: %ld\n",
>                         __func__, PTR_ERR(pd));
>                 return driver_deferred_probe_check_state(base_dev);
>         }
>         ...
> }
>
> Could this unnecessarily delay boot and error reporting for devices with
> permanently invalid PM domain IDs by forcing a wait until late_initcall?
>
> Should __genpd_dev_pm_attach() be updated to only call
> driver_deferred_probe_check_state() when PTR_ERR(pd) is -EPROBE_DEFER?

__genpd_dev_pm_attach() doesn't care about the actual error code,
it only cares about error or success.  Hence a change in error code
has no impact.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
