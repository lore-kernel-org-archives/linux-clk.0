Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F54C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 19 May 2022 13:07:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbiESNHd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 May 2022 09:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237325AbiESNHa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 May 2022 09:07:30 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28E071DBF
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 06:07:28 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2f863469afbso56701847b3.0
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 06:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dz80QCD+6CE2WkSamufmrlzCM2Z5I/iGKYhm4E6fP5A=;
        b=MzIskUvVCGTzeEoSrg5hcVYlo7SLpkrtZCNOsYBwMOrhNXwDPE9OAxjkAvKNpZKLYr
         fAhN5ZnIJdUsbNCd9srngZcgYoGPUHJsLwlF7Eg6BVl3IYEGjo9ib6oGxOepWKl3eNDo
         aGLbeGffL88cmr50mlTXtJOV82Qtef9gOFXp2DG3KtBSoUz2v4nwixnem4vYftiQiSbt
         NmSh4w6wrPbgAvPtUD0/e9uCGa7QCCywBZ+1oCtc4VWeMVMxrAJeIDZApWC0mbtc1kYu
         JM0JYeBsLjzZgefn7sz1IGWe5qGSyPdvHBVX/Aze8Zch7KPdDdbiy6Eq0VAP3dZre8gU
         2e3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dz80QCD+6CE2WkSamufmrlzCM2Z5I/iGKYhm4E6fP5A=;
        b=zXbAsT7vOpMB527HEp38dWMsF11sMyFoMQDGmicuvOiFtNgqrx1xwtSwJm9A/9A/py
         7fqSN1xImhPAwyNvpI9md7Pdc8iM0ECcgM3r07KykuPnZK0wF1gQtg5Imkh8jaLoBvQM
         tu/pqJcPWCUy6KPR57CpytyEXDPwVfec79BC8hRXWgFcIxk2LGsba/fKEED85jgM1Xvo
         80YYtXkk6ZYSJ8dN7/wjDh/PAhrcDt8nPsyl6a2CWVjJRLzhH38HmY27qiey7PHfvSq9
         vr+E9+dvdPWBdzLw630hc9yPJkTVVCLMmQ0OMOuRN0NuMCuR6uG3f6YsND0wdQCpJuFC
         H+zg==
X-Gm-Message-State: AOAM530LIVCjV61cDdcYNrUZWHIeTYP71VkA/A51cqawDgM6WkoeOST0
        wWTxL01lA+ESXiJjxwq7vLIoU47zEVwgltdOjC3GxA==
X-Google-Smtp-Source: ABdhPJxsBVzRbaWlrFp9iq73YG21rHNLjS99HbEgv2SgrFLzzd63ELklO9hMs9x/uNhmt9BWBLuhC4bI4+FgNBf1Avo=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr4584461ywd.118.1652965648019; Thu, 19
 May 2022 06:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com> <20220517032802.451743-5-Mr.Bossman075@gmail.com>
In-Reply-To: <20220517032802.451743-5-Mr.Bossman075@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 15:07:16 +0200
Message-ID: <CACRpkdbu87tO0qqLKCaKDM_B0D7cNotsk6Rea4f94VhiuXNJQg@mail.gmail.com>
Subject: Re: [PATCH v3 06/15] dt-bindings: pinctrl: add i.MXRT1170 pinctrl Documentation
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de,
        marcel.ziswiler@toradex.com, tharvey@gateworks.com,
        leoyang.li@nxp.com, sebastian.reichel@collabora.com,
        cniedermaier@dh-electronics.com, clin@suse.com,
        giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, May 17, 2022 at 5:28 AM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add i.MXRT1170 pinctrl binding Documentation
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> V1 -> V2:
>  - Nothing done
> V2 -> V3:
>  - Nothing done

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
