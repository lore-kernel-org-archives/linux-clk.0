Return-Path: <SRS0=af6Y=EK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C7FC2D0A3
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 19:11:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3926F206ED
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 19:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604517109;
	bh=2P8VoNarX7PlI8e1kORbAOWQOUvDCuyv18emgxJ2kEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=aZuqfWnhIKL1ZBRebmvTMKPSizAvt98h3xkXn32s6hBfKMTsJ1bmLhofDplc82V6W
	 ADEz6gu5elQmTKCqQCOdeaO/zoWmZgtO8oqzh1pah8Ofo4aWbPXQnW642SPw1SgAIa
	 GD2sio3JKicQ9zxCqrJqy1xIll4ZLVyPPw3SMiWA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbgKDTLt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 14:11:49 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41317 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgKDTLs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Nov 2020 14:11:48 -0500
Received: by mail-oi1-f193.google.com with SMTP id m13so14240321oih.8;
        Wed, 04 Nov 2020 11:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8kvDlvfB/ougNgcIaK1HVi2RwwJqg5X8RCfCHinO1k4=;
        b=HIhqw1fKaLA2s1KepNwUJccCSrm7dZOihwrYqXEVleRI6u0GDjjw7pRVqzEWCa/d3p
         w+d5ct/P3MTH3Mz6GEhkgJQMQyzxvvJ6qKFVKYVpOzCNaZuXs3+u/GSobaQNtsfyGmVf
         DK5sR3sIr+0gzKHU250MFUmDVMTfKJxXJpXUxZCmOTdIkUZv1Sp+mXhUE/GjQSbjDKBK
         e/gJUTZLbodlXEk0T33MShkR0ANF/9t/5kDUU6GI2eg93uKCkQWeOERaSt5YbHYu7R0l
         2L/G7SkHjFof2A8ILRdpYPNmU+8QKhgRt5v9OfhV8aJlm90WXpHQEvWAF46kfJ1WIRnA
         m0QQ==
X-Gm-Message-State: AOAM530kiiwRNbcHDftD+eWQ9E+aD+hJ5W1VX9YAxSgxTE4RpOkMwF3d
        VDbB2wsgB81K3lg+4LAorA==
X-Google-Smtp-Source: ABdhPJy2VWTtxX+P4OimzsGuO4yCP41YMoUq6SSdGAKVAARpRXrNgGXvevDEeX5xh15jVWPjlr45xA==
X-Received: by 2002:aca:6185:: with SMTP id v127mr3506004oib.135.1604517107763;
        Wed, 04 Nov 2020 11:11:47 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f4sm710175oot.16.2020.11.04.11.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 11:11:47 -0800 (PST)
Received: (nullmailer pid 3967436 invoked by uid 1000);
        Wed, 04 Nov 2020 19:11:46 -0000
Date:   Wed, 4 Nov 2020 13:11:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     git@xilinx.com, mturquette@baylibre.com, sboyd@kernel.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        devel@driverdev.osuosl.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: add documentation of xilinx clocking
 wizard
Message-ID: <20201104191146.GA3967018@bogus>
References: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1604502407-14352-2-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604502407-14352-2-git-send-email-shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 04 Nov 2020 20:36:41 +0530, Shubhrajyoti Datta wrote:
> Add the devicetree binding for the xilinx clocking wizard.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v6:
> Fix a yaml warning
> v7:
> Add vendor prefix speed-grade
> 
>  .../bindings/clock/xlnx,clocking-wizard.yaml       | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml:21:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml:38:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml:40:5: [error] syntax error: expected <block end>, but found '<block mapping start>' (syntax)

dtschema/dtc warnings/errors:
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.parser.ParserError: while parsing a block mapping
  in "<unicode string>", line 20, column 3
did not find expected key
  in "<unicode string>", line 40, column 5
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.example.dts'
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1394053

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

