Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AAAECAAA1
	for <linux-clk@archiver.kernel.org>; Fri, 28 Oct 2022 00:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235086AbiJ1AYg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 20:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234920AbiJ1AYf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 20:24:35 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E572695BD
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 17:24:30 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id b18so6293800ljr.13
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 17:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zG8vNqu+yOnidTThsRRaGZjoea/P4g3Vo3zqFSDgNyo=;
        b=l8rrr8Z85GFAmVl1MYomr5u3ZX297sQGN4+2wABZM/iRfD+r2T5n7Nngwech8/gi0t
         05hJL/dAm9TOv8+IbW3z3IOl3Euj2WAJRAp/xVWlKhwIT3+Q7qinLIaY8eBZWCE+Rojs
         +2ag0ajmdC5pmF1zNiyJ0gliOJJ03ok1/dR0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG8vNqu+yOnidTThsRRaGZjoea/P4g3Vo3zqFSDgNyo=;
        b=yPZ7yibwNh2DROpUELP3vViR/lm2giCC1gLrvD0yQnxKVSpxqb7WFTQECMrg5O5QjB
         H0dXk6WCiFPbVyWwh2iA4HUKU0VRfqg1Ucit+dWv1D9pIOFfXJ4GbvTUnLqf9QkcFWbL
         2jBBEIYHXYBLFG22ee6WVcFM6MTjf4MvW3P7tut3yZ3H0E0MnbzWx+CNFKkP5PcTsVg4
         RIbjxEa2z/Xylg0dGQfmpPl4KFY42l5ifIhnIF9mdtNX3PsQ+VOQo18PoHBE/StVCQKE
         RtxEUUwqP6ne6nktvOwvvqkgfpCoHO+ysnRoc16JOfG0WU4rEJOnpH3E0vgcs4hOgpXW
         cOEA==
X-Gm-Message-State: ACrzQf3S0arFZc0e5erh0fUsRKACnaFY1HH28PnyylakPvwRgUQG1GxT
        T/n4+VYGcb968RXu9rJHg0tPG/qW04DLXNT1gyVAkQ==
X-Google-Smtp-Source: AMsMyM6a19Ff+UZWtCjteZZ3KxTuJu0T7yhL5jb3q9l4sm2lLlt2HHa3p/naIEz1+VA2IO+Fp6GOG466ZtOwZ2jwpxw=
X-Received: by 2002:a2e:8081:0:b0:277:b:33db with SMTP id i1-20020a2e8081000000b00277000b33dbmr11474019ljg.228.1666916669276;
 Thu, 27 Oct 2022 17:24:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Oct 2022 20:24:28 -0400
MIME-Version: 1.0
In-Reply-To: <1666159535-6447-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1666159535-6447-1-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 27 Oct 2022 20:24:28 -0400
Message-ID: <CAE-0n52N6oxSLoU_=Cq1xK9bVX7H+AvPsR3dLepMNjKywdffvQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: Update the force mem core bit for GPU clocks
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tdas@quicinc.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Satya Priya (2022-10-18 23:05:35)
> From: Taniya Das <quic_tdas@quicinc.com>
>
> There are few GPU clocks which are powering up the memories
> and thus enable the FORCE_MEM_PERIPH always for these clocks
> to force the periph_on signal to remain active during halt
> state of the clock.

I take it that missing this causes GPU to lose state when it suspends
and that confuses the driver?
