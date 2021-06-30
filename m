Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F071C11F69
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 07:31:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68B9161CD0
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 07:31:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233036AbhF3HeN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 03:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233108AbhF3HeG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jun 2021 03:34:06 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 316C3C061768
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 00:31:37 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id f30so3363796lfj.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 00:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lxYiu8p2N8GfVq4zjyFWRywFohMl9B93gUN+WOKNciM=;
        b=P3dnnE9etYGaSIabOdksbhak7yrNNEj7JkC2s9ceXmf359Lo+sLDn+MN5AaMIeP7nH
         uuFlGOlo+AL2gRFKJ2sRTPn6O3eDynC6a1yVJ32Vnr9A044z8C0sghr9j14oH/VWFeof
         tYfsqbi8erpR+0ZcEnIoOakG/5XanHNAsR8JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lxYiu8p2N8GfVq4zjyFWRywFohMl9B93gUN+WOKNciM=;
        b=dSKbPJWR3oXJwVc0exZ2GxcjprW2JDRToLmKP49pSWWipjbYZpnNB9CspqfTPOVwHc
         Zp839DCrhZY48gqPGCFBxB+wh1fHKOBzXxQeueSs97tAu/tptrgJHRqgqfDx3+Cn9Ymr
         EQkhBPtpPN9pVv9zntbzvy31YdA5h7jXlZNaL1SP/FUxrOgtEDx4KcJm8blf8RoxQp7K
         J+f4vE7vqC++z1WvrUA6SGsVwGPvPMlUyytg5TU+oZU8sJyAfXevxetau7kF+5x8GTud
         ZUTSqDTbtyWMsCEvmBgIwxdq3e9xWGrubNMI4NnGmG+VgcXcXk48Iwj782fGYrNWAJxv
         iDuQ==
X-Gm-Message-State: AOAM5326CePGX/W4P1w+edxY71bti332nOuBTB4JgFBSQj2mrwAETFnf
        3KC0/5vVFbzyUbgWFRctH8I4nPLT6ce46o6/inUqQw==
X-Google-Smtp-Source: ABdhPJwtWq5t1qxUswjy8XnO5yHQyrzaf/PASJx0qZL1yG9gn+vAucP21N28ejrTjvh3GXcAhuzEvusugeGYSyVNteY=
X-Received: by 2002:a05:6512:63:: with SMTP id i3mr26374013lfo.587.1625038295495;
 Wed, 30 Jun 2021 00:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com> <20210616224743.5109-4-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-4-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 30 Jun 2021 15:31:24 +0800
Message-ID: <CAGXv+5F2zTcqnjH2ud38vUD149KJtgxhPQME2Mk6-vGtQv+2YQ@mail.gmail.com>
Subject: Re: [PATCH 03/22] clk: mediatek: Fix corner case of tuner_en_reg
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 17, 2021 at 7:01 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> On MT8195, tuner_en_reg is moved to register offest 0x0.
> If we only judge by tuner_en_reg, it may lead to wrong address.
> Add tuner_en_bit to the check condition. And it has been confirmed,
> on all the MediaTek SoCs, bit0 of offset 0x0 is always occupied by
> clock square control.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Though you might want to consider converting these types of checks into feature
flags.
