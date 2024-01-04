Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8619423756
	for <linux-clk@vger.kernel.org>; Thu,  4 Jan 2024 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BjfY4km8"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7ba903342c2so26865539f.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Jan 2024 06:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704379904; x=1704984704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=or1h/yMnjb6tVAyJBd6HlW28SfRdcpAwUGvNMzv3A58=;
        b=BjfY4km8d2TyCCCvkH/MBBhr/62VTu+nN/Jzh4dEHBEp7XZHum2le35+8dbDHwiMB2
         4VxvXDU8apZ0vkHWsEz8TZct98hFG1qKRLH3MHOW9DcJfov99jizBVBhmsoKGoPMbala
         ywvK6cVy+Oz1uiD0qj9PomcT2GXSmhPGXTN4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704379904; x=1704984704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=or1h/yMnjb6tVAyJBd6HlW28SfRdcpAwUGvNMzv3A58=;
        b=rQpDGzgJ2yJQUwOUU+gp5L/v/qWx6ypQBKaz/Vofdq2bP5a8+plqJTpzMLf8JNTStM
         i7g+2yuXu80Z7Vl0M7FywQETvQhCk9pwwPYHx3rX9aeoh2UUzfzHFOihLZfH4mCT5AVj
         GeDqK5E7CTjOmBm+rGnJQVcjZl56470ujsTt8/vmy/z53xehsfiKw4TBTeAM/3DP1llF
         NDQonEfRWBaPpm3XWeDmAQUQWrW8z6zV4ko0V7ffZYhX5AR9SdKw2OXpUW5eQ5qTGccy
         7tNuIVur1i5nwgx/0clcWr7yrUH2Nmvy5ehNlkx6APRWwkALJFQf6HBDT+JQBLeFwRDt
         l25w==
X-Gm-Message-State: AOJu0YwT7773xyJCYi1Js58Am1cNtUQtNbx3Zio/oYh1oaGaZ3KABOmW
	iMJqAmbzrkWHrZtElMx1GzulDGSfdxGNQFFVvTdpvzl9Llav
X-Google-Smtp-Source: AGHT+IEYU2DLzWSUIVJNOwHaKCi+sergeBd9wsnJzrR/LxrNBZKPhWi9MLRYEkvnXrh64TiDxyY+/OhPCjGRQQYclA8=
X-Received: by 2002:a05:6e02:1689:b0:35d:58ce:2322 with SMTP id
 f9-20020a056e02168900b0035d58ce2322mr876045ila.5.1704379904640; Thu, 04 Jan
 2024 06:51:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102081402.1226795-1-treapking@chromium.org>
 <eed88b36-ae56-40d3-8588-0d5d75da71a6@collabora.com> <5520e8e3-c75b-480f-b831-c40b5cca029f@collabora.com>
In-Reply-To: <5520e8e3-c75b-480f-b831-c40b5cca029f@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 4 Jan 2024 22:51:33 +0800
Message-ID: <CAEXTbpeqRsWNgZE3ZgcFKogxv-tjAmQT=D6o6X4ViuG5ZZFCHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
To: Eugen Hristev <eugen.hristev@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eugen and Angelo,

Unfortunately, I don't have a way to reliably reproduce this either.

We notice this issue from the automatic crash reports sent from the
users, but we are still not able to reproduce this locally.  So our
plan is to ship this patch to the users and see if the crash rate goes
down after a month or so.

Regards,
Pin-yen

