Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1E9C4332F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Mar 2022 12:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239582AbiCBMSH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Mar 2022 07:18:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233548AbiCBMSG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Mar 2022 07:18:06 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158403ED00
        for <linux-clk@vger.kernel.org>; Wed,  2 Mar 2022 04:17:21 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id s203-20020a4a3bd4000000b003191c2dcbe8so1642124oos.9
        for <linux-clk@vger.kernel.org>; Wed, 02 Mar 2022 04:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yp9yCzmbZQ001Z5slUUJI+2pkFZXbIsPEspBp/H/XTE=;
        b=bHw54Eajeml+XK3atjqpzYD6DUplWxnM/nBvXNkwYojQk2l/LNOVbthO8D0zQ+P3kg
         MoQV/7Thmv/EC9ibRvxtHvweoq04ekpNuL3++goDbZ8A8ABA91M+Sas1aBLN1LPrxjjV
         1eCIfB2d9VfVxqJpNPQIKaz8ZqVo7bq3FAO9IoOGwir4qH1IeJyxFVesd6zWb3TSorSt
         sZvz9WnD4pu3rQWUp3iWDT3tD7x11k92yAWwFvacNw9wRDOQc1IBcj6P4EaUHTPdKati
         J5p+Mdl6QFhKR4N1Tq5Bjyv7BuPYT4ohXAp87ABYquCOkVhEc9R1OdQibrFdGPfWKowx
         K/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yp9yCzmbZQ001Z5slUUJI+2pkFZXbIsPEspBp/H/XTE=;
        b=2IQ5oM0s8uy1Sic47FueJQaW2IUKMYCJLEagNIzey8Sn47wO/iNCtnVxQ2RWMrI674
         adiN9NKrZfad+8nu1XKAQFIU9MzdeSY51AqFW6dvkqxOnxLKwmiCTnkJwUPpecuwJlB+
         CQlxj0bD8imKuCtDB46CGznOn9SHufXF/46A1Ki0GOYGJKPOQofeMTI1aE9++TETBbCs
         FN7MZ9BpdAV6cXJImaZowMb1ISKvnR+6V5OLPSfx0/o+FOL8UCbn5bIE6VRIJQt4idQc
         DO6Q9/wkllm2hUa7mLdqHBasKZ55s+5pox6A+LnTeqgvjbUBC+vbngxQLzcCznJs9xYS
         tf5A==
X-Gm-Message-State: AOAM5322niPiYSzhvL44DuEoQbmAPIzMOA3c+cX+IsGqhhqGOwduhIzS
        6r5x5AmwfU70iwiajz12IEybL2WVgd6GvqJK3yIW5g==
X-Google-Smtp-Source: ABdhPJwjUD1s+Bkkx1ug739gRgv+fN6MVqgiCXuHQsLxV4y2DEPsh9HDQi63/Vp4pPbHWmJDw8O2yX+qV31FHEXblsA=
X-Received: by 2002:a4a:301c:0:b0:2dc:dcf1:8a62 with SMTP id
 q28-20020a4a301c000000b002dcdcf18a62mr15006245oof.7.1646223440380; Wed, 02
 Mar 2022 04:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20220301072511.117818-7-bhupesh.sharma@linaro.org> <20220302000734.GA676465@bhelgaas>
In-Reply-To: <20220302000734.GA676465@bhelgaas>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 2 Mar 2022 17:47:09 +0530
Message-ID: <CAH=2NtwOT9K9ONZLG0G9LUvYi4h-0feJk5HuLNE0DWVg06ovCg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8150: Add pcie nodes for SM8150
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Bjorn,

On Wed, 2 Mar 2022 at 05:37, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> In subject, s/pcie/PCIe/
>
> Since the subject already mentions "sm8150:", maybe the "for SM8150"
> is superfluous?
>
> On Tue, Mar 01, 2022 at 12:55:10PM +0530, Bhupesh Sharma wrote:
> > Add nodes for the two PCIe controllers founds on the
> > SM8150 SoC.
>
> s/founds/found/
>
> Rewrap to fill 75 columns.

Sure, I will fix these in v3.

> > +                     interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> > +                                     <0 0 0 2 &intc 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> > +                                     <0 0 0 3 &intc 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> > +                                     <0 0 0 4 &intc 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
>
> Personally I would use INTA, INTB, etc in the comments to match the
> PCI spec usage, but grep says that's a minority view.

Right, I see that most dts (especially the qcom ones) use this
nomenclature (although I have no strong personal opinion about this).

Regards,
Bhupesh
