Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6741C7EE24
	for <linux-clk@archiver.kernel.org>; Wed, 31 May 2023 09:20:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbjEaJUB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 May 2023 05:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235411AbjEaJTu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 May 2023 05:19:50 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475BDA0
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 02:19:44 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b065154b79so5561405ad.1
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 02:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685524783; x=1688116783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/F8jIF8NqATxdAvMuHV954nGjADHoS+vIBQmhEkWOs=;
        b=g2QKglMZH/mJ1PlHw0xaAb1Atu0wvBgVAqYnuu8mReQEONCqAC+kuvmXr1GOl2K8hi
         PELXRr9/ZHFzDZ1y3TGPnhTkxyRxzi2WWpiULuLFvRre0MOUR2wmfXd4PYcyHYisgga9
         vIxf3UCExwjWT2hL5wZhyPw1/THRLmg9F35utlvE2h3bHMSJOdGF1FVhqXM8zvkuKeiA
         QDOmg7HzxXmpRYriQ+VggWvGgLlVCw55VPwJnR21xsMdQuKGIVaBL+9JKvxwHIb3unI0
         dNbqyoJWOojJolHETOZRlnmey1S+0lkpPlrlK4bJKbtj2DG0b51oWPxTwnJeIwJ9apJ4
         TZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685524783; x=1688116783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/F8jIF8NqATxdAvMuHV954nGjADHoS+vIBQmhEkWOs=;
        b=F+a+Q43f3NY0plbseXufiYqC2pLPoNHDJUuPx0Zekpbl1BPo+pHLm13vsN8U42knrQ
         pmN+QJoouxOjfmaUy4z75wtYW5+Z/YVicY8YIc6FvVRZdH5vC/a5v0wBPBXaCJRxKVEQ
         2xSzi3vEgP3/osfXR/hJD6T9cllyjKHRSJhnFNlTH21y53Y/wJ99KO9gOPA94qLvcesx
         AlOkHuCK/EZcEotgr/K5+xjEKPNYiZfBVGo3sd3ZLpANjdHPtwFDSIcdZAEgbe12au6p
         CS1K3bm67rig1A+Gn/6oRyJXrR1qa+eA5Ejy6Eli1q5sYhvhoqGo306zmc35t4qwBSAG
         /LOw==
X-Gm-Message-State: AC+VfDxGM7UFvm+gPPFvQsSH5SxOiZ09BFkUNd0/tAdAeRZHTjvwq6TY
        i8x7rP+au1euZRAT0IYbZAgkSvnoJm2+8gZwJCoi6OZpjX5aF1gJ46A=
X-Google-Smtp-Source: ACHHUZ6Ofzg7tjk5fXnBtT7CKLOKxvtwCuBdh95OKJ7ZvI9XlppTjSg852EOtBKSeeNZAfFL9zCpUaqHc9KwNzmaA5U=
X-Received: by 2002:a17:902:e744:b0:1ac:86b5:70d9 with SMTP id
 p4-20020a170902e74400b001ac86b570d9mr14542055plf.32.1685524783362; Wed, 31
 May 2023 02:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-8-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-8-56eb7a4d5b8e@linaro.org>
From:   Nicolas Belin <nbelin@baylibre.com>
Date:   Wed, 31 May 2023 11:19:32 +0200
Message-ID: <CAJZgTGEQ3B5M9BtDfUdyMiH+VQkWcFHU2fOJgE_1=a4E1bxMTA@mail.gmail.com>
Subject: Re: [PATCH v5 08/17] drm/meson: fix unbind path if HDMI fails to bind
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "Lukas F. Hartmann" <lukas@mntre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Le mar. 30 mai 2023 =C3=A0 09:38, Neil Armstrong
<neil.armstrong@linaro.org> a =C3=A9crit :
>
> If the case the HDMI controller fails to bind, we try to unbind
> all components before calling drm_dev_put() which makes drm_bridge_detach=
()
> crash because unbinding the HDMI controller frees the bridge memory.
>
> The solution is the unbind all components at the end like in the remove
> path.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index ca6d1e59e5d9..e060279dc80a 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -316,32 +316,34 @@ static int meson_drv_bind_master(struct device *dev=
, bool has_components)
>                 goto exit_afbcd;
>
>         if (has_components) {
> -               ret =3D component_bind_all(drm->dev, drm);
> +               ret =3D component_bind_all(dev, drm);
>                 if (ret) {
>                         dev_err(drm->dev, "Couldn't bind all components\n=
");
> +                       /* Do not try to unbind */
> +                       has_components =3D false;
>                         goto exit_afbcd;
>                 }
>         }
>
>         ret =3D meson_encoder_hdmi_init(priv);
>         if (ret)
> -               goto unbind_all;
> +               goto exit_afbcd;
>
>         ret =3D meson_plane_create(priv);
>         if (ret)
> -               goto unbind_all;
> +               goto exit_afbcd;
>
>         ret =3D meson_overlay_create(priv);
>         if (ret)
> -               goto unbind_all;
> +               goto exit_afbcd;
>
>         ret =3D meson_crtc_create(priv);
>         if (ret)
> -               goto unbind_all;
> +               goto exit_afbcd;
>
>         ret =3D request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->n=
ame, drm);
>         if (ret)
> -               goto unbind_all;
> +               goto exit_afbcd;
>
>         drm_mode_config_reset(drm);
>
> @@ -359,15 +361,18 @@ static int meson_drv_bind_master(struct device *dev=
, bool has_components)
>
>  uninstall_irq:
>         free_irq(priv->vsync_irq, drm);
> -unbind_all:
> -       if (has_components)
> -               component_unbind_all(drm->dev, drm);
>  exit_afbcd:
>         if (priv->afbcd.ops)
>                 priv->afbcd.ops->exit(priv);
>  free_drm:
>         drm_dev_put(drm);
>
> +       meson_encoder_hdmi_remove(priv);
> +       meson_encoder_cvbs_remove(priv);
> +
> +       if (has_components)
> +               component_unbind_all(dev, drm);
> +
>         return ret;
>  }
>
>
> --
> 2.34.1
>

Works fine on a Khadas VIM3 using a TS050 panel,
Thanks

Reviewed-by: Nicolas Belin <nbelin@baylibre.com>
Tested-by: Nicolas Belin <nbelin@baylibre.com>
