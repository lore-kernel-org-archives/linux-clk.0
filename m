Return-Path: <SRS0=2J+f=D6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A5AC4363A
	for <linux-clk@archiver.kernel.org>; Fri, 23 Oct 2020 13:19:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A6AA221F9
	for <linux-clk@archiver.kernel.org>; Fri, 23 Oct 2020 13:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z/wgNcMV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464428AbgJWNTd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Oct 2020 09:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464424AbgJWNTc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Oct 2020 09:19:32 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4EFC0613D2
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2020 06:19:32 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id h6so2059692lfj.3
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2020 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gkX+2gUi+v8i47aSHUAizP4Ds7j6F45LzqwxJroTws0=;
        b=Z/wgNcMVhdp16LL6ZQWvlDZnxOeAJfCVSNOty5uKbdAEduIs6JIxbsHZjQGYzEj6l3
         jkeG3UWtq+oKNGjCG9KbQ3Urh1wRg0MhHk7Fh2zYs04JRPYhJYyrXSLPHYs20OVMxavl
         3YPCChAk4MYNJlbg3JjhmsQwJdWz7/ZmuLfiLuaIGsd5cWraWsbvT5CJMt8ghcffBWtb
         EZXtNnvx5aSGkmQgzBt2Dk0VVnL7v81RhtonwfPXAyhOYNnNy0crJv0jAa78+5xNrYjK
         SH1jU5oVP5lmL7lqvkuGR0tjyMBk0gAk1xJ2wN05kYTqppe9nnIugZsqpKVB7uyQPlir
         tlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gkX+2gUi+v8i47aSHUAizP4Ds7j6F45LzqwxJroTws0=;
        b=CHvRS05kWZCSALZSqQJ3poKUiW/a3RT/8uLanjnD33eqONlkUeM1DOWkobRqz10U+A
         NQ8hcgRC/SXKYHI26/ZN6FcXyFWC9pKpQ/EkAEUVue6FqgeR/Kcq3BKsn01NYY4daovk
         bPI1mBuF1sLu0aRxsSCo/gtIq5qKMI7O9wezkdUDwVIRlMDS80Jx0ITPg2U/8zZHiqHU
         wTvFdT23+X9f9zviYkI6FUUBBG+mdUrxsRi+2OBprscuJvQO0YKbhtQ/fvw1mRHgwODL
         RnxeCJX80hgT5m9b51+da0B35IeqRp1dtXIMEhEavQy2xWKNmssB3RfY53L8aWhqKNjG
         +uqQ==
X-Gm-Message-State: AOAM530jeVYO7mQzX12pxQNI3p6guWA7hzMkJT6AlqSpoWUoFwKpZISg
        hhPLHvgegxZv602z8aVyrd400A==
X-Google-Smtp-Source: ABdhPJwKRS1l0bWn+x3x3WMk7PvtBibC5R1oMkR5S6y7F7XYMl6I2GvcgR+rbri7PKkeVqIUDRgk0A==
X-Received: by 2002:a19:c8d6:: with SMTP id y205mr715023lff.293.1603459170604;
        Fri, 23 Oct 2020 06:19:30 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id o22sm161564ljg.122.2020.10.23.06.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 06:19:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] 
Date:   Fri, 23 Oct 2020 16:19:20 +0300
Message-Id: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On SM8250 MDSS_GDSC (and the rest of display clock controller) is
supplied power by MMCX power domain. Handle this link in GDSC code by
binding the power domain in dts file.

This patchset depends on [1]

Changes since v1:
 - Define fixed-regulator-domain regulator using power domain
   performance state for enabling/disabling.
 - Rework to use new fixed regulator type (fixed-regulator-domain)
   instead of controlling power domain directly from gdsc code.

Changes since RFC:
 - Fix naming of gdsc_supply_on/gdsc_supply_off functions
 - Fix detaching of solo gdsc's power domain in error handling code
 - Drop the dts patch, as respective display nodes are still not
   submitted to the mailing list.

[1]
https://lore.kernel.org/linux-arm-msm/20200927190653.13876-1-jonathan@marek.ca/


