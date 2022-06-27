Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5880CC43334
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 20:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240893AbiF0UEM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 16:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240994AbiF0UD5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 16:03:57 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0378E1A821
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:03:55 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1048b8a38bbso14272583fac.12
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nzGLzW4ZtS4jruJMltFw2XA6BLWVzwJ4EyNXbTelzgY=;
        b=W46n2N5nMZBApIj8vLlHjyY8y5pHvjdBYst/vuLJ6sE2mEm/twshFceX/GX2LJ2EO6
         ZJg1wMNlOer2r28BRpqDp/m9acUrGJdmLSd8ZG6VW1x7yUDtmYgkuKfPVYhMbPOHOhQU
         +g2wO7u7B1msL7oiQkaYoXg5k0BRYSFj55oLVLqbuP5qF8cf4ZZu/wnC+7pBMK+m0A3o
         BXViuj4bPyhgHnmlCr/L73vdsvofW/xLDGkdcOyl5PawKk62u3Q9shQVpAwbm8koApa/
         vIO/Wjxo7G5lhUzwcZvWfeA+eHWQdZUZAlKjUUuhMxU+HUcr4Uw7wQqRM5R0IE3ctIXU
         10VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nzGLzW4ZtS4jruJMltFw2XA6BLWVzwJ4EyNXbTelzgY=;
        b=iG8JDyw/KBOSNRWNZ++8VXHnNsSnnfHUF8qZjDhm90j71cQuUkKksuWUrrrqvkpH5P
         SLy+AF+zwPpdMTAVCVQ3e8hgbVPswv0clnxNlJ+cbJsbqBQ5wTJguhJB34QDRgWh5hKs
         jMXzTQsf29AECfztHCst9G+/6ObLmIfKzBQpoSMdQEkgk5eLWWL8c+Uupf0ZPERYZU+h
         Xm3IxEJX/55Q/TespTKXU06nRorpYNSEScWFdWBa3UN4GgOSyBC0yjC7TpfO0LFUULpD
         sGN//lX1pv+idUELxdZxkJiY8JWW9U1DfOGZn766SgEehs762wRBvftW/16jbxpIon3s
         jsVQ==
X-Gm-Message-State: AJIora9nMGCCNK3qm+vlqWIYvnTktmOCgwF/h+XtUtNeY8lb/44Sdz1J
        ntmN/7keaEWI7njA5XAsBOJ/3Q==
X-Google-Smtp-Source: AGRyM1t/AoUXZf8AxsYnS9CJkUvmEW+W280zjqUJM2yNjTRfLf+/xFsMn1ZUA6a/oGOAOLqn72AcVw==
X-Received: by 2002:a05:6870:89a9:b0:101:d81d:e970 with SMTP id f41-20020a05687089a900b00101d81de970mr11368835oaq.43.1656360234143;
        Mon, 27 Jun 2022 13:03:54 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:52 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Alex Elder <elder@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        patches@lists.linux.dev, linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH] clk: qcom: rpmh: Add note about sleep/wake state for BCMs
Date:   Mon, 27 Jun 2022 15:03:06 -0500
Message-Id: <165636016348.3080661.558126370799129810.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517190949.2922197-1-swboyd@chromium.org>
References: <20220517190949.2922197-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 17 May 2022 12:09:49 -0700, Stephen Boyd wrote:
> The sleep/wake state doesn't need to be set here because of specific
> RPMh behavior that carries over the active state when sleep/wake state
> hasn't been modified. Add a note to the code so we aren't tempted to set
> the sleep/wake states.
> 
> 

Applied, thanks!

[1/1] clk: qcom: rpmh: Add note about sleep/wake state for BCMs
      commit: 29f66b625281a3026653fd33b710771a4ae394d2

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
