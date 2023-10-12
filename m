Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863FACDB46E
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 11:31:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347184AbjJLLbL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 07:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347164AbjJLLbK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 07:31:10 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA06ACA
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 04:31:05 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40666aa674fso8754165e9.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697110264; x=1697715064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CnuoW+FQCD/OpcgflvSx0Oe2LZM8hD2I1654SS3PYOc=;
        b=pPD4LXApcviScq+lACrJ/cbam//ID6+iVyoZoX4FtxOhp3C7nJT4HCP3UnKwCotz0I
         dzdYR+4pyFKwBJzv/NsyetIGGGrxP3dAaB84Ufkp8bxYsbaoulAb7tQDLj5ws4q+d3WH
         yKw6sK/R7IkKy19lKVmWqHdHqFuOyP52SP+bTZ+hb5uSNyB6aNqkTsookAvvSU51dT4y
         RdU0g6ls9hO2aucYbyfgthNx4TMfXQkv73SrML8wjqtaLlSHanSbWcBe/FmHKaIAzgu4
         7uCPoeVG3/3BN7nOvmTCQAXu2VNU72aTfwtGCFhMy9nDZpEgUWKp5+F8rkV7Ytwbgx7Y
         zlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697110264; x=1697715064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnuoW+FQCD/OpcgflvSx0Oe2LZM8hD2I1654SS3PYOc=;
        b=RDfvMv2wJbkOJivJIlRvk6c5FE5aUHuI9jc3NSb9soN98fSkCdGdDlxYAsWZglgJeR
         tsz38VANZHLY+B1ojiBxBU1UKIGM2Gkv1R4IgwLb/cMCupDFTCeJsskKFzEPLIPcduAh
         4xk3Ph8wjk3P0k4XN1bKkSCa1N9ibVYgwMk4H13hn7JVaFWoVkvxVbbgUC2qu2jhenCC
         UzJeOXLmXlqBIa7C2/J/5sI7MUvNYfNjqG1eLks2xdGA2RvIf4bvcO53oDCCPWXKa3P5
         xV73K4ylSFrnVEU+/YmVRz10cU6iOBNGucbWQA+lEJ0CerVLt8I67IyxkrToP3LlzyZn
         aitQ==
X-Gm-Message-State: AOJu0YzWMO7iqTVssbvSDsyU7T+pXRKto4HJFzZVGigC4x3bI3LsvrQ3
        wmPztiBdEiLZ2cNHddZjjsscLQ==
X-Google-Smtp-Source: AGHT+IGBdXRT0UtMVp+RpimAXsw2HQh3MU7GuKMfnrtGP6iY7VsQcYh19478v3IKMkocVBje2WrYow==
X-Received: by 2002:a05:6000:250:b0:32d:825b:e7da with SMTP id m16-20020a056000025000b0032d825be7damr3858653wrz.41.1697110264167;
        Thu, 12 Oct 2023 04:31:04 -0700 (PDT)
Received: from x13s-linux.nxsw.local ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id l14-20020a5d480e000000b0031c5e9c2ed7sm18244891wrq.92.2023.10.12.04.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 04:31:03 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v4 0/4] Add sc8280xp CCI and CAMSS core dtsi
Date:   Thu, 12 Oct 2023 12:30:56 +0100
Message-Id: <20231012113100.3656480-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

V4:
- Adds RB - Krzysztof
- Drops indicated newline - Krzysztof
- Moves "This patch depends-on" below the "---" - Krsysztof

Link next:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-10-10-sc8280xp-camss-v4

V3:
- Expands description of ports to clarify mapping of port to CSIPHY
  Rob

- Adds the dependency link into the commit log of patch #3 - bod

Link next:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-10-10-sc8280xp-camss-v3

V2:
- Drops specific sc8280xp-cci compat - Konrad
- Drops minItems where maxItems are equal - Krzysztof
- Uses suggested description for CAMSS - Krzysztof
- Leaves indentation of ports/properties - Rob
- NoISP. Supports bayer encoded upstream currently only - Krzysztof
- Endpoint. Adds an example endpoint - Krzysztof

Link next:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-10-10-sc8280xp-camss-v2

V1:
The sc8280xp provides a standard Camera Control Interface and Camera
SubSystem hardware interface similar to antecedent parts sdm845 and
sm8250.

Per the target segments for this part, sc8280xp has more of everything.
More CCI, VFE, CSIPHY and therefore more interrupt lines and clocks to
declare.

CCI x 4
CSIPHY x 4
VFE x 4
VFE Lite x 4
CSID x 4

Bootable 6.5.y x13s:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/lenovo-x13s-linux-6.5.y

Linux next:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-10-06-sc8280xp-camss

This patch depends-on:
https://lore.kernel.org/lkml/20231004161853.86382-2-bryan.odonoghue@linaro.org/T/

Bryan O'Donoghue (4):
  arm64: dts: qcom: sc8280xp: Add in CAMCC for sc8280xp
  arm64: dts: qcom: sc8280xp: camss: Add CCI definitions
  media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding
  arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition

 .../bindings/media/qcom,sc8280xp-camss.yaml   | 581 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 624 ++++++++++++++++++
 2 files changed, 1205 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml

-- 
2.40.1

