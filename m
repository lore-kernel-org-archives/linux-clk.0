Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0EDC4332F
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 22:28:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbhLOW2j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 17:28:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbhLOW2L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 17:28:11 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237EEC06137C
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 14:28:08 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id n66so33685163oia.9
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 14:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aDH/YWWKVjZlLQyZIFy+0zDo05Gsdaj6wljJxBa+2jc=;
        b=MPWCz68OrRpvSst+iVdfMyq6jg48qRuzBcPfo2JGINrzbqvA6sELJlpGwXUW/vA2Az
         /SLeUiByRI43dndlScquJaC/mEDGTmewmS+UMgxPH6p4UZ5ubj1P82SvFAiXxsdTTRJM
         uuP8o/wywTmp25wdDrkMFNnRiw6qxK9ElcL104NRPxeI58XgWR5HHQaN0aPnSy/viZVx
         m8YL0VtE41F+3KBFlBxSUryV31RO8RCEqtss/ytE+2nCR0qv4kK63Bf/JdpM/Sq1kHeM
         iZbr8dOHQey6enZXHTW719V9/sgNhOKYRd0XlfNTaFP17UVARg0vuHvTN4xPvGBzPO9X
         sohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aDH/YWWKVjZlLQyZIFy+0zDo05Gsdaj6wljJxBa+2jc=;
        b=V+pPotr5E9U6KCytAx5ehs1ygTo9qJJ9UjmigdgzS0WJHMasmyMiS2KlIbgVaknN9U
         IJVZ1o9tvDe5fVz0VyPruugp8ncCJ+8Ma4h8i6i6RteITgj6tl5CkUqyFtPnv1AfOfL0
         ztU0WxuPZkJ0VtZpqr6geWrDWYZk7VcmmNHNMhOkfmnJfZJL08MYEpAi6a7h39LALJ2l
         j4fXmBmaZm01ZYKK6hrjNhxIi0p4EthlARnOizCYu0IWTTc+EzboVy8OG9Dhyv3ztBZk
         XiJbNf/FhE7Xet/STHVNPb3+C9u/zpySP1sd5AB00JL9vyhGKFjUBTCKA/w+1rhQfaXE
         wseA==
X-Gm-Message-State: AOAM5303TogiEW/NgmaIfvehTufL1ZcXVEY0MORAqYYS2aYikoFKDv0b
        vwjHl/vLSSW9XyxK1SlQHPzmGg==
X-Google-Smtp-Source: ABdhPJwJdbwMVlL/jXVTrqrq59MY54DlXVcNCPbgciPrF48scJIoEnZ465spYSOB9vjt8inpfiE9Mw==
X-Received: by 2002:a05:6808:1396:: with SMTP id c22mr1909525oiw.59.1639607287547;
        Wed, 15 Dec 2021 14:28:07 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:28:07 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vamsi Krishna Lanka <quic_vamslank@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH v2 2/2] clk: qcom: Add clock driver for SM8450
Date:   Wed, 15 Dec 2021 16:27:40 -0600
Message-Id: <163960723735.3062250.17177131067279462625.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211207114003.100693-3-vkoul@kernel.org>
References: <20211207114003.100693-1-vkoul@kernel.org> <20211207114003.100693-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 7 Dec 2021 17:10:03 +0530, Vinod Koul wrote:
> This adds Global Clock controller (GCC) driver for SM8450 SoC including
> the gcc resets and gdsc.
> 
> This patch is based on initial code downstream by Vivek Aknurwar
> <viveka@codeaurora.org>
> 
> 
> [...]

Applied, thanks!

[2/2] clk: qcom: Add clock driver for SM8450
      commit: e855145c5325c14b928aff439a0e2bc089e6a513

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
