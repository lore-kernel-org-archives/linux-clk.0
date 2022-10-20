Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC19C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 20 Oct 2022 02:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbiJTCpD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Oct 2022 22:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiJTCpC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Oct 2022 22:45:02 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63DF104D34;
        Wed, 19 Oct 2022 19:45:00 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d10so19015007pfh.6;
        Wed, 19 Oct 2022 19:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DxTNTmWj9D1rQHXlzMQFMBO3C27RqK0bb2TQ7qskUT0=;
        b=G4le0DMd/DCIBNZdMwQxOY5flpwO+b5D4PD+gYTXLe9eI3p1nEiOx5K17nYeGlknvs
         vY8FQLreZ/eNKktPjfFBDq0k9nEl72SFC8kza4Laokp93rVLrBXMRuij8bn84mtslSG/
         E5M/6M+A66K8rS58H3pfJI7s4GMh3CSf48c7VuyjgeKICQm2pd75joYaQgxEWYg8UsIv
         7NEqg5YFLXsfM4bhWbwf/pdHkITTEdWQZP8qUKhlbwPgBdTqjlJ6O3fFIL6Yl5sLMZqj
         HOyevS2TFJDyOyIzvHnsfP3mCXkC/qPs7kt9E3yHLERtw0asJH0PtT0HheYS1wdENg7W
         M8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DxTNTmWj9D1rQHXlzMQFMBO3C27RqK0bb2TQ7qskUT0=;
        b=Ik13CTxd3ORnbeJKZtDFaSM9ihLNM0g84oIc9ARaP4kjadylEV9qhSBNaFJwQn7DEa
         XrN39mXzN0GxW2csA4COK7Pe6+X64IelURw+PWK7YPQr+bHNtW3b8hJ2jZf4cy0MNg50
         RKIKB2Jqk2cSbKOD9kjr936xPaD7e9i6mr/RveqI2qxBhiYSlZrgeV2Kpc0UGvHyY8z6
         sx8msFlvK3E8pwIoypwiJhsVJE0qwdfSZSURVtv+MBpuyLA6Iy8z1tDadUSKofE4S7DE
         Sa4Ey5pT8GZ3NiDeoVDgDqjTC4aQXn7WT+3s8QQMo0FCBC8uKIOVG9LqO6ImNFefaAp5
         Vtag==
X-Gm-Message-State: ACrzQf24IvAXG2I4f4fPfoh5/vIj4mxqI2nSdyMcf0rRuK8nhGDss1dP
        Q1U3LKsN1DDR75MNYMChcZc=
X-Google-Smtp-Source: AMsMyM6UwkpmEE5y/h4FfAmmhnXDZIA3TlSD3kflBN72OO+k4Ln1lu0vuv0jLb4abMwtYBD443hHwg==
X-Received: by 2002:a05:6a00:a28:b0:567:7014:490f with SMTP id p40-20020a056a000a2800b005677014490fmr7653793pfh.10.1666233899965;
        Wed, 19 Oct 2022 19:44:59 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-92.three.co.id. [180.214.233.92])
        by smtp.gmail.com with ESMTPSA id a4-20020a170902ecc400b0017f92d7fe2csm11581423plh.288.2022.10.19.19.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 19:44:59 -0700 (PDT)
