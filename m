Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D29C7EE22
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 09:20:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbjEEJUn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 05:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbjEEJUm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 05:20:42 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD4E2128
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 02:20:40 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-55a1462f9f6so13726957b3.3
        for <linux-clk@vger.kernel.org>; Fri, 05 May 2023 02:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683278439; x=1685870439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CUmVNNVC+NFm1W3KNQtznbgGM7aUA3zExZZF/LzaVUs=;
        b=FP/p5a3Rz53t8Hiu9p1mm5qnJtqy8k8DPZEj9OIZWBicvtZTm0NV6bUKvKL9s/LyuT
         kPWITrgznSc7G0gHTudHZg51Ym5Jz85rr3xxjeAE4g9c3tQhWPM88PNPAnYyA8iRv2Rc
         /qaAudMVsKqE0av2f9jkQUu9kV+fuM/cUQX7t6s8o+A1Yb5IMJseFDL0OMiEXWfxStxN
         7GmxgySoOXuIhVDIuS2TVRt/UoC35jKuy2okLrVpnPrPI2ShD/1X/uQO4nFF6yuUp+1H
         UQqCdYvj3wW+hT+k0rc/yV5szgmhj1m/6qfDuD1KM2j6JxEQiyvkOxB0HY59bDNjQJ/T
         kGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683278439; x=1685870439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUmVNNVC+NFm1W3KNQtznbgGM7aUA3zExZZF/LzaVUs=;
        b=k54SJ5BugGMwBGnTzI2HofB/M6jY7CGFGG2/v+gKM2yeAxi4yl5MFheq8b4FOLL9mn
         tLaQ/s8OpQ/HJnHW6LT636s19UQCpco7WSgWOqSZFV8nQfz7qPVEMybEdrKztneqgVZI
         jD5L8tdLRwewVcetEHomstM55g0nRMTuwodkKIuymfonF4qNUWZ6vRuGZoCRrEnFNiyL
         d57+Kvel/9MG10QbzRCzE+vLrbyf4+kV3fPJhJcGtLpVEJYFyBptGI0SQ9z4zNC+56IC
         jF6SP+dy4RvpzYvFHWojdmDJAU0bRdCkvaldex93MlAcnDOxb9IdO7nhTUJgoxGQp8O0
         tKtg==
X-Gm-Message-State: AC+VfDxll6PSAyKvNYa7zY5jMdtZO5KXwz1QERtluSOLWjrbWnCf1JWq
        RdmrD04YVQQirbEDIvrfBAibUAsRtrrDAVIM5foL7A==
X-Google-Smtp-Source: ACHHUZ58rj28L5oxCYIFKkyMOzoHfNWeQkq2DTYySQPBe8Qwd4K17ixkp8gSzmsMgU09dboiqo31SDXmeK2W4fGOIpM=
X-Received: by 2002:a0d:e405:0:b0:54e:ffbc:7ac2 with SMTP id
 n5-20020a0de405000000b0054effbc7ac2mr832957ywe.45.1683278439545; Fri, 05 May
 2023 02:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683183860.git.quic_varada@quicinc.com> <4464003b6d955c6f5da991acbecf0411348fc38d.1683183860.git.quic_varada@quicinc.com>
In-Reply-To: <4464003b6d955c6f5da991acbecf0411348fc38d.1683183860.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 5 May 2023 12:20:28 +0300
Message-ID: <CAA8EJprcSEFgQzfX-ULVv3HA2LzBMArZobAuabmE74Ft6mJTzg@mail.gmail.com>
Subject: Re: [PATCH v10 6/9] phy: qcom: qmp: Update IPQ9574 USB Phy
 initialization Sequence
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org,
        Praveenkumar I <quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 5 May 2023 at 11:23, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Updated USB QMP PHY Init sequence based on HPG for IPQ9574.
> Reused clock and reset list from existing targets.
>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v6:
>         - Fix pcs_usb offset
>         - Use correct clock names array
>  Changes in v5:
>         - Fix additional review comments
>         - Use V3 register offsets
>  Changes in v4:
>         - Use qmp_usb_offsets for register space access
>  Changes in v3:
>         - Fix hex captitalization
>  Changes in v2:
>         - Removed unused phy register offsets
>         - Moved the clock entries to the correct place
>         - Maintain sorted order
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 115 ++++++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

--
With best wishes
Dmitry
