Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D658CCCA47F
	for <linux-clk@archiver.kernel.org>; Tue, 19 Jul 2022 18:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiGSSuB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Jul 2022 14:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiGSSuA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jul 2022 14:50:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8C98A558D9
        for <linux-clk@vger.kernel.org>; Tue, 19 Jul 2022 11:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658256598;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Zpo29MvasfiTpO+hCJwTY/XSpk51yka6wjXW4TfwPs8=;
        b=i1rRFoT/WDLYc8unRcuSRTrjsPFtcUUjANCPQ06ppbaxKwNod1ttBeK/J5JeIIWkyeScOx
        pND5BvS3uaS7jCliCnb2YMHI0L22rLwXdZErAitD02tmcUVOsDG/6dR3B+zCO5THTMMae6
        vgVuce+yfN0nOdTfsjSrvLFwvs8ki3M=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-SbtXB7Q_NOSPNEM1dW9WIQ-1; Tue, 19 Jul 2022 14:49:57 -0400
X-MC-Unique: SbtXB7Q_NOSPNEM1dW9WIQ-1
Received: by mail-qt1-f200.google.com with SMTP id x16-20020ac85f10000000b0031d3262f264so10858890qta.22
        for <linux-clk@vger.kernel.org>; Tue, 19 Jul 2022 11:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Zpo29MvasfiTpO+hCJwTY/XSpk51yka6wjXW4TfwPs8=;
        b=iSnCrbOlJaHYvRbY3yobZDhWW48FH2CHul2CBopKfIk07Wa1zKyO139iAvBLljEkf4
         ADSWKNt0ReQ2TtDiMQ0IZjVruBXFeOQiHPWHcF33B5Tq1zSEnQGvygEkZFVnK7t78tlm
         NdelU9CBx0ZazH8txKTJ45q2+OQCFP6Zkt9+7A0dA32uXA7e+HqWM8yN2/1k0OTFEOdp
         YFfqU3gHXGKVrn2LpKYlMvHmEd+6W72P91Ni7OHuXgeXPMh970Xs4AMOGWGUPSzmnFlw
         lJg1vi/vRpPPy07brotkzajNd2vlAxj97MTPtpwO87Hlk3Nysrf3pJhkAKEuQdEi2zC/
         7XKg==
X-Gm-Message-State: AJIora/XC2FwC8Si04ni53wRDopUM5VS1P+UF15cI7YKJ4c5a6CgegS4
        CnXm18Xa3LBLu7qKpe/JD73Pf/9Q1vRuJF5KPVuY8sQzgq0nEl2bHeLYXLkhmcUFgo2XFvuK57C
        Xg9Caznc4KIA71zzsqL4U
X-Received: by 2002:a05:622a:1a21:b0:2f1:f29e:40a with SMTP id f33-20020a05622a1a2100b002f1f29e040amr26798503qtb.235.1658256596429;
        Tue, 19 Jul 2022 11:49:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tUmvtT6aOxIhnL81/99ndgIpfUhoigGNkE5QKN0nk4V6C1/YeKG2G1/zIX5RwrWin+GY3hVw==
X-Received: by 2002:a05:622a:1a21:b0:2f1:f29e:40a with SMTP id f33-20020a05622a1a2100b002f1f29e040amr26798489qtb.235.1658256595987;
        Tue, 19 Jul 2022 11:49:55 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id ec5-20020a05620a484500b006b59eacba61sm14223524qkb.75.2022.07.19.11.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 11:49:55 -0700 (PDT)
Date:   Tue, 19 Jul 2022 14:49:52 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com
Subject: Re: [PATCH] clk: qcom: sc8280xp: add parent to gcc_ufs_phy_axi_clk
 for sa8540p
Message-ID: <Ytb80EEEweVWHtA+@xps13>
References: <20220623142837.3140680-1-bmasney@redhat.com>
 <YtLRM7vQhimGFimN@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtLRM7vQhimGFimN@builder.lan>
User-Agent: Mutt/2.2.6 (2022-06-05)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Jul 16, 2022 at 09:54:43AM -0500, Bjorn Andersson wrote:
> gcc_ufs_ref_clkref_clk isn't the parent of gcc_ufs_phy_axi_clk.
> 
> But I presume that if this works, then you're just enabling the ufs
> clkref clock, indirectly. Seems reasonable that you should be specifying
> gcc_ufs_ref_clkref_clk as "ref_clk" instead.
> 
> Could you please give that a go?

Hey Bjorn,

I assume you mean ref_aux on the phy with this patch:

--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1464,7 +1464,7 @@ ufs_mem_phy: phy@1d87000 {
                        clock-names = "ref",
                                      "ref_aux";
                        clocks = <&rpmhcc RPMH_CXO_CLK>,
-                                <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+                                <&gcc GCC_UFS_REF_CLKREF_CLK>;
 
                        resets = <&ufs_mem_hc 0>;
                        reset-names = "ufsphy";

This works on the sa8540p.

I tried changing ref_clk on the ufs host controller from
<&rpmhcc RPMH_CXO_CLK> to the new value and the board resets.

Brian

