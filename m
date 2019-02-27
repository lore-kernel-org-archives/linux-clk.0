Return-Path: <SRS0=19dm=RC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7CAC43381
	for <linux-clk@archiver.kernel.org>; Wed, 27 Feb 2019 04:25:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1176921852
	for <linux-clk@archiver.kernel.org>; Wed, 27 Feb 2019 04:25:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cnICtRaJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729787AbfB0EZu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Feb 2019 23:25:50 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37032 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729778AbfB0EZt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Feb 2019 23:25:49 -0500
Received: by mail-pg1-f195.google.com with SMTP id q206so7294831pgq.4
        for <linux-clk@vger.kernel.org>; Tue, 26 Feb 2019 20:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I5kl3wf/z6YZV6cSlDS8l+q/iQTIwsK6MWTD2KZJNxI=;
        b=cnICtRaJcqkLnppggM1CuQlFonvAGbPuOsaTpry9MdLZJhf0aJPaXQJB4ftGbuYBy5
         hYBZ+FKMetizUFfJF5s97nsjB1HnTCw2Mt87ByJiWK6HDvnQUYn11JZF9aNSdqco8WUH
         6vjZBTi94DrQO8HfNRzEBY8tWIY6dmarhi794WBUMf0hh0fb47uEVte0Y9m4sK2dmLC3
         x8zgOH5bvO3NQ8/8cQBr+uxIHoZPeMXwq/BvZ9YzH20Zj40wAwAI45BEPY5v4OVVQM4W
         4H5En0lheFCPQ7z0Gd8UCZv+2lmWgmVLdI4RQ8S26jXJHaTnEWZozeaMs4M7QNn8XxOW
         923A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I5kl3wf/z6YZV6cSlDS8l+q/iQTIwsK6MWTD2KZJNxI=;
        b=PPutwsEWyVJMcrERUK+fLkkrK7Q0Fkz0nlpNijnkRRLrf3piqtwK94GcAGyFwW7JzR
         2SgZOrNBMPHQWI62i/nSdgWHmxEAbxnlHDZT+kCJSeHGhO4GHfo48F/Cq0Nj0pGLPKNZ
         30kpxYdIjyhWVkz5T9WtAcWqlbzryd6LNtaVUW7qu3PPfbNc2cRPT67U3RD0xJKGO04A
         KouCdAJANg06w+k8wcIazBeXQblAtR9HN8ZDVdA6mcIPxQ5s0jCTDTM4s5xwNh/fPKv2
         km7HqTkNoWSj6bJaSidZxXlWhtv7UncnmyymaqoHevN6k8evmJa4g+B0HND6WaSzk0lu
         9sZw==
X-Gm-Message-State: AHQUAubRHejLd5q8TH+rJCd2kBSUxlzVBkLfikgnWCIqEUxQCpSGoAOI
        bOKZrSy6tt8JAO72buQhScx9qQ==
X-Google-Smtp-Source: AHgI3IZ1RkujPNmWLPJLBk7DjTtPlbLB2lF3E0qqdsH7+rjhJRbaFd7rFJqZKaw1UVM3AJzKjk3r7g==
X-Received: by 2002:a65:5b4f:: with SMTP id y15mr1038577pgr.445.1551241548643;
        Tue, 26 Feb 2019 20:25:48 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n75sm28131460pfb.39.2019.02.26.20.25.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Feb 2019 20:25:47 -0800 (PST)
Date:   Tue, 26 Feb 2019 20:25:45 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: phy: Add binding for Qualcomm PCIe2
 PHY
Message-ID: <20190227042545.GE5511@minitux>
References: <20190219060407.15263-1-bjorn.andersson@linaro.org>
 <20190219060407.15263-3-bjorn.andersson@linaro.org>
 <20190222195758.GA26984@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190222195758.GA26984@bogus>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 22 Feb 11:57 PST 2019, Rob Herring wrote:

> On Mon, Feb 18, 2019 at 10:04:02PM -0800, Bjorn Andersson wrote:
> > The Qualcomm PCIe2 PHY is a Synopsys based PCIe PHY found in a number of
> > Qualcomm platforms, add a binding to describe this.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  .../bindings/phy/qcom-pcie2-phy.txt           | 40 +++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
> > new file mode 100644
> > index 000000000000..7da02f9d78c7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
> > @@ -0,0 +1,40 @@
> > +Qualcomm PCIe2 PHY controller
> > +=============================
> > +
> > +The Qualcomm PCIe2 PHY is a Synopsys based phy found in a number of Qualcomm
> > +platforms.
> > +
> > +Required properties:
> > + - compatible: compatible list, should be:
> > +	       "qcom,qcs404-pcie2-phy", "qcom,pcie2-phy"
> > +
> > + - reg: offset and length of the PHY register set.
> > + - #phy-cells: must be 0.
> > +
> > + - clocks: a clock-specifier pair for the "pipe" clock
> > +
> > + - vdda-vp-supply: phandle to low voltage regulator
> > + - vdda-vph-supply: phandle to high voltage regulator
> > +
> > + - resets: reset-specifier pairs for the "phy" and "pipe" resets
> > + - reset-names: list of resets, should contain:
> > +		"phy" and "pipe"
> > +
> > + - clock-output-names: name of the outgoing clock signal from the PHY PLL
> 
> Not valid to have this without '#clock-cells'.
> 

This happens to work today as we don't describe &gcc's dependency on
this, but just rely on the global clock namespace. But it should be
there, so I'll respin this.

> Though I'm confused how this and the input clock name seem to match.
> 

The PHY generates the clock we call "pcie_0_pipe_clk" which is fed into
the global clock controller (gcc), where it can be gated (and divided)
and then fed back to both the PHY and the controller as
"gcc_pcie_0_pipe_clk".


Thanks for the review Rob.

Regards,
Bjorn

> > +
> > +Example:
> > + phy@7786000 {
> > +	compatible = "qcom,qcs404-pcie2-phy", "qcom,pcie2-phy";
> > +	reg = <0x07786000 0xb8>;
> > +
> > +	clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
> > +	resets = <&gcc GCC_PCIEPHY_0_PHY_BCR>,
> > +	         <&gcc GCC_PCIE_0_PIPE_ARES>;
> > +	reset-names = "phy", "pipe";
> > +
> > +	vdda-vp-supply = <&vreg_l3_1p05>;
> > +	vdda-vph-supply = <&vreg_l5_1p8>;
> > +
> > +	clock-output-names = "pcie_0_pipe_clk";
> > +	#phy-cells = <0>;
> > + };
> > -- 
> > 2.18.0
> > 
