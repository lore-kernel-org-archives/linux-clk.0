Return-Path: <SRS0=2ArH=WK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAF7C433FF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Aug 2019 06:39:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 536F32084F
	for <linux-clk@archiver.kernel.org>; Wed, 14 Aug 2019 06:39:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltuDIE+h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725265AbfHNGju (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Aug 2019 02:39:50 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41534 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfHNGjt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Aug 2019 02:39:49 -0400
Received: by mail-pl1-f193.google.com with SMTP id m9so50123046pls.8
        for <linux-clk@vger.kernel.org>; Tue, 13 Aug 2019 23:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zf2wWfWQLgw3B0oEm2vP6fzK7dosG6tj+enF0TYXPfM=;
        b=ltuDIE+hqKfTuUTwmx+nnGg/v57zoNSyfiFh6MFLchdzk6TVcvtRTkWLMPAIXM2tR2
         qNXN1dqrSveF1Eh3SB2at2bMSjZ19YO9Dl8CPrEAcuvjyYhgb8Yl1+0p1OpYSoc0FjII
         fzi5siYXQ8dVO1TaCs1OdcdkchCUdxwFBdt+r5j7LB2u9ObyHUm9q7vqWy90Ie6wFagb
         WugWL6RCoeweME2RKCfsaDBaEsVoBHPMeYD71aeIMw6zkyAU4oniPkxXp4VA4U3fBR11
         u4f56QATqDHW9IutKuquROLkYQWv5cJEiWUt1wbAyu3sS853rwyatX/YGeRasCvamWhX
         jeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zf2wWfWQLgw3B0oEm2vP6fzK7dosG6tj+enF0TYXPfM=;
        b=sTus6zA70u3N7EOsgAS99XvZPTozC/AbXClPL3YZK02Kc2RZSzf/hBV3o7ATdFIbF7
         JP6MbU1+C55GUsTm0VJrGeL5SNonnVMzTub6bH/XUwo9BkYQLIinTLDZgguB3CsxSVo/
         wjV17kakzmvK5D9g7ZAWcqw2WJizp08eDNhvMfrpoIwr1fPRjJV2ZdESvwnRJmQv8Q92
         TmljlrluD2ETTkr1oGaEY5Vrp11266ybE6XmeQ2uXKKM8ILAfzdRfBAMbTztJqtQG749
         4iAHo2zR0g3JsVv7P8re2iji/P6HvlJPyb/8/AH+SfUxL+7MZuTvXJpB8RxixgOMMTSR
         sjaQ==
X-Gm-Message-State: APjAAAXiYbZI0RjFiVwAuXr9hwLqLlzXE6lP/l0GSFDvv9TJ8Mcjz50I
        TvMJUZ8xau32JgnoikfdlnvMqQ==
X-Google-Smtp-Source: APXvYqx6bOqfSn4UUbxjPl/N5kmhQFUWOoqQ1D6DKJZNEPsRQQV3Nlkoa+FkM1NBt6vZWsq1AtA68w==
X-Received: by 2002:a17:902:b605:: with SMTP id b5mr11964409pls.103.1565764788918;
        Tue, 13 Aug 2019 23:39:48 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f12sm105879470pgo.85.2019.08.13.23.39.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 23:39:48 -0700 (PDT)
Date:   Tue, 13 Aug 2019 23:41:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Govind Singh <govinds@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Subject: Re: [v2 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock
 controller bindings
Message-ID: <20190814064126.GV26807@tuxbook-pro>
References: <20190813130946.16448-1-govinds@codeaurora.org>
 <20190813130946.16448-2-govinds@codeaurora.org>
 <CAL_JsqK-GK8arfRu6sqP9UjNrwc0=aUWXymMRF5fQhg+M2TNng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqK-GK8arfRu6sqP9UjNrwc0=aUWXymMRF5fQhg+M2TNng@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 13 Aug 06:43 PDT 2019, Rob Herring wrote:

> On Tue, Aug 13, 2019 at 7:10 AM Govind Singh <govinds@codeaurora.org> wrote:
> >
> > Add devicetree binding for the Q6SSTOP clock controller found in QCS404.
> 
> You need to test this with 'make dt_binding_check' and fix the errors.
> 
> >
> > Signed-off-by: Govind Singh <govinds@codeaurora.org>
> > ---
> >  .../bindings/clock/qcom,q6sstopcc.yaml        | 45 +++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > new file mode 100644
> > index 000000000000..861e9ba97ca3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > @@ -0,0 +1,45 @@
> > +# SPDX-License-Identifier: BSD-2-Clause
> 
> GPL-2.0-only OR BSD-2-Clause
> 

Is this a requirement of the devicetree project? Wouldn't the BSD
license alone be sufficient for the type of interoperability that we're
striving for?

Regards,
Bjorn
