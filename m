Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5879A1CAB3
	for <linux-clk@vger.kernel.org>; Thu,  2 May 2024 05:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714629179; cv=none; b=p2/T1hvWMxd0tWqTe/PvyNVKDncs/MfmF0XXAHpzY26GcevOKitOwxjLaY72i2nc8xw30uyUA8VAVgjcS3N59rGNC78n5kRMKsyfmxpCq+qj1f7jcp9o7pIPoifppCaJxLJZtbdil1MrgPa/VcERHQpRQ+wraaA6LSsoKiob/WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714629179; c=relaxed/simple;
	bh=Vr8lTCzO1VAJ0OenIH3p+WXBrU2/jSnRyY4dIxgUK0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8zAKZcs2lshqy9S5cmMgjdXiTQGoTzGZUi50/QyUQ84dYsstBZI6EpgXwEfwrygzQWUrplvDQ0A5/ri8LrlR9s/4YWVRy42g3KATf8LNc9d2wKqfbtllv2r3jmpOlMbRNnRKQ4joHalqZeJeVaL+dGWeAH0BxAa+/JBvP56rjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cIFwGmd5; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cIFwGmd5"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7f16ff3aa61so866443241.1
        for <linux-clk@vger.kernel.org>; Wed, 01 May 2024 22:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714629177; x=1715233977; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2v5ycL9gtgqXkrtE6QN/SY19fUHl9GdEfrTwqyHjjjo=;
        b=cIFwGmd5Nz6A+tHCIuA79glc3PuGwY1vLkFpFGp+9fRM0ih+4CVHC+Qkm5O0OeQOZT
         pRapRaJSR/vEFgAJd9j48cEZ+6s1wsiDpx2ByikfssSvHfP/XkOLACCmLZUhsDpht5dQ
         TlE/gBL6AED0vKvRCMyO2IZJ8xLVrQW6xTGxFlRRYGwd96dWXF2bvsOUSAYPxascgYQB
         ecycxz6FWn9ySoEBx7HvWUH7YCt1Tulm9BYfnFlFeSSWYxppjptIsLag9+OOEpoaeXh4
         pySUerkAlZAxu9P1duVGzUx47sjZcbixfFSEimvssu3MZbXtrKY1IytBowLBkF4Z6rlJ
         Wq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714629177; x=1715233977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2v5ycL9gtgqXkrtE6QN/SY19fUHl9GdEfrTwqyHjjjo=;
        b=NitWO3t39BfdSTTMtrWl1KeSeMMSNFu46N/n2LQzLUMv4zpn6P9lK6+LIzEWeNeZnF
         ewZC4FAlal02QpwgAAIEkIgH4dFylVidx71XJ3sQ7j+5ABupxUEiKF44eZJtP1q2M/Bv
         /pDRECWh8nAgxKV0wAAf0KGlJ2RNCAbWx2IuNIfh/iDsFWhWjqO2vfQN2Ci4lHrSiskZ
         Er5lpo7FSnxgvpGVwfe7nGnq8B4asKTfB5sNVv/IoHnYUFYfN/n56snGBj2FJ6Rbrwcx
         d1myeNE4bh0qE+28zEh20NWkbyT9X9+Or0f9AgBKKq70P4AXBMqee8d4GGqdK2ugysiP
         WUWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx1h9ASkiL37uRRalAOIqH+EEVsNKcvD5TZRJj4ZF9IPg3D7ZTPSTsKFbh9BRNg3Cp3sGAxs4WTKk7U8NArWNSAO9Z+wxLIGso
X-Gm-Message-State: AOJu0YxRRuicCgyM4zP8Srvjng/XXrdnZ97s2SRMGlVsLnp0hQJo2Pfk
	4hjZu8+hcY04W3hlTmrVf7MwcHLFgPEVWjxvJRG5BoHJoOqJwWYNVpjUmKd7tqI+4uoDssbE2DW
	V44IajTH4LdTRsslq/lmneD9iZzpfoT7XRpfyEw==
X-Google-Smtp-Source: AGHT+IE4z0Ze4gzkMIfqiFc+oCUd9KfOkp4NqCn+dDWcOn1IKyPUjkFfjMy1SuxTyT2yHEuBcn9tW//JhlQvugz5uRA=
X-Received: by 2002:a05:6122:3109:b0:4da:9a90:a6f2 with SMTP id
 cg9-20020a056122310900b004da9a90a6f2mr5459247vkb.10.1714629177112; Wed, 01
 May 2024 22:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429214502.1363592-1-festevam@gmail.com>
In-Reply-To: <20240429214502.1363592-1-festevam@gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 2 May 2024 11:22:45 +0530
Message-ID: <CA+G9fYvAbjZ26RBXmkMGUgO-sXSNFtsVZ8_2Y=JmuFknfL4ZxA@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: imx8mp: Switch to RUNTIME_PM_OPS()
To: Fabio Estevam <festevam@gmail.com>
Cc: abelvesa@kernel.org, imx@lists.linux.dev, shengjiu.wang@nxp.com, 
	linux-clk@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Apr 2024 at 03:15, Fabio Estevam <festevam@gmail.com> wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> Replace SET_RUNTIME_PM_OPS() with its modern alternative RUNTIME_PM_OPS().
>
> The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
> compiler to evaluate if the suspend/resume() functions are used at
> buid time or are simply dead code.
>
> This fixes the following s390 allmodconfig build errors:
>
> drivers/clk/imx/clk-imx8mp-audiomix.c:363:12: error:
> 'clk_imx8mp_audiomix_runtime_resume' defined but not used
> [-Werror=unused-function]
>   363 | static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/imx/clk-imx8mp-audiomix.c:356:12: error:
> 'clk_imx8mp_audiomix_runtime_suspend' defined but not used
> [-Werror=unused-function]
>   356 | static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/linux-clk/CA+G9fYuP7S+a89Ep5g5_Ad69EMwRkJ8nM+MMTzbEcP+6H2oMXQ@mail.gmail.com/T/#u
> Fixes: 1496dd413b2e ("clk: imx: imx8mp: Add pm_runtime support for power saving")
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

Thanks for the fix patch.

> ---
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
> index 574a032309c1..6a9b48b20cd6 100644
> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -368,8 +368,8 @@ static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
>  }
>
>  static const struct dev_pm_ops clk_imx8mp_audiomix_pm_ops = {
> -       SET_RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
> -                          clk_imx8mp_audiomix_runtime_resume, NULL)
> +       RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
> +                      clk_imx8mp_audiomix_runtime_resume, NULL)
>         SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>                                       pm_runtime_force_resume)
>  };
> @@ -386,7 +386,7 @@ static struct platform_driver clk_imx8mp_audiomix_driver = {
>         .driver = {
>                 .name = "imx8mp-audio-blk-ctrl",
>                 .of_match_table = clk_imx8mp_audiomix_of_match,
> -               .pm = &clk_imx8mp_audiomix_pm_ops,
> +               .pm = pm_ptr(&clk_imx8mp_audiomix_pm_ops),
>         },
>  };
>
> --
> 2.34.1


--
Linaro LKFT
https://lkft.linaro.org
