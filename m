Return-Path: <SRS0=Hf8G=5F=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F301C4332B
	for <linux-clk@archiver.kernel.org>; Fri, 20 Mar 2020 12:59:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 545F320776
	for <linux-clk@archiver.kernel.org>; Fri, 20 Mar 2020 12:59:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ikoMFAkV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgCTM7Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Mar 2020 08:59:25 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:39982 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbgCTM7Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Mar 2020 08:59:24 -0400
Received: by mail-vs1-f65.google.com with SMTP id o25so164294vsp.7
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2020 05:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a/PA0xQtIa/KcGdiAZZ8ZKVn8tYCpZzJCJwJTWlA7Dk=;
        b=ikoMFAkV50AaMHNBsHXRmMPCoqo4+icXRv1EcOLTdMsVEOSVAVor/nrpG9warG04Uh
         zjvngy0GbjXFSkPjIrbvjWWTqf+51a3Bn33vcazqyfKReeoXoGffzm9JtQDp/r7ZQr1+
         ugLS6gsiNtw99p7aa591lMBUnosilHIOTkhziYIZMWSOhUrMUENa5ZrjKWZtE5GUhhP/
         o7+n8Ho0N6llC/ilPUoUztfF+LjT/WJ8SZaNpQb7Hfl43mW1Jw8rRs9sVkyhXPUMR9HF
         Piol+s1u72VMGCoQLJOynQGn0jysf99Jj5VIWbTjyQhzHs2TBvwWVa4OKmgg+zifhpqH
         BEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/PA0xQtIa/KcGdiAZZ8ZKVn8tYCpZzJCJwJTWlA7Dk=;
        b=g/kT80VxbkyfKRW63fpuki2cLVHpnfRB2MyjwN/xrjwothefW+cIz0j3A7I71r0qZ5
         0HgMVi5iqeO3MZGZzxxqKZGmovb07O5QbM/bA3WKjUjklrpRAgHQVM/b5jL5OGs9zR8L
         5YDy1Lc25qzvcg8CQG1g5WscnBTA264MsWHzhYx3QlqC6AyomZyZ4UuL4vWzi7S3nYrS
         Rm4EzZi7cWb6FkFKBlLkyui2Mx/q2Gy9U8lkNh18ZCHFPHIi/EUQr1PBOXN7irWCzmTa
         u2rxmEAhuz8b8IJ/JnjjnjKAVln4sW6bmJgAw7RSCnDDAVZDfurcMJCJn6JwFgn+80Wv
         N8rA==
X-Gm-Message-State: ANhLgQ0WIOnoT8LsGPMylTrFIMFX5alBU2GZ8SatEiI+hWkc8FHfZ2k1
        /EiMKB2c81irzQ1QhLpQp9yuqIrCz2TjyJMiP+qbdw==
X-Google-Smtp-Source: ADFU+vtoUYUwiEbMlA3Hxw9sMfTyaMEcKTfT/kB72V0ZL17XGTtM+KubJHfc9nJD2EfNKgEUEo5N96/g90IVMB7kq2Y=
X-Received: by 2002:a05:6102:8f:: with SMTP id t15mr5606873vsp.115.1584709163527;
 Fri, 20 Mar 2020 05:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200219103326.81120-1-linus.walleij@linaro.org>
In-Reply-To: <20200219103326.81120-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Mar 2020 13:59:12 +0100
Message-ID: <CACRpkdafW8UsLXXXAvLzKZKr_R-dZbueyaAuo0GHupGXzstJ6A@mail.gmail.com>
Subject: Re: [PATCH 1/3 v3] dt-bindings: clock: Create YAML schema for ICST clocks
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Feb 19, 2020 at 11:33 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> The ICST clocks used in the ARM Integrator, Versatile and
> RealView platforms are updated to use YAML schema, and two
> new ICST clocks used by the Integrator IM-PD1 logical module
> are added in the process.
>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Actually merge in the fix fixing the literal |
> ChangeLog v1->v2:
> - Add a literal | to preserve formatting in the bindings
> - Collect Rob's review tag

It's been a month, is it possible to merge this v3 patch set
so we can get some rotation in linux-next?

Yours,
Linus Walleij
