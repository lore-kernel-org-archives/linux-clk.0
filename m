Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498858;
	b=SrdQT8qutPabthINMfls5tJecS4uowqfagPt7uyrsRnvqKI9xdTjsh500jvCkfIBL40Z
	 OKe+B0HQb5OG5LU34+P4GTQh7iv5bieTdKvhstFj3sRoTsLwrE/ymAa9gVGTRLez2HmKG
	 28NBgs76kjckhN0XjZfTq7KGwSEYY7PqnA4MTCFv4gvhoxqrtb/wVLRzeJmWgV3LdUMkE
	 2LN0kloNplQBj88zJrJMVLNDzlKFHUxRnBqeb7JUPoUyTGwy8nya2OtWUJ0cGFgcZBPDF
	 xdtnSbKK9TiyiNfG/SkpmxfozDDozszxBD28s1VQBkujPvJUG8DQ0md5XVcEjG/qyaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498858;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=w8ekeggAdWyBqH97gBi+p9TPg4z/iYMBplVI65cJ2lQ=;
	b=aAb4KBmyw1ZojvecYcVEJOwjhwa1tiVjKxl8cIECQLaVx0QK2Vi63gkyHAzIJVi+XSAZ
	 cNNZA9IX5aIvTJUCzktE+zj0yVUrfsnx73NEeOo6S1HGqFYrV373jsEVYOpdk2UH1PQH7
	 B6kWhWR04myEgeh8B8l0qXC10e+MAUzI+AK1jBgQbHesvbD5bPLvGnI0fX0kOcT3bd0qH
	 GK8yC2/M1OvIFS+JItYkFcCcSf/bL0+BUj5O/ezV2BZRNpQIW5JYHCRdIluJTGE72WeKE
	 nkop22pIUjUYmo3xsqCKVf5bS3HkOI5FOIaghl41N9Nfc7fmEJZYVOHpZ9ILWD1DAsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C3606A31B
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 12:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 260C3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso983586e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 05:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498857; x=1793103657;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w8ekeggAdWyBqH97gBi+p9TPg4z/iYMBplVI65cJ2lQ=;
        b=Dferp4aRfGJ1wFsy4u6lGi4x6nMFqj74CCJR8OZamzNSIohRZWm45KyY+sZDjQgRVJ
         KdyGaTDTgMmfzjP3yofmdg89GjzamdGQyD9W2R7uxN5yO0kfFESMTia2z5VaNEbgA+L3
         gR9ANoSC2ZKzWixcPOtu+youMowpqc9MAQTAzhYBINapCLwjVmL7nqfmPdHNOYB9kIsx
         v7vX3G23gE0Oy1eXb1RwKh4TkzlZKqo+J5Zrjnn/2iPsn5BNeFhdJFYViPD61+N7BJd4
         jQroqVyZ74ivkkIckWCzNXAzkW+djiDIp5DB5MzvelkEqb+PFmvWW7aDezNq6L1rH6AM
         CHzg==
X-Forwarded-Encrypted: i=1; AKwUvBzrZPLtUIkcqxc4L10RPO6/sswtVvGKinOmKWTh63GxMA51bqvYokT9xXQ72J4cvzYlxb1lgEpaJxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyCNypDeeBIS6ur8E3KpOTML0JL3EJn8JSNUdBs2I4xYdJsvKX
	XNiPltn2DCgdx6C8iNSvlvUK+638WIs5R1rGPiLU/JvhvAQZcEjK+6oAjX6qHuStj2E=
