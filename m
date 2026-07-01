Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9750B29DB9A
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914955; cv=none; b=FpzALiLLfwen9gldXspKGwhrAzaqrdwMMCgeQGLZT/B1UTR4zPHG59aBMfEqqiaNtU8DdXxEeAV3pTzIEX/nSIM4DMEGjk70guIKCfNkvsYJV/PfGa4GUfYtlMolIKxSwSoWzLoPiSfEv5Lk0JBSje/oH6J4o1FI1nFkJlsKEPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914955; c=relaxed/simple;
	bh=Rr9nTxauw3Ld+d8F57iqszED//Wn2JjDdovTpTeRCzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZr181OzWWkcPIBJ86xEknWeFjGyexWxh7idjryTpopgiufLFmG6J4B++TC/B2RFE7wzQUQxeXXeDgDThR3rJa20EKFxstc+fFjgIeDF2pueI0zVxmRubP5Dk7TtB3ikDHj+3p1pszPbkR/wixYvV/Dxz3PBAtV6cwes1898Y5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXf3h7t/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vgz3vSYN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NXf3h7t/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vgz3vSYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782914953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fg1jQ5xlQw7jkowSdvyp9ysqaIiouFFtIXbXuCa9asQ=;
	b=NXf3h7t/H2NYSES3LNQIpP+JmTrBrOmxtfV3n3JztEvatR8tUASRAtFCh8uz/6pjfKhYhs
	X5IekaIVTKza0xhNCN/XxWg8SxGtY9MHhheHAC1d5vGEcPI7b0BACnAeAqWg03Yu31CL/9
	7Gom86SoN7kFtTEWYKLQirLkDnL6tys=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-9E3_Q5GBP9yuW0LK0eRllQ-1; Wed, 01 Jul 2026 10:09:12 -0400
X-MC-Unique: 9E3_Q5GBP9yuW0LK0eRllQ-1
X-Mimecast-MFC-AGG-ID: 9E3_Q5GBP9yuW0LK0eRllQ_1782914952
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f27f49bso67352785a.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 07:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782914952; x=1783519752; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fg1jQ5xlQw7jkowSdvyp9ysqaIiouFFtIXbXuCa9asQ=;
        b=Vgz3vSYNbWxy6s3rUxXJOa1nsMmWKANEhpsTCmFBBZzoG69L1znoUpVqfVD+KDCokn
         b5yFO3glpb1Kk4AMX5VTHUQ8IgFHH9aG7+6wUr7htyywIpuLlBgfv96lY2vdAcB3QJvq
         8pgW/ILDIHtP97SQ/Y/YcuEwfBJNrPVvgs8Sd/66o1PkUMk5df5zDKrGNlyTAqfihrQx
         Nhkq84+StkzsjYtaOY6OUUE6wNIPnIIlwgsKERGX4je4x3LeRCf491+v+VOAFNe7BiK0
         XQiwW/viCO0BHN5KlmiPYwwYbl80DrdRy/ogyef0mYP1myqlmVw90NiQWHt+R4jHDnjA
         SWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782914952; x=1783519752;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fg1jQ5xlQw7jkowSdvyp9ysqaIiouFFtIXbXuCa9asQ=;
        b=rzkuq2Vj6UY8inX9mzCPianXiO3WopboBqFwWtDfDVAatUtRYYAgYjvePCcEjabfI/
         PlW6n3A7QbtY8EhTGQ22bBGhYao7YKln/h6xmjHYGIXJkvluP6bOhNd6w2mgD8PUciH2
         HjRoGNGBe50bVS1JQ4fe/ognYBZVgGfa4S2nwIRBk6C57mTcr9ej/rXy2+2OSEPZPErX
         mdZey09piP2De/RXIHOHtUppkMDb91Ncuhl/Grh0RJ8apj/GTNZyDYO2SwjFy4ZPA45F
         LN2VJIdBEsa48echKU/n52BmzNThOomQogdJiwtt9VLj6Ug06GaDSU7T4e3tOTWf25FS
         FbWg==
X-Forwarded-Encrypted: i=1; AFNElJ+NYDwmiY2bzHB1lceL9d47qFBqWJRyq0rfv0UaCoJRL1+FFk3inmi+FVpFJUKYlF4c6wEFiTZphWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVi4kqzYFqT6L4Bx1poKegUMWdjGIb3Jb75hNWD4+PmSAjWQ2W
	ACwQjJwgTDGTEbqZhurkIFUHPtAQYJB+lNkwzy2Tezq+lfNNhNCcB6FbuLkTo04ihAQUIB57IYf
	V3gOEVETXihDEhTo8fvhfNqbkv4LwantoE9r3CjME8cJXmZ1VkgMfDcgrtec28Q==
