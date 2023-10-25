Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05CFC25B70
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 07:34:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbjJYHeA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Oct 2023 03:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbjJYHde (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 03:33:34 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E1C1FDA
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 00:32:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507a98517f3so7438012e87.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 00:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698219172; x=1698823972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAdZv2SpCyzhhWzoipryKQ5g0HDkgSjJCxK1Y1vCQuY=;
        b=jaVMwG581hiWsNtLUmU2hbvnwQTtOECkjOmsdi6Swq0IcJ6EMK742RvP0d/Ygc7C8Z
         K0glSoWfkwRW7zsEaxZnZOObYX3SuL3fSeJZkoC9KTlVHreKpoI2kWS3RQY38RdsqHNc
         zx6WLq/IqAIF9/RDsbiGaLFYkiMOMeYen/mXwxcYUNQshEsXFx2JG7eBn3TC2owqVIGB
         dO7zXY25ND2YmyNJPC9Dx66L6iccRqCjMG/wCNmbA5VUmrE4pc5amXGBWFKfgV3vCvhc
         lEtUxA3H3moxntpMhIn16N9aBi01MmRJ3Bx6NLhRoTFrFlb0PSd6nES6hpF/ksHE3x5k
         8Gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698219172; x=1698823972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAdZv2SpCyzhhWzoipryKQ5g0HDkgSjJCxK1Y1vCQuY=;
        b=snJEAJHQAySq3N8pGp2F9B+LxcdaKjuugXz/oTbfhvaycAiU3F5wClGVlA4yo1V+18
         4PthEB50k0Y69WDrS43t+wpPtCOqKky9iLDKxHiXZdffM8+04phVeYFQD+MnoOMEKIyB
         zIieMuNpOtlXf9680y4V1FJB+bcHyYV1ywie1J2QT6O1451eMNnWg8JHEZKSOScdMBqc
         lTwpSN7ogpu8WQYa90vvgUjhXiHvlp7JvFqg3mxSxkRf5zuO2r3hpxPdLPuqCsVJmb/8
         qyVnvAZ7FgRUTW1rKP1+URyIW5JHPPlo8VBam7Jfu4/NPznBAABd4LjAdHko9fO1qX12
         rRng==
X-Gm-Message-State: AOJu0Yw/txUQpNz/FcQFN7HrAeNgpXIH0eLuA6cjag6W0pK0cIK9UdDi
        fOz4zD/GunYFQalGWwxFDFcXfQ==
X-Google-Smtp-Source: AGHT+IGHD1W7vjiQU54eg3KVUr8VSLyTUYuqFlv1U1LcSpHKC+tEaMFtrRL0PTqxPoHB88kgvbjJfQ==
X-Received: by 2002:ac2:5104:0:b0:507:b17a:709e with SMTP id q4-20020ac25104000000b00507b17a709emr10639931lfb.1.1698219172476;
        Wed, 25 Oct 2023 00:32:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c15d200b004063d8b43e7sm18422239wmf.48.2023.10.25.00.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:32:52 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 25 Oct 2023 09:32:42 +0200
Subject: [PATCH 05/10] dt-bindings: clock: qcom-rpmhcc: document the SM8650
 RPMH Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-clocks-v1-5-c89b59594caf@linaro.org>
References: <20231025-topic-sm8650-upstream-clocks-v1-0-c89b59594caf@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-clocks-v1-0-c89b59594caf@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=734;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=j1GD0rlTsJFErsDQaYor/hl8ccBoX2v6m+5EFQWT1x8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMSb2IUsGyJoovWCtAqceyCCBOl43zgOiBLnc73C
 fTFY61GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjEmwAKCRB33NvayMhJ0Wj4EA
 CJKK6JOgBAVAhXBo65/nggjbUu+uzQeWaTfwvFbIf4CwK0riW29y5fbqqadxBF0a6nt9mG2y+j0fOp
 epXpwDO3F3BHsm3zL0/fmak75KnLF12/oWdkynYb7yyNgxFaaAa/drCv2wzKjpKD5p2GUzyd+9d/v4
 VRUm4UetZ7mCebFxjhkuarKC2Qa8FJ+Cq9HWbCSx7+W+9ax11C0aO89hv6OdHeK4qU67yH7WSU0GcA
 sZ3OpGo9lNcEkPJ9kldrhxJWM6r2tf7+ZXSGRU2MyLn6Uv4WUCTcCTlSmawiPm+TTmf2f+w/J3svxP
 ooqJsd3MyAyAxrnQb2EZA86fMjRe9CYvHQd00VO8knOukeh2eCLNN3MQnUzHUSaYCH4Hh40iG4v0Kj
 GyWEV32GOGrWonH0rHd265Mp8BymhdIOYPOofWyA6+IWoraZ88myaUJb8c7Sjgqk7Vl+XAWSnGnmpT
 nmFTckE+pxqPBUk03lEYskkFYD//774BS2Igb43svplhGleia/NUWaR+ZVf3E11A/7oRK4ZP0qBU22
 TQ8R+88kWg0J2hR5ArP2yxJia5JBi/EU771gkG6v5R4z03kd2r/u+U8OSDfsGJdBIigvcY3ksnofje
 Jkvefl1fBsermRDv4mEsavV1kKUj2eRm3B/8kUqjXk4rhNzm4to8UUtaZ3YQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings documentation for the SM8650 RPMH Clock Controller.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 4eb5e59f6772..9be952a5a227 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -35,6 +35,7 @@ properties:
       - qcom,sm8350-rpmh-clk
       - qcom,sm8450-rpmh-clk
       - qcom,sm8550-rpmh-clk
+      - qcom,sm8650-rpmh-clk
 
   clocks:
     maxItems: 1

-- 
2.34.1

