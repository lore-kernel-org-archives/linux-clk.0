Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6DCC43217
	for <linux-clk@archiver.kernel.org>; Thu,  3 Nov 2022 16:07:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbiKCQH2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Nov 2022 12:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbiKCQG5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Nov 2022 12:06:57 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC86F1C436
        for <linux-clk@vger.kernel.org>; Thu,  3 Nov 2022 09:05:42 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id n12so6473761eja.11
        for <linux-clk@vger.kernel.org>; Thu, 03 Nov 2022 09:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjX82js1MEeHcR9vNScDckdgVeBb111bo+yliZ0LU2M=;
        b=x7j2H2hfFCfGg8qWiLy9NsZwLf25fTTjJjZvNjK6ZXSLzy4O7aajUYEFp12DO85h85
         R/3C5Nl2I4CyncUfO3qxnpxqRijqRjhmSvPILlqw9MbTEE4K8Tk3x3mZelotOS+D+pcH
         e50u/2dbr0Oq7C+z9LI0TaPpBY/X3n03kr6Tf+Vk3qA2M1FR0TTPWf0oDOXlLhPWXRhN
         C4MRYz5p5F6ZeJa8kz/j3XDoNIUDi81igpMBI4CTQBK+bTJOtmSa5uimBKlortNxF+vc
         B0yyysJlP7EOWdvkn7SLPT/JEeVTj6zIXpvWeEy7RarNBhwTVRTO8cR8XLEZ0eliknEu
         598g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjX82js1MEeHcR9vNScDckdgVeBb111bo+yliZ0LU2M=;
        b=TtD1hVEiqJsuYFmHhhS1gi+lfRYrJ6KF/n8wBAMXFo+mmTsj42nzOsMoIlVAS8XcL6
         NaIPeF0pofDGJ9+85k6jZf+fX7mCqfs6uTcky/AyKIFpGLqab8Qv4NlRxwacDWDuON3m
         j3p8iR/PBb8YD38fNSSGzxR4qlTeYORVBdrztHE0Uf7niL9iVVRmGoEz6wJKeNfLHwhS
         ivFjLCuzJkSSadKBb2lPaiCRmvPrGfpWX3faTM0YvVGTLLWRUTNiBaqI7l/PnlG2gcVR
         qetpTAZ3IT/xfmn5jfX+t86a2xaD32+Iba/LqPWvPknfGmybTtm5uyKjDRM9P3Urb108
         96HQ==
X-Gm-Message-State: ACrzQf3hPcaDxNiscDwK871fp6Js2WPc4QpfK3BLFUfRhYdh+4y/krlP
        xFCLJGmRXbFrKnf7OzcMi4bDK0JAyNhut0rRpGly6g==
X-Google-Smtp-Source: AMsMyM7umtXR9dZZBUzwJwdrFaiBTk5vMewRI+ViOLmUb1K+o7oAnalKkdPpAtcST34+nzychCbvz1OkY69yNaFoMZQ=
X-Received: by 2002:a17:906:dc8f:b0:7a5:8160:1995 with SMTP id
 cs15-20020a170906dc8f00b007a581601995mr30096358ejc.500.1667491541292; Thu, 03
 Nov 2022 09:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20221102171012.49150-1-kory.maincent@bootlin.com> <20221102171012.49150-4-kory.maincent@bootlin.com>
In-Reply-To: <20221102171012.49150-4-kory.maincent@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Nov 2022 17:05:30 +0100
Message-ID: <CACRpkda7EFTe0TT4-hs_F3qTCwp25pgOAqhNSFyJgeNQ3=O7UQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] arm: configs: spear6xx: Enable PL110 display controller
To:     =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
Cc:     viresh.kumar@linaro.org,
        Vipul Kumar Samar <vipulkumar.samar@st.com>,
        Vipin Kumar <vipin.kumar@st.com>,
        Deepak Sikri <deepak.sikri@st.com>,
        Bhavna Yadav <bhavna.yadav@st.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        thomas.petazzoni@bootlin.com, Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Alexandre Ghiti <alexandre.ghiti@canonical.com>,
        Rajeev Kumar <rajeev-dlh.kumar@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 2, 2022 at 6:10 PM K=C3=B6ry Maincent <kory.maincent@bootlin.co=
m> wrote:

> From: Kory Maincent <kory.maincent@bootlin.com>
>
> Enable the PL110 DRM driver, used by the spear600.
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for using the DRM driver!

Yours,
Linus Walleij
