Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E2C6FC5
	for <linux-clk@vger.kernel.org>; Sat,  5 Apr 2025 00:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743813624; cv=none; b=kuUn2HG3j7ZB5Zd9jJBMoqKRuNRRJkKLiDVzQugkTIH6isbWSFagcTLVbD5JyyQDRXK5leFsU5yfXGtzwpKZ2QqBJBmcwJzCsZ/LhUtq8CmXKw/0NZZqQ137ta6m/Jw6e/WF7Nrykk+RT8aDqhco32D8i5OLb/nfcpgqLaj7RK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743813624; c=relaxed/simple;
	bh=/lGBp+3mCzEF7qqdWVEX5aRaz0EpMI4Rhto4vesOeU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzISsbT/8OxHzfATroS3VNQaOK1LFdvJ6i9YbMZ/kTOR9RE7rt4aD5NkowzxlSLGkvm9eQmjDARjjwCGTq4gxmHc/Eyw1OY0FQOUQBnGSdPp7OdeSAAJGzb8oycsEvVucp4J7IHkEQJ7neZ6qhzP7Ol2gke5npR3038uxRAOTVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=bF4SgT/r; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="bF4SgT/r"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227b650504fso25066435ad.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Apr 2025 17:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1743813622; x=1744418422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KfoL6a33lyE8RWsO9SgyVcz36aO/OVd9DKI3BuJvE6Q=;
        b=bF4SgT/rIEBNtwS0ilXlYlvl82geoLSngL/K/CcPJSuvndLVLTi56k52ujynWkTECi
         p1mA6m0wBkwGAdonrZLrVAqYM/u442muPDj4fOn9kgWK9uLBmZwVYs3K56VYB/MpRXyp
         b5SXGVE+WDxIbP7zO2ES835aOMJxE6dNABXG2IW9QDgl+jG+cNAkFomkpOj8NXeqxUDn
         hRGDJl+eXmpEqlY/NTbov+WdwnhA5p3ll5PYAZfxhOfyT+9crrAKR7kRJ+Ap40YDTFKw
         nwQ3usUMI3T7JfH+hTabNMLp6COgHaoe+qIb14ZGbv7eQRpYIRl4BgrysBTbvPuVvxrj
         QHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743813622; x=1744418422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfoL6a33lyE8RWsO9SgyVcz36aO/OVd9DKI3BuJvE6Q=;
        b=OrriLQBbAEkF6L5Qf58X4fXYz2tf+khvcRkFBvE/CctoYhkDfQgfsKXtjPZpShcHbp
         8A95gjladNVJBP4SQ7/Mrlb1RgTeQ3smMkJuzn+es8rG9ITGHR7275zXd49bEq/3iT2p
         LgK3ShpkNo8BXBHlvWfMu6pm+3HSQ9k7aYbERia873bvOjlSZQddXS08h6CuyCwEBV2e
         R0XMNyv8sOQLHqoFb9u9Dgm4xVS2ZtQZ0r+XNpMwfJbfBEPGuZBzY0oQAPj7dryQv8YF
         oRNMISVmjMvY0h8QPSq60yZEd3dzaeg6n3WbHXixBoEyGN+Jo3RfCTQHe1sD1D6RLMof
         akZg==
X-Forwarded-Encrypted: i=1; AJvYcCUnN1tDofFkFm9GWbODRlh5A6uAKGrLNL6df1ryvejFkDKrMe/K0NUWMyO0VXJSAQuVJkaOkCKznGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYmCGUVohQRtAAtfmZSf7pV47L/FkN4w7OFnKEINt70mi/y4bu
	hUPrXbaKU1w4Y+RwzQna4AlHBPVd94S1WUNqK3fGRQsbrMXS5luiZ03fO7eT1Cw=
X-Gm-Gg: ASbGnctyqJb4rDc8t5QGUOvxtx8F8q5ycubpewqDwtcyadGbkB4uPIAPnmpA1BwTnfd
	t4WY8rreoCK6Gf8xcthDEPIN47Bi3t+h5Lxs5W9DlbfqyjFVOHD36bch2SaPxOWcSjwRI7SzoPv
	rA36UuhYOpVGlBbxQ3KsK6QSoNvyngMOcRWJ/BVVWlvBoJ3xnQUOvf6Zpabs6bNzFXGrI94wEha
	qgjWmDmKYf+zqY7rdDJuz4w2RdYjEWfgTYz1rJcDDgqPuat3RlJXnnHh/nGhu78P1URSSi/9HFR
	Mrc37K93Cogrkc32XuHBYrtW
