Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAFE77F37
	for <linux-clk@vger.kernel.org>; Tue, 12 Mar 2024 09:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710236136; cv=none; b=YC1GE9CTIux58PzUWvM4lwF/ITTVTjdp9R4tzGFOn6RSTlAS8VWCTUhq55RzrF/rIz24roTn3+RABL1qlEKHhVLRFZbrC70ltuXMJAjLCjohLqsXJ49X+v6HkPk1dFnTi+NpLmhdegaa2A9mLvwKheQEv4Noz+YOPrFKQTwBa4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710236136; c=relaxed/simple;
	bh=GSPlH5+pAXLIZKGJbEywqVhjn1mLUK2kKRA9D3gLmLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cStmixw/cpnYv33mpK1mO3K9fmpHeKHf9ETWm7/+1tXuUomM0WQOuGix1uqN6d2p4yaeHVwEN0HJJZNJ8QkXqJSSLZDx/rkMe6kWj7AH5EyPlt7dbMEXvlk7ATyvCrWbKW8uEEckXYcZEowF4iD1EfOS35d1mSM5AcG3IdJaYds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OGGN0hgP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OGGN0hgP"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dbd32cff0bso39910815ad.0
        for <linux-clk@vger.kernel.org>; Tue, 12 Mar 2024 02:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710236134; x=1710840934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67mIt70RA651hiRrdK60hZHecYixcfjG1H+3EdtMaw8=;
        b=OGGN0hgPlVwscLVLCSdYtcUz1DzqnzA5kLppGDWWuGcrw4VQBLI+nqgwU5eL+rehen
         ifTDKDJbqLrGvn4vit0vb33muMpHENYqXKgH5tchrTdEn4RV1XUCvIS5UK9xmOhLSCSD
         A5ewujSlaJ0uLH9ifHKtocYiEtWgUpuH9JTvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710236134; x=1710840934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67mIt70RA651hiRrdK60hZHecYixcfjG1H+3EdtMaw8=;
        b=k4ySyg1ZmeUtsoTtzfSFO+Lmu8Nfvs1QFJOkui2/SOz4JEi6pzbfpAlzDxpgBbMOYA
         Q+6dFito5vggcWBDOl+idIFDEP9NI4tYx1Qb+c9K/ALG8Dak/ig3OX6uJALe2OSU2xSL
         TiCEtn/tSA6/WlM3GqOpuFSNeNGlVPSmHJu7whOTy+Tfv1hRLKmTKGrzQ+XsVei1gJvO
         bz8XajcOephfN5HmpFsXD1v/s7pN7AaLweMVoik7tCfweVomFOyfFa53Gb30cZQ8g97E
         lAqwwtE2MwGwxGmZE5y8Fv1YuiTctQ4Nl9Mj4mJYoHkQBMSnuQoPB2iBv5O2xvB8l1Hp
         A9Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVen0V9pClYZLWhY+InKaHWfd/8IMkWSA9fi55rLa+tus45BnBgMcMkPOobXR9XN/2qXWGDQszy4J1fUJPIg5gtpHVv5XYWmBz2
X-Gm-Message-State: AOJu0YyciJ88uc1G/qxEHOWQx2nmjcydG3LR8mg/eWXXjypUv3I/sEZj
	3ObnkJFgpNbv82KS0PAeRjnhxp17V6xj9L4aPB85n9oezM5ZNuNZRtkVhseJre42LG+J9LvZ2Hi
	/3SEiNSqxTkp/I4BtPk5A5QrtSbm+kSxmXQYa
