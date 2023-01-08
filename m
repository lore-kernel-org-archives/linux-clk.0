Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DBEC54EBE
	for <linux-clk@archiver.kernel.org>; Sun,  8 Jan 2023 17:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbjAHRcg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Jan 2023 12:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbjAHRc3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Jan 2023 12:32:29 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A418D2DF
        for <linux-clk@vger.kernel.org>; Sun,  8 Jan 2023 09:32:28 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-4bf16baa865so85349097b3.13
        for <linux-clk@vger.kernel.org>; Sun, 08 Jan 2023 09:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TvkKknClsarpzrsfEH80urfgT4kkN9N8ybMD6NkCtCc=;
        b=kxTzlg6Vo3FrM2pPq+SB5Udy4doR6X7fBxp83+Ui1CXqCYmoSp06jEQC8tl+BVLVTI
         4KIE4C/yXdtwYG/zw15HelLMsMEW1P3I45ZWgc5Ui+HFpptaLU4jWZ1yLzZFtiIbXVjt
         hBubMzDnR04aUTvTgrChqJyOmtAfEWuJHoSdlTpECsB1WOriTeW/lnAkSAOXqxcvMSZQ
         qkOZXI+rO8+M1Hr3yaIO+kVsDdy3BLtQIgpfeMArSU7z3HgcoRzZPw0ig5GGMRNkTpfL
         /KxU50WbVS5O8MRoxlAOE3/Wfy9NhwZe4KWZzjR3Ifh1meT8dk+HAnxHOnqZlnGJXNrH
         bqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvkKknClsarpzrsfEH80urfgT4kkN9N8ybMD6NkCtCc=;
        b=7u4ZsdnRfUC+Ykr9k9peYk1BublMFvtDqucYkDj7U0P/nnc2GKY5GGZVNylPn3g+k/
         f1uDpz33p/1bgI4hZolrK2jvO1hFapY4g42nhE1NdGJljCYfsjDjGdp3eV6ublVBAMxJ
         6Q3XA2gM688NrtEeCABPYpbeLyka7RzFlVtQiimuTpp8R+3kEPQU43ZfxB0dlKlsBt66
         zBw4YB0s5bg2L83EJQm8e1xPvpS7KWtfmxYQ7070W7OV0AovsYuqe3AC1eQECwtf7B5N
         eM3ubqnTrRZzc6K1das1obGdqoYiKBaTQlo8l5XpJjl9+FtQtMPN673ugXJ/eIXXCrK0
         QA7A==
X-Gm-Message-State: AFqh2koa6r2UQm+DUDVNVkQAXJ4Xqenynaudcxir7OiVG5aDhZrpvg8g
        CFtqlx/73MENjY9/JKGXQgGz4WL1xxZBmaw47CSz5g==
X-Google-Smtp-Source: AMrXdXsRG2S7gwyYvnW8SYhJ5xNwoNVTDuZ1v2EuPmPCFFhFO0/xL9Lx2lfiRL7XQbuUC75D/YeFd7p/Eji77DVqPd4=
X-Received: by 2002:a81:c56:0:b0:490:89c3:21b0 with SMTP id
 83-20020a810c56000000b0049089c321b0mr5145799ywm.132.1673199147627; Sun, 08
 Jan 2023 09:32:27 -0800 (PST)
MIME-Version: 1.0
References: <20230108130440.670181-1-robimarko@gmail.com> <20230108130440.670181-2-robimarko@gmail.com>
In-Reply-To: <20230108130440.670181-2-robimarko@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 8 Jan 2023 19:32:16 +0200
Message-ID: <CAA8EJprb1nC6LCbPQ18tU=apxY+8YfvL2uhrVzwgqJ+GXsjEvQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq8074: correct USB3 QMP PHY-s
 clock output names
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 8 Jan 2023 at 15:04, Robert Marko <robimarko@gmail.com> wrote:
>
> It seems that clock-output-names for the USB3 QMP PHY-s where set without
> actually checking what is the GCC clock driver expecting, so clock core
> could never actually find the parents for usb0_pipe_clk_src and
> usb1_pipe_clk_src clocks in the GCC driver.
>
> So, correct the names to be what the driver expects so that parenting
> works.
>
> Before:
> gcc_usb0_pipe_clk_src                0        0        0   125000000          0     0  50000         Y
> gcc_usb1_pipe_clk_src                0        0        0   125000000          0     0  50000         Y
>
> After:
>  usb3phy_0_cc_pipe_clk                1        1        0   125000000          0     0  50000         Y
>     usb0_pipe_clk_src                 1        1        0   125000000          0     0  50000         Y
>        gcc_usb0_pipe_clk              1        1        0   125000000          0     0  50000         Y
>  usb3phy_1_cc_pipe_clk                1        1        0   125000000          0     0  50000         Y
>     usb1_pipe_clk_src                 1        1        0   125000000          0     0  50000         Y
>        gcc_usb1_pipe_clk              1        1        0   125000000          0     0  50000         Y
>
> Fixes: 5e09bc51d07b ("arm64: dts: ipq8074: enable USB support")
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nevertheless, could you please add .fw_name to these entries in gcc
driver (as you did for other clocks in 35dc8e101a8e ("clk: qcom:
ipq8074: populate fw_name for all parents")) and add all pipe clocks
to the gcc node? This way you can drop clock-output-names from the PHY
nodes.

> ---
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

[skipped]

-- 
With best wishes
Dmitry
