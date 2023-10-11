Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDAACDB47A
	for <linux-clk@archiver.kernel.org>; Wed, 11 Oct 2023 18:55:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbjJKSzs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Oct 2023 14:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232519AbjJKSzr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Oct 2023 14:55:47 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4959E
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 11:55:45 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40537481094so2520335e9.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 11:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050543; x=1697655343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b18JSG/gE5pF19poGgo0WtqeEPHBkEaz7XetM6ld2MU=;
        b=da1gYhmBNeZo4doTEz/K/NLUTpZV6F8kDBypaxeqTBOMSAfLpHYSNEbKalzxRaC7n7
         mbFaevGxxwGcBX24/M9YXh7VBUEY8M9ZyFptPMjcf5yoOTXyukwfmRN04hmBPcEXfbXJ
         8d5GcM1hpvx7pbNK4gjuj+AsRfSTakKwxEbUSSFq0Mf/7DuoMbb6fAf5Ql3kogyQzhJH
         pyeSO4Krne/qekNHSsltQSrK0z2LWvM41cvTbSjS9sKkyMVJaITeBY3btRkoi1UjB8K6
         Scv/yUZh1y/epGNjqAxl+l749QssQiIVMcTrBUHn2nCkWtSthxFUwZyikqdr1OLrjEK8
         ymPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050543; x=1697655343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b18JSG/gE5pF19poGgo0WtqeEPHBkEaz7XetM6ld2MU=;
        b=wsj/OGVKJZhQBeOG4NlQ+Kf0rCSA4SrDSpp/hWS3MGYy3nVictZyKLQhxvbGr/mE31
         gLGTm3p9utwPpkev+l3umCgL5EJ83A9FUqlMKwYrPHwm/1QsNW46vKzlr26kMjuYLrka
         tJzmxzEvnVsU7Hbj1w0OfIQKQweqJUUh+ye9LVH090Cw+LTijeJ7Uvok6ehqoXpZEazD
         b7LqrkUqJB5NPKoQ7k3laabks4n/IFzUvbYThog1t/Yyz7DxdcxFHy+9I/btKAS/xAn/
         7FM0LIH0fWl00Gkdsu+JDZzJPkT5bq+XiwpueRtPQgCRhv6QKq4b3KcGMysClC0qvQGo
         Jjtg==
X-Gm-Message-State: AOJu0Yx/fkgyTYJo/0rZOHYHaxg5j5Ctl4lmrflEJjf9h5TLMuO5J1pU
        Dv7w5aQAya2PeOBS+snroGcbpw==
X-Google-Smtp-Source: AGHT+IGBwWbpnBz8UGPlE37JYSwSN5Vabh/delGPT+w/bUyZq/8/UYqL1fPkOEbt+Tg8dAb5Ov5Pzw==
X-Received: by 2002:a05:600c:3ba1:b0:406:872d:7725 with SMTP id n33-20020a05600c3ba100b00406872d7725mr18712930wms.1.1697050543639;
        Wed, 11 Oct 2023 11:55:43 -0700 (PDT)
Received: from x13s-linux.nxsw.local ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bcbd6000000b004060f0a0fdbsm19928294wmi.41.2023.10.11.11.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:55:43 -0700 (PDT)
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
Subject: [PATCH v3 0/4] Add sc8280xp CCI and CAMSS core dtsi
Date:   Wed, 11 Oct 2023 19:55:36 +0100
Message-Id: <20231011185540.2282975-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

V3:
- Expands description of ports to clarify mapping of port to CSIPHY
  Rob

- Adds the dependency link into the commit log of patch #3 - bod

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

 .../bindings/media/qcom,sc8280xp-camss.yaml   | 582 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 624 ++++++++++++++++++
 2 files changed, 1206 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml

-- 
2.40.1

