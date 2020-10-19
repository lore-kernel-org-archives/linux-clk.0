Return-Path: <SRS0=TP+b=D2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F4DC433E7
	for <linux-clk@archiver.kernel.org>; Mon, 19 Oct 2020 14:21:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0394422263
	for <linux-clk@archiver.kernel.org>; Mon, 19 Oct 2020 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603117307;
	bh=1ZAetXdDXsj+BjhagTCND5dn5OyFzE0eEdLjjfpxkf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DvFvdFjq4DpXRSeVTuSKcfmuFlyqqxLV32HQNYYaQ6SJ4bx2XTgAz6s4lvKuEVDGK
	 uSkw87XRnnl3Vdlm7Btqv5EZZ13e8H+wrH/snHWsgSlUmCmlbpjz61XEVjEPkF4FEl
	 sK7U8zMpqenRiUa/YuW3XTDHj2P3Tf5X7X1/dShY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729435AbgJSOVn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Oct 2020 10:21:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38623 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbgJSOVn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Oct 2020 10:21:43 -0400
Received: by mail-ot1-f68.google.com with SMTP id i12so10588335ota.5;
        Mon, 19 Oct 2020 07:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=12l3M2TcKuloid6NoQYFwjNiQUKK0pB5u9CaECZ0MIg=;
        b=mHZpLha75oDW7QFc3w4LujIhKCfnP155o+pNWAvoQye/iSgH3zFLIHKpPbCM8Nd6+k
         LV2hXSGRoQ2Ah/mruwmkulmzqG+/8Hyvv/0m2qHQAqJyelpuoqxrhhZr5fAFORvm+EhR
         nnkS2KIRpHdrHxmAggA2A+ko2ype6N52F6EoG6YnRiXED5jIHJLcCZP1K/ZCJV6a+Hkp
         Q9v/19mJSVB8N0VPSwdVE/Yvy2bIT3zMlXXAwjemRDDNviA5U9AWVpxz8uIJxOsYqNzA
         4wddJRL2PU7mrCcuVMDwbL3eQEnJ3T2sTrpkML0+wMnqbZRYYv33cF2JngKmyRZKZhNW
         5EuQ==
X-Gm-Message-State: AOAM532OyflUCCQotgZwtegkswjnnnG+Z+/NM7/HGmfM6nr3nLy5JAEP
        8HPCpQnzhf4LRWC0KCqF+A==
X-Google-Smtp-Source: ABdhPJwUgb6IMG5++/5tCBbcC6g5JzsG+i38bL077Cp+wDdLPp0NyvDVE1q8HJYLs7/QT32gopDQDg==
X-Received: by 2002:a9d:2947:: with SMTP id d65mr143936otb.219.1603117302027;
        Mon, 19 Oct 2020 07:21:42 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u125sm3611745oif.21.2020.10.19.07.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 07:21:40 -0700 (PDT)
Received: (nullmailer pid 3040360 invoked by uid 1000);
        Mon, 19 Oct 2020 14:21:40 -0000
Date:   Mon, 19 Oct 2020 09:21:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: Add support for LPASS Always
 ON Controller
Message-ID: <20201019142140.GA3040103@bogus>
References: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
 <20201016141241.5839-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016141241.5839-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 16 Oct 2020 15:12:39 +0100, Srinivas Kandagatla wrote:
> Always ON Clock controller is a block inside LPASS which controls
> 1 Glitch free muxes to LPASS codec Macros.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/clock/qcom,aoncc-sm8250.yaml     | 58 +++++++++++++++++++
>  .../clock/qcom,sm8250-lpass-aoncc.h           | 11 ++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.example.dts:25.30-31 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1383375

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

