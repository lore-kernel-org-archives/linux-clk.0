Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F79DC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 20:03:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240927AbiF0UDm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 16:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240880AbiF0UDj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 16:03:39 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F386F1C930
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:03:31 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-101cdfddfacso14302320fac.7
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vpytQ6IK3LHhv1gnJRGgBJvht4kouE8pWXZhbVPUcoY=;
        b=clXRi9J22KR7Q0WCcsYy2KqJO2ZGNtEKoTBgEOMW5FF8/RWjDwlP/k6s1znA8vuM+l
         pASvlDtgxxdZzk9vLYn6JRnCH3/PE9yssitL2G+aNpM+ooA/aZds8m1rTr50+3EvnbdR
         t0yliaqVPs+WCS3g7SPbdTwTHG40Z3oIQHWZjMxiU3J4V+a997yfki1XnfrJqfO6sa3Q
         H1QjKvDB0C3Q1lrlR1ovhHgELQwpFiWfSzGv4ljYaqS4vYGsnGEwG/h2Rj9z7y0qMhuo
         EBCu14TgDgHuE3up7YMTThQiZGSQ9iDjAzGGB3qkUx025MUr7i0IP0amfJApl3jBS7nk
         8F/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vpytQ6IK3LHhv1gnJRGgBJvht4kouE8pWXZhbVPUcoY=;
        b=O9Egf2/Ab24q+2L4bPsQcispXt5IcuCLTMPxTzkITQeYFzkxcxNYYvqSPysXrIPwt3
         FhscptnWlBjG65VFyJIUYmISMPhMOztVOygr07HEz9K3wzBaaKuYxHKU6//lbBslLO69
         fS6SVcuT9MaPyk0U00pipK/2uDF4a01kR5xdXuMeLvMaewZtsnqoEa9rnwBa/Ht/b1Av
         ENrBjjbuvgQoQ+pgCXtwYn+9LttMzCsbil06BwpzdZj3Dq7liX0d2Z4ashOj3L82eXdG
         RhuSfmO7/GUJ6hNBqeyCFJCOd0okCMlLDLfaq1M/OYWUtmJgLCw+vkB0ZK2xThGMWcFH
         tLLA==
X-Gm-Message-State: AJIora9h/BLkxvPwhYS//ycYGsCNHxlwNrKCZ8hYfNoXe7n0d88TCVuZ
        pYXbN9GZUAuRmb0DinRALeqzQQ==
X-Google-Smtp-Source: AGRyM1t/ko3nXIIJekAtfb3y3tIJhPzmV3xURO/JpEzJOfDPMA5uFaoaOJhjRiTroOL/4PprSn3dNA==
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id z3-20020a056870d68300b000deeaa23550mr9209074oap.253.1656360211620;
        Mon, 27 Jun 2022 13:03:31 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 0/3] clk: qcom: gdsc: add support for collapse-vote registers
Date:   Mon, 27 Jun 2022 15:02:50 -0500
Message-Id: <165636016350.3080661.13379016019370183937.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520100948.19622-1-johan+linaro@kernel.org>
References: <20220520100948.19622-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 20 May 2022 12:09:45 +0200, Johan Hovold wrote:
> Recent Qualcomm platforms have APCS collapse-vote registers that allow
> for sharing GDSCs with other masters (e.g. LPASS).
> 
> Add support for using such vote registers instead of the control
> register when updating the GDSC power state.
> 
> Note that the gcc-sc8280xp driver has not yet been merged. [1]
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: gdsc: add collapse-bit helper
      commit: e73cb8527c597598599119fcd9c7d1752d9e9fd7
[2/3] clk: qcom: gdsc: add support for collapse-vote registers
      commit: 77ea2bd72da4f61f59ad2e839babe83849f35dea
[3/3] clk: qcom: gcc-sc8280xp: use collapse-voting for PCIe GDSCs
      commit: 8d114b94fc39210b88b203b57aaf04836a87a4f0

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
