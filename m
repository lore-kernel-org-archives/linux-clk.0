Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975B1C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:34:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244722AbiEKOes (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbiEKOeq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:34:46 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808E46B004
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:34:45 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id n8so2086621plh.1
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MhOchhliyqvD/fDprf+7mSJg0pmzKYErDvnqXI8SdZ8=;
        b=mc/JyeED3yQ2BjAkmfjKhD0nmAY2sGlgjXuK81sBCjqECSkrbPCWrP0RoQQq0gl9Ed
         AooB3VKc5xmiG0XJh4laAENA7HzRh8ysZ1U+9OQTieH0gtQRkdh3FlHyN3vzNZwdjQli
         FE3GOcVXsRTCB6AQhBodhUZYnbewAEZxQWxN/ECf008jV6GQhZsiAJU+fscrYJkFlx2Q
         FBP6EqV+zTH3qDndp3KE3m8VFHsvZeHTMwXgvHQqa/+RBSgnblnZZugwQ/R3wVZ1+AUe
         HaGCQWnElK794UYSVkTmgjFF+5pP+hafkPIdHZWnAu9H07K9TTgpwxKLgbWujqk4dOxn
         y/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MhOchhliyqvD/fDprf+7mSJg0pmzKYErDvnqXI8SdZ8=;
        b=Y5KUJWasyRDuQWbXMNHMvvQtorbbj7Sat8/GiwCl61Kht/2SmnGEeVkBGyd7DGbV7c
         H8lE1oH4X+tNNxFMhWIpPLoEmSaACOkKj7NxvQ6DvH53Rur9PNVprb8e5RHEbVyZaz2X
         whpHx2450nzzLmtc121gCotUaa52EEIYkj7sr9vJPTrvQTJfYDGzr+KyEZB80w/d9KOV
         DWnl4Zzv3m3Z3YFpz0BWXNonRujm61YYvYl7wC2lJGb2pxoT5xYy8yn9oYFAJHtjR45Q
         ehBJP6Br/jloWxEQnqSCpwobIcJyBgl8TIh3ubcQ481aYQn61q6/oIxcxwVJLh+pG9L3
         GzVQ==
X-Gm-Message-State: AOAM5302GIF9Qus0hlV0K2Mm+VPB4UxhiCOTAn4qUTKI6CUmK25ND4SZ
        L431PAekVZaWmr/sMadnz+WR
X-Google-Smtp-Source: ABdhPJz2+4vMI8VtPsUXSrJVs7Qfa0zuC9D2DOnpyqBMogXTwJNszsdtByLkAkfH4vjh/ReNC97d4A==
X-Received: by 2002:a17:902:d487:b0:15e:a0a4:69e3 with SMTP id c7-20020a170902d48700b0015ea0a469e3mr26180679plg.155.1652279684939;
        Wed, 11 May 2022 07:34:44 -0700 (PDT)
Received: from thinkpad ([117.217.183.109])
        by smtp.gmail.com with ESMTPSA id n23-20020a17090a929700b001cd60246575sm13859pjo.17.2022.05.11.07.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 07:34:44 -0700 (PDT)
Date:   Wed, 11 May 2022 20:04:35 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <quic_pmaliset@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 2/5] clk: qcom: regmap: add pipe clk implementation
Message-ID: <20220511143435.GA4067@thinkpad>
References: <20220501192149.4128158-1-dmitry.baryshkov@linaro.org>
 <20220501192149.4128158-3-dmitry.baryshkov@linaro.org>
 <20220502101053.GF5053@thinkpad>
 <c47616bf-a0c3-3ad5-c3e2-ba2ae33110d0@linaro.org>
 <20220502111004.GH5053@thinkpad>
 <29819e6d-9aa1-aca9-0ff6-b81098077f28@linaro.org>
 <YnUXOYxk47NRG2VD@hovoldconsulting.com>
 <30846cb5-a22e-0102-9700-a1417de69952@linaro.org>
 <YnjtJuR7ShSsF+mz@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnjtJuR7ShSsF+mz@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 09, 2022 at 12:29:58PM +0200, Johan Hovold wrote:
> On Fri, May 06, 2022 at 04:00:38PM +0300, Dmitry Baryshkov wrote:
> > On 06/05/2022 15:40, Johan Hovold wrote:
> > > On Mon, May 02, 2022 at 02:18:26PM +0300, Dmitry Baryshkov wrote:
> > >> On 02/05/2022 14:10, Manivannan Sadhasivam wrote:
> > > 
> > >>> I don't understand this. How can you make this clock disabled? It just has 4
> > >>> parents, right?
> > >>
> > >> It has 4 parents. It uses just two of them (pipe and tcxo).
> > > 
> > > Really? I did not know that. Which are the other two parents and what
> > > would they be used for?
> > 
> > This is described neither in the downstream tree nor in any sources I 
> > have at possession.
> 
> Yeah, I don't see anything downstream either, but how do you know that
> it has four parents then?
> 

This information is available in Qcom's internal GCC documentation.

Thanks,
Mani

> Johan

-- 
மணிவண்ணன் சதாசிவம்