X-Gm-Gg: AfdE7cmcll5J/J0siuZGltAsX2NnIios4eF4SYkv+LVwnZvjQRxWcf7hN4wa8JkYcLx
	tjOnmkik/9hqmV6DSSY9GmYcmldesbdG6Cd6KQPwkmsfGYNq4pM4oerx2fbljn6MfPIqPkqUnFQ
	IzE30YmKSeDr+Hhzjon/WPZM6j8FJ2FddsQwUHyja2kaHuNvs6KSrpMlzt7bGO8680fSaEeWjvw
	GSqTGDgXKzkPMR/6oIj7eAMfNS9sz4x+ID2ACDKgu9IRKHtnsdigGR+J6MAe+9Bx5HARESQ3MR0
	pTD274u6MNmLCts5WkWJjFbwM10WYADde1XW4kZkpXZJkRS3jo/VBy6lc/uZZYHrovkObM6AKTZ
	qxsWqhJQmnax3jWN5y3vqhkss8pe7C2HEoqQlNtWFTscoRg==
X-Received: by 2002:a05:620a:6405:b0:92e:72cd:32f4 with SMTP id af79cd13be357-92e78504000mr245373185a.64.1782914951716;
        Wed, 01 Jul 2026 07:09:11 -0700 (PDT)
X-Received: by 2002:a05:620a:6405:b0:92e:72cd:32f4 with SMTP id af79cd13be357-92e78504000mr245365485a.64.1782914951052;
        Wed, 01 Jul 2026 07:09:11 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e6234862csm564321785a.38.2026.07.01.07.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:09:09 -0700 (PDT)
Date: Wed, 1 Jul 2026 10:09:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
Message-ID: <akUfhLO0I2NqqIYi@redhat.com>
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
 <56ebd97b-0834-41ac-8fdb-2469e2848694@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56ebd97b-0834-41ac-8fdb-2469e2848694@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Jagadeesh,

On Wed, Jul 01, 2026 at 09:37:04AM +0530, Jagadeesh Kona wrote:
> This probably could be due to camcc_gdsc_clk getting turned OFF during the
> sync_state, but this clk is required for GDSC transitions. The camcc_gdsc_clk
> is currently kept always ON from probe in camcc-sc8280xp, but the clock is
> also modeled with clock framework, so the clock can get disabled in sync_state
> callback now.
> 
> Can you please try removing the modelling of camcc_gdsc_clk using below diff
> and see if helps here?
> 
> 
> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
> index e97b8d4f3c84..660d8655d391 100644
> --- a/drivers/clk/qcom/camcc-sc8280xp.c
> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
> @@ -1753,24 +1753,6 @@ static struct clk_branch camcc_csiphy3_clk = {
>         },
>  };
> 
> -static struct clk_branch camcc_gdsc_clk = {
> -       .halt_reg = 0xc1e4,
> -       .halt_check = BRANCH_HALT,
> -       .clkr = {
> -               .enable_reg = 0xc1e4,
> -               .enable_mask = BIT(0),
> -               .hw.init = &(struct clk_init_data){
> -                       .name = "camcc_gdsc_clk",
> -                       .parent_hws = (const struct clk_hw*[]){
> -                               &camcc_xo_clk_src.clkr.hw,
> -                       },
> -                       .num_parents = 1,
> -                       .flags = CLK_SET_RATE_PARENT,
> -                       .ops = &clk_branch2_ops,
> -               },
> -       },
> -};
> -
>  static struct clk_branch camcc_icp_ahb_clk = {
>         .halt_reg = 0xc0d8,
>         .halt_check = BRANCH_HALT,
> @@ -2839,7 +2821,6 @@ static struct clk_regmap *camcc_sc8280xp_clocks[] = {
>         [CAMCC_CSIPHY2_CLK] = &camcc_csiphy2_clk.clkr,
>         [CAMCC_CSIPHY3_CLK] = &camcc_csiphy3_clk.clkr,
>         [CAMCC_FAST_AHB_CLK_SRC] = &camcc_fast_ahb_clk_src.clkr,
> -       [CAMCC_GDSC_CLK] = &camcc_gdsc_clk.clkr,
>         [CAMCC_ICP_AHB_CLK] = &camcc_icp_ahb_clk.clkr,
>         [CAMCC_ICP_CLK] = &camcc_icp_clk.clkr,
>         [CAMCC_ICP_CLK_SRC] = &camcc_icp_clk_src.clkr,

So there is the CLK_IGNORE_UNUSED flag that can be added so that we can
keep the clock defined.

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 18f5a3eb313e1..9a525347fb2a4 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -1766,7 +1766,7 @@ static struct clk_branch camcc_gdsc_clk = {
                                &camcc_xo_clk_src.clkr.hw,
                        },
                        .num_parents = 1,
-                       .flags = CLK_SET_RATE_PARENT,
+                       .flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
                        .ops = &clk_branch2_ops,
                },
        },

This patch fixes the issue for me. I see that camcc_sc8280xp_probe()
has this:

        /* Keep some clocks always-on */
        qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */

I'll submit a proper patch for this shortly.

Do you by chance work on the team that deals with clocks at Qualcomm? If
so, it would be really nice if your team could make the time to help
review a patch set that I have to fix some scaling issues with clocks.
Here's some details:

https://lore.kernel.org/linux-clk/akPcgdjlDxd-JmYb@redhat.com/

This is two messages up in the same thread that has an example kunit
test snippet showing the problem:
https://lore.kernel.org/linux-clk/CABx5tqK3MymYQZ4owofnzFLnjt+96njw5RG2Vwxo7UJ93A-42g@mail.gmail.com/

Thanks,

Brian

