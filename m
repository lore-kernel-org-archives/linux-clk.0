Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EE8C43219
	for <linux-clk@archiver.kernel.org>; Wed,  6 Apr 2022 21:12:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233552AbiDFVN4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Apr 2022 17:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236338AbiDFVNA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Apr 2022 17:13:00 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE6E1C1EFC
        for <linux-clk@vger.kernel.org>; Wed,  6 Apr 2022 12:57:42 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id i15so3203479qvh.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Apr 2022 12:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KUZUtAp0dNwDr70/3lwG/QXaTgnWDHbJ/WL9ZfSGWRk=;
        b=QbEWGQvz8QdfpaSSWzt2ahUaFClQusByq1H7eAXIihyrMv69CUSc0Obwe9mDIEr+oq
         NVWT1dMj8rWahYjX3IMWk05Ru6cZtKqAjPdMbDTslI8oP6q38LzSn9KvbFLG82O0eNLk
         nz3dUf6pE/rhl9TEzuuT5wZJiYKG1jTyA8zUQMMPF8d5hExV6C24zDjKWnELb7k4bqMo
         DQGpCIhtv25SC5mskEG2mecROEJIZo4OJZIlx09IKRBVlYVeXc0BT4p4NA8jU/npMJxs
         Kd9v1vP26RIrHpzdWT89Mj8lmCH62Y+loDYx6ml3LCJFpfxLaYcMX2ww4Z5yBdrkl+mE
         Dxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KUZUtAp0dNwDr70/3lwG/QXaTgnWDHbJ/WL9ZfSGWRk=;
        b=O62DhseIAmy6rcXxoIRBMTc2vRSSpfheEuMimC50Ij42V0guR3+Mgxig3DHbhMuUAe
         qZ+Fx8toHFwfB3+Jok4JFOq1Wg8dsffNXW9WShjO5KLI6JxI8+mONTElK/W6eOxRYiNg
         W/XdpVojpwOhJSn4IBEa+WyIvlPD0S5wno5Lp3k3ehjp+45bEmclOtk1VwDR1u61zztb
         ZFxtT6hI3x9yqUOLSY0nNXFsIYD4wCuM/PJgT9mFG28VCNVuR5Ho+G0LtGufShgKNhBd
         TwbF4KcDS2SxCoNItqh1tbbTbwzrgNMWVG9TV3K4/reYggyXLiI+0HJODEXIz1mmwne0
         K8/g==
X-Gm-Message-State: AOAM533Ibt/RMPCipbFNKqPpH7Kr+sjBCHcgcQTl9s/BuEycuTHqsbre
        wJ2eT4HFgejbNq67uIxkUAp9ga0sq0YoRzGwpCmd/w==
X-Google-Smtp-Source: ABdhPJwW5Y59IRMz9jgyY9HfpNawpulXkvT7vk6Ukk08ydzcarQ2XkfE97k98h2L3Ubtj03m63GiXZksPtvgTMY9kOk=
X-Received: by 2002:a05:6214:20e4:b0:441:7bed:5ccd with SMTP id
 4-20020a05621420e400b004417bed5ccdmr8928927qvk.119.1649275061386; Wed, 06 Apr
 2022 12:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220406002648.393486-1-dmitry.baryshkov@linaro.org> <20220406154028.EC897C385A3@smtp.kernel.org>
In-Reply-To: <20220406154028.EC897C385A3@smtp.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Apr 2022 22:57:30 +0300
Message-ID: <CAA8EJpod2cNOYr3g+DmdWo_2Ujv7-pW39fBKqcpCPvtVgP5-NQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm: qcom: qcom-apq8064: add separate device node
 for tsens
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Amit Kucheria <amitk@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 6 Apr 2022 at 18:40, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-04-05 17:26:44)
> > Currently gcc-msm8960 driver manually creates tsens device. Instantiate
> > the device using DT node instead. This follow the IPQ8064 device tree
> > schema.
>
> Why can't the schema be changed?

But these commits change the schema. They make apq8064 follow more
logical scheme of ipq8064.


-- 
With best wishes
Dmitry
