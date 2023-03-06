Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA4AC678D4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 08:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjCFIje (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 03:39:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjCFIjc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 03:39:32 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84CD1CAF6
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 00:39:30 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id p16so5074140wmq.5
        for <linux-clk@vger.kernel.org>; Mon, 06 Mar 2023 00:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678091969;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdXHSSzFb0wf4Z5ebFpbSvGWzd8D68jDgoc9WISe18M=;
        b=L/xCTT9oGeZPl+49XiWu7haaTjDD4Czfx7sdxvdImv6E0n4BYBAn3D4PuTH6iu1EfT
         Qc+MRFZRe1qydY49icg8KJFQ51W7cm3Rxef7sE2j1vhiQUa4J11pURkUFQGRsIpom2Ys
         Aa9qUv1vtAj+Mrxe/aA2EeDG+Uw8FMt2DE+kag/IMs6L4wFKz1Js3mmfscN1/k4JzxDD
         pnP/u0qTCwjArowyXg0pmVt94fig6sxuZYh8GMOu+48+IsQwkeUxUvKMeT/A+R1NjqUi
         umfU76E9s2VN2ERxo3ELDHjmiebm1GYGa+K4XsHT0v05y9chlfiMhOLeTgOM2hRtKM23
         4k1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678091969;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdXHSSzFb0wf4Z5ebFpbSvGWzd8D68jDgoc9WISe18M=;
        b=W98j6wg2mFMxeNNtdKmhOeLzNabT48h60ottiDCrwl0wz+VKb6FJ0o5wJLFpqzMzC1
         E+WsbU+l3qjvnw0iUQaBejmQkqB6IAQ4MjArlWPhsUn84YDwDJpsaB0/dYsJD8OgZAH4
         bMfhnsM3V0hS6h1AL4POoZxiaHvHYMXCeOp1eM2/14h0MFK4RYMqIqw4nUDtDuyzr28v
         WleKrju3pw95a42pK8UKM4oJu2nri1yGQVZHH1s9TzHGxBI3LmiMoPEGQoy7IWhjT5V0
         +9EvWvSprUPUZ7OB6PldL1WjDHJ0PBgAxZvP0pj3b9yeahzrLK07TA+Yb3lII5wH2JAM
         JjdA==
X-Gm-Message-State: AO0yUKURm/PpPRRozGHtoIcoAap/LUB5n0gk+AJFJ0+oC7tHSvRZT0Fw
        70dEM6bwZPvvv+S5XQZ9bkWphg==
X-Google-Smtp-Source: AK7set+ZWZw+hQJ/2sk3ResOt44ySPYhF3lJa5MGYX4FLkyMzo9GSQeeqZSK5eB9zmeofrYdEnx6Gw==
X-Received: by 2002:a05:600c:350c:b0:3dc:40a0:3853 with SMTP id h12-20020a05600c350c00b003dc40a03853mr6535425wmq.11.1678091969437;
        Mon, 06 Mar 2023 00:39:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d4f81000000b002c54e26bca5sm9190736wru.49.2023.03.06.00.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:39:29 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
Subject: Re: (subset) [PATCH 0/6] dt-bindings: second batch of dt-schema
 conversions for Amlogic Meson bindings
Message-Id: <167809196860.10551.9031776722379367022.b4-ty@linaro.org>
Date:   Mon, 06 Mar 2023 09:39:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Thu, 09 Feb 2023 14:41:36 +0100, Neil Armstrong wrote:
> Batch conversion of the following bindings:
> - rtc-meson-vrtc.txt
> - amlogic,gxbb-clkc.txt
> - amlogic,gxbb-aoclkc.txt
> - clk-measure.txt
> 
> And in addition document the System Control registers top node.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.4/drivers)

[2/6] dt-bindings: soc: amlogic: convert clk-measure.txt to dt-schema
      https://git.kernel.org/amlogic/c/2227e738b30bf20380a48391a73752c52f5f5c6a

These changes has been applied on the intermediate git tree [1].

The v6.4/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

