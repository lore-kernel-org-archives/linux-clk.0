Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2268EC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 20:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240840AbiF0UDZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 16:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240807AbiF0UDW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 16:03:22 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C611A074
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:03:21 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 73-20020a9d084f000000b00616b04c7656so6848680oty.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xY1dgKqhnv3kojP2EXoYZ+xUIjzOiuLgDkxMFGR/9jU=;
        b=HTbmj5YgNjQIJRUivUos/4RUsJUepRMWJEfIJmDrZC0LFWwfZaS+y1i1E7YYbWnTg7
         Ht8058hfrXWRoN8bS+tDwoUp2ZwCObMQXOu6388qoaR5QBjWjR3b6aABokO8lCa9lsvc
         0SgHqOKl0nrJBtyrmpFsLS92nSDurclJTB1Blp+TqaxwRiKOL4pcCyWG4joJpXrknogW
         1rdykS57FagzTFiUyqPfDgdYperGQa9WC6TpqoLTmaEG17J499lnSMSUwPpDPy7KCUT2
         H/AZLlUKERC9gV4x/cxggOMYhPeXprn4Jta2MUnWgKnOSCx4tzu7Cgzj4/v1buHXQ0zv
         OHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xY1dgKqhnv3kojP2EXoYZ+xUIjzOiuLgDkxMFGR/9jU=;
        b=VirR7i+Omk4k229b6O9X01cDQMNEn2YczUyhThbehMdAIS/y1oZKbpQCuUyrXTKZPH
         KdmtXcRoHD/KIttGpuaY72BB+sNx5XS1TWIglv8CFsoV6T1IOYe3jBWLlbSTsdoWRdDm
         BDdhP9KXkUMnDghRcGQripGo3N6Kq3CYLeRWlxzg0yrjrrZ+FGoUW24fn9rfa/ZYbOgv
         nhEyvri/jp7JhiE4EN6mZNy2dVb9VWxzSrI3pmsxx6IocQed9rAwtzTe6xtmaEUQawsU
         JRZ89A36l1Wi9o3P7qwADVMZTpGsZEN22fnQcnItGqOquEOCn1OprK8Zl5jk13v6+w2k
         zT7w==
X-Gm-Message-State: AJIora+PtKfAv7txb04jryQEWojWBwg4tRnA5k8xJUfghx1cDx6yrmFH
        D8PWEr8SmagycnhFzBwwW6gHUA==
X-Google-Smtp-Source: AGRyM1uz/LeMT6xt6vCg+wqWPxn+uaJQ6yqDdo4q7FEuAuhLmZQzGkuPm4y94tS1I2FXH1IJqCF3yQ==
X-Received: by 2002:a9d:610a:0:b0:616:cd8c:a671 with SMTP id i10-20020a9d610a000000b00616cd8ca671mr3096278otj.297.1656360200876;
        Mon, 27 Jun 2022 13:03:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 3/6] clk: qcom: mmcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
Date:   Mon, 27 Jun 2022 15:02:41 -0500
Message-Id: <165636016348.3080661.2270128941891514134.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617122922.769562-4-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org> <20220617122922.769562-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 17 Jun 2022 15:29:19 +0300, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
> 
> 

Applied, thanks!

[3/6] clk: qcom: mmcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
      commit: a7a4fc9498f55f3e91f89a19f74e2016c3e7f62f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
