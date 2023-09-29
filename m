Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A71E71D3A
	for <linux-clk@archiver.kernel.org>; Fri, 29 Sep 2023 13:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbjI2NjY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Sep 2023 09:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233411AbjI2NjP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Sep 2023 09:39:15 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8777426BE
        for <linux-clk@vger.kernel.org>; Fri, 29 Sep 2023 06:39:02 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52fe27898e9so18559057a12.0
        for <linux-clk@vger.kernel.org>; Fri, 29 Sep 2023 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695994740; x=1696599540; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N80cnpAhKZAQNAt0LvDi0BgqS0Cl+s+lMzHKGl0eRh4=;
        b=PB8XYtTt/2Krfplz+H6ZYkl33Gsq3y7RiFEHlwN2Fx5sYwSBaxmZHsI6PzDMLixWuc
         GimMf2klP1e394MhNDSs9zB2qqgttaiSiqf2pRNMMVdLfs/T0o4TWEvl+3e15n66gzM/
         CYBpPeMZL19lRhu4wjSNwX0iOpA3o2/IbTBsiddzUsZvETt4vrOknQXJx4bZAn5me3lV
         2Di6xELuCUHCPdiEHOppLqdr84AcwUTWqpX1TkHSz0T2zca84LRYWdF+7py9tG8Ks7eZ
         HOr0jX4+V2ZHpEXrR/djBjh1OU7DkUHGxdzSBiy1T5JKFCm63nQOaNWhbAI8QOYL2uWL
         fSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695994740; x=1696599540;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N80cnpAhKZAQNAt0LvDi0BgqS0Cl+s+lMzHKGl0eRh4=;
        b=JMp75qKWM9jNXkBU6xOvcvkEknIxvOBgdhD/Iq7fuUW88D/QmTvnl/QO48uYGcm+BJ
         zKBPE23QHtorvmCTL+5Krw/8autmYTBVHDBXkNrEV09AJ7/gGsx+dsKaNVdNerVchtAa
         EYpVyjZZq0LFaNOWhZFohd5Qf/t+HIV+QkO0RqDIgCj6oUsbICjw88/BT3OB9OM8dQxG
         YYQDNhFq334Gibl7dhOwNWGEjk8EFXgApSv7gXVuhzmOdYLpOa7CXAOnpZXdGWT92iv+
         3awSESL/RnxVBPSBctuizzFyI4y9vbWnMCPU1rURUAacIe9aKdn6TJGwCKUeu/g+HpMw
         uJgQ==
X-Gm-Message-State: AOJu0YzmRKYdAqd/HOZkAQAQr3dfZiLxXHO7Gro8CkTIbxks9hAG3fzU
        59keXWBJ+ZQsZZQ1E3u3TLYmDg==
X-Google-Smtp-Source: AGHT+IHDZ7g5o9oqgsZvyPyN1QPbuYPFz8FvHA9hu9FRmuuDczT6e2mlFwjshH5KeTJNcUqMM0Qqbg==
X-Received: by 2002:aa7:c58d:0:b0:530:8d55:9c6f with SMTP id g13-20020aa7c58d000000b005308d559c6fmr3183409edq.2.1695994740560;
        Fri, 29 Sep 2023 06:39:00 -0700 (PDT)
Received: from [127.0.1.1] (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
        by smtp.gmail.com with ESMTPSA id cx14-20020a05640222ae00b005362bcc089csm2215701edb.67.2023.09.29.06.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 06:39:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] 8280 display ahb clk fixes
Date:   Fri, 29 Sep 2023 15:38:51 +0200
Message-Id: <20230929-topic-8280_ahbdisp-v1-0-72bdc38309b9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvTFmUC/x3MMQqAMAxA0atIZgMxClqvIiK1Rs1SSysiiHe3O
 L7h/weSRJUEffFAlEuTHj6jKgtwu/WboC7ZwMQ1GTZ4HkEddtzRZPd50RRQqpaEnOWmYchhiLL
 q/U+H8X0/pz8Sc2QAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Little fixes to shut down disp ahb clk when dispss is not in use.

If possible, the dt patch should theoretically go in first, but x13s
worked fine regardless.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      arm64: dts: qcom: sc8280xp: Use the correct AHB clock for DISPSS1
      clk: qcom: gcc-sc8280xp: Don't keep display AHB clocks always-on

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 4 ++--
 drivers/clk/qcom/gcc-sc8280xp.c        | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)
---
base-commit: df964ce9ef9fea10cf131bf6bad8658fde7956f6
change-id: 20230929-topic-8280_ahbdisp-e170e0ca2442

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

