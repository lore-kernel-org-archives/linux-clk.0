Return-Path: <SRS0=U0T3=7A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73147C433E2
	for <linux-clk@archiver.kernel.org>; Mon, 18 May 2020 07:32:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5083A207D8
	for <linux-clk@archiver.kernel.org>; Mon, 18 May 2020 07:32:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JS49KQEH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgERHcO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 May 2020 03:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726800AbgERHcI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 May 2020 03:32:08 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9D4C061A0C
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2020 00:32:07 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id h188so7134665lfd.7
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2020 00:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yDgJBK14qCAv+Ly5Qcs1dAnO6ksblSLGGgT9S8evwgc=;
        b=JS49KQEH/OR4uP/4njTqN6ALEiaaKHohd/LBQiGVcdrqaLVdBHQ2w5e33tHi3qdAcV
         r9/TEQFnykL839HJTEeOQyT9l62tOrOfSFETZeZBOfY04+GeZW0HIctkfKDt1KNXK2Yo
         JS81rztNjP13LyCgnV8yV0i4SLa4Sbp0On6MmGxPxGt+WinOHQR2ErBrg0Vp1t/HOr9J
         xCpO99Bf8AJIAKLlqEuA4cAHAxh+j853D0+NSddrXD5zbnBFs85R+hIRGjeb1HpNAhjL
         LYY8pBUf+UuGhj/2ULDY7YsLPcr99IGVuvU+38C2/rTzuDA84Zw1hYFiyUSoQorlH/4C
         5dAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yDgJBK14qCAv+Ly5Qcs1dAnO6ksblSLGGgT9S8evwgc=;
        b=lJzs45oPE/SL7AuqZJxFRAuy+yg+yCXehYxFbpeIrznCDfiQ2M2Q6i9xTLiQWXDYtn
         eh7vkKd/Ctr/cyjpIm5HBAzGSfNEuWka6l7l0WcDKYiyqcpOr/+hNoHFQOEv0d+q8Ocw
         AXsN1U9dEHCr938RA4s5ErjpAC5487CN34trgQHpJJPxZARSOQnwzg94QrrSViZ1I1zx
         bztMW+mjfqjrQFurbIGZK9xymbpoij2R1PWL5daZQYUeQ1B9KEEv7wauOHAuUuC4iDkA
         vIiyb6TBoynsu6Hbd31mmdKgKXMY4Nv31xWBXaBTVPce5dwpXNFbdlwsNiSxc23T6FD9
         RnPA==
X-Gm-Message-State: AOAM533j7b92GXipcaKh+litbbFSdnZyvu4sxxHbiBcPT+eEWnRr0q0D
        Pj/MnURMa/VUtTs/bmEuLWIWX/HtC4sORszbKBnK+Q==
X-Google-Smtp-Source: ABdhPJwxV8YVto5NNCCuMGHZxBejD642Xxg/qE3YJ9UCpF1p3OO1llWxz/lGbdc0Fb6TgpRyFpP/j9gd8eCnm9Agq/U=
X-Received: by 2002:ac2:5cd1:: with SMTP id f17mr3837953lfq.4.1589787125044;
 Mon, 18 May 2020 00:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-4-lars.povlsen@microchip.com>
In-Reply-To: <20200513125532.24585-4-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:31:54 +0200
Message-ID: <CACRpkdYo7AUzWTeK+1ouq29R_7rVJ8cz=rjBHVTQjHFx9HmMQA@mail.gmail.com>
Subject: Re: [PATCH 03/14] pinctrl: ocelot: Fix GPIO interrupt decoding on Jaguar2
To:     Lars Povlsen <lars.povlsen@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 13, 2020 at 2:56 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> This fixes a problem with using the GPIO as an interrupt on Jaguar2
> (and similar), as the register layout of the platforms with 64 GPIO's
> are pairwise, such that the original offset must be multiplied with
> the platform stride.
>
> Fixes: da801ab56ad8 pinctrl: ocelot: add MSCC Jaguar2 support.
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
