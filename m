Return-Path: <SRS0=14qQ=Y4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BC8CA9EB5
	for <linux-clk@archiver.kernel.org>; Mon,  4 Nov 2019 18:12:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2A832084D
	for <linux-clk@archiver.kernel.org>; Mon,  4 Nov 2019 18:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728174AbfKDSMm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Nov 2019 13:12:42 -0500
Received: from smtprelay0076.hostedemail.com ([216.40.44.76]:56688 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727998AbfKDSMm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Nov 2019 13:12:42 -0500
X-Greylist: delayed 494 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Nov 2019 13:12:41 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 2787218020B00;
        Mon,  4 Nov 2019 18:04:28 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 35FEA8384368;
        Mon,  4 Nov 2019 18:04:26 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: hour56_60b9b720d6924
X-Filterd-Recvd-Size: 1844
Received: from XPS-9350.home (unknown [47.151.135.224])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Mon,  4 Nov 2019 18:04:24 +0000 (UTC)
Message-ID: <d3626d96b7fb9e0b1b25159a85d337f8882ceca1.camel@perches.com>
Subject: Re: [PATCH v5 1/3] clk: qcom: Allow constant ratio freq tables for
 rcg
From:   Joe Perches <joe@perches.com>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     agross@kernel.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 04 Nov 2019 10:04:14 -0800
In-Reply-To: <20191031185715.15504-1-jeffrey.l.hugo@gmail.com>
References: <20191031185538.15402-1-jeffrey.l.hugo@gmail.com>
         <20191031185715.15504-1-jeffrey.l.hugo@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 2019-10-31 at 11:57 -0700, Jeffrey Hugo wrote:
> Some RCGs (the gfx_3d_src_clk in msm8998 for example) are basically just
> some constant ratio from the input across the entire frequency range.  It
> would be great if we could specify the frequency table as a single entry
> constant ratio instead of a long list, ie:
> 
> 	{ .src = P_GPUPLL0_OUT_EVEN, .pre_div = 3 },
>         { }
> 
> So, lets support that.
[]
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
[]
> @@ -29,6 +29,9 @@ struct freq_tbl *qcom_find_freq(const struct freq_tbl *f, unsigned long rate)
>  	if (!f)
>  		return NULL;
>  
> +	if(!f->freq)
> +		return f;
> +

trivia:

Space after if before open parenthesis please.

Can you please make sure to style check your
code with checkpatch before submission?

Thanks.


