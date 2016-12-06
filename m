Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:16479 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751774AbcLFUkx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2016 15:40:53 -0500
Subject: Re: [PATCH 2/6] net: ethernet: ti: cpts: add support for ext rftclk
 selection
To: Richard Cochran <richardcochran@gmail.com>
References: <20161128230428.6872-1-grygorii.strashko@ti.com>
 <20161128230428.6872-3-grygorii.strashko@ti.com>
 <20161130095632.GC28680@localhost.localdomain>
 <bf207ac4-0f9f-d4a7-14ac-704d93fb7764@ti.com>
 <11994fbc-3713-6ef7-8a44-8a2442106dfc@ti.com>
 <20161206202558.GB23605@localhost.localdomain>
CC: Murali Karicheri <m-karicheri2@ti.com>,
        "David S. Miller" <davem@davemloft.net>, <netdev@vger.kernel.org>,
        Mugunthan V N <mugunthanvnm@ti.com>,
        Sekhar Nori <nsekhar@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, Wingman Kwok <w-kwok2@ti.com>,
        <linux-clk@vger.kernel.org>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <1f0c1579-7b9a-49a4-c3b4-79c40051b9fd@ti.com>
Date: Tue, 6 Dec 2016 14:40:48 -0600
MIME-Version: 1.0
In-Reply-To: <20161206202558.GB23605@localhost.localdomain>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 12/06/2016 02:25 PM, Richard Cochran wrote:
> On Tue, Dec 06, 2016 at 01:39:40PM -0600, Grygorii Strashko wrote:
>> I come with below RFC patch. if no objection I'll move forward with it.
> 
> Thanks for following through with this!
> 
> The am335x will also need the MUX in its clock tree, won't it?
> 

Not exactly. I do not see CPTS_RFTCLK_SEL register in trm, but looks like
it's already implemented in am335 clock tree:
	cpsw_cpts_rft_clk: cpsw_cpts_rft_clk@520 {
		#clock-cells = <0>;
		compatible = "ti,mux-clock";
		clocks = <&dpll_core_m5_ck>, <&dpll_core_m4_ck>;
		reg = <0x0520>;
	};

and ssigned-clock-xx can be used to change parent in board file:

&cpsw_cpts_rft_clk {
assigned-clocks = <&cpsw_cpts_rft_clk>;
assigned-clock-parents = <&dpll_core_m4_ck>;
};


-- 
regards,
-grygorii