X-Google-Smtp-Source: AGHT+IFLlRqb+B8Il0xSrLbIQ8LNYlVWESSp8k1D2Bpzp3CZ/lAiYjSrvaoBZJx+MHW3Im1cvg/mxw==
X-Received: by 2002:a17:902:ec86:b0:21f:5cd8:c67 with SMTP id d9443c01a7336-22a8a080701mr71816545ad.31.1743813621742;
        Fri, 04 Apr 2025 17:40:21 -0700 (PDT)
Received: from x1 ([97.115.235.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d1be1sm4092468b3a.8.2025.04.04.17.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:40:21 -0700 (PDT)
Date: Fri, 4 Apr 2025 17:40:19 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/3] clk: thead: Add clock support for VO subsystem in
 T-HEAD TH1520 SoC
Message-ID: <Z/B78yemvvSS1oLe@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094432eucas1p112aada697802092266bc36ef863f4299@eucas1p1.samsung.com>
 <20250403094425.876981-3-m.wilczynski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403094425.876981-3-m.wilczynski@samsung.com>

On Thu, Apr 03, 2025 at 11:44:24AM +0200, Michal Wilczynski wrote:
> The T-Head TH1520 SoC integrates a variety of clocks for its subsystems,
> including the Application Processor (AP) and the Video Output (VO) [1].
> Up until now, the T-Head clock driver only supported AP clocks.
> 
> Extend the driver to provide clock functionality for the VO subsystem.
> At this stage, the focus is on implementing the VO clock gates, as these
> are currently the most relevant and required components for enabling and
> disabling the VO subsystem functionality.  Future enhancements may
> introduce additional VO-related clocks as necessary.
> 
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 196 +++++++++++++++++++++++++-----
>  1 file changed, 168 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index 4c9555fc6184..ebfb1d59401d 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -847,6 +847,67 @@ static CCU_GATE(CLK_SRAM1, sram1_clk, "sram1", axi_aclk_pd, 0x20c, BIT(3), 0);
>  static CCU_GATE(CLK_SRAM2, sram2_clk, "sram2", axi_aclk_pd, 0x20c, BIT(2), 0);
>  static CCU_GATE(CLK_SRAM3, sram3_clk, "sram3", axi_aclk_pd, 0x20c, BIT(1), 0);
>  
> +static CCU_GATE(CLK_AXI4_VO_ACLK, axi4_vo_aclk, "axi4-vo-aclk",
> +		video_pll_clk_pd, 0x0, BIT(0), 0);

Is CLKCTRL_GPU_MEM_CLK_EN (bit 2) skipped on purpose?

> +static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
> +		0x0, BIT(3), 0);
> +static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
> +		video_pll_clk_pd, 0x0, BIT(4), 0);
> +static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
> +		video_pll_clk_pd, 0x0, BIT(5), 0);
> +static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
> +		video_pll_clk_pd, 0x0, BIT(6), 0);
> +static CCU_GATE(CLK_DPU_HCLK, dpu_hclk, "dpu-hclk", video_pll_clk_pd, 0x0,
> +		BIT(7), 0);
> +static CCU_GATE(CLK_DPU_ACLK, dpu_aclk, "dpu-aclk", video_pll_clk_pd, 0x0,
> +		BIT(8), 0);
> +static CCU_GATE(CLK_DPU_CCLK, dpu_cclk, "dpu-cclk", video_pll_clk_pd, 0x0,
> +		BIT(9), 0);
> +static CCU_GATE(CLK_HDMI_SFR, hdmi_sfr_clk, "hdmi-sfr-clk", video_pll_clk_pd,
> +		0x0, BIT(10), 0);
> +static CCU_GATE(CLK_HDMI_PCLK, hdmi_pclk, "hdmi-pclk", video_pll_clk_pd, 0x0,
> +		BIT(11), 0);
> +static CCU_GATE(CLK_HDMI_CEC, hdmi_cec_clk, "hdmi-cec-clk", video_pll_clk_pd,
> +		0x0, BIT(12), 0);
> +static CCU_GATE(CLK_MIPI_DSI0_PCLK, mipi_dsi0_pclk, "mipi-dsi0-pclk",
> +		video_pll_clk_pd, 0x0, BIT(13), 0);
> +static CCU_GATE(CLK_MIPI_DSI1_PCLK, mipi_dsi1_pclk, "mipi-dsi1-pclk",
> +		video_pll_clk_pd, 0x0, BIT(14), 0);
> +static CCU_GATE(CLK_MIPI_DSI0_CFG, mipi_dsi0_cfg_clk, "mipi-dsi0-cfg-clk",
> +		video_pll_clk_pd, 0x0, BIT(15), 0);
> +static CCU_GATE(CLK_MIPI_DSI1_CFG, mipi_dsi1_cfg_clk, "mipi-dsi1-cfg-clk",
> +		video_pll_clk_pd, 0x0, BIT(16), 0);
> +static CCU_GATE(CLK_MIPI_DSI0_REFCLK, mipi_dsi0_refclk, "mipi-dsi0-refclk",
> +		video_pll_clk_pd, 0x0, BIT(17), 0);
> +static CCU_GATE(CLK_MIPI_DSI1_REFCLK, mipi_dsi1_refclk, "mipi-dsi1-refclk",
> +		video_pll_clk_pd, 0x0, BIT(18), 0);
> +static CCU_GATE(CLK_HDMI_I2S, hdmi_i2s_clk, "hdmi-i2s-clk", video_pll_clk_pd,
> +		0x0, BIT(19), 0);
> +static CCU_GATE(CLK_X2H_DPU1_ACLK, x2h_dpu1_aclk, "x2h-dpu1-aclk",
> +		video_pll_clk_pd, 0x0, BIT(20), 0);
> +static CCU_GATE(CLK_X2H_DPU_ACLK, x2h_dpu_aclk, "x2h-dpu-aclk",
> +		video_pll_clk_pd, 0x0, BIT(21), 0);
> +static CCU_GATE(CLK_AXI4_VO_PCLK, axi4_vo_pclk, "axi4-vo-pclk",
> +		video_pll_clk_pd, 0x0, BIT(22), 0);
> +static CCU_GATE(CLK_IOPMP_VOSYS_DPU_PCLK, iopmp_vosys_dpu_pclk,
> +		"iopmp-vosys-dpu-pclk", video_pll_clk_pd, 0x0, BIT(23), 0);
> +static CCU_GATE(CLK_IOPMP_VOSYS_DPU1_PCLK, iopmp_vosys_dpu1_pclk,
> +		"iopmp-vosys-dpu1-pclk", video_pll_clk_pd, 0x0, BIT(24), 0);
> +static CCU_GATE(CLK_IOPMP_VOSYS_GPU_PCLK, iopmp_vosys_gpu_pclk,
> +		"iopmp-vosys-gpu-pclk", video_pll_clk_pd, 0x0, BIT(25), 0);
> +static CCU_GATE(CLK_IOPMP_DPU1_ACLK, iopmp_dpu1_aclk, "iopmp-dpu1-aclk",
> +		video_pll_clk_pd, 0x0, BIT(27), 0);
> +static CCU_GATE(CLK_IOPMP_DPU_ACLK, iopmp_dpu_aclk, "iopmp-dpu-aclk",
> +		video_pll_clk_pd, 0x0, BIT(28), 0);
> +static CCU_GATE(CLK_IOPMP_GPU_ACLK, iopmp_gpu_aclk, "iopmp-gpu-aclk",
> +		video_pll_clk_pd, 0x0, BIT(29), 0);
> +static CCU_GATE(CLK_MIPIDSI0_PIXCLK, mipi_dsi0_pixclk, "mipi-dsi0-pixclk",
> +		video_pll_clk_pd, 0x0, BIT(30), 0);
> +static CCU_GATE(CLK_MIPIDSI1_PIXCLK, mipi_dsi1_pixclk, "mipi-dsi1-pixclk",
> +		video_pll_clk_pd, 0x0, BIT(31), 0);
> +static CCU_GATE(CLK_HDMI_PIXCLK, hdmi_pixclk, "hdmi-pixclk", video_pll_clk_pd,
> +		0x4, BIT(0), 0);

Did you intentionally skip VOSYS_DPU_CCLK_CFG.VOSYS_DPU_CCLK_CFG and
TEST_CLK_CFG.TEST_CLK_CFG as they aren't needed?


Thanks,
Drew
