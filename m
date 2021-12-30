Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851F2C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Dec 2021 14:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240363AbhL3Omm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Dec 2021 09:42:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240375AbhL3Oml (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Dec 2021 09:42:41 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC51C06173F
        for <linux-clk@vger.kernel.org>; Thu, 30 Dec 2021 06:42:41 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id kd9so22192218qvb.11
        for <linux-clk@vger.kernel.org>; Thu, 30 Dec 2021 06:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/lKISuKQSLJq7W846wWyQPT/02yK4dCfDutUdXbJUE8=;
        b=y9GwPrdNAQFLG/s5DqEEynU9lk8S/zqa5e6AdqR3bbHQh+HBCIe3Olv0DXAR4+aF+S
         ssTo31FCoWMnUvKW9GA/+RdbfW+IjIS7cYi0x0MH6WBFzbWWhmcQ80ULhE4CaSZHjDTJ
         prnIYo8oH+A9pLL/p0hNgA+IilgY2tJ8xFWSJwaNFG8V6IDiXCUoI+15/VRGgCO7TzWn
         PPIDZXKjcRFYG1HyATVt+Z2aDTsulaP3morwG98dkGg1YjDx34vnc70nHhybhWv7vFMj
         dmY7yCFdbBweVZCzLMh4Rn9Uh9TPUenCVsRgInK4ZLa7FVA8A9X5DnlR4EDg3KtGgfaX
         0ZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/lKISuKQSLJq7W846wWyQPT/02yK4dCfDutUdXbJUE8=;
        b=2RzbYMB8D9WwTTdQyGtS4SKb1Zd0inQqBu6GmyLj+Z2EF50qKXnkZkkISkYr8EroX4
         JEf5D06/0xjH9/56jOqpn4tEshjnu190I3Uk++FB1MNuZskvVOUOlbQ8nIM66zH1jash
         1nRd57KKVPEm+xAwMP0QSf6w7z1ytKsFZJb8peb/yokzEHAHXP6KVIneFwvl8iv08vZz
         sUg+fT0/P+oZOQ/nWU8B9JvQ/Pp5w+8Q70O+JDB4B4AYQ/16Y87dLyqkU39purEBBqJ7
         pZL+8st8o1FAwnb3dmUX1T8U44cxZ/zawiQUCQdv4Diw5iH/0/D8bSn6+notCqY7ew7m
         Y/ug==
X-Gm-Message-State: AOAM530pxNLX9V0gOGpZPeTOmv/AzwibG2cdKF5J0tMwaC/jBMy59Nbq
        BVVL79c3a5iN6IeVKcWIYN/sHBAaSul5kgArcjei2w==
X-Google-Smtp-Source: ABdhPJzJuu40611h0P8gpEq2A1hMiIaXCb1nTVZL3xZi8wKhm6cKrO+ixRJE9sSU773pYMI6ZOlBsjki8tq1vohgACw=
X-Received: by 2002:a05:6214:248a:: with SMTP id gi10mr27557554qvb.115.1640875360837;
 Thu, 30 Dec 2021 06:42:40 -0800 (PST)
MIME-Version: 1.0
References: <20211230023101.1122588-1-konrad.dybcio@somainline.org>
 <CAA8EJprR_eNiRTXOLnHzztbdH_RYj-+Po99b=7c2Asxvop+jtQ@mail.gmail.com> <5543bdad-3518-fe20-d755-69ebac4ddd69@somainline.org>
In-Reply-To: <5543bdad-3518-fe20-d755-69ebac4ddd69@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Dec 2021 17:42:29 +0300
Message-ID: <CAA8EJpq_T0tR=zN8G43otsWEqgkfqV0egrAtfG-VJMib6ZtEHA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-msm8994: Remove NoC clocks
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 30 Dec 2021 at 17:29, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
> > You don't have to init array entries with NULL values (if it's not for
> > the documentation purposes). Uninitialized entries will get NULL value
> > anyway.
> >


> Forgot to address this in my previous message, but I think it may be a
>
> good indicator for the next person that decides this would be a good idea
>
> that they should probably stay away from it.. If it's really bad, then sure, I
>
> can remove it..

You can add a comment on top of those assignments telling this, so
that the next person doing the semi-auto cleanup wouldn't delete the
assignments.

-- 
With best wishes
Dmitry
