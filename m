Return-Path: <SRS0=O+9D=PA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5082C43387
	for <linux-clk@archiver.kernel.org>; Sun, 23 Dec 2018 23:05:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97DB9217FA
	for <linux-clk@archiver.kernel.org>; Sun, 23 Dec 2018 23:05:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEP7BjWU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbeLWXF5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Dec 2018 18:05:57 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37509 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbeLWXF5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Dec 2018 18:05:57 -0500
Received: by mail-oi1-f195.google.com with SMTP id y23so8941335oia.4;
        Sun, 23 Dec 2018 15:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wu7S+WM0YPmdL8lvpWnbeMNCbKbfah1/LJOFQFMwzho=;
        b=rEP7BjWUVpvLhTpRVl/sV0FFstNOXwpXz/ab8QRH8Pncl8VsOMcTBMPuhF7Lim7l/8
         UhYTczzlE+T1jogqjZGV0rLnJN9+qZfpbqgPBKqhddzTLkFOgBZIcHGGneub9kJn2WDW
         +fwU4uDdkD5CGTUBNqMfLG1+oYXSI9aBhqoL46usP1Cd4K3meM1nzzsBKAPR+mSyPqGT
         i80S/CRAfkVP7brIlNaIRAbrkHausuPDsSxa84wsgW3xbUo+j8baQyqLALu2wxC6MuaH
         u+V7wRD8cmRHQ02Kc+jZVXquOFh9M1W4WUy/itXzXz7vuYPU1CZfUbnyaU4RneGza2K1
         zKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wu7S+WM0YPmdL8lvpWnbeMNCbKbfah1/LJOFQFMwzho=;
        b=ZCMJb6IcR+drDfpwefAA9ZnAlDyylVly5iJ2dEZO8Ig3spCnd6STcBIjOu2q8u+RNO
         Uq2RJ8zaHTBLjgu8avO+HdNuolFPYs7nH9MJgjQJgioHYSvGahtXd3u8Z8G28+Vtanxv
         b3LhwaMwEgRV4kqri0gn/ApkRtIy8BXFrMkG3+IHK0l8ckFJQI3wtTg6HUYFJF8GzCNd
         JGDYKUKweIkZOWgvlvf5i6PEaw5ksEu4jyVi8YdGkNfkBEsZOJ3WldO2Is2d/47TDAAI
         T1UUd1GldKHk42N7cmiTTOi0GErujC0Aa/4Qlgo920BZysNOKdV7L4yE9JMmx6KYdk1I
         Mz+A==
X-Gm-Message-State: AA+aEWbFZJj4OleafJppntt2IgW1Nf2JMKT9x8GiwO6fltTd7m4tDjNA
        sV699xzf5p/oS4lae4LxWIHR5A+8hxQn/AzVOR0JIA==
X-Google-Smtp-Source: ALg8bN7vKcFgBrAFROt91cywyCoqOF+7X+qpAknGMTrTTcMl3YKFOwf+w0SGHICkCNKvSzWXCfi4t9GiJOmDnaT86Bc=
X-Received: by 2002:aca:3092:: with SMTP id w140mr6960076oiw.237.1545606356899;
 Sun, 23 Dec 2018 15:05:56 -0800 (PST)
MIME-Version: 1.0
References: <1545581665-15446-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1545581665-15446-1-git-send-email-aisheng.dong@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 23 Dec 2018 21:05:59 -0200
Message-ID: <CAOMZO5A9kL=seU5+tc5sobwNuAL4JHm_7n=Kf7-zon2FjyBGSQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] clk: imx8qxp: make the name of clock ID generic
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Dec 23, 2018 at 2:20 PM Aisheng Dong <aisheng.dong@nxp.com> wrote:
>
> SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
> Let's make the name of clock ID generic to allow other SoCs to reuse
> the common part.
>
> This patch only changes the clock id name and file name, so no
> functional change.
>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
