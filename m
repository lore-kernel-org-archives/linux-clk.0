Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580E6C4338F
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 10:59:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BF35611C9
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 10:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240232AbhHYLAb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Aug 2021 07:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240176AbhHYLAa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Aug 2021 07:00:30 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211E9C061757
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 03:59:45 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g13so52012258lfj.12
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6OhtRqxuCWyLk1aLabWzxilmd8Ou8PbDbdnIDNsifyg=;
        b=UCe6OdgVEduJpDvUvnAB3x/x/zZNszEyU5ZHOrt4vlHiT818x2be4JzjZm1vnIunjQ
         r1CtUT20ws08Uh6T6/kTMmgQLJGl7oTjRiLcRK6Mf1qYkU30h/xSAMX1K9Bcvswq8lPI
         r6YRJ7p9V8s8NFEGw+nFTtgOeo8brw/PWIhKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6OhtRqxuCWyLk1aLabWzxilmd8Ou8PbDbdnIDNsifyg=;
        b=kVlwwi5mnO+EklVmLDwS+miS+tGyoy2P8eE1gmclZCGR2UNXDSjfQqet2B3HSJ3ojh
         KsvtaJqdqW4RwjsQ8ZT0twqXlIBLfd7Gt3ZC/+E7aRDn+o3KjWx26ZCIiRB6ARu6qWeZ
         qeWahWeG8QuKb6VVXqJWyhP/xgNteqJ5VyzVIhcMMU5m7gxPcjC441wLfnFQBHtTSGjU
         M9CqVxll9AC0PGXYROJzy69lRM0/13WtiesZXLNtcqwYvSZXYSZY8p9pAPurRFdqirsE
         RL4YX+yYQd8kIOi6tJzOwNI+DcJABByIStCNb/vHSqpn3hicdQIuMRSRkDfcK/UvAny7
         CIig==
X-Gm-Message-State: AOAM531kN6ARTGadR3fiAaN7LzoevE0TRs28SGmAV6PB2AYg4XQxeEwj
        JURVhp0k8uj5RFJaXEk/LhIjEqUU5cLwrCrzaRf1YA==
X-Google-Smtp-Source: ABdhPJyw9wcy/vAjWZ534fGWZnouFc2vvtw4pcR/SBh/M85HrKYrTsRz17gVQOJwNERGX7rH1TL7mUrMZyB/6EqcRRE=
X-Received: by 2002:a05:6512:3b98:: with SMTP id g24mr24830249lfv.276.1629889183532;
 Wed, 25 Aug 2021 03:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com> <20210820111504.350-21-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-21-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 25 Aug 2021 18:59:32 +0800
Message-ID: <CAGXv+5GC=3E_Kzes1QKQtJykvGGugUUwjcO0EeDnmoDG0GHFvA@mail.gmail.com>
Subject: Re: [v2 20/24] clk: mediatek: Add MT8195 vppsys0 clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 20, 2021 at 7:33 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vppsys0 clock controller which provides clock gate
> controller for Video Processor Pipe.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
