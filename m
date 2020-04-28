Return-Path: <SRS0=1QlQ=6M=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87028C83000
	for <linux-clk@archiver.kernel.org>; Tue, 28 Apr 2020 12:51:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 579D4206E2
	for <linux-clk@archiver.kernel.org>; Tue, 28 Apr 2020 12:51:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="auk5GaiG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgD1MvY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Apr 2020 08:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726794AbgD1MvX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Apr 2020 08:51:23 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808BCC03C1A9
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2020 05:51:23 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h4so7772684ljg.12
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2020 05:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kBIva6ytWjsG5Ejx9sHC2DemLkAG1u+dl6icalldDXQ=;
        b=auk5GaiGd2azy7gerxDi8/dMlfIuEr1aoR7M/cqy8tKtll3/ac3XPnpYSdAMtB/vTr
         H2sSluEB1qfuKoejbQWxgP6OvcsoWyFNBvWN+iwj3vDlQENPeRDPIahgnUiE+nPLdgGM
         Xp8tGvuIIGs6DSJsjtztxbzS+yubDdRIOG8lSISphYXLOTPuTPswBulD250VO/vJyo3t
         HyqtA5kQN/PcWSwM1V68UFwVzwTko3s4rnIMkblizZkWafOY9nYhe+BXN5LPyvcYPV0o
         rQ+XOMhYufTL/B2NM5OXv4n6R3x7RxsNRuAgEPnbHIfaF1W7v8IOix3uRQ0o5ILC0EJg
         zSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kBIva6ytWjsG5Ejx9sHC2DemLkAG1u+dl6icalldDXQ=;
        b=mpiH8on05F2IlG6W0a7B/DcxTkfyb/DOt5wODvG32qBn/OmmZQtAnJym2MCq48clV7
         kQ4hnO96RVwhO2LfPnsqV+YXq7NysVfGq0SSMufuQBfs5b5qtErTcozv47J4otAVXlTw
         nF99iwWFXHiE4rZjme0v8p20Y4elofqDof3Cbp6YIfMlVt7AYQdijeOVoBYECPK/4+vD
         ou/iilMJzQ26zS8v14fjACCZtBwQaHsB/ut5CB9EUQZf4Oo0LTlcznQC4GuK7cBiDj1e
         C0+yp1z0R82pf91DlpA8MnDFy98YjZZLcqOz5XBBBeSuWcE2BQLj6/pup2BQXF96SYAr
         ROpQ==
X-Gm-Message-State: AGi0Pub9t6uGX5hd6dhvroOt7ldq/4jAu6ezKGbEfk+R6VdV3T2iG/en
        DqhupkPs1bcEHL9kPlrtKMbkbTNDcBSE7jQCm2lZ/Mpi
X-Google-Smtp-Source: APiQypKnAUIn+FnduiaEAChGi9eJAfnEAnwwDMC7HCl3HKr4SNaOzyddFBzFga/u3gJns8HzQO4yyIM5HWuwvtzAZwE=
X-Received: by 2002:a05:651c:1058:: with SMTP id x24mr18189698ljm.39.1588078281977;
 Tue, 28 Apr 2020 05:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200416081348.326833-1-linus.walleij@linaro.org> <158754977096.132238.12292029969034991900@swboyd.mtv.corp.google.com>
In-Reply-To: <158754977096.132238.12292029969034991900@swboyd.mtv.corp.google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 14:51:10 +0200
Message-ID: <CACRpkdaurouZLFD2aqjDnUgvp=iMOjZ0Lu=xboxqEUx4-dvWWg@mail.gmail.com>
Subject: Re: [PATCH] clk: impd1: Look up clock-output-names
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Apr 22, 2020 at 12:02 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Linus Walleij (2020-04-16 01:13:48)
> > The IM-PD1 still need to pass the clock output names.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Is this a
>
> Fixes: 84655b762a27 ("clk: versatile: Add device tree probing for IM-PD1 clocks")
>
> change?

Yep. Can you fold it in when applying?

Yours,
Linus Walleij
