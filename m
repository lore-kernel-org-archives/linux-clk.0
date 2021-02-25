Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5239C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 777E564EDB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhBYQt2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 11:49:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233755AbhBYQrq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 11:47:46 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EDBC061756
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 08:47:05 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id d11so5906448wrj.7
        for <linux-clk@vger.kernel.org>; Thu, 25 Feb 2021 08:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vYnywbo5Vak2LSUz0aaCB9g6bHBX066R2mPfYBYRPwU=;
        b=JBm3fS6j3Aknno3t5+UyMULGvWDbHmCQtNR0iUbx8GMKiv1yPjAsvfwsoMlgEIbiKx
         0iqHTVfigbT3x9f5FUUdI9mGBcJcJuo2Mwm5h42OQgRaa/LOe1xreuJMw5FSfOZbmJbK
         Hz+Ytgp1uy+0CONMFEKg2gZYkMZKluId2dDkwzKzOrKlIGeOndOg4zAIdf4s9jMKgTV8
         rl+kb0SI4JkGFOPYemuiedg29pbzoeP0ykU8CT4T5Fr/znOjNECoP36baZzY6daUPcH8
         gTaNarxE4/g7JVlmpWhwHFHSSkfTpFdXuR/De4eGbMnh5aySdP3ZHcbnIgBHJcHnLkWB
         6JkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vYnywbo5Vak2LSUz0aaCB9g6bHBX066R2mPfYBYRPwU=;
        b=KTPNkB5o3jP07qjq3zR3y/hCJ6WJkQQuwp7nuDpbc59z6t++l1c9PyzSKT7V1+OU3b
         0sjTXSfrnYW4QUrb/hgODHp2nt3aqLgxO/I7qi2NBWjozF3hWEj+gZEgtWTrwfiw2eI2
         8CUnEMi/NNy3OuY6fmxNXjiPSmhxG1fDA6ZaXSWj1n3afdF9Z5J3GiGG+0t2PCXOknNO
         x28Ht1vsvtgzKa0mLLdW4pl1nFRIrYzDmU5hQ/kj/KawHybVd1i9FdAmG7vf4vMqmOI7
         Zzju6WkkLlzmCeEQTZaPDs4dEdJrLWm6scYLNe1fwf46FtF2SVy6dsc0bXtc4Y1iXtWK
         dPuw==
X-Gm-Message-State: AOAM531Eiq2yDfNge6PxuyYNVNK63cWJnv2oE9velKjD2gjKTpFk7Zed
        jNEWPaEwBi1tB0nwePwi+jsCAruYs9tWuRuhtqp/eQ==
X-Google-Smtp-Source: ABdhPJwUD/uQY/I9MmK5Eut9nsqN4gXqF5Lf3s8EITEG2ZlAMQPu7S96HSYZhe6MCQ1z1I+dahFxVyJba4W7EE2Cd0s=
X-Received: by 2002:adf:f8cd:: with SMTP id f13mr4255062wrq.27.1614271624253;
 Thu, 25 Feb 2021 08:47:04 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech> <20210225155909.1853812-9-maxime@cerno.tech>
In-Reply-To: <20210225155909.1853812-9-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 25 Feb 2021 16:46:48 +0000
Message-ID: <CAPY8ntBN=Kra-j7AS_VhYpVJ8y2+=T4EKOT3YBRZzEspuiUkaQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/vc4: plane: Remove redundant assignment
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Tim Gover <tim.gover@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Other than no commit text body (which is hardly needed in this case)

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 5e8b7f72dc05..201831e924d9 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -1131,7 +1131,6 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
>         plane->state->src_y = state->src_y;
>         plane->state->src_w = state->src_w;
>         plane->state->src_h = state->src_h;
> -       plane->state->src_h = state->src_h;
>         plane->state->alpha = state->alpha;
>         plane->state->pixel_blend_mode = state->pixel_blend_mode;
>         plane->state->rotation = state->rotation;
> --
> 2.29.2
>
