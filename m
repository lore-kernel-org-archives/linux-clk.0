Return-Path: <SRS0=rluM=64=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555E5C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 14 May 2020 21:42:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 253C620722
	for <linux-clk@archiver.kernel.org>; Thu, 14 May 2020 21:42:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UouQgjCp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgENVmu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 May 2020 17:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgENVmt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 May 2020 17:42:49 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D4EC061A0C
        for <linux-clk@vger.kernel.org>; Thu, 14 May 2020 14:42:49 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z72so25449458wmc.2
        for <linux-clk@vger.kernel.org>; Thu, 14 May 2020 14:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=9C0MFT/ruyAtNrLPvFLiLwJ3Fz0N9PGB/WxB7SsXAkU=;
        b=UouQgjCpN1NnTUjZxoU5G3L6iHrNHHH2JS6cNnQUSuIS0+UfOkUV9cib86pdXzpWSU
         59ncLVlANysGIMf6RM6JF5RfVVPEkUaWCXJh9k16lJR2zU/I3dY9nWFFtw1YueDSlJuu
         rrax8cl9vL8wkqjUn6+C5osOUMWWz+v3XXm6v2GX7n230tLwvcbzXVD46n/0oeLnBXfh
         ddxXwqssLQwq5BCSDT6wZHpT276RebyfgwQJqDAl8vca/kwthpUhEl7HTuZa9VShH54V
         sYqcPgGwbJxBLtoIBvLHzVhWU4s6k5a/e2afbcXqsI7pMD80HyhC2cAcxUOQvjMbSWPG
         eyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=9C0MFT/ruyAtNrLPvFLiLwJ3Fz0N9PGB/WxB7SsXAkU=;
        b=DFsvGTwJbyqzSmJSrjWZzVlR4fiZg4VCPriSt6/WtlC9I1Vvx8YBUojzRQwCDylVVt
         hVkwRgynTeci6fxsZSyJXjA5I494+l8Zxx9tclHvTbAyvVCr68xwKXE3jN2lgkAv9GAb
         CKkoJrEkSxZ6LjWhEA972DQZT0eoOBGp8h+O3kXMNLFzZfb/6P4KKO3mgYXUPGwYi6IG
         dy2BjR/qZpgeAH+6MxRyBfyRVmD3iavSY5n5RfoqMR6j+A3ZlSdV+Uc+E1gdkfqYYDUa
         GNe2g9xr0B1rfWrjSj10hoGfdXrztgNZ0pk4r4r9qF/NVMG/9BUT/6arkpEp4OPXjtBc
         pJrQ==
X-Gm-Message-State: AOAM531mQ6mIOjQV7WQ4y2t9KjqF6SKnVECT6of/Iopz/ORr3rLbsQi6
        tHKAnIvSahdvguiPOSFIZ8Xpvw==
X-Google-Smtp-Source: ABdhPJwdCkUKzA9R3G0NNruLW4p3wqLpiUlD1XrUneAIYgvoRrqgITtq8VK+tOgf8cffFTm9AnC8Jg==
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr366429wmd.95.1589492568016;
        Thu, 14 May 2020 14:42:48 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id s11sm587301wms.5.2020.05.14.14.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:42:47 -0700 (PDT)
References: <1j3686g6r6.fsf@starbuckisacylon.baylibre.com> <158948975864.215346.6720030658125416749@swboyd.mtv.corp.google.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] clk: meson: updates for v5.8
In-reply-to: <158948975864.215346.6720030658125416749@swboyd.mtv.corp.google.com>
Date:   Thu, 14 May 2020 23:42:46 +0200
Message-ID: <1jy2pudwh5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 14 May 2020 at 22:55, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2020-05-11 02:28:45)
>> Hi Stephen,
>> 
>> Here are the amlogic clock updates for v5.8.
>> Nothing fancy, please pull.
>> 
>> Cheers
>> 
>> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
>> 
>>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>> 
>> are available in the Git repository at:
>> 
>>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.8-1
>> 
>> for you to fetch changes up to a29ae8600d50ece1856b062a39ed296b8b952259:
>> 
>>   clk: meson: meson8b: Don't rely on u-boot to init all GP_PLL registers (2020-05-02 01:53:32 +0200)
>> 
>> ----------------------------------------------------------------
>> Amlogic clock updates for v5.8:
>> 
>> * Meson8b: Updates and fixup HDMI and video clocks
>> * Meson8b: Fixup reset polarity
>> * Meson gx and g12: fix GPU glitch free mux switch
>> 
>> ----------------------------------------------------------------
>
> Should also mention that sparse on arm64 complains about 
>
> drivers/clk/meson/g12a.c:5074:43: warning: invalid access past the end of 'g12b_hw_onecell_data' (1472 8)
>
> but I have no idea if that's a real problem. Maybe my sparse build is
> bad?

This is weird. IIUC, it complains about

> xtal = clk_hw_get_parent_by_index(hws[CLKID_CPU_CLK_DYN1_SEL], 0);

CLKID_CPU_CLK_DYN1_SEL id is 183
and we make sure that the table is always NR_CLKS long. In the g12a case
it's 262.
