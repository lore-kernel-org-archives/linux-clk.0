Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5658BC43217
	for <linux-clk@archiver.kernel.org>; Thu,  5 May 2022 07:08:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245580AbiEEHMc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 May 2022 03:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245644AbiEEHMa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 May 2022 03:12:30 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF634704A
        for <linux-clk@vger.kernel.org>; Thu,  5 May 2022 00:08:51 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id g23so4123676edy.13
        for <linux-clk@vger.kernel.org>; Thu, 05 May 2022 00:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WGJ+szBbyr2lzfc4ahud7APtOvfcKd7YgtYN/CgLr0w=;
        b=X27TsmJs56DbhuIALDeRkZQzi5L/yk9t/o9wE3w4G+q++/+FAzu9hrnvMkjyDGygL/
         vznW36EnFdurGGjpe8nxVAme2Y8KXVeIb4LLWLDZ/pE2rtSuATOXTrYGFIdzUY6OoPQd
         H7Q3wuoyHMU3amdIvEv1GCO6f9rHIjyCEtqxnri1qfTWLa8Qn6I6DeMaVmbyW+MX7h1x
         1YL4UzPbbLrNo+AbpiW9/nmIx3W67z6NaOfh1ILi54Xz+EXKs91S1RvGpxNUQvdmIM/3
         /4v2talsuH9H2aM1OimiskpM80HUpZlgEd9T4CLcLsneHHdL8d35McydGsC+zU3XbxxV
         Kl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WGJ+szBbyr2lzfc4ahud7APtOvfcKd7YgtYN/CgLr0w=;
        b=4OKmR7bY2qYDd0NrO/XDUYSPBkviAQ7Lpbhz//vQhCjqpZUbMUd2BRaYQpUugxcYXy
         pdfs/bGDjkXCLsQfmLwLccn5QduuTMw0nnWFJjAcl0f4CSJn1x97Nc0i4NdLiIHXtBAg
         HrAneF83nYeRpKZN0krOWI3dqIC9S6FYaP1kKNNFXOYVpkezcqZQ8VwKVVUMigvmOJcm
         rmDv8LzMMRlK8aXofpQ7GdabBxlARW98p22kex7csSg8ezutU7TTYi+KCzCPE0D6e2Lb
         CbkKD/qi9kxqvE8kWM34+W2dpWJbqqSjdLV9a3GTlTPZ6jyH1AE63lgj1kQ83qzsYjH/
         /7MA==
X-Gm-Message-State: AOAM533d4FpYxAAMKQt4AI0UW/03Z7k7aAQ2a3ax8OfwFOzYhHdPadxf
        fl44Z1MXzrOIYLndR9lyOb2FJg==
X-Google-Smtp-Source: ABdhPJw5kWuCg7nKubB0wZpuA/MM0CAuFhQJvm5izqo5Xou3V4vNMVSIWFEVzYucLGDYKQD6EQdx/A==
X-Received: by 2002:a05:6402:3490:b0:427:b471:9e1e with SMTP id v16-20020a056402349000b00427b4719e1emr23694016edc.36.1651734530550;
        Thu, 05 May 2022 00:08:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b4-20020a0564021f0400b0042617ba63ccsm394386edb.86.2022.05.05.00.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 00:08:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 12/12] arm64: dts: exynosautov9: switch ufs clock node
Date:   Thu,  5 May 2022 09:08:45 +0200
Message-Id: <165173452272.31721.1625762819657409764.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504075154.58819-13-chanho61.park@samsung.com>
References: <20220504075154.58819-1-chanho61.park@samsung.com> <CGME20220504075004epcas2p4d082e1aa4b35ec4720ea8ed2308878f5@epcas2p4.samsung.com> <20220504075154.58819-13-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 4 May 2022 16:51:54 +0900, Chanho Park wrote:
> Use cmu_fsys's clock node instead of dummy ufs clock node.
> 
> 

Applied, thanks!

[12/12] arm64: dts: exynosautov9: switch ufs clock node
        commit: 9882948322874b1ffdd559e6887397de4c903440

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
