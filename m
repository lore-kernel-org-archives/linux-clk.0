Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C261C46467
	for <linux-clk@archiver.kernel.org>; Mon, 16 Jan 2023 21:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbjAPVFq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Jan 2023 16:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbjAPVFn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Jan 2023 16:05:43 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBBB2311D
        for <linux-clk@vger.kernel.org>; Mon, 16 Jan 2023 13:05:42 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id a9so14987217ybb.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Jan 2023 13:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi16rqRfpVxEIDPG8yaq6fMfKHFwbsCk0KPMN6hDEDQ=;
        b=PBMJZDaOQp1JclDMa/01hpziebOYPox2et3WTjTnSzGSEMZvGQT1Lbv+hPf02Z0MA4
         0YJH3/pd6X4vxKQqgqv5nogChYwIYBG5F4FgkPoydW22jCYyGZtcA3n0P2UhYdZElG+l
         r6a1c+qvdYN2mMWj/Fy9mdWXfJO5pZ5jbH4GdqPE+pXNYhKmzx3U2VUIM2XI/qftzDAH
         cFOoP+buTHBEH2OS7tk9Mitg01rfy/YYIszs6dzkiVnbByiIMeSfL/M3Nqt9o9oCA5/5
         AuIuWCxo05EF4CVHbfqRneJ5lPJqEwYcSTKKR79omXvE+St8fCQKd1ocTM8u6jbNA2wx
         STiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi16rqRfpVxEIDPG8yaq6fMfKHFwbsCk0KPMN6hDEDQ=;
        b=ETkyTyhtfgQZm8st0mGfvf+st6h65x1Kw4TCk5hUbuSQp2QYtOmtk2H9zgtx2ZPXQD
         9t5QxBZiCk1T4UjiMui3kufK6y50D97SurpgZ8mZczKNZwctfJ8y8+punG3hiaCw3OJp
         Ub47rGYxDDiLLTdFHbeGl4wSQmHOiu2Ru22HLhTih8G9ZxI8ot/axPmhfcksnMyp1R+B
         IsQ/Ih6C9eDmyAGtduNnCRewtb28n0icer3BazsjQnw8COk4sJmMwqWHS0Ne3JiKWwsO
         Jeq0/9BXd/oxRZsidl6UqRxhv/ghMpPt4lFV6/IMZRAWlYQXjp/KRBQKr4cYcvuoDqRS
         XV8w==
X-Gm-Message-State: AFqh2kpW14mO9vP/9S1Si2G7wR26vmmwmL4Uqw7r8QaVmhlSZWuLHXkm
        UhpRveRbqt//yBd3TufGSEM0IJTtvIx+qjDtZWM4bg==
X-Google-Smtp-Source: AMrXdXvUFbKj/8VK1PqxF3SoqqhT54oJaVtabwef3rW+11qq+8X4WHWpCQjx3gPW4zHB70/sxyRjqRKMlHRycFgU+3s=
X-Received: by 2002:a25:9002:0:b0:7c2:d9f1:3b04 with SMTP id
 s2-20020a259002000000b007c2d9f13b04mr147791ybl.516.1673903141353; Mon, 16 Jan
 2023 13:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20230116204751.23045-1-ansuelsmth@gmail.com> <20230116204751.23045-6-ansuelsmth@gmail.com>
In-Reply-To: <20230116204751.23045-6-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 16 Jan 2023 23:05:30 +0200
Message-ID: <CAA8EJprEOaduAd_OwpbW0m4aWwoFxNVqExTtMhTK4giPMkBGFA@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] ARM: dts: qcom: add and fix clock configuration
 for kpss-gcc nodes
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
> Add missing clock configuration by adding clocks, clock-names
> and #clock-cells bindings for each kpss-acc-v1 clock-controller
> node for apq8064 and msm8960 to reflect Documentation schema.
> Add missing #clock-cells binding and remove useless clock-output-names for
> ipq806x dtsi.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry
