Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07311C77B7D
	for <linux-clk@archiver.kernel.org>; Mon, 15 May 2023 06:23:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234659AbjEOGXE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 May 2023 02:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234111AbjEOGXD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2023 02:23:03 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4E4FC
        for <linux-clk@vger.kernel.org>; Sun, 14 May 2023 23:23:01 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50b8d2eed3dso18571361a12.0
        for <linux-clk@vger.kernel.org>; Sun, 14 May 2023 23:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684131780; x=1686723780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s7mkOa7RGOem2p2FaaquTYyaUy5EE4ipdPRCvshSlyQ=;
        b=tbnef+kOmfZW51v+VNLQOSV4rx0+Ic5xV6exhELIbvUKRc/eu3CdhPMnLF0QRpaLPR
         b6BuYGsYuiW5TaqV6sdpYB0NlKFcQBvRceEPAIL4EbxTKvmTOGod5sZoZfGlKBIN9Yag
         elk/zHRDMqYWldbnPJwKb6auScsj9622DBxQws2SXDJHDZ0E0DE8tRrZmnzGPT5po3Qh
         BnhVgwkR7uMCOvPV5D2Oy/x4yUSBVqhLtCP/KF/qJ9y3v3QUkyScOkGHg4tzM2EZIx2+
         XydmRp8rwX2xV0jKBUEyajSS2uQMQj3uHteOj9ZdDpGP1WA0kXc9KSrwZ4TBVn9Worfg
         qyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684131780; x=1686723780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7mkOa7RGOem2p2FaaquTYyaUy5EE4ipdPRCvshSlyQ=;
        b=S9EXTbuLDpXcDSyMXLdTb4FrsJjUv4TpthyVGJ8XG9Z3vtPd01Ot4wQWvxYf6pag7R
         2qF+G8o3jj6lnpE2kh1oTKVc+twHPnwp2JeKI28yvR+rIIkgS9M+BKY+jbsMWkGk6HEd
         rLOwjJpJIecqsTPL5tFzAqFyi/pB3VFziRLtDdSO4iCj16rBVdpUuTPoYRGnbuiR+St3
         U/wKIQ+ENWecEQfXVGsyZ2HRovN12lqZxhlG5+VwnbWKUXbwaCusJfzXmJQQhnDrr2eU
         /0YEZ0EHaLh5lggl2PDDGg+H5fyGHVYI49sp1aTzObpnTbiTy9TJN5vz/VR43WyQlBOI
         eL7A==
X-Gm-Message-State: AC+VfDycD1lx1OVdMLPpbGRO4STTmVLsR5WwKU8VG5PXiuYSR8h7+Plb
        9M08TwEw2fQMuUb4OUJVsCtMeQ==
X-Google-Smtp-Source: ACHHUZ493IcGLkpWFXY2aFpoX+MXDo+VhdhEdKZ5LMwrRSbVU98BaRHoVr2JBOCbMqRUPpa1vkUjYA==
X-Received: by 2002:a17:906:fd83:b0:94a:845c:3529 with SMTP id xa3-20020a170906fd8300b0094a845c3529mr27604916ejb.9.1684131779897;
        Sun, 14 May 2023 23:22:59 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id ks16-20020a170906f85000b00947740a4373sm8872377ejb.81.2023.05.14.23.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 23:22:59 -0700 (PDT)
Date:   Mon, 15 May 2023 08:22:57 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        mturquette@baylibre.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        sboyd@kernel.org, Wei Fu <wefu@redhat.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Jisheng Zhang <jszhang@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add thead th1520 clock
Message-ID: <20230515062257.zjwtbl4xjbzj7qdh@krzk-bin>
References: <20230515054402.27633-1-frank.li@vivo.com>
 <20230515054402.27633-2-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230515054402.27633-2-frank.li@vivo.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 15 May 2023 13:43:59 +0800, Yangtao Li wrote:
> Add devicetree binding document and related header file
> for the T-HEAD TH1520 clock.
> 
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Cc: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  .../bindings/clock/thead,th1520-ccu.yaml      | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml: properties:clock-names: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml: properties:clocks: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml: properties:clock-names:const: 2 is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml: properties:clocks: 'anyOf' conditional failed, one must be fixed:
		'maxItems' is a required property
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		'const' is not one of ['maxItems', 'description', 'deprecated']
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		'items' is not one of ['maxItems', 'description', 'deprecated']
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		Additional properties are not allowed ('const' was unexpected)
			hint: Arrays must be described with a combination of minItems/maxItems/items
		'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
		hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
		from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
	'const' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
	'items' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
	'type' is a required property
		hint: DT nodes ("object" type in schemas) can only use a subset of json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.example.dtb: clock-controller@ffef010000: reg: [[255, 4009820160], [0, 4096]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.example.dtb: clock-controller@ffef010000: clocks:0:0: 2 was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.example.dtb: clock-controller@ffef010000: clock-names:0: 'losc' is not of type 'array'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.example.dtb: clock-controller@ffef010000: clock-names: ['losc', 'hosc'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/thead,th1520-ccu.yaml

See https://patchwork.ozlabs.org/patch/1781099

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
