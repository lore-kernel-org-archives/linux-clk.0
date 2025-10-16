Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11E8339B31
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622130; cv=none; b=mzCr/ZKklsDkUal0xL6M+nQHiPeKqoSFmx8AcZuuHVGj6gsAY3BmuH3+owsZQa+tSW1tJ7QFHre6MLOwrBDBqix/9kawF83k9V+8+bpNaQpzaOmwxha9QM0yftZSu92NssayMjWrMXuhy24Roa5nj9rqp+tNDwIj5EfMZFTNl40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622130; c=relaxed/simple;
	bh=fJlAd8F8EmfNdA9ffCw/7YWJBisZ2aZJ6bgML77jXw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPlae0YpVKEeYROe9E385lIpcYG7nHkG7RnXZZbEnK5jIXih7JQY39mVsc9YZDAmeiTSi8/v9kmQoNyQkC8LDFkrgroiHOCWeFUL9RDcxPtZJosBd0YO1F5FqX0E6MAqxzT9uJrbMxrnhHcNkaOlcC1Qtc9/sSV8FHmsciL2v4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5563c36f6d4so530594e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 06:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760622128; x=1761226928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIs3qdLP3F/YAW7YsgnmPdGp6LZDuxUynC8+HjYB7O8=;
        b=Kv9e91O/CR9gj9Ah+gOIBL42UbYSq7FCy5PDMgWBmY1kuNb0NNzR+No5qEElsmYEIk
         /cekYjiv/VMlL/dM82tLJzxP/Rqy+/r/7Rgvn2me7qwL0QYjgP9KMxuqSPZZKjL11Dp7
         JztDonzJYehmRJc+r9Cgg4yStTDqlY4rBBZr4M+fbntND+eEaOAqvoz1MGoLD0VtEPh2
         UAwafaw/PuhvqwuWyGRSipbaA3AUo+t0Z/ptbm6f7dwC155a+50pLQB4MV4k7o41M9zE
         Y2sQZ/x1Q6hQannIH4vZlNqz3iypwMYK49AfasYK66UiWAk7ghf7s1Jzvk6bNJASayce
         ii4g==
X-Forwarded-Encrypted: i=1; AJvYcCVAjXW3l4DpnW8STld5LWJUDj/SvaynXeRrIQPSuyUOXGJ0/wqVA7lhWsBE6sJ7I5vCco2Ttej2Ud4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+CtMORLkQXobZuV30X3pxby7XZIaD+ufDmOj41kJ5arSUzJo+
	wGKGEWYtc729UTs5qChvIs9tQX+wO2TxDf0U1hioUU7sVOqh4rdGdcrPo2xsf6fp
X-Gm-Gg: ASbGnctWPL06F2DIncVHg+APIdNgixjkVf6WvQlMJ7uFpQtvXao/r7LeD24vnTLC3Yt
	/vIvgINSgj925cKav1iAgwl0BQNx5x+2AXr7qTLZXdgmxen3qzV1CGQnODhsURR2VJZr1hBuWT5
	9YxJaXlzLf9EdUfKkyc9mWj/+NWZFTZSZML8j/imFAsH4pwdyRD8K2RS6kgRKZi09bBnyMZ1eV1
	weG1Le7Q5Q254J68CSLdK3WrvN6T1V7GHEXQIxHTC7ZaSqnQ9shLwc4+p3vginHqXGm1/N0CIPM
	fF6I6OCpupdLBzUyfSTrGI2ehGZEdmobcR99ThdJt3n2jgnpw7gTUuipTFwEjP6AsJc408AmAzW
	ymy8Ve7jaZlLtImMHN+K8Xs6DLEUPC/q7ny7FojX6zJO0BsyjPYphDTLZpsky70dN5GQwe+dJKK
	1sbdGvPeW51CDTXEslBMe+s55ebRBRbBajR9tNvA==
X-Google-Smtp-Source: AGHT+IE3YN5g+uoqsrAwov64mJ7+PIKARzMsHQMrduqOX7KR/fO5S3G8EXp7JOTvDKImOuYPFaI2zw==
X-Received: by 2002:a05:6122:6ab:b0:554:e069:d7b with SMTP id 71dfb90a1353d-5563feb71d6mr1185919e0c.0.1760622127582;
        Thu, 16 Oct 2025 06:42:07 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d7f01e3fsm5927927e0c.7.2025.10.16.06.42.06
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:42:06 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5b99f5d5479so1411197137.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 06:42:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyyU1oE2IOp57IMOmhVeGoxt4URJwOq5zPGSCJ6TuaMjdVbVcvTdMTZYo124CZibt2DXlukdtuR9Y=@vger.kernel.org
X-Received: by 2002:a05:6102:5088:b0:5d5:f6ae:3905 with SMTP id
 ada2fe7eead31-5d7ce7f9f8cmr1588639137.22.1760622126274; Thu, 16 Oct 2025
 06:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912142056.2123725-1-chris.brandt@renesas.com> <20250912142056.2123725-2-chris.brandt@renesas.com>
In-Reply-To: <20250912142056.2123725-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 15:41:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEjUzpu_-pukUxHBFDqw_+xjE9gy4MTKz-39bwDGCuTg@mail.gmail.com>
X-Gm-Features: AS18NWDpgOC-c34fem89ycndlFrZkPR3jTMZt246SCjZMhsihbRFxV1WKYaC9YE
Message-ID: <CAMuHMdWEjUzpu_-pukUxHBFDqw_+xjE9gy4MTKz-39bwDGCuTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
	Hugo Villeneuve <hugo@hugovil.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Chris,

On Fri, 12 Sept 2025 at 16:22, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>

Thanks for your patch!

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -33,3 +33,7 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
>  #define cpg_mssr_detach_dev    NULL
>  #endif
>  #endif
> +
> +#ifdef CONFIG_CLK_RZG2L
> +void rzg2l_cpg_dsi_div_set_divider(int divider, int target);
> +#endif

This needs a dummy for compile-testing the CONFIG_CLK_RZG2L=n case.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
