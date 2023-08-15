Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FA3C04A6A
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 12:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234975AbjHOMuE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 08:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237316AbjHOMtp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 08:49:45 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1DA1BCC
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 05:49:40 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5657659a8a1so628501a12.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 05:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692103779; x=1692708579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/NCurj+9HtNdmli4SE9v5jjEJjKaKRBr2Kz1N/yz2s=;
        b=BitRyJS8S9TqWDqEewoXeIjN7Ef7wuwEZNeZEMgyyFmmMytCVFEcHueYlZhGJ0psov
         oqOhe0Y0qvHH3JBe877X2U7ki2Y6CuEoNy20h1uf036TVEG+OdEYd3IDHQ8mChkrJ3oq
         ryiR9qL2VsrowocvLwVobGocXIBT3YZ2uKv+EQqr+XBv0/pSPT3qxd55NOLPKaqrwFJg
         fYTlTUxKws25SDtbJdKSoFXmVsjIat5gqZq5YNH/7h7nYMP25lylZvqMgJfq9RAbZ6fS
         eX5JGLwR/rl2Ipk/L4aDj/FE/me/yWs2CKjY4lD1Z1f3vesokwu43VxgPWd7MQIMjkE3
         hmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692103779; x=1692708579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/NCurj+9HtNdmli4SE9v5jjEJjKaKRBr2Kz1N/yz2s=;
        b=Oivc4fS78VEqkd8BviKELIVSKLrSy2xXMa5WEPOZfeVUi4iKAXvEvpl0GL5bGw9WqD
         k/AdENZPQjZFZj9ZJ/TYX9CGPlNJRhEZ/koxXPKE6mz0siK0Z1p47aTlpr1OEbYCwa9G
         N5Eqlyecz0tn8KGxFaUYk+/kfMxBr8yWtHy9Qgvm4QY2F3iRjKWWh4EGQnLw9xXvWMd8
         d5zZZJhsI+qmJIVDhWQ8m8bms8KuhHzMBadcoMPDXDRqbH4S/XzAHrnktCu2sen5qzc6
         /1nuTPyfj5PU2oiilFVv7Xs+S97JbHj8gIXgCUpujSQIB+lThYe8Yobl8pthJ9I9r3Hs
         UYrA==
X-Gm-Message-State: AOJu0YyPksknWrUU23LPlVbFZfXU2t8iFACVGlU2Uhh5f+NfuBCs+sgA
        i++GJI/mDrim0dEJOQebfwEAwj1SOQ2wFk0oJwo=
X-Google-Smtp-Source: AGHT+IFwOZn6ujGQWZk91ZWmPIIYkDcP1oZL1ko9jlGchIns+49GKMAnWzconlJSP+g4tPkbaR1kDL7z+i4IIdnwXNw=
X-Received: by 2002:a17:90a:398f:b0:25c:1ad3:a4a1 with SMTP id
 z15-20020a17090a398f00b0025c1ad3a4a1mr10824907pjb.1.1692103779575; Tue, 15
 Aug 2023 05:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230712115301.690714-1-festevam@gmail.com> <20230712115301.690714-3-festevam@gmail.com>
 <CAOMZO5BtUCW=PeictOBfX5F5PL=M-+jqsD3xB7SAKmU6Wy5Vzg@mail.gmail.com>
In-Reply-To: <CAOMZO5BtUCW=PeictOBfX5F5PL=M-+jqsD3xB7SAKmU6Wy5Vzg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 15 Aug 2023 09:49:27 -0300
Message-ID: <CAOMZO5AQGsinMOzbK8TwMzNvmQN2_qZWAxBK555mFqZ8gwsD7A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: imx: imx6sx: Remove hardcoded LCDIF1 parent
To:     shawnguo@kernel.org, abelvesa@kernel.org
Cc:     hs@denx.de, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Aug 15, 2023 at 9:34=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Abel,
>
> On Wed, Jul 12, 2023 at 8:53=E2=80=AFAM Fabio Estevam <festevam@gmail.com=
> wrote:
> >
> > From: Fabio Estevam <festevam@denx.de>
> >
> > It is not a good idea to hardcode the LCDIF1 parent inside the
> > clock driver because some users may want to use a different clock
> > parent for LCDIF1. One of the reasons could be related to EMI tests.
> >
> > Remove the harcoded LCDIF1 parent as this is better described via
> > devicetree.
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
> > Changes since v2:
> > - Rebased against 6.5-rc1.
>
> Shawn has already applied patches 1/3 and 2/3.
>
> Could this one go via your tree, please?

Actually, please discard this one. I missed adding the following
suggestion from Stephen:

"Do you need to check for the DT property and skip these clk_set_parent()
calls if they're present? How does this work if the DT isn't updated at
the same time?"

I will revisit this after 6.6-rc1 is out.

Thanks
