Return-Path: <SRS0=ZViX=63=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8B6C2D0FC
	for <linux-clk@archiver.kernel.org>; Wed, 13 May 2020 13:02:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43F6B20753
	for <linux-clk@archiver.kernel.org>; Wed, 13 May 2020 13:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589374951;
	bh=3gsu1+H8KaTAc/1/XTAg+o3iWJpqglDQYi2kGj9mDyY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=N7eu69a69wl6moQVT20LN/KnTq0HKO7a3AGJgdGPL+oL4DJtJ5NxMfvM8rffbOwgs
	 L8gepEDCw6oP1nS3yPL57LAo1zjy0EQ3Fd24zIEMCQRl3DFpYfP+BGHY7JbSFCr3FT
	 sogLeMmb7l70lE4kK3mpIJ8UVIl9PD2SJji2eL6M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729931AbgEMNC1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 May 2020 09:02:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:57694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbgEMNC1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 May 2020 09:02:27 -0400
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D85B22494F;
        Wed, 13 May 2020 13:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589374947;
        bh=3gsu1+H8KaTAc/1/XTAg+o3iWJpqglDQYi2kGj9mDyY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GHEUHp58flz5dGi5qOoN3liccsYth1fQGfMCrkeZ0Ukng6zXWrNkLhmVsWRUDfDfL
         XjmY8es72bnP0BEoJ1esx+zSnjB8BQb7oNiKNXZm06o9In68xcVy5l0WbydN+Zx6i2
         J+VhzAIgf9YJotVvPlAHwSw7XasOcwiGNjxF1/ts=
Received: by mail-oi1-f171.google.com with SMTP id 19so21320661oiy.8;
        Wed, 13 May 2020 06:02:26 -0700 (PDT)
X-Gm-Message-State: AGi0Pua0/EJNJRqeYmQTpKOCyUaHKHhn8qKAFboGef/r1toUSrn/smwu
        7LAAO9UureKF2XkJZlGMO7IS0U+yWbJR+pg5wA==
X-Google-Smtp-Source: APiQypJLdEVF0QKdCuz/qxBqkFZpgAWEBjtcdpCh6nTVaiCngqOwmIFbeeHiC/FcXGhzItL+NUf/oULbqA+pCcA59cE=
X-Received: by 2002:a05:6808:24f:: with SMTP id m15mr28316669oie.152.1589374946192;
 Wed, 13 May 2020 06:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200512204543.22090-1-robh@kernel.org> <158937185132.39109.17103954100758193517.b4-ty@kernel.org>
In-Reply-To: <158937185132.39109.17103954100758193517.b4-ty@kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 13 May 2020 08:02:14 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+KfngSTEnP3eh6Zr9H4GUuSbyZCGXs=skbwQK0j4ZJnA@mail.gmail.com>
Message-ID: <CAL_Jsq+KfngSTEnP3eh6Zr9H4GUuSbyZCGXs=skbwQK0j4ZJnA@mail.gmail.com>
Subject: Re: [PATCH 1/5] spi: dt-bindings: sifive: Add missing 2nd register region
To:     Mark Brown <broonie@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 13, 2020 at 7:10 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, 12 May 2020 15:45:39 -0500, Rob Herring wrote:
> > The 'reg' description and example have a 2nd register region for memory
> > mapped flash, but the schema says there is only 1 region. Fix this.
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.8
>
> Thanks!
>
> [1/1] spi: dt-bindings: sifive: Add missing 2nd register region
>       commit: b265b5a0ba15b6e00abce9bf162926e84b4323b4

You missed my ask for an ack. This is a dependency for patch 5.

Rob
