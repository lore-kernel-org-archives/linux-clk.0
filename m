Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0DAE8FDC2
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 00:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239203AbjJDAbd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Oct 2023 20:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239117AbjJDAbc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Oct 2023 20:31:32 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FC99B
        for <linux-clk@vger.kernel.org>; Tue,  3 Oct 2023 17:31:29 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5347e657a11so2548260a12.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Oct 2023 17:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696379487; x=1696984287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Qd0XvFZtCnhjNqi7/qhEELkHRvsFwfJrMU0NXf13IA=;
        b=Y+UX1RHaB7qqaAKWlHgKkbxp/X9/onvY/8G/pCMYYsGwXq+jwWRSNy0tz1/47N2BXX
         bpdSL403WZtNpMwgBB1/jsR+kXYa39sjhO7RVrfHEyLfLG2LsTlpzUSMSVJVA/GeIBs3
         lRHyPHV1JtAu63fMCKjWJkrwKvrFjHSG1xSvOe5olGkziWXt91nISVX3WlXxxi+VgD9Y
         BOHEruv9CQAERRy3AKFyCNvMmNbuTxdtJFTgFocGiXYTOVujBBWi3fWwrKY+Mqo5x2rV
         ff4ehLX8CNoF7WRUgg7nUbEoUrV0KMhA2uklTMDaes/s3TcN1e+Wx1lgzptzKgaJssLg
         TWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696379487; x=1696984287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Qd0XvFZtCnhjNqi7/qhEELkHRvsFwfJrMU0NXf13IA=;
        b=ZTI/2zqixx2rQu9StQnrFM2Bo+pQIVnqnSbvQh2oZlevrdAeeawVmShlSgLiCO/+qx
         L7WdIQz9PZICxEHLzvupP8x2NQjXsd7dR2JE7Guj4KOKIe9KTBY6InyzNdDLIvhT+h7c
         X6RVkejzRkFPBF98KcSPjcXXJlaTTRBGp0lp2eaDKDlXG3n9M8eEbYG+nGEQYr15U1GT
         1syH4gglORdkrhdJCGIDWoksYRifK+AY8PdWsdkwx4al8P0Pn9f2GNoVceLAf92mBscp
         uoh2pvhdYBvJOcMPKqZ1I/XZIyZnwtzDMh7c6cVQ7O4xbc1QYas8a+EYOQaBlrtwNKN+
         Y6vw==
X-Gm-Message-State: AOJu0Yy9uSeE5IyQ2x1XlZKtg2dBQL6ry149CL/AZxtaQEx8Kzel87Y2
        nriekGYBFnYo1ptEu3qyM/yZHQ==
X-Google-Smtp-Source: AGHT+IGgOw+KKnQkv0lbmacveyuE26amjk0smzsNyHfmaKinFgyepdVzf6ui+/+RR+BxAV/eMTj1eQ==
X-Received: by 2002:aa7:d703:0:b0:530:bbeb:571 with SMTP id t3-20020aa7d703000000b00530bbeb0571mr646676edq.36.1696379487071;
        Tue, 03 Oct 2023 17:31:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u15-20020a056512094f00b005056e8bebb8sm366937lft.124.2023.10.03.17.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 17:31:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH 0/2] clk: qcom: provide alternative 'parked' RCG
Date:   Wed,  4 Oct 2023 03:31:23 +0300
Message-Id: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Implement an alternative for the clk_rcg2_shared_ops, which also
implements a proper is_enabled callback. Note, to use
clk_rcg2_parked_ops one must remove XO (safe source) from the
parent_data and parent_map.

Dmitry Baryshkov (2):
  clk: qcom: implement RCG2 'parked' clock support
  clk: qcom: dispcc-sm8250: switch to clk_rcg2_parked_ops

 drivers/clk/qcom/clk-rcg.h       |  1 +
 drivers/clk/qcom/clk-rcg2.c      | 34 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/dispcc-sm8250.c | 10 +++-------
 3 files changed, 38 insertions(+), 7 deletions(-)

-- 
2.39.2

