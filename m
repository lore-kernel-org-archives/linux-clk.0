Return-Path: <SRS0=Gp7K=VN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587AEC76188
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jul 2019 04:11:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C32B21721
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jul 2019 04:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563250307;
	bh=fZj1qB+pjWuEWAVMVLEwuCcbl0V1HF+HFQJl9xEe/Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UCj+00bw3PRMb3hqDkeZ3gw7F2///33qT/mWEGVX1SXBofilsbH3pkNHQP8u/YEr+
	 fM0ots5b6mVZzESLSZn9L8WgyQnZ3f2QjrxUmZkPias95dZKtiU50+jsVdsuhjKEC4
	 l4Qa4k02S14/exAtzq5UaebY7vrFwnAznibL+nfw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfGPELq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Jul 2019 00:11:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:47872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbfGPELq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Jul 2019 00:11:46 -0400
Received: from localhost (unknown [122.178.232.136])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3AF3420880;
        Tue, 16 Jul 2019 04:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563250306;
        bh=fZj1qB+pjWuEWAVMVLEwuCcbl0V1HF+HFQJl9xEe/Wg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2h1PKJTHWWA/TQPoc1+i9xaHR5lRp2h96byj/6k5vZUHFjuDis936ZGXa4dI5bKj1
         /4VNJgTZ8g1UfM83inCpj0kWNxdsIMEn7dDv7Q0xU7tSfkTioqBAk8IrpZQ851AgFa
         ag6Ms2GNs3XroKAtYScxbsu1nWo2s3a0QBliY0eE=
Date:   Tue, 16 Jul 2019 09:38:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 1/3] clk: qcom: clk-alpha-pll: Remove post_div_table
 checks
Message-ID: <20190716040838.GB12733@vkoul-mobl.Dlink>
References: <20190625063140.17106-1-vkoul@kernel.org>
 <20190625063140.17106-2-vkoul@kernel.org>
 <20190716000846.GK30636@minitux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716000846.GK30636@minitux>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15-07-19, 17:08, Bjorn Andersson wrote:
> On Mon 24 Jun 23:31 PDT 2019, Vinod Koul wrote:
> 
> > We want users to code properly and fix the post_div_table missing and
> > not reply on core to check. So remove the post_div_table check.
> 
> s/reply/rely/

Thanks for pointing, will update

-- 
~Vinod
