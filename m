Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909BFC43217
	for <linux-clk@archiver.kernel.org>; Fri, 18 Nov 2022 09:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241247AbiKRJrd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Nov 2022 04:47:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241256AbiKRJqY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Nov 2022 04:46:24 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE648FFAA
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 01:46:04 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id v28so4372321pfi.12
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 01:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VPuBk7QpwTGjZyc1/9nTkVIP5Q9YhdcXA+K9KZrkrmY=;
        b=UtQGDof7bBDHAztrqkOGkhOuyOoYom4lxvwSofr49GG85ox4N1jxBtXdwhueKLBsZF
         md3lgH2QPow60IL+THnukxXt8eb9zwDDLi2JeVrRNa7vFkTe+5OUuceX19P5yLvfi0ZA
         G6FythdyG4s72nwGJXbCUVwuhe5UZjjpo60/rmlkB2nvRysl7UjLbwBUoafqvmU+lXd3
         ruWPfnfeoaYHdu22I0XoMSTjqSN6MGlO6tEEo3aZAis+kCJgjfpOHQXwBpgjVRJm3gsp
         3aYSGAsLC/yvL+iIbNrROF7Pn8wMMHbN8bGjYaG6kqE6LVpfRtz/oXnwrmx2tIO+I8E5
         mO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPuBk7QpwTGjZyc1/9nTkVIP5Q9YhdcXA+K9KZrkrmY=;
        b=34Mb20pHWdgwtrGoVy5n3TgyQb0q6liSdqd0kQnKv7aMwPV10BJ+HkzvAy9zwRixlo
         gc4fcIvCAKdrHNybMuC8JeEwHBmEZcGE5JrYdi0dvU61I1EbFCj1/hJxN3VHiuW0xhZ9
         pEkplsjb6eRq4dfHYPS9SUG4HYTjbPGtJ7G7uiUQFBnMU4lqVHkMc7gWefFQyt+qJlvK
         tPpnDvGNm/so3/kZ6YAFSuN9q1HuQWGGX2t3sScUWFyRcztI4MyFqRtoDJuuE/R1pa37
         hOwroJjuZ7pPb74o830Gy1CznXJqJflIw9FS78Ah/sdvEi0mXszANTfJvMDhckbizI6q
         TUIA==
X-Gm-Message-State: ANoB5pkh/oM9w2xtG+4Y/rcCWALkSK0zVhSOEoTjbRBC+3T/Iio4bD6L
        pp1Jz5+Mcrmin7/QGwF/TQ3xSeekJr6ZqO8lLCdcUQ==
X-Google-Smtp-Source: AA0mqf6QIOb3Jmxesp2Fnwa9wIZIPdyJQjihp4TUuc+lz3x9Z722ORzgiY4TWwjAuu8MHj574CjcyY88WfncL2yHBZs=
X-Received: by 2002:a63:4285:0:b0:477:15c8:cd8a with SMTP id
 p127-20020a634285000000b0047715c8cd8amr4536822pga.595.1668764763969; Fri, 18
 Nov 2022 01:46:03 -0800 (PST)
MIME-Version: 1.0
References: <20221114230217.202634-1-dinguyen@kernel.org>
In-Reply-To: <20221114230217.202634-1-dinguyen@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 18 Nov 2022 10:45:27 +0100
Message-ID: <CAPDyKFq_Vu8CD6JRK_vZY8+tDQaU-uwXMY8M08Z=TF1a1rLmgQ@mail.gmail.com>
Subject: Re: [PATCHv9 1/6] dt-bindings: mmc: synopsys-dw-mshc: document "altr,sysmgr-syscon"
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     jh80.chung@samsung.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 15 Nov 2022 at 00:02, Dinh Nguyen <dinguyen@kernel.org> wrote:
>
> Document the optional "altr,sysmgr-syscon" binding that is used to
> access the System Manager register that controls the SDMMC clock
> phase.
>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>

Applied for next, thanks!

Kind regards
Uffe




> ---
> v9: remove required for "altr,sysmgr-syscon"
> v8: remove "" around synopsys-dw-mshc-common.yaml#
> v7: and "not" for the required "altr,sysmgr-syscon" binding
> v6: make "altr,sysmgr-syscon" optional
> v5: document reg shift
> v4: add else statement
> v3: document that the "altr,sysmgr-syscon" binding is only applicable to
>     "altr,socfpga-dw-mshc"
> v2: document "altr,sysmgr-syscon" in the MMC section
> ---
>  .../bindings/mmc/synopsys-dw-mshc.yaml        | 32 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml
> index ae6d6fca79e2..e1f5f26f3f1c 100644
> --- a/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml
> @@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>
>  title: Synopsys Designware Mobile Storage Host Controller Binding
>
> -allOf:
> -  - $ref: "synopsys-dw-mshc-common.yaml#"
> -
>  maintainers:
>    - Ulf Hansson <ulf.hansson@linaro.org>
>
> @@ -38,6 +35,35 @@ properties:
>        - const: biu
>        - const: ciu
>
> +  altr,sysmgr-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to the sysmgr node
> +          - description: register offset that controls the SDMMC clock phase
> +          - description: register shift for the smplsel(drive in) setting
> +    description:
> +      This property is optional. Contains the phandle to System Manager block
> +      that contains the SDMMC clock-phase control register. The first value is
> +      the pointer to the sysmgr, the 2nd value is the register offset for the
> +      SDMMC clock phase register, and the 3rd value is the bit shift for the
> +      smplsel(drive in) setting.
> +
> +allOf:
> +  - $ref: synopsys-dw-mshc-common.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: altr,socfpga-dw-mshc
> +    then:
> +      properties:
> +        altr,sysmgr-syscon: true
> +    else:
> +      properties:
> +        altr,sysmgr-syscon: false
> +
>  required:
>    - compatible
>    - reg
> --
> 2.25.1
>