X-Google-Smtp-Source: AGHT+IFRheMB1JX4C3nOS5cWFzeoNd2uuovpqIFb3L8pxJPZAaYrzJBEw63ZBZYqsASkGhEl0MxTaaKQrIOJs3DVsdo=
X-Received: by 2002:a17:902:ef8d:b0:1dc:adad:f54b with SMTP id
 iz13-20020a170902ef8d00b001dcadadf54bmr8379096plb.44.1710236134159; Tue, 12
 Mar 2024 02:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108081834.408403-1-treapking@chromium.org>
 <CAGXv+5EnBt+7WrNb-QyziEaCihvjhFVf2tpzk=XyAoeELqucaw@mail.gmail.com>
 <e0e6febf-1045-49f8-a200-8bc095b0fa50@collabora.com> <CAGXv+5F5YFRKjaXu_XbXrUhqKL0NSRyt6tniQYfhRh+fsaxqmg@mail.gmail.com>
 <cc74422d-962f-4da5-867b-158a71db1a7b@collabora.com> <CAGXv+5EyRROsh_=J1Fg4K+ZgfkERF4dh4R6WoGw9MnTBMNUCgQ@mail.gmail.com>
 <dfdc6a65-3ccf-463c-95df-093f3c2fefd3@collabora.com> <CAEXTbpcPfWQr4iuD2U0zgJUi+BF-rLfyF4iDDiQYBrrv9U=6Xg@mail.gmail.com>
 <90f3f4e2-ced5-4fae-b765-5b802f4895c8@collabora.com>
In-Reply-To: <90f3f4e2-ced5-4fae-b765-5b802f4895c8@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 12 Mar 2024 17:35:23 +0800
Message-ID: <CAEXTbpeSyh1YfKsM8cqRjOFA7Ww4ooRxgCxMwXw2F4uCyX=OBg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Weiyi Lu <weiyi.lu@mediatek.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Angelo

On Thu, Mar 7, 2024 at 7:22=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/03/24 12:10, Pin-yen Lin ha scritto:
> > Hi Angelo and Chen-yu,
> >
> > I tried enabling the runtime PM regardless of the .need_pm_runtime
> > flag, and my MT8183 device works well with that with no obvious boot
> > regression.
> >
> > Should I send out another patch that always enables runtime PM in
> > __mtk_clk_simple_probe()? Or is there anything I should test?
> >
>
> Hello Pin-yen,
>
> as I discussed with Chen-Yu - yes, we must make sure that this does not
> create any regression on machines running on other SoC models.
>
> I think it's unlikely that it does, but since the HW is available, being
> extremely careful with validating this change is a good idea :-)
>
> If you can/want to test before we do, sure, please send the new patch and=
,
> when you do, please say that you tested it and on which SoCs; as long as
> it's not just one SoC, that'll be good enough for me.
>
> P.S.: Please don't top-post!
>
> Cheers,
> Angelo

I just tried this on MT8192 and the system looks healthy as well. I'll
send out a patch to enable the runtime PM for all mediatek clock
controllers.

Thanks for your time on reviewing this, and sorry for the top-posting.

Regards,
Pin-yen

>
> > Regards,
> > Pin-yen
> >
> > On Thu, Feb 29, 2024 at 6:36=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 29/02/24 11:34, Chen-Yu Tsai ha scritto:
> >>> On Thu, Feb 29, 2024 at 5:45=E2=80=AFPM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>
> >>>> Il 29/02/24 08:17, Chen-Yu Tsai ha scritto:
> >>>>> On Mon, Feb 26, 2024 at 7:16=E2=80=AFPM AngeloGioacchino Del Regno
> >>>>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>>>
> >>>>>> Il 23/02/24 05:27, Chen-Yu Tsai ha scritto:
> >>>>>>> On Mon, Jan 8, 2024 at 4:18=E2=80=AFPM Pin-yen Lin <treapking@chr=
omium.org> wrote:
> >>>>>>>>
> >>>>>>>> Introduce a new need_pm_runtime variable to mtk_clk_desc to indi=
cate
> >>>>>>>> this clock controller needs runtime PM for its operations.
> >>>>>>>> Also do a runtime PM get on the clock controller during the
> >>>>>>>> probing stage to workaround a possible deadlock.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >>>>>>>
> >>>>>>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >>>>>>>
> >>>>>>> The patch itself looks fine.
> >>>>>>>
> >>>>>>> Besides the MT8183 MFG clock issues, we do actually need this for=
 the
> >>>>>>> MT8192 ADSP clock. Its power domain is not enabled by default.
> >>>>>>>
> >>>>>>
> >>>>>> ...but on MT8195 the ADSP clock works - because the ADSP node exis=
ts.
> >>>>>
> >>>>> That's an indirect dependency that should not be relied on. Say the=
 clock
