Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53F5C636F9
	for <linux-clk@archiver.kernel.org>; Fri,  2 Dec 2022 20:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234204AbiLBU66 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 15:58:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234149AbiLBU66 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 15:58:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D583EAB42;
        Fri,  2 Dec 2022 12:58:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3AC1B623E3;
        Fri,  2 Dec 2022 20:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0262EC433D6;
        Fri,  2 Dec 2022 20:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670014736;
        bh=Yr1PEvQ+ZEHC3rq/dNAn0BB7nX0No5OXt5Ex9lWhLdU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZsCGSQ9kBEYUsWOoRZjl0ZsZr7726GuycwGdLT+ePQXsxyVItPEf4sTxm8NlZCL2M
         uJO7q1ZebH3g0cQLl6j3cPSjgCYOLBeIe6BIUeoq2EsnTFWhoduNkpgAzXsWMG3402
         I1WbIxG7nGqwTdWpFEXLUnAkd4Y6oiItQEGvXtvylIs+reXAR9cjxqpfxCqAFgof5W
         Vs83YaHq5Pf03JFmQQV4ArHo+qKC8ntbD8vqFqLqWX9BD7hv3NIW31LBZ2r19kItT3
         xPE9P9SMNllZpVI9A3GV/O7EgZu5mmh8LBuGdxPErAM0AoU3JVyreaBaCCLvG5bGJM
         ZSuIiao+5oFBg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     konrad.dybcio@somainline.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        mturquette@baylibre.com, linux-kernel@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: kpss-xcc: register it as clk provider
Date:   Fri,  2 Dec 2022 14:58:42 -0600
Message-Id: <167001472421.2721945.15982523175698665071.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221108211734.3707-1-ansuelsmth@gmail.com>
References: <20221108211734.3707-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 8 Nov 2022 22:17:34 +0100, Christian Marangi wrote:
> krait-cc use this driver for the secondary mux. Register it as a clk
> provider to correctly use this clk in other drivers.
> 
> 

Applied, thanks!

[1/1] clk: qcom: kpss-xcc: register it as clk provider
      commit: 09be1a39e685d8c5edd471fd1cac9a8f8280d2de

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
