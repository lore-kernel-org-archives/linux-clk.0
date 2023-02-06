Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BC2C64ED6
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 14:57:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbjBFO5U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 09:57:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230471AbjBFO5T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 09:57:19 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2594B1E9E2
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 06:57:14 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id e22so5629633ejb.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 06:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEaaIXvwNj4Y/ABcyEFSpp75hgY1fYms1s4I3xha300=;
        b=VT0DIb2218KDtV8LgUx4pLrKPUjw9ZaFe16Z7Em/3TwJGRh63ca6bVtA4lUQoDAwmc
         RMhElQT3TKKvJmnlOoiorjfI76//wbJtP3F3LdwX5Dw7eaFhCNhHIiuFS3ZHPzN7ykVo
         NmlXVHhTTwRkdshfWLBPhddHlNVmlqNc0L7ya+ohdj0Lo+17RCPyyOAkxaAqLt+mUY4Q
         w+jd9/fX4jeabLO2wf/nThycCl6Bvp2AwwGius4MLnU4BTNbXMlVwpXLMymakhgsINSN
         KQ17iVSnZFR8hc08EqXjujTYmUmG1hZNwOTp+TOR6p+U+C44m38PmdH5kkVZjlScljnJ
         pvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEaaIXvwNj4Y/ABcyEFSpp75hgY1fYms1s4I3xha300=;
        b=1mMOVOSyL17Y5T0HoGUBakWPiLg4cWXbX0L0wOIUk5O77sVmeQh6RqPjDwe/n6/bPi
         Z4g6CgbFUX8RwH01kQOVVCbaVmUFPw6CnuxoYkOVh+Nz1UCHWzAxkqsN9T32Y6fVL2d6
         AOheeNmi7NNrfYHrhtwMCHhRxK15lV/gwtJYKtAWE7K0zgNa5Nnm57bZQNbMkb0++Bsw
         mFdbwVxS/cOAdoloYmQmGADWqKqd1nfDZ9GgI3ud6+Jw285XpLRkihaajoHhlwIQ8R/8
         SvOUVdDUT5bs9RNhVSeu4TKXAq4YtPDCxWVVRr1u6BmEeb0YBT1Yj88D0xwfHoQHzeS/
         J9nQ==
X-Gm-Message-State: AO0yUKUp5s4Npu1MD0LRJ7zaITM9KWrX5jUtpOzmU0JwOkJo+inuYMkY
        FD6rWz09vFV+kWMxJ/b26odUZQ==
X-Google-Smtp-Source: AK7set+ld7Fvjne/Ke0hqBwYqqTXSGFZP0hAmU5HtemMLaDfL1KIGo8qZrRQ8W0ZVVuQb26Um7NGFg==
X-Received: by 2002:a17:906:3189:b0:883:ba98:204d with SMTP id 9-20020a170906318900b00883ba98204dmr20445587ejy.65.1675695432717;
        Mon, 06 Feb 2023 06:57:12 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 06:57:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/8] dt-bindings: display/msm/gmu: add Adreno 660 support
Date:   Mon,  6 Feb 2023 16:57:02 +0200
Message-Id: <20230206145707.122937-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add Adreno A660 to the A635 clause to define all version-specific
properties. There is no need to add it to the top-level clause, since
top-level compatible uses pattern to define compatible strings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index ab14e81cb050..d5ce0dff4220 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -122,6 +122,7 @@ allOf:
           contains:
             enum:
               - qcom,adreno-gmu-635.0
+              - qcom,adreno-gmu-660.1
     then:
       properties:
         reg:
-- 
2.39.1

