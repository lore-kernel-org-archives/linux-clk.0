Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AABEEB64DA
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jun 2023 11:28:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjFZL2x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jun 2023 07:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjFZL2w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 07:28:52 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C1510D
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 04:28:50 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f954d7309fso3877937e87.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 04:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687778929; x=1690370929;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+m+HWADuI8txJr+WXtBskYCNdGlGOVr46UsKfQM6Lo=;
        b=JHsOfKu/1tn3pBMyBbDbZtg93k81jEr6Xb707421GZsbsNEZVsNQLaKSxlLW13k+PM
         Q0Klfy5TpI6yL2yUhMyvhUfWf21muYHIYR6sya6ICj+usZHoBzdsU0PP6oNVRjQCAzZn
         rdbfB52aWb88aU/fJzYtt52Dea2+t1LB8bsgVYkjXvOaz6suXQlYWXUn34IjjzmGKN4L
         NHD+y6c53hwOKRemPQUM4aG+fu1hcSavMoOGCrj6iYy2e5w8UctwjPXLIHe8glhkuJoI
         GJGHFEAqsupiNzpC7Stp8ntASaifC7H7fCzBRBxRAjodUZrFArJnLzNo7xcb9nmX6beA
         AjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687778929; x=1690370929;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6+m+HWADuI8txJr+WXtBskYCNdGlGOVr46UsKfQM6Lo=;
        b=W4AdKeFj+ZGbLjSCX6UC7UV+visA7GKUrXQ4H/YfPJi5ZVkwZs0e5pqXO1MJPSnvYh
         g+VhcCmfgCdaBB2AqWX/J76MenZ26cKoBv7z774+WAELojeHqQ+2IPYmyCN990iq8kAm
         vdzQte+7XZAjEx7pnYnlu3OYlj94IcxY1KgoHIG0YUJ0zQMd80smkVgZVQ/x1ebjnRc1
         aCITn9Du3edfXsAYOuTZU/KAEdrVjGrE/EBbco+z16MwPMhDMWmwUjUM5TTzPEvL7MiG
         26Ro08W3ei3OFfkdSQTq7RCOhsqiMgs2+FnGQJ5JfEKzH51n0/Z4nCj0FxrFKyphuj7b
         r/qA==
X-Gm-Message-State: AC+VfDxJEDZ1L+AOWCo9SXwXadktEAnKWNSiNAe8HvJZf5JNi1ilxSG9
        8D7bcszDaYDEpvACaR59CWTQWg==
X-Google-Smtp-Source: ACHHUZ7438MroKqR9FP0KLt4s2rTxYZzkx4y2B8xUzluztptmO3AtSJv6bRClIvFv6wjvfWD57lxWQ==
X-Received: by 2002:a19:2d4e:0:b0:4f8:453f:732f with SMTP id t14-20020a192d4e000000b004f8453f732fmr9481734lft.2.1687778928872;
        Mon, 26 Jun 2023 04:28:48 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id a22-20020a19f816000000b004fb77d6cab3sm235002lff.261.2023.06.26.04.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 04:28:48 -0700 (PDT)
Message-ID: <b5ff346b-cbde-68fe-a08a-3b3331439309@linaro.org>
Date:   Mon, 26 Jun 2023 13:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
 <20230625202547.174647-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 06/26] interconnect: icc-clk: add support for scaling
 using OPP
In-Reply-To: <20230625202547.174647-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25.06.2023 22:25, Dmitry Baryshkov wrote:
> Sometimes it might be required to scale the clock using the OPP
> framework (e.g. to scale regulators following the required clock rate).
> Extend the interconnec
't'

>-clk framework to handle OPP case in addition to
> scaling the clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
I think we should check for OPP at the icc-clk registration time,
instead of passing it as a parameter, e.g.:

qn.opp = IS_ERR(dev_pm_opp_get_opp_count)

Not sure if there's a more idiomatic way.

Konrad
>  drivers/interconnect/icc-clk.c   | 13 +++++++++++--
>  include/linux/interconnect-clk.h |  1 +
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/interconnect/icc-clk.c b/drivers/interconnect/icc-clk.c
> index 4d43ebff4257..c7962acdcee7 100644
> --- a/drivers/interconnect/icc-clk.c
> +++ b/drivers/interconnect/icc-clk.c
> @@ -7,10 +7,13 @@
>  #include <linux/device.h>
>  #include <linux/interconnect-clk.h>
>  #include <linux/interconnect-provider.h>
> +#include <linux/pm_opp.h>
>  
>  struct icc_clk_node {
> +	struct device *dev;
>  	struct clk *clk;
>  	bool enabled;
> +	bool opp;
>  };
>  
>  struct icc_clk_provider {
> @@ -25,12 +28,16 @@ struct icc_clk_provider {
>  static int icc_clk_set(struct icc_node *src, struct icc_node *dst)
>  {
>  	struct icc_clk_node *qn = src->data;
> +	unsigned long rate = icc_units_to_bps(src->peak_bw);
>  	int ret;
>  
>  	if (!qn || !qn->clk)
>  		return 0;
>  
> -	if (!src->peak_bw) {
> +	if (qn->opp)
> +		return dev_pm_opp_set_rate(qn->dev, rate);
> +
> +	if (!rate) {
>  		if (qn->enabled)
>  			clk_disable_unprepare(qn->clk);
>  		qn->enabled = false;
> @@ -45,7 +52,7 @@ static int icc_clk_set(struct icc_node *src, struct icc_node *dst)
>  		qn->enabled = true;
>  	}
>  
> -	return clk_set_rate(qn->clk, icc_units_to_bps(src->peak_bw));
> +	return clk_set_rate(qn->clk, rate);
>  }
>  
>  static int icc_clk_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
> @@ -106,7 +113,9 @@ struct icc_provider *icc_clk_register(struct device *dev,
>  	icc_provider_init(provider);
>  
>  	for (i = 0, j = 0; i < num_clocks; i++) {
> +		qp->clocks[i].dev = dev;
>  		qp->clocks[i].clk = data[i].clk;
> +		qp->clocks[i].opp = data[i].opp;
>  
>  		node = icc_node_create(first_id + j);
>  		if (IS_ERR(node)) {
> diff --git a/include/linux/interconnect-clk.h b/include/linux/interconnect-clk.h
> index 0cd80112bea5..c695e5099901 100644
> --- a/include/linux/interconnect-clk.h
> +++ b/include/linux/interconnect-clk.h
> @@ -11,6 +11,7 @@ struct device;
>  struct icc_clk_data {
>  	struct clk *clk;
>  	const char *name;
> +	bool opp;
>  };
>  
>  struct icc_provider *icc_clk_register(struct device *dev,
