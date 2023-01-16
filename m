Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9044DC46467
	for <linux-clk@archiver.kernel.org>; Mon, 16 Jan 2023 21:06:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbjAPVG1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Jan 2023 16:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233921AbjAPVGN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Jan 2023 16:06:13 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE37B16334
        for <linux-clk@vger.kernel.org>; Mon, 16 Jan 2023 13:06:08 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4a263c4ddbaso397135827b3.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Jan 2023 13:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pTx0hKUehj5zlFMm8je22yYIdgmSFNrS9JKax6jHuBQ=;
        b=TslgB/uw5OZ7lyuSRs9ylD8Njzd6I2vt5fglIxu6Ub/uB0qGZeWMKHdRzW/HJG6lsZ
         9xudq/U89FOtQcaxBE/5/x5dQaTouirIBcV5OR4EjPzhRe+LZkgQDP9qIvSCuY0mQ9HX
         RyFMxumcmyTYFx0j5aP7D95hgezZubz0GDldGis8O0QWZJzKNthh0JJlEnAG3NUqd/RJ
         0BUN5TGqNn/6F/HSljpP0mWorX7FWgCtmTpyHqyfP6uDQyI7UZx637kHM9843bEVMKvx
         FTRs+6ehFNkgBYFYTwASZqnnB3kDCn2kjhhsVBatyQo/1i3GtGqbQIKE0Z4CMCMR9yWV
         kh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTx0hKUehj5zlFMm8je22yYIdgmSFNrS9JKax6jHuBQ=;
        b=1kg7cvfwxiEQkMlswIhDrXz621o8VPFSQxAIY6Fy0lJmC7qrK2h1MaTZcH9zOUXrjJ
         szd1UOKy3+lGHQpuZ2vYVl9sZv7fxFXjFjuMFD54wrMpyANaJpfpXJp8O1YGmuQq2H0s
         uGzEZzFSYXiAzA70nm0RdwJOq4vnypTc2qhQs5FQcf0ehnoWgRUqBx+2EZqpcWFqwdKd
         +sdKvsAtqucDT1gTgKpiS51mnPdMk5jqBAAfTGAWYAzOw0zRy8r/349RJrArmJGmDIEy
         sy0GTMtL3oyUo/zBzQSgNzcNtCKv/5Yl19sci8D0+KbmjtfzjNFgV1m9KDmI04F1xxFk
         Rh6A==
X-Gm-Message-State: AFqh2kolTgemSMai1yrn3jEzIPXCH4thQb5V1wWhbdyoyMqjDwqwT/YV
        6AwyGKM3jr1cycMzlYPAhhbxHad3mdTSwsSCUHsS1A==
X-Google-Smtp-Source: AMrXdXv9CEbf8RGoRc6TXpluqPTTq48HnVzFbmyL8U8sOQv2gZMYUAx7xB2dnKo3zWCRMrxZ3DXsJ6juWXp614GVzd8=
X-Received: by 2002:a0d:d60e:0:b0:432:2458:f6ca with SMTP id
 y14-20020a0dd60e000000b004322458f6camr103782ywd.138.1673903168207; Mon, 16
 Jan 2023 13:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20230116204751.23045-1-ansuelsmth@gmail.com> <20230116204751.23045-8-ansuelsmth@gmail.com>
In-Reply-To: <20230116204751.23045-8-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 16 Jan 2023 23:05:57 +0200
Message-ID: <CAA8EJpreAtkY3RvUbU9JS4E3Ye=trc8MvyTLXp6PxPt71X0Jjw@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] ARM: dts: qcom: rename kpss-acc-v2 nodes to
 power-manager nodes
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 16 Jan 2023 at 22:48, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> Change kpss-acc-v2 nodes naming to power-manager to reflect Documentation
> schema.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-apq8084.dtsi | 8 ++++----
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 8 ++++----
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 8 ++++----
>  3 files changed, 12 insertions(+), 12 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
