Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E4BCCA482
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 20:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240835AbiF0UD0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 16:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240837AbiF0UDX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 16:03:23 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA941A80C
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:03:22 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id l9-20020a056830268900b006054381dd35so8176116otu.4
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hcZnuhzt3HYaDmytiX2ksHnj//w4zRWfe3IXUnwjnFw=;
        b=HHAjhCYS1WVFcF0lGEHTQtbfWNuVttQmvCgBZKOet0J5f+hUfxXK4nZf1gXb9cs01I
         CeOpQ5aNDv2J2rywxFTRdOE7VZ1wgsjlRw0SCxn00kk7773k4xjR298VD2AZvWLk5KMR
         bhcq21IO8tjn8G7P6XYg++Ljxg5jw8Drczmj5UFN6CfPWyOdst8zC/K37EY9g81MToz1
         dno/a5n9ENGL9mpxRUpLbqwyCLpUcLzLPkaLElQE8b+EhhkoMMTG+37HGINpeeYZbsdj
         pMK+/FQdlCUvxL4lQtn7D6iGYiRth7xMgpWTrF/OKpBrMwGeUznUUDioaVYXOjB2iKfY
         njDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hcZnuhzt3HYaDmytiX2ksHnj//w4zRWfe3IXUnwjnFw=;
        b=yIyUYNMF2EBBx/kni7mT+Q2PPUVgsrAh2YEeMpjs9LD+89QGlgpCFJMsnjbxFFoP+k
         SW2j6reeJuP8mvmrqpid4e7hRCflHY83TIaqnCPwlaNDVa2Cel6ylxgYOgog1/G0WhU9
         ckf2MF+8KNHmjGqfOfTnodfXZlvDXLPO00xSExj26EKMYWl39Tp6Ng2SWxDB7Mg0+wH8
         gKC6DBZclkMI6/s+70zOaKN+py3YbtiC0YNy+aCUPpgcuc/Yl5dwT08rMHi8sQ8JtceP
         HgVQ0PQMNy9TTUAdX6v0K65M/1pxLZXjbcq0uxTI7OSGbYm5i2XRdEEsQTa7+g+0h/a1
         7tNw==
X-Gm-Message-State: AJIora+ln6G7UgkIvyk/bnlm2FNw1rPyYCOBFYsZohCqTxEyS7LylF1I
        r1H1CDd5SbykRgTJ3jpihO+3JA==
X-Google-Smtp-Source: AGRyM1sE88yRTNZRJxl5JR2p38c65IqpGO41Uq88FeQMZLZcNvhgpaWWcvGvshuW4VQXKldNU8PAdg==
X-Received: by 2002:a05:6830:2a01:b0:606:d153:1ba0 with SMTP id y1-20020a0568302a0100b00606d1531ba0mr6651430otu.35.1656360202020;
        Mon, 27 Jun 2022 13:03:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:21 -0700 (PDT)
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
Subject: Re: (subset) [PATCH 4/6] clk: qcom: mmcc-msm8996: move clock parent tables down
Date:   Mon, 27 Jun 2022 15:02:42 -0500
Message-Id: <165636016349.3080661.14609288184787240225.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220617122922.769562-5-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org> <20220617122922.769562-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 17 Jun 2022 15:29:20 +0300, Dmitry Baryshkov wrote:
> Move clock parent tables down, after the MMPLL declrataions, so that we
> can use gpll hw clock fields in the next commit.
> 
> 

Applied, thanks!

[4/6] clk: qcom: mmcc-msm8996: move clock parent tables down
      commit: 208c564fe66e2f76abb29468d067223eb50b3005

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
