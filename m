Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED73CCA486
	for <linux-clk@archiver.kernel.org>; Tue, 19 Jul 2022 04:48:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbiGSEsQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Jul 2022 00:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234295AbiGSEsN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jul 2022 00:48:13 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F203337FBD
        for <linux-clk@vger.kernel.org>; Mon, 18 Jul 2022 21:48:12 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id w6-20020a056830410600b0061c99652493so5688341ott.8
        for <linux-clk@vger.kernel.org>; Mon, 18 Jul 2022 21:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HCRXTbgWmGWCrtfF1/wxrO6LVa1/UB+3ITVhXItZBKQ=;
        b=WKWjDptw1ODLxsIcyhHWRYBO3IV4e2n282ExiNANC27yzmqNV6RFel7iRKQsAr7mFJ
         TCQ0N4Fw/c3ebjTKEY2/9esb9rskDABKgROj0QJ+KPNv8GCqWvutBccaw+Qp9ajwaYgb
         crHT3vtmHJ8dQ6qxMEtRtSKSgEG7HMrpJ14eUx3l/TLSya4HJF6OGWc4nygLi2RWSU7v
         0gyiDZKNQbjOArLPUguk04vNguByTU7fVS+ETX8hfEuyOGXOPfnGhIkSxcVU8TNgnhF9
         syCabeWGR9G8CwhLEW1SRsRqrPeF3GcL19TABsycAZHfjMrLX0NLmLx6tE+s3Y+OPIZD
         RPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HCRXTbgWmGWCrtfF1/wxrO6LVa1/UB+3ITVhXItZBKQ=;
        b=TxOupqad/ba6iHsbzdMJRAf0CRhprFwFO1cn91Cvdo+KT1v6q2dwpdMauBW076MFNr
         tyzyulewG+zn6ZL24/QvgXt3q0H+MXvDPdyVipYBuCyc/MEe2HtuXWgLyXSx9HV/u14y
         gJeYPRZgo0Rg6scx+aAIeXlTx++q88fUOVL5rj4QWrL3dOqXbPenJuGjfMQxb7EZZNlU
         wdEGjh9HgfHfNB6tdgCjIsl6Q3uPuM7pFt0cYdoqt89s2M7UB3noxALcMuUt5h+TT7+O
         Mh1WJ0r2yJjQfNheL3WmHHwS5r+BQhdDHaZqGAaT8E2bZK19iU37i2XctKVp9UTMBzDu
         cuXw==
X-Gm-Message-State: AJIora/+4KF0NanHsRdhxWb+i9JWZCFfuWckhPGPiBSg5glFssVD32Ax
        EH+4zz0Q1T8lsMiJmL0ixgmxiw==
X-Google-Smtp-Source: AGRyM1u9ajUSBuR3urB/e0EsuyzDadR/9DSUOquZD2pdRw7dhPrGBe46kge5VtDBlcFLg57OsLLnuQ==
X-Received: by 2002:a9d:2663:0:b0:61c:7ef9:c117 with SMTP id a90-20020a9d2663000000b0061c7ef9c117mr9493391otb.170.1658206092643;
        Mon, 18 Jul 2022 21:48:12 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w9-20020a9d70c9000000b0061c9bbac1f9sm2803209otj.16.2022.07.18.21.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 21:48:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     konrad.dybcio@somainline.org, bryan.odonoghue@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] clk: qcom: gcc-msm8939: Align clock frequencies with downstream driver
Date:   Mon, 18 Jul 2022 23:48:00 -0500
Message-Id: <165820608071.1955453.7214407601083794736.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 12 Jul 2022 13:59:16 +0100, Bryan O'Donoghue wrote:
> The gcc-msm8939 driver is a copy/paste of the gcc-msm8916 for the good
> reason that msm8936/msm8939 are an expanded version of msm8916. Reviewing
> the qcom driver though there are some obvious missing/wrong frequencies
> which a simple side-by-side comparison can show up.
> 
> This series captures that side-by-side and transmits into updated frequency
> tables.
> 
> [...]

Applied, thanks!

[1/6] clk: qcom: gcc-msm8939: Fix weird field spacing in ftbl_gcc_camss_cci_clk
      commit: 2bc308ebc453ba22f3f120f777b9ac48f973ee80
[2/6] clk: qcom: gcc-msm8939: Add missing CAMSS CCI bus clock
      commit: 159b2f59d65b4d34e225ef8d96ed290a13610d9c
[3/6] clk: qcom: gcc-msm8939: Fix venus0_vcodec0_clk frequency definitions
      commit: 680b86da10a23268b24d65b567830824075eb151
[4/6] clk: qcom: gcc-msm8939: Add missing CAMSS CPP clock frequencies
      commit: 2c37d70c82e826e44163ab2c83f8b7b81e7db35a
[5/6] clk: qcom: gcc-msm8939: Add missing MDSS MDP clock frequencies
      commit: 2573f7d8629afc1d2c5f841b8a2b2359396a5e77
[6/6] clk: qcom: gcc-msm8939: Add missing USB HS system clock frequencies
      commit: 873b98538491feb0b0548ea1a8ee054fcfe0d435

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