> >>>>> driver probed but the ADSP hasn't, and you try to read out the curr=
ent
> >>>>> status. What would happen?
> >>>>>
> >>>>> - Read out works fine, because the power domain is default on, and =
hasn't
> >>>>>      been turned off by late cleanup
> >>>>> - Read out is bogus (but you can't tell)
> >>>>> - Read out hangs.
> >>>>>
> >>>>> The third is what happens on MT8192. There's still some issues on t=
hat
> >>>>> front, as even after I applied the ADSP power domain patches from M=
ediaTek,
> >>>>> the readout was still hanging.
> >>>>>
> >>>>
> >>>> That MT8192 lockup story is getting crazy in my head... anyway, besi=
des that,
> >>>> I get the point - I was somehow ignoring the fact that kernel module=
s do exist.
> >>>>
> >>>> Eh, sorry about that :-)
> >>>>
> >>>>>> This poses a question: should we make clock controllers depend on =
power domains,
> >>>>>> or should we keep everything powered off (hence clocks down - no p=
ower consumption)
> >>>>>> *unless* the user exists?
> >>>>>
> >>>>> That's a policy discussion separate from actual hardware dependenci=
es.
> >>>>> *If* the clock controller needs the power domain to be active for t=
he
> >>>>> registers to be accessed, the clock controller *must* have a direct
> >>>>> dependency on the power domain.
> >>>>>
> >>>>
> >>>> I admit I should've worded that better.
> >>>>
> >>>> "should we make clock controllers depend on power domains" was actua=
lly implying
> >>>> "IF those need one" :-)
> >>>>
> >>>> I really wonder if - at this point - it's simply a better idea to no=
t restrict
> >>>> the call to devm_pm_runtime_enable/resume_and_get to `need_runtime_p=
m =3D=3D true`.
> >>>>
> >>>> Do we really need to exclude that on other clock controllers that do=
n't have
> >>>> any power domain dependency? Any side effect?
> >>>>
> >>>> Saying this because if we can avoid yet another per-SoC flag I'm rea=
lly happy,
> >>>> as readability is also impacted and besides - if we ever find out th=
at one of
> >>>> those need a power domain in the future, we'll need just one commit =
and just
> >>>> only in the devicetree, instead of enabling a flag in driver X as we=
ll as that,
> >>>> avoiding some (potentially unnecessary) noise... I guess.
> >>>>
> >>>> P.S.: I just noticed that the return value for the devm_pm_runtime_e=
nable() call
> >>>>          is not being checked!
> >>>>
> >>>> .......
> >>>>
> >>>> In short....
> >>>>
> >>>> Chen-Yu, at this point, do you have any reason why we wouldn't be ab=
le and/or it
> >>>> wouldn't be a good idea to just avoid adding the `need_runtime_pm` f=
lag (meaning
> >>>> that we perform pm_runtime calls for all clock drivers unconditional=
ly)?
> >>>>
> >>>> If this is about longer boot time, I don't think that it's going to =
be more than
> >>>> a millisecond or two, so that should be completely ignorable.
> >>>
> >>> I think it's just more of a "don't enable features you don't need" th=
ing.
> >>> We already ran into a weird deadlock, which is why the devm_pm_runtim=
e_enable()
> >>> call has that comment.
> >>>
> >>> I don't think anyone has actually looked at it. As you said it should=
n't be
> >>> much, at least during boot time. It's one call per clock controller.
> >>>
> >>>> Can you please do a test for that, or should I?
> >>>
> >>> The earliest I can work on it would be some time next week. Does that=
 work
> >>> for you?
> >>>
> >>
> >> The earliest I'd be able to work on this myself would be at the end of=
 next
