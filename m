Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3947C433FE
	for <linux-clk@archiver.kernel.org>; Mon,  7 Nov 2022 17:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbiKGRAo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Nov 2022 12:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbiKGRAn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Nov 2022 12:00:43 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B40B13F79
        for <linux-clk@vger.kernel.org>; Mon,  7 Nov 2022 09:00:40 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id s12so8975868edd.5
        for <linux-clk@vger.kernel.org>; Mon, 07 Nov 2022 09:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aK/Mb1lQmrWp0WIZzAQZyGa5kst0gFmBMRnnMnq6heo=;
        b=YEKGVkj/9lV6H+WKl0DAv5UsTSd+466O/ymx34swbdZo5yizFGQodVqLifmQr1B9Ts
         P//nlccbfUoJEv5iOO2ROpD1floSrnCSDZBZ8NO14TGSi7FGdj52KeZbbE8QJ6dB0UzZ
         Yzal/BE/Z4JuuZAvAx4mN8D0lQbULbSyaxyGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aK/Mb1lQmrWp0WIZzAQZyGa5kst0gFmBMRnnMnq6heo=;
        b=pxKJD07AJCv+5tcDNjB1x2wPma1Z/2ArZ+eTiZaxTHTul0xDt+MJYGxUVd8kkgtaCx
         kbeOgImEWsFxDYk1N5k7V7DWl5DyhBqt9FvPjXYArWr/nqg0X3kXi1SfYepcRaHXY0qP
         ayjvK5DPDgPSiG+VwUOlJcAMxof6ucYe3Wcf/BKhtemL6+YW3s83OqbnUu2buuLUlHSs
         efyaXjFipe1Ds8Zjo8TL2kdblNT5yKGu2J9kFUNYyKYJeITJVbTJkozbrW+0o1fjTpo9
         IGFk7iNPDtLObAwuxo38bScbBX/j9ft/fUJ4WpxM+i9FZLiFw5WpX6ZsV8zlZYp2AX7q
         DU/A==
X-Gm-Message-State: ANoB5pkRa/1B7td9Yq7oBnZheiCaV1rcV/PD65uENIJJw8Ri3JBmzc6H
        V9nOGEK7VwL9S9nUHSdST5evbkjtQ/KttRbZ
X-Google-Smtp-Source: AA0mqf6xW2dHQS9GGmCsVRqT3IE98aQrULT0HznATZVqRPUGhRp4gkFjVHOj7YvSOndXXLTAm6BJSA==
X-Received: by 2002:a50:cbc1:0:b0:466:4a4d:685 with SMTP id l1-20020a50cbc1000000b004664a4d0685mr8749092edi.312.1667840438512;
        Mon, 07 Nov 2022 09:00:38 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id i15-20020a17090671cf00b0078d76ee7543sm3605482ejk.222.2022.11.07.09.00.32
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 09:00:36 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id t1so7271061wmi.4
        for <linux-clk@vger.kernel.org>; Mon, 07 Nov 2022 09:00:32 -0800 (PST)
X-Received: by 2002:a05:600c:2212:b0:3cf:6068:3c40 with SMTP id
 z18-20020a05600c221200b003cf60683c40mr34107154wml.57.1667840431739; Mon, 07
 Nov 2022 09:00:31 -0800 (PST)
MIME-Version: 1.0
References: <1666159535-6447-1-git-send-email-quic_c_skakit@quicinc.com>
 <CAE-0n52N6oxSLoU_=Cq1xK9bVX7H+AvPsR3dLepMNjKywdffvQ@mail.gmail.com> <21cd992c-334e-3a28-f3ac-68a49a4ef00b@quicinc.com>
In-Reply-To: <21cd992c-334e-3a28-f3ac-68a49a4ef00b@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Nov 2022 09:00:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WRCJ6d6jTHH2ZHvuh+c4yTeXhS_D5LZcvfMn1c4NP2aA@mail.gmail.com>
Message-ID: <CAD=FV=WRCJ6d6jTHH2ZHvuh+c4yTeXhS_D5LZcvfMn1c4NP2aA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: Update the force mem core bit for GPU clocks
To:     "Satya Priya Kakitapalli (Temp)" <quic_c_skakit@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tdas@quicinc.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Sun, Nov 6, 2022 at 9:38 PM Satya Priya Kakitapalli (Temp)
<quic_c_skakit@quicinc.com> wrote:
>
>
> On 10/28/2022 5:54 AM, Stephen Boyd wrote:
> > Quoting Satya Priya (2022-10-18 23:05:35)
> >> From: Taniya Das <quic_tdas@quicinc.com>
> >>
> >> There are few GPU clocks which are powering up the memories
> >> and thus enable the FORCE_MEM_PERIPH always for these clocks
> >> to force the periph_on signal to remain active during halt
> >> state of the clock.
> > I take it that missing this causes GPU to lose state when it suspends
> > and that confuses the driver?
>
>
> It is more related to GPU SMMU states and the stability issues that are
> encountered.

I see a very similar code sequence for sc7180. Is any similar fix
needed for sc7180, or is this something unique for sc7280?

-Doug
