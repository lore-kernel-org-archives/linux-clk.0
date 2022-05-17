Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C73EC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 17 May 2022 06:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238640AbiEQGG3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 May 2022 02:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238601AbiEQGG2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 May 2022 02:06:28 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7F6A1A9
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 23:06:26 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id v33-20020a4a9764000000b0035f814bb06eso4405528ooi.11
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 23:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hCNmcVkJkyr6UREPk/U3gfOYerfjOeNt4hoZ5B1uXTk=;
        b=cFZB+U9jeB3yfi38/Mfs3qMy7zVn/f9RjNOyAbXoQybgx9K6PuqkupAoXngkYu6PFP
         Wao2XWHQxMac/ZOyF3nkJyEju6SlwTblxxWs/R4Ga5rJH5cf8UNtsUMEN5nPALJThdfr
         OX40EDmD+6O2WIMQVW8mbnXI4zgwpveJpRNeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hCNmcVkJkyr6UREPk/U3gfOYerfjOeNt4hoZ5B1uXTk=;
        b=Q1wT+CfqDRMus9wJf+Zr8/A257T6UkpsPxJePTGgf4CFbOHiG/NqEe6FS1bqYR32aZ
         D/FvuAFbNUwzaXH1P4TvzZLSlfPmum6wavCiubqeUSBzj8UB4G/vcI5Izm1wUnS3EiVz
         7skeR50OJ8H603gVmUi+zsjlwy930NuAaNYPtrI/ySaVmTBJzPdBCPsDWD5s4mIwn/Sc
         2z7/V1+6xdJ5RMEydP3pC1AA6sXEJNl0VDfBF3o50EnFn0afboYbKhtiziElXzV/WhDH
         UYRmindLy1baZnLAVQ6slggy58PPNz/qZkoL5rxzKQidefj+R4sy6GUmsADUKUT4mkM/
         ec6A==
X-Gm-Message-State: AOAM531HUOe2oLjel1n9NHXGXi0XjfY+QQZUbudALERFSJMil0z/zFJu
        HlQnMHxlOWSvvxffhroHpR46Tq5vuwSHptkMWQQDIL1xWHw=
X-Google-Smtp-Source: ABdhPJz3E5+o8ylS4apeBap5pfY7Cog+dvfGVMjGdgWuyn2+LmRYX7S/Cs7EjYLLIgeMzHEHVEj63CMyFfYwZLWsEsg=
X-Received: by 2002:a4a:6f49:0:b0:35e:1902:1d3b with SMTP id
 i9-20020a4a6f49000000b0035e19021d3bmr7476202oof.1.1652767586267; Mon, 16 May
 2022 23:06:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 May 2022 23:06:25 -0700
MIME-Version: 1.0
In-Reply-To: <4e14f1d5-2abc-8c30-d54d-7e542ca4eccf@linaro.org>
References: <20220412194505.614002-1-swboyd@chromium.org> <YnKvoh+h07at8b65@builder.lan>
 <CAE-0n517iAS9KSdunMX18LpqDrQ4ac-yRCZq82j-XdExaGjCXA@mail.gmail.com>
 <CAE-0n53eXiz74iCHHQaC-eDFkuui9Y1xXvuqd2g0UnrwbYhZTg@mail.gmail.com> <4e14f1d5-2abc-8c30-d54d-7e542ca4eccf@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 16 May 2022 23:06:25 -0700
Message-ID: <CAE-0n526x45m_con53GuZtTzKS8Fx-Gs1Y=uPEHY0ftO_aay_w@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: rpmh: Set wake/sleep state for BCM clks
To:     Alex Elder <elder@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        patches@lists.linux.dev, Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alex Elder (2022-05-12 08:15:31)
> On 5/11/22 5:04 PM, Stephen Boyd wrote:
> >>> Will you take this in fixes, or do you want me to pick it for 5.19?
> >>>
> >> I'm waiting for Taniya to reply. For all I know this has no effect
> >> because there's some sort of copy/paste from one state to another. Until
> >> then it doesn't seem like we should do anything.
> > Taniya told me that if there's no sleep or wake state set then active
> > state remains even when the subsystem is in sleep. Not exactly
> > copy/paste but at least it is consistent. We need a comment here so this
> > doesn't come up again.
>
> If I understand what you're saying here, your original patch is not
> necessary, but there should be a comment in the code that explains
> why that is the case.  Is that right?  And am I right to assume you
> will be sending out a patch with such a comment?
>

Yes.
