Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864F5C61DA4
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 06:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbjBCGsc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 01:48:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbjBCGsb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 01:48:31 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96D26A77
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 22:48:23 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id i188so4395978vsi.8
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 22:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DOZM23/1S7CSy+q5eLPYC0k+K4EbQYTOVhbDtucSWfM=;
        b=LiP66aSOWqDz/lsmy3FBtArCy252DrCVwRjht+3hFGLHIkDLRMIyomYfBZAYIoXqBs
         xIUYGAErxGzzf9DMiwBtyfLsIBSWZqHJLhNFpUg54R2e6xFEiyVltZyM/x620nbV+LkE
         /pH20N3QvW2bMMkz03uWkzZPcOUJ0TOATiTYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOZM23/1S7CSy+q5eLPYC0k+K4EbQYTOVhbDtucSWfM=;
        b=0okhqqlCB+NIqiIH+YuTSHHxu+kuHW7AYGjXyLHi0Q25XvMjiNRk05EMrfJRQ6H1pH
         4SrzrduEuRKeesRKnubxBfBvPOs2e97VN6srxSPMCk2PLOG2wYDAG6JF/5frZyr42zQo
         25EO5z4vu6KJuOJzV5d8qy1n5FZBbYCam/2E7KhXLQeXY2GgItw55/VHn/0R0XnoHbC3
         fsfhpD2SEs5P4sIFlo57na5wFwkrpnEo1qJ27nkwBfK6I8g7b5sFRCHmOProo5+jlJNk
         TSriA8kAi+MzU38Ijx8gAPqQHpiZ4wnkncGaEFUQ/0A5Z+e1q4kb3ynFtSp/v5riA8yZ
         d3CQ==
X-Gm-Message-State: AO0yUKVLyvPotQiJD3bdL1ymrdcvfXS8fVN/YQpjxn1rjKoKiGeRPFnk
        sy0mIuE1MTvnrCMbeW8tzQzeJ52Jbv8fFwOD4t+rdg==
X-Google-Smtp-Source: AK7set8EbtIiJP5eoXyubQfcVDaNwVo8erq5xWSisdXu007fPae2bmld9wOxBu+g1ovX9YXJEqaHQ5n31c2NLBL8a1w=
X-Received: by 2002:a67:d21a:0:b0:3ed:2cd6:deed with SMTP id
 y26-20020a67d21a000000b003ed2cd6deedmr1757642vsi.65.1675406902737; Thu, 02
 Feb 2023 22:48:22 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-6-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-6-Garmin.Chang@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 3 Feb 2023 14:48:11 +0800
Message-ID: <CAGXv+5GFuog-E-1o2qYKFkvC0XnDvYU_fA+BxvaFLGv=_Y=JkQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/19] clk: mediatek: Add MT8188 infrastructure clock support
To:     "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 19, 2023 at 8:51 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 infrastructure clock controller which provides
> clock gate control for basic IP like pwm, uart, spi and so on.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
