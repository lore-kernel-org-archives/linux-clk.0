Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C411C04EBF
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 15:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05117206B7
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 15:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="j3m/VnZP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05117206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbeLDPgE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 10:36:04 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5062 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbeLDPgD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 10:36:03 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c069ee10000>; Tue, 04 Dec 2018 07:36:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 07:36:02 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Dec 2018 07:36:02 -0800
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 15:36:02 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 1F663407B1; Tue,  4 Dec 2018 17:36:00 +0200 (EET)
Date:   Tue, 4 Dec 2018 17:36:00 +0200
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Joseph Lo <josephl@nvidia.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 03/19] dt-bindings: cpufreq: tegra124: remove
 vdd-cpu-supply from required properties
Message-ID: <20181204153600.GA26056@pdeschrijver-desktop.Nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-4-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20181204092548.3038-4-josephl@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543937761; bh=sGzrb8i7gRChGYGQN5yNmS1XhnKzAkfdiRx5WPnblqA=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=j3m/VnZPQcx2q+QDOs7rK79xv6A3NX+rBfxqsFggdnvSOwvTV5poUdDL6rBXPS+X3
         OMY6VuWgIxkMgAvaVlyDb3r4RgkiO0BXS87xCh32uAXUUVDPK4CsaE/b1UQ6ru/hrU
         QjGBh64/qJiTsZnmdCe7IejYCBIoPcEb+kszSAhj0u3s4ARb3yicrxBd7IuIgCIGf6
         GcX+WTvz1mji5fw9C4bSiRR++YFdweOm2/E4uF3WUgiovn81SE731ehEQWxDFHHCoJ
         NL2KqQbhm2Ag1kC8L0xERyiC2icrN9xulkY7G00KtOCpn4ZqFEILNBoOZSGEmywVTl
         jpL7PmIRsWudg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 04, 2018 at 05:25:32PM +0800, Joseph Lo wrote:
> The Tegra124 cpufreq driver works only with DFLL clock, which is a
> hardware-based frequency/voltage controller. The driver doesn't need to
> control the regulator itself. Hence remove that.
> 

I think this is required for DFLL controlled I2C regulators because the
regulator is queried for voltage selectors and I2C slave ID?

Peter.

> Cc: devicetree@vger.kernel.org
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  .../devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt     | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
> index b1669fbfb740..031545a29caf 100644
> --- a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
> +++ b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
> @@ -13,7 +13,6 @@ Required properties:
>    - pll_x: Fast PLL clocksource.
>    - pll_p: Auxiliary PLL used during fast PLL rate changes.
>    - dfll: Fast DFLL clocksource that also automatically scales CPU voltage.
> -- vdd-cpu-supply: Regulator for CPU voltage
>  
>  Optional properties:
>  - clock-latency: Specify the possible maximum transition latency for clock,
> @@ -37,7 +36,6 @@ cpus {
>  			 <&dfll>;
>  		clock-names = "cpu_g", "cpu_lp", "pll_x", "pll_p", "dfll";
>  		clock-latency = <300000>;
> -		vdd-cpu-supply: <&vdd_cpu>;
>  	};
>  
>  	<...>
> -- 
> 2.19.2
> 
