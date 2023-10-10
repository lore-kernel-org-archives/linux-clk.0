Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10003CD80BD
	for <linux-clk@archiver.kernel.org>; Tue, 10 Oct 2023 12:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbjJJMZq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Oct 2023 08:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbjJJMZp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Oct 2023 08:25:45 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9DD2A9
        for <linux-clk@vger.kernel.org>; Tue, 10 Oct 2023 05:25:43 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40535597f01so52571805e9.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Oct 2023 05:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696940742; x=1697545542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QJoGOmHf3rDEIH9ZhsJ2Ddsd34yzBngjw1VZp8Xb8gs=;
        b=xriTuVC5oWZyFAVHIhNUhdwhOOh24Lauv5qih3neAZNNkHiMbZV47s20oXSS5JT2ir
         Wb0YW5kmkM4kmvHonVqaLJ2JqXV0nQfWpifCzx+64TOL6NHBYHwVWsspscjg9sPSG7om
         Exc5Qe9K/2Nst+AnLK1tilxOAXtIH9npxpvHORQPrzXjElAyZLj4YWQKkPrw6Nvwt2Q6
         GeR4UUcvkgJ2CNp5/bAP8OXrBJOsYRR6ParuFDj1fQ20oN+Q8L3qwJYqNF92qpgrEVfD
         zVrJ2GoPy07rVHHzUEtf50h/Vmq/hSnUWt9y+dnfCWyPltB+wdDzDpWLGXpLHzoo7ije
         aKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696940742; x=1697545542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJoGOmHf3rDEIH9ZhsJ2Ddsd34yzBngjw1VZp8Xb8gs=;
        b=ocQps2rrxBTILTfN4kDlsSN4C2oxjdSlLgeEKkg9dsHbLBuEo77YBr9yLCgQeAhlcj
         D3SO8Hn7B8mf6yjo1x65mmaxoEmJBOwv3ERG8vq6FelAjrr44Z6g2QqtvsyYiLCahn/z
         J0CaGRHaYfYwT9sE7b2y5BJkT6lTEFCic5GFC4v40GsjeQbykq0D/D3prTPvDvz4mbCe
         86AzqyYYwo5bc111hh9dBL8MRTXfXejwv4k6Uf6xqi9DOqtghMhUopLNiNCl8lDBDynl
         SsqSuRK/19rYABzx49C4tjzR+XEgwBt0WKtyJrMSFr/8WftzYUcGUh5PIKTdx4zidh6C
         ObbA==
X-Gm-Message-State: AOJu0YzY7k45gJWSQK0cK9crwTDPqBlVmD86v5drdhNhWCK7YT+9m4iI
        jP71HG3u8Mmh2dkWfdLu9/2Rgw==
X-Google-Smtp-Source: AGHT+IEMFE7+jZ2E6qIyXz13dvkGAue4LRino7VKu9st5WEkc5wvqXhVsCTMXxrxQej5JckFDuAY3A==
X-Received: by 2002:a1c:f710:0:b0:400:ce4f:f184 with SMTP id v16-20020a1cf710000000b00400ce4ff184mr16792201wmh.41.1696940742160;
        Tue, 10 Oct 2023 05:25:42 -0700 (PDT)
Received: from x13s-linux.nxsw.local ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id bv28-20020a0560001f1c00b0032d402f816csm1404316wrb.98.2023.10.10.05.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 05:25:41 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Add sc8280xp CCI and CAMSS core dtsi
Date:   Tue, 10 Oct 2023 13:25:36 +0100
Message-Id: <20231010122539.1768825-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

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

Bryan O'Donoghue (3):
  arm64: dts: qcom: sc8280xp: camss: Add CCI definitions
  media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding
  arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition

 .../bindings/media/qcom,sc8280xp-camss.yaml   | 582 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 609 ++++++++++++++++++
 2 files changed, 1191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml

-- 
2.40.1

