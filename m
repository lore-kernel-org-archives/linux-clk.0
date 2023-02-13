Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDC8C64ED6
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 13:08:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjBMNIM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 08:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjBMNIL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 08:08:11 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E95ABBB2
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 05:08:09 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id p12so5613268edc.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 05:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4AVcCCcYCu1fsMnLX3/oSK0Cfjy5k3u75GS4x79cKTs=;
        b=tz0310KlBh5GPVmktnvrXetOzJbccq8d0VOEa29VycTzE8TFMdVcbAZkrZqHvpQ6E5
         /mPBiEb61U5uICRbNb8ohFRT/hEed0y7fBhwHDJuH0oK4Vpub7OsMefusyxcrwbQEb51
         lfap9Mb/wS6+t4S5EnJrw1yV+OHGXooglTLYGKs/h21Fh7GTjAa4ThRKOUe8G8FFb4cV
         kmXhKdCYK/rsOsSnlDvqXUXk1orQ9DZTZie/o0LcKa2P0VEaY7jqO0T1r3EZZPSsgBE1
         dKxoASAUcwKvJd/PLFxhCSZIUyDI9r/BVeVmL0wSQc8JaqmCQ03TQ04KrDBjRzBi+YUU
         xhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AVcCCcYCu1fsMnLX3/oSK0Cfjy5k3u75GS4x79cKTs=;
        b=V0ujL7qKsy5505dNU7Tw0X6a/QeZIDLU/yxAIHldVXOkSd9cWiWozozgTYmVuqmapR
         1H08YoS6nGQP5cj0u9BuiEc7azEgBBB0EXUz//0RVcFFHmepmr9527oDqgnq7gjSEK6K
         rIwvudK5KItgQL640K8icMIoYT3xs6LcgFJN1dJ6LmHEI6xmafHi3EQc/9X9PNXL3MWc
         Lyu9wbHG3dW2Uycr+4YItI2a7F4lriAPA5dqi84hNCgTPe8XIBs9Ew01Yji4Ui1PWVD6
         sQDkWjTYQfRrPFzMcik/hbZWoYQo0uCp44VmsJHu+Wd5chFW47Gp2xzigQ5L4H1haMkD
         H9yg==
X-Gm-Message-State: AO0yUKXrolEu9q59gOShQsCArecxa1EuCObECgILcsBe4bbbne7CKNkq
        YtivdRbKxb5ZQUu4VUBbdjJ/qg==
X-Google-Smtp-Source: AK7set+DrDzcNW1MQoBQpzKs+ALuGsDq7h4QQMtvYUdTF4DzLCFf2Yo9TYPuGxg4SP/o8FbEb/NDYg==
X-Received: by 2002:a50:cdc2:0:b0:4ab:d0de:f7ec with SMTP id h2-20020a50cdc2000000b004abd0def7ecmr9027613edj.5.1676293687757;
        Mon, 13 Feb 2023 05:08:07 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id f22-20020a50a6d6000000b004acc6cbc451sm1616515edc.36.2023.02.13.05.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 05:08:07 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
X-Google-Original-From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH v2 0/2] Add pm_runtime support to SM6350 camcc
Date:   Mon, 13 Feb 2023 14:08:05 +0100
Message-Id: <20230213-sm6350-camcc-runtime_pm-v2-0-60a507bf3e68@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADU26mMC/4WOSw6DIBiEr2JY9zc8FGtXvUdjGkCoLEQCan3Eu
 xe9QJffTL7M7CjqYHVEj2xHQc822sEloLcMqU64jwbbJkYUU4YpYRB7zkoMSvRKQZjcaHv99j1
 wVsuqVKwtJEHJliJqkEE41Z2+8QXwnMLX+rP1QRu7XLuvJnFn4ziE9boxkzP9vzgTwFBxYhSvT
 SXu+LkxN075sm6oOY7jB+dotlHcAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As pointed out during patch review, we should make sure that we turn on
the CX power domain when camcc is in use, and also disable it (or remove
our vote on it) when camcc is not in use.

For this add pm_runtime support to the driver and stick the power-domain
in the devicetree.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes in v2:
- no change resend since I messed up To/CC in the initial submission
- Link to v1: https://lore.kernel.org/r/20230213-sm6350-camcc-runtime_pm-v1-0-761fc69f7a80@z3ntu.xyz

---
Luca Weiss (2):
      clk: qcom: camcc-sm6350: add pm_runtime support
      arm64: dts: qcom: sm6350: add power domain to camcc

 arch/arm64/boot/dts/qcom/sm6350.dtsi |  2 ++
 drivers/clk/qcom/camcc-sm6350.c      | 29 ++++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)
---
base-commit: 09e41676e35ab06e4bce8870ea3bf1f191c3cb90
change-id: 20230213-sm6350-camcc-runtime_pm-639b75c3d4b1

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>