X-Gm-Gg: AYBFou37rqCzfcnBRyHcttmgzIsRgbG67xvG4wklDsivv9vAi9NfiivGGlt7zqtBoEi
	AVkKUN4mFBlLQjibrpJl4RD67kTQD/3YKNTbU64fNMoaPqKbVaacqbNf5/c8drCsM5zytgGdgwe
	FKVSNeutfcnCbFBhTQds09AGrPXp5o2UyR4SXs8ROmKX3sCG1R77iGZQTcKKoysg3wsSuF9FwHE
	NFxAbS2wrfSCP9nT6lyNVKKcEKGOLw4ZKAHeD/itzSFiDHxRS7XyB1+Vf/gB/CG6xzU3msbcYlb
	zFo9Me9Ron60MgcxIBuRyrE3yqiQHnOxYkOG9Kr8gXxwhGD2cZoTdN9Y+ZHwpCj+jwGRkR/59/r
	V9COFbFFHRu3mzv07Jkf04gnTzGZxg7Jr7znMFfw7oVyuksWs+DtdNVMRYsGuHkVeRsUiDlwuh2
	x+azjs5C9cZ3gUrR0CrBsCh8YgAiz2Jvx7QaSQxCm2/LfHB28Tgzv94cvDDBJVt9Y9bFAxvZXGl
	+MPE1rsFVdxuQp49f08NHU3/B3PjF3rYccj
X-Received: by 2002:a05:6102:441e:b0:7c3:873c:b3fa with SMTP id ada2fe7eead31-7cc3672e274mr2143022137.4.1792498856972;
        Tue, 20 Oct 2026 05:20:56 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3642b1sm2625313241.8.2026.10.20.05.20.54
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:20:55 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9908e3cd939so846439241.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 05:20:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw8U5nDARg0zlpBWfhjAYGY74vbP2NE6SlmkM06FfgCPQWhhrLq/hrZ4IKSDEFWMjVtQoMUBBJ2HOI=@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:7b8:1a1b:8e79 with SMTP id
 ada2fe7eead31-7cc36495eeamr2517275137.0.1792498854605; Tue, 20 Oct 2026
 05:20:54 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-0-e052903a3832@ideasonboard.com>
 <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
In-Reply-To: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 14:20:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLC7Zw9x6=iz2WMeuPr=rhqKMVPpRdVqFcHJxmAYC79w@mail.gmail.com>
X-Gm-Features: AclHuK8ponr4NJ0lS94fhAlbo48BEUWSxi4Wc_0ZZ5rhhDlLA3L5w0smnHDD8jQ
Message-ID: <CAMuHMdXLC7Zw9x6=iz2WMeuPr=rhqKMVPpRdVqFcHJxmAYC79w@mail.gmail.com>
Subject: Re: [PATCH DNI v3 15/15] media: rcar-fcp: Check device revision at
 probe time
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Thu, 15 Oct 2026 at 09:53, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Verify that the device revision register reports a valid value,
> otherwise reject the device.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c

> +
> +static const struct of_device_id rcar_fcp_of_match[] = {
> +       { .compatible = "renesas,fcpf", .data = (void *)RCAR_FCPF },
> +       { .compatible = "renesas,fcpv", .data = (void *)RCAR_FCPV },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);

I don't see a good reason for moving this around?

> +
>  static int rcar_fcp_probe(struct platform_device *pdev)
>  {
>         struct rcar_fcp_device *fcp;
> +       int ret;
>
>         fcp = devm_kzalloc(&pdev->dev, sizeof(*fcp), GFP_KERNEL);
>         if (fcp == NULL)
>                 return -ENOMEM;
>
>         fcp->dev = &pdev->dev;
> +       fcp->type = (enum rcar_fcp_type)device_get_match_data(&pdev->dev);

s/rcar_fcp_type/uintptr_t/, although this no longer seems to trigger
a conversion between pointer and integer of different sizes warning?

>
>         platform_set_drvdata(pdev, fcp);
>

> @@ -215,13 +332,6 @@ static const struct dev_pm_ops fcp_pm_ops = {
>         RUNTIME_PM_OPS(fcp_pm_runtime_suspend, fcp_pm_runtime_resume, NULL)
>  };
>
> -static const struct of_device_id rcar_fcp_of_match[] = {
> -       { .compatible = "renesas,fcpf" },
> -       { .compatible = "renesas,fcpv" },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);
> -
>  static struct platform_driver rcar_fcp_platform_driver = {
>         .probe          = rcar_fcp_probe,
>         .remove         = rcar_fcp_remove,
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
