Return-Path: <SRS0=SEET=6G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C277BC54FCB
	for <linux-clk@archiver.kernel.org>; Wed, 22 Apr 2020 16:12:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0B3520776
	for <linux-clk@archiver.kernel.org>; Wed, 22 Apr 2020 16:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FhN9qRLx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgDVQM5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Apr 2020 12:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgDVQM4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Apr 2020 12:12:56 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4774C03C1AA
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2020 09:12:53 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id g16so1946297eds.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2020 09:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cOIdG6ANuqdCAw6HTlOJwmfM932Ci5JIRvtMJVQhAu8=;
        b=FhN9qRLx4i+wanbPH+AvD3FKCX9cxO/ct2YRESvQMA6H5QD5TErIsLxRMXKsFa/S3q
         gjMIGn8pgFo1ce1STLeEs+9TXt8ahd4XLiBCFg5Mqakj/rzDCKQak01DJQaZFI4seZN8
         QNufbdgbepqcy3XXqqxX1i/zpLUsLUrB8QuRaNgL+FIvb2baG7eVQHsF8jb7iVxSluXq
         NgFZhVRerrkpx6td8evt+KLxPW5B64+qiFc0Dj7rMNCaaQ7O1NFyloSpHDh0qTYdJ5W5
         09SsqqlsMlh20i8azgFUAz7FHfCcvSdhhk1onh1k4T3ssONuzgobKAysSv9uFtR9Osde
         sGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cOIdG6ANuqdCAw6HTlOJwmfM932Ci5JIRvtMJVQhAu8=;
        b=hSmr/+9bS84K9QwzxyN/OUiCI82xlyFGyFUC7TI46NaJ4ew6Gst29UtV0+2yYErRfm
         8PExSijPN34XdSsF64Ca4/iPHImm8FV9HURbfRpwmxRHTt1qAzK14gA+pCP4EZtqLnD4
         5Q9w9uehu4whTu9yuuDytHGj4/pHBWqBKxM1euWdiVCjEG+nRwoxpNE0eivqsOc/e9Bs
         uMH3hSb2DAMF08TRkItwkHGmFua7bAWs4mLVfgs6S72I0iNfskI87h078kh3R0Xw9GlF
         /fqM2SLfJqDAo6J14YULLoHDSOvWUg3/VxFdJJkEMy0LmcNSzcQ5/IK1BvLmt6VKaDO4
         7tUQ==
X-Gm-Message-State: AGi0PuZKcoP2n+CvAOPjmw5xecPB97j538o8LWnxo8ncdOUI5OdDj+U6
        lQhdBXbQwdMya7LqdToIaDOszTEQm5pvM8VStkqaMA==
X-Google-Smtp-Source: APiQypK2YAAvF6wFI6CAGsRdSkkUVwNPo3dT6tXcGq+bweW10zNHW57KThBCkvfa7QcU0JI8E4FzHXQrFyXsVl4hshc=
X-Received: by 2002:a05:6402:22ed:: with SMTP id dn13mr23348389edb.212.1587571972357;
 Wed, 22 Apr 2020 09:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <1585224008-15730-1-git-send-email-loic.poulain@linaro.org>
 <1585224008-15730-4-git-send-email-loic.poulain@linaro.org> <158754648689.132238.18246673092201406766@swboyd.mtv.corp.google.com>
In-Reply-To: <158754648689.132238.18246673092201406766@swboyd.mtv.corp.google.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 22 Apr 2020 18:16:40 +0200
Message-ID: <CAMZdPi9Jg1ak41-39e2i5dM4Yrw8gGBx=MEvqBy8UCuZNMvCrA@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clk: qcom: Add bindings for CPU clock
 for msm8996
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org, Ilia Lin <ilialin@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 22 Apr 2020 at 11:08, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Loic Poulain (2020-03-26 05:00:07)
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,kryocc.txt b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> > new file mode 100644
> > index 0000000..8458783
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> > @@ -0,0 +1,17 @@
> > +Qualcomm CPUSS clock controller for Kryo CPUs
> > +----------------------------------------------------
> > +
> > +Required properties :
> > +- compatible : shall contain only one of the following:
> > +
> > +                       "qcom,msm8996-apcc"
> > +
> > +- reg : shall contain base register location and length
> > +- #clock-cells : shall contain 1
>
> Any chance this can become YAML, take parent clocks via the 'clocks' and
> 'clock-names' properties in DT, and have the file name reflect the
> compatible string instead of qcom,kryocc?

Sure, will do that in v2.
Regards,
Loic
