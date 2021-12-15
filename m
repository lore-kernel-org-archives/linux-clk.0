Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EA9C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 22:27:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhLOW1s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 17:27:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbhLOW1s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 17:27:48 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1002C061574
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 14:27:47 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id o4so33726512oia.10
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 14:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bld1Dt00srE7jX5jMOg7BAwJ9u0A/uVswTCtlo7qPT4=;
        b=v3/Z4YA1w7OaM3Ln/mKV6ioyWZPM74mMTmt99ZICa/p75vJTmsiZQouvEPIY1wZfCP
         Ef31YSm1xZC2f9eND79xCIiiE2WS5Jk4eaEdvEwTTraSiRdZrpBIlqAjKkRSdMqK5JuH
         9XW/dqluFN+t2cUCXYqLqImYXFZ8vcZjwlLCCY3onjwdnazsZgluBVDQuMHLrh6kdlrW
         g/u5Y9NZGGD3tCXVsi2pyu1F8ev0FTW4uz5VZGwAGKKFdRw5NsuPXGl0HeXTPXQWBSGY
         0MOnjJIrWh8MdkBuUvk3FDvyRBrgLrHWSrW3lpdy3P2Vujh8zJIEMmKQLFQCJh5QEC02
         bYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bld1Dt00srE7jX5jMOg7BAwJ9u0A/uVswTCtlo7qPT4=;
        b=IYBLyChRT9V2kqTI7qtn6qFJaKQ3URT0h+buCvpovn1sGcA7pYVQLC3VGyBHjd1fBh
         lF8t6N1mfHzuwmihfU2JliV6kZdwzIofYl941a1DOjusRy4A+7sgTaTS8hq5lag4Zbej
         XgBzWi1WLDwjVBC+/B7i5mKBX+nq1iQ9Q2Y3YsJ7V/IcHqb/bDY6xgq7Nc2fJvoUGUIR
         pq4/z61EfEiyFe/G0ReAL6KgKpcTh75PJlLzJNK5TiQ5Jh8u55h+0pFpr/dyUhQoHu6U
         hivrgUASKI2W904p6zjTCTkWY4ak9w6Pe3GYX2PveM2wfZ8QBNvleQJMZ1+cjRsyMKNN
         9tmA==
X-Gm-Message-State: AOAM5306ALgGz+1DrWzTl32q1yR3TOENhA0at1wBwVzLZqjX2w81pyw4
        Bz21MZ5qzBKTGAzX9LMENDyfhQ==
X-Google-Smtp-Source: ABdhPJyVgSE3f72HaVlVawNNx0CFaEeE4nXpIHy+ZeOnxtJofO4CF4mIdFgCoaxGst5P+9KqH0FMuw==
X-Received: by 2002:a05:6808:1396:: with SMTP id c22mr1908401oiw.59.1639607267024;
        Wed, 15 Dec 2021 14:27:47 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:46 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Amit Nischal <anischal@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: rcg2: Cache rate changes for parked RCGs
Date:   Wed, 15 Dec 2021 16:27:18 -0600
Message-Id: <163960723734.3062250.10537942428901701374.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211203035601.3505780-1-bjorn.andersson@linaro.org>
References: <20211203035601.3505780-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 2 Dec 2021 19:56:01 -0800, Bjorn Andersson wrote:
> As GDSCs are turned on and off some associated clocks are momentarily
> enabled for house keeping purposes. Failure to enable these clocks seems
> to have been silently ignored in the past, but starting in SM8350 this
> failure will prevent the GDSC to turn on.
> 
> At least on SM8350 this operation will enable the RCG per the
> configuration in CFG_REG. This means that the current model where the
> current configuration is written back to CF_REG immediately after
> parking the RCG doesn't work.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: rcg2: Cache rate changes for parked RCGs
      commit: ce4981ad69145d7444a5cf4fef2e29442aee60dc

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
