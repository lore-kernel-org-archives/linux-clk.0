Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98987C636D3
	for <linux-clk@archiver.kernel.org>; Thu,  9 Feb 2023 04:24:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjBIEYy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Feb 2023 23:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjBIEYx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Feb 2023 23:24:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8852122;
        Wed,  8 Feb 2023 20:24:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 163BB6188F;
        Thu,  9 Feb 2023 04:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C9FC433D2;
        Thu,  9 Feb 2023 04:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675916484;
        bh=SfEPzDq/vaO+pFgcj4t34XA/iv/xQVNqfJ4gSldMhUk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aVfo3ZraJGDjlIrfUQ5ByJlHy/+CgsozFCphOP6w9K1bFSeU5vuwgJFFgXmJ1bAsc
         YBar1xnOrd//lm3artAZoXTR43K7jR4B5XObcW47TjEY98AZuAAWvHbRVDKq4ylBpm
         OYqKN6sRhH9dgsWEKbLc1wclrYerm7InLvAId76wtYNorfHfyAnF4ctfQ+CcDBIYL+
         d3hcF0iNLJ9mUi91dbco5lvlj9PfaeFYjUUrFytZqp4JwF7tZ74lvUNl9Uxxn2BKRq
         2FWeMr1DKo/MSKv3bH6LteS+q0fWUD9qan9+bD0HYNgUvRkfyxuCQOMn0xQQh8YA6G
         0WsDebYcxryew==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>, Alex Elder <elder@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        kernel test robot <lkp@intel.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sa8775p: remove unused variables
Date:   Wed,  8 Feb 2023 20:22:42 -0800
Message-Id: <167591660366.1230100.135110364430620422.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230123103338.230320-1-brgl@bgdev.pl>
References: <20230123103338.230320-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 23 Jan 2023 11:33:38 +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There are four struct definitions in the driver that aren't used so
> remove them.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-sa8775p: remove unused variables
      commit: e710abbb1740e60c9f09907cd97e1270055ecdb2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
