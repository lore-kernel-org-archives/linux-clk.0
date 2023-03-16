Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0FAC77B6F
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 03:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjCPDTN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Mar 2023 23:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjCPDS1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Mar 2023 23:18:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FEC19B9AA;
        Wed, 15 Mar 2023 20:18:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6E35BB81FB5;
        Thu, 16 Mar 2023 03:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387ECC433D2;
        Thu, 16 Mar 2023 03:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678936686;
        bh=hAmHYIyv8G8EMhnT+v/0PK3T6RB8QGo8Poz+MweTjis=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lhNPXuJ1mOPyQ7OBFg4b0sRjlWA95iWkMYLUtITnqtrRQaMmnSNRhYfhDZPb368Lc
         udI5jcjMWqU2ns0CKk/29/3bnfOY43PuGp95vjbi/Iu1llYB2PCgFuOFJJocl0zMpf
         KXEWsMsNhBa2G4JRqk3jOd2sFsRPZMPAiYFy5DDbfXbrRv59zm2w8DtnOEkJfHwXkC
         NZqcYx3+lSn4H0Igx9KvlfUdxs/L+0oMgPTcppgq9MDfruf/AnF0lXZi1vCXp+152E
         +SjfIO52k4JAYY83ZqaQTgySGsZDmmCwpFIpEufhE6xjPwEIIGLLdep/r4CpRc43Td
         ICBug1y3f4j5w==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-arm-msm@vger.kernel.org, Rayyan Ansari <rayyan@ansari.sh>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: (subset) [PATCH v4 0/3] Add XO clocks for MSM8226/MSM8974
Date:   Wed, 15 Mar 2023 20:21:05 -0700
Message-Id: <167893686408.303819.4516059046726594416.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230121192540.9177-1-rayyan@ansari.sh>
References: <20230121192540.9177-1-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 21 Jan 2023 19:25:37 +0000, Rayyan Ansari wrote:
> Changes since v3:
> - Put the rpmcc.h include back in
> 
> Rayyan Ansari (3):
>   clk: qcom: smd: Add XO RPM clocks for MSM8226/MSM8974
>   ARM: dts: qcom: msm8226: add clocks and clock-names to GCC node
>   ARM: dts: qcom: msm8974: add correct XO clock source to GCC node
> 
> [...]

Applied, thanks!

[2/3] ARM: dts: qcom: msm8226: add clocks and clock-names to GCC node
      commit: d4b2c596fe5cb62560ce5a1442d8f64ec1ee716e
[3/3] ARM: dts: qcom: msm8974: add correct XO clock source to GCC node
      commit: 17c5ee1914dc8c4f42cab7a5beb2dc91aef0f873

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
