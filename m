Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0372ECAAD5
	for <linux-clk@archiver.kernel.org>; Mon, 12 Sep 2022 13:33:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbiILNdc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Sep 2022 09:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiILNda (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Sep 2022 09:33:30 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0286E30F75
        for <linux-clk@vger.kernel.org>; Mon, 12 Sep 2022 06:33:27 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id t184so12795795yba.4
        for <linux-clk@vger.kernel.org>; Mon, 12 Sep 2022 06:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=otGb4AwYTfhIb4lKpfRenMAoPDU49k1ZwLwvH7P8lco=;
        b=oSnDlq+OCQ/AA+yITuOTcepJuxj6xvCZxw0N5R5P9qmL163t3H2HLzasOd5N0qFdXa
         aeE6KYgW4Gn6DNc+ftjU0SIDgy/vDzwRSAh7n/TffeO0zEdp7js0b5/yfFCQnyRUwJ4s
         Svi/gN54DZ0MkDW5HHCVum2hlI8RK0wC3yXo2vsfYC1sucOpHj8P4wI4XYK00Oj/xobo
         IBs1krtBJDHqiTsX2EP74bwEvhUlB5LyxDSLSS+v8ey3wNgtK88elLZJXWIOWNeK7t7t
         3tI5wH0BqKV9FKliDAHstgaifLIjIdUHx++kBXGaRnLI1H3l/rMamyTBurTzwKiKcGUp
         BRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=otGb4AwYTfhIb4lKpfRenMAoPDU49k1ZwLwvH7P8lco=;
        b=bg6YiBqOBUqxTfijp1HZzS101Or4XAnR7jG7lLvx/76E1SRcnaHRCvzcjU8asIJFHL
         /4D9gWvDACkDX20TVnSz0/HbEBTjxGDeGoqjhsp5ssfvXwiOkkjdTU19S46JU0WhH27y
         2fxajftBg3fYuLTZPZmauKOM6PSBY/EPeIf4mbSHBBmUsbq+LmrNThGzr6CinstxkQQy
         vmSEaBp79yF0Z+1tG5WlLg5N9CNkk70MzLpkuG6FN05m9IVozYfL9Mks5IHyI8tO5REb
         F+JwpRyrTGoJtebEDXhQ3YrHFjInnVaS6gC1S1riKm9S70f9bHBcpMBm5X28AAoVoTk1
         /eEw==
X-Gm-Message-State: ACgBeo1i/X228r8SFeihWh/N9LFrHIz+vyw7hRbA5q6EF778p+nDhcNA
        gMr3KVpFmYZCh/k3qzBmHXsOrFp+BBMuSXmc1MiTqQ==
X-Google-Smtp-Source: AA6agR6zrEM49/wYG3jG8qpjvQyM5sg73lbnKFExy/6Q0tgOLI8rFalUyzIkO8PSye6Hy4pcCfvfBnZXy7mqihPmj+M=
X-Received: by 2002:a25:ba45:0:b0:67a:6298:7bac with SMTP id
 z5-20020a25ba45000000b0067a62987bacmr23760581ybj.194.1662989606018; Mon, 12
 Sep 2022 06:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220910170207.1592220-1-danct12@riseup.net>
In-Reply-To: <20220910170207.1592220-1-danct12@riseup.net>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 12 Sep 2022 16:33:15 +0300
Message-ID: <CAA8EJppKzZqGm6fSwpobOXoGNkPGy==w-XbFXLwFEMRTVgpRpA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: sm6115: Select QCOM_GDSC
To:     Dang Huynh <danct12@riseup.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 10 Sept 2022 at 20:02, Dang Huynh <danct12@riseup.net> wrote:
>
> While working on the Fxtec Pro1X device, this error shows up with
> my own minimal configuration:
>
> gcc-sm6115: probe of 1400000.clock-controller failed with error -38
>
> The clock driver depends on CONFIG_QCOM_GDSC and after enabling
> that, the driver probes successfully.
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>

Fixes: cbe63bfdc54f ("clk: qcom: Add Global Clock controller (GCC)
driver for SM6115")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)



-- 
With best wishes
Dmitry
