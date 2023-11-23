Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B731BF;
	Wed, 22 Nov 2023 22:35:55 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7a93b7fedc8so18568539f.1;
        Wed, 22 Nov 2023 22:35:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700721355; x=1701326155;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ce+4H9bEhXLAwKbxsfxznX8YfGunmV/Ko5/YIxdFJas=;
        b=VJ1QauMup4lwPYljkJMVH8t4MZWPuR6IgkK9H3uwC/sV1PpcpVpgRC/advaIMLtjVo
         AE0ReyIBjKdz6ruKjuzL4V4pvaTeZcw5fSSDoKZWQLyIAPjH970rG5WsYO3bwCcbkDkj
         2n4njtvTbUdqXnzut3aAMtJH8+w4kdDHMld6JWTnO5aVoQWvX+IUlQl70io80sWaAXCA
         S8yb2MV7NEpO1Zk/v065R8METDG1EKGYj5tYQXSwm03RY1eM+HoCw1omFVfeWv7kocWI
         IJhRG6qfpHCaUZV32z/WOmvudfIGj4YR4c8V/VYKp0VbcqvYbwYHIu4YtG93AZ9VIT19
         WzSw==
X-Gm-Message-State: AOJu0YxR9PTrr1rRs5zuAdfnQle2qo5cAoPosgePZPj74hU+KXb3M+wy
	NdyIl3InuTlqkUcGQtAYDHuxyV98EA==
X-Google-Smtp-Source: AGHT+IHzgJElnkJ4rs9KOZWg+0BZW2cboxJgMn3BXtrfzRcfT3GPo06/kIiHzOnQgJ97KtoD9Fonjg==
X-Received: by 2002:a05:6602:3f0d:b0:7b3:7004:6665 with SMTP id em13-20020a0566023f0d00b007b370046665mr266758iob.20.1700721354800;
        Wed, 22 Nov 2023 22:35:54 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id dj1-20020a056602256100b007b369c7e2b6sm147268iob.52.2023.11.22.22.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 22:35:54 -0800 (PST)
Received: (nullmailer pid 4064461 invoked by uid 1000);
	Thu, 23 Nov 2023 06:35:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, michal.simek@amd.com, git@amd.com, robh+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20231123053409.10192-1-shubhrajyoti.datta@amd.com>
References: <20231123053409.10192-1-shubhrajyoti.datta@amd.com>
Message-Id: <170072135265.4064425.4703039505162229211.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: versal: Make alt_ref optional
Date: Wed, 22 Nov 2023 23:35:52 -0700


On Thu, 23 Nov 2023 11:04:09 +0530, Shubhrajyoti Datta wrote:
> The alt_ref is present only in Versal-net devices.
> Other versal devices do not have it so lets make alt_ref optional.
> Changing the order of the clock items to have the optional ones at
> the end.
> 
> Fixes: 352546805a44 ("dt-bindings: clock: Add bindings for versal clock driver")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>  .../devicetree/bindings/clock/xlnx,versal-clk.yaml | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.example.dtb: versal-firmware: clock-controller:clock-names:1: 'pl_alt_ref' was expected
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.example.dtb: versal-firmware: clock-controller:clock-names:2: 'alt_ref' was expected
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.example.dtb: clock-controller: clock-names:1: 'pl_alt_ref' was expected
	from schema $id: http://devicetree.org/schemas/clock/xlnx,versal-clk.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.example.dtb: clock-controller: clock-names:2: 'alt_ref' was expected
	from schema $id: http://devicetree.org/schemas/clock/xlnx,versal-clk.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231123053409.10192-1-shubhrajyoti.datta@amd.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