> >> week if not later.. so yes, please take your time, no worries.
> >>
> >> Thank you!
> >>
> >>> ChenYu
> >>>
> >>>> Cheers
> >>>> Angelo
> >>>>
> >>>>>> For the second one, this means that the *device* gets the power do=
main (adsp), and
> >>>>>> not the clock controller (which clocks are effectively useless if =
there's no user).
> >>>>>
> >>>>> No. See my previous paragraph.
> >>>>>
> >>>>> ChenYu
> >>>>>
> >>>>>> Angelo
> >>>>>>
> >>>>>>>> ---
> >>>>>>>>
> >>>>>>>> Changes in v3:
> >>>>>>>> - Update the commit message and the comments before runtime PM c=
all
> >>>>>>>>
> >>>>>>>> Changes in v2:
> >>>>>>>> - Fix the order of error handling
> >>>>>>>> - Update the commit message and add a comment before the runtime=
 PM call
> >>>>>>>>
> >>>>>>>>      drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
> >>>>>>>>      drivers/clk/mediatek/clk-mtk.h |  2 ++
> >>>>>>>>      2 files changed, 21 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediat=
ek/clk-mtk.c
> >>>>>>>> index 2e55368dc4d8..ba1d1c495bc2 100644
> >>>>>>>> --- a/drivers/clk/mediatek/clk-mtk.c
> >>>>>>>> +++ b/drivers/clk/mediatek/clk-mtk.c
> >>>>>>>> @@ -13,6 +13,7 @@
> >>>>>>>>      #include <linux/of.h>
> >>>>>>>>      #include <linux/of_address.h>
> >>>>>>>>      #include <linux/platform_device.h>
> >>>>>>>> +#include <linux/pm_runtime.h>
> >>>>>>>>      #include <linux/slab.h>
> >>>>>>>>
> >>>>>>>>      #include "clk-mtk.h"
> >>>>>>>> @@ -494,6 +495,18 @@ static int __mtk_clk_simple_probe(struct pl=
atform_device *pdev,
> >>>>>>>>                             return IS_ERR(base) ? PTR_ERR(base) =
: -ENOMEM;
> >>>>>>>>             }
> >>>>>>>>
> >>>>>>>> +
> >>>>>>>> +       if (mcd->need_runtime_pm) {
> >>>>>>>> +               devm_pm_runtime_enable(&pdev->dev);
> >>>>>>>> +               /*
> >>>>>>>> +                * Do a pm_runtime_resume_and_get() to workaroun=
d a possible
> >>>>>>>> +                * deadlock between clk_register() and the genpd=
 framework.
> >>>>>>>> +                */
> >>>>>>>> +               r =3D pm_runtime_resume_and_get(&pdev->dev);
> >>>>>>>> +               if (r)
> >>>>>>>> +                       return r;
> >>>>>>>> +       }
> >>>>>>>> +
> >>>>>>>>             /* Calculate how many clk_hw_onecell_data entries to=
 allocate */
> >>>>>>>>             num_clks =3D mcd->num_clks + mcd->num_composite_clks=
;
> >>>>>>>>             num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_=
clks;
> >>>>>>>> @@ -574,6 +587,9 @@ static int __mtk_clk_simple_probe(struct pla=
tform_device *pdev,
> >>>>>>>>                             goto unregister_clks;
> >>>>>>>>             }
> >>>>>>>>
> >>>>>>>> +       if (mcd->need_runtime_pm)
> >>>>>>>> +               pm_runtime_put(&pdev->dev);
> >>>>>>>> +
> >>>>>>>>             return r;
> >>>>>>>>
> >>>>>>>>      unregister_clks:
> >>>>>>>> @@ -604,6 +620,9 @@ static int __mtk_clk_simple_probe(struct pla=
tform_device *pdev,
> >>>>>>>>      free_base:
> >>>>>>>>             if (mcd->shared_io && base)
> >>>>>>>>                     iounmap(base);
> >>>>>>>> +
> >>>>>>>> +       if (mcd->need_runtime_pm)
> >>>>>>>> +               pm_runtime_put(&pdev->dev);
> >>>>>>>>             return r;
> >>>>>>>>      }
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediat=
ek/clk-mtk.h
> >>>>>>>> index 22096501a60a..c17fe1c2d732 100644
> >>>>>>>> --- a/drivers/clk/mediatek/clk-mtk.h
> >>>>>>>> +++ b/drivers/clk/mediatek/clk-mtk.h
> >>>>>>>> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
> >>>>>>>>
> >>>>>>>>             int (*clk_notifier_func)(struct device *dev, struct =
clk *clk);
> >>>>>>>>             unsigned int mfg_clk_idx;
> >>>>>>>> +
> >>>>>>>> +       bool need_runtime_pm;
> >>>>>>>>      };
> >>>>>>>>
> >>>>>>>>      int mtk_clk_pdev_probe(struct platform_device *pdev);
> >>>>>>>> --
> >>>>>>>> 2.43.0.472.g3155946c3a-goog
> >>>>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>
> >>>>
> >>>>
> >>
>
>
>
