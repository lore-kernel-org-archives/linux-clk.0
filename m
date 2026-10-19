Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427967;
	b=WvGP67sgSn131ShoRtKZHJYiBqmbUjMbIUu/3c6yMk5zxlDevRNUwjhFLz3SThg88T22
	 O2srjjYljjR1vE36rkKbyG2V//dXSpFoXLAa/GSAGHIc1ry7Ml80oVTyKGsX/iMkeorXS
	 xcgqpiy1kmn497ClKRARROY8255CQEO54NC2mMmhqa7Br0PS299BQ6lrPCAqjrAdUiLga
	 lASuUxQON58AKU0IR1xrNF48aW0NZDHDN9J+PHyJzBCZ5LfDYIcmaS1LFynuzH0GgXF0c
	 F2BPdlCAVISJC4WsqN7lWoItSX+TPh/gIkRHp9/eDKSUELY1Gp40Ru26grHGPsU5AuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427967;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Q8KL6LGvq0FwHTPovYus9FfkhDMRIi4bd+XQz8TiIQM=;
	b=zLNYpLOkDLJ31iRfbnu4/9d/Pj6nx0ZGSeaBSRIF6ga9ehTMF0H+7QGpHPC0jxzpygaZ
	 soF5hIcZ3FFhSCIE+4rRV8rxSoz3V3uk1s89u+3GhN+DADxedb/j4aFEvMGexg4oxKvaG
	 irz849yqHnBFxptne64UmVXQ7skiwG5PSuCpX+ON4wBbTsY12UrFeONBKXamd3WGSKwJ1
	 AjNXoAgqWHszOcjgNxK31RUKnmwBs8C8CQzT8v9e+w3IO0Th+ImvGwBGMcLCaO83HgF/h
	 WVw1Jm+WDZ7CYErEgmD2ysf4/sFdaRU4Y5dBuK4m4uL2vLX8434zziUCvnZm5/SR0Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514AA606A319
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 16:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 514AA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso3008203a12.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427966; x=1793032766;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q8KL6LGvq0FwHTPovYus9FfkhDMRIi4bd+XQz8TiIQM=;
        b=uZ/a558ORPsNHawWqquqDBtodT3XXGCzVfTAv/cohNXL02EIO5+UWViOEEejuKcVKb
         zKOQqN0uVCdzMMBM+cyKIUuo7I/U3NK3EwlZxhOef6gI4i5wvDcBFBUZWBmKc6I0ZJHa
         YOm0wKn5TBOxe1jtFA4djTBDW842vxTmlURMjlV+y9KF3ATtwx2qcHMb9lRaG+I0hPic
         IMiPoujLtM9G4dq5UaJLqoXtPEc570wZFauPQHrVyH8RGhljyfgIf5eeIt0r14p6MGEB
         rjVlneNbEEYYKCmAD3y+MVbJ/Mz76JvY+6EA0w2762k1+ZXITS2g7SziNKi9cAecte1Z
         888A==
X-Forwarded-Encrypted: i=1; AKwUvBw0JXsOmJfcCFcaG8MHqaX7nFl6Wi01XXlyW2DqHTgSFBk0hUBBpH9m0aEskgeiyo06lf3o7Ysifag=@vger.kernel.org
X-Gm-Message-State: AFq9FYLODmmjGNKIkc3QtedokEN+F+VToQCZ3+FWcNSHjeoadr8nB1Xy
	t8tNcow4S5PrVRcmCOSrQYNwHmsRuU6o2YDvdFlfx8KZvJeGQ5mmkB8rKX31i/844ek=
