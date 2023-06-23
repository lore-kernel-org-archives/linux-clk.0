Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823A2C04A94
	for <linux-clk@archiver.kernel.org>; Fri, 23 Jun 2023 20:53:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbjFWUxB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jun 2023 16:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbjFWUwo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Jun 2023 16:52:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9642949;
        Fri, 23 Jun 2023 13:50:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0385D61B59;
        Fri, 23 Jun 2023 20:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61111C433A9;
        Fri, 23 Jun 2023 20:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687553429;
        bh=L+6CxdM/BMnLbI2k1ibKf0RAH8c1L0gztQ5UBezDVR8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HPKXO7wP6NImxUExHPqC/aWnuJX+X+Mcj6fCGvAlfYMxHpu8dwTNuk7aOhHUKJjiz
         SclNURIG8HmCfGiIQSVYerv30atjW1Jw9zveJFB45uWzbcIufe0qaJ+dpU/obrCe0e
         DCpUepkEMQLt1xE94HtKGXLX0BsSNldR32ULCVu5+Mig/G5PK459eydA4++uCojxFy
         K1zIgn8HWwnCQUhFvXS74ngs6PlxJGdVE1BHddLH+dhz59OuM1y2P31/dF056dhlCL
         H4w0PE+5KY192bKP4uis465fnDb1+akMWHWZfK+DWB/ueaJnSOQVtfOHiDpSlvmVF3
         oHYlhmlyI+P8Q==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b45bc83f26so18668131fa.0;
        Fri, 23 Jun 2023 13:50:29 -0700 (PDT)
X-Gm-Message-State: AC+VfDyK70fTMbc7keckULTmrZ7YYjVbwh4ZuCdhJo0npr2MuYCm7/M3
        /Ey2BdK2nkFaXU87hf/nGF0xTYEjPvMhWGbCsw==
X-Google-Smtp-Source: ACHHUZ7XPdbDSO6fFPttpBHgX0oes55oWKYhlTk4zfNewB0e4KNRkHMN9UPS8Te16b23/SRNpvtL8i7GZAUllnlej10=
X-Received: by 2002:a2e:9c98:0:b0:2b5:82c9:d85f with SMTP id
 x24-20020a2e9c98000000b002b582c9d85fmr6511427lji.11.1687553427421; Fri, 23
 Jun 2023 13:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230623201519.194269-1-afd@ti.com>
In-Reply-To: <20230623201519.194269-1-afd@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 23 Jun 2023 14:23:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKWUCJq8b4qfXHCiVmtZG8E8MpcTm54Q19dWr9hw8WM2g@mail.gmail.com>
Message-ID: <CAL_JsqKWUCJq8b4qfXHCiVmtZG8E8MpcTm54Q19dWr9hw8WM2g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: ti,j721e-system-controller: Remove
 syscon from example
To:     Andrew Davis <afd@ti.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jun 23, 2023 at 2:15=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> The binding for ti,am654-ehrpwm-tbclk was updated to remove the syscon
> compatible hint. Remove the same from the example in this binding.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../devicetree/bindings/mfd/ti,j721e-system-controller.yaml     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the quick fix.

Acked-by: Rob Herring <robh@kernel.org>

Stephen should apply this.

Rob
