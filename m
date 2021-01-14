Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175F2C433E6
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 22:13:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF9ED22A84
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 22:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730618AbhANWNC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Jan 2021 17:13:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730613AbhANWNA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jan 2021 17:13:00 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9FAC0613CF;
        Thu, 14 Jan 2021 14:12:15 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id y19so14441575iov.2;
        Thu, 14 Jan 2021 14:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n0eEtOJf3DuTltNNg0E2LGjviIdDUwv2RhU3h48SMLE=;
        b=WqUKpyiHsfcwHBtvQbwdCeC4JeGV65LI01A/TCT0FHOA2ZRgz9mF0ZdkohwCTE2siM
         Igw3Z54jWvHjNlWyBjpMlU3DyEgH8KZhuXVK77Z55ntaG8hO/A1p57jNx5xE/XEVKpCE
         layn3JT8yIN9X7mP/lWKES29vOdcajkmaBspLAYAajdVdJxwSGaLQJN16xJWHuxC2OMd
         ryxH5otfV+REhC9JjZ8fH+/Yn6xduo6Nxo/cF/EtZdMJ7hKO6hjXjlrH//rJrXrr/7JU
         EwTU/Y1E16v6mIfmv/airDLqw/nSi9BHG/x6lZ4NTsxw+6DeFNdXKJVxKbRdV32cNGJu
         7lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n0eEtOJf3DuTltNNg0E2LGjviIdDUwv2RhU3h48SMLE=;
        b=QGkuWVDa4QrSLrkCsgqBGx8ZmqdyPVmU8NPAGaUUbSuYzGrRAZbCVKdcV8Iokm3W55
         YhkUkq51FhJMD/XjhFiYE4ZWEwkD6G3WCL/IO3+8wTQ3WiWuGtcqxMCyy5fSuIbB/u4o
         oBkheEGZLSHBvhDSl9K/8l/7ZLCxsdHKfUmJpMPWOfLZCDUS/FxIusTSc1IevI83rp5m
         pvos5MZpwYrUi2+VycADHjBWpcthD2x1JXAMsLUxSmiu9f1kN80cQSh6zaizII4NiMAE
         lJ75TBpeZeKFvB817tP+XKm9mCoC4bUDpjehnXrsAZ6mcXOeR0yq/TuB1WoEewtt0Or0
         nO+g==
X-Gm-Message-State: AOAM532td0cY50wO8IE4HQa5uCUWagcA06YflvbDBfVznPj/YwwirmSM
        nNIT9VYQnC504CK4vOS7ly+6gzX2oIoBLe1Gb4OMJaZC
X-Google-Smtp-Source: ABdhPJw+ZvLMWbpW9dueEEwcs4nX1wlCOUNiMZEPp3z5ItbnX/0L8tJcl0PADX8/3ekrzuG5e/YLkJ+1dJO6oRsfL1o=
X-Received: by 2002:a6b:6f17:: with SMTP id k23mr6815806ioc.147.1610662334949;
 Thu, 14 Jan 2021 14:12:14 -0800 (PST)
MIME-Version: 1.0
References: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org> <20210109134617.146275-2-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210109134617.146275-2-angelogioacchino.delregno@somainline.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 14 Jan 2021 15:12:03 -0700
Message-ID: <CAOCk7NqUpa0DqW=han49MtwUqNkNsQC3OPpO7B-872bvNukDJw@mail.gmail.com>
Subject: Re: [PATCH 1/9] clk: qcom: gcc-msm8998: Wire up gcc_mmss_gpll0 clock
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Jan 9, 2021 at 6:47 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> This clock enables the GPLL0 output to the multimedia subsystem
> clock controller.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Any reason why you are not also adding the div_clk?
