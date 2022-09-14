Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB80ECAAD8
	for <linux-clk@archiver.kernel.org>; Wed, 14 Sep 2022 08:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiINILj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Sep 2022 04:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbiINILg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Sep 2022 04:11:36 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416AA4F1A2
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 01:11:29 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a14so15135891ljj.8
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 01:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=iZWQ5Y5Hi8CWhQBH1f5b8elpMACX9kHtiFs5cgZXWnU=;
        b=pTTW6wt42ZbuGip9KqG9W/2VYWHhw9uRUsEbJ71hITKbzWz8HMrDBeXeN+lTXP9sEZ
         qQoWJEAnxO1ATDIv/Y3BSxD+OBY8UMg3gmoO2spFVBt+Xy7ntJGhAjla8OZh/nP+h0Xn
         lDTGqERssXYy/TcUzunBFj8dLoefb8mF3afS0HGohD6t4l60XchdN0IIHckT44xo8hOn
         JhL/5FQcq9k/9eTq0BLqXU1IXFn9RCGhNgHcObSmv16LIgvQwijupPFm48RCP5iCQ/dk
         lBIoSywTcHRE7mELJet68lYb8ym8aatv0cT0wTFh+bQ8qNnDyGgumgP5DVBCr3p+rowc
         ZH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=iZWQ5Y5Hi8CWhQBH1f5b8elpMACX9kHtiFs5cgZXWnU=;
        b=ZvKIdqDl2I47bKtIOSooOuP3iSoVwKU0FopxfSlFOhsT/rCJ9eJYBPz1rG/7qUVboF
         598vaIJ+65Noj3/CiCcdPOsDT8xPheopOoQRRJfLoegc1OGJWQsKbGDA954c3/0x+FTN
         QViNp1rw2QDTbf0pe3hJcU+uXlk9LeywXQ3/uUW7r1AC36iMAiMzOcd1ObR4pipRFQbO
         uwJ7ELPMG1LpX0cND05ZIu/cqMS15KocyPjDwCUbWf+apHw1y9ibFwBTOs8pkIjZ3wd2
         38YmJzI7mt6Npx5bKnnXcVoiw8c2jzxRaSIbkOH41o+40xSJia3nBJJ9eObo9hnu7P6U
         CbmQ==
X-Gm-Message-State: ACgBeo1E2gsgk6+4AH0TuMq8+wLE9s008ou0xU1nWbGyeqOiuZpkf8fN
        juLvDSJ1fOH8Id59jpiha0zcaw==
X-Google-Smtp-Source: AA6agR7KVYLe94RDe7L+HNI/gTnXhrOM85yrUN8V96og/vOzDi3rBrNsY1d49OC2TJJcwr2NURMcBw==
X-Received: by 2002:a2e:9410:0:b0:26c:170e:e107 with SMTP id i16-20020a2e9410000000b0026c170ee107mr2483758ljh.455.1663143087450;
        Wed, 14 Sep 2022 01:11:27 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id g12-20020ac24d8c000000b0048cc076a03dsm2265290lfe.237.2022.09.14.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 01:11:26 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: qcom,gcc-msm8660: separate GCC bindings for MSM8660
Date:   Wed, 14 Sep 2022 10:11:24 +0200
Message-Id: <20220914081124.350266-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909105136.3733919-2-dmitry.baryshkov@linaro.org>
References: <20220909105136.3733919-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dmitry!

Overall this looks very good, I suppose we follow up with
adding PXO and CXO to the device tree(s).

> Create a separate DT bindings for Global Clock Controller on MSM8660
> platform.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

(...)
> +examples:
> +  # Example for GCC for MSM8974:

I think that should be "for MSM8660" now?

With that nitpick:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
