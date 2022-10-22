Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A033C04A95
	for <linux-clk@archiver.kernel.org>; Sat, 22 Oct 2022 11:37:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbiJVLhC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Oct 2022 07:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbiJVLgr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Oct 2022 07:36:47 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C78D2D196F
        for <linux-clk@vger.kernel.org>; Sat, 22 Oct 2022 04:21:36 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id q19so14802230edd.10
        for <linux-clk@vger.kernel.org>; Sat, 22 Oct 2022 04:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uau5WlTSNdH5hHu6/4EE9XBJkPI5Seuz5EPcacn4qTA=;
        b=GlvPEDLDWVSa5bMQhee/o8/jixFJt4sRIRb06zyDmO+5mhQrI7xsu/OGQou0Kv4QaF
         cDFgRnCFGlIOxmZfIUoLzEWlG0gNf22VRPYRfqtrQpzQDpQsJeuhleR4bDZ3XFEQiiNa
         Bo0ZUDb9Pz6DTLp4dBlnL4jSJQlKo11q8ggd52qZ7GB0su0gngkjmRRsDhZ6tDF407zH
         qxoPjeEVMLOFu313wcylwp5Gmzjt2pEnM+2pcnrR/9UcZlgSrExQ9nOYOeIY2cEvBb3M
         NTxhgrUiNhNRsC4D7hHW3qQQODUQgDOIEgF0azZnS2E8qFMvrKZswQ2uGty02Hpup54s
         Sacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uau5WlTSNdH5hHu6/4EE9XBJkPI5Seuz5EPcacn4qTA=;
        b=esW9DMwokP2yPr2E1zPS+dRj347Yw7rCXhXl3Cr1OV0DsK6LESYwgSk5qVTbVF2QPU
         2JNPUIobG83sRYRNyC7SydhKiY1Vg9hyPunaboyZoAabQ4MZxjBC/BPH5Z+bfUWoVrJO
         aVOuBxhCfFIWIIgL1rmEupSHIU2iMJTidR1CwAn+6T1gM+lZRIPm3cfmxNaH0YgpLdYU
         YJwo3ZOXO0j4pYh5fTAvqZ3dFpFiI7zvhyWxCqiLzY8SdEN3lVXx41k0dtt5YCRiXuTz
         8HFZx/Z6YfEF5DVPcyUwdiImNi1LIy8n5Bc9Ap7PcIMN4JDz7+b0kQgcYtVC78/0FfIe
         fE9A==
X-Gm-Message-State: ACrzQf14h1f7je7tYg0OpkCx33p2/aimsXLsPjg8GJF2cqKPfyORHEq+
        E7npV0fYhOIzUu9GJI84CNuU1YWqi/rhgfzylPg=
X-Google-Smtp-Source: AMsMyM5LEcFTzC1Q4YGLhDbTxuF75M5we9/a1NEH3sdG1rvdgpjF8W6B1ACRlR/iDcP+H2dwpXTciBNmEE82JzhnpQE=
X-Received: by 2002:a17:907:7203:b0:78d:b8ba:c1a4 with SMTP id
 dr3-20020a170907720300b0078db8bac1a4mr19133763ejc.60.1666437694164; Sat, 22
 Oct 2022 04:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com> <32b218b0-b2cc-9401-8303-c09575ed5209@gmail.com>
In-Reply-To: <32b218b0-b2cc-9401-8303-c09575ed5209@gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 22 Oct 2022 13:21:22 +0200
Message-ID: <CAFBinCB=tuF-RW77w-iVVbzq82vcORisy1QwCW_Tk5SoCMwa+Q@mail.gmail.com>
Subject: Re: [PATCH v2] clk: meson: pll: adjust timeout in meson_clk_pll_wait_lock()
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Heiner,

On Sat, Oct 22, 2022 at 1:17 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
[...]
> Hi Jerome,
> on Sep 6th you responded that the patch has been applied.
> https://patchwork.kernel.org/project/linux-amlogic/patch/a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com/
> However I still don't see it in linux-next. Is it pending in some other tree?
Jerome has merged both your patches and they are part of the linux-clk
pull request, see [0]
But it seems like that hasn't been merged by the clock maintainers
(Stephen) yet.

Do you have that other mail in your inbox? If so, can you please ping
Stephen in that thread?


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/1jh71b3asq.fsf@starbuckisacylon.baylibre.com/
