Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C51CC001DF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jul 2023 08:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbjGYIXP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jul 2023 04:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjGYIWz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jul 2023 04:22:55 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CAB2E42
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 01:22:54 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fd18b1d924so41454035e9.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 01:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690273373; x=1690878173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdUCXMgeSh/e7vUp6LXwSvS294020VAeURwsafwe5mY=;
        b=zewfZn1lgSGCtMac0cb0QTt17/YQzq3Qxy5/NyDN6Jxhv0BYN6IjgYjE3iKWEGfgTC
         BAGNmz9KPlbuNwOClX+YugEEJAKaTdF7DxSNr47zaJkOk71ABdOxU2y5c5hucHAoM+3A
         HpdhsA67/VWyCsLsPUQb4Fc1E3toqXDGq4XnL5jqdLMVXxMi+j0v2uJ4rkUgA+zM7q7d
         Ps6NSRUQIXZ89FMz7McJe5kNltevsWDx0eAtMa500WAh9PFLkbRdL7wu49rRP8Be7SlV
         72TVXjrYeYUOGTQ/dXEO1jlOvPFsXh4EDD0Va/qIVc4TTOkUAtCBSLNAIvUZ1GvL4NAj
         0sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690273373; x=1690878173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdUCXMgeSh/e7vUp6LXwSvS294020VAeURwsafwe5mY=;
        b=Pa1wpnwnZDuy9Z1PwIHJvoIEgUo/tPHjvNmkgv5NMNMv+3u+0GtNZzAfuY2SkFiyiv
         k2oQF9hywhKIu5BRClSlFAky2VWI5GIdgwF+dsEWnHNHi2OygLTcdo585B6JKpfjE2py
         xn6vJSfF/uT2HNklI10jEAGCDtVUnHKv4SPulwJEz+xpyyCXKLZiHtWPSqrdK3YqS0Mo
         1/iWbwA9N58xYw3lkasudk3k/1bc8KrhOR5bolVZJiac7zz98H9ekIWsRbOYfjXaeSBn
         8aPi33+rb6wG9kQEPbSmdZBix4kCuZg8ecch4EP6nyUntwC7YpqJeoWhcsQQbelVJbhX
         Jhaw==
X-Gm-Message-State: ABy/qLYtYQ4wpvf9PRacR4hy76PlDX5hup1TPS9ferfF3I9uT/7fV7wW
        ds+ZnPtV4m9AkzknohJ1nc/yow==
X-Google-Smtp-Source: APBJJlFpKzmP8Mc/lYAPXZUrjT7eauHxjqmxm3ki5r4f5DwPhUUeygbRq5Vju2w0VYKXR2TcxqydGw==
X-Received: by 2002:a5d:4ccd:0:b0:313:e9dc:44d5 with SMTP id c13-20020a5d4ccd000000b00313e9dc44d5mr7534884wrt.61.1690273372745;
        Tue, 25 Jul 2023 01:22:52 -0700 (PDT)
Received: from hackbox.lan ([82.78.74.213])
        by smtp.gmail.com with ESMTPSA id h4-20020adfe984000000b003175f00e555sm5626138wrm.97.2023.07.25.01.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 01:22:51 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     abelvesa@kernel.org, peng.fan@nxp.com, sboyd@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, Jacky Bai <ping.bai@nxp.com>
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: imx93: Add PDM IPG clk
Date:   Tue, 25 Jul 2023 11:22:41 +0300
Message-Id: <169027334139.2407862.12498824418000888053.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628061724.2056520-1-ping.bai@nxp.com>
References: <20230628061724.2056520-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed, 28 Jun 2023 14:17:22 +0800, Jacky Bai wrote:
> Add PDM IPG clk.
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: imx93: Add PDM IPG clk
      commit: 2fe182dd2783c870cb21f20732ff62f9cbb2451a
[2/3] clk: imx93: Add PDM IPG clk
      commit: 3ea570486039a12bb9dcbec977c70390b3d3c902
[3/3] clk: imx: Add 519.75MHz frequency support for imx9 pll
      commit: 07ba6d1ae524c627ac55bb98d5610d4fc44d3fe7

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
