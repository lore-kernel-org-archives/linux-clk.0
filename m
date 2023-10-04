Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B084E7B604
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 12:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242469AbjJDMhy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 08:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242533AbjJDMhq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 08:37:46 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FDE170C
        for <linux-clk@vger.kernel.org>; Wed,  4 Oct 2023 05:37:14 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso392398066b.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Oct 2023 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696423033; x=1697027833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ujoaqTZd1g4Nt2RQJtsj9HWcr4gLmxfF14CAQlkvLU=;
        b=OSrtpFkEc9qdDH6qmNeSj6A7pTVw8k6mMlvmp/G7liQ64togh+Gcm3RCevhqJiU7gT
         zDUnvEeOgmxzgmqTxL29l4cwY4Ro5RiiPIPr0hGoypimceE4pcEkSgWZ/GsQSYLQJ+93
         +/C558bzZIWAxjcwWhgQqQLD+DdWbmNLjl8F0irOdfp3ZMbBVG2rjGDQSDdRIbbZjj1o
         LTycf5awlMrfcv7Axr6WyPHS72JkwHG4FmXTES+9ldIBKxgjTx+eQVp6tQUEC0Muv3P3
         OvtOUim15Auu0CeIsc6VyTsOui0O+ldG0AxLLXmScY3PWCULiZHikIDOZpW2Ekqm/VYL
         3dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696423033; x=1697027833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ujoaqTZd1g4Nt2RQJtsj9HWcr4gLmxfF14CAQlkvLU=;
        b=BT+/1pNReQPGpPSKTG5k2Q+pJVbZ2tCoVOGcSvbKntNfQSoiNrlJ0hwlpm/D2t9CwK
         ZeBnZ8G65B8JD6XDfHlMl2WBC05HZDgvQ69lm0rV+piQtSZi95Df9anWRWJ3tByISnSY
         BFhQlXHOqQ4IdmMKhuUaKWCiH6HyIvOiWgTsfcmBpJ6f8w/dfaVJuT+VLfxfPi5dx9Zo
         Fdb2MaQfWPEAVG3qrL9zOsmqxtaKJwFrNytgBKRtT8WKKMaGyXU7fRdIM9OdpHlFJl0J
         Y+hn5efU3++shTKA5u1QfQJTZtIxy3YESZNhb/Qve/vZgJ7J8pikpid10tdjO+NNU2NQ
         nAxw==
X-Gm-Message-State: AOJu0Yw+2IDmVfx5JRfEcKbPq8D32nXAKnZkQHScChpHpuvdtm+zUThl
        GfBZ7Pg3Uwk0LGgrkcRvwPfhCA==
X-Google-Smtp-Source: AGHT+IHwXMUGlHmxrSjUwpvnWO7SJjwnQE0S7keRLnZgi8Jf2/+sfYEq2aOC8nyVOfAuQC291Lnpwg==
X-Received: by 2002:a17:906:3051:b0:9a5:7759:19c0 with SMTP id d17-20020a170906305100b009a5775919c0mr1839950ejd.64.1696423033291;
        Wed, 04 Oct 2023 05:37:13 -0700 (PDT)
Received: from hackbox.lan ([86.123.99.172])
        by smtp.gmail.com with ESMTPSA id jx14-20020a170906ca4e00b009ade1a4f795sm2721028ejb.168.2023.10.04.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:37:12 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     abelvesa@kernel.org, Fabio Estevam <festevam@gmail.com>
Cc:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v4] clk: imx: imx6sx: Allow a different LCDIF1 clock parent
Date:   Wed,  4 Oct 2023 15:36:32 +0300
Message-Id: <169642294508.713950.12324349089481800725.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815130923.775117-1-festevam@gmail.com>
References: <20230815130923.775117-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue, 15 Aug 2023 10:09:23 -0300, Fabio Estevam wrote:
> It is not a good idea to hardcode the LCDIF1 parent inside the
> clock driver because some users may want to use a different clock
> parent for LCDIF1. One of the reasons could be related to EMI tests.
> 
> Remove the harcoded LCDIF1 parent when the LCDIF1 parent is described
> via devicetree.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx6sx: Allow a different LCDIF1 clock parent
      commit: 0a22b3a6f446223aff5bcdcc06003ef6e412bfd8

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
