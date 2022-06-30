Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1902C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 17:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235794AbiF3RNU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 13:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234201AbiF3RNT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 13:13:19 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4715B7F7
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 10:13:17 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id w193so98945oie.5
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 10:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IsDEIufxD7CLx+1ROionmMEdB9wUNBwSr55AU/DLtwQ=;
        b=dqQCT8eGOe/2dMZ7rfs2sYTCAF4dWwH2LZtnlZM1sLbZDDsXLtnPowxEUKGWPPG1gb
         qCqyAR5Mpf8xLrJYZygFZcHFXsmxgkfjFehxxTgsrheNM9WTX4LXtjnN/oGhMxYGZ/+E
         YMohTGPeuiL++PM88Qbgd+6KuEKak1XF/AuqAPTp+Rch+0xpOp8gWx2QrQReQZe5BIP3
         X6xsq3+iLBfuZKqtP76N9eT/YFdgCOGtF3FX4SxmoElPC+KJRGRV4IEPnqdNUSNX3SAe
         dYK1O8fPhXcpcNeDGwRWm+8CADIhK7ww77uVV5EMR679d/aJArOCkkg4yVx0lHvClC3w
         58xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IsDEIufxD7CLx+1ROionmMEdB9wUNBwSr55AU/DLtwQ=;
        b=eKG/awEW9nUyJpUt4jGQZWmUbexxF+oVaqAHk6raGyxPCMhe5ia0Ed205a/Ag6ybxR
         4+FQIGOS+4ikMNVXRIgAVtln6RRhQhX1vhGi1nYrk9fPr/K4Tw2e4RzZ4PTARV4NNoXo
         OjePkQmA9q4YxA7PU0PKjuD1HyKBLDv1b8JfmXmTXYWu/3TkoQtyDQ7o128sBcsXCvzy
         tcmQyEuhsZ/qtFvpNMKxIO9GRbOHwBzeeU94wvDVjuGouBBHZ1c7406AqQg9/sNXUGLQ
         7vbDFUGp9vB3DuYZa+04GKrIVrWx1y1RbreBEHJZXSgK0HF6FPV48lacHweW+yoST+9n
         uGxQ==
X-Gm-Message-State: AJIora+AeEfzpRYYPiy31pJVKzNCnGN3jcZ7Up+JJNU8ctuRlzxf2SQN
        R2vQyp00p4bKkfHTKCzo9voCfA==
X-Google-Smtp-Source: AGRyM1sriIKotGa0j9+nlYnZgzNZEGOdT9GGzOp45hsDuhv1rC9WZ3aB4itMRBdjcJIYO3+l4vejyg==
X-Received: by 2002:a05:6808:ecf:b0:2f9:f0b1:7ee8 with SMTP id q15-20020a0568080ecf00b002f9f0b17ee8mr6034598oiv.225.1656609197132;
        Thu, 30 Jun 2022 10:13:17 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q10-20020a056830232a00b0060b1f3924c3sm11823645otg.44.2022.06.30.10.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:13:16 -0700 (PDT)
Date:   Thu, 30 Jun 2022 12:13:14 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/7] dt-bindings: clock: add QCOM SM8450 camera clock
 bindings
Message-ID: <Yr3Zqmi/rq2eKhRl@builder.lan>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
 <20220630081742.2554006-2-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630081742.2554006-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 30 Jun 03:17 CDT 2022, Vladimir Zapolskiy wrote:

> The change adds device tree bindings for camera clock controller
> found on SM8450 SoC.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
