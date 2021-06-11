Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93266C48BE0
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 22:04:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 676FF61182
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 22:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhFKWGK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jun 2021 18:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhFKWGJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Jun 2021 18:06:09 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A17C061574
        for <linux-clk@vger.kernel.org>; Fri, 11 Jun 2021 15:03:57 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id d13so3106458uav.5
        for <linux-clk@vger.kernel.org>; Fri, 11 Jun 2021 15:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+k6yu0EKgTSGzDKIr5AqFTVoAHiwY6ckLd1jm14gRfU=;
        b=a6APAT/2Lui1xvc/FAzJf1etpCICuxX9GaFM4kLmW4l4rMIMtzhQF93ph8iHujEHoO
         RoJtE7ecxSIc4hKtHhhp/qhz4ekxcjH15Jvb8jcHhYD5i2hYbbSw3sexJueAZ6cwbuSn
         pVDcmHlNcP37jXpuX/WL1cW89cNiBM76xRRZIQNgfnLCiYyIxkomnwnLZ8lQphuQ4fEB
         IgxlmY7XgN1KJGQVzeX8V2KK1BXc1CC2qVjcFna2DbQ0Yg248ZhDOB8aamJaJlwwVN13
         RQhZGCBggY9EG8c/+rJS2CxvZ0piXG1rCjby0frIhxZZGCfvIs+gJad3Ke17Y//4fhqA
         JNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+k6yu0EKgTSGzDKIr5AqFTVoAHiwY6ckLd1jm14gRfU=;
        b=thEYo9LEB2L9SC0nRw2TfGA4rXGtMQGFyntUB1JLpccKJvezVut7TSMTW073t3ljEx
         MrfTzF9VScciQaFscNjZY01121LJI2WO9BC01+MgGDZ1NjzbKrbEWonI+QfB2/WUzg9s
         gRRMcEYly1JHZEypQhTq6dWjiFbslPCE50FVAE2OneyMJ+4qQ1QQWSTHv2jJc4PpEuBq
         ujEbjwnPskG4mO1N9pLB2mZfl1QdsUzLvzHM0FBVWzkLNXjPTNL6ky18FJ34gbr16eFU
         CHwmtG8OP+m4JTIjem50U0iGykklOURd18m6h6qPpYgSMR/OnbTkB3t8+l1c5pTum4Qf
         rfxA==
X-Gm-Message-State: AOAM532vwWF4prI8YZOj9xogf2twpAa3xF3R52Wq+iGjf574taHo11uy
        gK7b5NeBVtceLfvU6d45xcqk03GVcoU15PLItzSn
X-Google-Smtp-Source: ABdhPJyYU6Mfmpbuu9gSw33cEwVQOoDSD/vimKLKw+xotkG/7FAKaogl7c4gUtf+vDgdUv17DWyAjyRZOxW/aUUQFBI=
X-Received: by 2002:ab0:710f:: with SMTP id x15mr5826827uan.74.1623449036923;
 Fri, 11 Jun 2021 15:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210602001449.780075-1-iwamatsu@nigauri.org> <20210610175034.GA2294595@robh.at.kernel.org>
In-Reply-To: <20210610175034.GA2294595@robh.at.kernel.org>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Sat, 12 Jun 2021 07:03:31 +0900
Message-ID: <CABMQnV+5Pk3TEgri-=Ebj15gVGBatOdYToJUOUZVu1jKN4mbFQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clk: zynqmp: convert bindings to YAML
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Thanks for your review.

2021=E5=B9=B46=E6=9C=8811=E6=97=A5(=E9=87=91) 2:50 Rob Herring <robh@kernel=
.org>:
>
> On Wed, Jun 02, 2021 at 09:14:49AM +0900, Nobuhiro Iwamatsu wrote:
> > Convert common clock for Xilinx Zynq MPSoC SoC bindings documentation
> > to YAML.
> >
> > Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> > ---
> >
> > v2: Fix warning with DT_CHECKER_FLAGS=3D-m.
> >
> >  .../bindings/clock/xlnx,zynqmp-clk.txt        |  63 ---------
> >  .../bindings/clock/xlnx,zynqmp-clk.yaml       |  63 +++++++++
> >  .../mailbox/xlnx,zynqmp-ipi-mailbox.txt       | 127 ------------------
>
> Why is this removed?

My bad. I will fix this as v3

>
> Otherwise, looks fine.

Thank you.

>
> >  3 files changed, 63 insertions(+), 190 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp=
-clk.txt
> >  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp=
-clk.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/mailbox/xlnx,zynq=
mp-ipi-mailbox.txt

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
