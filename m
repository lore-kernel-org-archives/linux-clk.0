Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9CEC432BE
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:43:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 252366108C
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234924AbhG0En0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235110AbhG0EnZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:43:25 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5D8C061760
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:43:25 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id e5so12416226pld.6
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8OgNNI/ZkkFCiDWQYC06fGQinvIGcARtCC3HkxPSNzA=;
        b=Q5D2/AyVMa1IWbGsysocOoq8QjOGrae5n6e9Q199iOQUX9WzJoez34mv9P/teNkYEt
         klKGHnai2cbH8VssVKLVQ+IhLy040E1J7bVziAzCleY+Getjb1NHun5CHSeiMYDlqzXe
         6Y8FaVfsMd70FaCepmZ0ibonK1bObtcY8uP+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8OgNNI/ZkkFCiDWQYC06fGQinvIGcARtCC3HkxPSNzA=;
        b=PGDXoyLK1M0Kz7nWIadkf9Vy5JD0ZUqyNFuXZNHzsGSVZk+xvcjPu1y/WRTVQd90X4
         aAyEisxZvIWAaN30foyP9hPEckGFZpG2pkknVVUQdQEdxjFwLTblOosQ/n54Wu6UCwbL
         C0QhRmtmN4Sf3NXc8FTWkGBD7GDXT/hMEFrAjBZ80EQTz3Mtmnn+e5kn53+dHHp4jXWN
         B60QkYKP/Z8oiOUYvWixIMTOiQNl7OoIVM/G3VHOkR8Sf0iRL+KgDtaWi3dQLn7o6iBL
         S8JBe1eN5EX8SgMg+1Eoc2tLQtYwCb0QKYoVM6Sj2yYF8zm66gcfIsW8e3nc6SukOzhg
         pDLg==
X-Gm-Message-State: AOAM533ObRcK5wW2iDfl+8F1litXP2pHeKUypChy+wSSH0jeb5Ytv1Lc
        bET+ckrMCDJQDWEBofBv80UXqPCL+AO7KcLgHU3Jkw==
X-Google-Smtp-Source: ABdhPJxoc5CSpPY3vQh7WBrophJ46+dx+Oemf64p8gEZ/MeteoctC+j1XOB9bhr65cib2vxfEoicD6FmTXf3GIPsuds=
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr2306339pjn.112.1627361005167;
 Mon, 26 Jul 2021 21:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-15-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-15-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:43:14 +0800
Message-ID: <CAATdQgBkdst+fVnQhoYzJgO8meaef+YCjcPgEMTLbECTxRC6tQ@mail.gmail.com>
Subject: Re: [v14 14/21] clk: mediatek: Add MT8192 ipesys clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jul 26, 2021 at 7:02 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 ipesys clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
