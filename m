Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F36C64ED8
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 07:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbjB0HiB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 02:38:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbjB0HiA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 02:38:00 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A093783F0
        for <linux-clk@vger.kernel.org>; Sun, 26 Feb 2023 23:37:59 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id bx12so1972618wrb.11
        for <linux-clk@vger.kernel.org>; Sun, 26 Feb 2023 23:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueXbSBiMti51dIYdOz+r11JNrl9KN2K8qIRcNuF9l80=;
        b=KJcIkUAmFDZ2c5PVNUscdRYrHU/NCc2aI6IriXwnntAiesMShzZWsqmcoAnr1aRhqZ
         INooPS8hyaebHPr1bkNi2jO6aj+yd85PXMm60lnTUht9h5wsFgXaEjKEDx6fcWu6nejF
         k2lQmxlVVeKP+tc0w+peMqmzomWpyi5kOJHkZAkeEKD4G/CyVzMX9xiorgDhPeqmY/+N
         kzmefrERPVjpoaXFeEiNuVnDfINVvkj99g1dC1PhznIGFYCvXTC3LSrjDW3mTPyXkiRm
         YA/3lgBncR4sB84Vk99b16aSkPbhoKCRvkq+EgEpndcwo6UicHWNDl/DwTKtcAXT+znm
         te6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueXbSBiMti51dIYdOz+r11JNrl9KN2K8qIRcNuF9l80=;
        b=R6yByAkboODh7x/PSddTKH0ZE3P67LX2SQgutbkC7JHJU66DCB48xv2qdzlskJHvem
         0yZQx89tJTqdEBzGYbUhOgdyBbjNvTuGSXLpJXvdJ5OPE/QLAwpdU97r2Y5YsL0ntY7g
         x6WOk/I6k24Ec28jhkYEoCsdskNhGiP/HCJNr1utJNp8XNrEJxoRNYbM/EgBhV9J//H/
         TF7SlgzrmZ6bN7j2HZ22Ihp8Ay5Dj84sRmeamSDauP1koGzf0O0xs/lkPe/NCLqlkVKc
         BpD6y1taqGQcnVpAOP+w+KPSGlnVOIIZwX//aIXqwV7fDuqG8kDLAbEy3Y3Tfq3eGpj+
         kNSg==
X-Gm-Message-State: AO0yUKVrfeiLGTMQkt3R3qd6asv7U3Hj4cbZlh733eUpMOxG3uT+nFyp
        6eiRIcJGwGenIjFnP4X0ajEK8zDk4qM=
X-Google-Smtp-Source: AK7set8Hy59SjUckywUT/3gRy7Duk+9EmJ27c7Nv8NmlKF8xi00Ha71aQnXUwtXRqY0EZx2sGvVxRA==
X-Received: by 2002:adf:f5c9:0:b0:2c5:5886:850d with SMTP id k9-20020adff5c9000000b002c55886850dmr23378350wrp.5.1677483478081;
        Sun, 26 Feb 2023 23:37:58 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v14-20020adfedce000000b002c7b229b1basm6302409wro.15.2023.02.26.23.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 23:37:57 -0800 (PST)
Date:   Mon, 27 Feb 2023 10:37:53 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     claudiu.beznea@microchip.com
Cc:     linux-clk@vger.kernel.org
Subject: [bug report] clk: at91: clk-sam9x60-pll: re-factor to support plls
 with multiple outputs
Message-ID: <Y/xd0XWhhp/bBkwY@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Claudiu Beznea,

The patch 43b1bb4a9b3e: "clk: at91: clk-sam9x60-pll: re-factor to
support plls with multiple outputs" from Jul 22, 2020, leads to the
following Smatch static checker warning:

	drivers/clk/at91/clk-sam9x60-pll.c:672 sam9x60_clk_register_frac_pll()
	warn: passing zero to 'ERR_PTR'

drivers/clk/at91/clk-sam9x60-pll.c
    663                 parent_rate = clk_hw_get_rate(parent_hw);
    664                 if (!parent_rate) {
    665                         hw = ERR_PTR(-EINVAL);
    666                         goto free;
    667                 }
    668 
    669                 ret = sam9x60_frac_pll_compute_mul_frac(&frac->core, FCORE_MIN,
    670                                                         parent_rate, true);
    671                 if (ret <= 0) {
                            ^^^^^^^^

--> 672                         hw = ERR_PTR(ret);
                                ^^^^^^^^^^^^^^^^^

ret can't be zero.  I don't know how this is called, but my guess is
that if "ret" were zero then "hw" would be NULL and that results in a
NULL dereference in the caller.

    673                         goto free;
    674                 }
    675         }
    676         spin_unlock_irqrestore(frac->core.lock, irqflags);
    677 
    678         hw = &frac->core.hw;
    679         ret = clk_hw_register(NULL, hw);
    680         if (ret) {
    681                 kfree(frac);
    682                 hw = ERR_PTR(ret);
    683         }
    684 
    685         return hw;
    686 
    687 free:
    688         spin_unlock_irqrestore(frac->core.lock, irqflags);
    689         kfree(frac);
    690         return hw;
    691 }

regards,
dan carpenter