Message-ID: <12c8c3c1-eb17-8e44-8906-05e2e3e92acc@gmail.com>
Date:   Thu, 20 Oct 2022 09:44:52 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v7 0/8] phy: Add support for Lynx 10G SerDes
To:     Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org
Cc:     Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>, Li Yang <leoyang.li@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20221018231112.2142074-1-sean.anderson@seco.com>
Content-Language: en-US
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20221018231112.2142074-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/19/22 06:11, Sean Anderson wrote:
> This adds support for the Lynx 10G SerDes found on the QorIQ T-series
> and Layerscape series. Due to limited time and hardware, only support
> for the LS1046ARDB is added in this initial series. There is a sketch
> for LS1088ARDB support, but it is incomplete.
> 
> Dynamic reconfiguration does not work. That is, the configuration must
> match what is set in the RCW. From my testing, SerDes register settings
> appear identical. The issue appears to be between the PCS and the MAC.
> The link itself comes up at both ends, and a mac loopback succeeds.
> However, a PCS loopback results in dropped packets. Perhaps there is
> some undocumented register in the PCS?
> 
> I suspect this driver is around 95% complete, but, unfortunately, I no
> longer have time to investigate this further. At the very least it is
> useful for two cases:
> - Although this is untested, it should support 2.5G SGMII as well as
>   1000BASE-KX. The latter needs MAC and PCS support, but the former
>   should work out of the box.
> - It allows for clock configurations not supported by the RCW. This is
>   very useful if you want to use e.g. SRDS_PRTCL_S1=0x3333 and =0x1133
>   on the same board. This is because the former setting will use PLL1
>   as the 1G reference, but the latter will use PLL1 as the 10G
>   reference. Because we can reconfigure the PLLs, it is possible to
>   always use PLL1 as the 1G reference.
> 
> Changes in v7:
> - Use double quotes everywhere in yaml
> - Break out call order into generic documentation
> - Refuse to switch "major" protocols
> - Update Kconfig to reflect restrictions
> - Remove set/clear of "pcs reset" bit, since it doesn't seem to fix
>   anything.
> 
> Changes in v6:
> - Bump PHY_TYPE_2500BASEX to 13, since PHY_TYPE_USXGMII was added in the
>   meantime
> - fsl,type -> phy-type
> - frequence -> frequency
> - Update MAINTAINERS to include new files
> - Include bitfield.h and slab.h to allow compilation on non-arm64
>   arches.
> - Depend on COMMON_CLK and either layerscape/ppc
> - XGI.9 -> XFI.9
> 
> Changes in v5:
> - Update commit description
> - Dual id header
> - Remove references to PHY_INTERFACE_MODE_1000BASEKX to allow this
>   series to be applied directly to linux/master.
> - Add fsl,lynx-10g.h to MAINTAINERS
> 
> Changes in v4:
> - Add 2500BASE-X and 10GBASE-R phy types
> - Use subnodes to describe lane configuration, instead of describing
>   PCCRs. This is the same style used by phy-cadence-sierra et al.
> - Add ids for Lynx 10g PLLs
> - Rework all debug statements to remove use of __func__. Additional
>   information has been provided as necessary.
> - Consider alternative parent rates in round_rate and not in set_rate.
>   Trying to modify out parent's rate in set_rate will deadlock.
> - Explicitly perform a stop/reset sequence in set_rate. This way we
>   always ensure that the PLL is properly stopped.
> - Set the power-down bit when disabling the PLL. We can do this now that
>   enable/disable aren't abused during the set rate sequence.
> - Fix typos in QSGMII_OFFSET and XFI_OFFSET
> - Rename LNmTECR0_TEQ_TYPE_PRE to LNmTECR0_TEQ_TYPE_POST to better
>   reflect its function (adding post-cursor equalization).
> - Use of_clk_hw_onecell_get instead of a custom function.
> - Return struct clks from lynx_clks_init instead of embedding lynx_clk
>   in lynx_priv.
> - Rework PCCR helper functions; T-series SoCs differ from Layerscape SoCs
>   primarily in the layout and offset of the PCCRs. This will help bring a
>   cleaner abstraction layer. The caps have been removed, since this handles the
>   only current usage.
> - Convert to use new binding format. As a result of this, we no longer need to
>   have protocols for PCIe or SATA. Additionally, modes now live in lynx_group
>   instead of lynx_priv.
> - Remove teq from lynx_proto_params, since it can be determined from
>   preq_ratio/postq_ratio.
> - Fix an early return from lynx_set_mode not releasing serdes->lock.
> - Rename lynx_priv.conf to .cfg, since I kept mistyping it.
> 
> Changes in v3:
> - Manually expand yaml references
> - Add mode configuration to device tree
> - Rename remaining references to QorIQ SerDes to Lynx 10G
> - Fix PLL enable sequence by waiting for our reset request to be cleared
>   before continuing. Do the same for the lock, even though it isn't as
>   critical. Because we will delay for 1.5ms on average, use prepare
>   instead of enable so we can sleep.
> - Document the status of each protocol
> - Fix offset of several bitfields in RECR0
> - Take into account PLLRST_B, SDRST_B, and SDEN when considering whether
>   a PLL is "enabled."
> - Only power off unused lanes.
> - Split mode lane mask into first/last lane (like group)
> - Read modes from device tree
> - Use caps to determine whether KX/KR are supported
> - Move modes to lynx_priv
> - Ensure that the protocol controller is not already in-use when we try
>   to configure a new mode. This should only occur if the device tree is
>   misconfigured (e.g. when QSGMII is selected on two lanes but there is
>   only one QSGMII controller).
> - Split PLL drivers off into their own file
> - Add clock for "ext_dly" instead of writing the bit directly (and
>   racing with any clock code).
> - Use kasprintf instead of open-coding the snprintf dance
> - Support 1000BASE-KX in lynx_lookup_proto. This still requires PCS
>   support, so nothing is truly "enabled" yet.
> - Describe modes in device tree
> - ls1088a: Add serdes bindings
> 
> Changes in v2:
> - Rename to fsl,lynx-10g.yaml
> - Refer to the device in the documentation, rather than the binding
> - Move compatible first
> - Document phy cells in the description
> - Allow a value of 1 for phy-cells. This allows for compatibility with
>   the similar (but according to Ioana Ciornei different enough) lynx-28g
>   binding.
> - Remove minItems
> - Use list for clock-names
> - Fix example binding having too many cells in regs
> - Add #clock-cells. This will allow using assigned-clocks* to configure
>   the PLLs.
> - Document the structure of the compatible strings
> - Rename driver to Lynx 10G (etc.)
> - Fix not clearing group->pll after disabling it
> - Support 1 and 2 phy-cells
> - Power off lanes during probe
> - Clear SGMIIaCR1_PCS_EN during probe
> - Rename LYNX_PROTO_UNKNOWN to LYNX_PROTO_NONE
> - Handle 1000BASE-KX in lynx_proto_mode_prep
> - Use one phy cell for SerDes1, since no lanes can be grouped
> - Disable SerDes by default to prevent breaking boards inadvertently.
> 
> Sean Anderson (8):
>   dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
>   dt-bindings: phy: Add Lynx 10G phy binding
>   dt-bindings: clock: Add ids for Lynx 10g PLLs
>   phy: fsl: Add Lynx 10G SerDes driver
>   arm64: dts: ls1046a: Add serdes bindings
>   arm64: dts: ls1088a: Add serdes bindings
>   arm64: dts: ls1046ardb: Add serdes bindings
>   [WIP] arm64: dts: ls1088ardb: Add serdes bindings
> 
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml |  236 ++++
>  Documentation/driver-api/phy/index.rst        |    1 +
>  Documentation/driver-api/phy/lynx_10g.rst     |   58 +
>  MAINTAINERS                                   |    7 +
>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  112 ++
>  .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   18 +
>  .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  161 +++
>  .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   18 +
>  drivers/phy/freescale/Kconfig                 |   23 +
>  drivers/phy/freescale/Makefile                |    3 +
>  drivers/phy/freescale/lynx-10g.h              |   16 +
>  drivers/phy/freescale/phy-fsl-lynx-10g-clk.c  |  503 +++++++
>  drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1167 +++++++++++++++++
>  include/dt-bindings/clock/fsl,lynx-10g.h      |   14 +
>  include/dt-bindings/phy/phy.h                 |    2 +
>  15 files changed, 2339 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
>  create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
>  create mode 100644 drivers/phy/freescale/lynx-10g.h
>  create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
>  create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c
>  create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
> 

I can't cleanly apply this series either on arm64 tree or linux-next.
On what tree and commit the series is based on?

-- 
An old man doll... just what I always wanted! - Clara

