Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6156C43334
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 09:26:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233976AbiF0J03 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 05:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233718AbiF0J02 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 05:26:28 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825386150
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 02:26:27 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t24so15558468lfr.4
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 02:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SEv1nUU1jY0pKLJwE3iPS1IJafi3TY1+3l/3atKLKaI=;
        b=TTJLwhtvbsqhadefjMNFeCvqr5u2g7+axGCHFhgO6zBrdslsceTGKxOzqpzJm63qTj
         9DivaoruBYpOMU92umBbDhndB/J3OO4Luat0oDQGuWt5uKP3FcaMASiMt4znEPU1M0hY
         6XAEiJLOj2L2/i+M3CZ8M+Jf5jVuuBD84iWc0Rzelo97HF5o1dWlo4EkxQeBIrly5TRy
         hI5zcBS5R/oLDiy+RgL8sx9/vLm7sP4mLFoJFVMj5cqAQIASYJy9vVK8rI1hSeLg2sKR
         Pn0omSpTBCiW2X8RXAxrabQbtqdYvifmJnalstYRpUiyeb14wE2emLo+ZxFMc7O0W/RR
         iz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SEv1nUU1jY0pKLJwE3iPS1IJafi3TY1+3l/3atKLKaI=;
        b=2anvvPUC8n6gs4dZkeS9wpgmrAJ4YYfe3riCUl9By7+2Vnf0OteRENZd0FmMF4IHmy
         MBRKQEkNEQCsq1NYQbl2tsnX5HmeA243yHeZL8F+KA90AAtLSL+Ayh9BTgs3cNouBJuH
         jboou+DtfQVik9u+SvK3Yl34t5w7H2QQ7ZTrDmN3aPVPRASHx9pDn1sPZPmrNfu2HIhM
         qxDhVCeXdMrNmUY5/gqBrxL6cqaOgJkBBLIO5aqse1v4ylTru7sb0Sji8H8mWHK6WqQz
         +cGu5psMoXCd1NuCMuxcZTJzvc1KwgdiebTnMJafBEsaapydIOGbkdjQeiR0W9AXTLa5
         wG9A==
X-Gm-Message-State: AJIora/kuHNzZUDv9B79rllWbj5F5LRlR/lzgYE+Zl2oKkKPsvtY1hRn
        X8/0nSlznUBGhI0xnczDdmOOTZPaSA8rSofAHlTWvA==
X-Google-Smtp-Source: AGRyM1uMwQheM1Hw5sD1YXx+j/fteeazXfa3yOo80Os4o3hX01UZLQ8H8Xos0EbwpcCf6zujPujZ+LWkev49BjH6NrQ=
X-Received: by 2002:a19:640e:0:b0:479:5347:b86e with SMTP id
 y14-20020a19640e000000b004795347b86emr7420410lfb.563.1656321985863; Mon, 27
 Jun 2022 02:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220617014308.4001511-1-windhl@126.com>
In-Reply-To: <20220617014308.4001511-1-windhl@126.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Jun 2022 11:26:14 +0200
Message-ID: <CACRpkdYD4PVMLt9TLk+M8BxGkW5uDmeU61BN7UL1xhVkf3g27A@mail.gmail.com>
Subject: Re: [PATCH v4] clk: nomadik: Add missing of_node_put()
To:     Liang He <windhl@126.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jun 17, 2022 at 3:43 AM Liang He <windhl@126.com> wrote:

> In nomadik_src_init(), of_find_matching_node() will return a node
> pointer with refcount incremented. We should use of_node_put() in
> fail path or when it is not used anymore.
>
> Signed-off-by: Liang He <windhl@126.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
