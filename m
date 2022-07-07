Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E29C433EF
	for <linux-clk@archiver.kernel.org>; Thu,  7 Jul 2022 02:32:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234923AbiGGCb7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jul 2022 22:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234916AbiGGCbn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 22:31:43 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC552F647
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 19:31:40 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id i3so21883119oif.13
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 19:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QW4iuZlOv4sd87jxv5XGEWli/W/FxeKzQSF/n+L5Jtw=;
        b=NwSal3tkQmXmBXYmvycScQbHR2KG+P0xphXPzu+9t1297DW+edyRe0BhB2sZzN1XJI
         slpVkxr+NIrNrr+thf3a2S/QF0jgE9E9syHcdXHZSH8hFGYiqGzCRgLwFBI1tFzvKUOg
         3xh8jmT+ZU5KI7fkCKvzYuT/aNgjTCOkFnhRJdQvpRJdZkSXjW/4noxUIahfVh5qU+AO
         nae7kvqP448YZTuKfikaSg2iOfQfjMv6yogwYtvQHG+4U2FC9+A8MwLh7ikXnsTrVawN
         zA4qOpR2gOgufMHEHhzoZMhTc1Z7xvgnd2JokK3Tw/hZAN4tcCCPY0UA+YwLRBYE2cN+
         euUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QW4iuZlOv4sd87jxv5XGEWli/W/FxeKzQSF/n+L5Jtw=;
        b=Cfoi3rPNJphjIebn0eeadIx8ecllJF2Fb+QC1SjOLCmC6eh8fQpo1vL4HsnqcYZNRy
         6IE/dobkfizLslocuxuRtBgStAYAucc3RHBdFZZ/CRKEdMPtWLn8ZerPsHZ2HyVoi9cc
         VgmE/mIUffSoP4HVqo1G4QPdUHadI1wxQBHR+j4AT3dHU4AwJmMg6zdATwio77u33C2e
         irXy9pOxpomWeW2U+apabY2wAnw/bskR3LCOELEH3pnYn1xOiBV/pHLIY+s04ChfEhqP
         53vHl0KvD3iHNFgUzcAhb9owtMOjR8F2zW1OgG6Ix9zRAO6IYXHxZf+ZDqZjCpf8e695
         JlGQ==
X-Gm-Message-State: AJIora/oInKNC8JqmtWyQpJj75WK3k4c6KkkySqfJOHl+ZyyeFLiSOTC
        sJntSjRU+fhYAxiCYjGt12SRDg==
X-Google-Smtp-Source: AGRyM1uPoCJ+iFpOVIBA5ozWqqW8rlmdl/g1y4YCD5rViGVrfPHRug4JFL/hw83XHmJEVQVbIaKi8A==
X-Received: by 2002:aca:b6d4:0:b0:335:b203:43d2 with SMTP id g203-20020acab6d4000000b00335b20343d2mr1090018oif.297.1657161099953;
        Wed, 06 Jul 2022 19:31:39 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:39 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        jonathan@marek.ca, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-clk@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: (subset) [PATCH v8 0/5] SM8350 Display/GPU clock enablement
Date:   Wed,  6 Jul 2022 21:31:17 -0500
Message-Id: <165716107314.864223.3569086936166487056.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220706154337.2026269-1-robert.foss@linaro.org>
References: <20220706154337.2026269-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 6 Jul 2022 17:43:32 +0200, Robert Foss wrote:
> Changes since v2
>  - Dropped "clk: Introduce CLK_ASSUME_ENABLED_WHEN_UNUSED"
>  - Dropped "clk: qcom: sm8250-dispcc: Flag shared RCGs as assumed enable"
>  - Dropped "clk: qcom: rcg2: Cache rate changes for parked RCGs"
> 
> Changes since v3:
>  - Dropped RBs & SoBs for bigger changes
>  - Changed author to me for patches with big changes
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: clock: Add Qcom SM8350 GPUCC bindings
      commit: e67a004482c092e326b32f24d4542c85fb8f79bf
[3/5] dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
      commit: 909e5be2ca882a0384018370f065ef1c611e6ed9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
