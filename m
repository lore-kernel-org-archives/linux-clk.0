Return-Path: <SRS0=57pj=MF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF7DECE562
	for <linux-clk@archiver.kernel.org>; Sun, 23 Sep 2018 13:11:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5697214C1
	for <linux-clk@archiver.kernel.org>; Sun, 23 Sep 2018 13:11:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="DylMqUVC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5697214C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbeIWTI2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Sep 2018 15:08:28 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41000 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbeIWTI2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Sep 2018 15:08:28 -0400
Received: by mail-lj1-f195.google.com with SMTP id y17-v6so15878197ljy.8
        for <linux-clk@vger.kernel.org>; Sun, 23 Sep 2018 06:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IZamlx9F5Ps6sZz0zQO1d1QgBXUlrJZ+Le8kcZWXf6c=;
        b=DylMqUVCRR8YWe4is1/xokCuQegtoSk4GAiyF/E6r1xw8Noda708Xs2071vdbK12N4
         6+rm3ZMu9SCqU57P5GLR97TXEmuZhvPRPut6O3Wt6YUFx5ZeTN2v2mn06e/KB9LC4XeS
         Wc5vfLOMDV1H2fFgFLUyObim7T641r89bcBdVZ1rM984Z1zLOmrQbN3IJbsU9QDhzIlg
         jZUWwr4CPNfatoL4q2X7Oo+mf615uJ2pNFAzAOSRi4LI10sEMMYZObvNI6oShzDtg7B2
         cA4Qf2K0sPmg9QhUmIyrBd+hxzcZjJBfbc4+/hRcQ+8bd4DQCPm6vtcQe8fP4rpZNw5u
         E5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IZamlx9F5Ps6sZz0zQO1d1QgBXUlrJZ+Le8kcZWXf6c=;
        b=Ti+XU9Dl/emIlB+TfwnIrIK9Suz3xT7nWKbdHe+aE0AnRbgMkFcJ/4BLFErv0gcY+a
         /1M5+s2LIght0ZSfRRKjfn9kJrVhb9kKiBoj1BFQT8mfbzJohDU7KSerhMPw9bvQIVXn
         /Fqmi7v4735tKIkNhFr6yfZV+RSAscbOX8PcxfHXOz8OydYNM+Es3/z54iasVi5hJjZI
         JBm6I9L+FPuPXcYxhpheXQWA26WWP5tRUBFsbIqgxiYiHRXgPdg6ALb/qVsKa13Hptfb
         4KXzyWC1vmPLyMWgQjZzirz+AE7dWVQMX85P47j9ou8qk5+MP/bPB5kKk2rRx6AFBDzU
         4Z6w==
X-Gm-Message-State: ABuFfoi/Nlsclg38Pbb41n7o5dsWzONHU/AiG0OcAnIv+zQcKzsVRTTv
        m/jllNXEaxQvQXYol+NcJVwpfvZxZeqptgwPWgghzQ==
X-Google-Smtp-Source: ACcGV61aoIAqYkS+SqTw0QCgZzZ6Eko8hsiRo9llv4kgmEqqSEjY32bWoVGjsVwLotiabgbAAreg3uqb89KDIKQijxI=
X-Received: by 2002:a2e:5cb:: with SMTP id 194-v6mr4785632ljf.130.1537708261006;
 Sun, 23 Sep 2018 06:11:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:eac3:0:0:0:0:0 with HTTP; Sun, 23 Sep 2018 06:10:59
 -0700 (PDT)
X-Originating-IP: [85.30.9.151]
In-Reply-To: <CY1PR02MB2138254CC5B1C2B2D41AB725B8040@CY1PR02MB2138.namprd02.prod.outlook.com>
References: <1533318808-10781-1-git-send-email-jollys@xilinx.com>
 <1533318808-10781-4-git-send-email-jollys@xilinx.com> <CAOesGMi7Q9L4oZkUubKtV-m8XD67MQ05ZFhPA_0Hwky_qVUxfg@mail.gmail.com>
 <CY1PR02MB2138BF2252E1CE2C1747A78AB8050@CY1PR02MB2138.namprd02.prod.outlook.com>
 <CAOesGMhViv_D6GKYf3x02LGqthwEsfkUFWBdG7pCQqD2MGsEew@mail.gmail.com> <CY1PR02MB2138254CC5B1C2B2D41AB725B8040@CY1PR02MB2138.namprd02.prod.outlook.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Sun, 23 Sep 2018 14:10:59 +0100
Message-ID:
 <CAOesGMgqjGEXzRPXFxUcSyTof_wgjErPhZ7wokdGEDY9SnCvdw@mail.gmail.com>
Subject: Re: [PATCH v11 03/11] firmware: xilinx: Add zynqmp IOCTL API for
 device control
To:     Jolly Shah <JOLLYS@xilinx.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
        Ingo Molnar <mingo@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michal Simek <michals@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Rajan Vaja <RAJANV@xilinx.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180923131059.KKYLCaGpwGUwowRWj07dNp9wa5r0WEUZt9P2iCegTf8@z>

Hi,

Apologies for the slow responses here, I meant to follow up on this sooner.

On Tue, Sep 11, 2018 at 8:20 PM, Jolly Shah <JOLLYS@xilinx.com> wrote:
> Hi Sudeep and Olof,
>
> Clock driver from same patch set uses ioctl API along with other clock ee=
mi APIs. As clock patches' final review is pending by Stephen, Michal only =
created pull request for rest of the patches and that doesn't require ioctl=
 api. I will remove it and submit new patch set.
>
> For future patches which requires ioctl api, would like to understand you=
r suggestion so I can make required changes. For zynqmp, EEMI interface all=
ows clock, reset, power etc management through firmware but apart from thos=
e there are some operations which needs secure access through firmware. Exa=
mples are accessing some storage registers for inter agent communication, c=
onfiguring another agent(RPU) mode, setting PLL parameters, boot device con=
figuration etc. Those operations are covered as ioctls as they are very pla=
tform specific. Do you suggest to handle them with individual EEMI APIs ins=
tead of ioctl API?

I'm personally less worried about whether the calls are through an
ioctl API or an EEMI one, but if it is through ioctl, I'd prefer if it
wasn't wide-open pass-through. I.e. that the ioctls you actually use
are documented, and only those who are whitelisted are passed through
(and not in general exported to userspace).

Does that make sense?


-Olof
