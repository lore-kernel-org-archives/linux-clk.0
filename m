Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27518C678D4
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 11:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236427AbjAQLgH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 06:36:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236897AbjAQLfO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 06:35:14 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9DE3367F3
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 03:34:51 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j17so3455192wms.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 03:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dOtBLD3BmLgDknVXuyyEcCcW1/Hd1Je1CK2xnN+N7dw=;
        b=cYUI7kWRPzfM40lojWFFssrJd1VDo6YKklCwcamCeCyXiA3+NVzwe8ZOkm4KEy3WTe
         axurq7RTBH1V7ZcYNnNjQvgDXg9/WvaUF6oEPFUepxx7lq22TwgoTbFyFp+DrRr+jCKl
         722WsWqW/KOnTk66XvbAbEMiMw+zcCBzQgjuNRKuUqWlH91rYdefYViZ4QyqBic7HVz5
         BqieyhK/NBMyb5NdjDDzBzfK9Fi0DwRdtoFvzR9hXY22idTthf+DA36wka7Xg5lyl5em
         +5wqtcx25p61NkuMlcRyMGMV1FoZODuVlO0aQYzYPUVZZ8GupRfmLeM9pU2jDCEfIzYU
         KKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOtBLD3BmLgDknVXuyyEcCcW1/Hd1Je1CK2xnN+N7dw=;
        b=PYZ1FGQeCFnzW+GuLjgGD6IZtNLN9vNL9z8SYPV8NtejntQxZGsmtS7YAW2LNcWjdu
         xmZcC7rgWNMWbUk8xuWK2ZPqiUOovE97RrrC/iYaOx3PjlnJqWXRkbzc1MQC1Z1Zs7K8
         Y6/HtjJWCqVLuLucQcDJHDNndSqgLEWCkDq1Uv1pbEpS7kYKqjDUZbQDYEVOCaPPM3DL
         31p2QR7Na49GIN2VqKhxLbRmLaqFiuqeSVyXMcQUUUSl3lrjGang1BvW3Wt7ieFE7CRB
         LRTZDANMqI4vv63N9fytc7/pCxO5MAcM3RO64I9tiZn1UnJC6sAq4GgfV7U9BYpbEOA0
         c3WQ==
X-Gm-Message-State: AFqh2kp3hHJpl+q84Ux9XfeTcAHNVdJnf0ZhWLvEWshIigSIifWbnmbj
        29oPFVE9I3jVHXjifY57QMKOTpqDB9lx6h+R
X-Google-Smtp-Source: AMrXdXs/NQbLxmf/uwz6dB7ADOPujitc5iXKTWdolbLeC3bKZbaIWPODSElDBtILNMq9agMjrJLHAw==
X-Received: by 2002:a05:600c:1604:b0:3c6:e61e:ae74 with SMTP id m4-20020a05600c160400b003c6e61eae74mr2796831wmn.4.1673955290539;
        Tue, 17 Jan 2023 03:34:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c469000b003d9b87296a9sm44901275wmo.25.2023.01.17.03.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:34:50 -0800 (PST)
Message-ID: <5074b463-864a-1e76-44a9-67ce95d4f1ab@linaro.org>
Date:   Tue, 17 Jan 2023 12:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/4] dt-bindings: mailbox: qcom: add #clock-cells to
 msm8996 example
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
 <20230113090739.45805-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113090739.45805-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/01/2023 10:07, Dmitry Baryshkov wrote:
> Add the #clock-cells property to the MSM8996 example, as the APCS block
> is going to provide the `sys_apcs_aux' clock to the consumers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

