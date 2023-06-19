Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B39AEB64D9
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jun 2023 03:57:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjFSD5h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Jun 2023 23:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjFSD5e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Jun 2023 23:57:34 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB3E3E60
        for <linux-clk@vger.kernel.org>; Sun, 18 Jun 2023 20:57:33 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-77acb04309dso185368839f.2
        for <linux-clk@vger.kernel.org>; Sun, 18 Jun 2023 20:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687147053; x=1689739053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo1lPT4dJxUXmcsYL9c21QpbMwQpKCql33uWmmBp3AQ=;
        b=d28etc9GW+7SyTsfFDYvAxiGRbQt8jaXBBRUmXY2ZFTbwVKId+P0cvGMLdwTIYetnW
         BgDyrf9ADyqtbuQ9uuwYB/VsK56eT7VZcU+QPJAAtzaFttvk8/2atNUecJLL2dE+eBho
         SlruaguEbJP0brGHlkoMnpTfnaMLto7rjM+3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687147053; x=1689739053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo1lPT4dJxUXmcsYL9c21QpbMwQpKCql33uWmmBp3AQ=;
        b=jIYaRCYwZRSkURIgvESO2empFHuKCkUVqHz6UabDB2ObRud/NFAhfXb9gvbBlumZ26
         wOa34biTV9AMRA3ePM87+CC9EKGDufn4h50pDKK0GeZZQYn+EiCGE8AZeZWLRJZ+eoNf
         Y92Mboa+T631/zXf4gL293rkftT8o84Gefh2xVj6QMwSMjJEAvokyn/X1ujFobb8CXPK
         fViFYe8j4hm6qDLnZTIvuXeJBXfeuCU4tGoILxoEQM80p4OdSbvXn0x/FDz5d45LaV62
         heOMSjnrd088a9L3+zeTaddbkHVfs9DYtm/q2ndF80N4SVybEHtI1wgWRsLWXSa+v23I
         kf9w==
X-Gm-Message-State: AC+VfDy4hxKPXgFvE4jM74Hpc80vq4+XKp8u6JDbgpmGncudReOQiy2w
        oAR/dFWOzLK9mpydmiOauHT5pEik98RHO+fauvHaOw==
X-Google-Smtp-Source: ACHHUZ6tEmWrEPaNjgNq0diK4vhqZsaJcjo7NbL5IuOMrIpP9N5GY1rQSPkK6ZLbVkA+n99RcxtBEQ==
X-Received: by 2002:a05:6e02:5c5:b0:339:f011:77f5 with SMTP id l5-20020a056e0205c500b00339f01177f5mr7209550ils.12.1687147053205;
        Sun, 18 Jun 2023 20:57:33 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id ee24-20020a056638293800b004210512e4b5sm542020jab.174.2023.06.18.20.57.32
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 20:57:32 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-77acb04309dso185368439f.2
        for <linux-clk@vger.kernel.org>; Sun, 18 Jun 2023 20:57:32 -0700 (PDT)
X-Received: by 2002:a5d:9404:0:b0:774:8b28:6c34 with SMTP id
 v4-20020a5d9404000000b007748b286c34mr7383720ion.8.1687147052283; Sun, 18 Jun
 2023 20:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230617160901.1.I2b151cdf7a72d9e3ecc7ab2ff38409ebe6d65d6b@changeid>
 <71168ceb-8273-4067-d0e0-c6c219d4618e@web.de>
In-Reply-To: <71168ceb-8273-4067-d0e0-c6c219d4618e@web.de>
From:   Fei Shao <fshao@chromium.org>
Date:   Mon, 19 Jun 2023 11:56:56 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngN=TFQa0Y4FoSCOTUs8HRi4NEP1OwY8WccUEUMG_UDeQ@mail.gmail.com>
Message-ID: <CAC=S1ngN=TFQa0Y4FoSCOTUs8HRi4NEP1OwY8WccUEUMG_UDeQ@mail.gmail.com>
Subject: Re: [PATCH] clk: Fix memory leak in devm_clk_notifier_register()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jun 18, 2023 at 4:06=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > This fixes the issue.
>
> Please replace this sentence by an imperative change suggestion.
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.4-rc6#n94
>
> Regards,
> Markus

Thanks for the feedback. I just sent v2.

Regards,
Fei
