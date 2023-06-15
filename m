Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD641EB64D9
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jun 2023 10:38:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343756AbjFOKiV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jun 2023 06:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343544AbjFOKiU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Jun 2023 06:38:20 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F4A6212A
        for <linux-clk@vger.kernel.org>; Thu, 15 Jun 2023 03:38:19 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f7fcdc7f7fso4671035e9.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Jun 2023 03:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686825498; x=1689417498;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HhDvY5NOJAhj9HpoAeApwW1Xx3nbYDTiIZwJoccQUI=;
        b=SNg6Oeo5SgROXY7rp+MSqrTKj/Ab2XYTPYa7yeactT2L5VC2QhH1RD7NqyBIEZ6kCf
         3iT+uwZPq+L3N3ARWPGthtf0dngxReaq4LDrcT3nhbAFF0nWSo1KkCzdAbkHBgxaD/lO
         itFgK671PZW7Sdh0D9gFnoKDxeII4hQX3zqD2/YWrMB+ODE+/4yg6YxjSUUISuPlxmGd
         9KCwHfcouBOtRHQJNB7/E01+xlZud4iFDXUar5y+2y9UGq63YRi+I9Ms1fiYuu7TW4SL
         KhIwx4bM9WeT0YQwpaRgI8xrXJHt+y6WKK7V+0XdDKHrffly+IT/uyOEQw5pySCeGHVV
         /IVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686825498; x=1689417498;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2HhDvY5NOJAhj9HpoAeApwW1Xx3nbYDTiIZwJoccQUI=;
        b=GQN+ghAScfVtD7TNtorATO8ykuLcZvGfDk42T5Ot/9U7CvTiBnF2wGkxHMJdE0b7rp
         uuSGUS7lk0MnsLOvCpMEaAxr0zrzEfzFgJwiktqiiS+9oARtWRUMmP60Jl7+Mkun9k3N
         B9JOXFuYhwWiSVdvlNoaluK8Iq+1CBJOFFVyYPUcpq6kXRBHchrSvztTKtYmXcpIUvEd
         A23dyBR61B4xpssYWEG17C9FgvqXlrlOkIlPtQCMUIyXGeAaloGTfMdnZxyXWaIiPSBW
         Wj4UkoMZR4tRZaw3+SpCOSBRqZTCVxEyDLoEM63MNjjRyZu7fbzUqNx+p1gO5V87hVNy
         RbLA==
X-Gm-Message-State: AC+VfDyYUNE6/4icZd0YocsZLhVz56ffI0vTaNkmXZ2efUy/PHjjbVYK
        V7FMGvEieR/0pAYAJ5QXnKgZ1A==
X-Google-Smtp-Source: ACHHUZ7aLxl6u8Xy8keJRrva8YV/gEx7RIIAOGjxj2M3OsUhXtIj8GbKGcAVpQ/yJBbdCRNp057N8w==
X-Received: by 2002:a05:600c:5562:b0:3f7:ba55:d03e with SMTP id ja2-20020a05600c556200b003f7ba55d03emr3885162wmb.6.1686825497863;
        Thu, 15 Jun 2023 03:38:17 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0acc00b003f195d540d9sm20041465wmr.14.2023.06.15.03.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 03:38:17 -0700 (PDT)
References: <20230614084808.98819-1-jiapeng.chong@linux.alibaba.com>
 <CAFBinCBZFxx55HQM4a99vVwvXFaQThn8_F5B4uNS5x1AYzOupw@mail.gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     neil.armstrong@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, khilman@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] clk: meson: pll: remove unneeded semicolon
Date:   Thu, 15 Jun 2023 12:36:19 +0200
In-reply-to: <CAFBinCBZFxx55HQM4a99vVwvXFaQThn8_F5B4uNS5x1AYzOupw@mail.gmail.com>
Message-ID: <1j7cs52ep4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 14 Jun 2023 at 22:09, Martin Blumenstingl <martin.blumenstingl@googl=
email.com> wrote:

> On Wed, Jun 14, 2023 at 10:48=E2=80=AFAM Jiapeng Chong
> <jiapeng.chong@linux.alibaba.com> wrote:
>>
>> No functional modification involved.
>>
>> ./drivers/clk/meson/clk-pll.c:373:2-3: Unneeded semicolon.
>>
>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D5533

Removed this bugzilla tag and added a fixes tag:
Fixes: b6ec400aa153 ("clk: meson: introduce new pll power-on sequence for A=
1 SoC family")

>> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied through the amlogic clock tree.
Thx
