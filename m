Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF7AC7EE43
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 20:19:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbjFLUTh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 16:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjFLUTg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 16:19:36 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95D5134;
        Mon, 12 Jun 2023 13:19:35 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5187351abfeso25649a12.3;
        Mon, 12 Jun 2023 13:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1686601174; x=1689193174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHocG4UQ3ecO0uydSymSh8iIsvcAoTFn78fAzFQKDjI=;
        b=gn7OLV895i9gRAkGix/1SL6oMaVp7CcSdGVgqiI7pCIuwI9xq7tDHl+Zsko2VJ0+ys
         ZrvOF/RUpQzlZLO+MrhB9B9u9fmNmDk7nEwHBhYXvU4b9LXw+3rhxf8yFrfRxVSaB5IG
         wu8f4L3cXfELhPUag82nphdxHQUGijHHBrDy5OW3C/GzT2AWXB7i9mccox28O6nVq/3B
         n1Buv53uYvq3KcsjJgaGa86LZgcEUQW5BuKtM+fFDyd6ieaNcX4bNVcTQO59e0/ZE9cd
         JTdU1UBI1pMk0YHyM8p5+mAuIP0xEGe9Nhc6TYDBd39DBiXs/9P5Fy5rTAfAQGjsG6JD
         bI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686601174; x=1689193174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHocG4UQ3ecO0uydSymSh8iIsvcAoTFn78fAzFQKDjI=;
        b=aEccAidwkKgZrDtgU1oFrYhDwcSc4M8c5QCXyiCFfG3c25VwoKvNLaVrIJrZ/zmYRB
         FGXjE2pga50P0QnenQFOGKjhjNHxtLdA6X6qaaxWSxKf1lD3fnygbXiS+TerXZEUQIPx
         0jPEKfjbRhhk6CfJI3EgNfkVSaaWYKzTYA5U6mAVCqRqKEoTSNFcUOlXtwUiimFQZZrU
         iV/k1gUdzApNthhhmgBBdSNjZ8UwYbWqSw1n8mGQ76YRuL6BizoXoJ91m6gVY4Oi7gVk
         8ZtpVX5ycxbQh3+W6GcAttItjKZUF9P+C5YkiW0j+JqG38u1psFWCDAER9a2j8N3Gzg0
         Oiqw==
X-Gm-Message-State: AC+VfDwPNtWQvhdXf49v1qaPMuGZuITMtDD5W23Y4yt/ratnaCfbknCL
        biBRcxkhKJsXYFz9LnUR+xI18qR1XUOHMnfo1ENNtfVH0Ro=
X-Google-Smtp-Source: ACHHUZ4cRAMZbJC2dU3z1dP2Wh3awz8FhOBUlEqWVkrUeV6VG5nx4Njtd4uT80JB8Ow56uhN1rg8qESSC9moCMwYHfw=
X-Received: by 2002:a17:907:3da0:b0:982:2278:bcef with SMTP id
 he32-20020a1709073da000b009822278bcefmr2406503ejc.60.1686601173890; Mon, 12
 Jun 2023 13:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230612182332.371003-1-sboyd@kernel.org>
In-Reply-To: <20230612182332.371003-1-sboyd@kernel.org>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 12 Jun 2023 22:19:22 +0200
Message-ID: <CAFBinCBpVcpWaxrOC0AKXbK9saUSoArVeH1yM_P-h0YQ0UsR8w@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: a1: Staticize rtc clk
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, Jian Hu <jian.hu@amlogic.com>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 12, 2023 at 8:23=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Sparse rightly complains that this symbol is supposed to be static.
>
> Cc: Jian Hu <jian.hu@amlogic.com>
> Cc: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Fixes: 84af914404db ("clk: meson: a1: add Amlogic A1 Peripherals clock co=
ntroller driver")
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks for providing a fix so quickly!

Jerome, I think it's easiest for Stephen to apply this patch directly
to the clock tree.
In my opinion there's no reason against this since our own patch queue is e=
mpty.



Best regards,
Martin
