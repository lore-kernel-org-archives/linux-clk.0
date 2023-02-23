Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D0BC61DA4
	for <linux-clk@archiver.kernel.org>; Thu, 23 Feb 2023 17:29:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjBWR3R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Feb 2023 12:29:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjBWR3M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Feb 2023 12:29:12 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4CF2C669;
        Thu, 23 Feb 2023 09:29:04 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id e9so8838453plh.2;
        Thu, 23 Feb 2023 09:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PqlmwnCysiJ0Lm/Yxgcirbk8z7suOlutmpcz689L3X0=;
        b=FFNBNuDgQ5y8l30XWClTMTui6/A0bfyGQ8jb2eID96N/iubKQ7yvNRD71sDFMvsmyy
         gWczjALeZZBeQIbOJJuMe2N0hvwYqO5Zcwf8x4T1mJ3wf9wwf3HR0Z555yyqkJfp8U64
         KWLovaHeTy3gdv1KoozswjdVWP0ebUneH+013hHUQy+SCP+9mFmFZq1dE8Ga/xiXgHew
         7ZOYaqwHy2A2g7asNIN6wTC17BqHpBzViEq8PIJ1NTqIWC2jQ0Z3hmv8lyi+Ml5DSeI4
         oVyLmnUp7HJ4flR0t8vD8/hmLOFxHNJbzPdIoZ0L/j6yw4lr5c7AS3yy25SeSQRsBinr
         3KXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqlmwnCysiJ0Lm/Yxgcirbk8z7suOlutmpcz689L3X0=;
        b=Kn57jdZ5VgwhdOEZvebDu6wg3J6dBIf4LCG1y2uN51D0ymSFnk3SfaQDjdfbc8gcn/
         sXb6tMzCzkIksntWPUCY0bX3TtbfeOSuUtVBPlsIMcYvUMLPNzliMsnbniEp14E5BKwg
         sFteqP6XtvikHcclOeEoZqx4ur4+fY2p7t7YAW2D/03X6tSSt7wUpUxUInV3IpjRjSif
         +K8XbMyMf3UWQuWEvbgLGfSzivjLCD+uQmbOqu1je/+MX97J9LmwKZ1sU7CWquHcEuAT
         MQSCuTIABUYUifqbW+sDYo95mW+jviZkcNUQ9PcVrZkaiPNiii2f8chlUOskV9LuDDXR
         TyAQ==
X-Gm-Message-State: AO0yUKV7pwbGZGYaJtvMABW/Vnt98UHsdjyXsTd6gyuCGl8TijwM3R98
        CGaJFzkG9t6m7DnfTDKDN/LN7W83CaGmzHq2SDNV6V8gZiM=
X-Google-Smtp-Source: AK7set/8g/9ng9RyoZUT0w0i8u0Qkv0M3n6u73jF3yC5x0yUgsMX5EkbT+Co6WUOCU91bzTZMPNxwdFji6l8xNdnnGA=
X-Received: by 2002:a17:902:f782:b0:19c:b7da:d2ec with SMTP id
 q2-20020a170902f78200b0019cb7dad2ecmr805199pln.4.1677173344015; Thu, 23 Feb
 2023 09:29:04 -0800 (PST)
MIME-Version: 1.0
References: <20230223171114.59164-1-marex@denx.de> <20230223171114.59164-5-marex@denx.de>
In-Reply-To: <20230223171114.59164-5-marex@denx.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 23 Feb 2023 14:28:52 -0300
Message-ID: <CAOMZO5A5k0EdE9_VqXe5iJ5x+dPFse=jqjMaL-3ip3r0zDQ=5w@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: imx8mp: Add analog audio output on
 i.MX8MP EVK
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

On Thu, Feb 23, 2023 at 2:11 PM Marek Vasut <marex@denx.de> wrote:

> +       reg_audio_pwr: regulator-audio-pwr {
> +               compatible = "regulator-fixed";
> +               regulator-name = "audio-pwr";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-always-on;

It seems that "regulator-always-on" could be removed as the regulator
is controlled by the codec.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
