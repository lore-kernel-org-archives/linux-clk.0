Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A10BECAAD3
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 15:31:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbiIIPbn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 11:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbiIIPbm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 11:31:42 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35C4148581;
        Fri,  9 Sep 2022 08:31:03 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id n81so1257716iod.6;
        Fri, 09 Sep 2022 08:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=BMsXDXnB6rbxjSGAMeKPjc95lbKtMo5TmUmnHJLW8fA=;
        b=Lg0Vrvq6bF+7ogME6KjckSkWRs9j3PB0jPDjLiU63iDZb5Ly9ZAE/aMgXK6nUYevMG
         SlseT1rus8x9cbsI5TBlBYT5cizXOPQLucA0MVKejKW2l3z9RDLdkiLE6uAUamXzKUns
         7lfZytSa8bjkuNnu8g+L0hlxa8Z9aFA63FEwJ9TcO/L+Kv7roqAltZ26TK+GrgFFPZY+
         36c2wbLQqMfvSpEclXQSYRb+wTG8/O/vyAqnJ4WxT6Dckwm2kr+ZfI9EPR+UoM31UCiP
         dozocxCKPoJUCCmtdB0UoXaC6bVrLiqJLiWgRSzvYuSFBGU6eai5WMi8ZEa9b6eLwsYU
         8xWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BMsXDXnB6rbxjSGAMeKPjc95lbKtMo5TmUmnHJLW8fA=;
        b=GIDF9cilvbKN35S+yKDwofxFOULh0q5LRImb0jNAHpBZm592OBbiMvXMDWbq7Did6q
         nJxJ3QpBjBlzoDbxCJZXJNuVisgYboXEfCCG4xRfUoRwK0qjQ5T32H6HpDXWCT7cqLnY
         8OxLe2dvXZLG1BI79TGxMs/S9UeohKo7LM5XRIyvB2Ik4oS5rWoiNM7OdLbGuKwPq0nM
         F+RC3hYxw45kna05zbRNHT51kSp9cqO+JktY488MqY0iZm+FjInAGmSBcyQNQLfXuh8b
         7qzlT/HaBNrFaSWW848oC4RwQOBVMme9tSborOQgPXJgxpCgF8wmH/ITV+ykbqiHHqcH
         SzEA==
X-Gm-Message-State: ACgBeo233qBS2piKo5TKAKp0nffkoEZ5NGsKZq8pK6zNHcxTBXlbmkNs
        cVJMHVHoMXlLP+mtWbQKi1H3xrDxzgSPEyX1Mdo=
X-Google-Smtp-Source: AA6agR5tt3a+9utNDfHSqfXgogxLkOfnYwy9vsqKzh534ShZmpddBF4t4beNkFko6KZWtdlFzJyrNPzMAmb7+KCGZWA=
X-Received: by 2002:a05:6638:296:b0:34d:2221:4b69 with SMTP id
 c22-20020a056638029600b0034d22214b69mr7885085jaq.72.1662737415192; Fri, 09
 Sep 2022 08:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220909152421.278662-1-gengcixi@gmail.com>
In-Reply-To: <20220909152421.278662-1-gengcixi@gmail.com>
From:   Cixi Geng <gengcixi@gmail.com>
Date:   Fri, 9 Sep 2022 23:29:39 +0800
Message-ID: <CAF12kFtmaPpNy=J7dZUY4Q2g=wnLK=rTwcifWh+tZFr1VwzW0w@mail.gmail.com>
Subject: Re: [RESEND][PATCH V8 0/2] Add ums512 clocks and relative bindings file
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Cixi Geng <gengcixi@gmail.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=889=E6=97=A5=
=E5=91=A8=E4=BA=94 23:24=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Cixi Geng <cixi.geng1@unisoc.com>
>
> This patchset is add the UMS512 clocks support
>
> v2 changes:
>   adjust description and add the "sprd,ums512-glbregs,syscon,simple-mfd"
>   compatibles to fix match failed logs in the dt_binding_check.
>   add the property license and copyright notice.
>
> v3 changes:
>   fix wrong indentation and hint: "maxItems" is not needed with an "items=
"
>   list when use the latest dtschema.
>
> v4 changes:
>   move the syscon bindins from clk to glbreg yaml file by pickup
>   chunyan's patch for global registers bindings
>   fix the comments from Krzysztof in v3 patchset
>   add the Acked-by: Krzysztof in patch v4 3/4
>   fix the  warning Prefer "GPL" over "GPL v2"
>
> v5 changes:
>   Add review tags.
>   fix the comments in ums512-glbreg.yaml.
>
> v6 changes:
>   No more send the patch 1/4 and 3/4 in V5 for applied by Stephen
>   change GPL to GPL v2 license
>   fix the lack of space in some "{" and "}"
>   add check error for sprd_clk_regmap_init.
>
> v7 changes:
>   Resend the patchset after the cross-tree patch merged
>   use the absolute path for the mfd refs of patternProperties
>
> v8 changes:
>   add the const property for address-cells and size-cells.

Sorry, I have no idea why the v8 patchset cover-letter append this email
I have double-check the subject is v8 version.

Subject: [RESEND][PATCH V8 0/2] Add ums512 clocks and relative bindings fil=
e
Date: Fri,  9 Sep 2022 23:24:19 +0800
Message-Id: <20220909152421.278662-1-gengcixi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>
> Chunyan Zhang (1):
>   dt-bindings: mfd: sprd: Add bindings for ums512 global registers
>
> Cixi Geng (1):
>   clk: sprd: Add clocks support for UMS512
>
>  .../bindings/mfd/sprd,ums512-glbreg.yaml      |   71 +
>  drivers/clk/sprd/Kconfig                      |    6 +
>  drivers/clk/sprd/Makefile                     |    1 +
>  drivers/clk/sprd/ums512-clk.c                 | 2202 +++++++++++++++++
>  4 files changed, 2280 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/sprd,ums512-glb=
reg.yaml
>  create mode 100644 drivers/clk/sprd/ums512-clk.c
>
> --
> 2.34.1
>
