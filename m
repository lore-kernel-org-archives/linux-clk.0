Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C252C7EE2F
	for <linux-clk@archiver.kernel.org>; Sat, 27 May 2023 01:04:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238228AbjE0BEA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 May 2023 21:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238135AbjE0BD4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 May 2023 21:03:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC781A2;
        Fri, 26 May 2023 18:03:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CB0D2654C3;
        Sat, 27 May 2023 01:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953CCC433AF;
        Sat, 27 May 2023 01:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685149434;
        bh=GHblA9PThtMpAqEBdoykOdEG+1iRZcceHoc0kkgonqc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lV6t8E4pgeO+fegj4OO9aDfelbpRIPSZGHkBvAn7hmt7UwzxmeTmKKJJSIG+dDDuB
         FFmRGvdhosc9Vv2bVHEHjM+AcY/hOlUpp5ZEKeB62SotZqDvErFdmgBS1rXOuqtL6Z
         o/mHdZnktNfiOzV4AvyrEpbOjsSQE87Wr5C4lSgBnkZSzFtYIsMDh+D/FDsVCGvSCC
         +WwcqV4NnP/iKutg5jUMJrNJ+NT+Krsaf/BiO2Reru3XAycO9/dQoNQKhr7AvuLbkL
         ih/MhzhDGYksnGZ/F/brG0+SmJKxzJriLJDsXRZjZZ8P090jF1AN13xi1LZDGLJiMx
         9CoFP3r9v4GKQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-clk@vger.kernel.org,
        Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org
Subject: Re: [PATCH] clk: qcom: ipq5332: fix the src parameter in ftbl_gcc_apss_axi_clk_src
Date:   Fri, 26 May 2023 18:07:29 -0700
Message-Id: <168514964950.348612.17048019037174387302.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417044342.9406-1-quic_kathirav@quicinc.com>
References: <20230417044342.9406-1-quic_kathirav@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 17 Apr 2023 10:13:42 +0530, Kathiravan T wrote:
> 480MHz is derived from P_GPLL4_OUT_AUX not from P_GPLL4_OUT_MAIN. Update
> the freq_tbl with the correct src.
> 
> 

Applied, thanks!

[1/1] clk: qcom: ipq5332: fix the src parameter in ftbl_gcc_apss_axi_clk_src
      commit: 81c1ef89a45eccd5603f1e27e281d14fefcb81f9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
