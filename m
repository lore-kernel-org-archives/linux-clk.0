Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D88C7EE2C
	for <linux-clk@archiver.kernel.org>; Thu, 25 May 2023 04:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239726AbjEYEz3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 May 2023 00:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238936AbjEYEyK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 May 2023 00:54:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524EF1A8;
        Wed, 24 May 2023 21:51:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DF6FF642A0;
        Thu, 25 May 2023 04:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83382C433A0;
        Thu, 25 May 2023 04:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684990305;
        bh=F/9qCi/aWpXCcfQtpOkMwB8Avnr91ZUf5XsK08GzRfQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F0hBuQMlLwjJz8mgTzaZlDTldWkuwvSMP9WFvEyH1mQl01JhHR7u/hi8LkI6v6Bca
         qm5lfMZsvUM+je1W5DM9KTHWYNPh8L2nyOCTLcWOdgjgQhEA/5Nuk/DH7GuOSn9Q8u
         s71bhW8D5qaVUP2BGfXPgZc9PM0v1Dk7AhuUgX4UqpxBigtEy99/8ozanSohfWAAGa
         OEaJG+6cJ8SOFCgaGJm21KAaXjMcDWRBl0r93t+tXqsp+a8dZv97RnlhyZgxVZzNjv
         wrEioEuBvR+Aye/qXkd3QNZxdyL80bAVbdjWt3BNt926HenQDfj+6gk+anJ1gNb0ml
         0TROj99kxSy4A==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>, Luca Weiss <luca@z3ntu.xyz>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: smd-rpm: conditionally enable scaling before doing handover
Date:   Wed, 24 May 2023 21:54:24 -0700
Message-Id: <168499048185.3998961.3233222343826029268.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506-rpmcc-scaling-handover-v1-1-374338a8dfd9@z3ntu.xyz>
References: <20230506-rpmcc-scaling-handover-v1-1-374338a8dfd9@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 06 May 2023 22:10:32 +0200, Luca Weiss wrote:
> On older platforms like msm8226, msm8974 and msm8916 the driver in the
> downstream kernel enables scaling first before doing the handover of the
> clocks.
> 
> While this normally doesn't seem to cause noticeable problems, on
> apq8026-asus-sparrow this causes the device to immediately reboot,
> perhaps due to older rpm firmware that becomes unhappy.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: smd-rpm: conditionally enable scaling before doing handover
      commit: e9a2db5caf9f219d9cf570cb0965710344c85519

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
