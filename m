Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AFAECDE43
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 22:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 34FA920866
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 22:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mt2S6KjD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34FA920866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbeJSGpF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Oct 2018 02:45:05 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:43020 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727268AbeJSGpE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Oct 2018 02:45:04 -0400
Received: by mail-lf1-f45.google.com with SMTP id p34-v6so23812719lfg.10
        for <linux-clk@vger.kernel.org>; Thu, 18 Oct 2018 15:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2FPgNYC9Wo3HfP/bcQeFolpgGa809OtH9KLcnjIBG4A=;
        b=Mt2S6KjDtfo/o1ZgZHEvBvXIcEvaYhcuotzC2SywQjccz4KAAhGgIq3zpA5JxoN7lJ
         GKAy1B1BkV8sAVrxH5g1chkQfRVL5RHD+dEnqRTWDadAC9F/ngts0gL6/0m7CwoeiIJO
         MfFQRzXwPsB68DL82Fgqy/cQqC1fHNLYeZ5iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2FPgNYC9Wo3HfP/bcQeFolpgGa809OtH9KLcnjIBG4A=;
        b=CbFDjb0PLegph3Fxia3n3fhpT3FEGcgEXe0OgT/csoMZuu+ekgTc0xQPH1w129PX/0
         fEsQbfExBSmlOP4vUoUEX6u65cDYMQo/66iuK2+UFR3xipThX0LhxriEhgTEkwJfq/6b
         REK0yD5Uh7IlBZWfd83tlCPs5oOJrs7f5nAZJRmudzqW4qjZ1X4i+gGUtkPuBG3oyCwS
         d3JoP/QPlIuwdgRfAdwEnUMJ0K/QEoiLqSSrdKHXp8B2nTdwf8Z/qtht4yvvALpiVZbc
         fsXGic684q/XWreNGmpY7fncGp/rOzXZzJjI4dP0VviRJq7WLKRMZKI2Qh4PJoZ30fwP
         9HKA==
X-Gm-Message-State: ABuFfohFWSXV0bBThMZKslaqf7ITJk3XoLu1P7PrEMeXU3Xv1U84ntmD
        107IuBLyH6OaUKU+4Hd5TbwZVZRAgD4=
X-Google-Smtp-Source: ACcGV61Fw1FOOtBGqwu9cwy8H7mqH6DKZf43zoHF6jGDojllAdc3LNb8nq/+V6mChTvtOQcNUjPetg==
X-Received: by 2002:a19:1365:: with SMTP id j98mr1293410lfi.55.1539902514264;
        Thu, 18 Oct 2018 15:41:54 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id h87-v6sm5079198lji.9.2018.10.18.15.41.52
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Oct 2018 15:41:53 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id y71-v6so29170823lje.9
        for <linux-clk@vger.kernel.org>; Thu, 18 Oct 2018 15:41:52 -0700 (PDT)
X-Received: by 2002:a2e:9d05:: with SMTP id t5-v6mr8572156lji.57.1539902511968;
 Thu, 18 Oct 2018 15:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20181018220350.220357-1-evgreen@chromium.org> <153990178286.53599.2223333358659390565@swboyd.mtv.corp.google.com>
In-Reply-To: <153990178286.53599.2223333358659390565@swboyd.mtv.corp.google.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 18 Oct 2018 15:41:15 -0700
X-Gmail-Original-Message-ID: <CAE=gft48VyPFAGdxzZ7QK=ixUwU_+PXVux7iq+YH+t-u1pAvLw@mail.gmail.com>
Message-ID: <CAE=gft48VyPFAGdxzZ7QK=ixUwU_+PXVux7iq+YH+t-u1pAvLw@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: Remove unused arrays in SDM845 GCC
To:     sboyd@kernel.org
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Oct 18, 2018 at 3:29 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Evan Green (2018-10-18 15:03:50)
> > This change removes a parent map and parent name array that
> > appear to be completely unreferenced.
> >
> > Signed-off-by: Evan Green <evgreen@chromium.org>
> > ---
>
> Applied to clk-next. Can you change your commit text style going forward
> to match Documentation/process/submitting-patches.rst, section 2, for an
> "imperative mood"?
>

Thanks. Will do.
