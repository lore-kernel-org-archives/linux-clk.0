Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14022C4332F
	for <linux-clk@archiver.kernel.org>; Mon,  7 Nov 2022 03:14:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbiKGDOd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 6 Nov 2022 22:14:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbiKGDOC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 6 Nov 2022 22:14:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 479FB101E5;
        Sun,  6 Nov 2022 19:13:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2623860E99;
        Mon,  7 Nov 2022 03:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7BEC43147;
        Mon,  7 Nov 2022 03:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667790787;
        bh=dnkW3cK5akyrad3sPh+kltjhYYCMcf1S8gmrk5VJb74=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DzTNQ2E8ZCUTQ4w60MoOPLGx85rUXStowNFUHFcwKccow5X5GUnLYyQ9+t7d4xXFy
         iZ9xVkA+0fLSyFcnUB7DeP1cWyxZPyyq3Yr0zzSlGiCtM/mJ1BbrhNwmZQVVpaAuEK
         Pr+UV0ZoekE7HwV1ii60kWd6UdWTKtzZJx7RO5n3OG+VwLXkSP+m27NKLlEFYBTXVk
         HRKXSgsoHWdhG5H4txwaQhfEpp5PelNJn4CRyhABBvLgad03qRaNrsNHG6Kc0nDOm8
         0qPZNxJgvVi1PZZSCGGYRN35zbJMTyX6OpKGR1V0l/9w6Um13RCafN0fwrA79RrnXg
         tVIeM1nzvLRWw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     luca@z3ntu.xyz, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, mturquette@baylibre.com,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clock: Convert qcom,lcc to DT schema
Date:   Sun,  6 Nov 2022 21:12:25 -0600
Message-Id: <166779074258.500303.965701225368692867.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221016143514.612851-1-luca@z3ntu.xyz>
References: <20221016143514.612851-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 16 Oct 2022 16:35:13 +0200, Luca Weiss wrote:
> Convert the text bindings for the lcc to yaml format. Doing this showed
> that clocks and clock-names were not documented, so fix that now.
> 
> 

Applied, thanks!

[1/1] dt-bindings: clock: Convert qcom,lcc to DT schema
      commit: aa7f445536b14f1701017040cb6458a350131a65

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
