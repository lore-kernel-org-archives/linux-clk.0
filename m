Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9261A2;
	Mon, 27 Nov 2023 13:20:57 -0800 (PST)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-58d08497aa1so2894109eaf.0;
        Mon, 27 Nov 2023 13:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701120056; x=1701724856;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kTyGpuRf8monTMr39nvAvdHW73wZ89TRN3McibZVJu4=;
        b=gCf8OkDfh4AoMs7z/Ds11fEhY24dYrxpZkR/Hfye5pxmxmNT7PGHkIPVwCsxfP2iDt
         twf4mo+9F3+6UxL8cjH97k3imwGYyCHpKL9XUU2s/2OmRJ0lDtyRMu30WcLG/idoMbW7
         X2Te7tltz760YipZhudQsVOwb3baXqI+9FdUP32r7IoKyTpqX9FfCKhxm8McHh7gjE4M
         hhqfro3CwfGFk1C5GVcAme4QWi+KecchTvcaed1pIfZHNlPzh1P6hAuui8G5gQL26SnR
         rcKbxVtK+vM5frHxcrGRH5fEVZS1a+dZp1/XACYaPNpEnp5wLwp53OLqzdnW09bA0vRh
         cErQ==
X-Gm-Message-State: AOJu0Yw3vmFX6sf10Pet/4nLsP8q7goy9KhBLkQqMcHaHgW5YPQVqSid
	gqCKzRWdPXiCm1WNglNybpK98PLhFA==
X-Google-Smtp-Source: AGHT+IH5aq88U86E8lbR0VHkxggDYwd+qSuHkEyr+yKdh90BxhPi9eA5RDHXDqrmDuuibUUiQu1kRg==
X-Received: by 2002:a05:6820:809:b0:58d:a6ed:5601 with SMTP id bg9-20020a056820080900b0058da6ed5601mr1798385oob.1.1701120056561;
        Mon, 27 Nov 2023 13:20:56 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o15-20020a4a384f000000b0058d76e8ce0dsm610918oof.36.2023.11.27.13.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 13:20:55 -0800 (PST)
Received: (nullmailer pid 3609049 invoked by uid 1000);
	Mon, 27 Nov 2023 21:20:55 -0000
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
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, mturquette@baylibre.com, conor+dt@kernel.org, git@amd.com, linux-clk@vger.kernel.org, michal.simek@amd.com, sboyd@kernel.org
In-Reply-To: <20231127072204.25879-2-shubhrajyoti.datta@amd.com>
References: <20231127072204.25879-1-shubhrajyoti.datta@amd.com>
 <20231127072204.25879-2-shubhrajyoti.datta@amd.com>
Message-Id: <170112005500.3608964.10409860517366826170.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: versal: Make alt_ref
 optional
Date: Mon, 27 Nov 2023 15:20:55 -0600


On Mon, 27 Nov 2023 12:52:03 +0530, Shubhrajyoti Datta wrote:
> The alt_ref is present only in Versal-net devices.
> Other versal devices do not have it. Update the binding
> accordingly.
> 
> Fixes: 352546805a44 ("dt-bindings: clock: Add bindings for versal clock driver")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> 
> ---
> 
> Changes in v2:
> - Have specific constraints for versal and versal net.
> 
>  .../bindings/clock/xlnx,versal-clk.yaml       | 31 +++++++++++++++----
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.example.dtb: versal-firmware: clock-controller:clocks: [[4294967295], [4294967295], [4294967295]] is too long
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.example.dtb: versal-firmware: clock-controller:clock-names:1: 'pl_alt_ref' was expected
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.example.dtb: versal-firmware: clock-controller:clock-names: ['ref', 'alt_ref', 'pl_alt_ref'] is too long
	from schema $id: http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.example.dtb: clock-controller: clocks: [[4294967295], [4294967295], [4294967295]] is too long
	from schema $id: http://devicetree.org/schemas/clock/xlnx,versal-clk.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.example.dtb: clock-controller: clock-names:1: 'pl_alt_ref' was expected
	from schema $id: http://devicetree.org/schemas/clock/xlnx,versal-clk.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.example.dtb: clock-controller: clock-names: ['ref', 'alt_ref', 'pl_alt_ref'] is too long
	from schema $id: http://devicetree.org/schemas/clock/xlnx,versal-clk.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231127072204.25879-2-shubhrajyoti.datta@amd.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

