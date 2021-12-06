Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7191C433EF
	for <linux-clk@archiver.kernel.org>; Mon,  6 Dec 2021 22:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239355AbhLFWeg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Dec 2021 17:34:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242296AbhLFWef (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Dec 2021 17:34:35 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87313C0613FE
        for <linux-clk@vger.kernel.org>; Mon,  6 Dec 2021 14:31:06 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id 47-20020a9d0332000000b005798ac20d72so15527613otv.9
        for <linux-clk@vger.kernel.org>; Mon, 06 Dec 2021 14:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ryn/Mn0oCuSAoAeG5wwZYVTAXduxPIQABtmtDskOCeA=;
        b=RTrYHW1MgkOkKe/eq8tryam6zofT8S27THitGFNsvlq3ir1eUoAkYCqPWqsnMcGR4I
         m/wLMsnTyb82WlLB6okXhnZSgAgJiYaq/5eCFGYmuLzyc/n/RLvaVoRgiKO02pyLkfsN
         IL5QK19h8u6Q5WW1f6ASgJplewHZp+gARwBfSLNaRbeticFKdkkQ8NZ0tvZ86kdpB8A4
         xPOC9R5Yq4Z67wKUIH81M81k3Ypoup2YKyPOK95QrPCHw+2xRFSkbhULCV0dqwAPIjGk
         jo/15KoMiEHb9RZ8gHwuXcZEYmV4srRQ2quhIqqBsBNH1+JRHkTG7lwsayfmg8Qy63Mk
         o3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ryn/Mn0oCuSAoAeG5wwZYVTAXduxPIQABtmtDskOCeA=;
        b=k/IVWpV6PkajRdS1D6y7wuU3YqhSFVy5DqY435j+Mm2eNAbHVl23Wuxn4Hly+Neriz
         Xr/5XuR/wP+Ouq+dQqGpLrDnOKOkSmjSQPn8OeyBlujui3HwMtRDkCiyr6LQJjY9OCjQ
         cmpgiUU6HDM6plADOaximFjxcRc60FPU2OKiLBNiZqrinNcXPQnhXUNDig9YYso8Rn+n
         CWtGvPWemrzMrbPfU0H86OZNgZa69j7jVIGIljN23xn0hEg1fq2A5HH03Jqx3cJLWA89
         RW3+6JAwyg+S4W4qdQjyl3DHqnTUCsXigy0n54NF8FcvmSz6rvPUi0t3JTssyO6BfWNl
         vtkw==
X-Gm-Message-State: AOAM5315Hd/8YhCNbyCEiTOiQCRRxTgqkZBSmUtCb5+4HuHKJuLGb34b
        9OGkr2+wHfSLQYAMV65mYMaOLw==
X-Google-Smtp-Source: ABdhPJwI2wU3uJQV08nWez45N6jPlcsYH3zUJa/kxMKikY7BSVIyMNyvnpXr5xhQJn4QzLmliMhTAw==
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr32593040otk.86.1638829865897;
        Mon, 06 Dec 2021 14:31:05 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r5sm2911815oiw.20.2021.12.06.14.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 14:31:05 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH] MAINTAINERS: Add entry for Qualcomm clock drivers
Date:   Mon,  6 Dec 2021 16:30:56 -0600
Message-Id: <163882985136.2324147.4029165074694158634.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211203013901.3460496-1-bjorn.andersson@linaro.org>
References: <20211203013901.3460496-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 2 Dec 2021 17:39:01 -0800, Bjorn Andersson wrote:
> Most SoC specific clock drivers are picked by respective SoC maintainer
> and then sent to the clock maintainers on their way upstream.
> 
> This has however not been the case for the Qualcomm clock drivers -
> which doesn't actually have a maintainer per MAINTAINERS and where the
> framework maintainers have just carried the Qualcomm effort as well,
> presumably as a result of Stephen's history.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Add entry for Qualcomm clock drivers
      commit: e3fd5f632cdd00e3652e4a5fe743c8c052af11a8

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
