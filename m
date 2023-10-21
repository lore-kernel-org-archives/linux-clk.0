Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBABC001E0
	for <linux-clk@archiver.kernel.org>; Sat, 21 Oct 2023 13:42:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjJUNmI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Oct 2023 09:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJUNmH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Oct 2023 09:42:07 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC96E7;
        Sat, 21 Oct 2023 06:42:05 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a7af20c488so18940337b3.1;
        Sat, 21 Oct 2023 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697895725; x=1698500525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWvD7IHIUqyshOcL0r6h0e1PZfUfOzLb/jePav/l2nM=;
        b=DUm6hI/oxe43rYTdatPKuKGbyPAiZ+K5iY7UykEkhH7O1T15GFWsDxwIzDl4cqZ1Dl
         Vi6W0FAMTxHg3a9uJP7p4mbkX/w51SE8qFmCjZuJnOfdfljJqvutf0eyBnBx/z4avIwh
         NIxdldO0VFzdMhybbKT7DxAPQCyzfmOEsrUyvSOlT0GdKdt6mQgrGVq4Lb0KE2hXudPF
         lRnDBiVe/heiCuNUJvX5kkzmoIvRDcOgGvQMagwecMJH05rlNaO67EvInaeIbbadl2Qv
         aKOMculCTXdkblgus2V7ZPwRl+Ttt2fOFI3F43mSoh5KrnZ7aKL8i4/D5A2TrQpFhAO0
         FXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697895725; x=1698500525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWvD7IHIUqyshOcL0r6h0e1PZfUfOzLb/jePav/l2nM=;
        b=vBQDmBGfMMumUXvJPX/ggXU6QJK57grOJpruQKD5lbc/ZuxvuOV9n+YlIASHXv1z37
         iM6WLiBmOI+5qGl0H47JdM0pV9rp42X316yEL37UpDFfRSF6RiUojJgPF8cUpK9aGI9f
         c/cdVRnzio6+Zd5EwrSP1X4rmEj3T5wDGsWmMLhYQT6+jym6RhoAFJqK4LMf6qgOIrzy
         RlWvjkz1zi3fFENVMMPPJpQEVZgCCZqz5Vt9Y4kSggb2BZXjja3RRj/KpGm4OcroQg4N
         hKsokbAERGEJg9yuohdRZbvAzY8pPDXP4xGfhl/dJ01YdtXO0PcLbNiU6trN/2t0jXRr
         SA+g==
X-Gm-Message-State: AOJu0Yx2HNmCvq97pxwfQHX+ffLV4fhfUgm0SvJ7ebnv/UbWdxJ1jnMQ
        b1piIVH5oJ3cTFwvbFe3u9lHocKXLCZ1ZGVrQSg=
X-Google-Smtp-Source: AGHT+IFuYaPg1ybE22FyiKtvPvCNxCh9A2couonV/P/uYpqgWj97i+ZgsG8kj0sotcNLagiTG/o6ZONdZKeI351Lo+4=
X-Received: by 2002:a05:690c:10c:b0:5a7:fb11:90f8 with SMTP id
 bd12-20020a05690c010c00b005a7fb1190f8mr4479643ywb.16.1697895724960; Sat, 21
 Oct 2023 06:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com> <3cc3b66d-7190-477c-af04-a5d06a0d50fe@lunn.ch>
 <ZTLH5o0GlFBYsAHq@boqun-archlinux>
In-Reply-To: <ZTLH5o0GlFBYsAHq@boqun-archlinux>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 21 Oct 2023 15:41:54 +0200
Message-ID: <CANiq72kjJu=P=19kqq1+5uPpfdS=N4Ucv2okbcWFJVnvR+Hkug@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Oct 20, 2023 at 8:33=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> But I think if people want to do experiments, the tool is there.

Yeah. If the Arm maintainers are OK adding it, I think we should also
put it in (next cycle perhaps) -- the sooner we have it in-tree, the
more testing it will hopefully get over time, and we can eventually
ask the CIs to add a run with it if they have the resources.

Cheers,
Miguel
