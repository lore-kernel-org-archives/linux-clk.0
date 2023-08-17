Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA02C64EC0
	for <linux-clk@archiver.kernel.org>; Thu, 17 Aug 2023 20:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355080AbjHQU67 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Aug 2023 16:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355097AbjHQU6c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Aug 2023 16:58:32 -0400
X-Greylist: delayed 90 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Aug 2023 13:58:31 PDT
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A0826BB
        for <linux-clk@vger.kernel.org>; Thu, 17 Aug 2023 13:58:31 -0700 (PDT)
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
        by cmsmtp with ESMTP
        id WQQnqwsz3QFHRWk3Bqn0Cw; Thu, 17 Aug 2023 20:57:01 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with ESMTPS
        id Wk3AqjQYpor5tWk3Aqw4EG; Thu, 17 Aug 2023 20:57:00 +0000
X-Authority-Analysis: v=2.4 cv=Vqcwvs6n c=1 sm=1 tr=0 ts=64de899c
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=IpJZQVW2AAAA:8 a=cm27Pg_UAAAA:8
 a=vO73nbbZ3KiERqEehhIA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=cvBusfyB2V15izCimMoJ:22 a=IawgGOuG5U0WyFbmm1f5:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=al2JraySz4Y/nPRNsqZbRF4Ul/8ysGw80iLcTMhMqyg=; b=RJc1tSlduq4F3dGL6LlDVnuap6
        +bqyVurTa2rldyvuEFVel4+FHkb1+mkCzz0yARsiDbBm2lHDqYOOtOuWWiw7sfSE85uqivQazNw07
        O0mwM1Nuc7gRH/9b8YFTyTA/sTZ5tvEg+1tXf2LvJfadtJn3vPqlKmdWezATiNrbK3T1b3P/kctWo
        /8e8Ro5q/YWeNdkpKwIk2EDUBceBxMWviQTPavZ+N72YtLLTHhrAJxfJWm5utUr5FtEtkzytt3OsF
        DQbQREDHTqCl5ca3eQnuLiagvUEtZ+mRcFlzP7sTW1QdsMNKWiLMU9o92CN1NpqijXSbNxfhxBh9D
        BRzKKKIg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:33092 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.96)
        (envelope-from <gustavo@embeddedor.com>)
        id 1qWk39-001NVy-0V;
        Thu, 17 Aug 2023 15:56:59 -0500
Message-ID: <7da75c68-9a5c-c8cb-2b52-543968568124@embeddedor.com>
Date:   Thu, 17 Aug 2023 14:58:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] clk: qcom: clk-spmi-pmic-div: Annotate struct
 spmi_pmic_div_clk_cc with __counted_by
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230817202941.never.657-kees@kernel.org>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817202941.never.657-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qWk39-001NVy-0V
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:33092
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 81
X-Org:  HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHCMX9U6v22v+wgVbQwOqxBIoD7ObfF6/hY8jtVQZsNB97Dbe6m1TRZE9DBcHXexIKU7dNCZECppP4zE7OKERZB/aULZ5VrHKv8cnp2YyMfwDrBw+SLx
 cZIXjYMaMtjQDfKPEQoV+v29+GJMbH1WmFzPqMAqidvsWU0LPGRPCH9Xf6y/uVkFNABz6kt6bvJcQlE5Ww+hSmzlGUzVEsk7zyo=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 8/17/23 14:29, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct spmi_pmic_div_clk_cc.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/clk/qcom/clk-spmi-pmic-div.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
> index f846be285f51..f394031eb0e5 100644
> --- a/drivers/clk/qcom/clk-spmi-pmic-div.c
> +++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
> @@ -177,7 +177,7 @@ static const struct clk_ops clk_spmi_pmic_div_ops = {
>   
>   struct spmi_pmic_div_clk_cc {
>   	int		nclks;
> -	struct clkdiv	clks[];
> +	struct clkdiv	clks[] __counted_by(nclks);
>   };
>   
>   static struct clk_hw *
