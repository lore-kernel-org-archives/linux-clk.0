Return-Path: <SRS0=L9C4=YH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD33ECE587
	for <linux-clk@archiver.kernel.org>; Mon, 14 Oct 2019 14:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FBE821721
	for <linux-clk@archiver.kernel.org>; Mon, 14 Oct 2019 14:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571064049;
	bh=EkoDDEa39Do+cD4V0hiPnnTwi6nZkxPnp2dMscMgzh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UbzBYm2XzPK8a+8Qo8cs16XnsTsFlheQ/lLhOhMl2bN4FrnTk+ezEsvJIkaQ6Rvl4
	 xirJ1D8xL/BbrhrjFDu5tp/SPH7A4+8m1K2z0AWDk0OXylVsFP81I3hhehIFrX+aXm
	 XItOhSAq684TTEV8p4rGJt9d7+jII1KOvHbMD5dc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732710AbfJNOks (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Oct 2019 10:40:48 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46652 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731121AbfJNOks (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Oct 2019 10:40:48 -0400
Received: by mail-ot1-f67.google.com with SMTP id 89so13964138oth.13;
        Mon, 14 Oct 2019 07:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rLrRGqFZt1p0PLygZY0bZGBBrDuXlpvEtk83drT5qNA=;
        b=uPz89mGm5n4lGtmtcXz7yXVLCKHwvqnkyt4DP4Aj6MXiCfyrtWbiqb+uO4vSzCow1H
         2Zj1Yy3skT8/rNdJtFKBtubHZdvGLB81WJN5tXkqLuiM6nMS6cYBk5NBxyBERorsoHhp
         TlryM/9EnY/V2VZJYlIW2jjjTvDEu5TiVNc9TLKXRoDChs2OCSy9GXRdJDpGhFyRoFhg
         suckjUPA9BlYpO5EXpAOMxg7PldXbXiIbbIY23k3kpPgY8nW7AcxyHvcERTcWN423xc/
         zXKfWvrxmrzXXT6zNSe8UMC/J73aLHZ81Czu96ZavHYfCOfNFNNod9QJQ2rJ5n7G2gcK
         Vc/g==
X-Gm-Message-State: APjAAAW8Ol10LjixWIh3c1U9S/DxfneLBfNKx7u4I9mKjogbR/w+5AFF
        yt7Bcmxi3CxoN9olxkgcog==
X-Google-Smtp-Source: APXvYqztWmaWZJARjqFjThQ4FwgtdG5tL2swxxJ7bQZ2NmrMfIERNofp7HVxfpHfZ/vtatSEGEuTQQ==
X-Received: by 2002:a9d:684c:: with SMTP id c12mr25367239oto.341.1571064047696;
        Mon, 14 Oct 2019 07:40:47 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n39sm5714031ota.33.2019.10.14.07.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 07:40:47 -0700 (PDT)
Date:   Mon, 14 Oct 2019 09:40:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Govind Singh <govinds@codeaurora.org>
Cc:     robh@kernel.org, sboyd@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock
 controller bindings
Message-ID: <20191014144046.GA23210@bogus>
References: <20191011132928.9388-1-govinds@codeaurora.org>
 <20191011132928.9388-2-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011132928.9388-2-govinds@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 11 Oct 2019 18:59:27 +0530, Govind Singh wrote:
> Add devicetree binding for the Q6SSTOP clock controller found in QCS404.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../bindings/clock/qcom,q6sstopcc.yaml        | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
