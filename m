Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84839CCA481
	for <linux-clk@archiver.kernel.org>; Tue, 19 Jul 2022 04:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbiGSEsR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Jul 2022 00:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234493AbiGSEsO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jul 2022 00:48:14 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272463A4A4
        for <linux-clk@vger.kernel.org>; Mon, 18 Jul 2022 21:48:14 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-10d4691a687so14005220fac.10
        for <linux-clk@vger.kernel.org>; Mon, 18 Jul 2022 21:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+gDA2XB5R39MlqxFpgVfDWpQW7JF0nBGywVJBLQfYIk=;
        b=Xk4+wYxbsMiHklO6v/G93ogoOWHSq4S8wqUBon1FAzyqULgDZhyi1Jy8xzHJ1rCNmy
         gVDJNrsnNzMXO4DcEKz1mVfwnd69Mk8SsjFmc6jq9EBEngE5b6OJN6WdrMYCfGOzR/uO
         03lBIvZs/hDzWL7IXZyBybJll4LtK29ZAa3Zyk8kNkGqdq+bj0gs0OvFIJIDcyCn54hr
         V2dgFd+hWAmzjwIXuBLucTKpu6Isw931VRA6DO4sE6PWmGYRyESIt3HT1OuTAifPAOOE
         7/iNDFHAmtaVeRj/Nn7mUJNaMEXzZYX3r6s8EN8imIgxgO+F7fkYVGq4R0lZJxSzAvWk
         ibZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+gDA2XB5R39MlqxFpgVfDWpQW7JF0nBGywVJBLQfYIk=;
        b=0h+UNJpQHm8VHS7S5HdCAP9U7Ze32gmAvlhfNNzxZ25oIUzEHoWSXjZAECJCCVl6Ll
         P7FZNH3FXM7ZpooCm7gygnbyKyQGp2gWHhIrySlCTv9S0g6sFFpfSdikyfX9BaDf1mnu
         bYN0M4XMPU9uA4mlVnk7sE+ZfSZ3ypK16kPXtieYCv6BkVQb+pa4Z9kWlkdyoAA3kG/w
         norzQfyQxfKviyVc2s9pGeiEf2d15v3hvhva8H6SZkRTVsIPA8VXSDbmTXr6SrPrKfPS
         WiTzPQ33GwQtBN8fxijvQg+mynCb+m0X8OKQ8OMG2+0i9VE19G5M3x4PvOD7/ORn+PnG
         sYFA==
X-Gm-Message-State: AJIora/ZDWrVrFg960x2cFqww3O9OfRaOoHyuA2rlVbnXEPfzRovsNwi
        vwxB7eIHRWh3is7wzLgLBD0ktg==
X-Google-Smtp-Source: AGRyM1tB4hUDkaP0vW8AbHY/0A3mWlus3kjVRO25yTAPLSnkefKF0zvrFSyBwFTw36+4KTdrrJPJnA==
X-Received: by 2002:a05:6870:ac14:b0:10c:1d60:d4d2 with SMTP id kw20-20020a056870ac1400b0010c1d60d4d2mr18934764oab.58.1658206093662;
        Mon, 18 Jul 2022 21:48:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w9-20020a9d70c9000000b0061c9bbac1f9sm2803209otj.16.2022.07.18.21.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 21:48:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_tdas@quicinc.com, mturquette@baylibre.com,
        Andy Gross <agross@kernel.org>, dmitry.baryshkov@linaro.org,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] clk: qcom: gcc-msm8994: use parent_hws for gpll0/4
Date:   Mon, 18 Jul 2022 23:48:01 -0500
Message-Id: <165820608075.1955453.5936899759101029858.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220620080505.1573948-1-dmitry.baryshkov@linaro.org>
References: <20220620080505.1573948-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 20 Jun 2022 11:05:05 +0300, Dmitry Baryshkov wrote:
> Use parent_hws for two remaining clocks in gcc-msm8994 that used
> parent_names.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-msm8994: use parent_hws for gpll0/4
      commit: 5e1e12d2992006a4e950ebf2e2a1f0ebaabd969f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
