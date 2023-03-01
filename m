Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FE9C7EE23
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 21:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbjCAV1I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 16:27:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCAV1H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 16:27:07 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6B646162
        for <linux-clk@vger.kernel.org>; Wed,  1 Mar 2023 13:27:06 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-536af432ee5so391578617b3.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Mar 2023 13:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677706026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZQ6NryszKqEgo6HI/pNRwlFeVgJUI6LFlsCzrMdZac=;
        b=NpvrWnan0KtOpYnMajMQidSkRlc+fW82x+E3nS+ke4Nqu8oYVgI4cHeC3YgENOPRTu
         voVchR4WvD1spg6cEO3ARDxcI75LCb4MZGhZRzzdZp1YlrTzUn7P10rxkhUqTavMkvfz
         X/nhYjNvizOAE3Kz9gDZITMzdnjFVnN3wco/DTgthfbDs+9OhQ6oz2L3CMqFtSrlaBh/
         5qqqQn6LHMa2cGyBTPxP2EKZbbc6fWjMoMMPeKGrjKK0zfMlYDPzZyjSmIs8Dj8gOa3I
         kZ6sMIlUs1m+IUvuggzFIcI85la1o+6uvacy39lsQTxCLsRipu/UttluXQa9FhMmoBXL
         jHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677706026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZQ6NryszKqEgo6HI/pNRwlFeVgJUI6LFlsCzrMdZac=;
        b=VIBg6wXfh62mXOffUE0VFFMQA+Y04swppnf1cEz6gUQ76B4q/Vj8N1ZBbFo8c3/ftZ
         KWfzfm+KP6CbvKDNvDRZVRBEuB5aIZ1piDusvaSblbswDlwQRUlWCxmJyafO/tw+Tdqd
         yCIVNDGSCkXBbpqsM93f2thVmTiIkDBrG2DFhtTRhsTdV7OMttu4j2PDAcCsLeS0rfmO
         5SWdSoajRvIsNPJOEeeueghvzYGAJZgxmOg1IeaKBvP7Dh8zT3rApS7LW73Kah6Efntv
         hj9HMefekZp88h/QGY3/nXUFnquGvUMy+DtYNY5MqSgmjYTisFKcklCkCp3jn9d/j7t9
         ZUIQ==
X-Gm-Message-State: AO0yUKVBloeeczx7ryA4TqeaKtRIyUAzwPhV0czABI9jSndxGsihMPYp
        6FyuytgWFgLV4yTSIvveZdBYTxmb1CC5oexFq/IRDQ==
X-Google-Smtp-Source: AK7set/b8yVL1xVpK7MpL7ZJS4XJdhHV+jqkMXh8JUDChxR9QtACSaqCtw6tNw4ZokC7uDd3aYdRnb2A3WIxuNfaJBg=
X-Received: by 2002:a81:ac59:0:b0:535:fe26:acc with SMTP id
 z25-20020a81ac59000000b00535fe260accmr4901270ywj.10.1677706025276; Wed, 01
 Mar 2023 13:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20230227183937.377612-1-ralph.siemsen@linaro.org>
 <20230227183937.377612-5-ralph.siemsen@linaro.org> <20230301135808.6fefe5b9@xps-13>
 <CANp-EDb3XPEHya8igTh9fnyQW9yUs2MM6tCD9Pa3DCSwNZGvVg@mail.gmail.com>
In-Reply-To: <CANp-EDb3XPEHya8igTh9fnyQW9yUs2MM6tCD9Pa3DCSwNZGvVg@mail.gmail.com>
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
Date:   Wed, 1 Mar 2023 16:26:54 -0500
Message-ID: <CANp-EDYuX_zi=XG_AhLP0tH9mnQzTK0GiyTzSQEkPMUo5JC28Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a06g032: improve clock tables
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 1, 2023 at 2:19=E2=80=AFPM Ralph Siemsen <ralph.siemsen@linaro.=
org> wrote:
>
> > > The bulk of this patch converts the clock table to use struct regbit,
> > > making use of the RB() helper macro. The conversion was automated by
> > > script, and as a further verification, the compiled binary of the tab=
le
> > > was compared before/after the change (with objdump -D).
> >
> > I will trust your tool on the conversion.
>
> I'm going to check again using objdump, just to make sure nothing slips t=
hrough.

So naturally, this test uncovered a difference. It seems that gcc
orders bitfields differently on x86 and ARM. So the tables did not
match exactly with the old packed u16 fomat.

It is a harmless difference, but it can easily be eliminated, by
swapping the fields within 'struct regbit'. Now the tables are really
identical.

Patch v2 to follow shortly.

Ralph