On Wed, Jan 3, 2024 at 9:20=E2=80=AFPM Eugen Hristev
<eugen.hristev@collabora.com> wrote:
>
> On 1/3/24 14:19, AngeloGioacchino Del Regno wrote:
> > Il 02/01/24 09:12, Pin-yen Lin ha scritto:
> >> Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate
> >> this clock needs a runtime PM get on the clock controller during the
> >> probing stage.
> >>
> >> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > Hello Pin-yen,
> >
> > We have experienced something similar, but it was really hard to reprod=
uce after
> > some changes.
> >
> > In an effort to try to solve this issue (but again, reproducing is real=
ly hard),
> > Eugen has sent a commit in the hope that someone else found a way to ea=
sily
> > reproduce. Please look at [1].
> >
> > I'm also adding Eugen to the Cc's of this email.
> >
> > Cheers,
> > Angelo
> >
> > [1]:
> > https://patchwork.kernel.org/project/linux-pm/patch/20231225133615.7899=
3-1-eugen.hristev@collabora.com/
>
> Hello Pin-yen,
>
> Can you try my patch and let me know if this changes anything for you ?
>
> If it does not change anything, can you also try this one as well ? It's =
another
> attempt to fix the synchronization with genpd.
>
> https://lore.kernel.org/linux-arm-kernel/20231129113120.4907-1-eugen.hris=
tev@collabora.com/
>
> Thanks,
> Eugen
>
> >
> >> ---
> >>
> >> Changes in v2:
> >> - Fix the order of error handling
> >> - Update the commit message and add a comment before the runtime PM ca=
ll
> >>
> >>   drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
> >>   drivers/clk/mediatek/clk-mtk.h |  2 ++
> >>   2 files changed, 17 insertions(+)
> >>
> >> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk=
-mtk.c
> >> index 2e55368dc4d8..c31e535909c8 100644
> >> --- a/drivers/clk/mediatek/clk-mtk.c
> >> +++ b/drivers/clk/mediatek/clk-mtk.c
> >> @@ -13,6 +13,7 @@
> >>   #include <linux/of.h>
> >>   #include <linux/of_address.h>
> >>   #include <linux/platform_device.h>
> >> +#include <linux/pm_runtime.h>
> >>   #include <linux/slab.h>
> >>
> >>   #include "clk-mtk.h"
> >> @@ -494,6 +495,14 @@ static int __mtk_clk_simple_probe(struct platform=
_device *pdev,
> >>                      return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
> >>      }
> >>
> >> +
> >> +    if (mcd->need_runtime_pm) {
> >> +            devm_pm_runtime_enable(&pdev->dev);
> >> +            r =3D pm_runtime_resume_and_get(&pdev->dev);
> >> +            if (r)
> >> +                    return r;
> >> +    }
> >> +
> >>      /* Calculate how many clk_hw_onecell_data entries to allocate */
> >>      num_clks =3D mcd->num_clks + mcd->num_composite_clks;
> >>      num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_clks;
> >> @@ -574,6 +583,9 @@ static int __mtk_clk_simple_probe(struct platform_=
device *pdev,
> >>                      goto unregister_clks;
> >>      }
> >>
> >> +    if (mcd->need_runtime_pm)
> >> +            pm_runtime_put(&pdev->dev);
> >> +
> >>      return r;
> >>
> >>   unregister_clks:
> >> @@ -604,6 +616,9 @@ static int __mtk_clk_simple_probe(struct platform_=
device *pdev,
> >>   free_base:
> >>      if (mcd->shared_io && base)
> >>              iounmap(base);
> >> +
> >> +    if (mcd->need_runtime_pm)
> >> +            pm_runtime_put(&pdev->dev);
> >>      return r;
> >>   }
> >>
> >> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk=
-mtk.h
> >> index 22096501a60a..c17fe1c2d732 100644
> >> --- a/drivers/clk/mediatek/clk-mtk.h
> >> +++ b/drivers/clk/mediatek/clk-mtk.h
> >> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
> >>
> >>      int (*clk_notifier_func)(struct device *dev, struct clk *clk);
> >>      unsigned int mfg_clk_idx;
> >> +
> >> +    bool need_runtime_pm;
> >>   };
> >>
> >>   int mtk_clk_pdev_probe(struct platform_device *pdev);
> >
> >
> >
> >
>
