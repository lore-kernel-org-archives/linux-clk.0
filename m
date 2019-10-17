Return-Path: <SRS0=WJPE=YK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204D9ECE58D
	for <linux-clk@archiver.kernel.org>; Thu, 17 Oct 2019 19:05:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E73E421835
	for <linux-clk@archiver.kernel.org>; Thu, 17 Oct 2019 19:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571339152;
	bh=toqS/oRagGECW/akHziKfhK68EYgrkhURwJYMWrrbug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1oc+OTa2BtBu1CLdpu2NkbsVW1yFGYnqIaiq4gkDob9KRxmkWcIgtvrZ8ChqDaPB7
	 Fxa41XdzHWQP5Tc/+51xv+RrN9PFiUVv49cceoNpKUX1SFO+gjcAg7ECL+rsGMhWPF
	 ZetQREz8av8Jj3JaVvhdCv6j76uHoCDwwJmia2To=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390206AbfJQTFv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Oct 2019 15:05:51 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45794 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503244AbfJQTFu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Oct 2019 15:05:50 -0400
Received: by mail-oi1-f193.google.com with SMTP id o205so3079476oib.12;
        Thu, 17 Oct 2019 12:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pIwNPuLqrVC0vwajFKZ34bu7NezvOZ+RIARbVf4/Xog=;
        b=dnf1vF0tzUMvxCfwtQYoYLqceRmtAv0WeLil0SG5pqEa/p1BEzOctS9MLSmCVWY4Rx
         9rhkYkjpkau2VM9DsELYIg7tS+oh90AKTjELPOdN/RhmtuRTEjzpQsLTUX87+L34WO4M
         LpNxHxFIbB+vmDVif3ylCEuiS2LyxTYJ7K1ICALRXfM5Yb8CknTgjz+o0q6NJPJgmDX2
         1sJ3+L2KYDrJo+MRs8O7eXn3g4nMpAD6Fzzca0XzeGMZsS5NF3TMO06dj0n33+zVrMIh
         KmWd+cPuunGJ6mfS4huMSspEkg4Q8ZjNqt41/FQROxSJDbqe+f17nIEg7grtB2icMdks
         ii1w==
X-Gm-Message-State: APjAAAVodctno7nVy/wpBz6kOUl8bYPk3PQ//J6YLzTjunlpK69rG8T7
        dkJNm8muRqHIryQ1pHJa0A==
X-Google-Smtp-Source: APXvYqxqoO+d64tKehv+8gK5U/uIPPyn1squ0aYUSe8BE5CEimvcE3Sd6bk4nkwIseCWIpcr3b3B5w==
X-Received: by 2002:a05:6808:917:: with SMTP id w23mr4405839oih.68.1571339149780;
        Thu, 17 Oct 2019 12:05:49 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z16sm799423otq.78.2019.10.17.12.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 12:05:48 -0700 (PDT)
Date:   Thu, 17 Oct 2019 14:05:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        agross@kernel.org, bjorn.andersson@linaro.org, marijns95@gmail.com,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: Document MSM8976 gcc
 compatible
Message-ID: <20191017190547.GA10490@bogus>
References: <20191015103221.51345-1-kholk11@gmail.com>
 <20191015103221.51345-3-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015103221.51345-3-kholk11@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 15 Oct 2019 12:32:21 +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Document the Global Clock Controller driver (gcc-msm8976)
> compatible string.
> This driver is valid for MSM8976, MSM8956 and APQ variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