X-Gm-Gg: AYBFou0cjv34iEJBx+UKQKuxev5uG6Xkv9zCpzp81sQTvQffdx/1dcPnU34LaBCXoOE
	OB+vAcrtJpLbVi+CRNpn4zISbptpGkdAZ9JXDVw78UyAokAE5yzK/GzLq/ab50s3COOAVrjyva1
	MPUVfBS8Rm/wnfPEIsiqg2W1/yZ30zMTUFssB+EjUMA9Y4iiGnJKmV5xLXm14aMXahlsECSk7l6
	QcXIbFST/aAnUl3bkbS8B6nuzrEpBDM1xDbMiAkOn7jmhwwdzO6VXX/hatIY5ttOkwOKtvbPQAx
	rmDH8bSzVi1VyxdiFgh4i/FAX6ucMmpBPpq5NzrACiJWgeLQd63bmrF+s6E17PWvk0jcqsRwOMZ
	gxAp7078mQy3mY+QAOmE+Ds9Z0oimfH+MxQGH4kIcyFUMpqM9fPS9L58kLlcK8gwVhmdcLh4/8B
	LNabhsQJ1y9rw59so6CJr6LJHuYNNcDNHf82Uj4RMDpBnheF0Ezyg66X0MBfvm5Q/NltnGM/Gkr
	rP56xbRYIBII6eSYdTdhcP8wcqB01OjFkph
X-Received: by 2002:a05:6402:3215:b0:6ac:773b:9c55 with SMTP id 4fb4d7f45d1cf-6b3a820828emr5146464a12.40.1792427965370;
        Mon, 19 Oct 2026 09:39:25 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1db789sm4082037a12.29.2026.10.19.09.39.25
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:39:25 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c411e139259so219462766b.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 09:39:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwnBVMxXmcGHAUakG6jwE6bC3YPpZauy+MMgZcTGJ4l7n9LWvALLHtyBUh2GiOttLqxbWbkAC+cjJ0=@vger.kernel.org
X-Received: by 2002:a17:907:944c:b0:c40:6ed9:b961 with SMTP id
 a640c23a62f3a-c419a05c502mr618122766b.5.1792427582507; Mon, 19 Oct 2026
 09:33:02 -0700 (PDT)
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
 <20261019160545.GC3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019160545.GC3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:32:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
X-Gm-Features: AclHuK84fhnixZiNIMOwb9AdAvJEMnIe-A6l4ZZgkoIEEk378oR8Z0wb7zPZzKY
Message-ID: <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 18:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:44PM +0200, Geert Uytterhoeven wrote:
> > Unlike provider-based look-up functions in other subsystems[1],
> > genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> > the provider is not found, thus not supporting probe deferral.
> > Currently this is worked around in of_genpd_add_subdomain() by remapping
> > -ENOENT[2].
>
> But not in the other functions calling genpd_get_from_provider() and
> propagating the error up. Have you validated that no existing call
> stacks will break ?
>
> > Fix this for all current and future callers by returning -EPROBE_DEFER
> > instead, and drop the no longer needed remapping code.
> >
> > [1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
> > [2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
> >     return -EPROBE_DEFER").
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4:
> >   - New.
> > ---
> >  drivers/pmdomain/core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 964e44c2f78f1d55..88c886814a5b9da3 100644
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
> Expanding the context:
>
> >               return ERR_PTR(-EINVAL);
> >
> >       mutex_lock(&of_genpd_mutex);
> >
> >       /* Check if we have such a provider in our array */
> >       list_for_each_entry(provider, &of_genpd_providers, link) {
> >               if (provider->node == genpdspec->np)
> >                       genpd = provider->xlate(genpdspec, provider->data);
> >               if (!IS_ERR(genpd))
> >                       break;
> >       }
> >
> >       mutex_unlock(&of_genpd_mutex);
> >
> >       return genpd;
>
> The for loop seems to imply that we can have multiple providers for the
> same node. In case a provider fails, the function overrides the error
> code from -EPROBE_DEFER to whatever the first xlate() returns. That may
> cause issues for your use case.

The code has been like that since its introduction.  Technically one
can register multiple providers for the same device node, but one
can never safely remove one of them, as of_genpd_del_provider() just
considers the device node, and removes the first matching provider.
So I think someone just didn't like nesting curly braces, and tried
to be smart ;-)

> If the of_genpd_providers list doesn't expect multiple providers per
> device node, I would change the above into
>
>         list_for_each_entry(provider, &of_genpd_providers, link) {
>                 if (provider->node == genpdspec->np) {
>                         genpd = provider->xlate(genpdspec, provider->data);
>                         break;
>                 }
>         }
>
> to make it explicit.

Will do.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
