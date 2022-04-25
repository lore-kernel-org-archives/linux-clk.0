Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CB2C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 17:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235421AbiDYR4a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 13:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbiDYR43 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 13:56:29 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73461107723
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 10:53:24 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id kq17so7980685ejb.4
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cnF2m4xWmZU4mmTA2zlwzl8U0HY1WmVOSdpsqMfFRDc=;
        b=p6SLmrfQUx8YcxlTOmJAR84PN2KLXoayR3X3avOVC2jJ0BKBczgjaxo4/ZioSw5rJC
         XcWA77v9eo9E872XR3TTclpykB2zLNieZY9uA8gUhumW/WauL5W11CoQe/3UNS/Cd7Gf
         LC2BS37K69LetCrBqbA07l2xsWu0DUHYJlvqVSDPW4Wm53YNUf7GiSNdYxcihCQAL9SH
         OtAKyhz/H4ElgMoQekvE3ApZ76ZwVdINRyOGG1MrXgFdiHNe3F18kUQB+H00FlslBwID
         R0L2q2jBozTD/r4egbzs7jJU2AhazHMJ5Olhn1Ds4sf0wl2O2+mKWb7jiMG/o4RMlCix
         X5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cnF2m4xWmZU4mmTA2zlwzl8U0HY1WmVOSdpsqMfFRDc=;
        b=SFdHoGIgxeqMQ3Hs0CEMdTVh9vgZO+y5Vedm4P6pXwyfLxdKhT6YuUIuvsodi6Y8yl
         ci9z6clyFzeuXKL+Mf9K2HRd9u5TAX+s6BeBTr4CbhxNW0w8h/X3V6WjlFNG/IjAEqDH
         QVu0wnPXyjy+qcCAQM0bd1nnYdkJ227A+8LFK9um0K3zq++GEURq2h3gPivTFLWyOm+K
         nCbJdpKS926zedBr42bYnHBrM0wKTbiJmpYo03BzyjBfYpzT5rPNF1T7UFbH7z02dTCk
         10j+YnqIv4Knz9+z+sIqXnJ1qLzGJrm8wbA3IHHHj1qkRy2nN4NvmPgXtXASm7KPbuwS
         QJQA==
X-Gm-Message-State: AOAM532FRDvhSqMw2y9fBDld99EJARihkVK8NmTdYV1rEelXXsUQlJtZ
        IgEP/w6umhAz/Z6RGutRqEk=
X-Google-Smtp-Source: ABdhPJzWj22q1Zgr6ZMUTNPCd7QA9rkf7OLHscY5eDZc4kof7XQpeQG3Hs6FXiWTaMlCqelcYMasQQ==
X-Received: by 2002:a17:907:2d8e:b0:6f0:fac:4423 with SMTP id gt14-20020a1709072d8e00b006f00fac4423mr16262553ejc.310.1650909202965;
        Mon, 25 Apr 2022 10:53:22 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id bm6-20020a170906c04600b006e89a5f5b8fsm3875338ejb.153.2022.04.25.10.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 10:53:22 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        Jernej Skrabec <jernej@kernel.org>
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner clock fixes for 4.18
Date:   Mon, 25 Apr 2022 19:53:21 +0200
Message-ID: <1741873.TLkxdtWsSY@kista>
In-Reply-To: <YmXPemmFqfcj4p/p@kista.localdomain>
References: <YmXPemmFqfcj4p/p@kista.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dne ponedeljek, 25. april 2022 ob 00:30:18 CEST je Jernej Skrabec napisal(a):
> Hi!
> 
> Please pull following changes for current release.

Disregards this, I missed one more fix.

Regards,
Jernej

> 
> Best regards,
> Jernej
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/
sunxi-clk-fixes-for-5.18-1
> 
> for you to fetch changes up to b4f3d5f06e29b7020f19cc788b2c2de750e888a1:
> 
>   clk: sunxi-ng: sun6i-rtc: Mark rtc-32k as critical (2022-04-24 23:22:46 
+0200)
> 
> ----------------------------------------------------------------
> Two clock fixes:
> - missing sentinel in device id array
> - missing critical flag for rtc-32k clock
> 
> ----------------------------------------------------------------
> Samuel Holland (1):
>       clk: sunxi-ng: sun6i-rtc: Mark rtc-32k as critical
> 
> Wan Jiabing (1):
>       clk: sunxi-ng: fix not NULL terminated coccicheck error
> 
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> 


